Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp686561njb;
        Tue, 13 May 2025 10:44:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaJadPZc9Owv5E0hrY2iHQLnY5kHsfB5UyGlqEHRYM+qltbUexBaWD+i5kt+oipI7q1th8OCSYWE8mHw==@linaro.org
X-Google-Smtp-Source: AGHT+IEEm2GAk82GkNK58+WtkipIHuTE13sb7dI9u2ov2jFgbTxWUGT1ZcRpfASiQBiP/sI6SmSb
X-Received: by 2002:a05:620a:1916:b0:7ca:ea9a:828c with SMTP id af79cd13be357-7cd2888f2f5mr67614285a.48.1747158292905;
        Tue, 13 May 2025 10:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158292; cv=none;
        d=google.com; s=arc-20240605;
        b=cIgBfEtDkdhJllZJWDA/3gVH/wCeEcBUyTcTg/YwL9km+ego8tr9xdHST2azp4rBtp
         KizjHnQBeGQKo9VQ+VHV0AQlac2OXmEl9yT9azAHMTvpnFGv9YpLZkoNU1U1trrtSN3o
         MTLRVJoxgzkJjCizUqoEV/uDeZoT+ARlZj6dd/oFlisOD6+Q/0oTxSd9UTiumZKE2FEY
         ZTUdpxCm5yiUaQ9y95MAVgNn1wG+8Scc+97v/9w+hG2AyV5R734Q6Y5MohwNwNjAQBuX
         ELZvDc8jMcOE3XYsToWcJ2IE5vCnNU2bq79g0EqVJwm0XuypJIhCOB5aPQKM+KHqG2Nf
         SEuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=92ChZ6jllY23UsU7xWSaP8Ezg849uhqSbkL7GZUJKKA=;
        fh=oAG6HIcuSPumOYs2ef0NYEkSLIm7D6VhhjfDQzOYEY4=;
        b=kLFlzSBiTPrN/W1NfBkkcltsCEvsb4uw6JHc6pa3k1Va9LM4NWK3cUTSsK9mTtOmbD
         I/NiyjUZw1kjE4f/wqTnY5hB/XG1m0Ok30pYMwdgNSxLeLAP96D+imdsapX1Bn3Xp7n3
         UvRlXCgszsc8XVmVb9Iy8tDgYN14vxO+KTN5Wl8Cf7/W4d0Lg649WhlPSUrKoFnsrg+e
         GLuMoefh5kifxdVAOf8Dc9t9FxhTrMbs80eNuEg7q9vDR80KNhg7UUa8KInxHpZ+1XAb
         ND+tfLk74UIjR/m7ejnhO0om7dJDI0ZA4CArBdaF4vhbVZky7wXG77HddY5clj6qOJQ8
         Pdzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5qP7nqS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f52020si1231397085a.40.2025.05.13.10.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K5qP7nqS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEtfw-0003Zs-9A; Tue, 13 May 2025 13:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcC-0000Mi-U4
 for qemu-devel@nongnu.org; Tue, 13 May 2025 13:40:33 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtcB-0003Ot-9T
 for qemu-devel@nongnu.org; Tue, 13 May 2025 13:40:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a0b308856fso4358695f8f.2
 for <qemu-devel@nongnu.org>; Tue, 13 May 2025 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747158025; x=1747762825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92ChZ6jllY23UsU7xWSaP8Ezg849uhqSbkL7GZUJKKA=;
 b=K5qP7nqSsfpimFKRLUffM1g3YV1TFnyjuoQVwqaTdGPeFCbGBY3BI5mpepY6ole922
 54gGNUEmpm5N6yQnwUAxK5Q+zT9G+cFjYfR3r07nLNK3ZMCZ0UQ3f4/g1qZb1LwhDhvM
 UYqI4Y3SG7wZCUbkwgGA1TDK6PIUYue0qhQQoK6H2HMbXlMZhq7x20MH9uzmz9/SGxPn
 siXSYtHHd7BlyQvNavV5Z9DQj9tKjCBQDxBKWJlL2d/ggjmhIF8KXPsUcmMtZI5JNz/f
 omZbnKzAdhJg+rlGzDldP089qXXOCq1Nz3VETalsPJOYJMJ56yCCIOJHSHy6dU2KUNOP
 GReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747158025; x=1747762825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92ChZ6jllY23UsU7xWSaP8Ezg849uhqSbkL7GZUJKKA=;
 b=PE3oVndeEYlHjIxcZX43kGArH7iV2A0i/39aRqHM4nRrdz98h5lpMRCSrJJpO43DIj
 h1DzHCn12Z0igOfWZ99LvBHqpoRmw/K9/yu6ZvSOwpMMqQis/VTHonU1sav3GNpUD18+
 v15vQYfYR8ubQ2lhoiBHrOyeoNJbIT4UVIfSiDO8RWJz/AuAMbzx1Y20+LPNnkpsifok
 PQV4eZmfBSDYRWqqEb46kUFWRbIM3DAN8WVYl1HY6vTfJ1VroTEV4pCVSexPcPIxZC84
 FQglMTyehNmxFLjKmxvue7cEWV6fFQDumSei8Q4uggoW9TWTERdMiYAEyIfcWVU8bAva
 mZrg==
