Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956018lfg;
        Tue, 9 Mar 2021 08:22:13 -0800 (PST)
X-Received: by 2002:aca:dfc5:: with SMTP id w188mr3604501oig.174.1615306933627;
        Tue, 09 Mar 2021 08:22:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306933; cv=none;
        d=google.com; s=arc-20160816;
        b=F62fI7WG4J/xaxE4fkiMoZz6DoTOnVFkLrA/rCAHAxea64YWJ/vtukxTrl+XPNBohs
         dGSFvE/UGraj/5oPLROvrKu735oofHnlQArphx6xSEx69pVyhiRxi+gASFEFfsLS+lrM
         ajEJSa05/0ZTu4pCPeOx29JoNgAbwXFzdcdvAikMNooNu8ROB54ik5dH9Z1R3MNl4PC+
         7HL7lBIFO1VaD3K+EV96rASxz0p42ouM4XeYiOV5HeaEwhGBZjMIlXGUfY2BtledO3Gi
         ZvzJ3+ZzgF6OjfCwf/4AIV2zMNnAWYMLCks5FSzNH0c1HHbSVqJR3ToKX8KetYaw1wg3
         mWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XJukSUnh/ZapdqYElhaMrdNjfVgk9LJj1DVZruN+l2s=;
        b=zxrJjNppSpoYgpeoZj0YzaxXW/Z0FnYrsKQa85CS6izHHn8ENiKYKmRDNmVzlMwh+3
         rhOWcs/sgahr0RSyAJ/F/TkpL74Cgjm7dW8XKeSGaQOP6PCNdKDlb0D4CdelTKjVZuXl
         YDT+BQo5WFcpgMCyFgJqhtR6RHPdPcILO3mBRO7RfbZnvoZ95h9zxLVBVflqfCw3VxqQ
         zILp84kxN18Es16CRhPwJJluMz8R55YWdALVizsR0wOjl1+UiOb0DiLvPRlC5/lGtVLI
         89SsX+Ytj+svQDQ9OUUwPx+n6vaA3CbXvQ6F5wzV0NRCcBgFxnCh+6ZCBw5WLRO1KcMc
         OznQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEvaxp3J;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m24sor2252089otk.42.2021.03.09.08.22.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:13 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEvaxp3J;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XJukSUnh/ZapdqYElhaMrdNjfVgk9LJj1DVZruN+l2s=;
        b=NEvaxp3JgyvtJgZ8a914jHnXXBs9ScOzLYAnhMiVjNu0LrXN6LUUZkxy8EZXnVdeCB
         YPXBzHuGmdDoRe0v0B1Apqv76LYm2chAz8sg/Nvsnu7RCY+IKaHVaY4j+XGjLdIOuBhC
         c/BTrJaeUyLcwhbtw1nr2g1M7RiU8owhZEvNrjAoZbxOk5UpzpOLRvMJiAXMp1nHNuGM
         s2BzSj7E9y5TB7285FVOMQXRnxcMmPRg0PiNsFREfs8YTl2/qs6iN7VOohrPT0SyMSGw
         X0qoTARqMb0Fhwa4sTkF5DIHXliCjQeup7pLOoCZt41D4hrZ4aTSvecBu1NlmQwFv0mB
         D9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XJukSUnh/ZapdqYElhaMrdNjfVgk9LJj1DVZruN+l2s=;
        b=nFxm8EeBJJrKmBdCQg/wjHCPSRbocLgJL2ZFyjQj0F7JVOLoktT8R9h2POWcgXfzNv
         gwjMWKGAwb14ZVJg3FkZKx5mKa0Mve/C6YGbwchbZXG9+kiOMZpZ0o/felsrGAAXvCjH
         DxF06JpQqLjus5a128kuowvnBiL/ygn2Y9yNpTS2grJdYFj/lP5jXPvRzUH48lqMiyn1
         e5ipEd6VvcxeCphZWaXb6B36AFc+dmGeGmHnsjAuZ4hPYXzxgnBYoZ1cy10LX12XSrUC
         mltgSatvr3yFap6c9p2JjXJeqqGzjukH4jNZ0pdcq3qF0eMU4Tz6mfMwFVOIVNGIyiME
         WT0g==
X-Gm-Message-State: AOAM5325CsLWvVxTFnoFYxtPBH/DIjUNrA1JbB2aw6clVBviI6IZZacz
	UIhGbsupBmq8fqqtSfIiZqm0PU05
X-Google-Smtp-Source: ABdhPJx56YQXd3eYQXaaTo5MBEbw9oF3oMHbDRmBzaiyhV6kcyWnRsGdIfPEShD4dlK2F1W+iKYAMw==
X-Received: by 2002:a05:6830:1404:: with SMTP id v4mr15878259otp.2.1615306933276;
        Tue, 09 Mar 2021 08:22:13 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 52/78] target/arm: Implement SVE2 integer multiply (indexed)
Date: Tue,  9 Mar 2021 08:20:15 -0800
Message-Id: <20210309162041.23124-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ODU6LRapBQN8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 87ee5b8629..5d20392887 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -777,12 +777,19 @@ MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
+#### SVE Multiply - Indexed
+
 # SVE integer dot product (indexed)
 SDOT_zzxw_s     01000100 .. 1 ..... 000000 ..... .....          @rrxr_s
 SDOT_zzxw_d     01000100 .. 1 ..... 000000 ..... .....          @rrxr_d
 UDOT_zzxw_s     01000100 .. 1 ..... 000001 ..... .....          @rrxr_s
 UDOT_zzxw_d     01000100 .. 1 ..... 000001 ..... .....          @rrxr_d
 
+# SVE2 integer multiply (indexed)
+MUL_zzx_h       01000100 .. 1 ..... 111110 ..... .....          @rrx_h
+MUL_zzx_s       01000100 .. 1 ..... 111110 ..... .....          @rrx_s
+MUL_zzx_d       01000100 .. 1 ..... 111110 ..... .....          @rrx_d
+
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
                 rn=%reg_movprfx
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 35d02df493..ee2ef91355 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3813,6 +3813,10 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
     return true;
 }
 
+/*
+ * SVE Multiply - Indexed
+ */
+
 static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
                         gen_helper_gvec_4 *fn)
 {
@@ -3836,6 +3840,32 @@ DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
 #undef DO_RRXR
 
+static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, a->index, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRX(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzx_ool(s, a, FUNC); }
+
+DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
+DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
+DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
+
+#undef DO_SVE2_RRX
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1
