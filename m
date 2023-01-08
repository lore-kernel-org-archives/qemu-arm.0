Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1325742ejc;
        Sat, 7 Jan 2023 18:39:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtzwfScdplquMlccwggKDe55LjZ+DAn/ZcwlF8Qlx4SRo2A6P3f2mNq7hCSWdOPNkOksWBm
X-Received: by 2002:a05:622a:1e99:b0:3a5:ff6e:d43e with SMTP id bz25-20020a05622a1e9900b003a5ff6ed43emr90768330qtb.2.1673145542711;
        Sat, 07 Jan 2023 18:39:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673145542; cv=none;
        d=google.com; s=arc-20160816;
        b=I4UgAzKINh6IGy/4/UelNIGZB7Um2uTp2+ZI2IBgWekiBPw/kVVNPGs9J+tKWspv/S
         mpbyl/M1BjOuJbryhLykcYVL4HqoqzBlwXA1ieSxHn9/fg0X/3KeV4z77jcOxtqjieCm
         FnryCC4lmeRYH8BGemlvVFOAdKjeVrh+Zf5obgtajb12HunTbLWoNWRuhca6b8JvW41S
         Nu/GijICW7GQieVomMogXdiNEhZIQAR5Mzy+6hBtdsD9aY6c2iDyvBkt5CfLx6QnGWqY
         F9Gt2DK5oCsWuP2+H+n22t/oDd6gZhVt22tLURJT8roT+P19qctDCvuvn8/KO/op3iY+
         fDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WRIZMZP9j9SPp1EX0fHgPhfmFfX9VpYNwtU5BnkhtFg=;
        b=la+noRuMqXmQxZEte+BDq0wpWt+DJGMTTotIqW/IXhWpBL60p8JiJWJAuYLbsw8i1X
         8SyIBYXzYPWzLswU58079BvTNnn96gIFfjt9qR6wm/o40xmtRA2GFl6pvi5w7fGOHxaI
         fQOknb92BOdW8G58Q57J7SPnDPKi2esTnspY7XIR/k/UkI28Q19eozea6K6q3gKDopRP
         u49Gl4JbYTQ/G2M3iX45e12CS3ObDvG6aP6yWH0Xk5wKDTXqHr1wnzzDevgR1XtgTpbd
         9ZHD+ayaRTe8giqyvzix6jisDrfSiJ+/0bGQcO63/L/TT+G2Zfj8iNHPFkIXpQ0tST7U
         RUuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dzEegWKN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020ac8140d000000b003a6955a6213si2678426qtj.427.2023.01.07.18.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:39:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dzEegWKN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELZf-0005Dg-LF; Sat, 07 Jan 2023 21:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZa-00058e-Qr
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZ3-0004VH-4E
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id bj3so2175260pjb.0
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRIZMZP9j9SPp1EX0fHgPhfmFfX9VpYNwtU5BnkhtFg=;
 b=dzEegWKN0lhR9o3FqsyRlrHUM6H3fJWmbhFz+W0s89m2HANADWVdmESrbC33slMYwR
 t06DIMmIR0SbKjPcG9DV2roWlaUOjEANTxHHF+kIjY7b+3RfUXudmMRcsWeG7B4hShxa
 9TQBlZnxsTxQnGosARi0Y4eOZELSZ+XR51zr2wZz0uIEYYjeer8rhPxIz2gk1KQXB5g2
 ozclQCH+zdkH10a9bS5qAxsclLmBZK+dBk2OO3pdbq6WLjwgyBO1RwzZQ8U9W5wZpblt
 EqIfi6jUlrr46AwWz34lmWNE5nTBJwYdbs+0JdV8aEXnHBC27DUCkVxtly37ZwKoO0dv
 wEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRIZMZP9j9SPp1EX0fHgPhfmFfX9VpYNwtU5BnkhtFg=;
 b=R6WEYr3W86ab9n/WTxBdhocwuTLLbZIZiGoh3Dh4IPssrzUk7hcAIBX0F+4gQWMllE
 Cg7hQY36G4zxp6YAE5JWGbLxAuYLQ9IgleFXn1fVSanJILtAYp7nDLNX9Ol/ZnO3G7nC
 1Ko0ZeKx32pQwycW1i/9Ryak9o1DIkvXp0wcdeUBfI/SZbwDiNnF6/+5AjLTartby7Gs
 SUPOAN3P9BLMmFKtyczm8TtGCsf81rzvornnusFwiTeI+6Jpea5GwnwlskCeDQa1vsMw
 paNBIJlnDdrMui/QDQpClTmVvY1+S8Orwi1X5ZfFZaPgzoTQPDcSmkSUy51aEuAYxWNW
 Galw==
