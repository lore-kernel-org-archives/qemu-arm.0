Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x8sm2358107wmg.13.2015.12.17.05.28.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2015 05:28:18 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 09EB73E0030;
	Thu, 17 Dec 2015 13:28:18 +0000 (GMT)
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org> <1447946528-1533-6-git-send-email-eric.auger@linaro.org> <87wpt4bv9i.fsf@linaro.org> <56727FDC.1040202@linaro.org>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org, thomas.lendacky@amd.com, b.reynal@virtualopensystems.com, patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 5/6] hw/arm/sysbus-fdt: helpers for clock node generation
In-reply-to: <56727FDC.1040202@linaro.org>
Date: Thu, 17 Dec 2015 13:28:17 +0000
Message-ID: <87wpsdfbm6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: MrrF93tv9/LR


Eric Auger <eric.auger@linaro.org> writes:

> Hi Alex (B),
> On 11/26/2015 05:06 PM, Alex Bennée wrote:
>>
>> Eric Auger <eric.auger@linaro.org> writes:
>>
>>> Some passthrough'ed devices depend on clock nodes. Those need to be
>>> generated in the guest device tree. This patch introduces some helpers
>>> to build a clock node from information retrieved from host device tree.
>>>
>>> - inherit_properties copies properties from a host device tree node to
>>>   a guest device tree node
>>> - fdt_build_clock_node builds a guest clock node and checks the host
>>>   fellow clock is a fixed one.
>>>
>>> fdt_build_clock_node will become static as soon as a they get used
>>>
>>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>> ---
>>>  hw/arm/sysbus-fdt.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 110 insertions(+)
>>>
>>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>>> index 9d28797..22e5801 100644
>>> --- a/hw/arm/sysbus-fdt.c
>>> +++ b/hw/arm/sysbus-fdt.c
>>> @@ -21,6 +21,7 @@
>>>   *
>>>   */
>>>
>>> +#include <libfdt.h>
>>>  #include "hw/arm/sysbus-fdt.h"
>>>  #include "qemu/error-report.h"
>>>  #include "sysemu/device_tree.h"
>>> @@ -56,6 +57,115 @@ typedef struct NodeCreationPair {
>>>      int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
>>>  } NodeCreationPair;
>>>
>>> +/* helpers */
>>> +
>>> +struct HostProperty {
>>> +    const char *name;
>>> +    bool optional;
>>> +};
>>> +
>>> +typedef struct HostProperty HostProperty;
>>> +
>>> +/**
>>> + * inherit_properties
>>> + *
>>> + * copies properties listed in an array from host device tree to
>>> + * guest device tree. If a non optional property is not found, the
>>> + * function exits. Not found optional ones are ignored.
>>> + * props: array of HostProperty to copy
>>> + * nb_props: number of properties in the array
>>> + * host_dt: host device tree blob
>>> + * guest_dt: guest device tree blob
>>> + * node_path: host dt node path where the property is supposed to be
>>> +              found
>>> + * nodename: guest node name the properties should be added to
>>> + *
>>> + */
>>> +static void inherit_properties(HostProperty *props, int nb_props,
>>> +                               void *host_fdt, void *guest_fdt,
>>> +                               char *node_path, char *nodename)
>>> +{
>>> +    int i, prop_len;
>>> +    const void *r;
>>> +
>>> +    for (i = 0; i < nb_props; i++) {
>>> +        r = qemu_fdt_getprop_optional(host_fdt, node_path,
>>> +                             props[i].name,
>>> +                             props[i].optional,
>>> +                             &prop_len);
>>
>> indentation?
>>
>>> +        if (r) {
>>> +            qemu_fdt_setprop(guest_fdt, nodename,
>>> +                             props[i].name, r, prop_len);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +/* clock properties whose values are copied/pasted from host */
>>> +static HostProperty clock_inherited_properties[] = {
>>> +    {"compatible", 0},
>>> +    {"#clock-cells", 0},
>>> +    {"clock-frequency", 1},
>>> +    {"clock-output-names", 1},
>>> +};
>>> +
>>> +/**
>>> + * fdt_build_clock_node
>>> + *
>>> + * Build a guest clock node, used as a dependency from a passthrough'ed
>>> + * device. Most information are retrieved from the host fellow node.
>>> + * Also check the host clock is a fixed one.
>>> + *
>>> + * host_fdt: host device tree blob from which info are retrieved
>>> + * guest_fdt: guest device tree blob where the clock node is added
>>> + * host_phandle: phandle of the clock in host device tree
>>> + * guest_phandle: phandle to assign to the guest node
>>> + */
>>> +int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>>> +                                uint32_t host_phandle,
>>> +                                uint32_t guest_phandle);
>>> +int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>>> +                                uint32_t host_phandle,
>>> +                                uint32_t guest_phandle)
>>
>> I'm seeing double here ;-)
> I am coming back to you wrt this comment. This function will become
> static but in that patch it is not used yet so compilation fails (the
> function starts being used in next path file). That's why I did not use
> the static here. Then the compiler complains the function needs to be
> pre-declared. Hence the declaration here. In next patch that disappears
> and becomes static. Is that acceptable? If I squash this patch in next
> one, this becomes a huge one.

Usually I would expect to see a pre-declaration of a function at the
head of the file and only if it is used before the actual definition of
the function. It doesn't make sense to pre-declare right before the
actual function definition itself.

I'm surprised to hear the compiler complained, especially as nothing was
calling this function in this patch.

>
> Best Regards
>
> Eric
>>
>>> +{
>>> +    char node_path[256];
>>> +    char *nodename;
>>> +    const void *r;
>>> +    int ret, prop_len;
>>> +
>>> +    ret = fdt_node_offset_by_phandle(host_fdt, host_phandle);
>>> +    if (ret <= 0) {
>>> +        error_report("not able to locate clock handle %d in host device tree\n",
>>> +                     host_phandle);
>>> +        goto out;
>>> +    }
>>> +    ret = fdt_get_path(host_fdt, ret, node_path, 256);
>>> +    if (ret < 0) {
>>> +        error_report("not able to retrieve node path for clock handle %d\n",
>>> +                     host_phandle);
>>> +        goto out;
>>> +    }
>>> +
>>> +    r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len);
>>> +    if (strcmp(r, "fixed-clock")) {
>>> +        error_report("clock handle %d is not a fixed clock\n", host_phandle);
>>> +        ret = -1;
>>> +        goto out;
>>> +    }
>>> +
>>> +    nodename = strrchr(node_path, '/');
>>> +    qemu_fdt_add_subnode(guest_fdt, nodename);
>>> +
>>> +    inherit_properties(clock_inherited_properties,
>>> +                       ARRAY_SIZE(clock_inherited_properties),
>>> +                       host_fdt, guest_fdt,
>>> +                       node_path, nodename);
>>> +
>>> +    qemu_fdt_setprop_cell(guest_fdt, nodename, "phandle", guest_phandle);
>>> +
>>> +out:
>>> +    return ret;
>>> +}
>>> +
>>>  /* Device Specific Code */
>>>
>>>  /**
>>
>>
>> --
>> Alex Bennée
>>


--
Alex Bennée
