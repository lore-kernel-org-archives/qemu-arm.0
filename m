Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp3029555lfk;
        Sat, 12 Feb 2022 08:13:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhayBrDzpAlR47ODPTDym6X530BcObj0XPXCusRBV0zQVSHHGp8Vo4aHS1UXCaerUsByCG
X-Received: by 2002:a81:9f0a:: with SMTP id s10mr6875969ywn.438.1644682420558;
        Sat, 12 Feb 2022 08:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644682420; cv=none;
        d=google.com; s=arc-20160816;
        b=YoNfUxbHW4EWLyT/0ruM/X2PszKYFNmQ37soveVj1kSA8arQeMPRtJVhry9e8k6W8k
         3tFPMG50YY+g7zrG3feZbgCtCkjQ2A0hOOATRLUXvcV0e0tfINPrqIslBGHn/ZDhUbAp
         WZ+m3FPvs/w9/QHMtzqLlZGxh8yA/mDg13tsHe9x8ILb2iaEpdHqzSE1rK73qfMujQev
         dMP5F66h3LIEV5wr5OM08/QD9TjdoXHTFTZm41aBuCv2nyfGZeteQ89Apo8H0Q8XR9N3
         +ZbvrB0OKA/ZOB49xzw360gCU08RspimV6a9a4xJZpYCRl5Uz+vYB+f+qoiZ/ti47OVs
         Kfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:to:from:date;
        bh=2FSZgUrOGIdlwttP7zarzvkgKiV5jn9zGCxGrW7wIaU=;
        b=kfVIpb0VTgShPxMZCm4G+Rx6EKXuz6B53zBw6rsaSH5mmiLhS2qAEihjkKi97CPf7Q
         QFSmkR4k05rgHy9OxMkaE3NwDBF//lOFqK6Sz8+080wJz+jKoRTqWMl5X6tROEATt//u
         BoFqUgAcrhjpC34/6Acy5IKtlZUktTt/OFYUv2oh8tJ8uAjKvelaYdQstOMufqxDTTk1
         z4WcbU6Z0StgY2Vgsq3niYn1GM9xf7xJePzEKdVxah2qzA0xQGV3iCbBDJtnGWawbjtp
         BJD61dVOqxXEhqNX6s4FCgMjUj2kOVKKMAO4RbW6yyNX5chHGT280h/WrXgt3CfcTk0j
         Jhvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si24199356ybu.667.2022.02.12.08.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Feb 2022 08:13:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nIv1n-0001fY-SZ
	for alex.bennee@linaro.org; Sat, 12 Feb 2022 11:13:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIv1i-0001fL-9X; Sat, 12 Feb 2022 11:13:34 -0500
Received: from [2001:738:2001:2001::2001] (port=31416 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIv1e-0004lJ-QH; Sat, 12 Feb 2022 11:13:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1050A74635C;
 Sat, 12 Feb 2022 17:13:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DAF08746324; Sat, 12 Feb 2022 17:13:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D8C3E7456E3;
 Sat, 12 Feb 2022 17:13:19 +0100 (CET)
Date: Sat, 12 Feb 2022 17:13:19 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 2/5] pci: Always pass own DeviceState to
 pci_map_irq_fn's
In-Reply-To: <CAG4p6K7Z=h+LkNhL+Ex3USDS1SEnh-MGvx_FUF5CoKaHOgRm_g@mail.gmail.com>
Message-ID: <d13634a-b414-7663-42c-6390c5d58a1e@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-3-shentey@gmail.com>
 <d6e47199-343e-46c0-d44f-64bc8d6e8385@eik.bme.hu>
 <CAG4p6K7Z=h+LkNhL+Ex3USDS1SEnh-MGvx_FUF5CoKaHOgRm_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1240981976-1644682399=:90120"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: edloy3YZfgOJ

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1240981976-1644682399=:90120
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 12 Feb 2022, Bernhard Beschow wrote:
> Am 12. Februar 2022 14:27:32 MEZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>>> Passing own DeviceState rather than just the IRQs allows for resolving
>>> global variables.
>>
>> Do you mean pci_set_irq_fn instead of pci_map_irq_fn in the patch title?
>
> I'm referring to the typedef in pci.h because the patch establishes
> consistency across the board.
>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> hw/isa/piix4.c          | 6 +++---
>>> hw/pci-host/sh_pci.c    | 6 +++---
>>> hw/pci-host/versatile.c | 6 +++---
>>> hw/ppc/ppc440_pcix.c    | 6 +++---
>>> hw/ppc/ppc4xx_pci.c     | 6 +++---
>>> 5 files changed, 15 insertions(+), 15 deletions(-)
>>
>> You don't seem to change any global function definition that reqires this
>> change in all these devices so why can't these decide on their own what
>> their preferred opaque data is for their set irq function and only change
>> piix4? Am I missing something? I'm not opposed to this change but it seems
>> to be unnecessary to touch other device implementations for this and may
>> just make them more complex for no good reason.
>
> This patch is a segway into a direction where the type of the opaque parameter
> of the pci_map_irq_fn typedef could be changed from void* to DeviceState* in

I'm still not quite sure what you mean considering these typedefs in 
include/hw/pci/pci.h:

typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);

pci_map_irq_fn already has PCIDevice *, it's pci_set_irq_fn that has void 
*opaque and is what this patch appears to be changing. Am I looking at the 
wrong typedefs?

> order to facilitate the more typesafe QOM casting. I see, though, why this is
> confusing in the context of this patch series. I don't have strong feelings for
> converting the other devices or not. So I can only change piix4 if desired.

Yes that seems to be an independent cahange so maybe it's better to just 
change piix4 in this series and then have a separate patch for changing 
the void *opaque to DeviceState * independent of this series. But I'm not 
sure that's necessarily a good idea. It may give some more checks but for 
callbacks used internally by device implementations I think it can be 
expected that code that registers the callback also knows what its opaque 
data should be so it does not have to be checked additionally, especially 
in code that may be called frequently. Although in a similar via-ide 
callback I could not measure a big penalty the last time I tried but I 
suspect there still mey be some overhead involving QOM casts (maybe there 
are just bigger bottle necks in ide emulation so it was masked) so I'm not 
sure it's worth the added complexity but if others prefer that I'm not 
that much opposed to it but it's clearer as a separate change anyway.

Regards,
BALATON Zoltan
--3866299591-1240981976-1644682399=:90120--
