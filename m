Received: by 10.182.158.201 with SMTP id ww9csp257139obb;
        Thu, 17 Dec 2015 01:27:33 -0800 (PST)
X-Received: by 10.194.114.1 with SMTP id jc1mr55322252wjb.78.1450344453779;
        Thu, 17 Dec 2015 01:27:33 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id w2si16023712wjf.153.2015.12.17.01.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2015 01:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x232.google.com with SMTP id l126so12307967wml.1
        for <alex.bennee@linaro.org>; Thu, 17 Dec 2015 01:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=8P37CjTiuvMgsr0ITubN6nRHHHfRS0ZpzHPIASex+Nk=;
        b=B9NAOgjuSerwj10IrJrmENneUn0H93OE0GJWbhIFJ6K+VNjRyCRMtNL/LW474G1o7E
         Z+0ucdO/W2Ys3N5aeTXzPKVhavQtlEqXtVa/Jqj1x19hSuOZMKvx+/Z+SDkO/dFXlj0k
         bkELoLiaHBIjYksuQS0In2qbUHyrKDu0L6wJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=8P37CjTiuvMgsr0ITubN6nRHHHfRS0ZpzHPIASex+Nk=;
        b=GExQSqRjoUqevbvlEedmo2hnq6lW4CeP9TWZd3eKzlWG9hWI17PEFYSx/chWJEclpO
         69S554m1pY3dcQfFSZJ+YdQQ4DXHRZyS5Gkx9CNeCl7txIBmVX+rd0HdlcqXhyOpooFq
         TrU3qqAHNeASgYaCsbbh6F7uF0LQLLs9RO3GHitdP11a2FFK4b+2N+RUpJ9Jzz5qPtlv
         F/ydQvwfSBAlDwjjciUXMXBcnnAl4x46zZfkBaSAj0e4Zn78t7n/WHeH9d1foYoKsRii
         IIGhaJS5/57z0yv/ifl+qlYkMXEMXR+QHJO57iZlExqLrE9rz7fcdbljzwU+R6hMPSuV
         qkHw==
X-Gm-Message-State: ALoCoQmCp6f4li+lFvaO7w5qMT9CJj02zOTM92wOPeQPjRRqS5hb8w+FSNusG52Zu16R1M0C17mQB9OYLt/SwnVq2sXVr8Awaw==
X-Received: by 10.28.137.138 with SMTP id l132mr2640941wmd.21.1450344453456;
        Thu, 17 Dec 2015 01:27:33 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id b84sm1434693wmh.15.2015.12.17.01.27.31
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 17 Dec 2015 01:27:32 -0800 (PST)
Subject: Re: [Qemu-devel] [RESEND RFC 5/6] hw/arm/sysbus-fdt: helpers for
 clock node generation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
 <1447946528-1533-6-git-send-email-eric.auger@linaro.org>
 <87wpt4bv9i.fsf@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
 patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com,
 christoffer.dall@linaro.org
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56727FDC.1040202@linaro.org>
Date: Thu, 17 Dec 2015 10:26:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87wpt4bv9i.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: /mlXydWjUmcf

