Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4833147ejc;
        Mon, 27 Feb 2023 09:03:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/jfaQ6fTU49egi0U7690lUsOoSVNLOfDMkNmvHAzkZYqdIYVgYg+iRqZw5AgxvlswbLgKP
X-Received: by 2002:a05:6214:5299:b0:56e:7bc1:69f2 with SMTP id kj25-20020a056214529900b0056e7bc169f2mr310632qvb.5.1677517399819;
        Mon, 27 Feb 2023 09:03:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677517399; cv=none;
        d=google.com; s=arc-20160816;
        b=u/vs67K+mu0spYDYEelBI9WvwnCPr2AnaHgtt2vphqHqAlVW7OVIEDGNXPPP2MWl7h
         QSfyDEzrv9/zNaXqrYWk2/r8cGctOIDfTzgUWfiAM9N2PO+uxSJ3xbGaRnCiO/b9pvwF
         7TzEJm9O6iBwlxFcy/glVjYmPlC4mdoz7QdT9TEuEncujDaQ+Rulm6w994t/R2xfBS3q
         3p5x7BHTDfvlUEmpVUzonmFqcdSzEA7r/OkKiFRuYrxLFFs5E04kkxrbE+IH19IBBefz
         L6/UFDGcwymz4pUsGOOY+WONBWY4TB5HI7MfI9oouiPhV9LI4av23PZxEyafPtKvniqz
         /Yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=dyo8PmwDQclN6NUGtDDfLJ/2UUeRZlzCnxwikLpd6ak=;
        b=CJH6n9aoam7a5PYC5Cl8sTXax4/HIi8GRONidPt8hLCMoOg232/baF0wUonn2cOlgS
         T5ziMSLz8IdohRlK6A8ZVRoBVFGeMH3/zAu678/H8mW3i3VywGvNh/GpLfpafNoZstru
         kUSdax18gVDAYh8PLgZ8MXKeqjqQYKd1wyULwb+0J/JLrV32j7GbtPwPhcWk11iBVVkS
         6gz8eFaK6j10h57StkWrY52X50S1bfZAgWxpaKjYNPNwr/db3RqDFApP4sZgt8A4OUjV
         ReywNgHs1yC2KBvXLt05jQmso2RIbQECdAQB3mLZFlgKzunNAze9VnpxuH3K0MC8hQgi
         LPJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25-20020a0cb199000000b0056e9fc0d4b9si6948605qvd.286.2023.02.27.09.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 09:03:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWgsx-0007fh-Gw; Mon, 27 Feb 2023 12:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWgsd-0007Os-Dl; Mon, 27 Feb 2023 12:01:43 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWgsb-0002b8-QQ; Mon, 27 Feb 2023 12:01:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0E9DF7457E7;
 Mon, 27 Feb 2023 18:01:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CB1C1745720; Mon, 27 Feb 2023 18:01:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C9E65745706;
 Mon, 27 Feb 2023 18:01:35 +0100 (CET)
Date: Mon, 27 Feb 2023 18:01:35 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 12/15] hw/display/sm501: Unify common QOM properties
In-Reply-To: <efb25519-b134-e8d0-14ac-58189b39103d@linaro.org>
Message-ID: <b006d7e3-22fb-54cf-d05e-45f15457032f@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-13-philmd@linaro.org>
 <efb25519-b134-e8d0-14ac-58189b39103d@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-284891471-1677517295=:35244"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0dI0wmgPLhcs

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-284891471-1677517295=:35244
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 27 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 3/2/23 15:55, Philippe Mathieu-Daudé wrote:
>> Since now PCI and SysBus properties are identical, unify them.
>> 
>> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/display/sm501.c | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>> 
>> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
>> index efebd93f1e..98375138b2 100644
>> --- a/hw/display/sm501.c
>> +++ b/hw/display/sm501.c
>> @@ -1975,7 +1975,7 @@ static void sm501_realize_sysbus(DeviceState *dev, 
>> Error **errp)
>>       /* TODO : chain irq to IRL */
>>   }
>>   -static Property sm501_sysbus_properties[] = {
>> +static Property sm501_common_properties[] = {
>>       DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>
>
>> @@ -2062,11 +2062,6 @@ static void sm501_realize_pci(PCIDevice *dev, Error 
>> **errp)
>>                        &s->state.mmio_region);
>>   }
>>   -static Property sm501_pci_properties[] = {
>> -    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),

Oops, indeed the defaults are different so maybe just drop this patch for 
now.

Regards,
BALATON Zoltan

>
> Patch is invalid:
>
> $ ./qemu-system-ppc -S -M sam460ex
> qemu-system-ppc: Invalid VRAM size, nearest valid size is 2097152
>
>> -    DEFINE_PROP_END_OF_LIST(),
>> -};
>
>
>
>
--3866299591-284891471-1677517295=:35244--
