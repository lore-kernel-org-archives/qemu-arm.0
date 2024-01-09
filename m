Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp424358ejs;
        Tue, 9 Jan 2024 06:38:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXYG/EiMfHV+rEzRAegO75ULoQCUxkMbV6aWJqN8JW23SA8dtXxKk2Y7+fJXlQlvWaXx1K
X-Received: by 2002:a05:622a:f:b0:429:9a0e:d2e9 with SMTP id x15-20020a05622a000f00b004299a0ed2e9mr2328950qtw.108.1704811098038;
        Tue, 09 Jan 2024 06:38:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704811098; cv=none;
        d=google.com; s=arc-20160816;
        b=vLqWRJ9zQ7EMUilnUCnLhp+IKMZNav5hXw76CpWAqKSd0bD+nbFptqAmn1tEmfKk8B
         q27ywRamgugpgZi4fTX6STQyp3i3GcjZ+IeqJNZpCeZdPI+3kftXRooDE/vQvl/TKy2Z
         ERgzZuhcZ43wsglHYhiGWJIJ/Dt8Bj5TESk4zea464sLit8TDN2vZyGr2g7T+CiTDnPq
         dGxGlLd8ygxRP3F0o1YtRppP4rzYz60RNaD9AucRLgkU0nTZ6xHe9agznE9AsBlXR2uv
         m5dXC5/lgAjjfkpf/LrvFs/K9yXsPfRcQwS/rsGCvZ44E6rN1lttiqEkVivi/+qehHQd
         WL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/BAAkIR06a0xBg8aGBGeK/Zu3znoiAARSVRC2ZZbjsY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=W7ZYIB1+OGAr8/UaLZJw3UTR0VcSItADKtTuz3SXC9J7QUL0TJ74Xy6WqL828R5SfW
         UC9EpYz5Wl7e8pkFB5Y4Q2khANsdmzS7lCo23U0hxbxFiLX47ZwkDidoYKdJd5OCkCyV
         h6iU09dlzkS3KAJ1kfpSSkp6clt34L2Hby38Rpd7f3XWLIYJRWQktBeRxSEYqtqBzT9L
         z0nErnQzK0eqvfgTJB0lkKEYt7FEXpd4hZwMojGKXwE1Ju2fqkKXMwc9k8UNml8WhTx0
         UVgg8BB2vGEm2/lbCSEbEYhuLS/w5lDPD8G5nhC7TpqkWaeMiFBNgLuB5vYt/R/nhcxG
         BIIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYvb4CGQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020ac85747000000b00429af934db6si90698qtx.213.2024.01.09.06.38.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 06:38:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FYvb4CGQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNDF7-00088A-Ct; Tue, 09 Jan 2024 09:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNDF5-00087s-8s
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 09:38:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNDF1-0005oA-NP
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 09:38:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d604b4b30so23738355e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jan 2024 06:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704811086; x=1705415886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=/BAAkIR06a0xBg8aGBGeK/Zu3znoiAARSVRC2ZZbjsY=;
 b=FYvb4CGQ6PORoiUwWxQiHVC/CXrODTFF5JrDGoR7ZkpsGj+mgbf+v+SNVIIfVYxJsf
 teVz1wlGuOqqxisPRu1WZ9kXOmwIsbFovDVkfuq7lwF6UhwP9j0EvuPn4lVh221Sp/cX
 J6nQ7zm+Wb6E6E3iCwbHWhgf60C2gq2EwmIH/0pRnmvc1K8tTKrQqps9R0dgifgFKHLL
 iiSatLBHn3G6HSK2WNmOwRey7sqmHd0tO/G9nKp4hA9yQ6AbWD/OAaPTN3ifUbvtqKMg
 LX3EEC3dmo563Qothd7XSwC47Sq2jZlWFh0MJWUJyfTKnRuv3w6dAQm/Mm4VFBn13b0B
 snWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704811086; x=1705415886;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/BAAkIR06a0xBg8aGBGeK/Zu3znoiAARSVRC2ZZbjsY=;
 b=fmfkRRdgiXQIUZ8wpaInmJO6bJJJdVpdknlYFXKyZ6f0shZaIFQ2x6LbszR5kl/33C
 vNkEWb+RN9x2BTR7vukMRZB6r/xPvlvIA2H8HAf+n4XraUmT/9XDsPZbzz0ygmjuyG44
 7PH+IHDEcar5P6D0uyGlOVTyiyL2No0k/SY6WALiSf3+V87olqZNHH4GRKeWzOQY6KiU
 I4FslToP/W9lE5WdGVxrhu6QfireyJtmZSSd3qhwGPh83sehf6AV2p5rahRJvrdl1wJs
 G6vnWgKShr6YS7RJXLLu4H2kR6zVTzeR629AcanWyGiiApwgz5PS1lX9onw44QzZoNmg
 pIvA==
