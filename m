Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2920908lft;
        Mon, 27 Jun 2022 22:45:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9uxpnTKyzZnCvZJ4S6sBsUh0glU9vGaYectLSvlkhK1hP0IiTAvCEv6C1mXZcieEW+emU
X-Received: by 2002:a05:620a:1aaa:b0:6a6:d022:7e08 with SMTP id bl42-20020a05620a1aaa00b006a6d0227e08mr10307357qkb.143.1656395135351;
        Mon, 27 Jun 2022 22:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656395135; cv=none;
        d=google.com; s=arc-20160816;
        b=NRHdYaE+hHAur5PyQxAoDLub5SB6LmAiPPckLN2AwCRoP5Oyhi4JOCpvzBgtaQeBKU
         oulhRJ17n1Sz6GOm43tChn5+H2BMlmAOI9f/8wYqczxj7KuP229A/ThlMRic7CQdehJg
         oKMIrZMH2/WWelysG6ekmt+/rN1AODxPGGt5AYj7MU20b2/uxnQhcyqUA2q6f5ZwZHlY
         WqBrs0nb97wqevB/wQBjAbeK8JnoC++j5oyG7wpdPxaYtfIgrRU+31FaCu0LwaI9dCZg
         Bsl1th7WQfTpc5Dm4k8kcKFmoZ9/0/ewE7L3mgBgpKkr+iLJpx6HF+pSQ3SV9wBqDGnb
         9yAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
        b=Vea/TweWDOKOMAkgUl++3JTtrw2YSfb8IDq8Rriy1j5CaAgEIucFBpYE8ILFnMewqZ
         bA+78Mv84phu7vpR5bLuugGB8KR9xej6JgMbK1CNSgK2ZTz3YLxXKLfnGukIaFK+avk9
         QQyxJXIEEHDhwTB9H7cvRkrljJko+Wwr16I38gKeTQU5QV8KatyryHoImOrQwc+SJ1lI
         +KqaD07qzk9716f7ykI2gjbJSOKmLuN3p0L1kOxN+DVrgubWmEyUlkSW8yYx5fh9HwJc
         vsfilKPrQzqDbF1Wv1ojZ8GVgBj1si8uT7CqfJ4goWI52R/ETX+3SYyRrOeVYdx5LVdR
         B5nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCmVON94;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05621420e300b0046bc5d570f1si6630378qvk.92.2022.06.27.22.45.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 22:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCmVON94;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o642Y-0005H1-Id
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 01:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kq-0002wW-Kx
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:23:13 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62ko-0003nk-4J
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:23:11 -0400
Received: by mail-pf1-x42a.google.com with SMTP id bo5so10902827pfb.4
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=vCmVON94gl4G2Y+bZqxMm2Q6igB/O8sZ2JUs3RBmf801kLb5ANfdrNhXCBXTbrE6rW
 FWusndL4okxMTEPF4rG/gqF98GgFESQyNff6kLeV+YUKxUG0JQ3jB44UsmusDAIBDcri
 GyU5QzfdziOzDODjTHuV2TPgZ1fyaC3BsR+aF2KJISanHuZFu+qVYcC0a4VHyiKArgNz
 Yp2PcOtQwCMbv0w3bhXSXIGG1M2XfhfFFwooQn0jfaWrTn6YABzYS3KrWLcO66lKHnAE
 TA0l4mP5w8x1mEQrcNESjCGGIWstPNYEOQ8Ci5Ok/i1kPjvTzb9cQJXOE2S8irQZcWot
 6XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pyZCOGTvs2PmDR4WHKguGZ+NHJT+1M/Dn/XfXNcerpI=;
 b=2/f/iJqtsyBv1oJAARMdpnuhg/JPIaf5zUs83U6FVMz4TQEhwQHIQYLiZhziYs5Z7f
 0k4TkQVKedBe7cqhSBYjFgpz8rhyvMEBEhJUGjuudjRkNB5WmdPTqq+ExvWV91zwsgTS
 DHKnFPsvicRbjEBFh3dcW3agSJEYy2vguSnIdcNqRZs9HY8RAZp+G4XNYYdCS96BjBl1
 6bHTdX91t74e8l8Av6aEDFp1LsCxgr3RuLrRd1kwUiN3FmNVOsZpuBJU+AEzRkmVLDzj
 8NkXCJXHeamvPQRmCcAHmqfn9Zh/z8C0Q6zvgzc5HfthFAqYIlLpK0GM3CQrbfHFOdM7
 4+iQ==
