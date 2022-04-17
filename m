Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1277796lfk;
        Sun, 17 Apr 2022 11:21:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuOZFQQeBxIPzTw/B6mnfsarnL+LoYWesKw75ifavM7YORHIVL9+5i7oFTh8EoRZon67Kj
X-Received: by 2002:a0c:f44a:0:b0:444:3894:2bfb with SMTP id h10-20020a0cf44a000000b0044438942bfbmr5673624qvm.5.1650219699593;
        Sun, 17 Apr 2022 11:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219699; cv=none;
        d=google.com; s=arc-20160816;
        b=B2lvnH3MH2Oy2vGpBTj//fX4gwywF1DVilkEAiMC6y73dOYTE77ig+2lYt5PHGNx6g
         QagLeg1IrcvxkXPdf6qDF+x8NEnYUaDw9yUwCJzWdVvArU6KIuNKShebqpwT5bX/p0Y8
         NScM4KhPbH1NARbNZPX8OxomESNqyBIxJMTE0XrDF+YUMc6Wfj5xD2tNcozdNj1DjZUj
         5gn43mIn64lfbn7VJP/HKYbX+oUIwBMjvp6DbbSyvVDFJPnS4Y9p4vwIpp+sBexJwUzH
         lE6VTegR7SlTGj1kE1y4n1OJdiw4MTIiwmmKjSApn2GbEF5gYVsxmw0UjrhnKLm/Ebv2
         jW9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iHPYNe1DqPRag9orJ+BvIVcsXKhWsdyBbed7JfVXS9Y=;
        b=0wO/hdJOBo34BJcJMLgk9ef/Hj86117D1oX+cNLi1eWOmCQZafy+ukorH2nK2Mvs8t
         GpwxBOk6S07hQ/8RAgxMwwDJkl4QUwSrlO58wYxSd8dcZzTeDLoh7bZVV8erYz7UeGUr
         RQAE+vzGISVhIroqHY78cDMbGZg4yLLPCvfTdlAXVQVUu/SiWj87rDsy8TgBYwuN+4op
         iAyUQJ2wATjMjQoBwwj/2mStF1zjGwTvw4tkygmFDsA1AYI15w/THUd66liZpjn7DiyJ
         AoJ91KyeJcIOCT+NJnitHUSFBpivz2lc28wYQhwk4hH9R6w+Jb1lGn73lxQ1klhiXWU6
         SZcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v3ifIdMX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp12-20020ad45f8c000000b004465a50e188si372475qvb.140.2022.04.17.11.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v3ifIdMX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9Wl-0002Lx-4i
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xP-0001Zh-9q
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:45:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xL-0003TJ-TK
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:45:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id u2so14951101pgq.10
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iHPYNe1DqPRag9orJ+BvIVcsXKhWsdyBbed7JfVXS9Y=;
 b=v3ifIdMXFqxZJbts6cFfjOHvY7Q27JcEX/6KmdKmxur1sReuVOSq0IKVlQWM1hbcJT
 LMAKoVVOMy5ONsRHL9GdfIEc/TnSQtgK1exhU5jXL6LuM9ApH2Kw4N92Jc0JIR1twpIF
 mml99lA89i5+vBeg6lDV4cp4JCzyNZpw25UaoGmVll/KByXyn98BUMGCFPyXDOsvsCgH
 GLqPu5Czsws/mQB0K4Dcmx+0i7oVNt6tGImbmJZFpwRvOpdx2/US54AtFvpJNZMO9Ocw
 vpy1Sxt8blAv+kDMIRM1chNkPGWKKK251eIvrJ1VcoVGOZ7cn6tsQCpqnx3Ng15059Mo
 QoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iHPYNe1DqPRag9orJ+BvIVcsXKhWsdyBbed7JfVXS9Y=;
 b=k8uptmiDdohQuLYakNTYtXlphPVWDpJY8n17UY2RdRoua5/aC6MPf3XgkRSJixwOtP
 4k9aoU4vtGUO8JbDYAP9r8JOkqn915LtziIX3/uLJCG4VsOup7wqIR8ATQ9/bZaNyRnR
 QITcUnS1mfZ551Zf2SPP4mpcQiK4Cl4G6BHhp75thCN1ZKnE97/VFiIaKuXrpw90TzX5
 aN6GyTHshUYBoEZFImkkG/h9jqyB1xk3e+yMw41ks3KfvUOc33cQ8oz4LwGq2WqdxlFK
 u6/sikFrYcbHmzdUDQh6a7pA3pcmzr+7h7Bofg3UhHKMqfSEO2REWIykxYGLBgNBALUD
 6Gdw==
X-Gm-Message-State: AOAM5318KcpzPZBcjxV1hLBNAg0WWcM11KianRHT3Jn1/qglkWw6jhbV
 3GcCkQ3AQY9Dz95qgG1TsfIw/A==
X-Received: by 2002:a63:602:0:b0:3a1:ec9d:1533 with SMTP id
 2-20020a630602000000b003a1ec9d1533mr7035496pgg.470.1650217502402; 
 Sun, 17 Apr 2022 10:45:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:45:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 38/60] target/arm: Add isar predicates for FEAT_Debugv8p2
Date: Sun, 17 Apr 2022 10:44:04 -0700
Message-Id: <20220417174426.711829-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TPV6hnsTL6b1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 76c0dd37cd..20bf70545e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3703,6 +3703,11 @@ static inline bool isar_feature_aa32_ssbs(const ARMISARegisters *id)
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
@@ -4009,6 +4014,11 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
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
@@ -4092,6 +4102,11 @@ static inline bool isar_feature_any_tts2uxn(const ARMISARegisters *id)
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

