Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1926EECD9BF
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 04:22:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voDM6-0004Iw-55; Thu, 05 Feb 2026 23:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM5-0004If-6V
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:05 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM2-0003Pm-2J
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:04 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-81e821c3d4eso1457458b3a.3
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 20:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770351720; x=1770956520; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GWiowObtYe31NsMaSO/9YqeYyqvmY74xvGzJVT9wiZ0=;
 b=D0H4Nj/Z4dkRPYt1ULbWHV7UdQFdIu/doumHnwNKetlCbigRyNiQpZyalshInQO9q0
 Ri6A4ZNq7TtVNzz+lJXsFFC14lOsLxcYNQfA+9SAJPkc9wJzTQ4FvL9CET58UMI+fijY
 UR4kin9J1yJnyzcztQw+gC/SjmyT9t4c0c8ZnE0GL1L6owS7QpaHONOfS5l48BVLZ7LH
 nVqVSeoQXyO1CoUCoK0ESHEsy1GZ22jPzkimjg9gmw26IHY67DOCha6Oz6E1npRF6RGC
 aVT3tcW5aBBbytmUtw8ouDG58TaIzv4foMILa/Zi0crcQxp2OXtAjWUjl/nD8yPDTs2p
 Y8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770351720; x=1770956520;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GWiowObtYe31NsMaSO/9YqeYyqvmY74xvGzJVT9wiZ0=;
 b=TkuvFxjl2TeeR2nsqFkdyLHxcQQioCyLTGzzYBof8MkzXqud40pLlmxKAXlDjoO+hV
 APxicM+FvbF+Sq5PMyxpBQ+ORodYvTU54IaXL9g2NBEr5inKs+tR5evrSQdYy75AeqAU
 ZBGliiqnyuNw24oJB/psX4r+3hOnoiy7UZGaHh5gcCJiKYaRyg1nleTPAppd0Yv4KtZ6
 dG03qCh1DhNf1bgDYj84y0s9AfBOSbKxw19QPGpu1EVlcyM3P1CQqXZ4QAFXe309KkGi
 P6/YQNFaKY7B7XYJnM2HMfpuv8E5YwpIgCC5grxCZM+pDCmHdFK90QTv3XwzO3ZFpUU0
 YoXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiDoftHHuZiWUdFY8TdiTQ2t/n5QHklBnaFR774xK+qVqhoDTcIjskbNC8q3uTk+6IJrFdda7gjA==@nongnu.org
X-Gm-Message-State: AOJu0YyDvp2Xr9j4+HPdkcrHsVCnUjwAcVv9yifILZQktJw/KKdrE/6w
 xTm6aD43hKYOjBDtwIxd6z8VcV+P7xIAy+JsheBADg0fWCwnJh+QkCqREwdVgDJx0eY=
X-Gm-Gg: AZuq6aJ/pn0AKBqqql83RwbQr5CW4yFwodpQV2XQLo4t8knGKKXGPFibMeBEvGMekRy
 Q9KOaqxwJ0sZj0523Mh3w+bAbbAnfmCUpc+CuKd7VZVLHjBTJ40Fbbk/0iZHY3ik9MKQWRt6PmP
 U457Tsf5cIW/BkT/x7ssQo3l91lhXr/J+L0U0T546ZttHR+feSqlsWPM6lGQrfjJZUx9krO1pPy
 A4WJ90eW3ZM/tZxUexZNXOdSqIh+zwhynWSrjF2p5RbsbRcyKOkvRLEvNs3KQPJ4hQlG+EXRA26
 ugikYQeid9CNIfn7MGMezzMhsKBhY/aBMtH7QF959i/ysJQvr8q1Q6vgTH1qZCd2UvYQBKRU+IB
 a2M7TSCXryPOTVccg2XcEsOTJ0xGVoZOyIduKTyLQmGqitSuVoYqLs0OZIvhGOAt5lTWrAlvWZl
 vysmCCVJPZAXNImXth07bWPafAulXnVTM39/yYjsp0QBKJg64NtD+Mq6pVEA/Fi9QI
X-Received: by 2002:a05:6a00:3997:b0:7e8:4433:8fb9 with SMTP id
 d2e1a72fcca58-82441773041mr1246675b3a.65.1770351720150; 
 Thu, 05 Feb 2026 20:22:00 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8244168fdf5sm926914b3a.17.2026.02.05.20.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 20:21:59 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 00/12] target/arm: single-binary
Date: Thu,  5 Feb 2026 20:21:38 -0800
Message-ID: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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

This series continues cleaning target/arm, especially tcg folder.

For now, it contains some cleanups in headers, and it splits helpers per
category, thus removing several usage of TARGET_AARCH64.
First version was simply splitting 32 vs 64-bit helpers, and Richard asked
to split per sub category.

