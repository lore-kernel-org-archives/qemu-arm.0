Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E094108E1E4
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 10:44:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ArX-0006tV-VC; Thu, 19 Mar 2026 06:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w3ArV-0006sb-CC
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 06:44:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w3ArS-000782-H6
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 06:44:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439b9b190easo571824f8f.2
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773917056; x=1774521856; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BvThwtiwpUjEJkcRvRsNM7vqsy4xO9B9B27tJho3O28=;
 b=sMo0whNok3Tqte2vKOf6F7I6wUr1G3xaIVQZDVLnbP0Wad3uj7VeNPYmvNzi8tdOO8
 HXwetD5mJyc2mmStUr5NIwZNzrBcDY/nP494d89dJp2KDQxTlnjqacGjY84ymP75+eEb
 xLwrL6WIAfcop/2sichpz3TgnKuIn4p7nY3ruPCPfsu8kSC+NS9xUVNXyhOsUEsF1E84
 bc8kuxiCP120fjZKIVpKS3B72ar1cjUZ/zd1nQkbALrlN+ydTF5Dfn78grY2MjIh7ISp
 LWXF0Ugc4zhjNM1XEhKlevTRwoL9bpGqjldj56JqaMTjXpKK6MYvKdoBjkOaM93tbPt+
 +06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773917056; x=1774521856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvThwtiwpUjEJkcRvRsNM7vqsy4xO9B9B27tJho3O28=;
 b=XpV4W0Oe1uJtV7aUWDU/RSE1Y6/5U2r/LLV2S89DqSCqK4qJyIkQzSp7sMHGnTR/lA
 aCxMvanASPOsbxSWHsWdeLYOjHogT3IFcBzTERYOPq103XLe7N0MZg1Das9WVlkVbJ+Y
 ubyKTlxXmWKODrRCsMTOyEDidT0T3s+5HSnBw93sS7wav05g0KdBvQ05ft2O16aYD+aB
 lc0N/lnZwkXmACrLUkJIOAZSL2OORqOXKTNXvSFMNLHCZwDKpNwbTT0YIgbvYIN6fd0q
 Eh6CQuo/lL6I2iD8efyjXlHWmJNdluOvU8Mob67QhSdnVHijnSlH5Dpqnpg+nDi9/As7
 O0xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTnsJaN8MnNwTYY5UjwtlyMQB9FyTuAVBEpmM0lVFeOUrnb2krd7pQbeuIb1Nx8julz+XR8pM4gw==@nongnu.org
X-Gm-Message-State: AOJu0YwnGkM3BoGoV8+H/BRXhQ6FptklBzGeeHLQz8sxnwjB/vdhNk6g
 60LYc5v+RKoojRWRKPEwRVv30otMsunEsCpr5ZtquwjCnQmxTMFnvN5h5m//BqALFeA=
X-Gm-Gg: ATEYQzyNk6QllqnVWDwmnZBAmKTdNWPXLejfjaL6052jO0FjnLtiWXibPiOpMRB2SLs
 /MsXj1M+nbyUEXixday+k+icP+xt17hB6IKdJuj9RTYf9niG422DxHkJa7OVujX5osceVOrc2We
 XkoVszUP7R9Cfcu/Dum737Hc9eqTuTm/Sou8MyPMS9NT63KCx+jyP7j02fhRZEak1A/fydlKO+Z
 Pw2eLDKFr5yTVBvpDWfM06AruYrsZPI+9Uh/snKyMY5DBdvHsd0Wp5LweZvtIBFeGI2SgHOedZe
 qF7SRmXW70Cql9Xba5EfUiiVeYGhOrgoKM5M3yPc+y2NFnTO7ZKEA2agXp4yxqMm/seKhuDdwqu
 b09iI3/Qn8Cw6PXfOOSFys1pXWb2GD1V073d+8VKEQRrcm+UXnxbzSMlyNEcPsG3ph1TibPdp+Z
 QYL66OPx8pbBVKHaoAutN9RUYxrGMSsfXjCapWkIeIWEgRLN8S+bdcnyvtNZZ+AnaeFy3q1Lp+z
 LoWHxcKQuk=
X-Received: by 2002:a05:6000:2dc3:b0:43b:4aba:8f35 with SMTP id
 ffacd0b85a97d-43b527a8e1bmr12171396f8f.12.1773917056376; 
 Thu, 19 Mar 2026 03:44:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b5184962bsm15303184f8f.7.2026.03.19.03.44.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Mar 2026 03:44:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-11.0?] configs/targets: Restrict the legacy ldst_phys()
 API on ARM / Aarch64
Date: Thu, 19 Mar 2026 11:44:14 +0100
Message-ID: <20260319104414.66367-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Commit d751921cffd ("hw/arm/omap1: Remove omap_badwidth_*
implementations") removed the last use of the legacy ldst_phys()
API. Set the TARGET_NOT_USING_LEGACY_LDST_PHYS_API variable to
hide the legacy API to the ARM / Aarch64 binaries, avoiding further
API uses to creep in.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configs/targets/aarch64-softmmu.mak | 1 +
 configs/targets/arm-softmmu.mak     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/targets/aarch64-softmmu.mak b/configs/targets/aarch64-softmmu.mak
index 9a20187e2c1..d34aead41c4 100644
--- a/configs/targets/aarch64-softmmu.mak
+++ b/configs/targets/aarch64-softmmu.mak
@@ -5,3 +5,4 @@ TARGET_XML_FILES= aarch64-core.xml aarch64-fpu.xml arm-core.xml arm-vfp.xml arm-
 # needed by boot.c
 TARGET_NEED_FDT=y
 TARGET_LONG_BITS=64
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
diff --git a/configs/targets/arm-softmmu.mak b/configs/targets/arm-softmmu.mak
index 35af7da79f2..b235e34a380 100644
--- a/configs/targets/arm-softmmu.mak
+++ b/configs/targets/arm-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_XML_FILES= arm-core.xml arm-vfp.xml arm-vfp3.xml arm-vfp-sysregs.xml arm-
 # needed by boot.c
 TARGET_NEED_FDT=y
 TARGET_LONG_BITS=32
+TARGET_NOT_USING_LEGACY_LDST_PHYS_API=y
-- 
2.53.0


