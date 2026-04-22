Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FCFF9EDC5
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:55:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX5a-0006Pf-Ov; Wed, 22 Apr 2026 08:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4k-00060b-7j
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4h-0005Un-V7
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so33552135e9.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862382; x=1777467182; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/O57BXYHK8ET+Z6BA/YHEqhtOr337eupd637bkTh7l0=;
 b=zRjYZxtUV3maLgzQ8KVnwGBsPALz02V7MPZ77c2TB1Hhmc4P45atpS6FjzWBmx00vM
 tAzamBKjtxFRWAIvCZk4VZciTPUjK1WrpHNvl+pt02oNrNulFB1L8eL7kAWvBO1bOWm8
 m042/uUNI4EYCd2yURo3e877ITU7IrTBL0n8g/YrJjMGiW1pZQE7LBa22tcZUz3Hv13l
 1osaOqUjpl/xpUf7QLvtwU9SJjp7i8oATIXP6MPFAfkg80DnEYpyfsCNcugzLg0uGGvx
 s4XO7QCBFfpYZyP6NhC+JxmMo0/3tI0eyRJc5Apqbq4/O+ozPcTLPlmG8SW3lr4KZT35
 xpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862382; x=1777467182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/O57BXYHK8ET+Z6BA/YHEqhtOr337eupd637bkTh7l0=;
 b=CcRpBqkGRPSS6byY5nODLTmJOkEFTcIYxtDk+q9OcwX/0mqH+6TOB8n7eQRKDNQREQ
 XTUEPRDjdW4EKkD5exd37DqIFQayd/A3yPzdJwArQAb95kr+8BQWjYZsEDxMptnhyc0z
 V0SNjTQ/HrIcsp1o7KB1kwpUcxj8baDifzZMctwdXGkumC3h5ggh6NR8QXCiHNHPTMT8
 8+cXZa3UzRg0+qKgrnD0L7Bu4S6MEdTGc6WpdcC8tU3b6ae6qLIxmpyU9rMUx6n7FzeI
 1oxJkcAGulth154Jwz8kTDSsl+1H/i5W1kOXIS6PaiMioVr7/zWXQ+r+zEz7PqWTKRL/
 p2/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9WM6bNlA1FCbt1Pb8vM/BotEmpZ+8SdMHlk3NfSuUL6zgGmuOqghsIoNwKkGMtM8YEhWINsF8/+A==@nongnu.org
X-Gm-Message-State: AOJu0Yyn8OsEVJXpAieKMb1vB8nvfeKvPOafli1IVzmVrfzXYQAcMw7g
 KRl1kUGPo3n5MP1c83ZrSEX44AZnkYlWWtSGwg4YuNX0R9BqZxyVOitqZXQpNqRvWNA=
X-Gm-Gg: AeBDiesmbPvz6wruHhDhkwWvkMET2Psiy0jDCGfEiopYGJClEqr0tPEYAyJOY4fKu3Q
 MnulWKUf3hdGQO2tK4TjS7W23kI7wXNOX7sw/c5nbMcLLdVySRiiyD7rXyF3GOE97+XnYT/b0Q4
 ubXukNpxytM5DxsbOk727pkFlPa2+ETVbmIlUrDHq7bkvM53jzGQNe3vkz/BS26qi2PP+/fgnY6
 W0CPHHt52wt7oWD3s8gT8QGBPsJLdwSu5u6KyFBysBzWPp4pHYj3Dqo6zAlVq800NQB9gbhxdef
 QWgG4ShFjxlKM5+RkDRfDZyCQzDZo1aw4HhFQUPpdjqhZOqmzolAxxwmsJRnT6DC6/7hZiXnmTR
 +zUJhZMHM8mmixAFh1ZKr1Ek/yfDTo49GqiW91hO3e46Qk1JXbd/L+h8ub63I3iW5Jhj/rBCEGl
 KdYx6nVwv9VfLxF3dRcz/hB4M7bwZ9qvS/rw==
X-Received: by 2002:a05:600c:3b04:b0:48a:5574:3a57 with SMTP id
 5b1f17b1804b1-48a55743eb7mr94839625e9.29.1776862381644; 
 Wed, 22 Apr 2026 05:53:01 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb75c695sm134492015e9.14.2026.04.22.05.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:52:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6C5CD60469;
 Wed, 22 Apr 2026 13:52:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 06/32] target/arm: migrate PAC trap syndromes to
 registerfields
Date: Wed, 22 Apr 2026 13:52:23 +0100
Message-ID: <20260422125250.1303100-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

syn_pactrap is fairly simple as the ISS is all RES0.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 61053475984..fd8639d4f07 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -398,15 +398,32 @@ static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
     return res;
 }
 
+/*
+ * ISS encoding for a PAC Fail exceptions
+ */
+FIELD(PACFAIL_ISS, BnA, 0, 1) /* B key or A key */
+FIELD(PACFAIL_ISS, DnI, 1, 1) /* Data or Instruction */
+
 static inline uint32_t syn_pacfail(bool data, int keynumber)
 {
-    int error_code = (data << 1) | keynumber;
-    return (EC_PACFAIL << ARM_EL_EC_SHIFT) | ARM_EL_IL | error_code;
+    uint32_t res = syn_set_ec(0, EC_PACFAIL);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, PACFAIL_ISS, DnI, data);
+    res = FIELD_DP32(res, PACFAIL_ISS, BnA, keynumber);
+
+    return res;
 }
 
+/*
+ * ISS encoding for an exception from a trapped Pointer
+ * Authentication instruction is RES0
+ */
 static inline uint32_t syn_pactrap(void)
 {
-    return (EC_PACTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+    uint32_t res = syn_set_ec(0, EC_PACTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    return res;
 }
 
 static inline uint32_t syn_btitrap(int btype)
-- 
2.47.3


