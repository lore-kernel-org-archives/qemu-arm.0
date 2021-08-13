Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp136509lfk;
        Fri, 13 Aug 2021 06:22:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy17v0otsC9EMqm6F+VU3gLnQPWQ9rjYzZlALK+28510RzN1gWqRp4tgNrLEFyXiNZervU2
X-Received: by 2002:a17:906:138f:: with SMTP id f15mr2386001ejc.233.1628860921307;
        Fri, 13 Aug 2021 06:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628860921; cv=none;
        d=google.com; s=arc-20160816;
        b=QO5hToto8Jc/ayCV9oFQzUoTwEhmuCfqBqJssxFR2D4VX2GJCi6EJAPfQAoqPejtlT
         wGElBDx0K/24FNgexN7fcrUuta7h+j0iz9v50XXS2SIMqmdSLavHaZ6Hms9nFUmpfigP
         iaLpEfqndiCKzxnhmBtpYhRA86/zMUKyp4PR5k4ai+NeIsGcXpxxOUuKmrHKEBTOP3Ok
         An8NoP8g7knUHPiiJM9pjJbZAU9TytggKD/vVxybuAoRkDSUpBDpDMP2Vam43ANfaH5q
         oZ5lfDyI0TGHYyjRBfjTDUCqQKY8gc4IBCizAqqc3iA3A6f14ghvWgV4hyEiPT6SWw30
         v2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d3Hr9Wc4dvCtUGT2UQ15hAVNCLMUJmbjebAXeIh4mmY=;
        b=0K7veu3WgGwBs3nUJEqpJnTpHSRK/6qH6gIzgwqwroNXXWdSED3xRpyuudjQ6nD63R
         lWRyn3DFksBj9m3CqpImsWsp8NfJY6NaaUWr+0SVnbHm3IVtNBSuWx1QMOjN/H73NBY+
         evWrCENKduRKv658E62c2sxmx/4WvlZKTMx3uA4Z7K9DzCAQVsNFpT/khMmqaH9xefHz
         rMC7jbTi2ayUvegqGUe5h2goGasRt6mKjt/3VzZscATx0yzOEi0kuu6db9gDj9w3Zoaa
         k54WQHoy7lKPXQkll5dyWnNE3e/8ZsySKVqpxQolqs0kIrCW6xSw7avupYvttuk8fepo
         8u+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ClGrxmKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si1685251edr.501.2021.08.13.06.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 06:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ClGrxmKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEX8K-0004F4-Cq
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 09:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4k-0005zk-71
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 09:18:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4h-00019s-Uh
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 09:18:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o1-20020a05600c5101b02902e676fe1f04so7699467wms.1
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 06:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d3Hr9Wc4dvCtUGT2UQ15hAVNCLMUJmbjebAXeIh4mmY=;
 b=ClGrxmKMPx+hiwBVmMIfXS7TrxU2IMbo3zfqELLr2OTzFWBrFM1sV5mVlzW1nXLpKN
 1QOFdsyzqEEdSfUuelUFKzWInIgEkyKA9vHK9XnewPZ89yrOVftYZKoA17jecTbMCgrh
 7nH4hUo3J+y+teJTfiEC64AwKeUT/mGx7DMSDFhWCMsJYGGDbFIaSV4YGAwPmbW14Wns
 S+3DCvjHOlDQqjiATBI/OfHq1QXdT84F+Jwewzko1DeVWGrsFwXy3FjGrVu3t0+hDdJR
 Lwp0HVeV0aHix7WyKC2aaYg8tZ8Awx2n9+O1Gy+Lw4lYKTXLwoc0cBBPij2ptLUdQ12T
 J9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d3Hr9Wc4dvCtUGT2UQ15hAVNCLMUJmbjebAXeIh4mmY=;
 b=AgWpLPI/ErmD60PMBRzPflvkLleW8eljngaEBSQLZETwTptQ51rhZHlAmaFwfPXX4J
 iJ80VtpIgROOknj96CdUXUNQGcKFb3OzVQ1WGIn3WmaBOJ3AJvBrq2rBj1n/WBNoIqL6
 X3ZqOg5it7o09hn5AGBoRcL5GcaR5Rg9ZyisS3ieM9X9a/GO1XI2WIoqnk+d19ShZk3j
 mdSODJ1Bna1kwKgWsfk4x2ncim3sV7qaCeCu5wZyi9P/4fJQymmXRkIfL3fNy3kZ3uaE
 ZFpMPV9DyDy0jIl5o7IVBjK95yeSR1XPRIYhhEOce/CzupuqLVCQ4Y5fVcJzlcK3bCag
 +twg==
X-Gm-Message-State: AOAM5338xO/+xtbDHghOhOrBQ/JjSCd6k5SryQeOBb6YCxRMjGHqJOVg
 tilDhv2WrMbnB3HtbmNQU+T5qZNwnZUQZA==
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr2624732wml.158.1628860694702; 
 Fri, 13 Aug 2021 06:18:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 4/7] linux-user: Zero out target_siginfo_t in
 force_sig()
Date: Fri, 13 Aug 2021 14:18:06 +0100
Message-Id: <20210813131809.28655-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JuPwfBMvYSE/

The target_siginfo_t we populate in force_sig() will eventually
get copied onto the target's stack. Zero it out so that any extra
padding in the sifields union is consistently zero when the guest
sees it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index a8faea6f090..fd3c6a3e60d 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -636,7 +636,7 @@ void force_sig(int sig)
 {
     CPUState *cpu = thread_cpu;
     CPUArchState *env = cpu->env_ptr;
-    target_siginfo_t info;
+    target_siginfo_t info = {};
 
     info.si_signo = sig;
     info.si_errno = 0;
-- 
2.20.1

