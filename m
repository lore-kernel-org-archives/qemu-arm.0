Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1429385ejb;
        Fri, 3 Feb 2023 06:15:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/xPLnIIlhj6ZxpQTCwnFxXudC1hmDfuBuCjkTDAcKl/4G6i703klkQ/X82xbmh29S1LNXW
X-Received: by 2002:a05:622a:1003:b0:3b8:6d8d:e7b1 with SMTP id d3-20020a05622a100300b003b86d8de7b1mr16807258qte.38.1675433716487;
        Fri, 03 Feb 2023 06:15:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675433716; cv=none;
        d=google.com; s=arc-20160816;
        b=jMhSlfPGrh9j7JxZ0LN2qKIk91iZMq2l+sKQtdF1nZV7iYEj4wO1e8UGM4Q5ndM24C
         2ULfxYRkFzzew3Jyx0IK9eWC0w6CMLQmRHfv+JVA+bfpWnfaK6hQrl0mNpwoN6JWlAS8
         jnU7rap0Iyf1y83+d6O7pj1ENsLusnTTmO1TDERpd1QRv4EBCxrk/ZoDa8UwOtRrQQ7R
         it76x4hDJOx0WNuMYJJpMyEunmZ9pNPQtnojYWAjT+nrbENFNmYzjh5tymGLTwu4mb/O
         JGMQfqxtCRmPUYSZfv7MIQ41a+8BSz24g0G2ScXYI1cZ1YP6iHCgbzqYAx9By2QnxOLK
         0yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=64zldjJ2/VeYTxlVS3FHyC/vDGto68fv5bltzEwJxCI=;
        b=UTcft0YMJRWzSpLXM15DblZLRWdSIGZH8YHemi9Ya3G+Vc3yKS6offj2zvmIvaZ3ba
         qvY7gt+3WRtp9Gwx/ZsXjKDiQhJUFyYwXzYxa95ODGL+k3/oeaGjl8FqC9eFNew5LE9j
         CTy+sscnJs56lQMPIRMPIhRX8XI4XlQ5CdWeoogZUSlIp4VXPPqf9U6c22Hp/z3DfylX
         rbp1z2c7ig7VDfa3YMT7/+WpZIAZuQ7lAMUZ2WJgbUkto7B+v9pbwRG4t9MRrh6uMH5w
         RVrcOzskur21ezG+aoxIi9UrtHqoD+zKh2b+L4BFzJ3lOogDoeJrDoIfU7UtMn6tryom
         BnPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05622a165400b003b81a2a75easi1920317qtj.645.2023.02.03.06.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 06:15:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNwq8-0007hT-6x; Fri, 03 Feb 2023 09:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNwq7-0007hH-Br; Fri, 03 Feb 2023 09:14:55 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNwq5-0001mT-1Y; Fri, 03 Feb 2023 09:14:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D5D22746392;
 Fri,  3 Feb 2023 15:12:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9A854745712; Fri,  3 Feb 2023 15:12:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 98D057456E3;
 Fri,  3 Feb 2023 15:12:21 +0100 (CET)
Date: Fri, 3 Feb 2023 15:12:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 6/9] hw/display/sm501: QOM-alias 'dma-offset' property
 in chipset object
In-Reply-To: <91463ac0-f2ea-d225-30da-90efed93ac28@linaro.org>
Message-ID: <bdb1403e-d610-9755-d963-3a7864581245@eik.bme.hu>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-7-philmd@linaro.org>
 <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
 <075577d7-d5c4-393b-9d0d-2aab32abe957@linaro.org>
 <27fc6a3d-78b4-91f7-6f05-8c0cbd1ef125@eik.bme.hu>
 <91463ac0-f2ea-d225-30da-90efed93ac28@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1226957222-1675433541=:62709"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: RA9Dyz5ro6Vm

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1226957222-1675433541=:62709
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 3/2/23 14:50, BALATON Zoltan wrote:
>> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>>> On 3/2/23 14:05, BALATON Zoltan wrote:
>>>> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>>>>> No need to use an intermediate 'dma-offset' property in the
>>>>> chipset object. Alias the property, so when the machine (here
>>>>> r2d-plus) sets the value on the chipset, it is propagated to
>>>>> the OHCI object.
>>>>> 
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>> hw/display/sm501.c | 22 +++++++++++-----------
>>>>> hw/sh4/r2d.c       |  2 +-
>>>>> 2 files changed, 12 insertions(+), 12 deletions(-)
>>>> 
>>>> It does not seem to be any simpler by the number of lines but maybe a bit 
>>>> cleaner.
>>> 
>>> Well it also moves to the "Embed QOM objects" pattern which Peter prefers.
>>> Note this device doesn't implement unrealize().
>> 
>> True. Maybe worth mentioning in the commit message to make this more 
>> explicit. I saw it in the patch but did not think about that.
>> 
>>>> I wonder if it would worth renaming the property to dma-offset to match 
>>>> that of ohci so it's less confusing what it refers to. It's only used by 
>>>> r2d and this patch already changing that so would be an easy change.
>>> 
>>> We can't because TYPE_PCI_SM501 is user-creatable, so we need to
>>> go thru the whole deprecation process and we don't have any API to
>>> deprecate QOM properties yet.
>> 
>> But the sm501 PCI device only creates the display part hence it has no base 
>> option only vram-size (see sm501_pci_properties) so only the sysbus version 
>> has this property. Is this still a problem in that case?
>
> Oh you are right, I misread the PCI/sysbus functions. Lucky me, thanks!

And I've just realized then we also don't need separate 
sm501_sysbus_properties[] and sm501_pci_properties[] so you can just keep 
one and call it sm501_properties.

Regards,
BALATON Zoltan
--3866299591-1226957222-1675433541=:62709--
