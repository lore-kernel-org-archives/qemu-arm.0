Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D87CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtHK-0008T4-Km; Fri, 15 May 2026 10:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtHI-0008Mh-Sl
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:36 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtHG-0004KJ-1m
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:36 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso106043335e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854353; x=1779459153; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apMFV5d0tB1kr05BjYFhBcn37xH7cGfXBd2nTWR64H8=;
 b=UFSfmiPI7Grw4RaicIfg7NDnHqpLHK5OsXt+6/gOuxPPrzALBaDdw3XDlR25EUJ9W0
 FpB1PlksQGkfl3sB5Cmm3mF7Cf05MGhTnA03fnJLDvKtBoh0Kloke4Cak8B+mbL2WzGu
 SXFa3JSa0rf7WyCvuvOX1ck/3CltbDtIH0eqKfgIUH/4DytPODz50Dipi47gKFcpf83/
 c6EPLu46mXYtxf/XHVwoBCOWFZzPArDYsLFqNDpzu7MysfNSk8Dw+Cxqa6xoLcwEOGfc
 4TYokGLwMjm+wKHhhpjEIEUuAdOrxV8vqJz9bYRyw5Kll+Go2/CSpbIYb1XQ2m4MKT8r
 PHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854353; x=1779459153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=apMFV5d0tB1kr05BjYFhBcn37xH7cGfXBd2nTWR64H8=;
 b=KZhrU5ilhcwpd0gzdcISjE9bAAjTgRgS3CcGhRspG/Qou7Li8H074NyO5DnJ0pAkl8
 UvdOsrjbisBR/UupLnK9AP7+4YntHiapuB6SniMlQqBYozCYoZKXYaeLsqDjYQCVn6m0
 oyKpf042u/3PTscZVP2V9voJFa+qU+HmaBhsANPReA00jZsB+RBNj7z77h/2DY0kh492
 le2rdbins3P3/oqKaKnskmsjl7rP7foggCVwBsPjzwPo6XEnzx+lMXg1QoPE9DQSrzdd
 u7bQMzwoOwTxDJlSP7iLKZNXm3AhL0uy8XUS2h3bvXa2OSjba+l4NGjW64iwX7Ok3CJz
 cT4g==
X-Forwarded-Encrypted: i=1;
 AFNElJ80Oj4gFgQX6HVQM3aqioaRISU0MWxDnSWxNUS6hsq6+kGZ2Gzt7LAj7m4/pZXxwJh5PiN1u56gMg==@nongnu.org
X-Gm-Message-State: AOJu0YxSOLvu5OL8aKthPRABqlNlKsT5sqFTlWS4K+ZMg7RQdChLMRQS
 KELHCIEyFrLiHJASlqekVYy5D+uOj/aFhwBCNrQcyWpd7BKz57w+3YIc1EZaPr0c2pY=
X-Gm-Gg: Acq92OGWCtst+gGwKqxwv4TKHNXu2kGdDKIWNJzMRIVYA/R22Dh3znHGh5fiAJ1jH57
 g3LH2ERCVaD85PJiox1K7bqNbxwkPlCEBR73SQRzCZnk+afrgC350cqnKEpypCWj23+hwB1iyqb
 wEWRSpY12wjLzBJiluVUAEYMQ7Yomeoa2MMm2+666kdbd/QhwBTCdMfcQA18wfv5DYyKbujZV6J
 jqBkTgcwc24Igm5ZJHCDdnoY/tZeBkrN6rmCn/HmcW6XGO9VN3a5o7T0f29Ukp68+10Foqmd0E/
 iDYQBRxKU/A97WMB9085AtLfvjOd5CV5d1tpdme0tqp42RZ82zrpfv+NXpoW2yJh9k2nnH6r64X
 l+B50ySYUHzybz9Ycplt8DMzBMJq/kt9tBydtpT3LIFDB3RNozIlYYoQqzpQMjkEM5sLgPG7GKU
 WSu1i5Gd1/pTF+0dxVMhl9KNVuEP5s3ohfsg3fY0hOPWRK1K5GJdUZDBZJmyQgvLKpe7YqjSy/
X-Received: by 2002:a05:600c:3b21:b0:488:78f2:6b0 with SMTP id
 5b1f17b1804b1-48fe651b39dmr54784975e9.29.1778854352410; 
 Fri, 15 May 2026 07:12:32 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a6449sm14577385f8f.37.2026.05.15.07.12.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:12:31 -0700 (PDT)
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
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 16/20] target/arm: Factor aarch64_aa32_a57_init() out
Date: Fri, 15 May 2026 16:10:27 +0200
Message-ID: <20260515141032.3271-17-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

In order to make the following commit easier to review,
factor aarch64_aa32_a57_init() out of aarch64_a57_initfn()
as a preliminary step. We only add a %aa32_only argument
to restrict AArch64 features.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu64.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7b2f09cf8ec..7dce17fdb20 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -686,17 +686,20 @@ void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
     SET_IDREG(&cpu->isar, ID_AA64MMFR0, t);
 }
 
-static void aarch64_a57_initfn(Object *obj)
+static void aarch64_aa32_a57_init(Object *obj, bool aa32_only)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     ARMISARegisters *isar = &cpu->isar;
+    const bool aarch64_enabled = !aa32_only;
 
     cpu->dtb_compatible = "arm,cortex-a57";
     set_feature(&cpu->env, ARM_FEATURE_V8);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
     set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
-    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    if (aarch64_enabled) {
+        set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    }
     set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     set_feature(&cpu->env, ARM_FEATURE_EL2);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
@@ -727,10 +730,12 @@ static void aarch64_a57_initfn(Object *obj)
     SET_IDREG(isar, ID_ISAR4, 0x00011142);
     SET_IDREG(isar, ID_ISAR5, 0x00011121);
     SET_IDREG(isar, ID_ISAR6, 0);
-    SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
-    SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
-    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
-    SET_IDREG(isar, ID_AA64MMFR0, 0x00001124);
+    if (aarch64_enabled) {
+        SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
+        SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
+        SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
+        SET_IDREG(isar, ID_AA64MMFR0, 0x00001124);
+    }
     cpu->isar.dbgdidr = 0x3516d000;
     cpu->isar.dbgdevid = 0x01110f13;
     cpu->isar.dbgdevid1 = 0x2;
@@ -742,14 +747,21 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
     /* 2048KB L2 cache */
     cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7);
-    set_dczid_bs(cpu, 4); /* 64 bytes */
-    cpu->gic_num_lrs = 4;
-    cpu->gic_vpribits = 5;
-    cpu->gic_vprebits = 5;
-    cpu->gic_pribits = 5;
+    if (aarch64_enabled) {
+        set_dczid_bs(cpu, 4); /* 64 bytes */
+        cpu->gic_num_lrs = 4;
+        cpu->gic_vpribits = 5;
+        cpu->gic_vprebits = 5;
+        cpu->gic_pribits = 5;
+    }
     define_cortex_a72_a57_a53_cp_reginfo(cpu);
 }
 
+static void aarch64_a57_initfn(Object *obj)
+{
+    aarch64_aa32_a57_init(obj, false);
+}
+
 static void aarch64_a53_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -886,7 +898,7 @@ static void aarch64_max_initfn(Object *obj)
     }
 
     if (tcg_enabled() || qtest_enabled()) {
-        aarch64_a57_initfn(obj);
+        aarch64_aa32_a57_init(obj, false);
     }
 
     /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-- 
2.53.0


