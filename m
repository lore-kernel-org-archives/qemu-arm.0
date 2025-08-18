Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2168CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 04:25:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unrQa-00084T-Ue; Mon, 18 Aug 2025 00:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrGA-0005oQ-Ax
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:15 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrG8-0002CI-L0
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:14 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-323267b98a4so3015737a91.1
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 21:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755490451; x=1756095251; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bTfdSLA0aqt0pUrLTWLPJvwrF5/GVtbYLzuNkuYs9EQ=;
 b=JPKdbpdw9g0Qdzy3y3j+GAwW14uskGKUxjr8b6FVRfcXLgOcuwIgE9eLzxI61dTRMx
 2b7Uj4M6PPbMlbr+MmOPiML+IZSYn2lNN92FpKmC3H7s/a9nNGDP9srQYwJRkWU246tT
 YsHPsu+p4Z6Y/bFWIdkog+YD+H13a6+3nD3ARy9YmP34p69NXV7bg3cZEphWOTQau3ya
 3/Z1Xb//Dx8ZD3TUFEmDqXgsN3c/HEx5BAZPXDYc5Ji4pm4u7U2nXSgPS2SndESdNTZX
 KTVxwGnBMBXB63VGmRCK1DbxZtY/GV2Rla9BDDVH5l4Eatyi84hkcANEBfCRcQVxxqhM
 HPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755490451; x=1756095251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bTfdSLA0aqt0pUrLTWLPJvwrF5/GVtbYLzuNkuYs9EQ=;
 b=agRubFNaPKX+0PJzwlZxpWkdQjXqb/l0ge6plVn9iPsGIEuMVbmtiaig/zRRXndSQO
 REbGTZN2YvfpiMp/K3noFCj5qWEGLCm+fd2vaCgCOVQo9VlS9HYHXZ453UGuhRuw6GaY
 wCucbKwB4bXf7rR91OutGqKCGRzOYdGNDrYZROTgAIxMjDlV99O8DcB1hNyqac5x9AWV
 noTU08QBN2Vr9SibgF0+nS0UR5YAmktNIBRcizBcEA+615XsgFl+WqlxeI0VWZt3K4G3
 PbXu9vFCAnlXNztqO1GpkkZdRM5/eapU3kzHD4/wVJZEo5mIIzY+k1IUjFSErWtRcWfx
 p8IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPrGW41KPvkBlD91fKDsDNoso47+c3eSEmI7B+gZcZgDtUrb8InHb+xufvuKjWtCQKMGEdZAjbzA==@nongnu.org
X-Gm-Message-State: AOJu0YwlcgdXS0IDnDo2iNby+fjSEkLjSS3xmtD5kqA29XenKlkLFFPT
 nXwR0F9p/T0F69/JNasX9AveK/F1NUQgeJQHQabERGX8hcFwaM6+qCwKJ6SNrXyPq1Q=
X-Gm-Gg: ASbGncs9X8E0ttivk2KbBMmJHFgpbksB0QnDnf892PkQLl/ZkFLIZWAQJZsgJ/ub+ti
 bjQHcEcqZRcIfHrISSxHMl/PMXz9gsZboW3HAkiUAz3DOzEqbN3dzjT5EZ4TjCe+M3FB9FkIAw1
 zr9GjRkkEYoENXoxj4Rn3MUzMSkyElAj2wDbWSrvXBmDwftw8OQSZRa52CdzE1EiL3uyHlFD/xl
 fIwDewPT3dficB/tb4ZxVve8kaEwfeoMIHRh0efnif2JG/oJWK2sfp87thRyzealHowo3Sj2iH+
 lEG7FDY6CqR3mq6Lqil2doJn3onb5GO0LU//51UERDxDrLrM1COq/4cIupC8NlnuQ3ir+i2tdDt
 Y6n3l2fW9gtdW3g5SoHju1EMujdYwK5QcfgHAZKp9BCyUsmg=
X-Google-Smtp-Source: AGHT+IGdErE1IGOIXT4wRJMngyZK5ECh/vUtMFj3GcPqVhvfGDdYH+rSH5BFl9vY+Qz16lOzFXg96g==
X-Received: by 2002:a17:90b:1dca:b0:321:87fa:e1e8 with SMTP id
 98e67ed59e1d1-3234db6f096mr10302724a91.2.1755490450817; 
 Sun, 17 Aug 2025 21:14:10 -0700 (PDT)
Received: from localhost.localdomain ([206.83.122.207])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232f8c8e4bsm5498344a91.2.2025.08.17.21.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 21:14:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org, philmd@linaro.org
Subject: [PATCH 2/7] target/arm: Move compare_u64 to helper.c
Date: Mon, 18 Aug 2025 14:13:49 +1000
Message-ID: <20250818041354.2393041-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818041354.2393041-1-richard.henderson@linaro.org>
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

We will use this function beyond kvm.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h |  3 +++
 target/arm/helper.c | 11 +++++++++++
 target/arm/kvm.c    | 11 -----------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index c9506aa6d5..2854960c08 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -1189,4 +1189,7 @@ static inline bool arm_cpreg_traps_in_nv(const ARMCPRegInfo *ri)
                        (arm_is_secure(_env) && !arm_el_is_aa64((_env), 3)), \
                        (_val))
 
+/* Compare uint64_t for qsort and bsearch. */
+int compare_u64(const void *a, const void *b);
+
 #endif /* TARGET_ARM_CPREGS_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0c1299ff84..d230f9e766 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -40,6 +40,17 @@
 
 static void switch_mode(CPUARMState *env, int mode);
 
+int compare_u64(const void *a, const void *b)
+{
+    if (*(uint64_t *)a > *(uint64_t *)b) {
+        return 1;
+    }
+    if (*(uint64_t *)a < *(uint64_t *)b) {
+        return -1;
+    }
+    return 0;
+}
+
 uint64_t raw_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     assert(ri->fieldoffset);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 6672344855..9e569eff65 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -718,17 +718,6 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
     memory_region_ref(kd->mr);
 }
 
-static int compare_u64(const void *a, const void *b)
-{
-    if (*(uint64_t *)a > *(uint64_t *)b) {
-        return 1;
-    }
-    if (*(uint64_t *)a < *(uint64_t *)b) {
-        return -1;
-    }
-    return 0;
-}
-
 /*
  * cpreg_values are sorted in ascending order by KVM register ID
  * (see kvm_arm_init_cpreg_list). This allows us to cheaply find
-- 
2.43.0


