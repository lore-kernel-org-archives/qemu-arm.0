Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp711605lfc;
        Fri, 23 Jul 2021 09:23:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEYA8MLl6EBWhb/TSUbMYerLwh7k5cXH1XZthMV78tMbN0lHr22745MrNGEU8npknUbGtk
X-Received: by 2002:a25:dc8c:: with SMTP id y134mr7731150ybe.301.1627057389586;
        Fri, 23 Jul 2021 09:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627057389; cv=none;
        d=google.com; s=arc-20160816;
        b=xp30L0WwNXuO2Oas7wKx0x4EanrS2ckqZQsPnV1uxF/X3h6ugLgSsDqBcPIK3SmoZe
         d7DwUDwp1yXwjf9Sa4Ey5XoJDeDxHT4UigjuW+1Pxjdo46evh5mmxm9/1qBRm8AoWTrG
         lVQoFqTyJ/zzXDY6XO9q0OYS2Wdm/+Scn5I3FozMKAcjUr0f5SZxyQdygYq9d8wAYCQa
         xMqe4keklAq7x/Qa1GMnM7KICkbqdGrMFfRUf9voxNmLOxcj1/ftZ2+pVfWm+N8XlXrv
         IH/nyivF8QIc27Q8DT4KUXzihuUanEsuDalSkNxwRNypPKmPSFhketA6FtTi5JtnGLsL
         nA4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ACI532LNdXUXkP6ZLogSGJNZsbzdsfTkMdhJh+PsYgE=;
        b=ELRcjO9aW52Sa2jQLtq00fOVIfwjDWmGx30px2z5IWDwtPJL0YLfgMEsNjLCCuF+k+
         bolPJjMZLJvXX6unnPxAJAL8ojUuo4syA46kznLzMYiY7zoacQr17BCB1XJmoBxHVxW2
         psxCp3wtyF4aMZDkHm/vl2Fq+HefL0LiQsPRmXNDF8KTo0pW5O1FlslRoXvY7W6US7cH
         rokXlp1ohoYqhKnXwO1UJf/hpIHwyKw9doHF1krPWVcS4oP8JFSYHkHz5niVi3+xQHJV
         aclL2Gr2fOrZ/g3hM0ccb+WHB5JLvHOwztPyM6Am8QXx3kKuC9j1IvOHyaMUWmItqYhG
         2OGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R/0Fftc4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si6911783ybl.89.2021.07.23.09.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jul 2021 09:23:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R/0Fftc4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6xx6-0001li-V8
	for alex.bennee@linaro.org; Fri, 23 Jul 2021 12:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvv-00005R-7l
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:55 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0000mT-EY
 for qemu-arm@nongnu.org; Fri, 23 Jul 2021 12:21:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id w12so2896172wro.13
 for <qemu-arm@nongnu.org>; Fri, 23 Jul 2021 09:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ACI532LNdXUXkP6ZLogSGJNZsbzdsfTkMdhJh+PsYgE=;
 b=R/0Fftc4OuG+6LGRRv1QsPli84hUDQxMqxbibcURt/PPTyiojlJe8/n4LJe2tMtXde
 2zkhE5azVv2EudV1syzBz5n4D6yQrghixe63AibGYDTDohKpcHzR24yzSzmEXmEKErt6
 NdiNDNJhGzEBCbRZ5TcCzqdd9amLnHm3dEGKVxjn4aEH34gEtNED0cu6VNTsj7hUh+7c
 kLoNqTH/Z0p1yYKM2jl/1+rCUEmv7LYyLRRJNRFexKsyxq4xS0X8wp4HP7O/9hecCubU
 khrY510pN9rLdr0jUwEvG5ZpdlDtNRZOHbv+MbeugYMzn2lu19rX4jZMmnyjM5bDf8/L
 ywYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACI532LNdXUXkP6ZLogSGJNZsbzdsfTkMdhJh+PsYgE=;
 b=QT4JKgqpg6Si/Hdutq+nBeZmx2JRBo39L0g3X07j+JWjqRSJjYLwVlA6G09du6e0TJ
 DBMUyPDezTDGtKaWj0SsrrwZdiG1x5zOEvmInnRcdjIioDa1Zt0FNRFhr89VxMOpnZbb
 SzXNGWb6A9DbJY6l8Q/hYP9T89z8c3IHd031zSDxaJB6pSpnaex6b1qrfvRBWnSgNwSC
 1PnHBVF/eoPpDqiXP1dePQh6x95dsoLIsaB34BxIHuMxjM4OIqsxSZfHM+ZLqpck5LEO
 HXgPStu70HoT9128VAQXEUbSSqVFs0jTYFDdXWJL1g+3l44TSwpq9SzuIoaZPKISPbxK
 lIAQ==
X-Gm-Message-State: AOAM5333dl05iIfpy/kZxRsPWY5kxMENVc5hVEXDXxxV5JrMVbBUbikD
 3s3mFsUWhX+KRw+akmUMjHulPIMXpZ1ElQ==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr6048912wrs.323.1627057310098; 
 Fri, 23 Jul 2021 09:21:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 2/6] target/arm: Add missing 'return's after calling
 v7m_exception_taken()
Date: Fri, 23 Jul 2021 17:21:42 +0100
Message-Id: <20210723162146.5167-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RJLqahf5N7sX

In do_v7m_exception_exit(), we perform various checks as part of
performing the exception return.  If one of these checks fails, the
architecture requires that we take an appropriate exception on the
existing stackframe.  We implement this by calling
v7m_exception_taken() to set up to take the new exception, and then
immediately returning from do_v7m_exception_exit() without proceeding
any further with the unstack-and-exception-return process.

In a couple of checks that are new in v8.1M, we forgot the "return"
statement, with the effect that if bad code in the guest tripped over
these checks we would set up to take a UsageFault exception but then
blunder on trying to also unstack and return from the original
exception, with the probable result that the guest would crash.

Add the missing return statements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index f9a9cb466c9..f352346a964 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1554,6 +1554,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                     qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                         "stackframe: NSACR prevents clearing FPU registers\n");
                     v7m_exception_taken(cpu, excret, true, false);
+                    return;
                 } else if (!cpacr_pass) {
                     armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
                                             exc_secure);
@@ -1561,6 +1562,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                     qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                         "stackframe: CPACR prevents clearing FPU registers\n");
                     v7m_exception_taken(cpu, excret, true, false);
+                    return;
                 }
             }
             /* Clear s0..s15, FPSCR and VPR */
-- 
2.20.1

