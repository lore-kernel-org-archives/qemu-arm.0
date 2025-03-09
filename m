Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp353135njc;
        Sat, 8 Mar 2025 16:08:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+4dHlYw2rxv20vnxB+VQpsqTEaWO/53NRbp5d8GLg4w1HW9QGr/5NfkQQLd4PvYSarXnv0Fa11aOLEg==@linaro.org
X-Google-Smtp-Source: AGHT+IHg5wG6fWK4KH/3UZZmBKklHvYZ57C20iVJ136f6yEJcxwTi35anyEju1YvSMoF/w1mTKJm
X-Received: by 2002:a05:622a:a70a:b0:476:653d:5aea with SMTP id d75a77b69052e-476653d5f09mr51346161cf.4.1741478922630;
        Sat, 08 Mar 2025 16:08:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741478922; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6c854bSSAfEeiJtxGc9DnZGXTP6gsZMTxFO4BJZ+SO8kIYV+8PMmWaramChnA0L0i
         7KlL7R0oAMcXh6UvSnNMwr/vSLj6GMaobD0fbJXYcplpIX/bk05GXMzouFC21DpAwpmp
         qb2Pr9ybiCpaiy5GJ1Q4+ruGXwMZKeYr8XsWWHs8DO67sGCRL200GiaKmgP9BNVoCObI
         OcLTWUedaQ1EZzFRxbwX+sWB+1EoOhAKelacvxrclyUD5msHltxaysNjKLojQnwjdHGH
         QC6yDSk+lpI8rJAEDJkRrqx+LSks2U6VN52VA7C7nAE4aGMayZoyWGJdTjFIEIvacX/9
         ufEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-id:mime-version
         :references:message-id:in-reply-to:subject:cc:to:from:date;
        bh=dxAyAkfmB2e7VEhPOHpbJrYheuOmlrvetC1dTLznypo=;
        fh=FcMcKsrZdu6eLGvurY9elD/xb9f1Uh8K4+/cxreiEbw=;
        b=Vdlz1d7dUskOwzDdoTzYmYhb6V3aPzVnnPGt8A8+7juofQOdzOkCRnhOC6oNpJ7jGU
         pir5G2L3E8ouYdlRZ6jo6ax9g/4U1dqFrjyqvfOZHA1mSPCKB8zOyEE49/S1UG6/YO0C
         wKvd0sK9VnaNjOh3iNMDKYGXwyIULCOhOQz8SKmY3EFckrTPp54Hvcw7m8vLpgevjib+
         DKYEZeBKiYwr2yGedXvZoPm9Hz++esvBYSUNpNYjKezdFRRNXSwVHfu8rhHveXsPtm2s
         X/xqU8EWo1zoUQf1R1BfYLbwu0dm/Q15eT7O2J0GPci/X6r0Ondqmbgqp+DS3PyFCMwC
         UGfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47676fc4d90si11155001cf.12.2025.03.08.16.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 16:08:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr4DY-0004xV-EY; Sat, 08 Mar 2025 19:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tr4DW-0004wo-1m; Sat, 08 Mar 2025 19:08:30 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tr4DT-0003ug-KM; Sat, 08 Mar 2025 19:08:29 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 902514E6019;
 Sun, 09 Mar 2025 01:08:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id VbmAVbkL4Wvx; Sun,  9 Mar 2025 01:08:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 921B34E600E; Sun, 09 Mar 2025 01:08:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8F53174577C;
 Sun, 09 Mar 2025 01:08:20 +0100 (CET)
Date: Sun, 9 Mar 2025 01:08:20 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org, 
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 03/14] hw/sd/sdhci: Introduce SDHCIClass stub
In-Reply-To: <142807a2-9536-4483-80ab-5f24793c841f@linaro.org>
Message-ID: <670a5a3c-3476-5b8d-775a-ebff83acc33d@eik.bme.hu>
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-4-philmd@linaro.org>
 <1839f9de-2370-50bd-7003-ade92707f137@eik.bme.hu>
 <142807a2-9536-4483-80ab-5f24793c841f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-506894546-1741478647=:25248"
Content-ID: <448b264e-e1d4-492e-e4e1-068729623c90@eik.bme.hu>
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8+8Sws25ikXd

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-506894546-1741478647=:25248
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <8c000124-2e48-adbe-0a7f-53e142bd2287@eik.bme.hu>

On Sun, 9 Mar 2025, Philippe Mathieu-Daudé wrote:
> On 8/3/25 23:34, BALATON Zoltan wrote:
>> On Sat, 8 Mar 2025, Philippe Mathieu-Daudé wrote:
>>> TYPE_SYSBUS_SDHCI is a bit odd because it uses an union
>>> to work with both SysBus / PCI parent. As this is not a
>>> normal use, introduce SDHCIClass in its own commit.
>>> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> include/hw/sd/sdhci.h | 9 +++++++++
>>> hw/sd/sdhci.c         | 1 +
>>> 2 files changed, 10 insertions(+)
>>> 
>>> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
>>> index 48247e9a20f..c4b20db3877 100644
>>> --- a/include/hw/sd/sdhci.h
>>> +++ b/include/hw/sd/sdhci.h
>>> @@ -107,6 +107,13 @@ struct SDHCIState {
>>> };
>>> typedef struct SDHCIState SDHCIState;
>>> 
>>> +typedef struct SDHCIClass {
>>> +    union {
>>> +        PCIDeviceClass pci_parent_class;
>>> +        SysBusDeviceClass sbd_parent_class;
>>> +    };
>>> +} SDHCIClass;
>>> +
>>> /*
>>>  * Controller does not provide transfer-complete interrupt when not
>>>  * busy.
>>> @@ -123,6 +130,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
>>> #define TYPE_SYSBUS_SDHCI "generic-sdhci"
>>> DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
>>>                          TYPE_SYSBUS_SDHCI)
>>> +DECLARE_CLASS_CHECKERS(SDHCIClass, SYSBUS_SDHCI,
>>> +                       TYPE_SYSBUS_SDHCI)
>> 
>> Are these two together just OBJECT_DECLARE_TYPE? Then the above typedefs 
>> are also not needed just the struct definitions.
>
> I'd like to but it isn't possible because the same object state/class is
> used by distinct types (PCI & SysBus).
>
> The following (expected to be correct) change ...:
> -- >8 --
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 966a1751f50..341b130995b 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -155,10 +155,6 @@ typedef struct SDHCIClass {
> #define TYPE_PCI_SDHCI "sdhci-pci"
> -DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
> -                         TYPE_PCI_SDHCI)
> +OBJECT_DECLARE_TYPE(SDHCIState, SDHCIClass, PCI_SDHCI)

It would be same as the original patch if you omit this one and only use 
OBJECT_DECLARE_TYPE below. You didn't add CLASS_CHECKER to the PCI version 
in the original patch either. But I see now it's more complex and so maybe 
it's not so easy.

> #define TYPE_SYSBUS_SDHCI "generic-sdhci"
> -DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
> -                         TYPE_SYSBUS_SDHCI)
> -DECLARE_CLASS_CHECKERS(SDHCIClass, SYSBUS_SDHCI,
> -                       TYPE_SYSBUS_SDHCI)
> +OBJECT_DECLARE_TYPE(SDHCIState, SDHCIClass, SYSBUS_SDHCI)
> ---

[...]

> Meanwhile the current legacy macros seems good enough for soft freeze ;)

Good enough for me. I was also happy with my way simpler solution. This is 
much more clean up already.

Regards,
BALATON Zoltan
--3866299591-506894546-1741478647=:25248--
