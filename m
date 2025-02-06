Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1779567njb;
        Thu, 6 Feb 2025 12:01:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXX5YDDDqwBDGeDhcb6Mm0m9ewkwX2DleVnHG7NopobA6uMlecLp/0wpW6O11wMJJcj2RrPOQzuakU/CQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGGb205CX+WFtigy0jr8swecSck80Ki5+TRq9+0ScbJhYAFJJqNOBeFyQDB4zW+Gv/v/AY2
X-Received: by 2002:a05:6122:20a3:b0:518:a287:56e3 with SMTP id 71dfb90a1353d-51f2e223b2bmr642637e0c.7.1738872110963;
        Thu, 06 Feb 2025 12:01:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872110; cv=none;
        d=google.com; s=arc-20240605;
        b=U3LQyDOpeglh1XzrALKoycz14kKOh9w4HWbqXo3WM1ComOOy4vPZvdm5dpDzTWL+n2
         NYldAyCahZLguPXEq04xPT1CXNF/0whwpt6B4oFbQkxWjzxZvJx1+p+JgV1+TPdPKrso
         BbbiW20kOvUYNY57Ir956Mn40TDACAuCNWUn18MWoYgUsX1ookm6ES/3LfEmzO7RusHb
         3x89hXp5o0rKSZ16w8FJQKldB3l0V69ylLRHYdE1mnJ+WzTRJkNgtUSPwO1JZ7ImYAtK
         L1GcEvwu80BXkUTs1l6SJIijxV25xL+nsdO2GV3KIrba1/yBReFKLAljtpGWNcjESgtZ
         /JJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qf9DBFCX2hVNF5k/W4UxOmJ9vFzXyhjVaSEQcdNija4=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Fv19jG8FUuI0wK8obe6MHgLvVMi0/rdRxQmD7AF/6/GAtKtPjQ8N+nKwBTvCxlXuQd
         dqLhXpA8fhaLUQkbmqVkT7/eTeP8QtFTRyxZKijBq2xUa4Sul0pUWOqNirdJBEbJuY83
         bChnW9Nzg6XI0K5muibRDDjLlD1yCbZpFRrU8hbGMz9mKTeanPHI49YW5wnAllSGZBz1
         kfyLj1jL67YIHvBZcMKADs+O5UJtEogioeLYTLMob0ibT531YhO2R1VpepDG4V5Ynn7q
         nCrCDbZ2x5J6IyJ2Yv2HVCmY+gcPX0mvRdUqIHasLR0rdjUEIMOi2nwPnDevuWXODpiw
         CmOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERw0wMVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f22934d34si400871e0c.146.2025.02.06.12.01.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:01:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERw0wMVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80r-00085U-Bt; Thu, 06 Feb 2025 14:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80G-0007FI-A7
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:36 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80E-0000Y3-A0
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:35 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2ee9a780de4so2085658a91.3
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871853; x=1739476653; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qf9DBFCX2hVNF5k/W4UxOmJ9vFzXyhjVaSEQcdNija4=;
 b=ERw0wMVJ61Q73AbQSdimBsGVXxIcR526++mkktXECXTI4JjJBI58FMV/i+1z2FckXs
 iaMy2/fOSE5eastL+d4XErVMOXlUu8AiqVCzmMsmjfQH458I0v9+s4dvxv5FVB+RIfWb
 egq0YwBqJEKSSor0dLOAGn2pzmUaY+sim/LqRPr8WWk5vQNVECJuLxU+oiwKUk0qh5VG
 HUyZKs7K9KmfhYp8DF164MBX1FPtG6HQasbtVzEWHKJTfGM/d3p9NdvMbnc1yaYWQKv6
 6fef0UGAKtg4ErFvDcpLe0np4j+UHdn7/TEQ6cpt8CnD1cOB3upN+ANznQVyI4f/lAld
 faWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871853; x=1739476653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qf9DBFCX2hVNF5k/W4UxOmJ9vFzXyhjVaSEQcdNija4=;
 b=kwnoiEMrVIWVT778UT5sZ2NH2XvX2tpLUdhrXsQCsBvPx5ax7E9jCsVU5/tSiypgx7
 xhY7ErReHmh0/PTCkhAqTAIU7E88CbOFthXStWTXcqJAXsbNYFwtIg74470MjrL2y6ix
 Zs2Braj/W3ld0FwpZQzk/3XTM0Ml3slqIQ6AYUS94iIfA1y6+b+AuaiXQ5gAHDiWOhlk
 r40mH80PzLTY2AUJEfHSKS3jZ3VPW1DWduycwVJkOL89djrZtpJE2vrdgbVWPqzL18o4
 UOCT39vJXPR3ZQP81GAz4dpINTNiT2O+f4ADiy4q5NOf7VmwCZzRUdTsrQTHtdQMAZhE
 R5Sw==
X-Gm-Message-State: AOJu0YxXBL+ZOk0098IOI1DvH32s6nSRfTEsGgIVnclWyCe/NtpK1e2P
 jg51F/isFn9/ccVk56mLadYkmDpU5KZp7EGUl4oDwI15XCBg1Xkne4Dm0mvzWfDxHBjkpZq8xAk
 u
