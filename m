Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp690528njb;
        Tue, 13 May 2025 10:52:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+H+gCnB+VkZwPXOPI0s9ffRXe36Zpr8yFt6yNLoURDa0R2VwYfggbXVMySe+1OsqR3H9wrro4pylfCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHP4Lvzqg3qhH3TJ1tIgGhZGO6cemKuD55aj0O5peY6M67q6Vl3u4GrOm6zSfC7wKmbIUYm
X-Received: by 2002:ac8:5a11:0:b0:494:6e3b:a80b with SMTP id d75a77b69052e-494872fe721mr67794841cf.2.1747158750143;
        Tue, 13 May 2025 10:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158750; cv=none;
        d=google.com; s=arc-20240605;
        b=DZ8xu/t+7zUg63ArlVU/DiSkE27c6W1dU9TEdp5+SxT8mCJImj1kvkoLcHjlEBh5nZ
         k5RvmtV0IF61FGrL9fwtRtd+Am7ApxuaJ3IudTKv8JEnoIo8mUJmYyVcoGc5zLPWYmdP
         nSzs6UIZfL4vh9JV3DR6M6d3DCUI9rsXK9bYgW8Fd9pCUL+NSkUIoT8lQckpgqYtFfq1
         gHlLtEZxVdxRERDLDGq1lf4ZjVe5NR1TKcP6J9eN2Aw/DePbsxrbbUxFvdJNE0nb1L7s
         PaKzl/3uxt2WUFde4YFtHJHBs58vboGP/5mIPUGZXzNGOxAUIYCl7jDrSG86mVXm/WmD
         pVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jo0KGiOqZWbyCmUkMPNRmBmFE7abFdGaEV66vf3nIzs=;
        fh=4Gaa5At8jKo0rwKgGOyt3yDzBN1SfkRRPuHhhSKJarI=;
        b=D1suCUe8OsMrPQIP+WeVtCOklo+9HcnRaypOuuCLtifkeNIiVAsvp86ZkS03QMIgFE
         c+Z30kdqLmdUNHx/PkvVTFBGyZewfrj7vjmmYEz+OKTAvawQ6uvMR2z7GhJG9yMK0GSW
         c090KKuzwN/agJKEv7AAG8kkI4DeeOItFMjXbse9BxbdhryhfPAkbgUFekdQ41wSfkeH
         vKdh13juQ5FJ/WL4MCkGNrsCnhRGck0VBOabBs8lHVjG6IvixojM0Ipes+0qmGab7zpZ
         SdUgeRMYDWIBkqgWJX8kzqmSCItsi+/Zlx+W6mf0vPgTykUVf7ly96sOMi1Wz0tmQteV
         bAog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cFmjVCC4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4945255598esi117321041cf.241.2025.05.13.10.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:52:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cFmjVCC4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtnQ-0008M0-Gi; Tue, 13 May 2025 13:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtc2-0000He-Iz
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:24 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtc0-0003NV-J5
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so13870825e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158015; x=1747762815; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jo0KGiOqZWbyCmUkMPNRmBmFE7abFdGaEV66vf3nIzs=;
 b=cFmjVCC4ELJGlMwpsAXnXphjBVydSZ931nkScWgJXs98svOggg9pAJISH/7RYRvwYr
 8aBN+13f9oUM12sNd4CEQdJjUEaOCUrhxpAee9PYROhjgmxa8QqnAGKOMqKo4bQAQCXa
 4nWr/wC/3brKZ9a022oDff3om+C2oIM/424oK8n1do2uZ4bIIgHfXRB4TjBZ+emcJrB+
 xjXMDwsen4m5pkSifRJLxQIg2etJo7L5Gcr7p64RBdCS+5NqWZAXQdeVoS1rp4jhFRBF
 pXeBkcu430DaRvgJt30gqSvN+ZXvFcjvrAlYWN9mxKmhENWr2q2Qz9hzH16fKqs7qp1W
 2G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158015; x=1747762815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jo0KGiOqZWbyCmUkMPNRmBmFE7abFdGaEV66vf3nIzs=;
 b=nssM+dJm/NAEm+rbz7u2S3Old95dunzjzKt9KhI5PDzfyysQR+QP8Z+XEe/2j1RNdE
 hn09tQ+cHGOW+eWJSAM2kBeiijQ5URT47k/Nb2d/TusewISG67gXiOe/+DAEJfIb693u
 HFn77h8gcUStDf3mdRb9D5+sJCNRoqG3d5nDfWWDi1HBynhiJfhVFyBCqbBMsQ2xsxBP
 ZWJAwZcOew45EFqiKEyc/ZAhkgOTQDVWK5Gfcqz/v3oCngyx6+/VcQNr5yBV+e4BVLXM
 JVqETHI5PQd3OJD4m9SZCZ3Tu4ekGCoyjL8A4JlnbplObwSlpBF+NKRkwc08+WgMdqmM
 iFtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPqazhhAVHRcGETDSSRvTZ+8sc0Xt2AcdwMsLQRtzzHP0vvtrdpAqwEhU7b56eqdiqBmHfdo+Vkw==@nongnu.org
X-Gm-Message-State: AOJu0YxG91zcxf6EWx3zDcSmmJBxQhngpPdVDDDgrFMB+xT8ehEIldvP
 o/Hm7o1KqjzBrlo2ufTAQXX60cglsVHMD9tsac2tg/rlmmnOnx7Gd4S2IbIwcqU=
X-Gm-Gg: ASbGncvvTEi1iiTusk4PoYpBVC3C5Z9c6RNiGQZvNVedJM4TWzurYbQjrRi/VX8urLF
 beDcO8+DwRW+ypZ4ARmp0DGtc0mbN66+ERK55SYnMbnRmom2TtqdPV59L6+ffuPrPh8AiHeS0it
 xWN1BUwyA4J423G3WGEqWrYZWv4j3ukspL8gh2ESKovPlT2IaXj2893xZEESfDOdc0xP91NpCb3
 Xsm2Mc1vkEsSF8NofDVo+G4UqVZY7kXx+kq9Vv3j7P5WHJl0yf/imidp+0Osdwb+FU96Rbt0zEB
 UzyVuhVEvDhJ+pXmSK5xQ0Pi2xITunBJOb3DE440JTsvGXPTwN7ThodTfOqn7G6s3SpqyPp90Ku
 ZUN0udjteOhwAlKoxSjEDh9s9JKNH
X-Received: by 2002:a05:600c:1395:b0:43d:fa5d:9314 with SMTP id
 5b1f17b1804b1-442f216d802mr1693035e9.32.1747158014993; 
 Tue, 13 May 2025 10:40:14 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3285c7sm219433565e9.3.2025.05.13.10.40.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/19] target/arm/hvf: Include missing 'cpu-qom.h' header
Date: Tue, 13 May 2025 18:39:18 +0100
Message-ID: <20250513173928.77376-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: eto51uaqz211

ARMCPU typedef is declared in "cpu-qom.h". Include it in
order to avoid when refactoring unrelated headers:

  target/arm/hvf_arm.h:23:41: error: unknown type name 'ARMCPU'
     23 | void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
        |                                         ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/hvf_arm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index 7a44e092620..ea82f2691df 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -11,7 +11,7 @@
 #ifndef QEMU_HVF_ARM_H
 #define QEMU_HVF_ARM_H
 
-#include "cpu.h"
+#include "target/arm/cpu-qom.h"
 
 /**
  * hvf_arm_init_debug() - initialize guest debug capabilities
-- 
2.47.1

