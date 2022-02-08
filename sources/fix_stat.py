import sys
from fontTools.ttLib import TTFont

supportedInstances = (
    "Thin",
    "Thin Italic",
    "ExtraLight",
    "ExtraLight Italic",
    "Light",
    "Light Italic",
    "Regular",
    "Italic",
    "Medium",
    "Medium Italic",
    "SemiBold",
    "SemiBold Italic",
    "Bold",
    "Bold Italic",
    "ExtraBold",
    "ExtraBold Italic",
    "Black",
    "Black Italic",
)

font = TTFont(sys.argv[-1])
purgatory = []
for instance in font["fvar"].instances:
    instanceName = font["name"].getName(instance.subfamilyNameID, 1, 0).toUnicode()
    if instanceName not in supportedInstances:
        purgatory.append(instance)

for purge in purgatory:
    font["fvar"].instances.remove(purge)

print(f"Purged {len(purgatory)} unsuported fvar instances from {sys.argv[-1]}")

font.save(sys.argv[-1])
