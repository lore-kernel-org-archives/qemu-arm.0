Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2003817lfq;
        Mon, 11 Apr 2022 17:34:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRLM9IRXn8lUCoPDFpbGQEIdJ4rDDkHZvSKC4YLzNKhg1fqVr5kv/w8sCLGunQ8rr3ssGI
X-Received: by 2002:a81:2443:0:b0:2eb:4ffe:fab2 with SMTP id k64-20020a812443000000b002eb4ffefab2mr29160274ywk.330.1649723651554;
        Mon, 11 Apr 2022 17:34:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649723651; cv=none;
        d=google.com; s=arc-20160816;
        b=F2V9oDHuPlh1HBHs6XqTYkLzztNQrDwcn3KxYt54GuhltkMV4L/Zp4FEH9ow4eWLWB
         HFuhyy+JqFMwmcvYZBwRUDiFY57cRgMYQ5ynZPXnVhJnov3EtZ37Zd27IV1NLjCuKtCK
         L15WnUGTUm+nHR64aT7ZlLmpgt0HrzeZqBTgvZxlL5HahekKRVevBOFSoNoPNhR3pwiP
         OAprcYxyBzULWOrHOrGVfW9O6IGOox+BhRC44Zm3CTaINa0+ne7a7kRsQl3ZaXicFet1
         D113paXc6Cfon5hntZNk7gwFmne8xujVxxiuksIl8dtDPCnquM4+vcARwfOiZNsdIXje
         0Wmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8LKd5xer8JR43EOzT8A6TIM6/wBkWmSgb2MVfgNp/iw=;
        b=SkO8zH1yB+0Y72uBDJ7IkTKD99DY4rINQ6NrSc5hWBYv68GxJZtyvPvVo1rk4HoS5t
         bfinS0/8YR2baAK3kDfS/du40gauBaNqpUD+n6qXhzQIptjNiNhAO9ACkJ8h49IwdA/c
         Vd9RYFAgPZOpzPrPl3xRzQpzejV38oLHLHolq7k79qddFljvrmlp97S75i2g4x3ifmOm
         0faOmVzjuaPBBp6B9IELyGbVGBQygycH/WApllNu3ZyPfctvHqNpiHYtMQxsxOfslA3W
         ZP70TFGxErMH8z/iiXnX56KJSCk0bn/7joQPQeEG/VuL6mfnoJod+vjEqoBwMY5FdHjg
         dJPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gEQGcbUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f123-20020a0dc381000000b002e5bb9dc9efsi5050476ywd.120.2022.04.11.17.34.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:34:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gEQGcbUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4Ty-0001n6-Lt
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TM-0001kh-T3
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:32 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TK-0001mn-QR
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 20:33:32 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d15so15291852pll.10
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 17:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LKd5xer8JR43EOzT8A6TIM6/wBkWmSgb2MVfgNp/iw=;
 b=gEQGcbUElZz9OapHxbkCbJRjeJvhz40YepkrbttzkiswK7OBGMooHoX3BZw0U/N1EY
 7BZnnQ1d5b2rd4qAT+tzq11C8619MCX6XStq1KyfkowrhRLTai1k/9ZkXCW7zuxCpD93
 r0wBsjT9XalOwfUoyN5kvEpvCk6zZtjgd62A8Il5JHoyzZ1sTOekRvJ5hvdEqRSMZGQ4
 70E+7ybWr8lIhpN4lKzOhrGVvtdLNH8R1w0p69MCshQpO1xFZWBqwMNjpKwQe39xeAan
 MFTsgH9faaqtXW1xEy2Hhg8GiU5lqQE2qAj/g+msC5UCJjDvU5sCQNDQgsBNHwTvv+dp
 /UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LKd5xer8JR43EOzT8A6TIM6/wBkWmSgb2MVfgNp/iw=;
 b=RYzqwJxu1UfHmcYtFg4I4Dtr5L3pNVP7KOwyKkmS6fXsTFjX1QtMMleAUsm9ce6LLb
 sFSwRMy3SSH0CdPnMwjA6nEtVfnmz21y73y71D/JY9N38qhm3oYpzlOcCnC9peaP6PES
 r17fJS6sLt1MgfTzbIpz+oHJM+HYFUYRRUZM1h8Z2/CyRsg6nMzA9tfn/CccNhq24uhQ
 Ky50YLfJsyFea9ngVn9uOEa9gHRjbuwC+Z3YnijhvKK4Ojp1NsJmZLQVsGdURoEZ/lAv
 X5uutypIPh2YBkSRTARtZDuGdImzt2xwuEfQNCxa1tFcOZBVh4ZBC9M6JT2fv8t5ebzJ
 yTSQ==
X-Gm-Message-State: AOAM531L493l70OK5vmwtWYFz5t+Je+AwYq14QLpl9z7XFlDLDafp0Lb
 Xw+9STlKV5xhe+Hq8eUYjX8pjw==
X-Received: by 2002:a17:902:9b94:b0:156:2c08:14a5 with SMTP id
 y20-20020a1709029b9400b001562c0814a5mr34852711plp.60.1649723609523; 
 Mon, 11 Apr 2022 17:33:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/24] target/arm: Add isar predicates for FEAT_Debugv8p2
Date: Mon, 11 Apr 2022 17:33:03 -0700
Message-Id: <20220412003326.588530-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RfuArpwAEY0B

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 23879de5fa..9c456ff23a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4026,6 +4026,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
     return FIELD_EX32(id->id_pfr2, ID_PFR2, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa32_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_dfr0, ID_DFR0, COPDBG) >= 8;
+}
+
 /*
  * 64-bit feature tests via id registers.
  */
@@ -4332,6 +4337,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
 }
 
+static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
+}
+
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
@@ -4415,6 +4425,11 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
     return isar_feature_aa64_tts2uxn(id) || isar_feature_aa32_tts2uxn(id);
 }
 
+static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1

