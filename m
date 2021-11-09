Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1436615lfk;
        Tue, 9 Nov 2021 11:20:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzW0/mvgk0icZlf85LST6tgHejUgIP9Lv8MH1zvVGdathOjwumtLuFwBwWkOFRUWBxy10DQ
X-Received: by 2002:a05:6102:dc7:: with SMTP id e7mr16876830vst.21.1636485643816;
        Tue, 09 Nov 2021 11:20:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636485643; cv=none;
        d=google.com; s=arc-20160816;
        b=B5x1ZuXr0UTPTi0iBo2t7l6IfZx9JU8ERu+ktx0agVJbeElK5urjjQ5YaNvGSALhyF
         ANjzpihf2BXQhj6NNUU3LWdlg4vV1faXwx95NVWyuqdZeF+t/tCwF56JVfWYxwSUqDvk
         OO7W6Q54ddioQZdoLXgNY//72+FU8nRsvV5VeOJxP+z8gCQpHezSAuHJYV4Ivmx58v2S
         R9VsBhhyw47efWvDJG9OhIZOanS5QzZ967sUfY6zTX8uBLbGbYo8bp1GIwxnT8Fje9FM
         ONGCgLgacusxG2k4C+LQ+EDKHUiDR5xs4LTKXY9SkFXfJ2qG0mKBSb+tvfbyiHCP7Q4X
         TYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=q0E/cZ2QnjSuOBZWZiBKdhyCdeqaoA6GIRkljIyjT/U=;
        b=zel6WiYj2wDjg62GF+mKhHVdq4OFk+ZmJe3V0FwqvBQ/seXpZ8gHX2qB2WQeJkO0Nf
         Ycykv64SXvECoQLGHoBrQk1blTfgXOJjNFhn0gSC2mOuczFx3A+6FkBcn26T/48F9Pyf
         wZh+6syQ9d6VcHI1BJBkcUhnd869ohEnd3LGK7jGJxCHfLZKnLSkEC3uz8Su7EZNN5OJ
         Mg1oxNuMZephXDyqcCRudcZMhEdI0QMZ52u4/DRcSDuB5c8Pc0guXZr7nunmGbieKkUL
         FndK7LsaPihMieA/gxnM20ZBlrnC+j0VJDajRb+LD0cZxQC4GGmm9ILnwGt/fJ+TKEff
         0AYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xz+wHtFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30si14333063vsj.141.2021.11.09.11.20.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Nov 2021 11:20:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xz+wHtFP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mkWfj-0005z4-7e
	for alex.bennee@linaro.org; Tue, 09 Nov 2021 14:20:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkWfZ-0005yp-48
 for qemu-arm@nongnu.org; Tue, 09 Nov 2021 14:20:33 -0500
