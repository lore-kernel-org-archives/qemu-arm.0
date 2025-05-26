Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4063193njc;
        Mon, 26 May 2025 01:56:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAyaNZvAbZuYam9Buxrw1QTGY9pVJ+dsRPrSzNAE5F1EGRaRJwDsuC6LKK41IMWkqnbNArRfJZ8cMzFg==@linaro.org
X-Google-Smtp-Source: AGHT+IGhiqKFHMsIrRcQM3hxWR39BlancnSFb7wrgo2GqElTOCj902hTiT391eA+f3lr59iw7th/
X-Received: by 2002:a05:6e02:1d94:b0:3dc:7a9a:44d3 with SMTP id e9e14a558f8ab-3dc9b7279f4mr76587205ab.21.1748249784970;
        Mon, 26 May 2025 01:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748249784; cv=none;
        d=google.com; s=arc-20240605;
        b=YFWT85L0ZudW1DS23D1Sd4rg7r9mOCdL0fJ2QfCn3QT1HCXQHlhLcqaCCzShj6ySNI
         C/Qe+N3pz4uXSkx/29gUwIYlR2xutF0sS+qjbFztn4g/sM39oF39a4LJ+4H1YzaY34jJ
         ZkjNNbRumEKz8dBFuFNWd6DHQV73Uke6gVizEC4N8kXbrRlvvvvmJ39wvXepP9Nfr6iI
         nrDO6QXEtQy7un3nOf5VWzMTKqS8zBvX+iyfnUn8Efkcmoqn5ivLGg1xX3Rs8ATQhbzr
         1Fk18ulrxRN3G8Ueu7ob5vNNaNXfvEhe3bvbUlj89OI/s5z4fzQ2pzVLA+3SY3ErnklO
         GH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g+yP9a/uVH74kLVGGvEGM7JayHygTFaXLhgBOX+A4es=;
        fh=X2dDt+3Lvg31+5nZKRV8fJCiaCcM59n0JDz7rKqnEUA=;
        b=jF/IcWAjwxErfgOtQhvG+bScxnR9obK2vnbg8HOgdUIy09VDQM6PMku4LyqnVmoZCn
         2G06Ppn4ILspLm2vJm4J33adEr7P04wFohDEg6aITcBexwt344ydlH2Cs3JBaMflsnSq
         Tzaz2SgtWXAeRRdaWPv4WCrWJDsglXhWFDUHaaudyvBT0FPlE2Fd1Fs+VPYGjfUHCoKe
         FVu6GFXIh0LX4QGBZ7msSLMM9hLZudCxc8Im9UNz3iKz9xrwj9mkhGJCWnRgvEJ9ftBb
         GAaq8x9ufAibguQdzmfsXZASEopXXw/VcTcZtmCZzWot9Ls1QqJz7roCIZGhQEpqQih3
         lEwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=LJlLW1Fd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc493cb7si18024645173.92.2025.05.26.01.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 01:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=LJlLW1Fd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJTcQ-0004TO-CD; Mon, 26 May 2025 04:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uJTcM-0004Rv-1I
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:55:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uJTcI-00082u-Jf
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:55:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4dba2c767so294276f8f.1
 for <qemu-arm@nongnu.org>; Mon, 26 May 2025 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1748249729; x=1748854529; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+yP9a/uVH74kLVGGvEGM7JayHygTFaXLhgBOX+A4es=;
 b=LJlLW1Fd8gDmeuHgY1x4X2r7hCQ/QM3U/SSpW+5jdIY86kUN85zJVXXEh+4hqaJpe/
 abDSH+mst0oviazV4juM8NBKuFr8tkpJRWQWo6n70PDZFc9tJuc2Et0UW0MX7I6ul0sE
 wkIdeLE6AanLjF+cfGR2MkqSvLK8IfTH0cPsthN80w4bR2ZBE3T1xxkOOj1+ijeued/i
 KeuI0T7GLpYN2/HPbTg5Zhlb3+qsdfX2MU8Hg+a44a4U1hMxmlVP/6E25lMfjtiEuyFk
 s/sxWSmEfm/pbSB8C98752jeoIZ46M1K1nqnvalhgBnPvlKBaKtLmWHTJfHX7JL+2Uw3
 7T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748249729; x=1748854529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+yP9a/uVH74kLVGGvEGM7JayHygTFaXLhgBOX+A4es=;
 b=wWSJjgDk5j0nhY0sI9jEKZpAZavq6HtxaATFDTdqZBZTK/bf+A8jmY+8jE9Lorg3vH
 mcYYinPDoQHNz7SehaOKlJDPr++Zi6FsWm0Xi3v+IKlqxKw7rVAHGZ/tRuRBAxClGbRG
 aIWRHAVN2IBPRJo7cSU9TzKh1koVkRDVOqmxkZVAtsaeYXSmYMYy9ORRiBNjlkyFr2Fv
 LdEy6OS1wOg+n6oaujBZ3YHUMF67Rpuonq6Ki8aD6Op+CZqIBVCdi/ciTPJPyGVT0Wi6
 RmL0KUfjVua39bqh2GI12JDNwT4V8zKnpoQzg0gMZ+NgSv48mp6Xki3dUnrlr+UVblgK
 H5yg==