X-Gm-Gg: ASbGncvNWdRDd/8SVi6J0VEukYJgjVuxF1sU9RQwLgB/QD9PWfQR8PDLZsAovZk0152
 5h634ACHXVS77lkjH9z9isCb4maoerpJZZ8ymP0EWyiY2aPj2wEA92u309/B7Q7n/uCwMzk7kF2
 PwTtQlsB0wZdY8zPWX3NDpLiaZJoWCjXJUxFlcxc6fSklTyuo58Pu9EuE8hJLaXHynXyi+/8b9s
 CBcWLmhGOfz8DWF83ZJRr9p/b/aAqD7rv9EneceRXUwno3dzJcAYjw3Z8uVmr22aB6LG94CqNqu
 fdqliltHXNYJhPK3RbOrs4S3tZTHNRjrxyfwS/Ld/7Wrl0k=
X-Received: by 2002:a05:6a00:4f8c:b0:728:b601:86df with SMTP id
 d2e1a72fcca58-7305d450c49mr811881b3a.10.1738871852922; 
 Thu, 06 Feb 2025 11:57:32 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/61] target/arm: Implement SME2 MOVA to/from array,
 multiple registers
Date: Thu,  6 Feb 2025 11:56:36 -0800
Message-ID: <20250206195715.2150758-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /FIy4KpX69PW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     |  5 +++++
 target/arm/tcg/translate-sme.c | 30 ++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      | 12 ++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3021902ce1..c364d977f3 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -206,6 +206,11 @@ static inline int plus_2(DisasContext *s, int x)
     return x + 2;
 }
 
+static inline int plus_8(DisasContext *s, int x)
+{
+    return x + 8;
+}
+
 static inline int plus_12(DisasContext *s, int x)
 {
     return x + 12;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index a818a549cb..8a901f158c 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -268,6 +268,36 @@ TRANS_FEAT(MOVA_tz4, aa64_sme2, do_mova_tile_n, a, 4, false)
 TRANS_FEAT(MOVA_zt2, aa64_sme2, do_mova_tile_n, a, 2, true)
 TRANS_FEAT(MOVA_zt4, aa64_sme2, do_mova_tile_n, a, 4, true)
 
+static bool do_mova_array_n(DisasContext *s, arg_mova_a *a, int n, bool to_vec)
+{
+    TCGv_ptr t_za;
+    int svl;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    svl = streaming_vec_reg_size(s);
+    t_za = get_zarray(s, a->rv, a->off, n);
+
+    for (int i = 0; i < n; ++i) {
+        int o_za = (svl / n * sizeof(ARMVectorReg)) * i;
+        int o_zr = vec_full_reg_offset(s, a->zr * n + i);
+
+        if (to_vec) {
+            tcg_gen_gvec_mov_var(MO_8, tcg_env, o_zr, t_za, o_za, svl, svl);
+        } else {
+            tcg_gen_gvec_mov_var(MO_8, t_za, o_za, tcg_env, o_zr, svl, svl);
+        }
+    }
+    return true;
+}
+
+TRANS_FEAT(MOVA_az2, aa64_sme2, do_mova_array_n, a, 2, false)
+TRANS_FEAT(MOVA_az4, aa64_sme2, do_mova_array_n, a, 4, false)
+TRANS_FEAT(MOVA_za2, aa64_sme2, do_mova_array_n, a, 2, true)
+TRANS_FEAT(MOVA_za4, aa64_sme2, do_mova_array_n, a, 4, true)
+
 static bool do_movt(DisasContext *s, arg_MOVT_rzt *a,
                     void (*func)(TCGv_i64, TCGv_ptr, tcg_target_long))
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 5eca5f4acf..37bd0c6198 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -27,6 +27,8 @@ ZERO_zt0        11000000 01 001 00000000000 00000001
 ### SME Move into/from Array
 
 %mova_rs        13:2 !function=plus_12
+%mova_rv        13:2 !function=plus_8
+&mova_a         rv zr off
 &mova_p         esz rs pg zr za off v:bool
 &mova_t         esz rs zr za off v:bool
 
@@ -88,6 +90,16 @@ MOVA_zt4        11000000 10 00011 0 v:1 .. 001 000 za:2       zr:3 00 \
 MOVA_zt4        11000000 11 00011 0 v:1 .. 001 00 za:3        zr:3 00 \
                 &mova_t rs=%mova_rs esz=3 off=0
 
+MOVA_az2        11000000 00 00010 00 .. 010 zr:4  000 off:3  \
+                &mova_a rv=%mova_rv
+MOVA_az4        11000000 00 00010 00 .. 011 zr:3 0000 off:3  \
+                &mova_a rv=%mova_rv
+
+MOVA_za2        11000000 00 00011 00 .. 010 00 off:3 zr:4 0  \
+                &mova_a rv=%mova_rv
+MOVA_za4        11000000 00 00011 00 .. 011 00 off:3 zr:3 00 \
+                &mova_a rv=%mova_rv
+
 ### SME Move into/from ZT0
 
 MOVT_rzt        1100 0000 0100 1100 0 off:3 00 11111 rt:5
-- 
2.43.0

