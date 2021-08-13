Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp136095lfk;
        Fri, 13 Aug 2021 06:21:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwv7Yfwpz3B5oHTbcuy5tncJAJ/c0K3iHMv7QAZVNuTdj8UxmezbJXvUGACDvva2YlgCd/7
X-Received: by 2002:a17:906:b48:: with SMTP id v8mr2433591ejg.258.1628860898393;
        Fri, 13 Aug 2021 06:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628860898; cv=none;
        d=google.com; s=arc-20160816;
        b=pTVMmwTHQcjtmktLtGdw4QQBV+ge1q4DXnsNZdpi7OTGrVdmAQnJTZZnh2Fc8mi0RV
         23EWfLRE4I873nDdm26ZO/XsrqnPEKkD1NyS75+0V2psv8lrG+GoYmy76ZBFhrwf+Xzm
         mZq8WR2usfa1kObmynb9+bXwHPRKRw69O3VmebFskRi4cLa8GpnDv9pQZ9znmn2MzQcp
         rjfANRKkpOKDrONWRL0XJjrcDBXqPljvOw7ZuhcYpSFNXnigC9Fr4YFUYBxR5TKpM05Z
         e6Mf+2cI/YPMoQw9hnRb606tvLEfFO8FobAgyUW/mx5XsIqjmAXDoDKk71BMDolWtyq3
         bwEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5MB/CWOu8y75nxH9S62qSbJCleKrqKA9mDnlY1X/YB4=;
        b=vOV3HUm/knY4RMY+CncIaNzwpeCLZXThgUk7EeoLGjqhNFSZ1SxHZ0YNi3Ku9nfh11
         UeCsLYbolHQPcUv06JMGGWc2qcwX2S8JSPaSYSFwROlCpF8gmAJ2GmYs4N9tS0s9C9Bg
         9Wg42AhIEYE7mj5ilHJr7PAWNmIn0z3bziCwwa/OqZj7rpipWpZ+TWDQSk0uXSqgrD0y
         cwGpmkUIR1sIp9u29MUFHjxnK9JD1j+jPVXSQiHEahM1aUYFClRz3A0eyYhKF+mdlQa1
         a9gza2w2Bx96FzK1u+CGqZI0PtT2Pnqhdxm1EDvpGHNgvT+PDdp0xmnfznhB/jYppQyz
         vtcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BeCjYGp5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24si300634ejt.108.2021.08.13.06.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 06:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BeCjYGp5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEX7x-0003T3-Da
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 09:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4i-0005zH-Rf
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 09:18:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEX4g-000195-Ml
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 09:18:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id r7so13349499wrs.0
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 06:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5MB/CWOu8y75nxH9S62qSbJCleKrqKA9mDnlY1X/YB4=;
 b=BeCjYGp55J77YtWl7Rg09vx2yRialAJFAhHOk8THvE1l88imoYWfHWnDLqV3K5Dhom
 pyMZjh2rWtHuJlUw11+fGCztVWft2UQYph078V//bs5hQHy7CN4eI2C/Y5OduCSZwuwG
 LJ/SCf0Bp2EXKZO43gVS2leGQ6T0rFuebBfs75x0rk+Wvm72esTVRcfYo/ZKVX3Vqd97
 n7XfJqbgzt9E8zvO49jBDsh9qJvFt6UTnDZkSBHuv8lhhA0u+/MRCILHZqVRyo4urYLx
 jlxeFo4Hi/R4N5Lj2Cvi+DvtMdWb1YoDDkh9T3ZN4jYVqio6bAPMYwMUCU7EM5StjxGg
 o/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5MB/CWOu8y75nxH9S62qSbJCleKrqKA9mDnlY1X/YB4=;
 b=m2xkvsznWWjxdH4qM152vrvberCfGExskwWX7utqTc7Q02YHXCDnzauOSnaUO5CCv0
 8s5WC0wELSdWru0Xa4mzpaZQW71WTmKDX5u66GeeSdcHm3mWhzJA81xbxlvDqNSETm83
 qdx7nFcR71lHRn6z4Cti+On4IIZvF3A89ddfVbBdGdRrSNz12Z2otWQcgNtCtU8jcBNy
 wNFWF3TnJFDOii7zCRGFurQ1SfJJoHzJBErSZ8vhiSEWgSK0Lh7a6mVMkigNJOz0PLwn
 UEwfaXX7t3myOksCZkOG/g+sCmYA9s80YD9nIrFzE/VB9waJ45r5AGwzE9mrGclt1fkZ
 lLQw==
X-Gm-Message-State: AOAM5330TeTxBxEKqQmIKZ1huZTRCyLBZzS3QLQ2U3QV+SQHkXFHjnvi
 YBHIuyR3kUVlF/LKBhb8RQcK0YWeZrVgEQ==
X-Received: by 2002:a5d:574d:: with SMTP id q13mr3169796wrw.425.1628860692396; 
 Fri, 13 Aug 2021 06:18:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q75sm1585705wme.40.2021.08.13.06.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:18:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/7] linux-user/aarch64: Set siginfo_t addr field for
 SIGTRAP signals
Date: Fri, 13 Aug 2021 14:18:03 +0100
Message-Id: <20210813131809.28655-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813131809.28655-1-peter.maydell@linaro.org>
References: <20210813131809.28655-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ukpFqCBMKm18

When generating a TRAP_BRKPT SIGTRAP, set the siginfo_t addr field
to the PC where the breakpoint/singlestep trap occurred; this is
what the kernel does for this signal for this architecture.

Fixes: Coverity 1459154
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index ee72a1c20f0..5d8675944d9 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -148,6 +148,7 @@ void cpu_loop(CPUARMState *env)
             info.si_signo = TARGET_SIGTRAP;
             info.si_errno = 0;
             info.si_code = TARGET_TRAP_BRKPT;
+            info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_SEMIHOST:
-- 
2.20.1

