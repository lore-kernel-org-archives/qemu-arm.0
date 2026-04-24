Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDA3FF8850
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 21:38:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGODi-0001AR-Ue; Fri, 24 Apr 2026 17:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wGODe-0001A4-TR
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 17:37:51 -0400
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wGODb-0001cA-1m
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 17:37:49 -0400
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-12c565476d7so4945347c88.1
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 14:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777066665; x=1777671465; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=269qtn7cPdtGhV6FdZFqbMCD2iQK4aW+opNK6I11K+E=;
 b=pEHcIBC98Y6N91JMzke+BAivjBPwsnfNhI+cXWyYQNBTmcfXzFwv/P1uFhTM8mJNb4
 HNbxSnNhMJIF2I7vBihSEK6A9fmzwVkg4YI6IPK36d1pnnhtE7D6WArSOw1abbPYNHrl
 kkhir3vR7EBT55wsEfbu8NCH4m3O6tV+O+w+DqsMR147K1ixeh16QswCeSJbPZNwEG/h
 dquSC5/QbU2VBxyDIsnQZ/UfB8VhvNoRQhsKc+nZhaGNSd5iT8JW4M3CW9/VO6w7hSHm
 6k7lJzTKE6EXGAdRqF0WxOr70sAVvUTlAS3YOcrI1sVyvzd9SwWRnS2haiv/DKJEw9Lz
 SVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777066665; x=1777671465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=269qtn7cPdtGhV6FdZFqbMCD2iQK4aW+opNK6I11K+E=;
 b=ZjZWjHRm9PyXDEwD+iIC1iq2aRswALyM8q9E644Z4P/cFPODFSkVmJP1XkXHAhaOOd
 g2knhayAXsYpWyaVlGuYGFMHY+Uh4rPPjUM8h4fQrq1wowVSBaHpo/e7o1HfnT9am+gd
 n6WYNNwY6pYP9PJks8R2clVcGPuEFnHeyI+RDBkFjmRCOoP9+aJ1c/luaDv407I7Ome1
 kpsU+mxjp8Kf8FX+85c/Vv7OU7SpsVDVRFAU5iB7NScPQiO/iZ3l6hNZR0iG8C4qw4GJ
 zxSplght1UiHRR22Z4PgLCfxnkMY17EVqY/2ZMkyP3OSLNOtjRTs2ruG7OeoMccVyt74
 C2Tw==
X-Forwarded-Encrypted: i=1;
 AFNElJ82iBK1n6fkhqhfsRZU/gE9UhFYKG4estqR5EgrPQzsZhi2/lYPRznRxV0myhhlQg8VAtkIfiwgoA==@nongnu.org
X-Gm-Message-State: AOJu0YzXHlT3eSKrPg0U4JPLmKSbawVeNWn5hSrTMhK1iGUbfVfmo20m
 /AAjx5rCIMpYjtmIX2SHbbD60KXfkTB4pq3SJycGUcvrPoS/7HhmsC78
X-Gm-Gg: AeBDievLBEAhLtyynhEdvSb+ZazYZRS/4w2abWxFb5PcXp7Zs7F796qbI3+LUFQWjAY
 dt9kCMdec6JOGCD0Z15hiw8pqtPxChrKt059+8yXpc5tNvqZVGCbYGfac5QFGgy/sXHRf+yi/K7
 8IPNoNwv5CeetAu8X/ZJUyM/noKcXnFuvypjc/wp5oJfZgwg14eh7MShIJbbhmjByq/oqTdVJuq
 M4j4mE4xJAu7wKPdgYpSmnMSOyhRz6q0KN2H0cDz7+OFyCCQSs2g/npdjmFmKRd5ZGBmUNeV9eM
 /hdCwHcySHsPNsiyE4LRfKG9yDzGW11itqPu1z5B+rUjDT96m5Onn2w0JJIixd7VCYv0/9RNE6B
 mWIi5/MKdunUpTyh53BN/VBjTkNfp1xxh6A45Ylo+vqTZ762azz0TKDzAwAlsy1MpgxkJQxbey6
 AtUqA5J1UuNFYhokJNbc2IRhptPDNdRvqNLunD8KAg40PZ8yppvJQeLNYhsbLPAEKK40YILMQks
 g==
X-Received: by 2002:a05:7022:23a0:b0:11e:163:be60 with SMTP id
 a92af1059eb24-12c73fadd10mr18223648c88.31.1777066664943; 
 Fri, 24 Apr 2026 14:37:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:44a8:6c9a:9faa:5f6e:c92f])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12dca2c1c16sm2390350c88.5.2026.04.24.14.37.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Apr 2026 14:37:44 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 1/3] virtio-gpu: validate host page alignment for
 MAP_FIXED blobs
Date: Fri, 24 Apr 2026 18:37:38 -0300
Message-ID: <20260424213738.45385-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <875x5gwtxx.fsf@draig.linaro.org>
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
 <20260317175744.32469-2-lucaaamaral@gmail.com>
 <87mrytwo8h.fsf@draig.linaro.org>
 <20260423234415.7753-1-lucaaamaral@gmail.com>
 <875x5gwtxx.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122c;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dl1-x122c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2026-04-24, Alex Bennée wrote:
> Well we at least images for the Linux side which we can use. See
> tests/functional/aarch64/test_virt_gpu.py

Good pointer — that infrastructure should work. My local reproduction
is even simpler: a plain Ubuntu 24.04 ARM64 image, unmodified, with
stock Mesa. The failure surfaces immediately on:

  sudo vulkaninfo --summary
  sudo run_wayland timeout 120 vkmark

Without patch 1/3, virgl_renderer_resource_map_fixed() returns EINVAL
on the first 4KB-aligned blob and the guest renderer falls over.

> I wonder if TCG guests will also fail?

Yes — the MAP_FIXED requirement is a host kernel mmap() constraint,
not an accelerator one. The patch 1/3 guard sits in the
accelerator-agnostic path and protects all configurations, including
TCG.

> A lot of moving parts, do you have a rolled up branch I can test
> against?
> Any rolled up branch for this set as well?

Easier than a rolled-up branch — the three QEMU series apply cleanly
on current master in any order:

  Stack A (ISV=0 emulation):
    https://patchew.org/QEMU/20260409220614.65558-1-lucaaamaral@gmail.com/
  Stack B (this series):
    https://patchew.org/QEMU/20260424000544.9617-1-lucaaamaral@gmail.com/
  Stack C (Venus without OpenGL):
    https://patchew.org/QEMU/20260317182049.33848-1-lucaaamaral@gmail.com/

Renderer side just needs current virglrenderer main — the last macOS
Metal/Vulkan MR landed yesterday.

> This is a bit of a challenge - we will be loosing CirrusCI soon
> which has our only real MacOS build test. Either we get someone
> willing to host a custom runner or we need to find another CI
> runner that we can plug MacOS tests into.

Acknowledged — separate infrastructure problem, but I'm happy to
share my macOS test scripts/workflow if useful, and can ack-test
macOS-specific patches locally on Apple Silicon when asked.

Thanks,
Lucas

