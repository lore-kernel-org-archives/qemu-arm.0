Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1261949dyc;
        Fri, 4 Jul 2025 07:42:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUD0M98bVQEPLCWedAxn9VlM3pNffSnY3pzWLDWJxqyqXJgOicTDIOI0gdUjS+JJ55ji8Wa+R2WFL+L7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFmBHwY+4PkpUJ2RfCWld3e2hUV1a/eZF6PdT4isB6IVNpFrTsDQ56IqJX7OeNJQfUFAhck
X-Received: by 2002:a05:622a:4b:b0:4a7:bd8:4951 with SMTP id d75a77b69052e-4a9a22acb6cmr8147451cf.7.1751640155565;
        Fri, 04 Jul 2025 07:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640155; cv=none;
        d=google.com; s=arc-20240605;
        b=VWcEkQkYP7vFVEnAF7OxnYQgiqeZ2xFSMXY88NmFvz7tytWbc/POx13CzVTJcYkxZ7
         AwMHQHZ0fJBSigkGybZ1ZsW5TGx5rml/ZUkmkuXc80YnOUgaMR3Ue4eeOp+OmJBpHo6s
         1JVFbcVHFyvbZwy1wghDmepLloFcjZ8WTZo0l6lX+k4Ba1kbYbahfG5mwEcVNIeayjJU
         3vg852xwcLJcAnZANR+7xez/hP2N5ZsZXbc2q8oBWtB1Sy+7piBgVCFtts8ZmSuAZAUq
         w8WpeGBiAAR2fdV/6dtVBBQq9rKJbL0siXsNR8yRNadFO2vB++KFV8zyFQuxr4M9GnhP
         LadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kJFR1eJ+WUdy2Lk3rwd5+Ns6EIeEnwPE0V3+mnbvDGg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=B/3LbNPT/gJjCWq2Pcom7sTLIdnOcrkQ2Zxxe9VGpTOvCiXdgcxBua+bjXwJ0B8owP
         GYNhrD5wf09JL3YyIUiusCX1oXCudxin9EXPIb7VwFLxYPUiAH+DtGOKEuAsCJ33AX3b
         jSjErusZUrDuiGUzZPzifhcgTi2JHiuYkMNIwu02GX6d/NewNwl1loU4feLrACERgnix
         ZFjgaJEXajMCsAyqc+jiYlpO4xT1NxYXwHfTixENwlPdZeEXdbIpVJCJFZ+ju/pgrI8/
         Gxf+k0I6bs2ruNggLmzw8KWuL5YglEXVNxtMPuPuO0kMm3qe2AM7zcVHveQbUqkdjxUh
         ITBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpJUKgnr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994a0714csi20413511cf.141.2025.07.04.07.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpJUKgnr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhRH-0006b5-1b; Fri, 04 Jul 2025 10:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM6-0004Yi-S2
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:37 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM1-000873-6Q
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:34 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-40b71debe9aso360378b6e.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639127; x=1752243927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJFR1eJ+WUdy2Lk3rwd5+Ns6EIeEnwPE0V3+mnbvDGg=;
 b=qpJUKgnr/yXLLnx/DCOYprKGZ0nBJFdyPFt4ZuBmUr6qiScXRQTjBQ+WOeB39C/uiI
 xvOdodV5LHlKAg6OD3eXPklLk8pSPNubOOrKD/+2rcCzE/NN4o8Bj8c5k70qa2WQN1DE
 vrZ9k+HClhZUVxhoc1wdAbO7aX+0RvuF5appVj65EpLez7g5CVnKYEM/ZCImb5iO/o4s
 SdczXmVXtfH+s9MhpFQF8+wa1EkLsTRuNpGubjABpdojJgcM+B+XriRiShW7iZrKzT1K
 ORbk8bZiNYKwkj9Xe5s1aY0q4BjwnW5PnstwBhkw++jBUlfye0ZGxf3WmhZ4x8ATkA/j
 4w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639127; x=1752243927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kJFR1eJ+WUdy2Lk3rwd5+Ns6EIeEnwPE0V3+mnbvDGg=;
 b=CX66wywfqJSznNwUK9Gwcin1DCe+F0Cvi84m5WDbhMDpZRUdu+WEi5eWFA9uRM4Foi
 xpVM0X/+2vZ7JWIoWWXF2MRMcDsn3zTYdoAEgvYSiaOu3swuZ1XjHRntcIzr4KtPavPE
 Ob15d7H1apdIwYsK/kBVtK81A3pxiSDvuL0gg6DBIvUlWFHaUaVR2BTHFAanbofqoFA0
 LoVp1OExQkhIl14FJ4oLpcG6oy42PvnzmUBxuYfo9Ba8YNNJFXRP/slJGp3odMRglhMl
 lgHWMQ/lEN3TH6IPs/BL7acvu7YSoggVVELhvlInpJb0cFwp9hNxet45iVpjfAtXwEdl
 KoxQ==
