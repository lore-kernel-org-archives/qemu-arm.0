Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp389350lfb;
        Thu, 2 Sep 2021 08:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/hbHAAcnG0ZYOJlvOcxfRxdBw7orLJ5Y5Pq9tG1Vt7XvCQQmFtx8RB3T0OldqyDUY5BwE
X-Received: by 2002:a05:6102:3181:: with SMTP id c1mr2791898vsh.45.1630597491280;
        Thu, 02 Sep 2021 08:44:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630597491; cv=none;
        d=google.com; s=arc-20160816;
        b=X0t2trhb60PBqPLbbwcBdTH8aELCl8qiOmqPPsC25Q0Ix4yt9TgKM/FaUk/JbFA0Yh
         UtFXFKHK0YIdL1C8OWiKG3ZoWiiNaZddhyYx1x/9VcYb9AMokgFv2Pm2c2eZ4EI3x609
         LROG+am5/ooO2HqXgbwLvV9+ILwqky3Vg98w2FCq6MuChOiaqQ9hnzsPLC96UJ9sxipv
         c6Ldpcto5aTpJ6HeBBgOwArSOmSqX71/NBGf78Ogo8dergZQ9IwOiNzPCJ9AkcUW5dvg
         Y2tzULbdkvuPTO+F6iN+zvBX40gITaoHJYbBLtKvkbLgzqthMeJ/BfXZa7Fj97TxWt5k
         t9tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Q1eNU8zXLKI6/pg/slkuT4W1g0WFI5LLKLzTRYh/Kcw=;
        b=E0oBuPwaZwbNjArKxG1I16JoM1IxDfxEzwfemaZPh593Ndbs1MM8TY6tJ8EvyrUlag
         Zmiy9A/BM9BTP1r73t8m3aJRT9qp3/T0YSGApgKKHpmpmKplHkGdv9aynF2AVX3SETTv
         4spHltC9S9tC1itSyY2o926Qwnsag0XjHKk9NejWrYeOkU8h5phoMJU3zuIiV92Lvtru
         comOB2pAZyVrMzSqE1ctULPXA+Lv5CTsoLt3byv2F62TpGJwgKNIYVSQVGPBjgRbQqkI
         HxRbJMkzEyQ6NQaf130PN7xZWz0qW/6bjIk9gbJU1PATngpIOuVAVoO9lErSX7SpfKo8
         ZoZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CY1fqCw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si1080319vsc.286.2021.09.02.08.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:44:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CY1fqCw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLotW-0008M8-Hs
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLojo-0008JK-9n
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLojj-0007WL-DK
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630596881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1eNU8zXLKI6/pg/slkuT4W1g0WFI5LLKLzTRYh/Kcw=;
 b=CY1fqCw6CWwvEE4tbcJdNBfd55VGCicHLePYq2GVJo8NQEbsbkQKBQYv5vFL78g09tOI2O
 1hCPdDlZSiw+JtgkmjNjEuV2IG5mcw3zZPjfAXzIhhrRLSbfyuSeUw51MgELb10Zjj3bvp
 rwrFYxV9aN3t5fXdFB59Ef7btuWijQQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-7pkkfNmjOk2hyGl09zMscg-1; Thu, 02 Sep 2021 11:34:41 -0400
X-MC-Unique: 7pkkfNmjOk2hyGl09zMscg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5-20020a1c00050000b02902e67111d9f0so858745wma.4
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 08:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q1eNU8zXLKI6/pg/slkuT4W1g0WFI5LLKLzTRYh/Kcw=;
 b=V4jF4wmdPUBYYE5UCJSsjU3b8Yv57ZtLOlTV5ssTYl8CtOEKWrI4yBmk2v02xSC6mI
 TALsXMq3I2V603vze/Vf06r6uMH/hnmRIjwHbx4FTVuAgWxlSFBa5t7EnIvbtP3/fbI1
 lbjEabAPb1RZx7KtX13ScyXy5oG0EP668pYfgDaS8ECEdnnRA2Zhi+E80p4Hl57vlamH
 qJyylSXGMVVzOf7oQzxLsCnfn/th23T20nHZbNTqbulN1OFCtg5nDfNJvfc4Q4jDQmtD
 pvzCm0UIUqI4m8RemBXZToSXi0oUZuMz7JwFLY6z4ZRcDbKIpsF2KKrRJMSMQcQQWMf1
 C0Ug==
X-Gm-Message-State: AOAM530yQ6XGYlQFIKwXPU2N/vBMoZJpPZ7BVX9bHK+AvTLy7We970H8
 zDcjunK02wh0nagzcSTjp+A7sYf/dgFt/Bg7Epv6S4N6RQrlIF5UJ6OzofJhoxtzzOr9pG6iP7N
 0BXEwpcfIB2v6
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr3772501wmq.21.1630596879729; 
 Thu, 02 Sep 2021 08:34:39 -0700 (PDT)
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr3772487wmq.21.1630596879537; 
 Thu, 02 Sep 2021 08:34:39 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p4sm1892952wmc.11.2021.09.02.08.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 08:34:38 -0700 (PDT)
Subject: Re: [PATCH v2 27/35] acpi: arm: virt: build_dsdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-28-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <76437dba-52cb-11a6-be80-96afdd9194dc@redhat.com>
Date: Thu, 2 Sep 2021 17:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-28-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tR4LMGFKOGRp



On 7/8/21 5:46 PM, Igor Mammedov wrote:
> it replaces error-prone pointer arithmetic for build_header() API,
> with 2 calls to start and finish table creation,
> which hides offsets magic from API user.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org
> CC: drjones@redhat.com
> ---
>  hw/arm/virt-acpi-build.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index dd8011a670..d15e67a39b 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -636,10 +636,11 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      MachineState *ms = MACHINE(vms);
>      const MemMapEntry *memmap = vms->memmap;
>      const int *irqmap = vms->irqmap;
> +    AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = vms->oem_id,
> +                        .oem_table_id = vms->oem_table_id };
>  
> +    acpi_init_table(&table, table_data);
>      dsdt = init_aml_allocator();
> -    /* Reserve space for header */
> -    acpi_data_push(dsdt->buf, sizeof(AcpiTableHeader));
>  
>      /* When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
>       * While UEFI can use libfdt to disable the RTC device node in the DTB that
> @@ -686,12 +687,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      aml_append(dsdt, scope);
>  
> -    /* copy AML table into ACPI tables blob and patch header there */
> +    /* copy AML table into ACPI tables blob */
>      g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
> -    build_header(linker, table_data,
> -        (void *)(table_data->data + table_data->len - dsdt->buf->len),
> -                 "DSDT", dsdt->buf->len, 2, vms->oem_id,
> -                 vms->oem_table_id);
> +
> +    acpi_table_composed(linker, &table);
>      free_aml_allocator();
>  }
>  
> 

