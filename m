Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp190176ejk;
        Tue, 28 May 2024 13:33:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcvn2xzye6r5ncjh1yPhgUqP2E6Y7R7KSahE/Nu32nlXlAagCwxJlAyY0M+ZI50BZByLnWzqOfAFxoqVlYQxpcI9efTwrR
X-Google-Smtp-Source: AGHT+IEGqtKzJOUrGPas//YCFT7B/3+jBPm3e1WoFGYTfWN2T5hjkxH18UzKXXuZJUZmdlFttcxj
X-Received: by 2002:a0d:e214:0:b0:617:d864:7e0b with SMTP id 00721157ae682-62a08fb0fdcmr126507287b3.47.1716928434484;
        Tue, 28 May 2024 13:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928434; cv=none;
        d=google.com; s=arc-20160816;
        b=BPBToZ0AZjo/yheqPGjqR0msPNF9JhrZ4Lt9lykh+3c8vbXWiPQ4K7VkJ/OY38qlpU
         J/pScQYV+RG9WSXtJFwZPX04VN50X7uAMTLMQXY9bgLRpBBM28k3Ad7xRptkW19uDQvA
         aquyr7LNlasrfhBqu9u8jetRIrKgwLIGgSO2jjEncZjqyDuziLtW3qVZB+3BbnZzcHWQ
         7yd6TEo0nWOxop8MJ56kyKUBXbZWk6g3dm8fTgxR3C0bIuZFQWBg/qcNHvUWjg3gCTFi
         zi0ijk0bb7fzh7FlkzfEf3T7ohB6d96X6eZoz9MSEiFAYVfwSK3JrcoaJwCO82/1nPAi
         mkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mrONSqgx4zxoEQQCzSdQWDr8PF7f3aaT8NZI2DUfvUQ=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Fbf5CX+QDzFuXvvJSQzIJ8lh2FSX8oF4KSh+xz1jb2XfRYpghFIuobxfwB2+2VXEWB
         At1UrYI7BXO5A9X/88Jztd+evRRx+tnon1dWbnICG3yPUc0eZmam3JiknNzKwVDKset8
         8R6BTcN9pJf7KopP+EwqT2PsjLzmQGlMwZn/SYuFlBMZBn9WNjDqEUfMs1GWqF6UPu/k
         X35eTi06DZiHHevqW6CwgdK8JNpp55rx6+npimFtBP6NcxdEvxzHuWKe5g2flDzIFM0P
         KrqgsrEkxinN8EhWSCbjENrS8bujgd2/E6Yu4jLGcRbOCbaalSR+c9OsenBldTSMg1ca
         5YTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KL9EFpom;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcab4b8si1210946385a.71.2024.05.28.13.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KL9EFpom;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3Tm-0003B4-0y; Tue, 28 May 2024 16:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3Td-00033K-0g
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:21 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TP-0003ii-L3
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:20 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6f8e9555eabso1049893b3a.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928266; x=1717533066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrONSqgx4zxoEQQCzSdQWDr8PF7f3aaT8NZI2DUfvUQ=;
 b=KL9EFpommUZik266QP3OMS1ZjIC7ufrga+/+hjZTY1lwV5B5Fae8vnH8y1U1eErfGi
 qipevplP/GGsNiZQ04qwBs5GqWChICkqIN/ZlBJxw2yKK0iva5vOvnbnRhhEWkISUSE0
 Tcv4Buw+eL72naW2NnUDWiZtO6dnvZcIgoDZ+hGCPVorpb0unLr9S5NQ9WnwPhDZ4PQF
 rdHfy7W0FnQnmK9rhfLRnjk84uzpi3EZqDXo5vWmT3+P6PTrXa451B88Q7kRXZu7Vmje
 gXuDK2W4X+7+205rxyIi0bX37ev/RWktLixXn4J4wZXTxDCTjzDpnANAXI/R2LIrtYf9
 mAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928266; x=1717533066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrONSqgx4zxoEQQCzSdQWDr8PF7f3aaT8NZI2DUfvUQ=;
 b=NvTfXnyNIbwAJNgs+ZpQUfBbN/kiCNLTRFoxZWeYg0vfIbjEg57ji+QyOsXDBn5Fvx
 P6K9z7icgWujnOh5C5ohR62slGpAmqakzUO8psbt0sGqVtrztDbRESjbGWW8YiY04gus
 vZr5sRXvo3S3Ct1mCN7mTkwvgnaHdzkHTBsZTj6HluZZHq5T4NgM9LdrffbwLOwnRa3i
 JY9+e02AqCVXgPyWRYe1XAAHvQ77ptBilNDD1AxpqHxQ+22HNrh3wtgIElDJ4nwUwliZ
 9aFk9KxQwOBZgtQc5+j693S6RsRgVH8VZkL0YD4WLiWBMNbEbUFvHyuCs0W3iA3vZxvy
 twkw==
X-Gm-Message-State: AOJu0YyYOuhz5rBPM1DxtsD/UBM9PIOVYAiL2hQtxYN5nEFz9ZWoTPoY
 FySzVqKh9YQoG3HReNGsOaZMv5d/cnEVNwF//T5udJkjGL4/SRxW2GFMZel4Clo=
X-Received: by 2002:a05:6a00:90a9:b0:6f3:ee60:54bd with SMTP id
 d2e1a72fcca58-6f8f30847d3mr13018042b3a.8.1716928266381; 
 Tue, 28 May 2024 13:31:06 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:31:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 23/33] target/arm: Convert SHSUB, UHSUB to decodetree
Date: Tue, 28 May 2024 13:30:34 -0700
Message-Id: <20240528203044.612851-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: l4o7xXCivCv2

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 11 +++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index e33d91fd0a..b1bbcb144e 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -914,6 +914,8 @@ CMTST_v         0.00 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
 CMEQ_v          0.10 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
 SHADD_v         0.00 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
 UHADD_v         0.10 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
+SHSUB_v         0.00 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
+UHSUB_v         0.10 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 63f7a59f94..6571b999f4 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5456,6 +5456,8 @@ TRANS(ADD_v, do_gvec_fn3, a, tcg_gen_gvec_add)
 TRANS(SUB_v, do_gvec_fn3, a, tcg_gen_gvec_sub)
 TRANS(SHADD_v, do_gvec_fn3_no64, a, gen_gvec_shadd)
 TRANS(UHADD_v, do_gvec_fn3_no64, a, gen_gvec_uhadd)
+TRANS(SHSUB_v, do_gvec_fn3_no64, a, gen_gvec_shsub)
+TRANS(UHSUB_v, do_gvec_fn3_no64, a, gen_gvec_uhsub)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10923,7 +10925,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
         }
         /* fall through */
     case 0x2: /* SRHADD, URHADD */
-    case 0x4: /* SHSUB, UHSUB */
     case 0xc: /* SMAX, UMAX */
     case 0xd: /* SMIN, UMIN */
     case 0xe: /* SABD, UABD */
@@ -10949,6 +10950,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
 
     case 0x0: /* SHADD, UHADD */
     case 0x01: /* SQADD, UQADD */
+    case 0x04: /* SHSUB, UHSUB */
     case 0x05: /* SQSUB, UQSUB */
     case 0x06: /* CMGT, CMHI */
     case 0x07: /* CMGE, CMHS */
@@ -10967,13 +10969,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x04: /* SHSUB, UHSUB */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uhsub, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_shsub, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-- 
2.34.1

