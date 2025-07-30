Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3B1C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 22:08:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhExo-0005E8-Uo; Wed, 30 Jul 2025 18:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwT-0001BA-66
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:33 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwP-0002Xn-Rq
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:32 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so297616a12.0
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 15:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913188; x=1754517988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WbwXVx3CiOVjOejevvWPnbgeJdqRzpt3t9W8AIJyWs=;
 b=wlfJNDQYhtDUnScWwxM8gazBU2/U34BRgDuVmAaUG6ASnfECGOY+RBDu65xuLwpRTM
 G/fPWNQ60a3gyTECtYYKLJe8IQ6cxL9XmBCqKhRvTd9HF1FzQO5zehYbVogNU4UVFQvd
 O89xAOlu1BBniewYBIPuj6S8waJ/Zwzy3p8a0hXz8T7jGPgp0ikicYtktjQ20AGs3IT8
 PUWir6+zjFWSXbh5RGNrbEV4TvUeF/tQfb8ca4wvxlopkKliGtisRWlteY66Zjs2KmGt
 3yRqelny9UGXMnf3At8DmRHT0om4+BSjMIKsHuheFOpATCgWE9H82Ih0SbM1ghCQkj40
 RmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913188; x=1754517988;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WbwXVx3CiOVjOejevvWPnbgeJdqRzpt3t9W8AIJyWs=;
 b=b4CXQ9WuzSPa2zgOty2TrmyDguvk+pRt6T2LX+oGfiNmVAA5XAga9rhSY9it1JF/qn
 ubHPE2xwt95ny5y+6gQ0foisn1nOKO8pdrgG1tyVin89LU1rRwJyauJ5i2JvDW9/eiJc
 qPUz66cblUZEU1yj5Nj6L6aWras41O5irn0cNObDGKbutefoKI+YZ6R4Inwy8TJ9XyGI
 LnY4N5QcK37lBpIwDB1Q49AmJU46f8act+IMyioZOBscD7N+/YbTE4hMd1U5c2QIS4X5
 +Gm9ptnEjEtxVa57HUnN9i7UrnSVhLNRm3zQD8YMkGApd1wjpYHc81WYmGMM+hqaq+Bl
 cB2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJtLTKUGjWdVRqGKRPoebhY019ZvK1aurB2a6k+88fH7jlxcGmIOHvEJnHEEX06zLdYKJr6eWHuw==@nongnu.org
X-Gm-Message-State: AOJu0YxxbOceAZKGlKCgEKtnQo6gOnfL+BaQKQPyqr3ZImkMKha2T8X1
 oWTANVzeVPn8cJumZz6fSUsXGBegcwQ51Xd3q0aJ4zsT/1iVGmHXLojQo0U246vJInY=
X-Gm-Gg: ASbGnct7kHaGcjVl5XHshEbUXIAZSoPzCxb7WEEUJp/ZAg8efSJhWZssA/rDXUZzTvZ
 lqY4IY2LBGSR8mo1TZlKtdONC6FDX58xdFrBiE4slxqSKRhb+eDgguwxoJ4oTu82lEjr2FDJECB
 zAzWhy7+uMZ/2lnERG1VOfEZWxhf/3Nl69xpk+BbU0t7AeCPD31i19R053bgamvkuiOZp3NIXuh
 NGS3Z0rpnOqkAJqqJG1zoKV95mS2YO/lbRYaDL1gd45YoasdZVJ17Yanc64ni0TPhFyHWCQSAiv
 vOmeB+KmjKZ5oy6Qa3ez3p+DwwTmQuWCElULoRVPMNRyYbxt6Y84XEKwJp3KreUcCtCTDZ7DmTU
 PSePVM6M/gZ/skDg64pmV9g==
X-Google-Smtp-Source: AGHT+IG2A/hPR8oq7ogamFhySjNoFe7ef6rhWYhPlyzw7srxMnS5S5VHMySDSnN6puSDYv54N6HcWA==
X-Received: by 2002:a17:902:e5cd:b0:234:f580:9ed with SMTP id
 d9443c01a7336-24096ab7485mr74544545ad.21.1753913188006; 
 Wed, 30 Jul 2025 15:06:28 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 00/10] single-binary: compile once semihosting
Date: Wed, 30 Jul 2025 15:06:11 -0700
Message-ID: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x535.google.com
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

This series compiles once semihosting files in system mode.
The most complicated file was semihosting/arm-compat-semi.c, which was carefully
cleaned in easy to understand steps.

Pierrick Bouvier (10):
  semihosting/syscalls: compile once in system and per target for user
    mode
  semihosting/guestfd: compile once for system/user
  semihosting/arm-compat-semi: remove common_semi_sys_exit_extended
  target/{arm,riscv}/common-semi-target: eradicate target_ulong
  include/semihosting/common-semi: extract common_semi API
  semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
  semihosting/arm-compat-semi: replace target_ulong with uint64_t
  semihosting/arm-compat-semi: replace target_long with int64_t
  semihosting/arm-compat-semi: remove dependency on cpu.h
  semihosting/arm-compat-semi: compile once in system and per target for
    user mode

 include/semihosting/common-semi.h             |  5 ++
 include/semihosting/guestfd.h                 |  7 --
 include/semihosting/semihost.h                |  2 +
 include/semihosting/syscalls.h                | 29 +++---
 semihosting/arm-compat-semi-stub.c            | 19 ++++
 semihosting/arm-compat-semi.c                 | 61 +++++++++----
 semihosting/guestfd.c                         | 26 ++----
 semihosting/syscalls.c                        | 89 +++++++++----------
 ...mon-semi-target.h => common-semi-target.c} | 23 ++---
 ...mon-semi-target.h => common-semi-target.c} | 22 ++---
 semihosting/meson.build                       | 18 ++--
 target/arm/meson.build                        |  4 +
 target/riscv/meson.build                      |  4 +
 13 files changed, 168 insertions(+), 141 deletions(-)
 create mode 100644 semihosting/arm-compat-semi-stub.c
 rename target/arm/{common-semi-target.h => common-semi-target.c} (58%)
 rename target/riscv/{common-semi-target.h => common-semi-target.c} (52%)

-- 
2.47.2


