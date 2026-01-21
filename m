Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAE1C44503
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 11:00:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viVw2-0003DN-PH; Wed, 21 Jan 2026 05:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw1-00038q-Rd
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:37 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw0-0007vn-6j
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so3426242f8f.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 02:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768993174; x=1769597974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0z4ZmqdDcg8klgR6y8oofAlrUFSwe94cx3wQcY2fzM=;
 b=o7n6Wa58nwTNcYJrSKol7L6COsfbKjZuzNyw/XiSemra/EKvcf7dCSiui3cJJRZdpv
 DEo5Tq2qdXrLNHd8DzRhw0y9VFDYqL18iExodsdLLNXg1VO2xcSFdxXTH9SvJEUFZlv/
 ZNIsHc3aTWaQctscJmSA28MGQl0QgegjahDrP8VRB1qvPXvSHfK9HcSN1CpKIWL3iy2b
 CGmGqB1Qywg2ueTs4M2CqD9EA4kiByw+sHU+EkNX7u6sNQbBnivZa3yj6g0Okc6wOOun
 H1JgowQCMQc2Vn/Mr1cgKyhVUC3Rh9qhyNi6W2AT14I9LF3HdTznoHJpuCab/KGf4vsp
 fGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768993174; x=1769597974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q0z4ZmqdDcg8klgR6y8oofAlrUFSwe94cx3wQcY2fzM=;
 b=tDiZv2oYccj31/YSdA7tgDSjuL17o05isYMLD1A/MCzo63grjjBIfzzWnTxgtbrNCK
 XPl79wwspC8d8EA3gIGooc8shokAW86kXDD1xwrVuOIjHbXNZdxeIEWPiKVO8InrPYLe
 OHayq9S5INfNamGaGcgfxkcAzi355o2qrR/f4E5GWzOlqWCjNHZbv/NV/vIEJGCKe7Fi
 qu0ZabvpCi5vVWI0uAdAwpYz8F2OVreVkAuWh4lAjmoE/2/nac7Am21rXj2aF5ewYDBF
 m0SssSAjQTXqciBewfIEwkdBGe+tUwCxSgLTVklRNyYWCyT0ixFEfr1LHN15ZpGbkwae
 XTLA==
X-Gm-Message-State: AOJu0Yzl6temclnPY5u+TkRgeT6NWIuC14Suvfh7eL2kbHs6lIAzF4MI
 qHfuOZL0wU8FPQ1AHMn3D9o05/4gwRV3GO8ewhoA9xHBKRXg7nh6lujNRXOMD0hDZRA=
X-Gm-Gg: AZuq6aLJmHpIWcX1Gm7GzG/nDouhXS7eUIzR2AMMODJK6HMwW/4uNki06dOiL7N5WZE
 zcvXtt61QmGF+O5WNCkvoNcnJ6OJELt6IoM2incUcGYGeAJ8yL2ckVrD71s3pknMLx7fPBadp0M
 lW2kMW3N1gW8N/3qdt+KFbUO91/o+gqP0C+H+UDw65NUuXjAcG07sFbVuikaCj6ilMLQzaU/oYq
 7XBjakQp4SYoo0sFBUR41OCrj8dnkxq2nX8XaElZImf/ArNN2mBV04V8gRDHFiq3Xz16+3MiKpl
 euUnlGkTeFo/dM7Z4ctqxgcFENhRahNniTxFYnvDee3GMkoKkOeluJ491IjoRbjE8kPdRD7ex3C
 bJm3Yc+0aRe4D04Wrz96kyj4tfqWZ8zXSly/cOOmtTpLELuGzxn5MO4Qb14t2EzjytXYuSHdbSY
 RZ/HGGmronPKAe
X-Received: by 2002:a05:6000:2905:b0:435:a258:76e with SMTP id
 ffacd0b85a97d-435a25808d2mr1125634f8f.60.1768993174063; 
 Wed, 21 Jan 2026 02:59:34 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356992c6f2sm34603408f8f.19.2026.01.21.02.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:59:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8D8955FE72;
 Wed, 21 Jan 2026 10:59:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/4] hw/intc: declare GIC regions as little endian
Date: Wed, 21 Jan 2026 10:59:30 +0000
Message-ID: <20260121105932.135676-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121105932.135676-1-alex.bennee@linaro.org>
References: <20260121105932.135676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

The GIC should always be a little-endian device as big-endian
behaviour is a function of the current CPU configuration not the
system as a whole. This should have no functional effect as the GIC
cannot be instantiated on a BE system but will help the single binary
efforts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gic.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 4d0cb125a61..4d4b79e6f34 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -2062,38 +2062,38 @@ static const MemoryRegionOps gic_ops[2] = {
     {
         .read_with_attrs = gic_dist_read,
         .write_with_attrs = gic_dist_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     },
     {
         .read_with_attrs = gic_thiscpu_read,
         .write_with_attrs = gic_thiscpu_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     }
 };
 
 static const MemoryRegionOps gic_cpu_ops = {
     .read_with_attrs = gic_do_cpu_read,
     .write_with_attrs = gic_do_cpu_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const MemoryRegionOps gic_virt_ops[2] = {
     {
         .read_with_attrs = gic_thiscpu_hyp_read,
         .write_with_attrs = gic_thiscpu_hyp_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     },
     {
         .read_with_attrs = gic_thisvcpu_read,
         .write_with_attrs = gic_thisvcpu_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
     }
 };
 
 static const MemoryRegionOps gic_viface_ops = {
     .read_with_attrs = gic_do_hyp_read,
     .write_with_attrs = gic_do_hyp_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void arm_gic_realize(DeviceState *dev, Error **errp)
-- 
2.47.3


