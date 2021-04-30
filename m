Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp497965lfg;
        Fri, 30 Apr 2021 14:10:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5n5D74yGg+MZ96cHlk56Ufmjn3c4Zy3HVREZJdZrC0Yakps734sf9vKUzK2iS+ZNI5Inb
X-Received: by 2002:a02:ce9a:: with SMTP id y26mr6832315jaq.16.1619817047290;
        Fri, 30 Apr 2021 14:10:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619817047; cv=none;
        d=google.com; s=arc-20160816;
        b=f+bKR4VFCDcP4kc0KqyGHNlMe6A5SrukqZFU7eOdldKvKMNNdYTw9Qz+Wwvwq6Gm5u
         K+sRGZ1nAYZagd23TNHw+zu9IRkP6XorbxjwhIJxhtlVNet8Zmwrsq3qg4xvtg/wuA1X
         RX+b5GBPUiLZvrRd8xCgMxYacs+SpREGMURZmK8CJaQnyaQAah152w94fEDx8gXuddVd
         Hd0Do75NASIaLPHVfrJg+/8IMQJaodJBOwsavOxwYKb55KdR3r0Zmm26zHOKIIiISyYs
         65hTeb8yptzu5MbgdneROXPbVmdfqV0hJ/yG9mqiFpLRURisRx51V7vR+/2TfdMCheQw
         LXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8LKuIB6wJ5LVWgX/IoMOV5QKzsiXXzsJsAVqZyabZRk=;
        b=WTc2WTBwWHeK8VrDRV2LOf2VEFH/vuJKKrO+jmHJemFQSAgsShNzxJAsMNgog6Wyv2
         4jVsZEgJHpzQ5I7erv4/pbsQLBrNCtgfttrqHpJXDq1XliQXODxkBtncWF62NoZNO6aC
         hY22fh8EvDPW+AyZpDhRayAEYOuQ+vNT8lZzZXGkxmgImgJGJhWRvKDEJc+9w8DfvCMY
         sYMqp6XIiCZ16N2bP43nWCJfHsyxSQSdJ4t5+ScyzLI/W7APEV9sI6pjrzPCkIYKnst6
         MfKqnXolyhMXCXsG6A+rp5NUmjVcEjkTHwLMEIk9ucB0TYnTVc2rbrVmya+BZ2IjGaiM
         LHbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TcR0mnWQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si4268079jat.26.2021.04.30.14.10.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:10:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TcR0mnWQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaPO-0003lY-FN
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmK-0004W3-Pt
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:24 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:40450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007iL-7P
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:24 -0400
Received: by mail-pf1-x431.google.com with SMTP id a12so6951726pfc.7
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LKuIB6wJ5LVWgX/IoMOV5QKzsiXXzsJsAVqZyabZRk=;
 b=TcR0mnWQoBm2Dz+HCRCM0f6shUpETxDfLqhNVM7TLKFha8TrvA6vcFdNwTSKZ2denq
 Za1zNiQnhNLJPHyIqgIBmTzSjVvevrbcbSuaS3LSJuzx1da8rieNlk762lsFilSPedmk
 0jTWn9b8eHp/CnpUyBK/4TVOLxnaR1TfeD5mfgt/TCEnIQWBdvgaUvB4B4m2G2p0Wi+S
 loF48jPPHDwspatpkNZI4tVk2uEAB+DllvHykxfFyl89N9+NeeBX0D7njKQA3CwFAbNX
 DRdITkQlsnh11uPeLtq/OZ9hOV6zD3VngEVHzwH48C8WLSivH77EgUAJEcUuWs+b1Lz6
 Ppxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LKuIB6wJ5LVWgX/IoMOV5QKzsiXXzsJsAVqZyabZRk=;
 b=aXjFwMnJ8f2cA446fzhmoJU2ndBgWSMuQJvuuC1St/jJwbyVaQAOMCOejvebIPexCW
 Prf9c4DXeI4/UP6X+fNQbOL2T4c4PK2oXErUOZuE3TbX6Lwt4HXdpHYAtF28f49G2Rv1
 Eqsu5ux5ia5eKZ3Ire+JQTR9RHHVsKwcrjqkUXbTLaeXO51+Uax1PUv+JOg4s1H2YYu7
 O0YOyfj3VYpUtMmv/tmBbInZza7/f8nVEA1TsDbPjtBdWNOPI2UNu5ZwWLkmiiqwW0kx
 L1D30vsW67pYNWfj+PYZOqU8JLHDj2fQbA2woYBDCwuGPdq9EiFVqEBvbTKik65Lcg6J
 LDDg==
X-Gm-Message-State: AOAM533qmLkOpylqbujePYPvWXsAzf2bXoPhrcouxBxM+ohlNBIw61qg
 fEf5Nl5tOkXUEoQUFNcljr7EQmyKRD56nw==
X-Received: by 2002:a05:6a00:1502:b029:275:f676:5eef with SMTP id
 q2-20020a056a001502b0290275f6765eefmr6760555pfu.30.1619814583078; 
 Fri, 30 Apr 2021 13:29:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 51/82] target/arm: Split out formats for 3 vectors + 1 index
