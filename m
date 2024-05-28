Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp190522ejk;
        Tue, 28 May 2024 13:34:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3z9A6lj3SvIdyu7/7ktEl2vFTynu9K1VKMPUd8HeaFrhi2fO0DkEhr56gzzYdzeqd0W5Wm1vOTH2HFntveVsbTWEJQPlk
X-Google-Smtp-Source: AGHT+IHG6C+cGHtINUJt6PnVr6YIXrMx+o/zwIMjKzYRFiHoIxf8JuQmeUnpGAkS2hY4JHQ6qcFV
X-Received: by 2002:a05:6122:7c8:b0:4c0:2d32:612f with SMTP id 71dfb90a1353d-4e4f02e931fmr11243287e0c.15.1716928491245;
        Tue, 28 May 2024 13:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928491; cv=none;
        d=google.com; s=arc-20160816;
        b=rvSYa1tXVaGBubSwxukSoMn0KzxEkVPBTzyU5nsZcotRnbO5qYOxVFa5/AF3xp4S35
         931qJpyxlM/7rSFYZhaShPrM+sF20hWn4vhZ4e+dZLRvNn8Er2SoI84lQ7IBBz/6UV45
         DFMMjhX/Q1Ajh18mTQUC/MX2YW7Lv4S0PXWu1dHoB0+ocdDkTY0r0WImEyvBtlKexmsb
         aahzSPzBKP0LPKv3G/XG/cZ5LHnT/mRqSZiDrZTnMReY5zvQdAXezvtx1cNRAL6AnhxS
         Ir58ZETOtRoQUVN8h2+tjBQ2Zr0NSPooUXwV5tg8A0CBp0PeEG9Z2FStkkuxNDPRTzER
         NtZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mlzLgB/Z9BImPgB1p/HCUMNJ/jlabUcBxkUVwL2nYL0=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=bDGoPl6gLwWduG6Zcl/5SuIpxe4r7lr69j/na9TPvsIiliFpu4Mv+mJGJtXbQ+SMC6
         SOXVhRMzIjeBMzbqtisopWrbCJauCBYQJnUlyuLW3fyR89GsKrIZjODA98IxxGOtJYjb
         EhLGl0e4vdu0EQ2Uk8bjO3yoTyVP0BUdHToNhrwXbUk1JNcmlATG0nJH3Z40IAyxGtMw
         KwRm3PCBIsj9Zs25QMmHUAVKmJLXgv8xzXdxAXC33KXFgXKucTCL27QQMLtmAIRFGMvu
         krmKv+1V3bXY/s3A4lqgrpX7StCj8V+JcMBnjWqi3roAczvqNjdKbMrttMxQPh+aPgp9
         OrYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLzMZxE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794c632e2d2si536595685a.102.2024.05.28.13.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLzMZxE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3UH-0004R1-8S; Tue, 28 May 2024 16:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3Th-00036h-B3
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:27 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TS-0003jk-N0
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6f8edddf756so1059646b3a.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928269; x=1717533069; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mlzLgB/Z9BImPgB1p/HCUMNJ/jlabUcBxkUVwL2nYL0=;
 b=XLzMZxE29FQjceQ0PnRZUePWFi7T+OCHSCzT+AEvwIyWRLhFx/QaCTfni9Xq1c0wOg
 ZlTpV3uIrBqiwYp9PIfYwzE+HGIYmm6451p5au81EgLUelJ1dRq99KY5Lo9JLYD0PMuM
 jvNNShUll2lE4/2nMqRiPLv/YL5QCdVMBHLffAuBmArVxb7QNJxmuppopT58CE9YIyRz
 vu8A/4SN11V0HeyMW6SiKXh4xGQOanxqxtqvMXaDPj0sJ94k2vFsM69R1hTziIANmJY4
 3U9FcgYStw02UB27odIGqtXJccqrR89eDu0Ph8HyUDTGya+sYGQckDGpgQgB7DqO8U+s
 BKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928269; x=1717533069;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlzLgB/Z9BImPgB1p/HCUMNJ/jlabUcBxkUVwL2nYL0=;
 b=cx1CAYq2X8cwSfuRlFax3J1LN+gLiiSTfYq5rEsAy/hENYQ8r14begQ91TfWfLiqGa
 CKK07S9gGpdJaFdIorxapR6W1wMYH1aJejESFYtIId1zL6s0it4ZSlRszamV6lybuED2
 WESsZoxvVtl7Z94n6nCeUvUF4svLRkn1WeaSBFC+pzbJkHCiU88aStIvFsO2BsoTXUkW
 456QslNSfStkixgawvwAegskfXxqDNnIi5EMTNJzQI8BwvDsU7mtE6LqFaJlel3YUzzx
 yDlXgtlh8pgUmyyAu43anWwz2139Z1s1D+ywe2+cshyWePMzx/bAiDZJ8z874isZpKu4
 jU5w==
