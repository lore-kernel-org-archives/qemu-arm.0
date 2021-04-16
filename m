Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp822003lfr;
        Fri, 16 Apr 2021 17:00:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ/lmAEWVubag/RReregASzntwtT9iUg44+eU0eM+N4iHQowZwwvvqQT0kaoYK9Ik8WoWH
X-Received: by 2002:a05:6e02:1c42:: with SMTP id d2mr8341793ilg.287.1618617600800;
        Fri, 16 Apr 2021 17:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618617600; cv=none;
        d=google.com; s=arc-20160816;
        b=uGfdUKAdsd+Sc5RHH6v1zMA7lvmLKKK6C53nsogjTIn/G5MF425vVdJ9GkRN0sCRGn
         n2MknKGW28HT/0nhxRT7DWmJNrkK0WJduvE7KWbHbVZ4GNmZ3Zd2TCdYMBVKYANYcGk+
         jl/NBYycfARMTQD4bqaPT7XY2FzLhH26PVF1ff4h5xKg3GOMgCKlUfj5tZbYlMHBQ9GG
         3GZJ/yha1y7ZLVVNY/odB52spzSL5IsaSfj+v8wh6/+ULoMx2XGWUPn1ZMo6AJhTUrzZ
         oBZ7g7+SyvwtG6cSg2rzOO9Zdy0ZORXFQit1A5mJVVSvpDnPeRUO6tdNJH3m/kKIyJ3Y
         CATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=P4NySGYmw96BmCITsEvNWRDoN+LZscH1OmpdX1Sy41g=;
        b=tG5rhEbANi9coSHA29Ko5PXVHY5CMOnK20HhH872DTTqwgRpbG/RwxlMhlIyqK0PvD
         wEtTwGLmW/AWHnBvs4CbYRCqmy+ITsbiECzMcoyeubYnwG0MH8ZY4+qzeRW59W/zjCSh
         z+A3G7mSpOyM80t2Vmy9UBAJMew7+EtQm5aqCQ7ZzVaCSDTOh4WRBV7+UOANJRGDEyRk
         jl/gL7LcY2I2cOGuo9097IEkAym8EdTxCboQo1m/ySV6E77IgGhnEQrutzqmIv/P7sWK
         3WrPd8XpPUwxlBUMou/I1nMtmASCNhkk5+a/TYdgNQ9Dh/4ye8wWjIXDPUeOcyjVNhkr
         K28w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rEqA/G9g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si7417019ilq.104.2021.04.16.17.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 17:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rEqA/G9g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXYNU-0005nB-2J
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 20:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN6-0005Bn-Vc
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:37 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN4-0005bC-JI
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m11so19361957pfc.11
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 16:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P4NySGYmw96BmCITsEvNWRDoN+LZscH1OmpdX1Sy41g=;
 b=rEqA/G9gMX0jKakzD36y14c5dEo6QzZcyqVl0AVKo00XUVSrGCGLM+ijH/kacNA+kc
 sRFfPWxmHpJG++Y6VDwd3NlGfY9WsNnEKyfSAU+KQlMtZBMzXIWMQ5EjU7Rs5zhJvj2W
 1Bm0yq759KVfTKts4YSivCJrqewnwaV6c4FwQW/oIBiA/6z2+rkADbpmLaX6uw5FTvJl
 kKtVx+QtzbbB9LBHt/hNFVoerI1Z44V02SYT0zuKaDyih/WHB7CTG3qrwg0aOyDIq5op
 87i3GBdCbHZDYZvMC+Teb+7gkjZhaNAxhhj+oWHTERjd4a8TD3Ly0IxcDR1SB6w+qXak
 8LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P4NySGYmw96BmCITsEvNWRDoN+LZscH1OmpdX1Sy41g=;
 b=U6zfa0zBq0oicH/laXbfuXDi1aPfFXX7M0yMY+hoxLPcwd24EhTuQTTk5t8SYa5Pko
 Z2sVLoOS1D2Ihg07jUU1C7VhyrXu9Xpeum7Ap06P/QAh06LjeW/MWeFwRq7wDbEK6RJD
 ExNZM0c68qA9QAs8du/nf/Xfonxx8skGjzVB5aGXKgnjmcWQDa3BsTIoSMues1zzcosD
 EX4wGu2svq5UfwGzlIS8jmJSvT82y6m8zQmTgiR0CAbCRr20YYIwisFPAdWbOwm4bGf/
 zgfEaKvJSk1Q1ThJtCC0TLqsgiWXRWnnY8EPz7CKrht5ehbPpxbhtFFtE9xi/0Cgoj7z
 P2Bg==
