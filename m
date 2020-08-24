Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2612695lfy;
        Mon, 24 Aug 2020 07:38:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMu3Vfmd9+Top11zr06o5dyS6ZArzWcanZRVeZKm0SX7j7MTnNe9ngCq0E5I/zgVZY+r9Y
X-Received: by 2002:a25:aab1:: with SMTP id t46mr7289097ybi.249.1598279930505;
        Mon, 24 Aug 2020 07:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279930; cv=none;
        d=google.com; s=arc-20160816;
        b=SAO6lzXGBjlG4pauGv5lsGP73q33Z88ITr9pN3LRTYaX4hGzS/SdUl7zrFUfHkkLQD
         ag4a6uWxyfY5FP9exTLxvSUDHKfONY/NsLiWkZwNit7xSCbiCQ2PFQ/qGiN3jIQarwPv
         g+D5Z2WDRrGboYFAGNpvAKCpJz+e6ujXWY27lR3jZMpIMSyh+Ws0bojQJajrzG0ApuXA
         5rfKv3mYTgPdF3kBLsVQdzDmTfSmz0BMPNmxZb1c2mwvXBBCKo58UlGxyQYNBiK0fhtK
         1lnMvcYR0/hKR5hNcCkefd7wPdJM82RU4/i/YQRqimUJweMkEQa/C2/xsCzr2S9UdfXH
         1HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=inJTXdydeioKk9+qU5p3iyt7UI/PdU5N/egNEICi6fM=;
        b=HVPLskeFVFN9KgHx+9UQUI+BrOn5xqMu8KqXM0bbm+tCIWxOvHnunewYzzzEQJOuAE
         eoj+uwwTN8XjVbwm19dykUHSRBcffHnjcalHSMNAgcVoXSGvA+xidV985FRzjHX7BZO5
         dxhfNhSpqIERmRYUo1awGWhY9TruThEJADv0hNqOkGbVyB9DOwaIJSSH0a0Ww3Cu6zdE
         FmFCJLakm3bkKA+ZYMTtiBDsySWICIvuZKd7zauyqJg1kqodN+AbHsHju8TiPuRROkww
         7K4fPNgsZxeoXtWMl+uJlosFI+FEKIewOEr6wTJvdEDBTyVh61S1MnVFChAcweYSDHQR
         CYMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pGp7iNYF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si10793547ybs.77.2020.08.24.07.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pGp7iNYF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADcX-0006hn-K5
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTy-0000Fz-8p
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:58 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTw-0002kH-CX
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:57 -0400
Received: by mail-wr1-x442.google.com with SMTP id a5so8923431wrm.6
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=inJTXdydeioKk9+qU5p3iyt7UI/PdU5N/egNEICi6fM=;
 b=pGp7iNYF1mRXTiqxqfsmN2k7s9nzoT8n5AkG0/a4wYU3s5jVO99Vd/6dwvRXC0QCun
 ZClVhuFUlibjzlBOEHQxdsV6p8fGoAo5B3JvQFuemzuaV8xdFdNDXNoOd/+Xp1Z8++T5
 gpH35w43ror9qJBDbaHUJQ8a6MqKOvWpxlAKFJrioZHS0d+5ZNM/EmYhEU/Nz8lldAoi
 UEAtQrDbWUgbZzhlkg6fAwshdtdfw2esZPtSmhLlyWM2AqMMOEYdufBMJNZCFMbUPeOc
 3TfVkY8aFBr0rUL3gZMU24Eytq2wtKz+1iv6d/h9maVuxMyn9JB6xST91yMIJX37BrzG
 0vNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=inJTXdydeioKk9+qU5p3iyt7UI/PdU5N/egNEICi6fM=;
 b=ObC6SQ6bCVZBWuQ0aVJ1veKM5t3IVYBcnikBvlVJEF0sqq5bodBVdV4iGZ5IzhsCen
 HPkOVJr3ESQc+edJNUSuqb3IlRt36ph3UgMhTn98Q0fS+vzlmG2SyfYq5SdKBcB+b3Po
 eI1efSlvrkw57Lf9rc4Idyd7JKzOSGyIwDsgV7Mutta4wYDDvQ8bh/NcYw3AtyDpnc5v
 jf2ETN8J32R+TgKXcUvZQ5ZvzqSjeEgYV8DLs22EKm9ToSEe5XMjfK3UvHW0tzJaqCRb
 brbl3Jo3EnjADo6qQqsuLl+Qx+1d35OarrO6ZLn5UjQTsHkVg/Y2HdOWNV/HL0XKUIQ/
 zCJQ==
