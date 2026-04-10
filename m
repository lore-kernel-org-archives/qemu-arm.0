Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DBFF45A08
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 20:00:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBI1u-0007O4-J2; Fri, 10 Apr 2026 16:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI1s-0007Ne-UD
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:00:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI1r-0006af-Bk
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:00:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so31095495e9.2
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 13:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775851234; x=1776456034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cxj5AYLphBEzhwo2MazkRnd3wQFnp4YvtA7GMP+lRHQ=;
 b=hFh/TvSeDgXk1uVBeaxe2mmbx7qsHI7aY0l2CAc6vnhVVR2YG5F8+vUkloKmRRixM6
 FWaa50Ie5SqiwgGG+oIapGoTph+9q3Cy81mJh0AJu97SKpIy3gDMRV/lhjFLIYPrLq/+
 CuEP16IikRkjVPphs7alLK4wNhRTlbkbY2adhsE2P8xvLPFHqInFlCoobWHSAPMv0ZoR
 gOiSgQrCapEitmUVty/vclzPCjo+/5gLVewWNeewXUMOLlsFQAtzOLple5BolWwmBpLi
 u9zD9sDkNMWDWYB7k4lUa2F/j52ldrUHJzD9rCVUD2QOd4G1pjoJn82XZwDpwJAcj4rV
 11/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775851234; x=1776456034;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cxj5AYLphBEzhwo2MazkRnd3wQFnp4YvtA7GMP+lRHQ=;
 b=ozW7CWOLA/DT34Owv12FfgHlBKx241YUvZUkXnd/K7nQmkfjOfWAwngD2hEtOBJWc1
 L3n1FshUx3k+nfs7VLrsUnmr02wVgInybqDR4ul8nXejCD6qR0WZlU1Uq+HZKMtgasWp
 arkWmr6/RDAY+PQ/4Sp5NUuI0H7+aGnGWvPGOK5uFXlGy9zT+QWDW/canjV2LiI+SJv/
 DsP/edB+arJluUxA1mQxtGoIn5CmMAaADg7JUMIPF9UMzcP2yzZJivUJEyW0wUFYKrak
 325OukIcE7SECpjGBKl/Lefuak0/hVKcPwt/MbZRTldS2cgtgWLrqYAEgp9VNj1tl1Bt
 hpbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+EfktLA5ARFOBDyTxv1bCJ2bpU0wnsYUdInKqXQWLh8XW3TiHuhPjKITzJV2XJqswfr0DaeIqfA==@nongnu.org
X-Gm-Message-State: AOJu0YyETi9FQlixmPE6T2863F1D8Gr2MlLeVNQwJBeGDdfgZZdxrpMX
 zHYWE0qLP4Hk8AtHrEPKwpOrru63qcvJiUAvz2yoP5Lr/RAv5DshcqXXkkrGPZElUgI=
X-Gm-Gg: AeBDieu0yJUtMCZ/zeu6Anuj00mh4RtzCgGc5paL2z5JzCogYcGZ88nXhmcwB1XoEJO
 dWuREtFkY8v/VmPbAot4rhP5E5VtoQz7fqaVLMMM+gGfjWtetLv1U0HGtHzk8vtXiFK49T5gZvs
 6ceIq+IViQlu+TGw8AsL6h6La0zq1h0gvLJub99yHdyfUc2jmudbEiGSNoUwFbdDpbllZ8RsuZ2
 qUtDyxoVDH0RHUbGkjFvSKHfGYNlN4gG4lUiezoHXULh2aTqbMUWnNyAJ5yjC6uSAZqRmWsVclK
 sZ24c0rQBK3OQtbp55rEdkSclRI1f51gM9s4KsNvmsOJIw3hOmaDb2xgf9SqiTsWBEHSslW9rrK
 t0vj2MUCl/patoAqA6acwXCduUA85qc6+qlwcZsLHxXsbHyT56LAe/0kVZSkK3cQoerJIsCKAM9
 k/KIZ76ziljlwh2C9hSJUBRVoOFMYFWOTYY3pyWJIfoajwAU8JWIe78Ak1Be3G2WSBWmGOaPNg
X-Received: by 2002:a05:600c:a404:b0:488:bfc3:ef3 with SMTP id
 5b1f17b1804b1-488d6671271mr55576245e9.0.1775851233596; 
 Fri, 10 Apr 2026 13:00:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d67ced32sm38979025e9.7.2026.04.10.13.00.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Apr 2026 13:00:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/2] hw/arm/smmuv3: Avoid including CONFIG_DEVICES in hw/
 header
Date: Fri, 10 Apr 2026 22:00:29 +0200
Message-ID: <20260410200031.18572-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Since v2:
- Restrict to ARM SMMUv3
- Address Shameer review comments

By inlinining the stubs we can avoid the use of target-specific
CONFIG_DEVICES include in a hw/ header, allowing to build the
source files including it as common objects.

Philippe Mathieu-Daudé (2):
  hw/arm/smmuv3: Have smmuv3_accel_init() take an Error* parameter
  hw/arm/smmuv3: Avoid including CONFIG_DEVICES in hw/ header

 hw/arm/smmuv3-accel.h       | 41 +----------------------------
 hw/arm/smmuv3-accel-stubs.c | 52 +++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3-accel.c       |  3 ++-
 hw/arm/smmuv3.c             | 11 +++-----
 hw/arm/meson.build          |  5 ++--
 5 files changed, 61 insertions(+), 51 deletions(-)
 create mode 100644 hw/arm/smmuv3-accel-stubs.c

-- 
2.53.0


