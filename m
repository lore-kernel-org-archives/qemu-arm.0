Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5010424lfr;
        Tue, 13 Apr 2021 09:08:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIXMm2A03xWeZjFZMHvD5zlJrZVX3JJQrSgF3ohbjpAxqFmAJnudK5QNFJK6WiimLTWpb9
X-Received: by 2002:a5e:c00a:: with SMTP id u10mr27296976iol.165.1618330129663;
        Tue, 13 Apr 2021 09:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618330129; cv=none;
        d=google.com; s=arc-20160816;
        b=MR4lBg8e7u6ur+k3SM95V9lHLVJGtB8jTmC8Cm1gYzr3x64nIqkqWBbFBpXXM1RrVH
         FV7ZVy07gUcuiSVW/vYWWARBjYhAf3kdLysy/pTSvv8Z0mQ1DtEhK/PQyoFQDhYDAH8n
         pr39MxzibanBfwhXvB6RExwPWHXdg0AYfRzcFXiDsNoz8fOZaLqqAJKHfco6mX78bZfT
         u8iOy69oRX32DgRT7vtnvMibSy2dNLkaXIAJY2a5Yx3V9cISvYadS1i6HuUD/pu6eirc
         /2gqRiY9DZDsktO2DWgSORRZ3tSPAyZQcMzZLf+BnTBbh7mnOGnbVYI3LGwtb1KmpKH+
         EJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0ZGdNnOiGwNj8lQaOaIdMrMwuGDxlAwHGTtG4I3LmxA=;
        b=nfvl3QRZyibW3oyJTdSwS5Sw3yrEIYPAPTK8/DWeQLorNI4Sz2zQtqQqSHfXKMabJs
         3cUb0ypErSk0fqFmrSQBHAUfWivzSL/b8DiG1lyA4DhEeticYvwAD5p2nY0oKdIfTUc6
         6vnl+uv3wGsmV5ejAvH3LooKeRhsXdaLKc+08C84AFQOUElIIsYf8Ahh/iRbFYz4FEMj
         qnvP+tyYXX2Pnwh6XWJtQMcV63m7iHpO4aGO5URhI5sEjbyfEau7ciqkaMBH4iZbPQiN
         gJop3d5CMIDzXQbWk62xIdZGDFNWHkbS4tV3N6uWqULEzWlo9Z44QWMkDIDMrFkqg6nG
         7U6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwgyFdPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si15453609ilv.96.2021.04.13.09.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 09:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HwgyFdPQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWLaq-0006F1-SC
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 12:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaS-0006C1-EV
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaM-0006tB-0E
 for qemu-arm@nongnu.org; Tue, 13 Apr 2021 12:08:23 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so4272996wrx.3
 for <qemu-arm@nongnu.org>; Tue, 13 Apr 2021 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0ZGdNnOiGwNj8lQaOaIdMrMwuGDxlAwHGTtG4I3LmxA=;
 b=HwgyFdPQ4/h8kqEqDsy/hckVOkWdsDk4pk9U4/4dAMZOc5/VTAwUpIjSEBRwI5R/xJ
 l8GRPM0aFhiub4lXtHY0ybeEY7UNaUIbrX4FQ4E1mFZCsu/hJX0Dh6BU/57hCfvyXQqa
 5GHLyWnsRwvofJ6VoDyT36qx/invI/CQsvzWByalXg0r/lLT55j3uDDbJ2SB0dYf0gsw
 IN533wqdrTvG+huH6d7P6PwO7f9B4uDlm9o4tGdlATwqp2VzVmElNmSpa9XCJA2gZNVA
 gVMRnNN8TquKYDE+SKyvWENVpLe3aHVqs8d0W4eISZmA28yWXQksUoN3VceMkrNYxNcq
 +QRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ZGdNnOiGwNj8lQaOaIdMrMwuGDxlAwHGTtG4I3LmxA=;
 b=K7KsHciJbYDk/9E4PPVyduy2lhoOMR7nPO2SyRjERZvxayp8DOH8UfikvmaLRJK7dq
 A7jk2QXAdRDM1uH0vXKb+sr8Y2onC3HQqVOe24QghVBcjIk++EY2CMrHb08Kf6Mjencv
 dSFyGkAnfWM0HHO058vCTLbgWVuteTBGpXItldoZa8cwg0qWxJgEAhZWpvQCTNkpKIty
 2QQdm/UJHvAAbjaIRYnVj3Kp+NWcn8wk/E9Cr9dDqI377nc+tzvt22ThLYY8bNTBlz6R
 vi2iwEp9qLvQpFkVaFb3ofHtF5XdtIFzuixT/w6tSs+JrdOnaJN22EnhTh6Ki1xeucNB
 9EDA==
