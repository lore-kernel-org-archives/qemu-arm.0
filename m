Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp3587552lfk;
        Sun, 13 Feb 2022 07:22:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3qf4+TK2oVO5zJvnvB6TQxYIcw3tX2gPzecvbrk5+utUH1GWh8URARwra15sc1vvhYTw6
X-Received: by 2002:a25:df8c:: with SMTP id w134mr8792520ybg.448.1644765744615;
        Sun, 13 Feb 2022 07:22:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644765744; cv=none;
        d=google.com; s=arc-20160816;
        b=H7/Uu0Kojgo5eAFDUXDUJHbF2GSzxLwBIcLzOM6gLYy8Dt3m7UfYqRuvT/TfbwDFnC
         gmnA5Dgk7m7roHF7WVF0WhgyF1M8DjhDa/Lo6wkF8xpGKWYOnkys5liOAyvlWoSfqpvs
         WnBWDbdckRtdseTpJSX7z+C6a+obnOZNuhiSjc8dDHlQUm3H7gYtXp7BCOrOj50OH7xw
         Z4Y3k9CL8c7YmcnK6UjJ+/LcbmZfVxOimIyziTIWE2yIVRxqWTbZN4K49C6kiF4F5kk7
         m+iovhGouvu749PyHTEvjh4MNDuQw92IlEHy872xYFqvgVlcBT4QuElktwZ4Ib81kvSW
         gAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:to:from:date;
        bh=5sbdpXkZKs+gRxJTD0Shushk/E7R+mR7wSQkFdiaGI0=;
        b=zq8odKn3mFhswMHe+ZaE56cO7WbzKKCdH8STdcc+nIyLh+DkeVGxvdEHyAlO/vwq57
         02TDoOOhP8qZwuhZYKI850+b4Mo7pM1SfotiOwESXd9nVM3Yq7Jo0IiaM49GA4nHvcdL
         mUdWMiVJNP/tBdG/z+d30pYgYhr9NBqe+GENMwOCsg8cFThXCx750tsQ9dJphCAaNC2B
         GA6Vc9ZfX61gPw0Bq/IG4fyAMdd03HEiXxNoDYkRB+HN/m7wYzkk9/rOoXyv7NAT5B1P
         y/K9szGlOKZVY7ijtQensH1eg+VlPIsDNcwGaKUALu2Ny3hjFJ+jABul83QJxbpk1XD6
         4o/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si19878155ybz.400.2022.02.13.07.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Feb 2022 07:22:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1]:47474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nJGhj-00086L-Tf
	for alex.bennee@linaro.org; Sun, 13 Feb 2022 10:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nJGhW-00083O-Oc; Sun, 13 Feb 2022 10:22:10 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:47850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nJGhT-0001TS-RS; Sun, 13 Feb 2022 10:22:10 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 59610746377;
 Sun, 13 Feb 2022 16:22:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2EB41746324; Sun, 13 Feb 2022 16:22:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2CEB6746369;
 Sun, 13 Feb 2022 16:22:02 +0100 (CET)
Date: Sun, 13 Feb 2022 16:22:02 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 2/5] pci: Always pass own DeviceState to
 pci_map_irq_fn's
In-Reply-To: <554F5BFB-D5CD-470B-8EEC-2218BBC67A2F@gmail.com>
Message-ID: <b4845a8-f783-bfa2-d9cd-f299c5e22f6d@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-3-shentey@gmail.com>
 <d6e47199-343e-46c0-d44f-64bc8d6e8385@eik.bme.hu>
 <CAG4p6K7Z=h+LkNhL+Ex3USDS1SEnh-MGvx_FUF5CoKaHOgRm_g@mail.gmail.com>
 <d13634a-b414-7663-42c-6390c5d58a1e@eik.bme.hu>
 <554F5BFB-D5CD-470B-8EEC-2218BBC67A2F@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-202961774-1644765722=:8635"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AfqUdv2IyVXv

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-202961774-1644765722=:8635
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 13 Feb 2022, Bernhard Beschow wrote:
> Am 12. Februar 2022 17:13:19 MEZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>> On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>>> Am 12. Februar 2022 14:27:32 MEZ schrieb BALATON Zoltan <balaton@eik.bme.hu>:
>>>> On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>>>>> Passing own DeviceState rather than just the IRQs allows for resolving
>>>>> global variables.
>>>>
>>>> Do you mean pci_set_irq_fn instead of pci_map_irq_fn in the patch title?
>>>
>>> I'm referring to the typedef in pci.h because the patch establishes
>>> consistency across the board.
>>>
>>>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>> hw/isa/piix4.c          | 6 +++---
>>>>> hw/pci-host/sh_pci.c    | 6 +++---
>>>>> hw/pci-host/versatile.c | 6 +++---
>>>>> hw/ppc/ppc440_pcix.c    | 6 +++---
>>>>> hw/ppc/ppc4xx_pci.c     | 6 +++---
>>>>> 5 files changed, 15 insertions(+), 15 deletions(-)
>>>>
>>>> You don't seem to change any global function definition that reqires this
>>>> change in all these devices so why can't these decide on their own what
>>>> their preferred opaque data is for their set irq function and only change
>>>> piix4? Am I missing something? I'm not opposed to this change but it seems
>>>> to be unnecessary to touch other device implementations for this and may
>>>> just make them more complex for no good reason.
>>>
>>> This patch is a segway into a direction where the type of the opaque parameter
>>> of the pci_map_irq_fn typedef could be changed from void* to DeviceState* in
>>
>> I'm still not quite sure what you mean considering these typedefs in
>> include/hw/pci/pci.h:
>>
>> typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
>> typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
>> typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
>>
>> pci_map_irq_fn already has PCIDevice *, it's pci_set_irq_fn that has void
>> *opaque and is what this patch appears to be changing. Am I looking at the
>> wrong typedefs?
>
> Oh sorry, I mixed things up. You're correct: I meant pci_set_irq_fn.
>
>>> order to facilitate the more typesafe QOM casting. I see, though, why this is
>>> confusing in the context of this patch series. I don't have strong feelings for
>>> converting the other devices or not. So I can only change piix4 if desired.
>>
>> Yes that seems to be an independent cahange so maybe it's better to just
>> change piix4 in this series and then have a separate patch for changing
>> the void *opaque to DeviceState * independent of this series. But I'm not
>> sure that's necessarily a good idea. It may give some more checks but for
>> callbacks used internally by device implementations I think it can be
>> expected that code that registers the callback also knows what its opaque
>> data should be so it does not have to be checked additionally, especially
>> in code that may be called frequently. Although in a similar via-ide
>> callback I could not measure a big penalty the last time I tried but I
>> suspect there still mey be some overhead involving QOM casts (maybe there
>> are just bigger bottle necks in ide emulation so it was masked) so I'm not
>> sure it's worth the added complexity but if others prefer that I'm not
>> that much opposed to it but it's clearer as a separate change anyway.
>
> I'll just change piix4, leaving the other devices as is. This also allows for merging this patch with the next.

I'm not sure what will be the next patch after all the changes we were 
talking about but don't put too many changes in one patch. It may worth 
keeping this as a separate change even if it's simple and only affecting 
piix4 now just to make it clear and simpler to review and maybe bisect 
later. Generally one change per patch is preferred even if it results in a 
lot of small patches (unless maybe combining a small style fix or very 
simple one line change with another simple patch that may not worth a 
separate patch). This may be over that limit so better to keep as separate 
patch but again not sure what patch you meant to combine it with but the 
patch submission guidelines say separate changes should be separate 
patches.

Regards,
BALATON Zoltan
--3866299591-202961774-1644765722=:8635--
