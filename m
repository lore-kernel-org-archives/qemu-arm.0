Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0514EF36BAA
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 05:20:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wB4Hw-0006Mh-JN; Fri, 10 Apr 2026 01:20:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wB4Hw-0006MS-0E
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 01:20:16 -0400
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wB4Hu-0005NV-7n
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 01:20:15 -0400
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-2cc4c693d59so1609576eec.1
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 22:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775798412; x=1776403212; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JeRb9OZMxqyROpUwNt/lYm+VexS0qBiKUzLUseP2hEs=;
 b=E0pG1cChPFA6hbxntZsky+61GpXVY3abNlia298RJmWrugP1f5yb9IhEHyV+DKyeY6
 3+v3Cnjqw3ZQJy2xzJXQ1FQcSlQHq2/5jdeteofVVqc06kSUY1YIYCCxH6TX0VGo12nT
 s9bt7Yhi8LCPG5/r/Ce8hL2xko7Jj1hFJVpU9ZJpYjf5EjPzAEkLHAH59Zr8H+2yQbxs
 8MnUI72f5V/iGDz3VDe6KsFAifTcdoEZc/kajQ2RwcpoL3VclYulVH9mcUJxCZDQMgpp
 EpbWPIgPvqDKyypZug55xdH42hx8z8JXUkAHCW8sChJhINXdGdWdASwYSepb1IIAIwPe
 KQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775798412; x=1776403212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JeRb9OZMxqyROpUwNt/lYm+VexS0qBiKUzLUseP2hEs=;
 b=YgRMtSEQ6n0qE0eRqCDJO8XvP8qzJLCTtkBivxOGn6o26TDw0yP7qXt+YS6ybBOL+O
 Hmp75144VH6EV3gZGZjde3kau6uY299fJPGAoCYkXT3okpg2lGEHec35P8z9Xh3+CG+B
 /gn4wIAZxLPT+8sdAMRjKfwwP2M4YN604DFy2iuhdIHbFuviBjAIMI7KVvsOjgBjHWTb
 j5kwqPhot6CGDImVh6Nu2StE1uPdhdVCRK6JWXNTY6RUnzeA3hwQJmFUlzrChGRCx9VQ
 s0JqfuND9o/K6w4z6iqip3ljIePBRGbSN9soULHCEVnBPiGZdsXHMlPbkIrCizyVjExl
 NloA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVaWIN7YzVt/VHGp4qWAVkCHNKjfBGmhH9eCErQBbbAPjdMTdDX7QE5H6SEdPuVwIhv/g9nfhAOA==@nongnu.org
X-Gm-Message-State: AOJu0Yzi1eZfRf82x/k5Gv8BK1RG+4C3tzPBJAhorwEp5gw/IVyuhrYo
 pVGN7YSA9vJg0c20/RshgxUEBkSvgOcoFbGCWf0umO1/2Jdc02Trfw3S
X-Gm-Gg: AeBDiesrvB1LDplVB4K39Fvg8WWR4jXD8fE60zgrOh5b4eQ/dKNdFqW34kEDQDQIJ59
 V1tCRYvag0aTcVlDBzlbstiJoxXy3qMWm3BbsqgusrZ7WzeAOe1QMJnAg2c3tOrztSVAiQAUM/v
 akJrMSSw0Ddtf2KJ9Q0cfb/nqvP0cflFg5nZEszngVx0Ilc+NOnwJzxV7dGYnYv2VHCy/K5KBsL
 X7ZM/wKy8+JKDe7SKVNepL43UoqvkbkDPc28QvOXpn92ATp2ZtBlW4wCc7thqPzJrkpnC4gFkPm
 zmJmssQTZsw4NK01wv1p3jB5jDKbH/jizmBou9rToxNE+449iHILM3f3BeHnbrqjXvjmAXFlzy1
 nUy2rwEwKRTY4xToFC5peFKwd9VZA5SInAlw5CC1rzCrj750QtiWvd5EXD/Yli1+144XU2DntL6
 bQmjLhLcixGnYOzO5n+NxUx7C9AvTe3w/JQR2u364dXd1IOyKs6XsOHo32dclFrw==
X-Received: by 2002:a05:7300:e82b:b0:2d2:129a:1682 with SMTP id
 5a478bee46e88-2d5881ad24emr1107412eec.16.1775798412080; 
 Thu, 09 Apr 2026 22:20:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:bb40:195d:78fd:ecba:d45])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2d561bde70csm3407253eec.15.2026.04.09.22.20.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 09 Apr 2026 22:20:11 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Lucas Amaral <lucaaamaral@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 alex.bennee@linaro.org, richard.henderson@linaro.org
Subject: Re: [PATCH v6 0/6] target/arm: ISV=0 data abort emulation library
Date: Fri, 10 Apr 2026 02:20:04 -0300
Message-ID: <20260410052004.79395-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <4303E81D-5539-4666-BBE8-BA58E3F72B6F@unpredictable.fr>
References: <20260409220614.65558-1-lucaaamaral@gmail.com>
 <4303E81D-5539-4666-BBE8-BA58E3F72B6F@unpredictable.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Mohamed,

Thanks for the thorough review and the Reviewed-by tags on all six
patches.

On the observations:

> [1/6] Perhaps having a common version of this for fetching the
> instruction

Good point. The ISV=0 wiring in target/arm/hvf/hvf.c and
target/arm/whpx/whpx-all.c still uses cpu_memory_rw_debug() to fetch
the faulting instruction at env->pc — Henderson flagged this for the
library code in v5, but the wiring code was out of scope for v6. I'll
investigate factoring out a common get_phys_addr() + address_space_rw
helper covering both call sites and send it as a follow-up.

> [4/6] Do people actually use [exclusive load/store on MMIO]? And if
> so I wonder if that's an application bug...

I had the impression that virglrenderer hit this early on, but I'm
not 100% sure of the exact case anymore. The v4 emulation library
tried to cover the most likely ISV=0 triggers — load/store pair,
register-offset, exclusives, atomics, CAS — without fully exhausting
the ISA. I might double-check what actually exercises this path in
practice.

> [5/6] Maybe there should be a restriction to put a warning message
> somewhere if an op happens on a non-MMIO range...

Agreed, that would help debug guest issues. I'll look into adding a
warn_report_once() when get_phys_addr() resolves to a RAM region (vs
MMIO/Device).

I'll send these as a follow-up series once v6 lands.

Thanks,
Lucas

