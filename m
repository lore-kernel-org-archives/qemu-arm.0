Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1283676njc;
        Wed, 21 May 2025 08:57:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJX9Y1+TcEZ+z1mX5wLeVofzoFuWxQGdHWX/kH5iXXR6l4JItsWD+XQ19ICRanQv/OQ6ng7Zr9BZVJGA==@linaro.org
X-Google-Smtp-Source: AGHT+IHXCo8LJ10PE/MC9d2YCFRuS7l5HvduVPaJtFXCvFIbop04kALSkElv7psO64kQx5fGRDfc
X-Received: by 2002:a05:6e02:3b89:b0:3ce:8ed9:ca94 with SMTP id e9e14a558f8ab-3db84321c68mr223728215ab.14.1747843043927;
        Wed, 21 May 2025 08:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747843043; cv=none;
        d=google.com; s=arc-20240605;
        b=UTqb378Zsv2G1Pn984+UjmT0jILOZNjTHtRMq4wXSdx7K12Qhs97HQTDFQqJ4vvkyr
         DS38BNRY38DXAXWpl3MWJma+gEopKzlvumAeJ0p8V8S6XSLFjcWf9qivB3pl6yFa0KaY
         JeYdeFjV+II4v2gpPF26qmOjxxSsGDYJ3/uwBqs29aojGekQVL8IoXCvsXIAJr5q8gZO
         4OjsW85tkj7V9MyhkR4zJBtDj9IxASGCOmnYiPLXmaWCSuo0Dx5vhhjBVEjy3Y376bGH
         B7RtzKydc1ZJS+L2vXIO+T0a8jGBKJ8ngQLVE2BAjAX6nPZgYykE3sNL7OuxcQdhMx0G
         LdLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8vWoerbe22bnbOhe9lt5fyTui5zdEqi1vksoDMG+GyA=;
        fh=TPN40GhRUyWqumDq4DMyw1MnXe4NY2Q9tX2LGd0gVhc=;
        b=Bg/Ev/3+TW51wFiG7EWvEKDAUdRzXaMxTzevTZGw9khoWfGm1MaUmLuLY+se9wfIb+
         vTKqawvSEF6VYT5+dFKsT8BBcDZtiIEsST0gyx7wM7EWDYQJNIbFEGh/veXyK0jk0xoy
         cDik42VnvBhMWJFVGUyzT8Go0EzEPJbjOq7I9sfR3AzBKahzfrJkXYjCPdskVZ2Wy//N
         D1aidrpMyb9+snUcUREaNZ7CWKz7L27HhpB2SeqEjVvKS7jeDtff7SYnlM49SfY1zYMj
         OpoJzYLPGU7zhmBBze194Yu70skxr+SXgcGPcOI7SRpvMXdQMt3UjBx1yrczl6iPiCRv
         swHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WCJwyqZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3dc747e68bcsi59753675ab.89.2025.05.21.08.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 May 2025 08:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WCJwyqZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHlod-0005ew-2G; Wed, 21 May 2025 11:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uHloa-0005SV-0R
 for qemu-arm@nongnu.org; Wed, 21 May 2025 11:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uHloX-0008KK-AW
 for qemu-arm@nongnu.org; Wed, 21 May 2025 11:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747843021;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8vWoerbe22bnbOhe9lt5fyTui5zdEqi1vksoDMG+GyA=;
 b=WCJwyqZw00cZU8hzq+MxztknHunAmD5fgpSaq3L2WJ28320qZZl1crMkgqhMON1GD5k8CO
 kP8lqlk+YPowFilhgVGltWHdK3aCe+LIqKgydhTkCcSx5KtLDwh10uDkr2DW+VvjYdv/7G
 BFxsMD7tU6iKbbyBtrTIEvh5HWtIP2E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-sJlrnfutPKOOlLBHF_JD2Q-1; Wed, 21 May 2025 11:57:00 -0400
X-MC-Unique: sJlrnfutPKOOlLBHF_JD2Q-1
X-Mimecast-MFC-AGG-ID: sJlrnfutPKOOlLBHF_JD2Q_1747843018
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43d0830c3f7so51345595e9.2
 for <qemu-arm@nongnu.org>; Wed, 21 May 2025 08:56:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747843018; x=1748447818;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8vWoerbe22bnbOhe9lt5fyTui5zdEqi1vksoDMG+GyA=;
 b=kyCIg5kqmRdGyn15qYcSdFogFA11PkhCEUa3xrz8g/WnwsWIP5QgUAr+YWjLyuBAie
 7DM/yTyyr2tIKPf1Rdv2uCruzi0nGHFKEzLDVNgqdarpzkN16qUwffgAM5gKlwyadDF0
 USnOwc/25TT2eFim431oqNGYGglbGJihGNEwbT+z3HUk5aTjNCj4zuWxTS9krBz545Si
 WXTdj0iYotfHNKdHX5m1Hgczl5Qt9gpjh4jpE3W2LImKoCl7v1NAzaVYQqgONf6tOBaz
 TbOwiZl384p2a2mu7+LEzhmw9nIExYYGd5FfTYDZ1qHk5fVwiI5Pb7dX4dziz25Ys7R3
 HcvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs+FI1KiRrJbkaHKzZPhVZOt218pFZh3v6417saYdf9hfoNuFTQBAZ4biyFP0df+C39BX0c1s73A==@nongnu.org