X-Gm-Message-State: AOJu0YzrwAPBOnfqSEdx84WVsUfJvEXEjy4HrhiKtEapBHqcxOorN6Pv
 5+XR/+TitThODgtESM+XaymuOGV2HLJaI3YWhQm5OaGyruwubg/5FIFBPqLJQgI9WQs=
X-Gm-Gg: ASbGncvWzzh9wgv7nh1ThLVHqmcNLfo+S6Kws+m4NNgZ8/ybPeePvybhXBVdmBKH3c9
 eJu0Zt3EhoxNX2/MJ0nDi2nNClkK67/S/nDlqb9B8JsbdwVYsJRCiN0UU1CwkR+JQxll6enAPG5
 5EB6D1XlZR6h5sH7PbnHx7Jml0OQTOrsY7ljU2/MrJSrfpf0hkcxnjkyjfJrZUOU9jRLnauaLVt
 uiJtoaD1bLeFFKxo72U5TAAhzhO1UeLWHmPEeT1FLRmEP957zZ3vdi8Yq6bbWyCuUlw7XH9NqJ8
 5F+bb9XnODp/KKYKz+V9VdRFw++uQZIdH/1T6Bd5hu5mAfbRKTeyMmbTHd4qBD2fTl7uJSw7WKE
 eZUsWD1zdfpDWzxYTFFgMnfPXdwXZ+T2MzBX3q90FEb9h4Qmq
X-Received: by 2002:a05:6808:159e:b0:401:e848:18b4 with SMTP id
 5614622812f47-40d04aba9d3mr2184558b6e.8.1751639127275; 
 Fri, 04 Jul 2025 07:25:27 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 069/108] target/arm: Implement SME2p1 Multiple Zero
Date: Fri,  4 Jul 2025 08:20:32 -0600
Message-ID: <20250704142112.1018902-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +XuGjbauoJr3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 20 ++++++++++++++++++++
 target/arm/tcg/sme.decode      | 23 +++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 99e4056316..b6316ac716 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -173,6 +173,26 @@ static bool trans_ZERO_zt0(DisasContext *s, arg_ZERO_zt0 *a)
     return true;
 }
 
+static bool trans_ZERO_za(DisasContext *s, arg_ZERO_za *a)
+{
+    if (!dc_isar_feature(aa64_sme2p1, s)) {
+        return false;
+    }
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int vstride = svl / a->ngrp;
+        TCGv_ptr t_za = get_zarray(s, a->rv, a->off, a->ngrp, a->nvec);
+
+        for (int r = 0; r < a->ngrp; ++r) {
+            for (int i = 0; i < a->nvec; ++i) {
+                int o_za = (r * vstride + i) * sizeof(ARMVectorReg);
+                tcg_gen_gvec_dup_imm_var(MO_64, t_za, o_za, svl, svl, 0);
+            }
+        }
+    }
+    return true;
+}
+
 static bool do_mova_tile(DisasContext *s, arg_mova_p *a, bool to_vec)
 {
     static gen_helper_gvec_4 * const h_fns[5] = {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 47adcb5a15..c4b85a36d0 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -877,3 +877,26 @@ UCLAMP          11000001 esz:2 1 zm:5 110001 zn:5 .... 1    \
                 &zzz_en zd=%zd_ax2 n=2
 UCLAMP          11000001 esz:2 1 zm:5 110011 zn:5 ...0 1    \
                 &zzz_en zd=%zd_ax4 n=4
+
+### SME Multiple Zero
+
+&zero_za        rv off ngrp nvec
+
+ZERO_za         11000000 000011 000 .. 0000000000 off:3 \
+                &zero_za ngrp=2 nvec=1 rv=%mova_rv
+ZERO_za         11000000 000011 100 .. 0000000000 off:3 \
+                &zero_za ngrp=4 nvec=1 rv=%mova_rv
+
+ZERO_za         11000000 000011 001 .. 0000000000 ...   \
+                &zero_za ngrp=1 nvec=2 rv=%mova_rv off=%off3_x2
+ZERO_za         11000000 000011 010 .. 0000000000 0..   \
+                &zero_za ngrp=2 nvec=2 rv=%mova_rv off=%off2_x2
+ZERO_za         11000000 000011 011 .. 0000000000 0..   \
+                &zero_za ngrp=4 nvec=2 rv=%mova_rv off=%off2_x2
+
+ZERO_za         11000000 000011 101 .. 0000000000 0..   \
+                &zero_za ngrp=1 nvec=4 rv=%mova_rv off=%off2_x4
+ZERO_za         11000000 000011 110 .. 0000000000 00.   \
+                &zero_za ngrp=2 nvec=4 rv=%mova_rv off=%off1_x4
+ZERO_za         11000000 000011 111 .. 0000000000 00.   \
+                &zero_za ngrp=4 nvec=4 rv=%mova_rv off=%off1_x4
-- 
2.43.0

