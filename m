Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1409345ejb;
        Fri, 3 Feb 2023 05:53:44 -0800 (PST)
X-Google-Smtp-Source: AK7set81vfFqQQdRR/JGZ8bJ2++IKeDAb5I7xA7PJt0tDdeKdSefb0LtlFTB5++u+OUj2u2JiA0q
X-Received: by 2002:a05:622a:1c9:b0:3ba:ef:fc0e with SMTP id t9-20020a05622a01c900b003ba00effc0emr3335829qtw.57.1675432424729;
        Fri, 03 Feb 2023 05:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675432424; cv=none;
        d=google.com; s=arc-20160816;
        b=NaSa7vBLcXWnpGPaF8Zg5i+KU+uFPQHMyzgaZx8vv+bcyvLD1IAsZs01IPHLK5KXFW
         2XRZPDyK74LeY2xeMpyT/vyT0CzLPSKU6RU4FmzPVBmyqgsjd4c2vQBT+iV6wyB9AIWv
         h4cOcMQDudq3FKRmBnvm6W1rhHstx+bgx6r5T9+SZOizlUdF32EJChpcK7sMnH/4G34x
         58ReHxYmZejGBcUel3LEjnZek+4mw9Bn5UeumL/zAewbmHAkuLCQ2B0bMFinQL7kJ6y/
         lbRJxsfeZevGpp1EQ+sR7YOIesxR/az8DHF+pJus7xBWHVvYuTOMNu9uykXsGCCgVbvk
         ac0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=FiKBmbMAJR7zyuQcLfJy7C57tVV1byxLj4Z0dt5YrX4=;
        b=YFEOfsx0mrqjs7KkmbPdVYm9j+X/2oMlF9LTteFSmfgKCfMtii7H6jrwq4O86/UR16
         y+oERLvfPf91+035bY7QQfNep3p3HtMcGHYAx9JeuT6FT/HmH8BjTg/bMd3Fd3GsNQkg
         xzhfGGXU+i4yac9JXVHgSsM3rA1FoP/ddoFHV8F4el03IyxnqteiqCHX/jqBj6ACdA2C
         ysTun4qqlUlFe3ugK66D83aR4LZHjUhJEKHNKmg6Kt5647zGuI+CgHAzOICdoSrJLkhd
         smmyErk8IrrKAQxAAvuUN7xgyLQMP+YXYbFjWdWrt1phxW7qTtvKK7TSZBKzOChswdl4
         y75A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020ac85881000000b003b645e71d97si2023306qta.287.2023.02.03.05.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 05:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNwV2-0006rY-49; Fri, 03 Feb 2023 08:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNwV0-0006qV-1F; Fri, 03 Feb 2023 08:53:06 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNwUy-0001Lp-JV; Fri, 03 Feb 2023 08:53:05 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D308D746392;
 Fri,  3 Feb 2023 14:50:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 98896746377; Fri,  3 Feb 2023 14:50:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 96D8F7456E3;
 Fri,  3 Feb 2023 14:50:33 +0100 (CET)
Date: Fri, 3 Feb 2023 14:50:33 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 6/9] hw/display/sm501: QOM-alias 'dma-offset' property
 in chipset object
In-Reply-To: <075577d7-d5c4-393b-9d0d-2aab32abe957@linaro.org>
Message-ID: <27fc6a3d-78b4-91f7-6f05-8c0cbd1ef125@eik.bme.hu>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-7-philmd@linaro.org>
 <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
 <075577d7-d5c4-393b-9d0d-2aab32abe957@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-185547500-1675432233=:62709"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c8D8fklQnWHd

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-185547500-1675432233=:62709
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 3/2/23 14:05, BALATON Zoltan wrote:
>> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>>> No need to use an intermediate 'dma-offset' property in the
>>> chipset object. Alias the property, so when the machine (here
>>> r2d-plus) sets the value on the chipset, it is propagated to
>>> the OHCI object.
>>> 
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> hw/display/sm501.c | 22 +++++++++++-----------
>>> hw/sh4/r2d.c       |  2 +-
>>> 2 files changed, 12 insertions(+), 12 deletions(-)
>> 
>> It does not seem to be any simpler by the number of lines but maybe a bit 
>> cleaner.
>
> Well it also moves to the "Embed QOM objects" pattern which Peter prefers.
> Note this device doesn't implement unrealize().

True. Maybe worth mentioning in the commit message to make this more 
explicit. I saw it in the patch but did not think about that.

>> I wonder if it would worth renaming the property to dma-offset to match 
>> that of ohci so it's less confusing what it refers to. It's only used by 
>> r2d and this patch already changing that so would be an easy change.
>
> We can't because TYPE_PCI_SM501 is user-creatable, so we need to
> go thru the whole deprecation process and we don't have any API to
> deprecate QOM properties yet.

But the sm501 PCI device only creates the display part hence it has no 
base option only vram-size (see sm501_pci_properties) so only the sysbus 
version has this property. Is this still a problem in that case?

Regards,
BALATON Zoltan

> I'll add these comments to the description.
--3866299591-185547500-1675432233=:62709--
