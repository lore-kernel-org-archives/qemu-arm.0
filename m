Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3752719njd;
        Wed, 2 Apr 2025 15:26:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0oGKGWBDjkGRp9VhTms44oiFi7Nv6Hdq727YtpVt2U4mIa5h7eDcg1MCvUOUgdJAVM0MXgiqwQp07lQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG6z66Fvmpru1L2ZP4Mz2gbO0eeeHT3GTLJLJhDroC1UY2Eu1N34GsSJyMF87ybCyFlXXvQ
X-Received: by 2002:a05:600c:1d9f:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43eb5bfc8a6mr37432935e9.7.1743632798804;
        Wed, 02 Apr 2025 15:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632798; cv=none;
        d=google.com; s=arc-20240605;
        b=BrEt3lAG64vZ3fKxrAreEC/cSl4q3DrAZQQD42UoBCihEhFnbKawgjaNpf0rme2VhI
         4c8WMtJUMnuQQgbFDecY+Vr575xt32R91+fcmTGSWN03rFbW+hCYGSQOK9rlAWUTwQ8z
         Bsx1ppFjgFeDfO9tuPe8EPEdReQyrjw7cxw6xkvtol1Kh10Uf/q5wgSqBL2tiaLs3IQw
         /W1qk5lPX1azHrlgDp3WPML7vAQtWEIeelfGc/TAHznm0OShZYwzVF4q8judpf3P+e5r
         A4U/yv+6wWk3Ws32pBp7E99hpNNRLfMh3f95Khg7gv29Zfj3SuCk4taEPjXVKOzFptQJ
         PfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S80Ep4y75m4Bi1aemZem1kJn5yNrKjC8vfumsxl24F4=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=N7IHgbYLBeXT96ai6wb7erQvovyj2IOpma0Tf+vSDmbiya3r/tRlZW8dk66OFEtmPV
         o9zbqCvE5bturVIPasC+gM46sSddK1rg733pWWmB7Bs3sGvGoOxIR0+i8e50t0q6Xsuu
         SLIjIhTJftzgR6vRkyRk7HbagaNv0ZGnEv+fyDZ3rpzeLya8GB/53XX15D1vPEIXZaLG
         I5Gi2+NwqgnZ5hShdAg0suLX6ocMpCJhvordgpWvbnq0sZ/y0tchNkscRgiY9lKXXIda
         3VpFQUV/FeADegWThCMuTCtt+3F9g4aAWxHlAugu/oE62+iRqogyBywKrzVcT3JVL4bK
         EdrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHC+Y4ch;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43ec3490498si222005e9.44.2025.04.02.15.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jHC+Y4ch;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u06Vx-00057T-5f; Wed, 02 Apr 2025 18:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Vi-0004sU-Em
 for qemu-devel@nongnu.org; Wed, 02 Apr 2025 18:24:43 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Vc-0002XF-Bw
 for qemu-devel@nongnu.org; Wed, 02 Apr 2025 18:24:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so1209305e9.2
 for <qemu-devel@nongnu.org>; Wed, 02 Apr 2025 15:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632668; x=1744237468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S80Ep4y75m4Bi1aemZem1kJn5yNrKjC8vfumsxl24F4=;
 b=jHC+Y4chnTrGk6MX6PPrueiVtNSEjIfAdOTAkN8P/+7RTNz6rxjebztnJO8CtIzEaa
 RxHftd7rn/U6/cLIEZc0O5uO57ldS9k3aBN8VtHOW1a/yH6x1bWaYB0A+c0AJdhoro4e
 Vn0Z4lC0GYdeYZFQHrc6v4r3FQyoqrSu+skQjjcT0TA6gJCTTMPA97UPQsNtrikGgYWo
 03bP4sv3AsaBSl7wORu3/b01SOZjkXN/eeGoVTkKt7aXYVqIocwjGk6g2Yj/EQcASsAr
 QMt2yPjUiPkdN6zaM5VWO4Qjt2yAaGlUcB2/Q1qkr6mE3e/dtlkjB75EkWehJpICqV1K
 0KwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632668; x=1744237468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S80Ep4y75m4Bi1aemZem1kJn5yNrKjC8vfumsxl24F4=;
 b=bQoKUBXNZtNTU92vBfYEkjY4mfIhlmzjKOmuFgPeJouvPoeUYQEUm5dWGa/V1WTNdi
 0i0otvPNObI4QjFuseBZxG1APxSbiCJltpt//jFc40jja1wOMdLxN5OdHsOTy8+N9loD
 TICaQo2K9h4QtqfOOjQIfXBocgNntQaaOT9RRMnUT575CgFskt9AiB4ATTNEK+5JGdKV
 7QC1elIG7G0wq++RnXRtHWAXcS0KssuKuKPT3oXT/aoQ9+zizIG+O8B6RymfN2b+w8iv
 7+Q9ng0ToLB1ufbuJBSIX9KAnE7Hx3N0Iby1ZzApHZuC5yR4MMwA3VBKsioAd4kEZGdH
 BJDA==