X-Gm-Message-State: AOAM533n6sOg0VDcYtsOrV7ZweccEORMFOVhVf9AT6IaHiVmjGrcKFqf
 zjIJB6cICFeEQ2Rdcqk5durF+MP2R9MSJenq
X-Received: by 2002:adf:9e90:: with SMTP id a16mr6569855wrf.40.1598279394722; 
 Mon, 24 Aug 2020 07:29:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/22] target/arm: Implement VFP fp16 VSEL
Date: Mon, 24 Aug 2020 15:29:29 +0100
Message-Id: <20200824142934.20850-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: lUkTr2XClG9X

Implement the fp16 versions of the VFP VSEL instruction.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp-uncond.decode   |  6 ++++--
 target/arm/translate-vfp.c.inc | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index b7cd9d11ed5..8ba7b1703e0 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -44,10 +44,12 @@
 @vfp_dnm_s   ................................ vm=%vm_sp vn=%vn_sp vd=%vd_sp
 @vfp_dnm_d   ................................ vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
+VSEL        1111 1110 0. cc:2 .... .... 1001 .0.0 .... \
+            vm=%vm_sp vn=%vn_sp vd=%vd_sp sz=1
 VSEL        1111 1110 0. cc:2 .... .... 1010 .0.0 .... \
-            vm=%vm_sp vn=%vn_sp vd=%vd_sp dp=0
+            vm=%vm_sp vn=%vn_sp vd=%vd_sp sz=2
 VSEL        1111 1110 0. cc:2 .... .... 1011 .0.0 .... \
-            vm=%vm_dp vn=%vn_dp vd=%vd_dp dp=1
+            vm=%vm_dp vn=%vn_dp vd=%vd_dp sz=3
 
 VMAXNM_hp   1111 1110 1.00 .... .... 1001 .0.0 ....         @vfp_dnm_s
 VMINNM_hp   1111 1110 1.00 .... .... 1001 .1.0 ....         @vfp_dnm_s
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 583e7ccdb20..869b67b2b93 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -190,18 +190,22 @@ static bool vfp_access_check(DisasContext *s)
 static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
 {
     uint32_t rd, rn, rm;
-    bool dp = a->dp;
+    int sz = a->sz;
 
     if (!dc_isar_feature(aa32_vsel, s)) {
         return false;
     }
 
-    if (dp && !dc_isar_feature(aa32_fpdp_v2, s)) {
+    if (sz == 3 && !dc_isar_feature(aa32_fpdp_v2, s)) {
+        return false;
+    }
+
+    if (sz == 1 && !dc_isar_feature(aa32_fp16_arith, s)) {
         return false;
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
-    if (dp && !dc_isar_feature(aa32_simd_r32, s) &&
+    if (sz == 3 && !dc_isar_feature(aa32_simd_r32, s) &&
         ((a->vm | a->vn | a->vd) & 0x10)) {
         return false;
     }
@@ -214,7 +218,7 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
         return true;
     }
 
-    if (dp) {
+    if (sz == 3) {
         TCGv_i64 frn, frm, dest;
         TCGv_i64 tmp, zero, zf, nf, vf;
 
@@ -307,6 +311,10 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
             tcg_temp_free_i32(tmp);
             break;
         }
+        /* For fp16 the top half is always zeroes */
+        if (sz == 1) {
+            tcg_gen_andi_i32(dest, dest, 0xffff);
+        }
         neon_store_reg32(dest, rd);
         tcg_temp_free_i32(frn);
         tcg_temp_free_i32(frm);
-- 
2.20.1

