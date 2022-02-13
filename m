Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp3562476lfk;
        Sun, 13 Feb 2022 06:32:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoGqiHu/0MXCx2v3ZtmeGpZJLt7gP0H1iHQtjNSEAoBfdQSLznobNH6ijJtRthPX1dWaC8
X-Received: by 2002:a05:690c:30e:: with SMTP id bg14mr10138168ywb.133.1644762739521;
        Sun, 13 Feb 2022 06:32:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644762739; cv=none;
        d=google.com; s=arc-20160816;
        b=y2vJ14J2ucfo4kWeUE8FgkHaGGOTDcibZ6KiD9fcZ740G53mCQSMCtC8Z1zkD/t81V
         VmvOF3nEaj688iWDqbQMf+pWYLH2Y3tMM0tlFQIvxLnkW6rtyJ4rY5+nOnXzxNRGgQlw
         kkmRykZQQKMUfOOQuNsPCyl23YK/pr/Zx234ckZaNnrvFQi3w4V3kman1lkzEYFgZei1
         TdzLnwneRh5vvnSRs64rP34EvtAhWPjoob2SXi6VNMUyaSSoYgbRQvcxDgDuG/uqJFf7
         xt9pitsk0VidtlmKn/P6gs8ksGxtW3ResUs95RwvYifFThRES9thLzYyfz/LZGrIi2Na
         zsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:user-agent:subject
         :to:from:date:dkim-signature;
        bh=IpCwjTeS3iDxJjV2hLEAd6nc2MfrxdyiNq2bElaA5dw=;
        b=DRYHS3VyNUAfh9rT45n/3TmM/oOoKsL4cZV9D1LY052TRsjVR8HlOFzorkBh5eFidc
         QiM1NvbSOlT4K+xMKtsjoDXgA5deml/YgLsvMmyMrezCe7S7ysEzFYNMcLH0k3TY/AHf
         KPTdHaaHejsKGmAI0r6awtEMCfVJzdDC75fCPSy2GggYvu3KRMY4oK0f6thC6BjlGrIk
         Cx5e8AsrKwnS8DAP/4i9dp23KlDCKc4XzPMhtfHTIRHMXw8a9h4WjSnmATexLNbGodX9
         I1SpXbUt9F+5Dz3MfwtlnzOwwpWR3vvvJa2ggLRDt7yBnCN39CX0XHvIqNK0y+opQf2V
         WzZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="c/aIVEJf";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si22545738ybu.699.2022.02.13.06.32.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Feb 2022 06:32:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="c/aIVEJf";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nJFvG-0000En-L9
	for alex.bennee@linaro.org; Sun, 13 Feb 2022 09:32:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nJFuq-0000EX-Sw; Sun, 13 Feb 2022 09:31:52 -0500
