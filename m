Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6C1CC6B38
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 09:38:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHHuu-0004Dp-HM; Thu, 15 Oct 2026 05:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHHus-0004Ch-DO
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 05:38:26 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xHHup-0006bN-BS
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 05:38:26 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c2acc1e170cso860025166b.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 02:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792057100; cv=none;
 d=google.com; s=arc-20260327;
 b=ek+RKOReh8WvQXfV9W01EQ9TiwcleelfG9WXRn5SE4IAG307niNRbfwsBS02AwcPg8
 sOwXVIz5N1+VMRMV0Nur+1MKZ5x1jmHtO6rhrKRLAga0sU2+7HFvkqGA+QCQOi1AFyKm
 yNgfbM/1uBz9APy+4kv0yOQaYOHsaEaIVd+2ZhT2CXN91N3OBgEniN3TsmQ60LdPwWIW
 dABpSnExAXFWrTHx8vxR16Qfu3l56HI5rmL6JaqIcEKs5yPKjiDGZXwkrtyeMLimP1Ge
 Uw8W5BzqLqLDK3J8JiiZQx5I/j5OKFY7o9Ko3+fsMyRwoihx1giVT6cQzUBuPdbqjQi/
 hEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=r5G0BsDa9TUzuCzRry+HFI28e0hkmXpHpz9bsdrKKew=;
 fh=xNNMKGUU8LRH7pbRGkEcCK+F4dOqTEJ2VbsHtot5pvI=;
 b=CO2rqxiHiEB+0KXMg2fzHtuc6/VkWSo8xx2rqrvIJUH830UGBCXScpIsR9xa2OC1KN
 zmAS1/E8MyqfDUg0PHJZU9wPNbctU3vpGwIAyOJ8jb+XZNMe0Z2SysZZNo+Hxs5nWM6h
 ceYAetxjpH+J2/pBP6+gYP/OL3bHalLnkmyuE1euv9RLInfPALI+SJKTKL6Tjmjgum9g
 vSNneY5xqDV7spCuxTeWjDx6+SIqOHkypU0vAsdkhocOeHsjFu3AOBf5nz9SM1dkwRO8
 M3xScKi7Kk8sVv1B8R7JaaHJCPRGkJ934cxmkG3SAFvMNubWV3W1LBO0brt1+CiHl63/
 ed0Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792057100; x=1792661900; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=r5G0BsDa9TUzuCzRry+HFI28e0hkmXpHpz9bsdrKKew=;
 b=qLNp4n2+xMdE6saiQGY7qiym8S4r7/BgO2tPc/NAzBPLXX0FdVbeDJDL+68IVoehrA
 I8kJjS/FCtmOPN7zYppbb4lKEIW/Nhz/Emlw6ECXW5Vz2YtPngtsbiFvI21maARoX1z8
 22RC9QgPNA97od9JUXz/DsVRvR9j8G6RoxBvztwrQdgd9CRT59Wkrb+sGiH1m9QJTq5x
 clJmU6Gt3JPplEcLHfP8pUJA9yaTQXO69PgG03OtobtY9DhAzdbeYJwFCwkBUPU/NzE1
 WWdepP4BjjNvRgJ87l/whv8RVEHoDglEyirDv+00ZCcjgmX+QHH32DEYPY+ABSa+21KB
 9BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792057100; x=1792661900;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=r5G0BsDa9TUzuCzRry+HFI28e0hkmXpHpz9bsdrKKew=;
 b=DL7WWrUd+4WZw8eJ0o2XXQR5w2CBWdEP70jf+Ku7YabFxd4wedQQ48hMc5ik4W0G/c
 pBvjV2kYVPzxf6PHTfx5ZynWX1HCcd7jgJQlwPugK2kSnZpehD1zAU4f5NNebVU5Q1s/
 lZSHTH4e31N8ZsrlbzTXPmCvswC8QdAl1hige88XgnPncOue6lv1cdYp3AndV71NJyeu
 Epr/uOQtiR9K92nVC+dZH/KjSNJiVTajHg/MVVuRwJ9SQvlh2UI3OuhDruS2SD2iL1OT
 AUAvlwwh0dkg1f0LjVEuJe4AzgTVwXhgIYyaWNtwAodN58D17lRRGu+MWkCKFmiplS3C
 URYQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6+Sp5WSlwkY4g3tBl7GqB28n9UAczqouwm+r2U8zGHwwlhZPPXe9pl/6tuUrviQQJOUXVB/lIFQ==@nongnu.org
X-Gm-Message-State: AFq9FYI+eYSvuX9ADo1dl18aXoDSEeNwvCO7D1aLa8CAVvpzviSciTtN
 ADN2BFJE5rK7l5ljU/0tU8NgNf5MOuQzL/6FrUj/AhlD3mU7iJ9tBzTO0dVipYx5UNJqInG8Epe
 ffIm8iXNOeNWb9M4F35E8Wv/izLQBHMw=
X-Gm-Gg: AYBFou0FvaZ+J094uOyQffsBYUqCOtnJJkkS8ssswgUlOQMcv0pYWTsNk/uGRmWpS9T
 niaQJTKoLWQgiUjGRlB04PrS/zbqEzT876wujXPvLfv7zoi1QFVNEqxuZos0rn8RrqAC4CiOKgO
 5Lz1AaALS9SrAFolUNwRVn9RfVfcG8XhI0Xe7BVhRggrD/n8t23snp7BZ6Q0M9aEny1yiwblGYF
 N+BFBGyyOSw4jyWMXDQu1xrwF9BWlMmIUkChBVC16GWZbBUCFS6K2SXMmGzSR85EfKNcC6Sedd5
 2ZEyAqhxBbnA6JEO4g7STKiGya/ibA9kCfNgyyIvJbnuxTP17F432rBQQ0BCvFOwpw==
