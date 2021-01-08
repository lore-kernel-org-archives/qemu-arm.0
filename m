Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp737728lfq;
        Fri, 8 Jan 2021 10:54:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHoUpcL1/KOdfHVUHKWi2+0MIlUO7yaNSLh7FtQxvyxlcC40GVH3pr3a2T1Oqz0qZLlt/b
X-Received: by 2002:a25:40d:: with SMTP id 13mr7994266ybe.422.1610132051186;
        Fri, 08 Jan 2021 10:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610132051; cv=none;
        d=google.com; s=arc-20160816;
        b=MitkNngeJUGgCqOfasSFezAUxoPWvM8lajiWGLy/0iHy7wyxbPPP67rlYFxD7zcVyl
         1926rSp+p/yw9TjYo4LfblkI0qRUf6gCqu7liAQAnFAFRM3XQvg6P0mR9NNtlsObUt0o
         329BNp3v2sxL9FMofI80m0CzHBMLswy4jc8r3KT0ag5VB2/aQHAdiSy2YkQYEloXTBvb
         IxxP+HucUOYugLwhjKd3e/Abd1piZGC1yhn/Sd7jjhLbmY90uspma2UTLnUkAzjTJAZx
         wCrEEHYKgFcLStFWRgLEI0sXKDSM86zhE0uB8VpG/0i2bTnc7N40qC1/xtod3MN37SuI
         ATiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2hPNMUgLjGsZrofLM5ryEx3n5GB4TeZrlJdrp1nvvfk=;
        b=YedAedpGumIoq1LVEnlSgHisTDnyqvlIQKZr31eVAsqr9rOSTW7PvBWm17MS7lOQGm
         b5U+zQFW656U3xJuUFzM6XnYRdQlruIUtq4n8BY9LtR1YafrFzdUKgYzHqW6M9YarCiv
         nnD8qXbjEfL5Z8QTNyR08H+4fHYjjyd+isrJ2l5tMbXGkjJCedJElxIvTdYW6+5oaYgC
         CuL2F9ApFBt9RhpuCX5SncEzhIr88vmwrEYMI8SOgl4bfI6FaDCrjRaXnaFiEilkZgzk
         RRVq2k+Ffg0tGqNPDwQcBmygNSIxedhKD+HPq9tRIXr+Mnj3mXEW28k+bQS/+LPnxUcf
         HTjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=refXlTez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si8247832ybs.37.2021.01.08.10.54.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jan 2021 10:54:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=refXlTez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxwtm-0005mq-HH
	for alex.bennee@linaro.org; Fri, 08 Jan 2021 13:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrh-00026Q-SN
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:01 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrf-0000tU-Nf
 for qemu-arm@nongnu.org; Fri, 08 Jan 2021 13:52:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id 91so9969657wrj.7
 for <qemu-arm@nongnu.org>; Fri, 08 Jan 2021 10:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2hPNMUgLjGsZrofLM5ryEx3n5GB4TeZrlJdrp1nvvfk=;
 b=refXlTezGFlTShhI14ujOQG2wRkydbRfMU1xpG2mLGK0IDxt30Iu6spwWEmDtqNBCN
 rlTnUriaKdxckSpcOTwMHRosc/gQ7cOVDPwZOZLLbPZ2wDqLPOGgbIuOn0GrerN7Ua+0
 TYYwV6UtJg+7yhTese+eP3oUc7UHkOlOSqs8UgiIjbwK58y0ao1t2DYak0wv9A3oiovg
 qEifirTyi9juzBwucnY5D5FVXAoYMProqX7vK0HQS52JqHX0x5Ul98cguXSQwhbhHZX0
 BnpfI+BB++rXsZM9HuO7gtLURS1Sc+vup2T5cZ9HONVMcZKAjsi43K+9xeaV5QlSg4iw
 uQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2hPNMUgLjGsZrofLM5ryEx3n5GB4TeZrlJdrp1nvvfk=;
 b=Egd083/midEMmI6wrR5K28NxZm0290OUYEa731jo+jSwkqZm85bn8A3xlsokZ/GaY+
 1nwMamPVWl/i0v9o6zCTT4x9r661A/l+Ph2xrVQbK8kiUIIkk+nAe8I+Gj2qjYEgHlia
 UUyRQeHygjmRjp+ZobrvBSuFWalQ8YBL7uw1lfgZQxkbVaxaWc4n9tJlE1rdkPi9mAOa
 zpafHWz/9/kFUg7A/q0kSH9pBg6qbDgpjIV3UCcy82z0G0936NQdZmqk0HMSX5fiArXb
 yy0rCxTdNt/DV9dutxdalsKqHbVBKDAWCLmPnCSh6d5Ke3CNb+AO1DKuJ416mC4yDuzf
 niLA==
X-Gm-Message-State: AOAM5333sPo3Kh2tvwuiSBfgB5zUzYawGNcnUI4bKFJ+eDf6CEwryLlw
 r9KZEZ3f7+ObYBi5WOk2uEfl/Q==
X-Received: by 2002:adf:b519:: with SMTP id a25mr4908777wrd.263.1610131918416; 
 Fri, 08 Jan 2021 10:51:58 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:58 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] target/arm: make ARMCPU.ctr 64-bit
Date: Fri,  8 Jan 2021 18:51:51 +0000
Message-Id: <20210108185154.8108-4-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2zKGSsB8i+6A

When FEAT_MTE is implemented, the AArch64 view of CTR_EL0 adds the
TminLine field in bits [37:32].
Extend the ctr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fadd1a47df..063228de2a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -931,7 +931,7 @@ struct ARMCPU {
     uint64_t midr;
     uint32_t revidr;
     uint32_t reset_fpsid;
-    uint32_t ctr;
+    uint64_t ctr;
     uint32_t reset_sctlr;
     uint64_t pmceid0;
     uint64_t pmceid1;
-- 
2.20.1