X-Gm-Message-State: AOJu0YxIkEiJMI3VkQ74OaQ73TlsG8THLwEX638QdbK6IihdPXB7Pq2Z
 skt+avbmpJ7b7hs8zv7PHO3ju5TLmUaV/hy+PzN9bUfO1zfkLo3k7YWIJMhfHpyspHHhH7ROJW4
 E
X-Received: by 2002:a05:6a00:2a0f:b0:6f8:b1dc:d980 with SMTP id
 d2e1a72fcca58-6f8f3f9074fmr17925526b3a.31.1716928268656; 
 Tue, 28 May 2024 13:31:08 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:31:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 26/33] target/arm: Convert SMAX, SMIN, UMAX,
 UMIN to decodetree
Date: Tue, 28 May 2024 13:30:37 -0700
Message-Id: <20240528203044.612851-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qAWlxMeA6K/E

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++++
 target/arm/tcg/translate-a64.c | 22 ++++++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 1c448b4f7c..bc98963bc5 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -918,6 +918,10 @@ SHSUB_v         0.00 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
 UHSUB_v         0.10 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
 SRHADD_v        0.00 1110 ..1 ..... 00010 1 ..... ..... @qrrr_e
 URHADD_v        0.10 1110 ..1 ..... 00010 1 ..... ..... @qrrr_e
+SMAX_v          0.00 1110 ..1 ..... 01100 1 ..... ..... @qrrr_e
+UMAX_v          0.10 1110 ..1 ..... 01100 1 ..... ..... @qrrr_e
+SMIN_v          0.00 1110 ..1 ..... 01101 1 ..... ..... @qrrr_e
+UMIN_v          0.10 1110 ..1 ..... 01101 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9ef5de6755..db6f59df17 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5460,6 +5460,10 @@ TRANS(SHSUB_v, do_gvec_fn3_no64, a, gen_gvec_shsub)
 TRANS(UHSUB_v, do_gvec_fn3_no64, a, gen_gvec_uhsub)
 TRANS(SRHADD_v, do_gvec_fn3_no64, a, gen_gvec_srhadd)
 TRANS(URHADD_v, do_gvec_fn3_no64, a, gen_gvec_urhadd)
+TRANS(SMAX_v, do_gvec_fn3_no64, a, tcg_gen_gvec_smax)
+TRANS(UMAX_v, do_gvec_fn3_no64, a, tcg_gen_gvec_umax)
+TRANS(SMIN_v, do_gvec_fn3_no64, a, tcg_gen_gvec_smin)
+TRANS(UMIN_v, do_gvec_fn3_no64, a, tcg_gen_gvec_umin)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10925,8 +10929,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         /* fall through */
-    case 0xc: /* SMAX, UMAX */
-    case 0xd: /* SMIN, UMIN */
     case 0xe: /* SABD, UABD */
     case 0xf: /* SABA, UABA */
     case 0x12: /* MLA, MLS */
@@ -10959,6 +10961,8 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x09: /* SQSHL, UQSHL */
     case 0x0a: /* SRSHL, URSHL */
     case 0x0b: /* SQRSHL, UQRSHL */
+    case 0x0c: /* SMAX, UMAX */
+    case 0x0d: /* SMIN, UMIN */
     case 0x10: /* ADD, SUB */
     case 0x11: /* CMTST, CMEQ */
         unallocated_encoding(s);
@@ -10970,20 +10974,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0c: /* SMAX, UMAX */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_smax, size);
-        }
-        return;
-    case 0x0d: /* SMIN, UMIN */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umin, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_smin, size);
-        }
-        return;
     case 0xe: /* SABD, UABD */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uabd, size);
-- 
2.34.1

