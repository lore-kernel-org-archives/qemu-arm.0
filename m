Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp687060njb;
        Tue, 13 May 2025 10:45:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqDywuPoj9pUP0U+Sx/lrJWt1o9hOux/1yrW7BLJ4QIoc8tb1Kl5+8HdEWBEB9fxMIQRvdMI5O6Bhgjg==@linaro.org
X-Google-Smtp-Source: AGHT+IEv4FPvPalthZO3NRr6/xi70upY00063BelC2JO63LKkI3rXDmF7TrPs+2CCzqDNamIpPSA
X-Received: by 2002:a05:622a:4007:b0:494:7a4e:435e with SMTP id d75a77b69052e-49495ce7056mr5248391cf.40.1747158298689;
        Tue, 13 May 2025 10:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158298; cv=none;
        d=google.com; s=arc-20240605;
        b=cs8QjWsb2K6YbjWx11l4nGAYIijnDP6fHnHv63JTV7Klyj9HnjpagY3q9sBAo10Dds
         1wFXLC36cuRlqNQHnuQaiCz1e1m9pJhKczqknpsb5GsBxERbhgkysjgruhF4dIAsbjT6
         a8Rxjmevs4MHWw2IgovJWTjNXRMiVLvNVDnXRvICM4hrfUZSRafaSDLkb22dS42iSw9I
         7tsKR581dv4DxyMoDhw8I4FIl4gc8cTRxw2loT4eMnz8vm/fKEvdZRtIpeUU7RuLffg2
         4F+Uv0wL+Yrx0R/duNf08rVZemFARrmQ+j7vZytDmMYTnKpYXOLYdr8/TiwHw7MIm9Kr
         X9Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1DnV5Hp0tmpiDlfH4Mi6kMgDb46uwa+8Kt5FmKdT51M=;
        fh=oAG6HIcuSPumOYs2ef0NYEkSLIm7D6VhhjfDQzOYEY4=;
        b=V2+8iy8Fm+73GMAOpGszZu3pqdd/zdnEY0cd0HDs3agAGkjKMRGIcbUnKROrqGpIoU
         Jg4bDMyJxg9SpufyAyysOEVvt4q7CYVuSJsJcEVXpgyScz6oZz+RYiAEnv7VBkOLmavM
         XCw184HMyW8kdRDFZwKG/TYXYeJrVnfj6cX9T1zmCP1nnVnXiVwIfyJjd8CXWqqbNwC5
         jIBKoJ3wD9ubnL0Pi8iboQ9AmwH9f0fjqDQBiY6qAyeG6KXOpdsVJiqQUzqBSOg0NkWT
         GNwa2rG32QK75+N1RB+w636zlgT7lin+c3T7k1xBVtylI6F1Ydnj6Pd6tWennDUTVHtE
         oxLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRWrR187;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49458be6bd5si111465361cf.279.2025.05.13.10.44.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRWrR187;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEtft-0003Ub-Am; Tue, 13 May 2025 13:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbp-0008UM-0q
 for qemu-devel@nongnu.org; Tue, 13 May 2025 13:40:05 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbm-0003A5-Hv
 for qemu-devel@nongnu.org; Tue, 13 May 2025 13:40:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso65667055e9.0
 for <qemu-devel@nongnu.org>; Tue, 13 May 2025 10:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158000; x=1747762800; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1DnV5Hp0tmpiDlfH4Mi6kMgDb46uwa+8Kt5FmKdT51M=;
 b=lRWrR187na1dm6eToYjimuxUggZNOr26rlpqJJL9Kp7H335QxStUoQkf3bpNTij4CI
 fvDS+qvMin7BcS9futLRJ4YGuvOJ96pw1MYO7UW795A0bPAZnDf11PQsyve+8dCyz8Lc
 47qBz0M0Dg9Cl+BwuHQ2CLhMgJJVSLa0BjsN3yCds8naAXZhYWixO8NuxGE5b49AbxlD
 l1ldrHdPOwuU20zgDgkn77U6cngQxUx3wune4zcFh9fvYUGSUPuSm2Hi08DNPouMIkJH
 fc1IRwq4pTWzV9m9NOyhhlPBbZeSzZ7znSFBQhEhSA5RsZQ8igSSVATOmm5qSp/Vj3ge
 rkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158000; x=1747762800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DnV5Hp0tmpiDlfH4Mi6kMgDb46uwa+8Kt5FmKdT51M=;
 b=jopH7KuQNEYIuKEC+fqCxlkjH5r7trjFJ6QSQAY0R6iRYKGtaPaHi0DEKXxy/04n4y
 z9Pp09DrPdlDW/dDE6UdO++977F90+UIVEUu1p2PxLYeifYfiS2RXoz2q46vfTu0qXsk
 +WSEaNbDAABUyMVcEH8jQoxzhQmhqSd/6ghqbCBRBrm0eH/po8xA1hO5tZ/jjsKb3vA5
 zkqxkBkYWSYIAUrgwumRpASNPsvryEHxzOaLd/rYsKUN9dE8HuDBOTAO1q1cJyRjwoTR
 DTAtUiORlZYVjMxqosowQ6M+xeYPLlBWRJSWZK+rzOp9+BuPF32wLpG5fFd6QOOh2v3A
 10sw==
