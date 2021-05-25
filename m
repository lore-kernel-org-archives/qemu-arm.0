Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4905360lfm;
        Tue, 25 May 2021 15:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLR8mAnU8RiOBwq7x0VlmBTzpmkp1E3c8KtzW0LiSYdhDcpjaR1B79qX6kqjgfBUcG4bJO
X-Received: by 2002:a02:908a:: with SMTP id x10mr26598033jaf.30.1621983534814;
        Tue, 25 May 2021 15:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621983534; cv=none;
        d=google.com; s=arc-20160816;
        b=L2IncsZG5nOvWntMVu2UA33k7Arjgf4YeDsmYmypUH55qRK5CbxlHYVAw5U4nDJf3p
         4NecAzWemDNRws04PwYrrg+mKW03ZX2CSOP+doTEHuuu0SJkgQ0/qwBL6JP1jUqGtWKV
         yBkPl+/BC0Y4OrtPCpRbMPvVF9gX0PC81t+z6KiXvwmRv1lbb8s1EpemfRQhCZFj1xIz
         rOvBmgXfZ9dc6FD2DXBW4YC0BP18r4JzmFgZpZkg/iwQDrsVLJWlcULHC2A/oz122nbV
         CICV/bQNNmtBnPZlXrwLv3kDHVme4NdPHcyDYCE0ORBBwBl07fRu2ORddbUQ0fAyMXUa
         KwKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0La4bELq+QRQvGpWtveOOb2coHQOmlKGzXDvXUy3i7s=;
        b=UbKdGD1KsibOYEGBulnlFQs9FtU6Mp0DwwTgdXgaD2SPuHtZq7dsKFfSK7jwq1TGuP
         keFb/oMh27+4Ft4TLNsMMIO5Jx3lW2HjOpCMmNdh1qlLhUoJOWOOaE8EF4A9szjpSGu9
         AAdeF/ZZrsy/M7M+Qru55o8VxB6FDOe2FgeCZdCUB3K9snPdZGfVezsI56nI1yz+MhEP
         2uK6ddEFZ/aYPKCjub2fMusZiTsQy0ptc3MlSbTF3dxhYfKyWHBparyiaGpg2KYpnvSQ
         4v7svsU3CdY+oTsoSbCk+HJ7nGo+fN5EU2M27slPHBAWarbaqYeMXojyVjXd8TxwJ+ko
         PCaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W4PIKBxr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si14953764jad.124.2021.05.25.15.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 15:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W4PIKBxr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llg0k-0002gH-2u
	for alex.bennee@linaro.org; Tue, 25 May 2021 18:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0R-0002Zh-Oa
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:35 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0D-0004nX-Na
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:35 -0400
Received: by mail-pg1-x52a.google.com with SMTP id m190so23960945pga.2
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0La4bELq+QRQvGpWtveOOb2coHQOmlKGzXDvXUy3i7s=;
 b=W4PIKBxrD+per+6GVtdQnBXuRfHCgnIuWI6kHj7YFnIe0tD18zKt4IvjDU+SvfZLVP
 bhWkYzTDJL6bxVPBgwswCURElfyxWRF4u3ErNHgd4lnf9n8xKdDhyIP7nCzwVsUTYkx/
 T5IIdckW5gu2OO6ohiTMjorcVmwrzzqZaE1/Xgr6wb+5jQz++umw5iNRq9mC1pRRMYAs
 kvEThWs0Vu4Vu8r2CqNd8PzCwZffiWXZj6PWaJ7G2Ybao44BPQ4wddgQ3sx1WQtRv5tE
 E1P3N73QNMJYcc4bOVfcDF4dIMHdIrQtWb3hE+0byekk35mn8u5PvdSSTM4Q+FBVtSzL
 6Y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0La4bELq+QRQvGpWtveOOb2coHQOmlKGzXDvXUy3i7s=;
 b=aBYuym0eNkmrBBQQikeWUEdPHI/VTCsQ7wOrq5lcUJ+EREq9+OMu+i9asRCH/LhlYO
 hHcW/b08OvPvK3gXq0ibuOhuWiS0UCp4fwy1t/vSzATXrJc6XMkwjg1whatZJigZ0mF2
 NWopGinWRtEdjg+sVCKyQv7Its1GZc/JPnDpbuQb8diy46md+ZX5XOfneTmKPtwg2vPl
 tJGIOkSqXOZGkewGFXP27V2ir7I4cgjRw00sKUes2Jtsa4adHU5NDJG5/+6Fo9LKYLlL
 2iUaB4Yvhsgs5htqyUPpGkrH25ztyL0dGshAer7/LXczg3V6S5hZxzaY2Hq87tRq9sZH
 LMsw==
X-Gm-Message-State: AOAM532H/f0Og60egy5ifFJXPkpMMmFMMquriIWxY5nFZhlYCobAdR0Y
 dObK7bXZXMorKYMaiikQkJVngQ==
X-Received: by 2002:a05:6a00:1630:b029:2c0:a1eb:d77 with SMTP id
 e16-20020a056a001630b02902c0a1eb0d77mr32345282pfc.81.1621983500454; 
 Tue, 25 May 2021 15:58:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/12] target/arm: Implement scalar float32 to bfloat16
 conversion
Date: Tue, 25 May 2021 15:58:08 -0700
Message-Id: <20210525225817.400336-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t4OBN39YOaAX

This is the 64-bit BFCVT and the 32-bit VCVT{B,T}.BF16.F32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/vfp.decode      |  2 ++
 target/arm/translate-a64.c | 19 +++++++++++++++++++
 target/arm/translate-vfp.c | 24 ++++++++++++++++++++++++
 target/arm/vfp_helper.c    |  5 +++++
 5 files changed, 51 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 23ccb0f72f..9977a827e9 100644
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
index 510cb6ca5e..90605d7dce 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6273,6 +6273,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     case 0x3: /* FSQRT */
         gen_helper_vfp_sqrts(tcg_res, tcg_op, cpu_env);
         goto done;
+    case 0x6: /* BFCVT */
+        gen_fpst = gen_helper_bfcvt;
+        break;
     case 0x8: /* FRINTN */
     case 0x9: /* FRINTP */
     case 0xa: /* FRINTM */
@@ -6550,6 +6553,22 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
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
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 3da84f30a0..d8271dbaac 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -3025,6 +3025,30 @@ static bool trans_VCVT_f64_f16(DisasContext *s, arg_VCVT_f64_f16 *a)
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
-- 
2.25.1