X-Gm-Message-State: AOJu0YzQl6BfLHJUUNFQJ7s1fo9/kchecrmkLEzGL3jnTPmajZJy8Vj1
 OF4KrNLv7CMxiZKG/+WJ9LE1J3YpKxdMjuvOIxehgEr7f9Ug+R53KzMhVBHFXWrThQ==
X-Gm-Gg: ASbGncsW+UeqcrERdk/6MLAVjS6OgR5/QdnFeeoDvvdMVhHtOSovivifwQEVQwpRhZv
 lqohe3OrBSAAdtFqZ0rVosv4frIM8VdvSmiXm90SSPndrzH1n6GUOwNzxfeuiiQ2fAsBEsnP43x
 3mEL+c1z9fLmQN/Q/uHwsFB0ufckUeajWMvvWmOU7FsZ4aGCZWCQPZXE01dxtktqBOdyJE5l9md
 8s/U0/Z1rIh8m8fTPt4cvJskj8O7L6MRqtcbvfuACIan2aohwDH1fSc5rHcX0auCIRXZPEbazgo
 5mgpEHCghAHcHy7vXIrFepROQdNbkYYnhxChyoeM5sly9Sd+4OT9VZMvWsiCCfE/j8DgamsiS2n
 3D8bjU9P4RdpVcsylvnxGBibRmLDN4Fth1JtnaAQlQKV8KfQc
X-Received: by 2002:a05:6000:1ac8:b0:3a3:6f35:55e3 with SMTP id
 ffacd0b85a97d-3a4c14f798amr10911540f8f.7.1748249728955; 
 Mon, 26 May 2025 01:55:28 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23bfd54sm238911675e9.17.2025.05.26.01.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 01:55:28 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me, Frederic Konrad <konrad.frederic@yahoo.fr>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v2 2/4] hw/intc/arm_gic: introduce a first-cpu-index property
Date: Mon, 26 May 2025 10:55:21 +0200
Message-Id: <20250526085523.809003-3-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526085523.809003-1-chigot@adacore.com>
References: <20250526085523.809003-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=chigot@adacore.com; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0HVjS1C/gEVw

From: Frederic Konrad <konrad.frederic@yahoo.fr>

This introduces a first-cpu-index property to the arm-gic, as some SOCs
could have two separate GIC (ie: the zynqmp).

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 hw/intc/arm_gic.c                | 2 +-
 hw/intc/arm_gic_common.c         | 1 +
 include/hw/intc/arm_gic.h        | 2 ++
 include/hw/intc/arm_gic_common.h | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

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
diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
index 48f6a51a70..6faccf8ef6 100644
--- a/include/hw/intc/arm_gic.h
+++ b/include/hw/intc/arm_gic.h
@@ -27,6 +27,8 @@
  *    implement the security extensions
  *  + QOM property "has-virtualization-extensions": set true if the GIC should
  *    implement the virtualization extensions
+ *  + QOM property "first-cpu-index": index of the first cpu attached to the
+ *    GIC.
  *  + unnamed GPIO inputs: (where P is number of SPIs, i.e. num-irq - 32)
  *    [0..P-1]  SPIs
  *    [P..P+31] PPIs for CPU 0
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

