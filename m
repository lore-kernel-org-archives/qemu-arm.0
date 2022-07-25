Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1021094lfg;
        Mon, 25 Jul 2022 11:20:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1udAoWpGLD5iyjUViwuWtvm0rBUg2JzeEGkCwD9V7Z2r++Y6Upg2hOtc9qoFsu6Sy6MKYmE
X-Received: by 2002:ac8:7dca:0:b0:31e:f231:6f76 with SMTP id c10-20020ac87dca000000b0031ef2316f76mr11675276qte.568.1658773234156;
        Mon, 25 Jul 2022 11:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658773234; cv=none;
        d=google.com; s=arc-20160816;
        b=qWIerENLObVzdfPdxfFLEhnp8uKE6HGcQ2G1GhoVAXX2+2WLQWdOqwMkl7gP3qhH7N
         SykjsJLx0luVSZ5hoR4kLZD6QWeSe6oviohqsZJp97smDEtZFS9pmTg84EohtwZSwcSm
         bZj/YHIRa+KJRcvvUN/1+ufOaDx6zqxBJjoGkXCgYoWI9eYqHQbiiukw7arFZ+AdEoz+
         jcWA1/4vkA+/CwEuXkBkHLaYF83PjHAq8jfbRmeF54+L6bb1cwLsfpVvpeTQPonQLqFl
         8fsnPTNs8vPqjr6vYGlqm5XWdZi99gTsYCeenWdr4vPty2DQABG/evTobNua3M7UcGhv
         5RUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RMuYv4EVFHYkxhumjJ2SxEr+kwKlkg7raeV+cD/IvUA=;
        b=r8olLQIiLz3zDM43UHS/Yy1/pOinIgHoD5SNXs/OsCqnFwL6D2zA3RMOAM3TvpjLoS
         UBUQqXf1QI08daewVBCc6x2wtiuWdUkGY+XDFZ4urzEh0Ae6JmiFtAlGtbUP73ERQayP
         mmDcTBPOW6Emfg+7lDxzPTF6HgDXvATfZE54ObcU4X8AW5Z1r3JQRDpRRQI/D3NGvXgP
         NoiwMjHiw5H0o420jLY4qQz5CqcH4TM47YQX/J5UnnIyXVw6Z2zkctXgwMN9dBi7wrbk
         5AmzxeRao1bjVxJY3mBk2N3CsoG9PnYQ58EXNVGUrXJJOCfElrf+1A7xh+lYf4+vEaEH
         CMwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdkKLSsn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge13-20020a05621427cd00b0047421fb14dbsi5263566qvb.61.2022.07.25.11.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 11:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdkKLSsn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oG2gz-0000Do-KA
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 14:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bp-0004mk-8q
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:15:20 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bm-0005qT-He
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:15:12 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 v16-20020a17090abb9000b001f25244c65dso7725325pjr.2
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 11:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RMuYv4EVFHYkxhumjJ2SxEr+kwKlkg7raeV+cD/IvUA=;
 b=gdkKLSsn67CGhJcgVZK6E1oznK8FiA2GeWq8C5g/ShfoaiPh7tWV3dMdpTGb1uKEhM
 x7adCPIMCKbE5h1nf3LOQkd95D8YEruVYo76URWAmy/PN/RI0poGBdafZYcoUhvarlQX
 tYD8TMikMYuxhi2hNttDdklf909MIQcgxZepLxEn+pzn/+9SJV4c/IDYGaKqnVGg1Dk0
 jVcbdRRf7hQbilgjF6YK8/M5SBTHlQavxHu5AMhCclx5MqzL0kGntA7w2KTvF+ijPpFN
 yEJ+OGdg7R1KfOpfOJ5+E1QFVkdluph/gvw4aNR80bzghkcqrd0LiBEyvF9EqtYCOFG2
 7oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RMuYv4EVFHYkxhumjJ2SxEr+kwKlkg7raeV+cD/IvUA=;
 b=EjMJILagVC9DFsET3DG5112zTshv9pr4VNMxmPdZcV59t9be6u10XWa4ZdEg3LExHr
 axY1wX0dk1Y5LFZZHVYyl4+VI3j6R/hU0hycRK0W38zJxuKmFBjuv0K4KbtIBS580W+W
 QSKrS4zOlODvVLypE/ZitejPuf3ccuoJMtZANu++4J7OVOmAMMmLS69rVBmpRrY7A5Yv
 utqBPRQoJPq8Bwb0lCT4OhoE4hfIzjkGreNB77z3dgH3QNFlsxlKf8hl6Cykzz2HRdC4
 3qlfVyxN/7pq/mOYaIVx2E0ej89Fkrve/UK+tFZ6aKqiPJakG1uBAN2sfgQ/t6jYmqO1
 iHpA==
X-Gm-Message-State: AJIora/1Or8aXJHmff6V3IPcg46SDqIyFa8M/8lmH1lRhYQmd5POfskG
 2dshFmPcSd8+p9fawwgwnRPOjw==
X-Received: by 2002:a17:902:8b88:b0:16d:2a70:26d9 with SMTP id
 ay8-20020a1709028b8800b0016d2a7026d9mr13502777plb.84.1658772909150; 
 Mon, 25 Jul 2022 11:15:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b0016d8d277c02sm1125004plb.25.2022.07.25.11.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:15:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH 3/3] target/arm: Move sve probe inside kvm >= 4.15 branch
Date: Mon, 25 Jul 2022 11:14:57 -0700
Message-Id: <20220725181457.41083-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725181457.41083-1-richard.henderson@linaro.org>
References: <20220725181457.41083-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vr7IZlMrM8LF

The test for the IF block indicates no ID registers are exposed, much
less host support for SVE.  Move the SVE probe into the ELSE block.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 8b2ae9948a..bc3d7d9883 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -684,18 +684,18 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
             err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
                                   ARM64_SYS_REG(3, 3, 9, 12, 0));
         }
-    }
 
-    if (sve_supported) {
-        /*
-         * There is a range of kernels between kernel commit 73433762fcae
-         * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
-         * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
-         * SVE support, which resulted in an error rather than RAZ.
-         * So only read the register if we set KVM_ARM_VCPU_SVE above.
-         */
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
-                              ARM64_SYS_REG(3, 0, 0, 4, 4));
+        if (sve_supported) {
+            /*
+             * There is a range of kernels between kernel commit 73433762fcae
+             * and f81cb2c3ad41 which have a bug where the kernel doesn't
+             * expose SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has
+             * enabled SVE support, which resulted in an error rather than RAZ.
+             * So only read the register if we set KVM_ARM_VCPU_SVE above.
+             */
+            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
+                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
+        }
     }
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
-- 
2.34.1