v2
--

- add missing kvm_enabled() in arm-qmp-cmds.c
- didn't extract arm_wfi for tcg/psci.c. If that's a hard requirement, I can do
  it in next version.
- restricted scope of series to helper headers, so we can validate things one
  step at a time. Series will keep on growing once all patches are reviewed.
- translate.h: use vaddr where appropriate, as asked by Richard.

Pierrick Bouvier (12):
  target/arm/arm-qmp-cmds.c: make compilation unit common
  target/arm: extract helper-mve.h from helper.h
  target/arm: extract helper-a64.h from helper.h
  target/arm: extract helper-sve.h from helper.h
  target/arm: extract helper-sme.h from helper.h
  target/arm/tcg: duplicate tcg/arith_helper.c and tcg/crypto_helper.c
    between user/system
  target/arm: move exec/helper-* plumbery to helper.h
  target/arm/tcg/psci.c: make compilation unit common
  target/arm/tcg/cpu-v7m.c: make compilation unit common
  target/arm/tcg/vec_helper.c: make compilation unit common
  target/arm/tcg/translate.h: replace target_ulong with vaddr
  target/arm/tcg/translate.h: replace target_long with int64_t

 target/arm/helper-a64.h                       |  14 ++
 target/arm/helper-mve.h                       |  14 ++
 target/arm/helper-sme.h                       |  14 ++
 target/arm/helper-sve.h                       |  14 ++
 target/arm/helper.h                           |  17 +-
 target/arm/kvm_arm.h                          |   3 +
 .../tcg/{helper-a64.h => helper-a64-defs.h}   |   0
 target/arm/tcg/{helper.h => helper-defs.h}    |   0
 .../tcg/{helper-mve.h => helper-mve-defs.h}   |   0
 .../tcg/{helper-sme.h => helper-sme-defs.h}   |   0
 .../tcg/{helper-sve.h => helper-sve-defs.h}   |   0
 target/arm/tcg/translate-a32.h                |   2 +-
 target/arm/tcg/translate.h                    |  22 +-
 target/arm/tcg/vec_internal.h                 |  49 ++++
 target/arm/arm-qmp-cmds.c                     |  27 +--
 target/arm/debug_helper.c                     |   4 +-
 target/arm/helper.c                           |   5 +-
 target/arm/kvm-stub.c                         |   5 +
 target/arm/kvm.c                              |  21 ++
 target/arm/tcg/arith_helper.c                 |   4 +-
 target/arm/tcg/crypto_helper.c                |   4 +-
 target/arm/tcg/gengvec64.c                    |   3 +-
 target/arm/tcg/helper-a64.c                   |   6 +-
 target/arm/tcg/hflags.c                       |   4 +-
 target/arm/tcg/m_helper.c                     |   2 +-
 target/arm/tcg/mte_helper.c                   |   3 +-
 target/arm/tcg/mve_helper.c                   |   6 +-
 target/arm/tcg/neon_helper.c                  |   4 +-
 target/arm/tcg/op_helper.c                    |   2 +-
 target/arm/tcg/pauth_helper.c                 |   3 +-
 target/arm/tcg/psci.c                         |   4 +-
 target/arm/tcg/sme_helper.c                   |   5 +-
 target/arm/tcg/sve_helper.c                   |   6 +-
 target/arm/tcg/tlb_helper.c                   |   4 +-
 target/arm/tcg/translate-a64.c                |   3 +
 target/arm/tcg/translate-mve.c                |   1 +
 target/arm/tcg/translate-sme.c                |   3 +
 target/arm/tcg/translate-sve.c                |   3 +
 target/arm/tcg/translate.c                    |  25 +-
 target/arm/tcg/vec_helper.c                   | 224 ++----------------
 target/arm/tcg/vec_helper64.c                 | 142 +++++++++++
 target/arm/tcg/vfp_helper.c                   |   4 +-
 target/arm/meson.build                        |   2 +-
 target/arm/tcg/meson.build                    |  21 +-
 44 files changed, 391 insertions(+), 308 deletions(-)
 create mode 100644 target/arm/helper-a64.h
 create mode 100644 target/arm/helper-mve.h
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/helper-sve.h
 rename target/arm/tcg/{helper-a64.h => helper-a64-defs.h} (100%)
 rename target/arm/tcg/{helper.h => helper-defs.h} (100%)
 rename target/arm/tcg/{helper-mve.h => helper-mve-defs.h} (100%)
 rename target/arm/tcg/{helper-sme.h => helper-sme-defs.h} (100%)
 rename target/arm/tcg/{helper-sve.h => helper-sve-defs.h} (100%)
 create mode 100644 target/arm/tcg/vec_helper64.c

-- 
2.47.3


