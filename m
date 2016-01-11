Received: by 10.25.134.130 with SMTP id i124csp1874755lfd;
        Mon, 11 Jan 2016 02:24:06 -0800 (PST)
X-Received: by 10.194.83.72 with SMTP id o8mr79195036wjy.46.1452507846841;
        Mon, 11 Jan 2016 02:24:06 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com. [2a00:1450:400c:c09::232])
        by mx.google.com with ESMTPS id ay10si41651460wjb.181.2016.01.11.02.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2016 02:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) client-ip=2a00:1450:400c:c09::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::232 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x232.google.com with SMTP id b14so260338290wmb.1
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2016 02:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=0R7zWo3b+v8z8zQ+iUlDlawVG2F6aOePi6V8gE9bByE=;
        b=YeJMgW7Ak6Rk+N32grUVnglwBAkzJlhJ7Qjqo3mFbcBgN4nYj4Ix7/OWLUKVkEeB+6
         zPChgnoL0sZA2ApiZ6ge8tGBWA+7u0kfHpufnfR+IMZ5f/RCRBuxhziOm90CqAx5xK7O
         ceL5eN8hYGr9bnZUx+fdAg0S+QA0cCPLgT22c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=0R7zWo3b+v8z8zQ+iUlDlawVG2F6aOePi6V8gE9bByE=;
        b=T0dFj5AWFhrgFDe8Gt0Od9GHB/EO2QhYx4mH7gdlvflqm37ubNx2Gm9762X/aIsuKZ
         bDMdUCykjpwX1QNV3PmhMahOW64TrpQBpmeORVS5SKRmXaNPGZXtHssz2RGp/XfVKigA
         JzxqO8RSPcSE4JBTR8DqeeOuSUo8B7JB4WKnUSmMdO2eqkp+W/Ti/HpiuKjaJAthdVv4
         NGOkJ43Tyt4uNQtp6FZHttFkIiVRRtz4P8/9c2nAa0IBIegohI+FoiZysthp+Ra20nGb
         W5y1AOJYk2GGs7IaZ48ypAtutr7g1r41qSDISMOxfkXMWrYuCUK4hKPQ6UziKabZhosE
         +pVQ==
X-Gm-Message-State: ALoCoQlVuLdZM97M+VgSgoTI/E8INY0fMI3+OXg/OGKATx+7/ZEqROyvJd67XF+yusYkXDVF9tbrxUdFp8W9Vmjwz7TX3Dcvhw==
X-Received: by 10.28.146.145 with SMTP id u139mr12288845wmd.81.1452507846574;
        Mon, 11 Jan 2016 02:24:06 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id 198sm12141681wml.22.2016.01.11.02.24.04
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 11 Jan 2016 02:24:05 -0800 (PST)
Subject: Re: [PATCH v2 5/7] hw/arm/sysbus-fdt: helpers for clock node
 generation
To: David Gibson <david@gibson.dropbear.id.au>
References: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
 <1452093205-30167-6-git-send-email-eric.auger@linaro.org>
 <20160111024111.GC22925@voom.redhat.com>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, alex.williamson@redhat.com,
 alex.bennee@linaro.org, thuth@redhat.com, crosthwaitepeter@gmail.com,
 patches@linaro.org, christoffer.dall@linaro.org, pbonzini@redhat.com,
 b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <569382B8.6010108@linaro.org>
Date: Mon, 11 Jan 2016 11:23:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160111024111.GC22925@voom.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: cAG1FygeFDhJ

Hi David,
On 01/11/2016 03:41 AM, David Gibson wrote:
> On Wed, Jan 06, 2016 at 03:13:23PM +0000, Eric Auger wrote:
>> Some passthrough'ed devices depend on clock nodes. Those need to be
>> generated in the guest device tree. This patch introduces some helpers
>> to build a clock node from information retrieved in the host device tree.
>>
>> - inherit_properties copies properties from a host device tree node to
>>   a guest device tree node
> 
> I dislike the name, since the first thing I think when I see "inherit"
> is that it's about a node inheriting a property from an ancestor node,
> not the guest inheriting properties from the host.  Maybe
> "passthrough_properties()"?
No Problem, I will rename the function

Best Regards

Eric