Received: from [2a00:1450:4864:20::62c] (port=47067
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nJFuo-00056i-QH; Sun, 13 Feb 2022 09:31:52 -0500
Received: by mail-ej1-x62c.google.com with SMTP id e7so28346390ejn.13;
 Sun, 13 Feb 2022 06:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:user-agent:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=IpCwjTeS3iDxJjV2hLEAd6nc2MfrxdyiNq2bElaA5dw=;
 b=c/aIVEJfeuOPFSkN6Cy6uFgSiJ3COh9gVDQEH25XkDhIN9N0JXnQkeVMn0qP+UCJ0z
 lTHZHR2xA0e4ezWjG+TjCEq2tgJg0lkUsa6G4ywd3LulySj/QEHxhQvTDyJ8eUX8JptK
 BUxBwsaNRMVS+iF0JK/AfhvLPQilmZgaRSA5Ousf9fWnw8K7WtmvJaQD+PIsHjDfM3XM
 OySj9jKt5fD4+HJNuT6mIDfn4dW4HUeauc58ah6ZA1/50+tMiiZaGwJ5+0y5b1L+bcPp
 tvSzyu52/KHuRK51GsVOPF/YJJsLCcIPeGvyrO/BTCjv6rKnpqxeqdHGzS+ZL5MgDbMn
 vDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
 :references:message-id:mime-version:content-transfer-encoding;
 bh=IpCwjTeS3iDxJjV2hLEAd6nc2MfrxdyiNq2bElaA5dw=;
 b=ZLoE74RNhbAHVt5ZZBVVgZHDXVne4AYN/3Be1gfmFgcX13x5HSLvmSndi9Kk/gyrFZ
 6WS+xtaYpYud/qJuwYxiPyequ4qUVGP0/4x5kHe9gSwn9HN5Qkj1GC61wu17SnKMfgvq
 a68MMX231BCjtg3ii9+WiwMbG//BUT5ushygQMHMcgZboIjd7ShPYrIDHCEj7Nyyvb2K
 UCTnzXQOLtPTLEWKzu7rAe+a0CBJ0uJNeGuv+FyC9ql7K3KMr2GjJxf3LjtVxYLsVW5k
 N3g9nM7UCVUK5z8rH0pIOU5jcCYeAIRguBtlhvJPqtVLgMISsAGpzdkWydh7LX4m65Kv
 d3ow==
X-Gm-Message-State: AOAM530rQhM7hpaXk0yJV927Bfw+8Vd9y7UwJYMeHAMOv2iRg85mB7wN
 CO0DuJHzyznv9iXfq4cTq7I=
X-Received: by 2002:a17:906:39d5:: with SMTP id
 i21mr8209607eje.495.1644762708172; 
 Sun, 13 Feb 2022 06:31:48 -0800 (PST)
Received: from ?IPv6:::1?
 (200116b8463dcc00452af80a311a73da.dip.versatel-1u1.de.
 [2001:16b8:463d:cc00:452a:f80a:311a:73da])
 by smtp.gmail.com with ESMTPSA id m7sm12713296edb.16.2022.02.13.06.31.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 13 Feb 2022 06:31:47 -0800 (PST)
Date: Sun, 13 Feb 2022 15:31:41 +0100
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/5=5D_pci=3A_Always_pass?=
 =?US-ASCII?Q?_own_DeviceState_to_pci=5Fmap=5Firq=5Ffn=27s?=
User-Agent: K-9 Mail for Android
In-Reply-To: <d13634a-b414-7663-42c-6390c5d58a1e@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-3-shentey@gmail.com>
 <d6e47199-343e-46c0-d44f-64bc8d6e8385@eik.bme.hu>
 <CAG4p6K7Z=h+LkNhL+Ex3USDS1SEnh-MGvx_FUF5CoKaHOgRm_g@mail.gmail.com>
 <d13634a-b414-7663-42c-6390c5d58a1e@eik.bme.hu>
Message-ID: <554F5BFB-D5CD-470B-8EEC-2218BBC67A2F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nUMcjJmUegK9

Am 12=2E Februar 2022 17:13:19 MEZ schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>> Am 12=2E Februar 2022 14:27:32 MEZ schrieb BALATON Zoltan <balaton@eik=
=2Ebme=2Ehu>:
>>> On Sat, 12 Feb 2022, Bernhard Beschow wrote:
>>>> Passing own DeviceState rather than just the IRQs allows for resolvin=
g
>>>> global variables=2E
>>>
>>> Do you mean pci_set_irq_fn instead of pci_map_irq_fn in the patch titl=
e?
>>
>> I'm referring to the typedef in pci=2Eh because the patch establishes
>> consistency across the board=2E
>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> Reviewed-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>
>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>>>> ---
>>>> hw/isa/piix4=2Ec          | 6 +++---
>>>> hw/pci-host/sh_pci=2Ec    | 6 +++---
>>>> hw/pci-host/versatile=2Ec | 6 +++---
>>>> hw/ppc/ppc440_pcix=2Ec    | 6 +++---
>>>> hw/ppc/ppc4xx_pci=2Ec     | 6 +++---
>>>> 5 files changed, 15 insertions(+), 15 deletions(-)
>>>
>>> You don't seem to change any global function definition that reqires t=
his
>>> change in all these devices so why can't these decide on their own wha=
t
>>> their preferred opaque data is for their set irq function and only cha=
nge
>>> piix4? Am I missing something? I'm not opposed to this change but it s=
eems
>>> to be unnecessary to touch other device implementations for this and m=
ay
>>> just make them more complex for no good reason=2E
>>
>> This patch is a segway into a direction where the type of the opaque pa=
rameter
>> of the pci_map_irq_fn typedef could be changed from void* to DeviceStat=
e* in
>
>I'm still not quite sure what you mean considering these typedefs in=20
>include/hw/pci/pci=2Eh:
>
>typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
>typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
>typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
>
>pci_map_irq_fn already has PCIDevice *, it's pci_set_irq_fn that has void=
=20
>*opaque and is what this patch appears to be changing=2E Am I looking at =
the=20
>wrong typedefs?

Oh sorry, I mixed things up=2E You're correct: I meant pci_set_irq_fn=2E

>> order to facilitate the more typesafe QOM casting=2E I see, though, why=
 this is
>> confusing in the context of this patch series=2E I don't have strong fe=
elings for
>> converting the other devices or not=2E So I can only change piix4 if de=
sired=2E
>
>Yes that seems to be an independent cahange so maybe it's better to just=
=20
>change piix4 in this series and then have a separate patch for changing=
=20
>the void *opaque to DeviceState * independent of this series=2E But I'm n=
ot=20
>sure that's necessarily a good idea=2E It may give some more checks but f=
or=20
>callbacks used internally by device implementations I think it can be=20
>expected that code that registers the callback also knows what its opaque=
=20
>data should be so it does not have to be checked additionally, especially=
=20
>in code that may be called frequently=2E Although in a similar via-ide=20
>callback I could not measure a big penalty the last time I tried but I=20
>suspect there still mey be some overhead involving QOM casts (maybe there=
=20
>are just bigger bottle necks in ide emulation so it was masked) so I'm no=
t=20
>sure it's worth the added complexity but if others prefer that I'm not=20
>that much opposed to it but it's clearer as a separate change anyway=2E

I'll just change piix4, leaving the other devices as is=2E This also allow=
s for merging this patch with the next=2E

Regards,
Bernhard

>Regards,
>BALATON Zoltan