Hi Alex (B),
On 11/26/2015 05:06 PM, Alex Bennée wrote:
> 
> Eric Auger <eric.auger@linaro.org> writes:
> 
>> Some passthrough'ed devices depend on clock nodes. Those need to be
>> generated in the guest device tree. This patch introduces some helpers
>> to build a clock node from information retrieved from host device tree.
>>
>> - inherit_properties copies properties from a host device tree node to
>>   a guest device tree node
>> - fdt_build_clock_node builds a guest clock node and checks the host
>>   fellow clock is a fixed one.
>>
>> fdt_build_clock_node will become static as soon as a they get used
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>> ---
>>  hw/arm/sysbus-fdt.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 110 insertions(+)
>>
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index 9d28797..22e5801 100644
>> --- a/hw/arm/sysbus-fdt.c
>> +++ b/hw/arm/sysbus-fdt.c
>> @@ -21,6 +21,7 @@
>>   *
>>   */
>>
>> +#include <libfdt.h>
>>  #include "hw/arm/sysbus-fdt.h"
>>  #include "qemu/error-report.h"
>>  #include "sysemu/device_tree.h"
>> @@ -56,6 +57,115 @@ typedef struct NodeCreationPair {
>>      int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
>>  } NodeCreationPair;
>>
>> +/* helpers */
>> +
>> +struct HostProperty {
>> +    const char *name;
>> +    bool optional;
>> +};
>> +
>> +typedef struct HostProperty HostProperty;
>> +
>> +/**
>> + * inherit_properties
>> + *
>> + * copies properties listed in an array from host device tree to
>> + * guest device tree. If a non optional property is not found, the
>> + * function exits. Not found optional ones are ignored.
>> + * props: array of HostProperty to copy
>> + * nb_props: number of properties in the array
>> + * host_dt: host device tree blob
>> + * guest_dt: guest device tree blob
>> + * node_path: host dt node path where the property is supposed to be
>> +              found
>> + * nodename: guest node name the properties should be added to
>> + *
>> + */
>> +static void inherit_properties(HostProperty *props, int nb_props,
>> +                               void *host_fdt, void *guest_fdt,
>> +                               char *node_path, char *nodename)
>> +{
>> +    int i, prop_len;
>> +    const void *r;
>> +
>> +    for (i = 0; i < nb_props; i++) {
>> +        r = qemu_fdt_getprop_optional(host_fdt, node_path,
>> +                             props[i].name,
>> +                             props[i].optional,
>> +                             &prop_len);
> 
> indentation?
> 
>> +        if (r) {
>> +            qemu_fdt_setprop(guest_fdt, nodename,
>> +                             props[i].name, r, prop_len);
>> +        }
>> +    }
>> +}
>> +
>> +/* clock properties whose values are copied/pasted from host */
>> +static HostProperty clock_inherited_properties[] = {
>> +    {"compatible", 0},
>> +    {"#clock-cells", 0},
>> +    {"clock-frequency", 1},
>> +    {"clock-output-names", 1},
>> +};
>> +
>> +/**
>> + * fdt_build_clock_node
>> + *
>> + * Build a guest clock node, used as a dependency from a passthrough'ed
>> + * device. Most information are retrieved from the host fellow node.
>> + * Also check the host clock is a fixed one.
>> + *
>> + * host_fdt: host device tree blob from which info are retrieved
>> + * guest_fdt: guest device tree blob where the clock node is added
>> + * host_phandle: phandle of the clock in host device tree
>> + * guest_phandle: phandle to assign to the guest node
>> + */
>> +int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>> +                                uint32_t host_phandle,
>> +                                uint32_t guest_phandle);
>> +int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>> +                                uint32_t host_phandle,
>> +                                uint32_t guest_phandle)
> 
> I'm seeing double here ;-)
I am coming back to you wrt this comment. This function will become
static but in that patch it is not used yet so compilation fails (the
function starts being used in next path file). That's why I did not use
the static here. Then the compiler complains the function needs to be
pre-declared. Hence the declaration here. In next patch that disappears
and becomes static. Is that acceptable? If I squash this patch in next
one, this becomes a huge one.

Best Regards

Eric
> 
>> +{
>> +    char node_path[256];
>> +    char *nodename;
>> +    const void *r;
>> +    int ret, prop_len;
>> +
>> +    ret = fdt_node_offset_by_phandle(host_fdt, host_phandle);
>> +    if (ret <= 0) {
>> +        error_report("not able to locate clock handle %d in host device tree\n",
>> +                     host_phandle);
>> +        goto out;
>> +    }
>> +    ret = fdt_get_path(host_fdt, ret, node_path, 256);
>> +    if (ret < 0) {
>> +        error_report("not able to retrieve node path for clock handle %d\n",
>> +                     host_phandle);
>> +        goto out;
>> +    }
>> +
>> +    r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len);
>> +    if (strcmp(r, "fixed-clock")) {
>> +        error_report("clock handle %d is not a fixed clock\n", host_phandle);
>> +        ret = -1;
>> +        goto out;
>> +    }
>> +
>> +    nodename = strrchr(node_path, '/');
>> +    qemu_fdt_add_subnode(guest_fdt, nodename);
>> +
>> +    inherit_properties(clock_inherited_properties,
>> +                       ARRAY_SIZE(clock_inherited_properties),
>> +                       host_fdt, guest_fdt,
>> +                       node_path, nodename);
>> +
>> +    qemu_fdt_setprop_cell(guest_fdt, nodename, "phandle", guest_phandle);
>> +
>> +out:
>> +    return ret;
>> +}
>> +
>>  /* Device Specific Code */
>>
>>  /**
> 
> 
> --
> Alex Bennée
> 
