Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2174049ejy;
        Mon, 3 Jul 2023 03:13:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4kpoAS2ZmVMcagNmf3Ebb8HKnFangDnUSTFg4Oh2Z01pMHSQa731G6dWSJy5JqSNYOGikL
X-Received: by 2002:a05:620a:3711:b0:765:40da:4444 with SMTP id de17-20020a05620a371100b0076540da4444mr12201771qkb.10.1688379210543;
        Mon, 03 Jul 2023 03:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379210; cv=none;
        d=google.com; s=arc-20160816;
        b=hrky/El4abrfgSy6GmTT4NNNuSn0cCjO+dnjATIZ0m9hC6Z/XnBAoXd4OSTAMeMSzX
         5OmaUOxS4jMupAozCAnzSsNPjNFEBZGdcDTmiJ2QCcvlob6xCtkmnFaDrRRHlVLQJzcB
         OWzW7x2mtfOMCo4VNvA6o5HE+j73kOZSEMRrY6wTDYgfMAilt/bS4uNB8RgjhnaOB+G1
         kiOTZoj6s0ZKOiga+emPMztezuEnZ7Yge/YqzNQfTz8iTjQtJTarM2AKmj3Z3Unj1LhQ
         4+8yVbg4xzPjE3M3KYT4/qOdGrOnKhGsizLgYxnvZKjHCg10kU57X9l1Qj47zzNXo6Y3
         PEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fCbxuyj6w2doHmBool/Ak6eLq+V5O+przb+5Ur/gE60=;
        fh=FQ25ncR7cw8LBZuZOY4ruJQD9HNaX6V/r26L+0BlwKY=;
        b=dpQihrWLyBik5317TPs/eHMH6gDCdDmgqk9yCJCAG22q9KrRsxNEWHZUhbZmBkO8M1
         vPjXd4vFC+AtXeUs4iIPyxVLiS+rp4ENNCoit0uPqhtzNS6ePXtTPQr9xju7MahD1/7G
         tgH9wVmmKtyScw7RnWQQYYU13C+UOK0HQ6uLSsynolYoEnFaKL0c3VKBuRGiKnQpnx16
         qxi1Jtfyml0i+3rUdnFS+WQIRhXUyopFgzlDv7K3wofSQ41NGYRIMWYU8FFQnxBJkL2d
         NkEjjsVtjqyjxDc2CHVijXZYWiz8h5BYXchgtYLM8qXHrAxFpn1x1VSX9joEcEuQ9pj2
         d8Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Dt/EC/uU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi48-20020a05620a37b000b007673ff60d93si5403197qkn.256.2023.07.03.03.13.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:13:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Dt/EC/uU";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRa-0002yY-5F; Mon, 03 Jul 2023 06:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRL-0002hV-Jj
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:51 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRF-0005rs-PB
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:51 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fbc1218262so51761185e9.3
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378743; x=1690970743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCbxuyj6w2doHmBool/Ak6eLq+V5O+przb+5Ur/gE60=;
 b=Dt/EC/uU7ECskHqfbxVRsmJj/DB5u2mG5aGX6ZEsCxE3kuWl/Fpg10kenXBGS0sBvP
 wg1EDXvuWX/FgO7xvuOst7WQcYzUDEBq23gGK+4pd11CFF/P0f/SX4155OoY609HfluI
 /DQ+Oz0HrECWZrKX/D0EbxOf15NKAWXhidKOiEe8VCCYMyKSUmDM5cHInH9VZMnkVJZR
 znobaGaw9OuD8aY+hgNI8dcmqaN+KBLbx2Tc+0vx60HNwH6OwS+8KCs8udU55yZVxNpe
 VAjEiYAZ20rwmKOyd0oAh9feZMMqmkUZt4X66RGZrOb6jrVy8Ke1XWeE92W1BsS65Wog
 D2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378743; x=1690970743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCbxuyj6w2doHmBool/Ak6eLq+V5O+przb+5Ur/gE60=;
 b=SO6E1eSv/nzIKcIxYftHMgFp0wncaJ5gPz4zIMPSrmUorNbd60AaVbiAv4zM2XNkrK
 86AsGV2cOldsDFEz4pT+xQ1ZJRtyMFfEpD+u5QLwzCvk+wUMH1xiuVxG521rTh3hATiL
 fUwv7GUud0Vq//VCfWJY88eR0D6sjRJgDIwkB5inUaEArqJVHX2R6cbwkg+hy7SM23rs
 5xHOc/mp3wFFz74CVN/NQqWllMya1r/9Pl7VnPXWrCdtZIwqftAxFR1tT/gjiXG/SdVg
 md0/0I47tZ8Imt44xJj/wfeSL2XqkqHHp8XkR9nO0WeiwX68v6Gt8/Blv62Y9Cf0spOg
 /3PQ==
X-Gm-Message-State: AC+VfDyfN14+rLL2EdCfqZzsF+XQfMJcgbSMvitOKHNvlloGA5rGc5Ec
 SFmrBIStiCXYw8bdLxOWIXumwA==
X-Received: by 2002:a7b:ce94:0:b0:3fb:a266:3a34 with SMTP id
 q20-20020a7bce94000000b003fba2663a34mr9438164wmj.12.1688378743037; 
 Mon, 03 Jul 2023 03:05:43 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 19/37] target/i386: Use aesenc_SB_SR_AK
Date: Mon,  3 Jul 2023 12:05:02 +0200
Message-Id: <20230703100520.68224-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 56syQWGJ7Suv

This implements the AESENCLAST instruction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fb63af7afa..63fdecbe03 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -19,6 +19,7 @@
  */
 
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 
 #if SHIFT == 0
 #define Reg MMXReg
@@ -2202,12 +2203,12 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
+        aesenc_SB_SR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

