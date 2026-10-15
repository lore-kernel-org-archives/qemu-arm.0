Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1616CC6B34
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 09:20:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHHdI-0006Uw-7f; Thu, 15 Oct 2026 05:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHHd6-0006L6-Vh
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 05:20:05 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHHd4-0004Ye-56
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 05:20:04 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8ac4806e210so35558687b3.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 02:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792056000; cv=none;
 d=google.com; s=arc-20260327;
 b=UCm101fm31/5C/sI2Cq6uQY7z9HvskJNWZbECmdmD9lJHbcN30rqv1JG9wirkwhFKj
 IJcVk84NC0YpT4UW1SRLHFj65uFViyIS5TzajNVFFUsW+mBFMeh+9K0eTllPU/pxf+Tt
 UqYS/yXg3OHKNo4Lk76ueLqbjMWK5DhG1xc8W17MHdYH4/cNhNSNxjPhAa28jxYVw/fu
 gTARlur5x5MEK8rkTGSoeRp5f4mo7fJOchZN/LaeHlA49xCxZXVy3d3Y+8FphsIoZaUk
 YdVQDiFXEJ68wVaHg9vYN+7vcRR2lMb1tn4yWRakK9iKxBjA2zOsnd1pTINm843IfO5s
 0fJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SZ7Y1+FBgY5Dl+mpVpiMYC1qCKS8oNM9QTtedf58UOc=;
 fh=CX4311KdVzUNm3sKXXr5J4vGEldyADjbgMyYtNHnl0E=;
 b=Y3PRy6g4Trup/mSn5LrZYmjmFanx3wjC3aU/q+WYtOeXuggWJTBmnJ1qcDA9LlB4NL
 PIqN/PmupXQyUl9vrH3nyaygzWwghHAM7iy1Nvglrj+477p0ZQ4Lc4J1bBgfjN9586gE
 Vo2flJ50OjnaAZ9rUONbxy8yIhmjni5bX244zi42xdZvC3csVD/IlMNeOgO7PyYliTVa
 5q+jqsScvpTGt8oZBHvCKeMkRVDff3gEdr/FU547ZQMV1+i96k5XdY8gsY1PthFbQNTD
 sXqYiqPOD0ee1NqbgMN80BeOgVbG1vdmTkyQT7rcwBuf4vLMPnW2Ckk4MrRB6V6gFBnG
 NvEg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792056000; x=1792660800; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=SZ7Y1+FBgY5Dl+mpVpiMYC1qCKS8oNM9QTtedf58UOc=;
 b=xqZtIz1zkmRPR8RmaBaA0SkkmtGtFIF4A6NX7HX6f3KgBI3IbqZgRsCpP3LAfgVKh8
 AVpwNwCna+4lNQ2lS6BO5Fm6LI1RTtcjty72iYH1CC4H/iCagpWvxLhpqC3R0cUcreCL
 bHzNIJr33gpHoWG/tE3S7DLxWJW5lZ8xt3xCFwth/sdGwWiqjL7VGuTDCKOGuh+jqul0
 9WekJlY8eZzei435kOcwTS965nckK4gh6TT//aGb4Z1TkU2AUPN6Jw2LWnZa6ycmm4nj
 VPnQ6Q8toCy/heW6A6n9h/q4eCk9cfe0pmkXnm86elr+dWOYjZdJp0/WBfu7jnetfb5J
 +egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792056000; x=1792660800;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=SZ7Y1+FBgY5Dl+mpVpiMYC1qCKS8oNM9QTtedf58UOc=;
 b=prM687ygF+lN5x0Hvg+qjpGWWiBu9BmxDexyW1bwtMpWQcVo7WTaQxIPsyaTa//sCg
 Z+fjBbliR3Iaznh/i5nI4Q0MDmqrc8EynbcgkSPOp7Q7cVpBUIGldx7uokXKjh7+05gi
 9uEgIonyNrR3Xs4TenMpvsgCdTsfcmfO1lZYmNw4gyp+y9fsIs8+Mp/of24THce0zinL
 A7FybP9uH+cTEpFXx8dkfY2dJILApRjXTu2P5zj/ejQQ0RjD0CxkXlOxyQH+kWwaWWgN
 BXsEGI/QJQvPSPbpoUqkZUFmF+2EzEOUvk/YPEoOVr1l8KrpPLQCj1BmM/lz46ZNIuhM
 0xkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwz967Ci+WcQYmicBkgYtZt/wzIvGI4/MzbdJjLQ0fsDixrjzhFY5/yRGwQhLfnHH3kVGtrMEHWTw==@nongnu.org
X-Gm-Message-State: AFq9FYITjSjdx4SeXXKvzeMoz5ogudkYefHbIOexO02KQyym4hS7H22e
 wH+L8SAwNUiHyCU9uX+qbNcS0MGF/37YjMPPisOmtFxhaTJy6Lx+X62lpeHLYqslkB3m/4L9O0v
 gGDOCLu2WWgMHPTxveSXZuQTgErEy7sh0Pjr9X+pm5w==