X-Gm-Message-State: AOJu0YyCXvGgUP2u/vI3QIxhWjVyibxcStD8RRP3EqYZXvbQBXrRPKVa
 VQGIBUsUPqT2pm4TxJgW5+4FB21VLVj+Rp4ymyaKB+AtU+5ICC0DWQjmRMaPCtGsxSaxmDTWu2Q
 d4+c=
X-Gm-Gg: ASbGnctrrHokzjgnbvmmPbGTxz+kOoRNs1elex4Q0KGTqgFNhOc5xJ6w/uRwTWnEo2L
 Ij/lNkqXwQp61jJEb6bdrhO1MK49Z4RVrbxC+bJtQIY11GvNrggOY6rPvvlk3hq7OIs6eBj4kO3
 M4FScTukQVwwQ+xHaXTc0oYQIQ8JB3MfmLv1hPu4eQilg+W2W0mAhMsnm2943TaCHKKwg2hB254
 P4kU3FPbAGm7DhE1SzDMGPdDzonz4jpHiMm23QGTJ3vhMh8nPvQAp86ChaA70tTWQNsl3vBf9TL
 6LuhcEmunQklKua44d8CKdxL2vRkS6o5DN1QegDPIc1Fsq1YPKmqUPB7v28Smotr9HdwByYA8SO
 sKFhJuWQI0cDMkk7dnjZJctEIYR43
X-Received: by 2002:a05:6000:22c2:b0:3a1:f561:6894 with SMTP id
 ffacd0b85a97d-3a34992266cmr132178f8f.44.1747158025410; 
 Tue, 13 May 2025 10:40:25 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7c89sm215849815e9.38.2025.05.13.10.40.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:40:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/19] target/arm: Restrict inclusion of 'multiprocessing.h'
Date: Tue, 13 May 2025 18:39:20 +0100
Message-ID: <20250513173928.77376-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: XLFsOR0wHEjZ

Only cpu.c requires "multiprocessing.h" definitions so far.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 1 -
 target/arm/cpu.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6ed6409cb7a..33ac0c9f818 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -30,7 +30,6 @@
 #include "exec/gdbstub.h"
 #include "exec/page-protection.h"
 #include "qapi/qapi-types-common.h"
-#include "target/arm/multiprocessing.h"
 #include "target/arm/gtimer.h"
 
 #define EXCP_UDEF            1   /* undefined instruction */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a604e4ccac8..8c9d161f2ef 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -52,6 +52,7 @@
 #include "cpregs.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
+#include "target/arm/multiprocessing.h"
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
-- 
2.47.1

