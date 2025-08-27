Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B4ECA0FED
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:08:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4bJ-0003bl-Ra; Tue, 26 Aug 2025 21:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4bJ-0003b6-9C
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:05:21 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4bE-0007E6-4J
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:05:21 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-76e39ec6f30so6052494b3a.2
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256713; x=1756861513; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NJ36daKgzfDvSRHW7lcAsbWEFxZLgKLsVjEywfc7kDk=;
 b=Ep4/8642ePJMgJ/6cGVS+VrKeCIRKlbJiLYwoMcYg+IDitzPFySqeSImUPbudkAC2n
 LffPAzlx15ITPku8pOIpOIH5Y6ZJl8iIpltlfoRqB1d4RuTqxCPPc9rrOJnYcGxvjxQr
 BzI3+BmOuaSIZT/1ZeGRSM3dl7uj+w1/l+ax+AaI9uDlgXH6XdNmPlzNlLw31InW/h5G
 NhoGFuvGLUWSUutZJ7BcgiR0OO9WwrwgC583RXrN5cBZSx/JxXEy7qBs9bt+r5kmfG2Y
 lmocUYKW7l81/f94eAcmVzjukdg8J5/Cuqeii0A1UKyCvm76waBipMW+dOvYQlAmHWP8
 TR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256713; x=1756861513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NJ36daKgzfDvSRHW7lcAsbWEFxZLgKLsVjEywfc7kDk=;
 b=sULaFwwE9owKAvhYs0TRtQREx0zBylWCrId4XMHZaXTicGTEl9LxMFW+JhYnVZf7vG
 2qOPx+Y7X7sJyLAgfrxh5OgK9W30lRPOLE7Ng8qcVcIW886WzsdDDA1J4J4bHAVrxYz5
 3r6ko7TrOHTXECqR2a9iaTRcaam5wmw2wBh4MJGJwLZAkyeZPh5NY0GCpIcFK8QX2EYg
 6IMbpzukSeZqwK2z7/4zAnimjJkU5Ovb912WjzJ6Wgrw8h5YlS4kHEjzOkpB0PLgv8Oy
 dmjpuJPxemUEJ7JEw7MDxQXUxIqi5Xm4iYW77UpUgGVlGtwv6wKwWS7WAVLdt6KRljyQ
 tj0g==
X-Gm-Message-State: AOJu0Ywk+A1UlwtFNbBSr3zCH29d2CT/ZbMY5ehI52xCG+v8CM9cPOnF
 9uEyz6JZDSZoWPbCcg0j4KMEgDPd6VvMO2brZG4BymLA8hu3K2dObOM1dpIzwVkqyl4=
X-Gm-Gg: ASbGnct5sB4vkQl9rhIwbIm92e04O0Xl/t+CxW7Apy8ujyBO+i8N5n8prlgnBlBUrVi
 FBEpcGm33CGRLZjy3GPouS0UST5pmlQVyQFEzcfVsX68KBaZaG7i3a4iCnHS/GZnoW0cr7nUKtv
 LE53WGmXIh/jp1q5x91F92O+K6+nz1yRY6dfnrEwyHxUoGYgZtrvjQiQSQjh+D5XbBrql7q6uXZ
 UaiL8pMlm5P2J+JPdiUnkPji7twI73Ga7NcsQ27ZHXvGH1aex0lI7e63fdZzBPlhyaWnFhcNwrg
 Gn+Vf+MeboYTVKIVfYUb8O+8Wh7Y0QicI1Bk3MiP6OPk9dtLT60G/+05ykABWrquDTOYcQnUvcZ
 8zzv38URJyFnB13zDzWfT5GX+rskqlslvijfZ
X-Google-Smtp-Source: AGHT+IEm1mz+P8Len78T9DJPNSBvGS9J/uzxCTP+IxuTPXstCNoIw2UIwel5fY92BizRcLmkAIagjg==
X-Received: by 2002:a05:6a00:3e15:b0:770:5822:ae30 with SMTP id
 d2e1a72fcca58-7705822b1f6mr11518438b3a.19.1756256712905; 
 Tue, 26 Aug 2025 18:05:12 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:05:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/61] target/arm: Move compare_u64 to helper.c
Date: Wed, 27 Aug 2025 11:03:49 +1000
Message-ID: <20250827010453.4059782-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

We will use this function beyond kvm.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  3 +++
 target/arm/helper.c    | 11 +++++++++++
 target/arm/kvm.c       | 11 -----------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1b3d0244fd..08e2acdb99 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1981,4 +1981,7 @@ void vfp_clear_float_status_exc_flags(CPUARMState *env);
 void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask);
 bool arm_pan_enabled(CPUARMState *env);
 
+/* Compare uint64_t for qsort and bsearch. */
+int compare_u64(const void *a, const void *b);
+
 #endif
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