X-Gm-Message-State: AJIora8vxnN8QdDw8jnZ3KbQfQev/sKoWi8jiesBj2AfFxTW7mEkOt1J
 Qu/df2ObAHTfj5qI56QbEYnAbA==
X-Received: by 2002:a63:1759:0:b0:40d:5aba:4bb0 with SMTP id
 25-20020a631759000000b0040d5aba4bb0mr16085440pgx.496.1656390175165; 
 Mon, 27 Jun 2022 21:22:55 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 39/45] linux-user/aarch64: Move sve record checks into
 restore
Date: Tue, 28 Jun 2022 09:51:11 +0530
Message-Id: <20220628042117.368549-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: lWCifGLdIJzC

Move the checks out of the parsing loop and into the
restore function.  This more closely mirrors the code
structure in the kernel, and is slightly clearer.

Reject rather than silently skip incorrect VL and SVE record sizes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 9ff79da4be..22d0b8b4ec 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -250,12 +250,36 @@ static void target_restore_fpsimd_record(CPUARMState *env,
     }
 }
 
-static void target_restore_sve_record(CPUARMState *env,
-                                      struct target_sve_context *sve, int vq)
+static bool target_restore_sve_record(CPUARMState *env,
+                                      struct target_sve_context *sve,
+                                      int size)
 {
-    int i, j;
+    int i, j, vl, vq;
 
-    /* Note that SVE regs are stored as a byte stream, with each byte element
+    if (!cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        return false;
+    }
+
+    __get_user(vl, &sve->vl);
+    vq = sve_vq(env);
+
+    /* Reject mismatched VL. */
+    if (vl != vq * TARGET_SVE_VQ_BYTES) {
+        return false;
+    }
+
+    /* Accept empty record -- used to clear PSTATE.SM. */
+    if (size <= sizeof(*sve)) {
+        return true;
+    }
+
+    /* Reject non-empty but incomplete record. */
+    if (size < TARGET_SVE_SIG_CONTEXT_SIZE(vq)) {
+        return false;
+    }
+
+    /*
+     * Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian load
      * of our 64-bit hunks.
      */
@@ -277,6 +301,7 @@ static void target_restore_sve_record(CPUARMState *env,
             }
         }
     }
+    return true;
 }
 
 static int target_restore_sigframe(CPUARMState *env,
@@ -287,7 +312,7 @@ static int target_restore_sigframe(CPUARMState *env,
     struct target_sve_context *sve = NULL;
     uint64_t extra_datap = 0;
     bool used_extra = false;
-    int vq = 0, sve_size = 0;
+    int sve_size = 0;
 
     target_restore_general_frame(env, sf);
 
@@ -321,15 +346,9 @@ static int target_restore_sigframe(CPUARMState *env,
             if (sve || size < sizeof(struct target_sve_context)) {
                 goto err;
             }
-            if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-                vq = sve_vq(env);
-                sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (size == sve_size) {
-                    sve = (struct target_sve_context *)ctx;
-                    break;
-                }
-            }
-            goto err;
+            sve = (struct target_sve_context *)ctx;
+            sve_size = size;
+            break;
 
         case TARGET_EXTRA_MAGIC:
             if (extra || size != sizeof(struct target_extra_context)) {
@@ -362,8 +381,8 @@ static int target_restore_sigframe(CPUARMState *env,
     }
 
     /* SVE data, if present, overwrites FPSIMD data.  */
-    if (sve) {
-        target_restore_sve_record(env, sve, vq);
+    if (sve && !target_restore_sve_record(env, sve, sve_size)) {
+        goto err;
     }
     unlock_user(extra, extra_datap, 0);
     return 0;
-- 
2.34.1

