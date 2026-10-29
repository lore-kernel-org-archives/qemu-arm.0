Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC13606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NU86YyTz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSkr-0005gY-8E; Thu, 29 Oct 2026 12:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkk-0005cK-Rt
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkg-0000Wq-Ds
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so1946541f8f.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290393; x=1793895193; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=s4l0KimBrWHvvMusyKOm2DKSCNNxRX8/fD5OazWpjLY=;
 b=NU86YyTzxF8E12Co4Fuw0+cWfhQRJFwe/uHYGr/tDDyzUb9a+cQefuWIqqcJD45fAR
 iI9C3Z8uSoL9VS4zxg0aYD+5MALvbNqsY3Kggrzh1q1uLhraDNCNZv6j7pImZN1vzxml
 bgs6XKeMK6szhDpmrgqRshdqU9OHKkaMxr8Yxo6UGDol3OXmD/4W0IB8z1pymtASPTNP
 TuJmhqrihYb1XxdH94pP+CbQvY0tT0HojVWVYDhkpU3XRfPAFqNKFnBA+yAqqvCQYkjZ
 eqPBwIs8ka0Z6sCTO1voiIJbhJHmSjfJ4fVpVlAAUr2B8CCvz+bhqUjfeu55CT2aQ+pf
 DjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290393; x=1793895193;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=s4l0KimBrWHvvMusyKOm2DKSCNNxRX8/fD5OazWpjLY=;
 b=JHaFWESUapAqLLK7Qus/3CNhzqwlujFFtOdF5BiH3/z3vSB89/zdsOfJETOjYx7mLz
 OBfG7KOlj1XoMODKSfBQsGA83lXH5TrPG6KSNgCEtjWAVZjLjL26IWiYhW+Pr7Wfml0o
 OFw9+RzNA6LFB5+NMBUqO25Z7ZSxpYrZYrCpmqaAecTNhB6dJUnvfAMrjtMRtpVX+DJa
 g2wx4qcvGnZKLYdOj9Jx1A5SjZKzBTXc9XmFEHuYDQUihtSQAh3S0rMpGasfpBo0NBCa
 U8BO/oaEp4E7ChEWNmSYn4X9ne4VNR8BMYHM0lH5lsOjZk7Xz1QXxu2dhcev8ZRGfPMw
 XTwg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzqZWBuLgSosYB/96BFD6MNX/zQGvOZVwQ281bWsDxz/Di+ZxGJP4sr6MgxVf1isVPgVGijruUzIQ==@nongnu.org
X-Gm-Message-State: AFq9FYK2W94Dy9OqPeWQ0mp0gcQXBFXfYFM9S4XTbdKmA0YeY8dVZfU4
 BYmBY8j2XYeVuFkU5nJwOQ6NTAGYiqgFFRhXGHNgn9B5SfPI9UK/hgYo02lfi8ELzmg=
X-Gm-Gg: AYBFou1v2GoyStG4UMY8m7KV8ZIVYFrvIBI9qZ+EKiDk23qrLBojtYpNmSumsDAjFLg
 /ipF43o0VH9QuiUQTFMbytQzOxLAVgIdlhZ/SptSmPY2Q6ICAm4hsQK+p6yXt+K+Ib5KkQzdUN5
 ujDlDykCx6mqoE3aPxFXWwM6Ps9YA+Nmtae0P34wDEk+4mufOiO3rbl+xK0VGJcv4C7pIln7SNO
 o1QaqKBHDZgbyhL7rIYHSXvCyTevAd+zzmm1ojJxlRKA5kA5zp+XALCfQhYl2FuxiRUE7J5JV/+
 U+UIiU5OBY9cLjFU2Rhi/XoEPJPLTfyzbHewFgijWXjVvdUIYxIEkdCJCrpvGBX+DKN6SwE2PR+
 P+2ji69rQJYns2M78ZhUVUxcaalRpmNM6puDu1QUuqlRDvsg4B2A877O+xgcG/pXT1BRczD1E/n
 Cy3/yPCzJQcN+JkeW3OChUYrjgtswL/sn9M9dSRFyRN1R9X2xG/xalIfFv9VrfuIbK0AycZZvJR
 Bc8aYyBusBRW/avoWS0y9oAGAwIj+Yax0PLK72IG/wQuC/ZKNHDk6eoJ9UZ9F05DzYfpuHgMMeF
 qHFYi100QvyR1mtGm7mYYEGFgrV6
X-Received: by 2002:a05:600c:3e86:b0:4a1:83f0:7c91 with SMTP id
 5b1f17b1804b1-4a96b0ab6b7mr133595925e9.18.1793290392920; 
 Thu, 29 Oct 2026 09:13:12 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f7f4cdbsm83293675e9.7.2026.10.29.09.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:13:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 122BD5F898;
 Thu, 29 Oct 2026 16:13:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/8] fixes for 11.2 softfreeze (checkpatch, gdbstub, wfxt,
 bcm fb)
Date: Thu, 29 Oct 2026 16:13:02 +0000
Message-ID: <20261029161310.2065290-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A small selection of fixes as we approach softfreeze.

The core changes are tweaks to the WxFT emulation which fixes a
deadlock when the vCPU goes to sleep. There are some tidy ups in the
following patches including an import of the test case from one of the
bugs reported.

The is a quick fix for a gdbstub test regression I inadvertently added
in my last PR.

While checking the series I also ran into an issue with checkpatch
which I have a proposed fix for.

Finally there is a random bug fix for the bcm2835 frame buffer.

Alex.

Alex Bennée (8):
  scripts/checkpatch: validate fixes against origin/master
  tests/functional: fix call to common_tuxrun_gdb
  target/arm: hold bql when SEV sets the event_register
  target/arm: don't pass env to the sev helper
  target/arm: simplify wfxt_timer_cb to only trigger cpu_interrupt
  tests/tcg: import arm wfe test cases for #4670
  tests/functional: remove @skipSlowTest from quanta_gsj test
  target/arm: fix bcm2835 migration issue

 target/arm/tcg/helper-defs.h                  |   2 +-
 hw/display/bcm2835_fb.c                       |  11 +
 system/cpus.c                                 |   2 +-
 target/arm/cpu.c                              |  20 +-
 target/arm/tcg/op_helper.c                    |   7 +-
 target/arm/tcg/translate-a64.c                |   2 +-
 target/arm/tcg/translate.c                    |   2 +-
 .../tcg/aarch64/system/wfe-sev-lock-aarch64.c | 259 ++++++++++++++++++
 tests/tcg/arm/system/wfe-sev-lock-arm.c       | 240 ++++++++++++++++
 scripts/checkpatch.pl                         |   4 +-
 tests/functional/arm/test_quanta_gsj.py       |   1 -
 tests/functional/s390x/test_tuxrun.py         |   1 -
 tests/tcg/aarch64/system/meson.build          |   7 +
 tests/tcg/arm/system/meson.build              |   7 +
 14 files changed, 538 insertions(+), 27 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/wfe-sev-lock-aarch64.c
 create mode 100644 tests/tcg/arm/system/wfe-sev-lock-arm.c

-- 
2.47.3


