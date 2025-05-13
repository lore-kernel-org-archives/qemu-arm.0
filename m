Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp553235njb;
        Tue, 13 May 2025 07:17:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5Kc6AgpNGJG4mGCo4G7C3bVmm7NKUEE8T+SLm2y/ZN+pF6V6Z9nIHE0NNpITACJ5Eszr+DDn8/e/h2g==@linaro.org
X-Google-Smtp-Source: AGHT+IGUkSbYOX0zZbbedend6OBqKz7SO6T48X/IgjrEIYpGvyfUyi+xZzbsbQtltIXc+jh087b3
X-Received: by 2002:a05:620a:438e:b0:7c5:53ab:a745 with SMTP id af79cd13be357-7cd0114ef20mr3342015685a.36.1747145828621;
        Tue, 13 May 2025 07:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747145828; cv=none;
        d=google.com; s=arc-20240605;
        b=G0hthNUICK/huBx8qOVOiXBphuAFJPwsbZMC4UTw6cS22130STYNydJYPrd1Ns4YY4
         lQfjw0xdGN5nBUWzo/czxtCSj/VZ6fZkxjUaaZ1lwuAoPJ3aL7onYXWhX/FfEIOKXIZZ
         IiJwJxe6zCLEhlpfiBU/9QnDaDaFU2c3wWg6WT3Y/8J1nuF0zv/QCC1vZKqDqS9BbgM+
         Wt04JNKb+OHQUk6LK4/BmHqZ1h0fMMZ21dJf32867FUnpXDn9lxtK9yKRhMiXzL/JbZB
         LvLborqUxiScpttR4OoqV3W64FofNlR53fmuWeOjbwrIFo3+I2bXahRYVH3zjQcXuO9a
         7gbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=omIYyhjnPokjM8hDN/Na4Ta4HqneXcIGJ9F+NHfzW2Y=;
        fh=X2dDt+3Lvg31+5nZKRV8fJCiaCcM59n0JDz7rKqnEUA=;
        b=fATo/3fG/VzZYT+lXxOcMDa6RPV/b2PkNOq1/3fJjh6PTyhYXtICsFMfPgoOh+Rayd
         x13cKEowa5DNdGJX0NDrg5ahSq0++ndWLFGkOFl6i/HB8obpJbXVtLZKpWruM/6ERja1
         fBSr6KCHTkUALPiMi+lCh76S7q66xssRehN4XxBOvCitJ+cNNuqCQsEpfmrWZtAX0qcH
         TeC4nRj40SCvd3CMHB9ag5G/dw4L96U+dBiHz1N2zKutA0HC6H3j+4P10kfHNJ7M5a3u
         qoRceM9qcHt31i0W5wOyQ2VUED4rcBdLc6oJP6f6ePiYoC68c4iKqqeRvF35hoh12A3R
         Oi5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b="N3RNAS/k";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd4bfesi1092344585a.317.2025.05.13.07.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 07:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b="N3RNAS/k";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEqQC-00044p-4F; Tue, 13 May 2025 10:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uEqQ1-00042I-CG
 for qemu-devel@nongnu.org; Tue, 13 May 2025 10:15:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uEqPy-0005aH-W9
 for qemu-devel@nongnu.org; Tue, 13 May 2025 10:15:40 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso37945255e9.2
 for <qemu-devel@nongnu.org>; Tue, 13 May 2025 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1747145737; x=1747750537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omIYyhjnPokjM8hDN/Na4Ta4HqneXcIGJ9F+NHfzW2Y=;
 b=N3RNAS/kcPvaRIMAwAHBFz/jmVa6PtPaMkvItl3pj3R2itmoIid0gCCU03iH/DP0dc
 uQYGjZtRcpnKu743TWIa/HfwbEbeRtHQPQKs0cdmyUtIOYrarhs640Ako2Aeyjz03gJw
 xUK2Kd8jBdi2RCRgQRyjrg28HjJI7aKGOmqXWVfo78paR3rpin7nFZZDFRkgvrkLz5/P
 rvf15z7UjdDSq2emgQMJMzd38xplHYO+XfIDlvTU0poItmuAsq9ZTwXc/2MhlNlQsC6e
 ukFM/a/syFYzZ6jYMB0mn0VV/Ywp5PJP2CxoRdoH4Z11TIwYAxRsYafvD7diz1z4PgVp
 1N+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747145737; x=1747750537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omIYyhjnPokjM8hDN/Na4Ta4HqneXcIGJ9F+NHfzW2Y=;
 b=fSDuaDEM3Xpr5EFlSvbyvTZ+20UtqfpdmWAe327JGEtI/2O1O1fdcOk7fMgBPSbved
 8J/LY4CTI2wIVqz/0qJyGP6OdeolJ4xU1YR8a+9dFDew46wEiuza+q20/47Xb7IJN4ea
 kwbRpuR8yBRfhhaAasNRZX0rkOZd6Dl9Og4D/MYDigfTmjrRbm/Dd8dc4o15RZx4xbZm
 fxczl+ShL1tdIMIrHQAv03HebG1fsEvRoR9Iftv+8XdbYA8TkOV9U1f2i6dkhiE4wlKk
 UwnUc42qr9oUf5DOd3ho4+KF/fJVotC9ghmf4tTkvH5LDeuqsSLmAIzVKLIdWAdpWfuo
 tpUw==
