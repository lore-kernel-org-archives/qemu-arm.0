Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF49AC44501
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 11:01:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viVw7-0003ll-R6; Wed, 21 Jan 2026 05:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw4-0003Q5-Ek
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:40 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw1-0007wC-RK
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:40 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso13500245e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 02:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768993176; x=1769597976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pn0EjWaNv7S6kMlVE1xbMWo8X7UOesxQvgr8dCGqmNM=;
 b=b2VPyJk6JT7rQ88CB+SXUtcJJ9YW1Vu5xAPpahLFgQ5//U39YMmo2+e9m9XyNUZ8EA
 3Uwu+jnFjkggd0FZSes5jtkPcG2mxnnbw7FxgDVXjh3z2vWy4CNXEI7jkaYhUl0+y8dF
 PTjyZyKTqWmMEV3LzkwkHXY9rF3Z6dZn9C0DSDGChaf6aJ28FQfYho3sLV7fyaQSczzt
 G7ekx6JcL8J6aEr4h7+RRH4cSYjfGwtsd0x5m6RAq715haJbVLD30Pasi+l4EbspTPa/
 LZ4c374vpqyLx+UQtd+kpxf7q9jBxylhaVzQboCjzpzcFx7j5LOyAxQDp/FkGzK0KGvv
 edMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768993176; x=1769597976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pn0EjWaNv7S6kMlVE1xbMWo8X7UOesxQvgr8dCGqmNM=;
 b=sFgLlZIW6R2rxBFSs0KzBMLGf8FZkI2hYkLHLNAd7TlvlQIV/+tOAWTtsq+Cu93iOo
 Nmn/TztiU20v+50XU+kXRUJ1IisFR0U43wD91YA2aMDwDq1tvpoLldJgSWhVuNk9sHRw
 auGm3NFaCiVLJ3VNwaLss7rWiEXgQxxyflEItcZ6apqBCZ1Fl/K5c/f0sHxDk+BG4mcg
 nkdud2fcb0m6eTg+lpuZsYEUlGxAHWrj/gQKmK7a1Px4QsD+SMRb3OJbv544CJzDpBy+
 vXeMeNJiBeye8DRTR3VG0/SaSIbGRl/lMJAG3eFw1OWDVr6yalo8sNA6xLUHBx/DesK7
 JHzA==
X-Gm-Message-State: AOJu0YymxxToRGEoCRTt+gk+WSiXTl+ruQHqf3vsUM+RYxikihrNhFdJ
 mC9q+LPn6cozUdeE8XvGzcknncPzm4FJEl9Bm0+OaCzH6aNWIHWlOitV0Y5I0ymLmG8=
X-Gm-Gg: AZuq6aLzp7g+d60cmtmC93FLQ8rPU+rdTUurjOCMnoNxevgbrmLCGwrZ+gug5X4WsUh
 5nCXaIs84klxRREEsx+kKIvsiPIBukY9wRilrwouGfV1MOYbL5gieC+IxUMb7Y3fnsCVEh2LpEE
 tt7U53zo5wtUAbgrlZeHuWyjsstsLbaAIs+Llb0hkVUFtQzzhcoJCTMsNR88LTPel5H+Met3CQn
 bJel0HSUgZlSkZCd6m9s52QDaBz5P+s1E+aLUu7FFb4ANV8ICyMP6Dgsuik2B/UUwP4d5cmp+zw
 Ild4GNlNG6A94v/cZp3FKD9rP6z98K31rgiIrvCGR9sICJsCvlREm+os+WYrxRvHtAseM/LbK9x
 mBfWifGRjCab3RmoZIOJ8YY+fLDP0rOsw1Pl+78Na2XtDg+BABe56TzrGzBM2A8yL2CWifUsiXn
 qDCLlAqs+DerEX
X-Received: by 2002:a05:600c:4fcb:b0:470:fe3c:a3b7 with SMTP id
 5b1f17b1804b1-4803e79b805mr71580545e9.5.1768993176128; 
 Wed, 21 Jan 2026 02:59:36 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b267661sm365924795e9.13.2026.01.21.02.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:59:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A46175FE75;
 Wed, 21 Jan 2026 10:59:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/4] hw/intc: declare GICv3 regions as little endian
Date: Wed, 21 Jan 2026 10:59:31 +0000
Message-ID: <20260121105932.135676-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121105932.135676-1-alex.bennee@linaro.org>
References: <20260121105932.135676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
 hw/intc/arm_gicv3.c            | 4 ++--
 hw/intc/arm_gicv3_its.c        | 4 ++--
 hw/intc/arm_gicv3_its_common.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 6059ce926a6..542f81ea49a 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -417,7 +417,7 @@ static const MemoryRegionOps gic_ops[] = {
     {
         .read_with_attrs = gicv3_dist_read,
         .write_with_attrs = gicv3_dist_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
         .valid.min_access_size = 1,
         .valid.max_access_size = 8,
         .impl.min_access_size = 1,
@@ -426,7 +426,7 @@ static const MemoryRegionOps gic_ops[] = {
     {
         .read_with_attrs = gicv3_redist_read,
         .write_with_attrs = gicv3_redist_write,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
         .valid.min_access_size = 1,
         .valid.max_access_size = 8,
         .impl.min_access_size = 1,
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index cce3486d74c..b639c03b67c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1906,7 +1906,7 @@ static const MemoryRegionOps gicv3_its_control_ops = {
     .valid.max_access_size = 8,
     .impl.min_access_size = 4,
     .impl.max_access_size = 8,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const MemoryRegionOps gicv3_its_translation_ops = {
@@ -1916,7 +1916,7 @@ static const MemoryRegionOps gicv3_its_translation_ops = {
     .valid.max_access_size = 4,
     .impl.min_access_size = 2,
     .impl.max_access_size = 4,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index e946e3fb87b..9fc51ad1e0b 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -97,7 +97,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps gicv3_its_trans_ops = {
     .read_with_attrs = gicv3_its_trans_read,
     .write_with_attrs = gicv3_its_trans_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops,
-- 
2.47.3