X-Gm-Message-State: AOAM530LvxPaJgTz664wxsTmAHkaWBDcB6MfQAvCgj/4iTz0AIDacYpK
 VwRv8/gYdq8frBhVZmxlncpTMYx0VlVHmQoT
X-Received: by 2002:adf:e50a:: with SMTP id j10mr290376wrm.394.1618330096639; 
 Tue, 13 Apr 2021 09:08:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/13] target/arm: Move gen_aa32 functions to translate-a32.h
Date: Tue, 13 Apr 2021 17:07:51 +0100
Message-Id: <20210413160759.5917-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413160759.5917-1-peter.maydell@linaro.org>
References: <20210413160759.5917-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: lRHh0dMuRxXh

Move the various gen_aa32* functions and macros out of translate.c
and into translate-a32.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h | 44 ++++++++++++++++++++++++++++++++++
 target/arm/translate.c     | 49 +++++++-------------------------------
 2 files changed, 52 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index cb451f70a42..e0e03245f6f 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -57,4 +57,48 @@ static inline TCGv_i32 load_reg(DisasContext *s, int reg)
     return tmp;
 }
 
+void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc);
+
+#define DO_GEN_LD(SUFF, OPC)                                             \
+static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 a32, int index)            \
+{                                                                        \
+    gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
+}
+
+#define DO_GEN_ST(SUFF, OPC)                                             \
+static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
+                                     TCGv_i32 a32, int index)            \
+{                                                                        \
+    gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
+}
+
+DO_GEN_LD(8u, MO_UB)
+DO_GEN_LD(16u, MO_UW)
+DO_GEN_LD(32u, MO_UL)
+DO_GEN_ST(8, MO_UB)
+DO_GEN_ST(16, MO_UW)
+DO_GEN_ST(32, MO_UL)
+
+#undef DO_GEN_LD
+
+static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 a32, int index)
+{
+    gen_aa32_ld_i64(s, val, a32, index, MO_Q | s->be_data);
+}
+
+static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
+                                 TCGv_i32 a32, int index)
+{
+    gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
+}
+
 #endif
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 168427159ab..fd248b101f2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -879,8 +879,8 @@ static inline TCGv gen_aa32_addr(DisasContext *s, TCGv_i32 a32, MemOp op)
     return addr;
 }
 
-static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     TCGv addr;
 
@@ -894,8 +894,8 @@ static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
     tcg_temp_free(addr);
 }
 
-static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     TCGv addr;
 
@@ -909,20 +909,6 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
     tcg_temp_free(addr);
 }
 
-#define DO_GEN_LD(SUFF, OPC)                                             \
-static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
-                                     TCGv_i32 a32, int index)            \
-{                                                                        \
-    gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
-}
-
-#define DO_GEN_ST(SUFF, OPC)                                             \
-static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
-                                     TCGv_i32 a32, int index)            \
-{                                                                        \
-    gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
-}
-
 static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
 {
     /* Not needed for user-mode BE32, where we use MO_BE instead.  */
@@ -931,8 +917,8 @@ static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
     }
 }
 
-static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
     tcg_gen_qemu_ld_i64(val, addr, index, opc);
@@ -940,14 +926,8 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_temp_free(addr);
 }
 
-static inline void gen_aa32_ld64(DisasContext *s, TCGv_i64 val,
-                                 TCGv_i32 a32, int index)
-{
-    gen_aa32_ld_i64(s, val, a32, index, MO_Q | s->be_data);
-}
-
-static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
-                            int index, MemOp opc)
+void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
+                     int index, MemOp opc)
 {
     TCGv addr = gen_aa32_addr(s, a32, opc);
 
@@ -963,19 +943,6 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
     tcg_temp_free(addr);
 }
 
-static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
-                                 TCGv_i32 a32, int index)
-{
-    gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
-}
-
-DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16u, MO_UW)
-DO_GEN_LD(32u, MO_UL)
-DO_GEN_ST(8, MO_UB)
-DO_GEN_ST(16, MO_UW)
-DO_GEN_ST(32, MO_UL)
-
 static inline void gen_hvc(DisasContext *s, int imm16)
 {
     /* The pre HVC helper handles cases when HVC gets trapped
-- 
2.20.1