X-Gm-Message-State: AOJu0Yyjnuo4WY0bF1SRtYBsvi6lKwMGNsgLV/J9jZ+pINPg76R+jqiH
 Mm6J2LoKP3vh+rhMazyWZ6jgif16DNjxkAqYbV3KrwJy8w0O2DLROwRzJWC8o9+5TJ5K7Ph7ylz
 3Ylgetj+0JtF0y4WOUK49ZX0ekJHi6aBtKbcEuWcej+suwCzMGzrnXA==
X-Gm-Gg: ASbGnctz3V8rkemg4heF/Sp3Y8hnqoqoyJWkNUb7WJ5xhuMOOGRh25MhGrkQd2CZHHa
 H/UaCnIW6cS8zizQ2ud9aqkLb4J5JDaQLC53CJWt4YfFDoYp9XouBVLFwE0KNR+42vUun2naC6R
 pmkNRYGxFLcm3YRTeJAZTapvFQrYSEDZvsqjFItbFcYrJeiKQPqX1cSP0yLJ9VDSbWkSIYQ8uPj
 nZAlPWo7oS+gwD88xqOmjBpIN2j5c17sZcOJKbW8XGmTSIm9Xm/YDRBO6AwLsKhem16CITycX/T
 3PavN0FLEyCOi94p4VbU3lV04C5E5EhXsU9rnHxSQKUo1ImdanFHgWfU37c=
X-Received: by 2002:a05:600c:3f19:b0:43c:fe85:e4ba with SMTP id
 5b1f17b1804b1-442fd63c755mr239284165e9.15.1747843018121; 
 Wed, 21 May 2025 08:56:58 -0700 (PDT)
X-Received: by 2002:a05:600c:3f19:b0:43c:fe85:e4ba with SMTP id
 5b1f17b1804b1-442fd63c755mr239283755e9.15.1747843017649; 
 Wed, 21 May 2025 08:56:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f73d4b68sm75220025e9.23.2025.05.21.08.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 08:56:56 -0700 (PDT)
Message-ID: <2f1d15ea-82fe-4633-9791-ef9a3721b87d@redhat.com>
Date: Wed, 21 May 2025 17:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] hw/i386/acpi-build: Move aml_pci_edsm to a generic
 place
To: Gustavo Romero <gustavo.romero@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-15-eric.auger@redhat.com>
 <ad7c7b84-9f12-4767-a349-df47c489c726@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ad7c7b84-9f12-4767-a349-df47c489c726@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WibjcPcuKW3k5JCxyp4G8PR3IySOMo187sJoN_O3270_1747843018
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.184,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9Nqf5LXE+aut

Hi Gustavo,

