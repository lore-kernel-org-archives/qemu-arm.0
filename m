Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3545732lfy;
        Mon, 17 Aug 2020 23:18:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRJjEGrFi0CoEgnLfApOuOHXsfBc+6rcelyFoL4xRJKLfhoajJob8K8LgHsq2smN2SQMgO
X-Received: by 2002:a25:6808:: with SMTP id d8mr25386995ybc.265.1597731491687;
        Mon, 17 Aug 2020 23:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597731491; cv=none;
        d=google.com; s=arc-20160816;
        b=jI4vRvoaAgK4IYuTsp2FkUSnfO4wY4n6TlIdf8BBjqeALyBUOypczA0NcoJSWHFeqS
         PWiar28s2xlbuphta5xOehJ89NCWMyD4KSwe9HEOtv9VOAPzEfrU9aBl7xScwVXBnT3t
         iAxUMAO4I8WR/me4sa+Fy+M13dHHfIeNdnnMDmWZr9j8VQtV8CmHghxs464nBztWjtXE
         v/1XUoX3ZZHjxFiX4KHeaP0gZ8E33fQT8JDF3AX4l0HTfwIbfKrHSF1bnlB8EwoAO3ut
         4iY3bwzSFr2HcRJ6ewNT2ycIWcDUYBDmqQ89KE68SdssE4VRSiJT2l7OdqS3EKRn8IqT
         07NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MIdWO3COCqNdq9aMAydiJRPmw8ayq0kdGOqoDuJJjbk=;
        b=bTnWiW1A5RWOD9QdfV1J85r8053TCiQZh2wVMP6xF2+rJ+8SRrD9jPdbcPsiKKBcpB
         8mTmQIyTxnGQfk6XVmetbU5aRUXI0GkPtwK7X0yaxgb0QAWwgNQqWDQQ4jdxkaMbJssd
         nmMQ7l5pNzS6GwderHCbxAEHtUuqFbmxE6oJVde5e+dumrHDqWPHhzColrwmwjuoplL1
         rcLPA6Rwx4AEx0FhmrednqmlE8VdNNAO35OdTOVWkMxcJZA/crR4JHSIqPpbPALDhNwP
         dVDecE7T5RLjqHnvVCLmSgGGCC4iloXumHuovvX2B5kkE0GBuBHiG5JX9Jfg0FRmCO3g
         ik6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@brainfault-org.20150623.gappssmtp.com header.s=20150623 header.b=gN5EDQ1y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si25542573ybt.308.2020.08.17.23.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 23:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@brainfault-org.20150623.gappssmtp.com header.s=20150623 header.b=gN5EDQ1y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7uwl-0007jG-3I
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 02:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1k7uw8-0007BK-30
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 02:17:32 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1k7uw5-0003dV-Ri
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 02:17:31 -0400
Received: by mail-wr1-x441.google.com with SMTP id c15so17061609wrs.11
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 23:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIdWO3COCqNdq9aMAydiJRPmw8ayq0kdGOqoDuJJjbk=;
 b=gN5EDQ1y2F3iKrhn8Mzh/7lqjhxrwUIINxNyR7KvPMMKhWe77LozxTnwKM1qzKJKgG
 UcNdokP++rJbAlLNcm7VikdLZwidRMKX06VWFdiHXJkuNKMmQpglHWxTPs50zTE6Dchs
 WLgtivoofLTi1V2Db2i/lXFOR/XPKrzlbohTZDjGwi0bvUFRG5tC5yyMmdHbXK2itaw3
 sbdxRUdpeiGNA7xhXcldaBUe5jgR2aC5qvqx0icemPzSQDjb++VVQl0Tt9+lW8uE+7gO
 TKjym0rKD3BRJNDUDBcIz/KaC9PgxXwsafbkLHO/9GE+6pO9Zo74CQQiYOhu3BbGD1UO
 ohTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIdWO3COCqNdq9aMAydiJRPmw8ayq0kdGOqoDuJJjbk=;
 b=Wz0YlMoD5BQAa/VKXgON/F/Ao7HcFa1DSZjoUl+btqJqOGepZ51Q3uxP5ThQlkkvON
 ROChU43ZaGX3c8rCqSA6fIaKXrmV+fv47lngLRyzoApiBtSjmav+Zz46MYRtG1dDPiwG
 65FLwn7dec1q4lQIbrx+o9nFm3SSGsYRggp0T1NONkto4DxWrqnu2oqgJ3o3lBZYWIEj
 YdMpXsYa8eDI5eaF2Dype+eEggRaokVXtOAKtpxc+dP3X4ylIUW7Db4fuyfeWvm+JZGk
 9aKJ5UTP3VEj9C6FnhaX0FyQnVJLPe7BakgHNh4H/3Qk0xN3hpyailHDm+NyJN+EfLfg
 lQng==
X-Gm-Message-State: AOAM531WfnSVQswpkSoHyTmy9HaElhoTj2JUVvTLu7BBL+0amzUoohSe
 kZW06Zxt0wNileQ9Ghum7RbAITrHxV/R8TS8LGGRjA==
