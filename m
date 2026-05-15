Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EA0CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:12:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtGJ-0005aJ-If; Fri, 15 May 2026 10:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtG8-0005TR-J5
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:26 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtG4-00041I-RR
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso75735525e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854279; x=1779459079; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iG6uKO/60gM7kCsznxNFjC08KhvuF24RLwnX0xcMg4g=;
 b=iOqvRqqHBrjyai1aUxN2Uu2uzoUm+BjHDJ3Qj8nSHa12SU9DRxBiQ7Wesg9YJ3aVlS
 eRgnTgXUmPIQGuq/6y8QSRSUzilLTwQeWBJNmwra8TRBRMhkpz6y9UZKkwRJqHP5q59i
 IF8bJon/fHhJH6WKJ8WkHn0FFfAwhmNJ8dAt5/UVnbccp+jMsLSdmwbLxz/MdyRW6p4H
 qmgxZ5+5TkjWCmdPaaYlEpBQL3iMUPBMkUo5nrruz73+UT6x5FgKaCs0XIROgCt16o+Z
 R1cjBMAco3z82RI0yO5p4cq4mZAQXviPBwwyUQ1K0KJfU6wFCraDcQFavDwViTZdlwNf
 M7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854279; x=1779459079;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iG6uKO/60gM7kCsznxNFjC08KhvuF24RLwnX0xcMg4g=;
 b=fwHQGB9t5/2RFa8ey7vZJucsSfCfUZ7UpOblsrz3NSUd0cC91fw5kWksKhqZjxePgS
 RPUKM7cXGrIk4CtK3yRRKcupaWhTlxXg4lpdwbmIPFyY0n7VJ/Xa9TE4BvIkDDqsd9sE
 3kN0nWUbpkjJfJEt49Lma4nrvWZLvsTPwKD8lnrLWiNS/NvWB+ykG1md1Sz4+PGnsIG7
 oYP8Tw1ig06cGsziPHG6WOyqSpFU/0JYLdht1xjhh2xg88XCDkef4aMfUK2Ul1kfD6O/
 gllFjuz2fg/lLx8aKmqhPl8UjKpGGaKBpwUKiHyD74Ft+jqnuSrfsPuSMZhUWox+ynm+
 Larw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/R2OB0EhxzRgFJg2a9FfAzZpkp02kYcsFU6ADbT20hIYY6fNZ1IG6uoDLdskg2kaWMCZxvD4HmWA==@nongnu.org
X-Gm-Message-State: AOJu0YzSerLmuopbY4n7AuOh8lkAiuxEgAFvrPGDsi/s/85JvDDtuL6i
 cKRrrr8YII6+OioPwL0Mct2CakyTO67XrtDHu13QbFOGT0QAnyWK1fAdUI7AA+GLHrw=
X-Gm-Gg: Acq92OGqwvOpR/BlLjgHYCGZKVgiiuFMZCOQzRB4N3wjUO3/SW6xoGkUw3X+WcuCqZh
 W/4Pd6rriX821cokjAp/hxvFoudFUzA8NYe25JqlDb4DCFm2pfvdRKyVJWVsvLI4DbrlXos2dDN
 uFX9OkKAweQNYpIDQE7p2cfEAZVhERgP9cM9yiap55rppgmY4pah4Tgokcr5odlLiCBhulwWlAD
 vuCNYPvrT5nciZcU+wVJbZkVGbsxDdRXzFAlA6HMoR2NO9Ye0rve1vexqPL+XKyMNoUOZLvW0cO
 eX+d2ZfSwqYnzZRvBK+5qbLuHibqr2DTqSxbLrH7aZKF3+tORK2nUWtY/Ta/vxpxqTWs2smZIQ7
 NFKHqty0hjmrt+PANepi0zHI/MuD1AaSBcR0peNFvTbxFpXgCPN178EcyVTf89IbFmIaNcLMso4
 VqsrHSHQmAFnhlxx9iSxEi78Lr1CJD6f6s9AIWy31Q9UaljY3GpGWezVZRRp1glX1cbCiUoLPk
X-Received: by 2002:a05:600c:35c6:b0:48f:dfe3:dae4 with SMTP id
 5b1f17b1804b1-48fe60e9f8cmr64577495e9.13.1778854279131; 
 Fri, 15 May 2026 07:11:19 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c88495sm68177875e9.4.2026.05.15.07.11.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:11:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 06/20] hw/arm/meson: Remove now unused arm_ss[] source set
Date: Fri, 15 May 2026 16:10:17 +0200
Message-ID: <20260515141032.3271-7-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 7c3d66f4378..88e7ad1a3ed 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,4 +1,3 @@
-arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_common_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
@@ -108,5 +107,4 @@ arm_common_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 
 arm_common_ss.add(files('boot.c'))
 
-hw_arch += {'arm': arm_ss}
 hw_common_arch += {'arm': arm_common_ss}
-- 
2.53.0


