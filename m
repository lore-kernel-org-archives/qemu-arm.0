Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2406158lfb;
        Tue, 7 Jun 2022 13:44:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxswtWSJ3GEwJV85un59HOWEd2HbSegq6qChb9EljbKKcHF6IrAtsOifGU3w61V3N8660Ef
X-Received: by 2002:ac8:7f8a:0:b0:304:ce5:6a2f with SMTP id z10-20020ac87f8a000000b003040ce56a2fmr24599778qtj.563.1654634648660;
        Tue, 07 Jun 2022 13:44:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634648; cv=none;
        d=google.com; s=arc-20160816;
        b=KTEUtbukfs9pFU3/tA0e3ZigT+byU3MzYzTkiA5Oyv7HXJmMiQeJtri1vMc9yeFcCd
         eUy408A2qUYzGaU+Pz4bAfYKM00NBWlmYaeR2gKafuXuTgaIHrIEISZL2Yn8MYpbCkty
         3KDjVqt+zDPM73Qkb7NCu2Ttf5HuhVpSFWpsXwutlCrxCHNUs+JVeFhOykkuEzFnyrru
         OWixGgqkO0Df8D+rb/vUOqxAeggoxnp6PgcTHQoQgN460HT5Aw0CgLWX6MKD8NyesgXu
         VH/HyXOK+IwD9/pfZIXjY8wwf9lJ1ZRkwOOxevP7eAA28Wb8wzh/avbGzsW0CpCZ+E9/
         qgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BaEHnyzZVvArILP5rZ7zZnIc67EOdE5VHFcxDg3gfVA=;
        b=Eq3+MI/E6YI6epsexdq5TN1zj3OR4EFa7O51ZolMorP+yiN27kvVYkMTaGbVsd76g6
         w8yNXH1FqtwRRj/HulbRncbGscOT2frIeazssfQ1G1E4mXjMkLOorPCXspWdanGl78Xm
         R8NVAfBCzBwu+ynae/hrW/wZWIDzyAv2fq2IlTldP/YXYW7Gj/Nn4SYrUEM/pbZfgqYm
         aDELf+mBDSKweEwNi9GA76Xrquvj2T1VghkvGruGZeceTpfEZ/FBdN8UvrEtFX4JtL2+
         6fx4D/KVfc8U1uZfpb0Tsi9DypNQ5+abCg1EeI27e+jVgWPOabsh/UNtfUIQFAafHbaS
         TAqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TwvKToC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020ac85e54000000b00304bf77a97dsi10699599qtx.350.2022.06.07.13.44.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:44:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TwvKToC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyg3c-0003eR-4E
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftQ-00084a-AI
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:36 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftK-0007Ms-UU
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:36 -0400
Received: by mail-pl1-x630.google.com with SMTP id f9so5339118plg.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BaEHnyzZVvArILP5rZ7zZnIc67EOdE5VHFcxDg3gfVA=;
 b=TwvKToC7AqOOeBq5uriR71I5v5+RfjB7+1QsFvgZZUx6AvqwPCvYfXEQpCz1a99o9M
 pDoCBAbqFKzSSniAe0Lv0dvZPF/Rvc9/xm/Cye8x1oAQAd05NLXzW8OzjxBMHu4xEPX3
 +Rk/01OJPLlrCYuVxh+8F8++4VOtG5ILcpK2/s+NG0fgYql0lM3s2z433pGcbg4ZYtp4
 NgqrwKgDy9Sl7mohs5wxjmsFq+9Mk1SalCXodvQa0gH4dvhl3SwCyTV10yfkn4k0ZZYr
 ln5qQ1X9/vtRTepcJ1+d39Kv2AfYkwQCx3pDcS1EmXQRxurQ2I4WjKP7eyYprMn/x79h
 DKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BaEHnyzZVvArILP5rZ7zZnIc67EOdE5VHFcxDg3gfVA=;
 b=QFh8fj0wvt4H7uvbjmD7f4UQFUZ1BYntgGfjKUkarzgmRBa6oo7GrSw+rSYZfHr6o0
 rMQNjZulFY1i6o09mVHM79m/V/SVPugLhXdwmW/4WZwhkTbah10xjz2plBu/uuQ6N6UR
 TdDu2TzcO9N0jH6R6PIglxGgozgb/reudehmvv01BA/ZdMYjT2Mr7fus0vsJxwk926hm
 5sANDKbhkJyP32Gix/HBOuefmPKb1anh/js8YY7IcnS/tg2IAOgiM25nv0ukqChOPEj7
 FLN7jNbMyv+FLQlB1kJXiJW3QjU1rp4mXiXyW3a6CZWegbjlpYBUf7nWq0FS8zz5mJ9g
 yvQw==
X-Gm-Message-State: AOAM531dL3+KaYkbdXRZd1KlKd5YPPJU61sLfdk35cmQn4BWtT5i6bSP
 fxb7/uMox8BXnXE3Cbx7kjSGibnwi+zRuw==
X-Received: by 2002:a17:90b:4a92:b0:1e8:2c09:d008 with SMTP id
 lp18-20020a17090b4a9200b001e82c09d008mr27171112pjb.169.1654634009526; 
 Tue, 07 Jun 2022 13:33:29 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 24/71] target/arm: Add ARM_CP_SME
Date: Tue,  7 Jun 2022 13:32:19 -0700
Message-Id: <20220607203306.657998-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DkGuaE/xekWI

This will be used for controlling access to SME cpregs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h        |  5 +++++
 target/arm/translate-a64.c | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index d9b678c2f1..d30758ee71 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -113,6 +113,11 @@ enum {
     ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
     ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
     ARM_CP_EL3_NO_EL2_C_NZ       = 1 << 18,
+    /*
+     * Flag: Access check for this sysreg is constrained by the
+     * ARM pseudocode function CheckSMEAccess().
+     */
+    ARM_CP_SME                   = 1 << 19,
 };
 
 /*
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8bbd1b7f07..f51d80d816 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1186,6 +1186,22 @@ bool sve_access_check(DisasContext *s)
     return fp_access_check(s);
 }
 
+/*
+ * Check that SME access is enabled, raise an exception if not.
+ * Note that this function corresponds to CheckSMEAccess and is
+ * only used directly for cpregs.
+ */
+static bool sme_access_check(DisasContext *s)
+{
+    if (s->sme_excp_el) {
+        gen_exception_insn(s, s->pc_curr, EXCP_UDEF,
+                           syn_smetrap(SME_ET_AccessTrap, false),
+                           s->sme_excp_el);
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
@@ -1958,6 +1974,8 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
         return;
+    } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
+        return;
     }
 
     if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-- 
2.34.1