X-Received: by 2002:adf:f247:: with SMTP id b7mr19606082wrp.128.1597731447614; 
 Mon, 17 Aug 2020 23:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <1597423256-14847-1-git-send-email-bmeng.cn@gmail.com>
 <CAAhSdy2D=TcENAJDja4r6pnhz0LRi-T+A9k3Btrs_EuB4x0e4w@mail.gmail.com>
 <CAEUhbmV5=B5xKhYqMj1MQb61nt5cNUJG1MXT++C1w1YMYTfLCQ@mail.gmail.com>
 <202949f7-c9d5-4d4d-3ebe-53727f4fa169@microchip.com>
 <CAKmqyKM3nm0rhxgDvWKWfO+4b23ZLSkHW2TzmcVZ_ZFy4L7MRg@mail.gmail.com>
 <d3f61c2c-a489-887e-0143-4d9a1e66e6f2@microchip.com>
In-Reply-To: <d3f61c2c-a489-887e-0143-4d9a1e66e6f2@microchip.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Aug 2020 11:47:15 +0530
Message-ID: <CAAhSdy32owLO0KytyYsg-zH6JyyfNfGofa4vanqTFJLntPq0=g@mail.gmail.com>
Subject: Re: [PATCH 00/18] hw/riscv: Add Microchip PolarFire SoC Icicle Kit
 board support
To: Cyril.Jean@microchip.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::441;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, qemu-block@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Bin Meng <bin.meng@windriver.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jason Wang <jasowang@redhat.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair23@gmail.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QZsZCjGN170s

On Tue, Aug 18, 2020 at 1:23 AM <Cyril.Jean@microchip.com> wrote:
>
> On 8/17/20 8:28 PM, Alistair Francis wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On Mon, Aug 17, 2020 at 11:12 AM via <qemu-devel@nongnu.org> wrote:
> >> Hi Anup,
> >>
> >> On 8/17/20 11:30 AM, Bin Meng wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> Hi Anup,
> >>>
> >>> On Sat, Aug 15, 2020 at 1:44 AM Anup Patel <anup@brainfault.org> wrote:
> >>>> On Fri, Aug 14, 2020 at 10:12 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>>> From: Bin Meng <bin.meng@windriver.com>
> >>>>>
> >>>>> This adds support for Microchip PolarFire SoC Icicle Kit board.
> >>>>> The Icicle Kit board integrates a PolarFire SoC, with one SiFive's
> >>>>> E51 plus four U54 cores and many on-chip peripherals and an FPGA.
> >>>> Nice Work !!! This is very helpful.
> >>> Thanks!
> >>>
> >>>> The Microchip HSS is quite convoluted. It has:
> >>>> 1. DDR Init
> >>>> 2. Boot device support
> >>>> 3. SBI support using OpenSBI as library
> >>>> 4. Simple TEE support
> >>>>
> >>>> I think point 1) and 2) above should be part of U-Boot SPL.
> >>>> The point 3) can be OpenSBI FW_DYNAMIC.
> >>>>
> >>>> Lastly,for point 4), we are working on a new OpenSBI feature using
> >>>> which we can run independent Secure OS and Non-Secure OS using
> >>>> U-Boot_SPL+OpenSBI (for both SiFive Unleashed and Microchip
> >>>> PolarFire).
> >>>>
> >>>> Do you have plans for adding U-Boot SPL support for this board ??
> >>> + Cyril Jean from Microchip
> >>>
> >>> I will have to leave this question to Cyril to comment.
> >>>
> >> I currently do not have a plan to support U-Boot SPL. The idea of the
> >> HSS is to contain all the silicon specific initialization and
> >> configuration code within the HSS before jumping to U-Boot S-mode. I
> >> would rather keep all this within the HSS for the time being. I would
> >> wait until we reach production silicon before attempting to move this to
> >> U-Boot SPL as the HSS is likely to contain some opaque silicon related
> >> changes for another while.
> > That is unfortunate, a lot of work has gone into making the boot flow
> > simple and easy to use.
> >
> > QEMU now includes OpenSBI by default to make it easy for users to boot
> > Linux. The Icicle Kit board is now the most difficult QEMU board to
> > boot Linux on. Not to mention it makes it hard to impossible to
> > support it in standard tool flows such as meta-riscv.
> >
> > Alistair
>
> If it is such a problem we can add a U-Boot SPL stage and the HSS can be
> treated as standard SoC ROM code.

It's not mandatory for U-Boot SPL to have stable DRAM calibration settings
from the start itself. The initial U-Boot SPL support for most
platforms (accross
architectures) usually include basic working DRAM calibration settings which
is later on updated with separate patches. Also, we don't need all U-Boot
drivers to be upstreamed in one-go as this can be done in phases.

The advantage we have with PolarFire SoC Icicle board is that we already
have a U-Boot S-mode. and we believe the OpenSBI generic platform will
work fine for PolarFire SoC Icicle board so the only thing missing right now
is the U-Boot SPL support for OpenSource boot-flow.

It will certainly accelerate open-source development if we have boot-flow
U-Boot_SPL => OpenSBI (FW_DYNAMIC) => U-Boot_S-mode working
on PolarFire SoC Icicle board. Initially, we just need DRAM, SD/eMMC,
and Serial port support for U-Boot SPL and U-Boot S-mode. Later on,
more patches can add ethernet and other booting device drivers to U-Boot.

Regarding security services of HSS, we are working on a OpenSBI
feature which will allow HSS security services to run as independent
binary in M-mode (not linked to OpenSBI) and OpenSBI FW_DYNAMIC
will be a separate binary acting as a secure monitor.

Regards,
Anup
