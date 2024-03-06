Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp357734ejb;
        Wed, 6 Mar 2024 00:12:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfF3x5MV86WL4zdJ9Dc5oNhBMI4Ymn1DJqBSq8DLdYDPf+NVWS1WRt9WJTOTT6wLgBxWTD+CnBU6meaZ+8v6qM1KSHv43s
X-Google-Smtp-Source: AGHT+IF/Dpsk9nARCRULO8/1VWoNWwEzvQMmM23oaNrHEGQO73SsC8OAAm4D69AggFlRyGiSeaRk
X-Received: by 2002:a05:620a:88c:b0:788:2c5e:3439 with SMTP id b12-20020a05620a088c00b007882c5e3439mr4193503qka.52.1709712741766;
        Wed, 06 Mar 2024 00:12:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709712741; cv=none;
        d=google.com; s=arc-20160816;
        b=U1eLRiVgPzpTjI1veGA0KcCKjdvjwDrpJWuRo1TKyBZJtyomqrZY0oDYcn99tDDoJZ
         bqFZmB2EyEB5adGxW7vhM3WutZWuIela0Hp0NY2nR2yjMmzdiURRK1KPCPUkQLfugfPk
         mmx9NAWQwdJ4ku8hE5CTBaGMeOxMOe4w60/T6cv8M1tPMJ0m5rZHS3htR0ZLvVuNyH7h
         gLtqB2GirEOJgqVa/0kBnTIfvokMD+JHLvIInjnN0Dn+7GDITz8GBbZvLS+wPny1+zgs
         gI/hzYRr9QJgBJ3gDj0DFW/as6trsXmkMs2XiRgSUoghmI240QZ43Hu2LWFPxCjv2VXn
         quQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pLVAwEcxEBBxu2flhfM3oC7axrJcqk6FEbJ62gCArig=;
        fh=B9SM+ae2J9ngjXXtmSNH4KuSJ2e7RCJ1IpKe4V/kubA=;
        b=pkYBtRsZmsXAMK5ZsKuxd/JNoAnPJfQ8TuHfGQTvimE+vmU38AQdaTrTvWX+XaX/C1
         6TmjyoXeIgsuyb9S1nAsT2k7qFXPVeOdhNsKxdDK+5oLktUAQGrXtcpA4ejWqfIap10K
         HWyTdOltx5wQ+rC7i+ETo/10NKjRLC6eFg72CDH7dwJtlkSn0IE56JuLXhqCa3GXz+p5
         fYS/c7KvOvt8rBIJqIOnSC9ulJnxoUziN1zwkuiQcrOXo4qse6eyBZvZKIIzo1USlnHP
         Rj1khwnzggA21FgXr9Kh+mvQ1iteBpSbqvCUDZ9AsnF7jZefLYFfmLcauHq+9nJusuNo
         VA3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZEuw1eO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv25-20020a05620a1b9900b0078841d5407dsi183956qkb.160.2024.03.06.00.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 00:12:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FZEuw1eO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhmNo-0005Z5-8T; Wed, 06 Mar 2024 03:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhmNl-0005Yd-Sg
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 03:12:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rhmNk-0007v7-C1
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 03:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709712726;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLVAwEcxEBBxu2flhfM3oC7axrJcqk6FEbJ62gCArig=;
 b=FZEuw1eOqJGiqEiIbLn6f/Khmc+bF9bPWAtoQx3hRrQ+PEgyCs467wXlmraj3r3Q3VQfjC
 T7FhZ7SZtxzoaYNF6hZEFPPprfx7hzuFZWRUCat4rr0kDZJwHBcqMuBAI19E7yioHABxqb
 Mr6Jr39oc/TeOd7/KsVpw+jruCe1tVQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-f7vtC8PeNaaO8hxBmK673w-1; Wed, 06 Mar 2024 03:12:03 -0500
