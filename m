Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BA4CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 05:53:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcdq-0002xQ-75; Tue, 28 Oct 2025 01:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcdV-0002kv-4n
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:52:50 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcdO-0004eU-Hv
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 01:52:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4298b49f103so1841252f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 22:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761630759; x=1762235559; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8YWr4zExFLVkS/USY8dnF7Z2qM9YsNMJfD7DIjDOS2k=;
 b=dpqQRL6Uox8vlwm26IU8dTzsGXZ9VXjOvRf7bEOXsogigNHBuMaCIFVQY6LxhCYvHK
 E/HzOSUmyO5WQvfIQIsEeUAJsZ7k1U/+lzsxlbq/fC8QtQ/fovq3y3kWoqQUmF+V/xpS
 3sMzQkxsgOHqquiUSnHPqTHkP+YFhD6RDFv0q4G5ByhLwG07v0Tu9bS0NsC1vYY9pB88
 NNojA9K8pcn7jdwzrnSXtKoHvsRTmH8pZXnbOKDw0A102Y340RyPUPtqnlEw1QjeMdM7
 WMbbimhcDKCZpKWBcgbDx08N1wGd/K3rCVkkAG3SK3J9NJLv/il/rYIqlHOZqeionUrO
 x9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630759; x=1762235559;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8YWr4zExFLVkS/USY8dnF7Z2qM9YsNMJfD7DIjDOS2k=;
 b=fFvmx8UW9DZgh7KU4bCoyiI/rxSwfD7F9ebJemsOKJXExmsMU1+XH80PIHKSFHYIl+
 PvH6g1D1gyZY8et9+tK0jvLRwKuBahAB2hEfaSkZisXoaXT4DI5xiVpqxd+riYchu+9P
 Z+IirvoRE2Q90ZsYGHi4TBZvplA0YD1tnEILvdgv/GSm+9nMBtsF+ItxtmchrkYFmZJP
 zNv1L8jcB53Ikx0gPBcNeBC/yrdiEZlgr2U6uY83QI3lH4Wg5AXt3SnqXBbdOnw1xmCG
 2Nn7bI7FaL6nF6Wd380CViG+oQ7E6vzsTSoWlNRz/iztq2cDW0imd9j+gW7CMnkXTPiQ
 E4yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCZsF+DdrmOmwJQfjCRqrObcPkphtx5HErgrKNkvsNe+4zvyHUxmzozNO2cQZ93or8OVwda4TDXQ==@nongnu.org
X-Gm-Message-State: AOJu0YyymO3ha/lPs1BM24hZUpkoK843ZRaFhTV3JWIIv+II6YPDsQCS
 vNVmdI+pPRF6hdb3geGotzVFlLzZLpr0wMLG1BluhBLTRFEKmhPWBQmdJ6LknfLbqMU=
X-Gm-Gg: ASbGncvea4dWwxz6GtegcaqemVmN5AD25OJ1eeGaSiGhHy1l/TkMWekR7i5HwBZo0cz
 Q2wHsSGH0/1lVcbZTU1qbGJwUjeVEEQPyufxf9It5Gg9lT80vm4I2GPHnJbGO5wtQ2n/EwhoAqy
 TBsbufNKUX6gk4vi1jYJ8Kh4OoOInjiX/OxYXpSRu/oNG9MMAia6/XUtCjYvavW6TOgPkI71WOK
 iRZ+unsQSnIhEuTT2X681Z/GP977Hgnb6GD1uulgdy4XBUmJz3hBQ6H10G4+EmPY0cGiI4o1jGu
 vw00nINrGPGuNKuM4DjT6GI3+TxKi7nYkNGijD3ADeeru70LJA/r0FcX/SNqb3D6DazWSR/xrbp
 nvd5H9jmLNfNuPyL7rPJCoDWdGrMiEwaB7ojRiYCnV5dTtrMvvS4LY5PV8eAZmpMsrZ/QuCSw/m
 dexUwfzB4u2wqNWCnj/cmu5uQxsiCuOXFi3ZxgTp/utqeBOyzAws6/1GAvqHLH7hAvOQ==
X-Google-Smtp-Source: AGHT+IEU+6AGBILbNEuL0jb6gAUIa/xcXtVWRBjASXgzq1ozrB2LUf/RfnLi6wjhcKCVRCxMe6Y1Eg==
X-Received: by 2002:a05:6000:310e:b0:427:699:a9cf with SMTP id
 ffacd0b85a97d-429a7e7c2ecmr1728040f8f.33.1761630759244; 
 Mon, 27 Oct 2025 22:52:39 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771902991bsm10490925e9.7.2025.10.27.22.52.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 22:52:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 14/59] target/arm/hvf: Hardcode Apple MIDR
Date: Tue, 28 Oct 2025 06:41:50 +0100
Message-ID: <20251028054238.14949-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Mohamed Mediouni <mohamed@unpredictable.fr>

Hardcode MIDR because Apple deliberately doesn't expose
a divergent MIDR across systems.

Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index d13ccf5508c..890e9266f93 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -763,6 +763,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     hv_vcpu_t fd;
     hv_return_t r = HV_SUCCESS;
     hv_vcpu_exit_t *exit;
+    uint64_t t;
     int i;
 
     ahcf->dtb_compatible = "arm,armv8";
@@ -781,9 +782,19 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     for (i = 0; i < ARRAY_SIZE(regs); i++) {
         r |= hv_vcpu_get_sys_reg(fd, regs[i].reg, regs[i].val);
     }
-    r |= hv_vcpu_get_sys_reg(fd, HV_SYS_REG_MIDR_EL1, &ahcf->midr);
     r |= hv_vcpu_destroy(fd);
 
+    /*
+     * Hardcode MIDR because Apple deliberately doesn't expose a divergent
+     * MIDR across systems.
+     */
+    t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0x61); /* Apple */
+    t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf); /* v7 or later */
+    t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 0);
+    t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
+    t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
+    ahcf->midr = t;
+
     clamp_id_aa64mmfr0_parange_to_ipa_size(&host_isar);
 
     /*
-- 
2.51.0