X-Received: by 2002:a17:907:c21:b0:c2d:cdc6:827e with SMTP id
 a640c23a62f3a-c31aa0a2ce0mr1864751066b.41.1792057100205; Thu, 15 Oct 2026
 02:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261015044104.879-1-luoyonggang@gmail.com>
 <CAFEAcA8n9E1jpcOCat0kzv0Q++x7YwK_MNJBJ0qGdtX1-As4zg@mail.gmail.com>
In-Reply-To: <CAFEAcA8n9E1jpcOCat0kzv0Q++x7YwK_MNJBJ0qGdtX1-As4zg@mail.gmail.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Thu, 15 Oct 2026 17:38:07 +0800
X-Gm-Features: AclHuK8ImpVzSLpzl3F37S2gKdr6BmHMTgfbVwm-E2c2iARD0v6BZKeBj8njzKc
Message-ID: <CAE2XoE-fgq_c9qONyvfbNi3Ys_hv7yKvGCkk+Wz+rHPW0p65Eg@mail.gmail.com>
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor,
 and Angel semihosting
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Cornelia Huck <cohuck@redhat.com>, Weiwei Li <liwei1518@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Bibo Mao <maobibo@loongson.cn>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Song Gao <17746591750@163.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>, Xianglai Li <lixianglai@loongson.cn>,
 Chao Liu <chao.liu@processmission.com>, qemu-s390x@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=luoyonggang@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Oct 15, 2026 at 5:20=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Thu, 15 Oct 2026 at 05:41, Yonggang Luo <luoyonggang@gmail.com> wrote:
> >
> > Put query-cpu-definitions, dump notes, monitor, and Angel semihosting o=
n
> > TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
> > Keep the table in target-ops.c and with a stub
> >
> > - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
> >   can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
> > - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
> > - Drop stubs/qmp-cpu.c
> >        stubs/hmp-cmd-info_tlb.c
> >        stubs/hmp-cmd-info_mem.c
> >        stubs/dump.c
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >  MAINTAINERS                           |  1 -
> >  hw/core/cpu-system.c                  | 23 ++++++++++
> >  hw/core/machine-qmp-cmds.c            | 27 ++++++++++++
> >  include/qemu/target-ops.h             | 59 +++++++++++++++++++++++++
> >  include/semihosting/common-semi.h     | 63 ++++++++++++++++++++++++---
> >  meson.build                           |  1 +
> >  monitor/hmp.c                         | 25 +++++++++++
> >  stubs/dump.c                          | 27 ------------
> >  stubs/hmp-cmd-info_mem.c              | 12 -----
> >  stubs/hmp-cmd-info_tlb.c              | 12 -----
> >  stubs/meson.build                     |  4 --
> >  stubs/qmp-cpu.c                       | 21 ---------
> >  target-ops.c                          | 49 +++++++++++++++++++++
> >  target/arm/arch_dump.c                |  8 +++-
> >  target/arm/arm-qmp-cmds.c             | 15 +++++--
> >  target/arm/common-semi-target.c       | 26 ++++++++---
> >  target/arm/meson.build                |  7 +--
> >  target/hexagon/common-semi-target.c   | 26 ++++++++---
> >  target/i386/arch_dump.c               |  8 +++-
> >  target/i386/cpu-system.c              | 12 +++--
> >  target/i386/cpu.c                     |  6 ++-
> >  target/i386/monitor.c                 |  8 +++-
> >  target/loongarch/arch_dump.c          |  8 +++-
> >  target/loongarch/loongarch-qmp-cmds.c | 15 +++++--
> >  target/m68k/monitor.c                 |  4 +-
> >  target/mips/system/mips-qmp-cmds.c    | 15 +++----
> >  target/ppc/arch_dump.c                |  8 +++-
> >  target/ppc/monitor.c                  |  4 +-
> >  target/ppc/ppc-qmp-cmds.c             | 15 +++----
> >  target/riscv/arch_dump.c              |  8 +++-
> >  target/riscv/common-semi-target.c     | 28 ++++++++----
> >  target/riscv/meson.build              |  4 +-
> >  target/riscv/monitor.c                |  4 +-
> >  target/riscv/riscv-qmp-cmds.c         | 15 +++++--
> >  target/s390x/arch_dump.c              |  8 +++-
> >  target/s390x/cpu_models_system.c      | 15 +++++--
> >  target/sh4/monitor.c                  |  4 +-
> >  target/sparc/monitor.c                |  4 +-
> >  target/xtensa/monitor.c               |  4 +-
> >  39 files changed, 428 insertions(+), 175 deletions(-)
> >  create mode 100644 include/qemu/target-ops.h
> >  delete mode 100644 stubs/dump.c
> >  delete mode 100644 stubs/hmp-cmd-info_mem.c
> >  delete mode 100644 stubs/hmp-cmd-info_tlb.c
> >  delete mode 100644 stubs/qmp-cpu.c
> >  create mode 100644 target-ops.c
>
> Too big a patch touching stuff all over the place with
> insufficient explanation of what it's doing or why.

Oh, sorry, I post is just for demo(DRAFT) for other place to
reference, but git-publish have no way
to title it(maybe because I use it wrongly).
>
> thanks
> -- PMM



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