X-Gm-Message-State: AOAM530dyzo3IwinDC+GRCRH1m0L9PSmlEsfIYXCHUVRBNZvm285o0wF
 LWBg2UV/0pCXzktoOnEQ5bzIFQ==
X-Received: by 2002:a63:4513:: with SMTP id s19mr1295269pga.34.1618617573307; 
 Fri, 16 Apr 2021 16:59:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/11] target/arm: Implement scalar float32 to bfloat16
 conversion
Date: Fri, 16 Apr 2021 16:59:20 -0700
Message-Id: <20210416235928.1631788-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h/s7rnMe0jcC

This is the 64-bit BFCVT and the 32-bit VCVT{B,T}.BF16.F32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  1 +
 target/arm/vfp.decode          |  2 ++
 target/arm/translate-a64.c     | 19 +++++++++++++++++++
 target/arm/vfp_helper.c        |  5 +++++
 target/arm/translate-vfp.c.inc | 24 ++++++++++++++++++++++++
 5 files changed, 51 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 33df62f44d..0892207f80 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -143,6 +143,7 @@ DEF_HELPER_3(vfp_cmped, void, f64, f64, env)
 
 DEF_HELPER_2(vfp_fcvtds, f64, f32, env)
 DEF_HELPER_2(vfp_fcvtsd, f32, f64, env)
+DEF_HELPER_FLAGS_2(bfcvt, TCG_CALL_NO_RWG, i32, f32, ptr)
 
 DEF_HELPER_2(vfp_uitoh, f16, i32, ptr)
 DEF_HELPER_2(vfp_uitos, f32, i32, ptr)
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 6f7f28f9a4..52535d9b0b 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -205,6 +205,8 @@ VCVT_f64_f16 ---- 1110 1.11 0010 .... 1011 t:1 1.0 .... \
 
 # VCVTB and VCVTT to f16: Vd format is always vd_sp;
 # Vm format depends on size bit
+VCVT_b16_f32 ---- 1110 1.11 0011 .... 1001 t:1 1.0 .... \
+             vd=%vd_sp vm=%vm_sp
 VCVT_f16_f32 ---- 1110 1.11 0011 .... 1010 t:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCVT_f16_f64 ---- 1110 1.11 0011 .... 1011 t:1 1.0 .... \
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d8ec219bb2..d767194cc7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6288,6 +6288,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x3: /* FSQRT */
         gen_helper_vfp_sqrts(tcg_res, tcg_op, cpu_env);
         goto done;
+    case 0x6: /* BFCVT */
+        gen_fpst = gen_helper_bfcvt;
+        break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -6565,6 +6568,22 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         }
         break;
 
+    case 0x6:
+        switch (type) {
+        case 1: /* BFCVT */
+            if (!dc_isar_feature(aa64_bf16, s)) {
+                goto do_unallocated;
+            }
+            if (!fp_access_check(s)) {
+                return;
+            }
+            handle_fp_1src_single(s, opcode, rd, rn);
+            break;
+        default:
+            goto do_unallocated;
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 01b9d8557f..fe7a2a5daa 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -408,6 +408,11 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
     return float64_to_float32(x, &env->vfp.fp_status);
 }
 
+uint32_t HELPER(bfcvt)(float32 x, void *status)
+{
+    return float32_to_bfloat16(x, status);
+}
+
 /*
  * VFP3 fixed point conversion. The AArch32 versions of fix-to-float
  * must always round-to-nearest; the AArch64 ones honour the FPSCR
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index e20d9c7ba6..709d1fddcf 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3003,6 +3003,30 @@ static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
     return true;
 }
 
+static bool trans_VCVT_b16_f32(DisasContext *s, arg_VCVT_b16_f32 *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = fpstatus_ptr(FPST_FPCR);
+    tmp = tcg_temp_new_i32();
+
+    vfp_load_reg32(tmp, a->vm);
+    gen_helper_bfcvt(tmp, tmp, fpst);
+    tcg_gen_st16_i32(tmp, cpu_env, vfp_f16_offset(a->vd, a->t));
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
 static bool trans_VCVT_f16_f32(DisasContext *s, arg_VCVT_f16_f32 *a)
 {
     TCGv_ptr fpst;
-- 
2.25.1

