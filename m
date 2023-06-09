Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp104908ejb;
        Thu, 8 Jun 2023 19:30:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61xY5LWXVGuejrs63ameMdoeKZyFUsG2NY5jm4toUOok1Q+EsdoEiHof2hXU3G1b/lOKVS
X-Received: by 2002:a05:6214:21ae:b0:61b:79ab:7129 with SMTP id t14-20020a05621421ae00b0061b79ab7129mr290177qvc.37.1686277813477;
        Thu, 08 Jun 2023 19:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277813; cv=none;
        d=google.com; s=arc-20160816;
        b=nwlakUxbJpNXMh3vhMKELhEUuHl7xmWhtcnW2p+0hTzwkeHolTsqYwFHwgooiBLhqF
         WAgr93zZE9esVaEciheUq7p+l9j6fBi8vIk0N2jKKYbwcesSyx/552AzJ/zDUi+ki/74
         E8BVokxUtGM6Tm3lEGb6Aa8/WgyI5XmRu8gDsFL1Yh7POCCKH2hiQ6sXpVmqXmY0Sz/O
         uSk36iKLEoQm0931Is6LRNBNO6nwBjp6ZlHO7052TVhN/dkq8Ig5PKGzAnJqpViPQugB
         o3rKyF7QHtPUo012f2lcNwzRxYatsINi0q9lgTVrvTtaY131btPerWK6ud9Lrq+q4cjC
         pSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FHn7761oYxdsJZ0uyv7CBW336hBHMDMZ5Sm0uogz08I=;
        b=NP5ScAj1BISzJH+c7IuGch5V/5tBYgitB05IaRV5keuresv2uSAnHabqN6eAIgv8sH
         vj/XNNBsqrWPZkyJtN9UHBpIIYNLJaxznpSoy2I/osFXb2kK2jfDlwMYEIjDC8aQeI/X
         qkfnpz9ni6+FTLB4hG8wBZtJr2etvNoO9OBRxQMG7Tb0N8y5rBlLhnj+7buxM6QYrdTc
         kG4snIceHihzG+2h/JaRW28MZWtDc66kwDV7bqtsnYco+M+3sSjX5ruN+gHJZIWL1nUj
         KVdpyC6Y3LGa9XF8gCC9NXAU55fWDklAgbQwNNfzoY+Abuf177DpaF9RfRX6vY4Q9C5Q
         RJrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MjIrTMQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020a05622a015200b003f9c1c44035si1561658qtw.178.2023.06.08.19.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MjIrTMQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Rp6-0004ji-Q4; Thu, 08 Jun 2023 22:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RoP-0003Dn-IG
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:25:14 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rnl-0005n0-Qy
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:25:12 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-65299178ac5so1353194b3a.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277472; x=1688869472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHn7761oYxdsJZ0uyv7CBW336hBHMDMZ5Sm0uogz08I=;
 b=MjIrTMQbbKf90XXrS1mG3BIfqynCvvOLZBqj/LuJcIPOZplNNTnqQS3fdU8gNkprPN
 qPKby+ybb+hOyTFuVwIafNDa8KyD1L/3jTW1Yr+pxQ4aZDOiUzqwDCOY2AoKEKFNWcat
 85GJrZKdBFwr4v8nXMqmkMoWfBgZP3XLiN1xWoJeXXq69xRW36NjYtBD6rfDWbybNlCr
 tDGnbHd/lsTUHLqyE6TRa6NiCO+UeMZmXyUW1zdS9IWFiN45Gk1bQlqiBcYrY63d6TWD
 F3snut0h2GaNuBqoPTEeVFzfpn1fHyY9AYGrYN5r06h2TqpvtQ2Ap3Cbj+FIjEtPYUJb
 KctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277472; x=1688869472;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FHn7761oYxdsJZ0uyv7CBW336hBHMDMZ5Sm0uogz08I=;
 b=Z5KtUGmjGzdrohqd/JQ0be4evBdZ/AogTdj5ZiMpjL98t48KtP/IiPUHXCYoTv7EeB
 0rjcAV59prAbGVJr+9qhB5130t7Ktwn/+N1QWsWhhuTsUUvFf2W5uVD4nXgL5BR/pyDz
 +p/STt4zK5/eeAh0oMjvAMEsIgqZRSVA7u8MSXD1k4Slui+HeqLGbeVeRVtv/d3ucTCz
 w3jlnSwpitDrBR0FlE82R1TpizJieZDyhBHaVEOG0wWNp0klA5ULBWdaKl/n35JUksvy
 JVAQHATgM55L59Cz2dQIqyUZUchfVuKLQ693CPi7O/yHVrgMYXQ+2an+KL8UoAKirwwv
 8Jmw==
X-Gm-Message-State: AC+VfDyp/YQDJ1M058bILqgV84JPfdENvNHr24wiz10s3XX6D5wM9Su/
 64l9DkMYq4YdSq3Ayyv5b2v0Zg==
X-Received: by 2002:a05:6a00:2403:b0:652:7b99:df30 with SMTP id
 z3-20020a056a00240300b006527b99df30mr11622655pfh.25.1686277472475; 
 Thu, 08 Jun 2023 19:24:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 32/38] crypto: Remove AES_shifts, AES_ishifts
Date: Thu,  8 Jun 2023 19:23:55 -0700
Message-Id: <20230609022401.684157-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: 0LjjdkXvbi63

These arrays are no longer used, replaced by AES_SH_*, AES_ISH_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/crypto/aes.h |  4 ----
 crypto/aes.c         | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 24b073d569..aa8b54065d 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -30,10 +30,6 @@ void AES_decrypt(const unsigned char *in, unsigned char *out,
 extern const uint8_t AES_sbox[256];
 extern const uint8_t AES_isbox[256];
 
-/* AES ShiftRows and InvShiftRows */
-extern const uint8_t AES_shifts[16];
-extern const uint8_t AES_ishifts[16];
-
 /* AES MixColumns, for use with rot32. */
 extern const uint32_t AES_mc_rot[256];
 
diff --git a/crypto/aes.c b/crypto/aes.c
index f0721ad4a2..7b8a22fe3e 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -131,13 +131,6 @@ enum {
     AES_SH_F = 0xb,
 };
 
-const uint8_t AES_shifts[16] = {
-    AES_SH_0, AES_SH_1, AES_SH_2, AES_SH_3,
-    AES_SH_4, AES_SH_5, AES_SH_6, AES_SH_7,
-    AES_SH_8, AES_SH_9, AES_SH_A, AES_SH_B,
-    AES_SH_C, AES_SH_D, AES_SH_E, AES_SH_F,
-};
-
 /* AES InvShiftRows, for complete unrolling. */
 enum {
     AES_ISH_0 = 0x0,
@@ -158,13 +151,6 @@ enum {
     AES_ISH_F = 0x3,
 };
 
-const uint8_t AES_ishifts[16] = {
-    AES_ISH_0, AES_ISH_1, AES_ISH_2, AES_ISH_3,
-    AES_ISH_4, AES_ISH_5, AES_ISH_6, AES_ISH_7,
-    AES_ISH_8, AES_ISH_9, AES_ISH_A, AES_ISH_B,
-    AES_ISH_C, AES_ISH_D, AES_ISH_E, AES_ISH_F,
-};
-
 /*
  * MixColumns lookup table, for use with rot32.
  */
-- 
2.34.1