X-Gm-Message-State: AOJu0YwydTr3o5ulnZlBD9N468RQaxMaulWP+H4C+nMGB5Kvnz2lq/wH
 Z2UN2u4j1/hd4hNacViqFY85VMXtAKfuDyMko0F3unHukPo=
X-Received: by 2002:a05:600c:3488:b0:40e:52ab:d09b with SMTP id
 a8-20020a05600c348800b0040e52abd09bmr338077wmq.50.1704811085654; 
 Tue, 09 Jan 2024 06:38:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a5d5486000000b003375d8b0460sm2596466wrv.1.2024.01.09.06.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 06:38:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: arm_pamax() no longer needs to do feature
 propagation
Date: Tue,  9 Jan 2024 14:38:04 +0000
Message-Id: <20240109143804.1118307-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nZXSSh+THnEN

In arm_pamax(), we need to cope with the virt board calling this
function on a CPU object which has been inited but not realize.
We used to do propagation of feature-flag implications (such as
"V7VE implies LPAE") at realize, so we have some code in arm_pamax()
which manually checks for both V7VE and LPAE feature flags.

In commit b8f7959f28c4f36 we moved the feature propagation for
almost all features from realize to post-init. That means that
now when the virt board calls arm_pamax(), the feature propagation
has been done. So we can drop the manual propagation handling
and check only for the feature we actually care about, which
is ARM_FEATURE_LPAE.

Retain the comment that the virt board is calling this function
with a not completely realized CPU object, because that is a
potential beartrap for later changes which is worth calling out.

(Note that b8f7959f28c4f36 actually fixed a bug in the arm_pamax()
handling: arm_pamax() was missing a check for ARM_FEATURE_V8, so it
incorrectly thought that the qemu-system-arm 'max' CPU did not have
LPAE and turned off 'highmem' support in the virt board.  Following
b8f7959f28c4f36 qemu-system-arm 'max' is treated the same as
'cortex-a15' and other v7 LPAE CPUs, because the generic feature
propagation code does correctly propagate V8 -> V7VE -> LPAE.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1762b058aec..0da1caae117 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -95,7 +95,10 @@ static const uint8_t pamax_map[] = {
     [6] = 52,
 };
 
-/* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
+/*
+ * The cpu-specific constant value of PAMax; also used by hw/arm/virt.
+ * Note that machvirt_init calls this on a CPU that is inited but not realized!
+ */
 unsigned int arm_pamax(ARMCPU *cpu)
 {
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
@@ -110,13 +113,8 @@ unsigned int arm_pamax(ARMCPU *cpu)
         return pamax_map[parange];
     }
 
-    /*
-     * In machvirt_init, we call arm_pamax on a cpu that is not fully
-     * initialized, so we can't rely on the propagation done in realize.
-     */
-    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE) ||
-        arm_feature(&cpu->env, ARM_FEATURE_V7VE)) {
-        /* v7 with LPAE */
+    if (arm_feature(&cpu->env, ARM_FEATURE_LPAE)) {
+        /* v7 or v8 with LPAE */
         return 40;
     }
     /* Anything else */
-- 
2.34.1