Date: Fri, 30 Apr 2021 13:25:39 -0700
Message-Id: <20210430202610.1136687-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zKSWd9fUZZ4X

Used by FMLA and DOT, but will shortly be used more.
Split FMLA from FMLS to avoid an extra sub field;
similarly for SDOT from UDOT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 29 +++++++++++++++++++----------
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++----------
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a504b55dad..74ac72bdbd 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -73,6 +73,7 @@
 &rprr_s         rd pg rn rm s
 &rprr_esz       rd pg rn rm esz
 &rrrr_esz       rd ra rn rm esz
+&rrxr_esz       rd rn rm ra index esz
 &rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
 &ptrue          rd esz pat s
@@ -252,6 +253,14 @@
 @rrx_2          ........ .. . index:2 rm:3 ...... rn:5 rd:5  &rrx_esz
 @rrx_1          ........ .. . index:1 rm:4 ...... rn:5 rd:5  &rrx_esz
 
+# Three registers and a scalar by N-bit index
+@rrxr_3         ........ .. . ..      rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index3_22_19
+@rrxr_2         ........ .. . index:2 rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx
+@rrxr_1         ........ .. . index:1 rm:4 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -767,10 +776,10 @@ DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
 # SVE integer dot product (indexed)
-DOT_zzxw        01000100 101 index:2 rm:3 00000 u:1 rn:5 rd:5 \
-                sz=0 ra=%reg_movprfx
-DOT_zzxw        01000100 111 index:1 rm:4 00000 u:1 rn:5 rd:5 \
-                sz=1 ra=%reg_movprfx
+SDOT_zzxw_s     01000100 10 1 ..... 000000 ..... .....   @rrxr_2 esz=2
+SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
+UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
+UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
@@ -789,12 +798,12 @@ FCMLA_zzxz      01100100 11 1 index:1 rm:4 0001 rot:2 rn:5 rd:5 \
 ### SVE FP Multiply-Add Indexed Group
 
 # SVE floating-point multiply-add (indexed)
-FMLA_zzxz       01100100 0.1 .. rm:3 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx index=%index3_22_19 esz=1
-FMLA_zzxz       01100100 101 index:2 rm:3 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx esz=2
-FMLA_zzxz       01100100 111 index:1 rm:4 00000 sub:1 rn:5 rd:5 \
-                ra=%reg_movprfx esz=3
+FMLA_zzxz       01100100 0. 1 ..... 000000 ..... .....  @rrxr_3 esz=1
+FMLA_zzxz       01100100 10 1 ..... 000000 ..... .....  @rrxr_2 esz=2
+FMLA_zzxz       01100100 11 1 ..... 000000 ..... .....  @rrxr_1 esz=3
+FMLS_zzxz       01100100 0. 1 ..... 000001 ..... .....  @rrxr_3 esz=1
+FMLS_zzxz       01100100 10 1 ..... 000001 ..... .....  @rrxr_2 esz=2
+FMLS_zzxz       01100100 11 1 ..... 000001 ..... .....  @rrxr_1 esz=3
 
 ### SVE FP Multiply Indexed Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 17789ce173..bb0cffa3d9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3813,26 +3813,34 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
     return true;
 }
 
-static bool trans_DOT_zzxw(DisasContext *s, arg_DOT_zzxw *a)
+static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                        gen_helper_gvec_4 *fn)
 {
-    static gen_helper_gvec_4 * const fns[2][2] = {
-        { gen_helper_gvec_sdot_idx_b, gen_helper_gvec_sdot_idx_h },
-        { gen_helper_gvec_udot_idx_b, gen_helper_gvec_udot_idx_h }
-    };
-
+    if (fn == NULL) {
+        return false;
+    }
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fns[a->u][a->sz], a->rd, a->rn, a->rm,
-                          a->ra, a->index);
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
     }
     return true;
 }
 
+#define DO_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_zzxz_ool(s, a, FUNC); }
+
+DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
+DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
+DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
+DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
+
+#undef DO_RRXR
 
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
 
-static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
 {
     static gen_helper_gvec_4_ptr * const fns[3] = {
         gen_helper_gvec_fmla_idx_h,
@@ -3847,13 +3855,23 @@ static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
                            vec_full_reg_offset(s, a->rn),
                            vec_full_reg_offset(s, a->rm),
                            vec_full_reg_offset(s, a->ra),
-                           status, vsz, vsz, (a->index << 1) | a->sub,
+                           status, vsz, vsz, (a->index << 1) | sub,
                            fns[a->esz - 1]);
         tcg_temp_free_ptr(status);
     }
     return true;
 }
 
+static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+{
+    return do_FMLA_zzxz(s, a, false);
+}
+
+static bool trans_FMLS_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
+{
+    return do_FMLA_zzxz(s, a, true);
+}
+
 /*
  *** SVE Floating Point Multiply Indexed Group
  */
-- 
2.25.1