X-Gm-Message-State: AOJu0YzCNhnpNUNCocy6KhqAf96JghoWGQ5CeeI6baW7EckDqSe0wOMu
 XBkFfP5XHQvV2MdNnlXp6Zw1vtuHKLC0AW/IH4thPyyL7cdk+lt1gs9qUMNCEuKbhXNmcZJzIFA
 1bi8=
X-Gm-Gg: ASbGnctQ6E3E5vAxn1z8m24jb8+kZBmwavUvRrAueOqG62Q9/VFdCKB3b9h3hg2CRGB
 KSTsgaP39rq6AQcK+pnKNpKvylwoo15QPW2RwdD4HRZZvT6rOslShWW4YAIPxqGDOsRxmmhrBCK
 Rxl9lAYlZDdJm4cgb0ex2Dw26HBQLD+UGFr71eaWa5C2rOyhzBTtBqUIcD2wKNlBLpEpq0m/me5
 XvMkcblJ5lcKqZheqJbNU4I8FV7KVTblSaGJM/Jcf5UtBjbJBSiVPE7MJbeMffv0LEzn1XqfTCM
 Jlh2gHf/9gulVBtjSA6E90oe1WwkdM8Vwj5gNqgNhfN664xZ60UQ8rbGw8cpdOtaxi50pXyPq8g
 a3q6/UsrhV/r7G89pHZ/QgODJ4kwN
X-Received: by 2002:a05:600c:4454:b0:442:e109:3032 with SMTP id
 5b1f17b1804b1-442f2161883mr1705145e9.24.1747158000373; 
 Tue, 13 May 2025 10:40:00 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32835dsm220888235e9.6.2025.05.13.10.39.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:39:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/19] target/arm/cpu-features: Include missing 'cpu.h' header
Date: Tue, 13 May 2025 18:39:15 +0100
Message-ID: <20250513173928.77376-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: axU9CCTzWxBO

"target/arm/cpu-features.h" dereferences the ARMISARegisters
structure, which is defined in "cpu.h". Include the latter to
avoid when refactoring unrelated headers:

  In file included from target/arm/internals.h:33:
  target/arm/cpu-features.h:45:54: error: unknown type name 'ARMISARegisters'
     45 | static inline bool isar_feature_aa32_thumb_div(const ARMISARegisters *id)
        |                                                      ^
  target/arm/cpu-features.h:47:12: error: use of undeclared identifier 'R_ID_ISAR0_DIVIDE_SHIFT'
     47 |     return FIELD_EX32(id->id_isar0, ID_ISAR0, DIVIDE) != 0;
        |            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu-features.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 525e4cee12f..4452e7c21e3 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -22,6 +22,7 @@
 
 #include "hw/registerfields.h"
 #include "qemu/host-utils.h"
+#include "cpu.h"
 
 /*
  * Naming convention for isar_feature functions:
-- 
2.47.1

