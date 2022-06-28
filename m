Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2900451lft;
        Mon, 27 Jun 2022 22:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vBp7rHC77xtUy1wJgcHswD1Pt4r3uy/r1y0Uie8jBp4A3CHUK10JO1yWBKlHgnimB1j1cs
X-Received: by 2002:ae9:ef05:0:b0:6ae:fb2c:b03e with SMTP id d5-20020ae9ef05000000b006aefb2cb03emr10191718qkg.712.1656392677583;
        Mon, 27 Jun 2022 22:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656392677; cv=none;
        d=google.com; s=arc-20160816;
        b=Qd9uSqE1u6EfT/WEAGhjN1864BXpG6pijOSnUmtAM0AQ1bReefxbnxwbYqu8N/r2SJ
         BovIjJNDSzqjSIwJWg3hnUKE0lCVdIUfJXc54vk/cPTpI1erUl8k3f9Kbv7s9KYPzVG4
         Hiv9Yu62Kb9fr8LjyfkyN5n7oY6Ji/70BV0acOqSrPHQZbT6AO0UhBvH41qjrTgkVjQ0
         hHBEaOerSp8Z9QqI0F1vUCVoBCxEBaJHUpwvvUpmH0hp4653bTsc/4xXrM0HahwStZyP
         UdnWG0bbsdNiKI4wKBV1L+YmzRogsyBjm1+r0yiGJIG9MEsXLiLQFEgBW+pcVbCrPHck
         qUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
        b=N9BTwILlGRd8HyGeZkKU7H1cJlUzP+n2ydHZovGRK3+QicWo09xydk6qP+MaKcf8WZ
         wjFCKu0+z6zrfOWVZtlN3076uLCRy1AVtCMI7Y3CVHLVj+GzM/Js/KBF03gDS7DdaKVO
         1FmDfYXoH66SMMk9X1lMUvYljTK4f1GFzfaSuuNPPNTvWq7Cs1PUTrFYIXuSFTpjVzI3
         sjt1bEsSYP9cGuio7m7zoi1nPjH/uVvMxfjCD4s3zlVVQxwEqSycmx3Ze8VjhsKOGgGZ
         M8/iG/R92Nu7bSH2Bk8pPnGetoc0E6u9v+X3kKSIW9HtyUswps7ACYlS/44+oU0ZJRQo
         kh8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hBs/391m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc15-20020a056214230f00b00470a5539d85si5994134qvb.544.2022.06.27.22.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 22:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hBs/391m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o63Ov-0006qd-1F
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 01:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kV-0002py-ES
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:51 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kR-0003qj-84
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:22:48 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so14579453pjm.4
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=hBs/391mBUNXZXJVaDcIN3yFJeRFk6nzxqb9FprRy/Bg1FKtqoP++ezU6gfp8I934n
 SHEwCnKqHjJzt3KNjcqUMnwDU9I2quv2mlRoBHAbRwmMctvAuJhJFqKB5NJeCUQYFo40
 jj4zio/zX1UKxXgN3UAVC+PV4zzmXC9xT3AtojprgyHuf0yxkBmNCv57S/rpGxyFo4bd
 MwR/QssPvrTvpb9LoGeGGKzlXllYtcKeDKCj6PTPpBB0T34jLP4LKQOT7ogOp70hSxJP
 YA/moE9Ocei8SHogqZiJCPeSY+vGl7t8gI+EukE5ApWHUUAL0s955kxdQe5624S6rp3L
 Shdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FjmC/46ARakxFpcFGMLJHjfrHdRZ+a4Hi4clf4uxgwU=;
 b=IuzziP/B4Nk6BsTTedXOgbfLaoUkZOqZNWZ0fIu+JI+oeVcUBd01txa9InGyJ7srm4
 yhVup0C1X9XU7Zf9gwdO/nztFiTBp4P6CtGzKmPl/Kq2ssMixTRnhAFTrgF8hz0Bcj0Y
 6dbCEUZaHWBHorPuPgiUiO4rJycj9KFtcenfCg9lTi7EqkrQ/WgccBDBClHYaUu/Mng3
 KYBzWcqUlDQqQww5PbrT3+wXdsLph98NIv1MC/Ft2ot+FpPVl1XUr9ZPEuxiW4Cit6ta
 WPPblSgcvGZbK0HB1mMsbwIL3//3MZ4FMPPonnF/h4XNbf0mOzxm7WcnL37WH3iseGPc
 b6Zg==
X-Gm-Message-State: AJIora/xgHy0sjKGkGogI6kJ8ovECFcqTQPyC+d0VGgm71aIWlKFfc2i
 0oifoIkEnNOYPN8VHDo1QVCIjA==
X-Received: by 2002:a17:902:6b05:b0:168:ee36:1928 with SMTP id
 o5-20020a1709026b0500b00168ee361928mr1764667plk.114.1656390166075; 
 Mon, 27 Jun 2022 21:22:46 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 35/45] linux-user/aarch64: Add SM bit to SVE signal context
Date: Tue, 28 Jun 2022 09:51:07 +0530
Message-Id: <20220628042117.368549-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GtYUUrBf0QSq

Make sure to zero the currently reserved fields.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 7da0e36c6d..3cef2f44cf 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -78,7 +78,8 @@ struct target_extra_context {
 struct target_sve_context {
     struct target_aarch64_ctx head;
     uint16_t vl;
-    uint16_t reserved[3];
+    uint16_t flags;
+    uint16_t reserved[2];
     /* The actual SVE data immediately follows.  It is laid out
      * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
      * the original struct pointer.
@@ -101,6 +102,8 @@ struct target_sve_context {
 #define TARGET_SVE_SIG_CONTEXT_SIZE(VQ) \
     (TARGET_SVE_SIG_PREG_OFFSET(VQ, 17))
 
+#define TARGET_SVE_SIG_FLAG_SM  1
+
 struct target_rt_sigframe {
     struct target_siginfo info;
     struct target_ucontext uc;
@@ -177,9 +180,13 @@ static void target_setup_sve_record(struct target_sve_context *sve,
 {
     int i, j;
 
+    memset(sve, 0, sizeof(*sve));
     __put_user(TARGET_SVE_MAGIC, &sve->head.magic);
     __put_user(size, &sve->head.size);
     __put_user(vq * TARGET_SVE_VQ_BYTES, &sve->vl);
+    if (FIELD_EX64(env->svcr, SVCR, SM)) {
+        __put_user(TARGET_SVE_SIG_FLAG_SM, &sve->flags);
+    }
 
     /* Note that SVE regs are stored as a byte stream, with each byte element
      * at a subsequent address.  This corresponds to a little-endian store
-- 
2.34.1