X-Gm-Message-State: AOJu0YxkBktFvX6mtn7eG7hvUxUjBHue1i+K+9GNYMFQnqSy8soGp47c
 qqy+uUfH1BTTeqZcmEVeZ0gzqkQ9GK0K66BAipoiUarQMt6mm08apiTd98s76bQUCzIvhp1AG6s
 =
X-Gm-Gg: ASbGnct2dyHsf8nnRVSzT+kce+DKXY2Ed2pl3bRjtIkpfaGrB+4zD5hFBZkTdaEs1p3
 WJv5ky+1DDHpJPKVNXueiiZ4TAyrFpevfcNSgIpxdPYGihK7cNSGn55b/PNXWKQrR3uuK0LeR4A
 E7emvoSGV3yKDK56HDx0XM9y2fd5N+GGrRFNksJqQyMIX/64GUZEjaQnhAHw2YvZ2CVmElJB8hi
 zr29CH0k9VlfZ3gCEDSE1bBnc550Rlj/6OPsptb/KWX6+fHUpf9WHIwweI8cOy0cbpm6l2tyYyB
 n+qrl9385aOa1Qztu6vBk8LOxKm6nkeDDwzlLrMPcNrVfjggMyO9QuDhF9bmp7DevwzuAiwPuTK
 7NsFWUdOfF+qBWA54ZlgG3AtjOWPwbO4o5jVKO9t97LxOM35T
X-Received: by 2002:a05:600c:37cd:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-442d6dd21e9mr122130445e9.26.1747145737182; 
 Tue, 13 May 2025 07:15:37 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm213438805e9.39.2025.05.13.07.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:15:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me, Frederic Konrad <konrad.frederic@yahoo.fr>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 2/4] hw/intc/arm_gic: introduce a first-cpu-index property
Date: Tue, 13 May 2025 16:14:46 +0200
Message-Id: <20250513141448.297946-3-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513141448.297946-1-chigot@adacore.com>
References: <20250513141448.297946-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dgpWqaZrCi80

From: Frederic Konrad <konrad.frederic@yahoo.fr>

This introduces a first-cpu-index property to the arm-gic, as some SOCs
could have two separate GIC (ie: the zynqmp).

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 hw/intc/arm_gic.c                | 2 +-
 hw/intc/arm_gic_common.c         | 1 +
 include/hw/intc/arm_gic_common.h | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d18bef40fc..899f133363 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -59,7 +59,7 @@ static const uint8_t gic_id_gicv2[] = {
 static inline int gic_get_current_cpu(GICState *s)
 {
     if (!qtest_enabled() && s->num_cpu > 1) {
-        return current_cpu->cpu_index;
+        return current_cpu->cpu_index - s->first_cpu_index;
     }
     return 0;
 }
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 0f0c48d89a..ed5be05645 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -350,6 +350,7 @@ static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
 
 static const Property arm_gic_common_properties[] = {
     DEFINE_PROP_UINT32("num-cpu", GICState, num_cpu, 1),
+    DEFINE_PROP_UINT32("first-cpu-index", GICState, first_cpu_index, 0),
     DEFINE_PROP_UINT32("num-irq", GICState, num_irq, 32),
     /* Revision can be 1 or 2 for GIC architecture specification
      * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index 97fea4102d..93a3cc2bf8 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -129,6 +129,8 @@ struct GICState {
     uint32_t num_lrs;
 
     uint32_t num_cpu;
+    /* cpu_index of the first CPU, attached to this GIC.  */
+    uint32_t first_cpu_index;
 
     MemoryRegion iomem; /* Distributor */
     /* This is just so we can have an opaque pointer which identifies
-- 
2.34.1

