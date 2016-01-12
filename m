Received: by 10.25.159.19 with SMTP id i19csp599724lfe;
        Tue, 12 Jan 2016 08:17:38 -0800 (PST)
X-Received: by 10.194.119.68 with SMTP id ks4mr138737424wjb.45.1452615457204;
        Tue, 12 Jan 2016 08:17:37 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com. [2a00:1450:400c:c09::22e])
        by mx.google.com with ESMTPS id cw5si122742361wjb.57.2016.01.12.08.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2016 08:17:37 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) client-ip=2a00:1450:400c:c09::22e;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22e.google.com with SMTP id b14so328633067wmb.1
        for <alex.bennee@linaro.org>; Tue, 12 Jan 2016 08:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=G+rYYXGMFsihNZ3Bd+Jigv4AchE7PbwTtgYxOGRtI94=;
        b=ks+wlFcKKhl/zxWte7tVhnv1hxAmRVJLWUbPDxki7sYVhxd2LP2ZRkXv8QMbZkUbav
         Wp1K5T42JYuFtadDyEa4SiVoOxA+jHnah1Yagzi87hLybdzZffROVLYkOyfs5iSQoU77
         At84hhZ7t9MFWQRsg8rEsHjyFk1nMBWR6hgMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=G+rYYXGMFsihNZ3Bd+Jigv4AchE7PbwTtgYxOGRtI94=;
        b=Epa0SXdT4DdkRrsHPhYLbZ+3KiCx9MbMOImCK68sPifNYVYQ/Q7yYZz9yJBMqoTk7C
         gbexRl4FD4B+xB43tki8lcUsI4C9cL4h9TINy1INP41LetEyci/HgkiY3r93p+hzEn6O
         N9XwEbliB7iOCyWK+4kAUhHIbvoNg6Xpm+wZ++WPvKqcRavBs1s8XgdDlDbtfOPgypRh
         UJBc8xOAVu4x1U8FSYhS0zRDC+zWVsoC6NFObxsu+1u6G6v2adWnj2/M4aiATPdq0IeT
         eBjGohgXntr7DUkUqfAyWvgpEZXKO5qd9gb+Fu2Pt0OK5N7Xpju5+OixAn4OQYUIHkbz
         6JSA==
X-Gm-Message-State: ALoCoQkbc+RaQKoeOusHPFx00QyfDtP0riyWJveOyA5FrU4hS8DA8cH/+puhOz9RSzoxNWdw5H/gDd4KzScu0esAz0jXKm7cNg==
X-Received: by 10.28.101.131 with SMTP id z125mr19820543wmb.60.1452615456865;
        Tue, 12 Jan 2016 08:17:36 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id qs1sm64483985wjc.2.2016.01.12.08.17.34
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 12 Jan 2016 08:17:35 -0800 (PST)
Subject: Re: [PATCH v4 5/8] device_tree: qemu_fdt_getprop_cell converted to
 use the error API
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
 <1452245525-3886-6-git-send-email-eric.auger@linaro.org>
 <20160112035840.GF3308@pcrost-box>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, david@gibson.dropbear.id.au,
 alex.williamson@redhat.com, alex.bennee@linaro.org, thuth@redhat.com,
 patches@linaro.org, christoffer.dall@linaro.org, pbonzini@redhat.com,
 b.reynal@virtualopensystems.com, suravee.suthikulpanit@amd.com,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56952712.8090402@linaro.org>
Date: Tue, 12 Jan 2016 17:17:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20160112035840.GF3308@pcrost-box>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: /wV395rttnev