On 5/21/25 5:26 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 5/14/25 14:01, Eric Auger wrote:
>> Move aml_pci_edsm to pcihp since we want to reuse that for
>> ARM and acpi-index support.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   include/hw/acpi/pcihp.h |  2 ++
>>   hw/acpi/pcihp.c         | 53 +++++++++++++++++++++++++++++++++++++++++
>>   hw/i386/acpi-build.c    | 53 -----------------------------------------
>>   3 files changed, 55 insertions(+), 53 deletions(-)
>>
>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>> index 4d820b4baf..bc31dbff39 100644
>> --- a/include/hw/acpi/pcihp.h
>> +++ b/include/hw/acpi/pcihp.h
>> @@ -82,6 +82,8 @@ bool build_append_notification_callback(Aml
>> *parent_scope, const PCIBus *bus);
>>     void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>>   +Aml *aml_pci_edsm(void);
>> +
>>   /* Called on reset */
>>   void acpi_pcihp_reset(AcpiPciHpState *s);
>>   diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index d800371ddc..57fe8938b1 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -937,6 +937,59 @@ void build_append_pci_bus_devices(Aml
>> *parent_scope, PCIBus *bus)
>>       }
>>   }
>>   +Aml *aml_pci_edsm(void)
>> +{
>> +    Aml *method, *ifctx;
>> +    Aml *zero = aml_int(0);
>> +    Aml *func = aml_arg(2);
>> +    Aml *ret = aml_local(0);
>> +    Aml *aidx = aml_local(1);
>> +    Aml *params = aml_arg(4);
>> +
>> +    method = aml_method("EDSM", 5, AML_SERIALIZED);
>> +
>> +    /* get supported functions */
>> +    ifctx = aml_if(aml_equal(func, zero));
>> +    {
>> +        /* 1: have supported functions */
>> +        /* 7: support for function 7 */
>> +        const uint8_t caps = 1 | BIT(7);
>> +        build_append_pci_dsm_func0_common(ifctx, ret);
>> +        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret,
>> zero)));
>> +        aml_append(ifctx, aml_return(ret));
>> +    }
>> +    aml_append(method, ifctx);
>> +
>> +    /* handle specific functions requests */
>> +    /*
>> +     * PCI Firmware Specification 3.1
>> +     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
>> +     *        Operating Systems
>> +     */
>> +    ifctx = aml_if(aml_equal(func, aml_int(7)));
>> +    {
>> +       Aml *pkg = aml_package(2);
>> +       aml_append(pkg, zero);
>> +       /* optional, if not impl. should return null string */
>> +       aml_append(pkg, aml_string("%s", ""));
>> +       aml_append(ifctx, aml_store(pkg, ret));
>> +
>> +       /*
>> +        * IASL is fine when initializing Package with computational
>> data,
>> +        * however it makes guest unhappy /it fails to process such
>> AML/.
>> +        * So use runtime assignment to set acpi-index after initializer
>> +        * to make OSPM happy.
>> +        */
>> +       aml_append(ifctx,
>> +           aml_store(aml_derefof(aml_index(params, aml_int(0))),
>> aidx));
>> +       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
>> +       aml_append(ifctx, aml_return(ret));
>> +    }
>> +    aml_append(method, ifctx);
>> +
>> +    return method;
>> +}
>> +
>>   const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>>       .name = "acpi_pcihp_pci_status",
>>       .version_id = 1,
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index bcfba2ccb3..385e75d061 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -322,59 +322,6 @@ build_facs(GArray *table_data)
>>       g_array_append_vals(table_data, reserved, 40); /* Reserved */
>>   }
>>   -static Aml *aml_pci_edsm(void)
>> -{
>> -    Aml *method, *ifctx;
>> -    Aml *zero = aml_int(0);
>> -    Aml *func = aml_arg(2);
>> -    Aml *ret = aml_local(0);
>> -    Aml *aidx = aml_local(1);
>> -    Aml *params = aml_arg(4);
>> -
>> -    method = aml_method("EDSM", 5, AML_SERIALIZED);
>> -
>> -    /* get supported functions */
>> -    ifctx = aml_if(aml_equal(func, zero));
>> -    {
>> -        /* 1: have supported functions */
>> -        /* 7: support for function 7 */
>> -        const uint8_t caps = 1 | BIT(7);
>> -        build_append_pci_dsm_func0_common(ifctx, ret);
>> -        aml_append(ifctx, aml_store(aml_int(caps), aml_index(ret,
>> zero)));
>> -        aml_append(ifctx, aml_return(ret));
>> -    }
>> -    aml_append(method, ifctx);
>> -
>> -    /* handle specific functions requests */
>> -    /*
>> -     * PCI Firmware Specification 3.1
>> -     * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
>> -     *        Operating Systems
>> -     */
>> -    ifctx = aml_if(aml_equal(func, aml_int(7)));
>> -    {
>> -       Aml *pkg = aml_package(2);
>> -       aml_append(pkg, zero);
>> -       /* optional, if not impl. should return null string */
>> -       aml_append(pkg, aml_string("%s", ""));
>> -       aml_append(ifctx, aml_store(pkg, ret));
>> -
>> -       /*
>> -        * IASL is fine when initializing Package with computational
>> data,
>> -        * however it makes guest unhappy /it fails to process such
>> AML/.
>> -        * So use runtime assignment to set acpi-index after initializer
>> -        * to make OSPM happy.
>> -        */
>> -       aml_append(ifctx,
>> -           aml_store(aml_derefof(aml_index(params, aml_int(0))),
>> aidx));
>> -       aml_append(ifctx, aml_store(aidx, aml_index(ret, zero)));
>> -       aml_append(ifctx, aml_return(ret));
>> -    }
>> -    aml_append(method, ifctx);
>> -
>> -    return method;
>> -}
>> -
>>   /*
>>    * build_prt - Define interrupt routing rules
>>    *
>
> EDSM is not called from anywhere. _DSM method actually calls the PDSM,
> already defined
> in pcihp.c and generated by aml_pci_pdsm(). build_acpi_pci_hotplug(),
> which calls
> aml_pci_pdsm(), properly creates the PDSM method. Then in
> build_append_pcihp_slots()
> the a _DSM is defined per slot and inside it there is a call to PDSM,
> so I understand
> we should actually stick to the PDSM in pcihp.c instead of EDSM.

I see build_append_pci_bus_devices -> aml_pci_static_endpoint_dsm
adds a _DSM method which eventually calls EDSM.

aml_pci_device_dsm builds another _DSM implementation which calls PDSM.

As we use build_append_pci_bus_devices and we are likely to have a _DSM
implementation that calls EDSM method, I think we shall have it in the
aml. What do I miss?

Thank you for the comprehensive review!

Cheers

Eric
>
> EDSM, being used in i386 code, feels a outdated PDSM, so maybe PDSM
> should be used there,
> although a different story or a clean up for later. I'm not sure what
> "static endpoint"
> means in the context of EDSM.
>
> Hence this patch can be dropped in my understanding and:
>
> aml_append(pci0_scope, aml_pci_edsm()) in 15/22 too, without any
> prejudice to the
> hotplugging and unplugging in this series.
>
>
> Cheers,
> Gustavo
>