X-Gm-Message-State: AOJu0YyhCE03x2pTOEfEIc+yZF6ovHMcBKeLEgEKGYVYqVCyp6OytVoP
 SRE1ryFVLk9Ih5epJgLvQn0Ad8BqxLQMfKUuTQyoNjYuvVEVJQUgKyrAsHkdlWIJ3Pb7fL5BgPT
 h
X-Gm-Gg: ASbGncslfwDloZ9q2kdQLvi+G9JTeYmPpC30ugFvfyvKQ1C5fW10/WoEtV/lR16vnhc
 kNgs5J8pbCoNxzIQKbZLdiNh2aYVdKx1ulkjXtQUJ9iFCNI+t/aPN52ajgbHBtAnCDX5PT0kPej
 Gif1sKCBgQRrMw4aP/JnzfQOhxAvIBosYH5nwFj8ukxpSi82e7qXh0bh2JZ1CgKgYAfpv7nlVTn
 EejlO/JKzvdTI77btkkMNcwIG/7WcpeXUK7SyBZHigNTuNAiFsZObexEdfc47ofGr/kHidQpUQW
 EXlmYmXYnbTdsxlLq/c5qOntB+1oFUkbkDkmSzyjKtPhCPoPFIHJ0vc+9TJVCyzpIrPzX/Imt/j
 j/WTldqoua3Huxvhxt48=
X-Received: by 2002:a05:600c:3c82:b0:43d:172:50b1 with SMTP id
 5b1f17b1804b1-43eb5c966ebmr37962075e9.29.1743632668270; 
 Wed, 02 Apr 2025 15:24:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec366aa29sm161795e9.39.2025.04.02.15.24.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:24:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 11/13] target/arm: Add arm_cpu_has_feature() helper
Date: Thu,  3 Apr 2025 00:23:31 +0200
Message-ID: <20250402222334.66511-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: kGLSU1TauuTI

arm_cpu_has_feature() is equivalent of arm_feature(), however
while the latter uses CPUARMState so is target-specific, the
former doesn't and can be called by target-agnostic code in hw/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu_has_feature.h | 2 ++
 target/arm/cpu.c             | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/target/arm/cpu_has_feature.h b/target/arm/cpu_has_feature.h
index 2adfccd9208..352f9d75bed 100644
--- a/target/arm/cpu_has_feature.h
+++ b/target/arm/cpu_has_feature.h
@@ -62,4 +62,6 @@ typedef enum arm_features {
     ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
 } ArmCpuFeature;
 
+bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature);
+
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6f62745d7f6..66a58916fcc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -55,6 +55,13 @@
 #include "target/arm/gtimer.h"
 #include "target/arm/multiprocessing.h"
 
+bool arm_cpu_has_feature(ARMCPU *cpu, ArmCpuFeature feature)
+{
+    CPUARMState *env = &cpu->env;
+
+    return arm_feature(env, feature);
+}
+
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.47.1