X-Gm-Message-State: AFqh2kqBIINFiT9OPiApcKREcSQZYtUZ0RKvoqL4R3I1kGZyBpZ1H68h
 3nVuajNXB5o0lUPkdm0ponhjUF/WNTRFepZN
X-Received: by 2002:a17:902:f80d:b0:192:f6d0:6029 with SMTP id
 ix13-20020a170902f80d00b00192f6d06029mr14720846plb.15.1673145456385; 
 Sat, 07 Jan 2023 18:37:36 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 14/36] tcg: Add basic data movement for TCGv_i128
Date: Sat,  7 Jan 2023 18:36:57 -0800
Message-Id: <20230108023719.2466341-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ov/Pow4pDV+5

Add code generation functions for data movement between
TCGv_i128 (mov) and to/from TCGv_i64 (concat, extract).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  4 ++++
 tcg/tcg-internal.h   | 13 +++++++++++++
 tcg/tcg-op.c         | 20 ++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 79b1cf786f..c4276767d1 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -712,6 +712,10 @@ void tcg_gen_extrh_i64_i32(TCGv_i32 ret, TCGv_i64 arg);
 void tcg_gen_extr_i64_i32(TCGv_i32 lo, TCGv_i32 hi, TCGv_i64 arg);
 void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg);
 
+void tcg_gen_mov_i128(TCGv_i128 dst, TCGv_i128 src);
+void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg);
+void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi);
+
 static inline void tcg_gen_concat32_i64(TCGv_i64 ret, TCGv_i64 lo, TCGv_i64 hi)
 {
     tcg_gen_deposit_i64(ret, lo, hi, 32, 32);
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 33f1d8b411..e542a4e9b7 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -117,4 +117,17 @@ extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
 extern TCGv_i32 TCGV_HIGH(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
 #endif
 
+static inline TCGv_i64 TCGV128_LOW(TCGv_i128 t)
+{
+    /* For 32-bit, offset by 2, which may then have TCGV_{LOW,HIGH} applied. */
+    int o = HOST_BIG_ENDIAN ? 64 / TCG_TARGET_REG_BITS : 0;
+    return temp_tcgv_i64(tcgv_i128_temp(t) + o);
+}
+
+static inline TCGv_i64 TCGV128_HIGH(TCGv_i128 t)
+{
+    int o = HOST_BIG_ENDIAN ? 0 : 64 / TCG_TARGET_REG_BITS;
+    return temp_tcgv_i64(tcgv_i128_temp(t) + o);
+}
+
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index cd1cd4e736..658cee7d6c 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2745,6 +2745,26 @@ void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
     tcg_gen_shri_i64(hi, arg, 32);
 }
 
+void tcg_gen_extr_i128_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i128 arg)
+{
+    tcg_gen_mov_i64(lo, TCGV128_LOW(arg));
+    tcg_gen_mov_i64(hi, TCGV128_HIGH(arg));
+}
+
+void tcg_gen_concat_i64_i128(TCGv_i128 ret, TCGv_i64 lo, TCGv_i64 hi)
+{
+    tcg_gen_mov_i64(TCGV128_LOW(ret), lo);
+    tcg_gen_mov_i64(TCGV128_HIGH(ret), hi);
+}
+
+void tcg_gen_mov_i128(TCGv_i128 dst, TCGv_i128 src)
+{
+    if (dst != src) {
+        tcg_gen_mov_i64(TCGV128_LOW(dst), TCGV128_LOW(src));
+        tcg_gen_mov_i64(TCGV128_HIGH(dst), TCGV128_HIGH(src));
+    }
+}
+
 /* QEMU specific operations.  */
 
 void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
-- 
2.34.1