X-Gm-Gg: AYBFou0grm1UV+KnWnL5MTW1x+a5TMQCkF1hQz8oWwxypBMp50z1LXbV6JS5/V9NlNL
 llc7n13e1pSHCtsZT4d8Iv/tDjr00uz6wefO5U2blENrILSoZlsD2eqU4dcxNtQCFvXm3kGdIY0
 AG3ZqXbz2yubnCtEx02sxz7MGVVYJQG0Dc9KhdiLRBPlRJ7cZX9GwLT+dvZ9z8mdWF+RPad3/93
 U0elGgOhmYUAoxetOo6YEwboHUJjtLwprpn8JtOe26vtgQhosstxkh/HwCAc811cS3bQxbmySt0
 vFOzea+pI6l12xjLtegaNE2IrdgeqlvuHQlkuqG5nE73FTOyRrtr9yMXrqvQgAB768qVi4qGxsz
 EDCqjhTfVtfee43jniotPtqGf9oM2esCajb4LpMg=
X-Received: by 2002:a05:690c:c505:b0:8b0:a957:80bc with SMTP id
 00721157ae682-8b0a9578579mr42236477b3.40.1792056000217; Thu, 15 Oct 2026
 02:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261015044104.879-1-luoyonggang@gmail.com>
In-Reply-To: <20261015044104.879-1-luoyonggang@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 10:19:48 +0100
X-Gm-Features: AclHuK8gM5bUiFgbG3d7VBzzzSM1hm7hlcc99eksUtYmNJT_j9_3Kh3RVwsNUig
Message-ID: <CAFEAcA8n9E1jpcOCat0kzv0Q++x7YwK_MNJBJ0qGdtX1-As4zg@mail.gmail.com>
Subject: Re: [PATCH] target-info: dispatch CPU QMP, dump, monitor,
 and Angel semihosting
To: Yonggang Luo <luoyonggang@gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 15 Oct 2026 at 05:41, Yonggang Luo <luoyonggang@gmail.com> wrote:
>
> Put query-cpu-definitions, dump notes, monitor, and Angel semihosting on
> TargetOps[SYS_EMU_TARGET__MAX] and look up by target_arch().
> Keep the table in target-ops.c and with a stub
>
> - Register with a QEMU_ARCH_* bitmask so shared base-arch objects
>   can fill both slots (e.g. QEMU_ARCH_ARM is ARM|AARCH64).
> - TARGET_INFO_CPU_OP is type_init. A NULL member means no handler.
> - Drop stubs/qmp-cpu.c
>        stubs/hmp-cmd-info_tlb.c
>        stubs/hmp-cmd-info_mem.c
>        stubs/dump.c
>
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  MAINTAINERS                           |  1 -
>  hw/core/cpu-system.c                  | 23 ++++++++++
>  hw/core/machine-qmp-cmds.c            | 27 ++++++++++++
>  include/qemu/target-ops.h             | 59 +++++++++++++++++++++++++
>  include/semihosting/common-semi.h     | 63 ++++++++++++++++++++++++---
>  meson.build                           |  1 +
>  monitor/hmp.c                         | 25 +++++++++++
>  stubs/dump.c                          | 27 ------------
>  stubs/hmp-cmd-info_mem.c              | 12 -----
>  stubs/hmp-cmd-info_tlb.c              | 12 -----
>  stubs/meson.build                     |  4 --
>  stubs/qmp-cpu.c                       | 21 ---------
>  target-ops.c                          | 49 +++++++++++++++++++++
>  target/arm/arch_dump.c                |  8 +++-
>  target/arm/arm-qmp-cmds.c             | 15 +++++--
>  target/arm/common-semi-target.c       | 26 ++++++++---
>  target/arm/meson.build                |  7 +--
>  target/hexagon/common-semi-target.c   | 26 ++++++++---
>  target/i386/arch_dump.c               |  8 +++-
>  target/i386/cpu-system.c              | 12 +++--
>  target/i386/cpu.c                     |  6 ++-
>  target/i386/monitor.c                 |  8 +++-
>  target/loongarch/arch_dump.c          |  8 +++-
>  target/loongarch/loongarch-qmp-cmds.c | 15 +++++--
>  target/m68k/monitor.c                 |  4 +-
>  target/mips/system/mips-qmp-cmds.c    | 15 +++----
>  target/ppc/arch_dump.c                |  8 +++-
>  target/ppc/monitor.c                  |  4 +-
>  target/ppc/ppc-qmp-cmds.c             | 15 +++----
>  target/riscv/arch_dump.c              |  8 +++-
>  target/riscv/common-semi-target.c     | 28 ++++++++----
>  target/riscv/meson.build              |  4 +-
>  target/riscv/monitor.c                |  4 +-
>  target/riscv/riscv-qmp-cmds.c         | 15 +++++--
>  target/s390x/arch_dump.c              |  8 +++-
>  target/s390x/cpu_models_system.c      | 15 +++++--
>  target/sh4/monitor.c                  |  4 +-
>  target/sparc/monitor.c                |  4 +-
>  target/xtensa/monitor.c               |  4 +-
>  39 files changed, 428 insertions(+), 175 deletions(-)
>  create mode 100644 include/qemu/target-ops.h
>  delete mode 100644 stubs/dump.c
>  delete mode 100644 stubs/hmp-cmd-info_mem.c
>  delete mode 100644 stubs/hmp-cmd-info_tlb.c
>  delete mode 100644 stubs/qmp-cpu.c
>  create mode 100644 target-ops.c

Too big a patch touching stuff all over the place with
insufficient explanation of what it's doing or why.

thanks
-- PMM

