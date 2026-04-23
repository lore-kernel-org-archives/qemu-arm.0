Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB6AFDEE53
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 23:45:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG3in-0003Rc-PT; Thu, 23 Apr 2026 19:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wG3ib-0003QX-SF
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 19:44:29 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wG3ia-0006tG-6t
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 19:44:25 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-12c726f46baso9114555c88.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776987862; x=1777592662; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BAdHLWnuSeVBWefsBC1Hxr6LizTZgQKhAWmdD64qU78=;
 b=kHCpbX+FAkKVc0p89Rn3vFMp4DWfiqgr+hMk9B5LEI9jZtAWngY9D/1i+wQ7kxIlQs
 BTMuKr+RvV/rBDud10zta91ceQ0OWUSwOJIAMqTs7x5OGcAPC5HG4hadPSTCGtE82iog
 uPmyOSopBXe+5T34lkk+F8840lmCM95Sjk4lVuxMaLWFfQEPtp/1xoNbs/ZfVYX1mKgT
 KZt9Dxa7XeYzopZ7sE/C3vjtsaciQsNZ2ZqxSeES3SMNdQ+Pc5m1LCcC2iCLPQC3Xmlz
 GCG2xMoO5sTF2oqc6yFqwTgdfMPe9yEc1FDo1TwSsHTIUVeIqSw5G7/coudH+pS+isv0
 SnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776987862; x=1777592662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BAdHLWnuSeVBWefsBC1Hxr6LizTZgQKhAWmdD64qU78=;
 b=jVm8q3eFPe/f3CfSunx2nN21o79+92v3HIunyR76e/wM7/bKLouXs4FWHTOUKhpep1
 nzjaW4QSDuwWZLQfjD8eohCuk1iOyEBMWzOMJx4EqYXzq/xQs7MipGS67660UWbFHfRA
 8H9LPQu5ko2DfQyWZ/QCb/M4WrJnU/ZW+3AT7evSl7IeL/vuhwEU5keqqWae3Z2mYJ59
 3FHf02svtMJhQRwotB78uTdsXUNEgDeSCZfS1Uu+9iJ7orYYP4mSlMKE70kWAcCIRp/Z
 gwIOOBcL/5O2nI6QjGRSCMbjND8e8+LvTJoR33hBe0WgLYJUEtTEGZZV4lSduFafo87M
 m3DA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ELpJaXJRHIOVT3cgvRaWNNpY2f0qddJNwA5TKFLUPkCiXbAeVuVkdsmoRNR2Tg8BG8g8aVikI+g==@nongnu.org
X-Gm-Message-State: AOJu0YxpBC0i1nmwGLG/nGZzsAXpNWJuJO1Qj0fxAerkfEQDyEv2pAb1
 gZrbB6B3kkp4I/p/1xYrg7T6g9ic26IMdDETjPHPLLZpcesR7/PY5WMN
X-Gm-Gg: AeBDiesufXmNH2EFodf5e8ZFSSNKLO0ZGn7lGwJcFNdC/wwGAsKb8aNV3phH+HiQ1Ai
 iCKop3ptDr1n++LmLVg9x1K3gO8aFR6vcYxpNYs4ldf2xi3Yi+Bs+9YMRTeAAQRMQUHyBuz8zVB
 xFOpSzcDnqPZHDf01FXbYHZFk9d5HwgpUjw5kz1IbNhymzU193dgrgol+YZq6GBnMcBipGQ2WZU
 5MhdwveB6iartG5uZOV4p4AGOjUMwWdC6auvbRvfUqJ8J1TTjqJ73EbY9Eozw5SR1/FDbXsGmOu
 CVBKiIDEwBsi8ciBgkP8qbajOnlGQj8P1MuNkmPx5wSmEjpoG2u8v/vWU6S0uTaC/RUXf/lDddb
 ORznv5gbN3e0oJfozo0hzYZTvebtODQ08QZGdTHeQ/urD/jxKB4zABT+aULq3ceoQ6DCuX3BASd
 R2UoP0mRX+3/uwX4pTboFFn4sgdc44WysJIDV2Itydre4SEfq0lrZjnSoyFrZTs0mWrAuousVC
X-Received: by 2002:a05:7022:1e03:b0:12d:c3fb:14a7 with SMTP id
 a92af1059eb24-12dc3fb1703mr1346396c88.18.1776987862361; 
 Thu, 23 Apr 2026 16:44:22 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:44a8:c4b9:45be:963d:f3a])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12c8caecebfsm20202580c88.5.2026.04.23.16.44.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 16:44:21 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Lucas Amaral <lucaaamaral@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, agraf@csgraf.de,
 mohamed@unpredictable.fr
Subject: Re: [PATCH v4 1/3] virtio-gpu: validate host page alignment for
 MAP_FIXED blobs
Date: Thu, 23 Apr 2026 20:44:15 -0300
Message-ID: <20260423234415.7753-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <87mrytwo8h.fsf@draig.linaro.org>
References: <20260317175744.32469-1-lucaaamaral@gmail.com>
 <20260317175744.32469-2-lucaaamaral@gmail.com>
 <87mrytwo8h.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1233;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dl1-x1233.google.com
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

Hi Alex,

Thanks for looking at this.

> What was your test case? Is it possible to publish some images for a
> functional test?

The test case is running a Linux VM with virtio-gpu Venus (Vulkan
passthrough) on an Apple Silicon Mac:

  - Host: macOS ARM64 with 16KB pages
  - Guest: Linux ARM64 with 4KB pages
  - GPU: virtio-gpu-gl with Venus/virglrenderer + MoltenVK

When the guest allocates a blob resource with a 4KB-aligned size,
mmap(MAP_FIXED) fails with EINVAL because the size isn't aligned to
the host's 16KB page boundary. Without this patch the blob resource
is silently unusable — the guest sees no GPU output.

Reproducing it requires the full macOS Venus stack, which includes
patches across multiple projects:

  QEMU (this series + two others on the list):
  - Stack A: ISV=0 data abort emulation (v6, R-b by Mohamed)
    https://patchew.org/QEMU/20260409220614.65558-1-lucaaamaral@gmail.com/
  - Stack B: this series (hvf map granule + MAP_FIXED alignment)
  - Stack C: Venus without OpenGL (v5)
    https://patchew.org/QEMU/20260317182049.33848-1-lucaaamaral@gmail.com/

  virglrenderer (GitLab MRs):
  - MR !1600: macOS build support (merged)
  - MR !1601: posix_spawn worker for macOS (merged)
  - MR !1602: Metal shared memory (R-b by Yiwei Zhang, under review)
    https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1602
  - MR !1603: SOCK_CLOEXEC/MSG_CMSG_CLOEXEC optional (merged)
  - MR !1607: server preparations for macOS process model (merged)
  - MR !1608: Metal vulkan header roll (merged)

I don't think a functional test is practical for CI since it requires
macOS + HVF + MoltenVK + a guest image, but I'm open to suggestions.

Thanks,
Lucas

