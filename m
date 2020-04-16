Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2030986lfm;
        Thu, 16 Apr 2020 09:49:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypIa9cuzkbyeIDX8q8yLupx0JIDTiglrUKDaXLCHDuC4qianRNPfmnwnysCmq9LERvs2Xsmq
X-Received: by 2002:ac8:2db9:: with SMTP id p54mr14120135qta.125.1587055758972;
        Thu, 16 Apr 2020 09:49:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587055758; cv=none;
        d=google.com; s=arc-20160816;
        b=vAOP9pvrjUsb5wC10qSVwauB+kJgQXoypNwh1W7U3cjeSBkQvFVAkmFqSchWlmPBTQ
         F+0BHU1WgczES0dUGGDA5enrBS2lGAVAOIAbtRgqia12wy9KoTEyTX32dQ0Ti3Dk+bu8
         Q4giFeEkl2AuCYAqFAWZGEXRILTBE8WB53l8GQ8htysehWPN2tVg0FlaFg5oTPw4RiAN
         TrsCzr121laM9iyYe+LGidOLA0LQecAEZ3pZQm7X+SXQWb4/b9caaLgHvNwS4hQVlBZi
         h39uXbo/IGz5dJGDaBQUsqR4jAmIRpjubtFAZJUy41O3433CgCS9UibaBOKga6KURCZn
         K5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tEPpHaqGebl4PoPoOZBdDNfTSHtBshHXb+6AVOraALA=;
        b=JYTsocRxpuLyq2PFmFzGdQvvRdTlpCM9aHk4DdS4rIkr9utbHRrljMoP0l5hmaE6O+
         2QWqbSOg2fFyy7c6e/tkQk6t5fKJvF3Y0ambL9UvhZPGStzWDx3ZXId943PDvp1STafU
         z+IwCtq93ueGsDfUC2hCb01oSwNmwZjZFdJsjqPqsssAQdKQmL7jYcFM4p/UclH+5d70
         AUf3YipPbnMpSZHc/HDV8RL4AM3Mk2uGsVtz+TNgtA9F7TUdZ0nt6IeEG3j0XYGi7kcC
         dgMZLrGAeZ5OtyMXIckk/6zTKgda6W3saRx1hmblKEo53owfv1xmylSX/j5O42AgpLdS
         WDLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yyWOQs/W";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si7034004qkc.256.2020.04.16.09.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 09:49:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yyWOQs/W";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP7hW-0006C3-DW
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 12:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP7hB-0006Bl-PM
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:48:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP7hA-00089b-HI
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:48:57 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38635)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP7hA-00089C-CK
 for qemu-devel@nongnu.org; Thu, 16 Apr 2020 12:48:56 -0400
Received: by mail-ot1-x344.google.com with SMTP id k21so3629930otl.5
 for <qemu-devel@nongnu.org>; Thu, 16 Apr 2020 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tEPpHaqGebl4PoPoOZBdDNfTSHtBshHXb+6AVOraALA=;
 b=yyWOQs/WZrhjTTMl+LL+AOsiq4v/ZTSDIg9pnze8LlNQ12UO6cDe2BbdyenAQQr+2V
 TPhpDPnm5gD5B1vkVFTGyb0Hz92TCBtZlMsqzmveG2OqfsGtZ0Bq8NUj/pHSls/B615x
 e91dOt2mPlt5pJeEAL7KR9RbqTi7cLsomCqlLE3ypjl2zBwpHKJ6jzfkH1ZX3RUsVkE9
 BKUMLUkfKIgj/HdzYGQ5DyKZEO+RSqhWk5AEatpAaD/HGFlXX98pbUD1YRHQJ7TzwTAd
 NGIjMVgaCSiJyMDQtAKzO2QcGne+Ydo6ffNNeUnc5CheaULEjkVsZyIN4V50NSuMO/kq
 TWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEPpHaqGebl4PoPoOZBdDNfTSHtBshHXb+6AVOraALA=;
 b=kK5xQW4i6Odot6Y+PhUlaX/s8xpB5hiX+txwJq7WFKtHXp2RijW1/1/mZ1j3tMZR/S
 K9teaiGek39bjNxXuYj9TgaLvDTLgwN2Qn7x1hquy7m9gPgd8rnUkBYrknac0eJXXcWX
 Rt0kT29JhC6SyyLcSHeJNjQ8OqTvFQjHk8/2Hg7/RFO0T9LL8OjPetdfxrNUCf4xV0oH
 q9uwyrlnEvzLejK45N6gUiH+M/CZBZiHSzi+DGVjm1bb3wr876rRnTt8o+oS7LSqO+C6
 eeYo+QH+YNJTUJUNRQjpDFinlOR242yVjwPm5fLY9Gmrmds8nvL1pBSfuxmiUplNYfbj
 qpMg==
X-Gm-Message-State: AGi0PuZbvoWwhvH1qXd+Rh40sAlpTzG0iq9L5z/eEWPyz3vFkTPn2dX1
 Kf5b7j6iR0H6QXY/WW84s+Y5zWAt/aQDnJM3EtvfAA==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr8866546otj.91.1587055735433; 
 Thu, 16 Apr 2020 09:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200409063137.803522-1-joel@jms.id.au>
In-Reply-To: <20200409063137.803522-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 17:48:41 +0100
Message-ID: <CAFEAcA8M06TFD4d8jLe-w24PMUGDH_sRXhf8TV25JuTV1ig2jQ@mail.gmail.com>
Subject: Re: [PATCH v2] aspeed: Add boot stub for smp booting
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RwuxFBkMt2wb

On Thu, 9 Apr 2020 at 07:31, Joel Stanley <joel@jms.id.au> wrote:
>
> This is a boot stub that is similar to the code u-boot runs, allowing
> the kernel to boot the secondary CPU.

> +static void aspeed_write_smpboot(ARMCPU *cpu,
> +                                 const struct arm_boot_info *info)
> +{
> +    static const uint32_t poll_mailbox_ready[] = {
> +        /*
> +         * r2 = per-cpu go sign value
> +         * r1 = AST_SMP_MBOX_FIELD_ENTRY
> +         * r0 = AST_SMP_MBOX_FIELD_GOSIGN
> +         */
> +        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
> +        0xe21000ff,  /* ands    r0, r0, #255          */
> +        0xe59f201c,  /* ldr     r2, [pc, #28]         */
> +        0xe1822000,  /* orr     r2, r2, r0            */
> +
> +        0xe59f1018,  /* ldr     r1, [pc, #24]         */
> +        0xe59f0018,  /* ldr     r0, [pc, #24]         */
> +
> +        0xe320f002,  /* wfe                           */
> +        0xe5904000,  /* ldr     r4, [r0]              */
> +        0xe1520004,  /* cmp     r2, r4                */
> +        0x1afffffb,  /* bne     <wfe>                 */

Note that unlike "wfi", QEMU's "wfe" implementation is merely
a 'yield', so a secondary-CPU boot loop that has wfe in it
will basically be a busy-loop of those vcpu threads.
(This is why the smpboot code in hw/arm/boot.c uses wfi.)

I don't suppose the secondary boot protocol on these boards
is such that a wfi loop will work ? (Depends on what the
primary code in the kernel does to prod the secondary after
writing the magic value.)


> +        0xe591f000,  /* ldr     pc, [r1]              */
> +        AST_SMP_MBOX_GOSIGN,
> +        AST_SMP_MBOX_FIELD_ENTRY,
> +        AST_SMP_MBOX_FIELD_GOSIGN,
> +    };

thanks
-- PMM