Hi Peter,
On 01/12/2016 04:58 AM, Peter Crosthwaite wrote:
> On Fri, Jan 08, 2016 at 09:32:02AM +0000, Eric Auger wrote:
>> This patch aligns the prototype with qemu_fdt_getprop. The caller
>> can choose whether the function self-asserts on error (passing
>> &error_fatal as Error ** argument, corresponding to the legacy behavior),
>> or behaves differently such as simply output a message.
>>
>> In this later case the caller can use the new lenp parameter to interpret
>> the error if any.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>
>> ---
>>
>> v3 : creation
>> ---
>>  device_tree.c                | 21 ++++++++++++++-------
>>  hw/arm/boot.c                |  6 ++++--
>>  hw/arm/vexpress.c            |  6 ++++--
>>  include/sysemu/device_tree.h | 16 +++++++++++++++-
>>  4 files changed, 37 insertions(+), 12 deletions(-)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index 6ecc9da..0e837bf 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -338,15 +338,22 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>>  }
>>  
>>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>> -                               const char *property)
>> +                               const char *property, int *lenp, Error **errp)
>>  {
>>      int len;
>> -    const uint32_t *p = qemu_fdt_getprop(fdt, node_path, property, &len,
>> -                                         &error_fatal);
>> -    if (len != 4) {
>> -        error_report("%s: %s/%s not 4 bytes long (not a cell?)",
>> -                     __func__, node_path, property);
>> -        exit(1);
>> +    const uint32_t *p;
>> +
>> +    if (!lenp) {
>> +        lenp = &len;
>> +    }
>> +    p = qemu_fdt_getprop(fdt, node_path, property, lenp, errp);
>> +    if (!p) {
>> +        return 0;
>> +    } else if (*lenp != 4) {
>> +        error_setg(errp, "%s: %s/%s not 4 bytes long (not a cell?)",
>> +                   __func__, node_path, property);
>> +        *lenp = -EINVAL;
>> +        return 0;
>>      }
>>      return be32_to_cpu(*p);
>>  }
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 75f69bf..541b74c 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -386,8 +386,10 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>          return 0;
>>      }
>>  
>> -    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells");
>> -    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells");
>> +    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
>> +                                   NULL, &error_fatal);
>> +    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
>> +                                   NULL, &error_fatal);
>>      if (acells == 0 || scells == 0) {
>>          fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
>>          goto fail;
>> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
>> index 058abbd..ffe42be 100644
>> --- a/hw/arm/vexpress.c
>> +++ b/hw/arm/vexpress.c
>> @@ -482,8 +482,10 @@ static void vexpress_modify_dtb(const struct arm_boot_info *info, void *fdt)
>>      uint32_t acells, scells, intc;
>>      const VEDBoardInfo *daughterboard = (const VEDBoardInfo *)info;
>>  
>> -    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells");
>> -    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells");
>> +    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
>> +                                   NULL, &error_fatal);
>> +    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
>> +                                   NULL, &error_fatal);
>>      intc = find_int_controller(fdt);
>>      if (!intc) {
>>          /* Not fatal, we just won't provide virtio. This will
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index 4d7cbb9..5aa750b 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -60,8 +60,22 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>>                               const char *property, int *lenp,
>>                               Error **errp);
>> +/**
>> + * qemu_fdt_getprop_cell: retrieve the value of a given 4 byte property
>> + * @fdt: pointer to the device tree blob
>> + * @node_path: node path
>> + * @property: name of the property to find
>> + * @lenp: fdt error if any or -EINVAL if the property size is different from
>> + *        4 bytes, or 4 (expected length of the property) upon success.
>> + * @errp: handle to an error object
>> + *
>> + * returns the property value on success
>> + * in case errp is set to &error_fatal, the function auto-asserts
>> + * on error (legacy behavior)
> 
> Avoid re-documenting the semantics of the Error API, as this comment
> may silently go stale with a patch to the Error API. The function now simply
> accepts an Error ** and that implies the behaviour of error_fatal. With very
> few callers there is not much of a legacy to document and it is not a user
> visible legacy anyway.
OK I will remove that comment. Thanks for the reviews and R-b's

Best Regards

Eric
> 
> Otherwise:
> 
> Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> 
> Regards,
> Peter
> 
>> + */
>>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>> -                               const char *property);
>> +                               const char *property, int *lenp,
>> +                               Error **errp);
>>  uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>>  uint32_t qemu_fdt_alloc_phandle(void *fdt);
>>  int qemu_fdt_nop_node(void *fdt, const char *node_path);
>> -- 
>> 1.9.1
>>