Received: from [2a00:1450:4864:20::32f] (port=46017
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkWfX-0006B4-8j
 for qemu-arm@nongnu.org; Tue, 09 Nov 2021 14:20:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so218443wme.4
 for <qemu-arm@nongnu.org>; Tue, 09 Nov 2021 11:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q0E/cZ2QnjSuOBZWZiBKdhyCdeqaoA6GIRkljIyjT/U=;
 b=xz+wHtFPUP8qJuAr5YU4VTstrz3NBMwDBShAVHQHSGB4kwKTRLIpmTgjmURQueIBmo
 CAhhkqUS3H4QOVP0r3sJyLZGUu+s3wLFV2ltQBma1eml7E51lqRDfkcfuKMOTEzHl8cl
 LmQicPFBeITufbu39Y/XWB9gxObkjed4ZOLqK1AgERtAemADJv0IY93+E4rdmi/HeiOb
 GZCQiWclMD77gVSzMI2JFplaELS5qQ5src5Kw+2naRl3FKFie+FLrCT5dmBL5GGSYouR
 sK9xl90zabr8ltiDyp1s/QOMekHEHm7xZE2lJhVj5y8AbrUYa2KIvjE3qXJxRBybYiOK
 mjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q0E/cZ2QnjSuOBZWZiBKdhyCdeqaoA6GIRkljIyjT/U=;
 b=OuU0rALNL5jsROsDX9x3+QwjNLZ5GacydKfGYem5UqFBq9SvtUqjH4xngxiR0TJT7H
 oRFySgyuvBK2ZmpbFWQI3Bq5L83tLErybM7zqYAR8SsHRW0twL97DsEUZeENMyldBS5V
 B4kMlH42UjfESt9C0shjCnmMdij5qADtmqeJ74tCvUP0VZcw81QIrx7mDzcc3cXFMas6
 N3WogAgeZod/FhCCdBtlavRfX5Z5tqqzoEm02NQGyoNKUOXE8ULZs0WkY9esKyfP9520
 /QlnVKUa+XEp12yE9L/gCWzzbY3qQCrXRxAkHYzeVlu0c/34fT7MVLe1vCMLFj9QNUZX
 nQ6w==
X-Gm-Message-State: AOAM532zeOPgQBemCPqo+ZZP/JEu3HOCk7Dpr74QG2q1UrkWjStsytd8
 1bFpcLnpSh9s2SQ+pQ4y/SFHaZc+d+H5UOlTNHDE8A==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr9731960wme.32.1636485629175; 
 Tue, 09 Nov 2021 11:20:29 -0800 (PST)
MIME-Version: 1.0
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
 <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
 <c8b89685-7490-328b-51a3-48711c140a84@tribudubois.net>
 <d19f6d2c-7505-b326-3a67-48c336f111e9@tribudubois.net>
 <dd45f94c-6110-7251-4f9f-5b4e1fbb73a4@tribudubois.net>
 <e0a1b786-4b1c-c608-495b-3fb839de2376@tribudubois.net>
 <CAFEAcA-DnbocsRHC3cUM_uX=kGn-KJa3q42TCyaB=isxKTS-Sg@mail.gmail.com>
 <ec74f093-9508-c0fc-3e06-2e8abf8655c6@tribudubois.net>
 <CAFEAcA8RU3=owBnCwJ7ePKW6Sm2GBU6er7o44iQd4Rs19TQs9Q@mail.gmail.com>
 <d1175f18-ba8a-3022-916f-395e0937b92e@tribudubois.net>
In-Reply-To: <d1175f18-ba8a-3022-916f-395e0937b92e@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 19:20:18 +0000
Message-ID: <CAFEAcA8BYNq4hBxx2stR9XoocLWwGcacxNSGcjWibHyXGKP5OQ@mail.gmail.com>
Subject: Re: Qemu and ARM secure state.
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N3Q3yWM8tNn7

On Tue, 9 Nov 2021 at 19:06, Jean-Christophe DUBOIS <jcd@tribudubois.net> w=
rote:
> So basically the Qemu i.MX7 processor code needs to set psci-conduit to S=
MC
> because we want to be able to boot the Linux kernel directly (without u-b=
oot)
> with Qemu emulating the PSCI services when an SMC instruction is triggere=
d.
>
> As I see it we also need a way to disable this Qemu PSCI emulation in cas=
e we
> want to boot an EL3 software (u-boot, optee or other).

Yes; we definitely want to support both of these use cases.

> We could certainly pass a command line option to explicitly tell Qemu to =
disable
> the PCSI emulation. But this would be a bit cumbersome as the board level
> code would then need to call to the SOC code to disable the psci setting =
on all cores.

We definitely don't want a new command line option. We just want to
use the information we already have (whether we're going to start the
guest code in secure/at EL3 or not) to make this decision.

> So I am wondering if we could be more "clever" solution and have things s=
orted out automatically. I would like to suggest 2 solutions;
>
> The first solution could be based on the mode of the processor when it st=
arts executing the provided software. If I remember correctly what you expl=
ained, if an ELF file is provided then the processor boots in the highest l=
evel (EL3 for i.MX6/i.MX7) while if a non ELF file is provided (uImage ...)=
 then the processor boots in EL2 (or lower depending on the processor) to e=
mulate the uboot behavior.
>
> if the processor starts the software in EL3 then we need to disable the "=
psci-conduit" through SMC (if set) because the EL3 software should install/=
provide the necessary firmware.
> If the processor starts the software in EL2 then we need to disable the "=
psci-conduit" through HVC (if set) because the EL2 software should install/=
provide the necessary firmware.

This is the right approach. The idea I suggested in the previous email
was that rather than having the SoC object code setting psci-conduit
always, and then something else coming along later and changing it,
we should instead not set it in the first place. It's a simple QOM property
which means it's not writable after the CPU object has been realized, I thi=
nk,
so we'd have to jump through some hoops to get it to be writable later.
On the other hand looking in hw/arm/boot.c we don't decide whether this
is a Linux boot (which means it will be to non-secure) or a non-Linux
boot (which means it will be to EL3) until quite late, so that's awkward
too (plus there's potentially duplication between board/SoC code of
the logic to decide whether to set psci-conduit or not). Let me have
a think about the cleanest way to arrange this.

-- PMM