X-MC-Unique: f7vtC8PeNaaO8hxBmK673w-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-68f7572bc3dso24766826d6.0
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 00:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709712722; x=1710317522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pLVAwEcxEBBxu2flhfM3oC7axrJcqk6FEbJ62gCArig=;
 b=xSYTWWO2rh7u+N0YjkKBvI6LDHzT209TlN97Jl/NZR2g62X8FoomXmPJkX1wdtFNkN
 RQNotnbhinSLFZnI1Zu3Mx1S5IprfXTmjyKoCPORcGFp5hTCSJ0DwR00GZRAjFDhYUWY
 KsK0MaWTP+o1uOazxYYOeLFiYpNvng2WaRXkJcTAe8u+q7tECiOyry0sa8/Tk3zdz4YM
 t+NzGIte9fbEnb/Fc4Bh6u0VgFE0wzTCaHlNrACkclq49LjLL05jU38ZZz7Wy8AX5qv8
 gre753wj1/Yao2VNbICAk/Cqnv1ZE3AtpN3W+G9wtU3HreRh0yfgMN+DAiOlVGXjWeNQ
 xkcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxXG150SMBJ0EBycesTIW/KLKH/SU1tSltxGqt7wzV48GhxFR/+pCS5SCDvNfpMjX20PwbjGw3K/Wi1ioiRirD3NqY
X-Gm-Message-State: AOJu0YxOE5hxVOI3SE0yOXUYUOgHl6webJ0E1Ql91QAyTpFEIHaoFk9p
 SHLMccgeY9s809X9iaRbhyBe3iaF30nfVFYCF4Ys3Bi9Bi8W57ot6ov7TlDzM8cB/EBk2/tKTz/
 tK6UXk1xwwgHsW7VYo+qATYbatXLFHbXJgjFstY12l7vfVJ3/2Q==
X-Received: by 2002:ac8:5701:0:b0:42e:e644:6a1b with SMTP id
 1-20020ac85701000000b0042ee6446a1bmr4635462qtw.1.1709712722534; 
 Wed, 06 Mar 2024 00:12:02 -0800 (PST)
X-Received: by 2002:ac8:5701:0:b0:42e:e644:6a1b with SMTP id
 1-20020ac85701000000b0042ee6446a1bmr4635437qtw.1.1709712722264; 
 Wed, 06 Mar 2024 00:12:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a05620a400100b007881fbfea7bsm3867890qko.24.2024.03.06.00.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 00:12:00 -0800 (PST)
Message-ID: <cc0afb73-efc5-4495-816e-a15786b7e943@redhat.com>
Date: Wed, 6 Mar 2024 09:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] hw/arm/virt: Set virtio-iommu aw-bits default
 value to 48
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "yanghliu@redhat.com"
 <yanghliu@redhat.com>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>
References: <20240305180734.48515-1-eric.auger@redhat.com>
 <20240305180734.48515-9-eric.auger@redhat.com>
 <SJ0PR11MB674472228A664E543C15CD7092212@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB674472228A664E543C15CD7092212@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cbOsNeKEEjvh



On 3/6/24 04:25, Duan, Zhenzhong wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [PATCH v6 8/9] hw/arm/virt: Set virtio-iommu aw-bits default value
>> to 48
>>
>> On ARM we set 48b as a default (matching SMMUv3 SMMU_IDR5.VAX == 0).
>>
>> hw_compat_8_2 is used to handle the compatibility for machine types
>> before 9.0 (default was 64 bits).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> hw/arm/virt.c | 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 0af1943697..dcfb25369b 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -85,11 +85,28 @@
>> #include "hw/char/pl011.h"
>> #include "qemu/guest-random.h"
>>
>> +GlobalProperty arm_virt_compat[] = {
>> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
>> +};
>> +const size_t arm_virt_compat_len = G_N_ELEMENTS(arm_virt_compat);
> This can be static, otherwise,
sure
>
> Reviewed-by: Zhenzhong Duan <Zhenzhong.duan@intel.com>
thanks!

Eric
>
> Thanks
> Zhenzhong
>
>> +
>> +/*
>> + * This cannot be called from the virt_machine_class_init() because
>> + * TYPE_VIRT_MACHINE is abstract and mc->compat_props
>> g_ptr_array_new()
>> + * only is called on virt non abstract class init.
>> + */
>> +static void arm_virt_compat_set(MachineClass *mc)
>> +{
>> +    compat_props_add(mc->compat_props, arm_virt_compat,
>> +                     arm_virt_compat_len);
>> +}
>> +
>> #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>>                                                     void *data) \
>>     { \
>>         MachineClass *mc = MACHINE_CLASS(oc); \
>> +        arm_virt_compat_set(mc); \
>>         virt_machine_##major##_##minor##_options(mc); \
>>         mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
>>         if (latest) { \
>> --
>> 2.41.0