> 
>> - fdt_build_clock_node builds a guest clock node and checks the host
>>   fellow clock is a fixed one.
>>
>> fdt_build_clock_node will become static as soon as it gets used. A
>> dummy pre-declaration is needed for compilation of this patch.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>
>> ---
>>
>> v1 -> v2:
>> - inherit properties now outputs an error message in case
>>   qemu_fdt_getprop fails for an existing optional property
>> - no hardcoded fixed buffer length
>> - fdt_build_clock_node becomes void and auto-asserts on error
>> - use boolean values when defining the clock properties
>>
>> RFC -> v1:
>> - use the new proto of qemu_fdt_getprop
>> - remove newline in error_report
>> - fix some style issues
>> ---
>>  hw/arm/sysbus-fdt.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 120 insertions(+)
>>
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index 9d28797..a1cf57b 100644
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
>> @@ -56,6 +57,125 @@ typedef struct NodeCreationPair {
>>      int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
>>  } NodeCreationPair;
>>  
>> +/* helpers */
>> +
>> +typedef struct HostProperty {
>> +    const char *name;
>> +    bool optional;
>> +} HostProperty;
>> +
>> +/**
>> + * inherit_properties
>> + *
>> + * copies properties listed in an array from host device tree to
>> + * guest device tree. If a non optional property is not found, the
>> + * function self-asserts. An optional property is ignored if not found
>> + * in the host device tree.
>> + * @props: array of HostProperty to copy
>> + * @nb_props: number of properties in the array
>> + * @host_dt: host device tree blob
>> + * @guest_dt: guest device tree blob
>> + * @node_path: host dt node path where the property is supposed to be
>> +              found
>> + * @nodename: guest node name the properties should be added to
>> + */
>> +static void inherit_properties(HostProperty *props, int nb_props,
>> +                               void *host_fdt, void *guest_fdt,
>> +                               char *node_path, char *nodename)
>> +{
>> +    int i, prop_len;
>> +    const void *r;
>> +    Error *err = NULL;
>> +
>> +    for (i = 0; i < nb_props; i++) {
>> +        r = qemu_fdt_getprop(host_fdt, node_path,
>> +                             props[i].name,
>> +                             &prop_len,
>> +                             props[i].optional ? &err : &error_fatal);
>> +        if (r) {
>> +            qemu_fdt_setprop(guest_fdt, nodename,
>> +                             props[i].name, r, prop_len);
>> +        } else {
>> +            if (prop_len != -FDT_ERR_NOTFOUND) {
>> +                /* optional property not returned although property exists */
>> +                error_report_err(err);
>> +            } else {
>> +                error_free(err);
>> +            }
>> +        }
>> +    }
>> +}
>> +
>> +/* clock properties whose values are copied/pasted from host */
>> +static HostProperty clock_inherited_properties[] = {
>> +    {"compatible", false},
>> +    {"#clock-cells", false},
>> +    {"clock-frequency", true},
>> +    {"clock-output-names", true},
>> +};
>> +
>> +/**
>> + * fdt_build_clock_node
>> + *
>> + * Build a guest clock node, used as a dependency from a passthrough'ed
>> + * device. Most information are retrieved from the host clock node.
>> + * Also check the host clock is a fixed one.
>> + *
>> + * @host_fdt: host device tree blob from which info are retrieved
>> + * @guest_fdt: guest device tree blob where the clock node is added
>> + * @host_phandle: phandle of the clock in host device tree
>> + * @guest_phandle: phandle to assign to the guest node
>> + */
>> +void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>> +                         uint32_t host_phandle,
>> +                         uint32_t guest_phandle);
>> +void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>> +                         uint32_t host_phandle,
>> +                         uint32_t guest_phandle)
>> +{
>> +    char *node_path = NULL;
>> +    char *nodename;
>> +    const void *r;
>> +    int ret, node_offset, prop_len, path_len = 16;
>> +
>> +    node_offset = fdt_node_offset_by_phandle(host_fdt, host_phandle);
>> +    if (node_offset <= 0) {
>> +        error_setg(&error_fatal,
>> +                   "not able to locate clock handle %d in host device tree",
>> +                   host_phandle);
>> +    }
>> +    node_path = g_malloc(path_len);
>> +    while ((ret = fdt_get_path(host_fdt, node_offset, node_path, path_len))
>> +            == -FDT_ERR_NOSPACE) {
>> +        path_len += 16;
>> +        node_path = g_realloc(node_path, path_len);
>> +    }
>> +    if (ret < 0) {
>> +        error_setg(&error_fatal,
>> +                   "not able to retrieve node path for clock handle %d",
>> +                   host_phandle);
>> +    }
>> +
>> +    r = qemu_fdt_getprop(host_fdt, node_path, "compatible", &prop_len,
>> +                         &error_fatal);
>> +    if (strcmp(r, "fixed-clock")) {
>> +        error_setg(&error_fatal,
>> +                   "clock handle %d is not a fixed clock", host_phandle);
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
>> +    g_free(node_path);
>> +}
>> +
>>  /* Device Specific Code */
>>  
>>  /**
> 
