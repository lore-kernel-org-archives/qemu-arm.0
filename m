Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2920991lfq;
        Mon, 11 Jan 2021 11:06:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4m+PbNQRfYPw+eCGnkz/WWpkmKHTKyMdkPXH/Ju8gT4ogeuUYSACXAC7qxxIGGnGivb65
X-Received: by 2002:a25:5c1:: with SMTP id 184mr1721482ybf.173.1610391999497;
        Mon, 11 Jan 2021 11:06:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610391999; cv=none;
        d=google.com; s=arc-20160816;
        b=j1gY/8X+L7LHgI0pTEi4J92tntN2+fIDMaAj6F/OuxH1q28HcIOgVo2RLH9Yrq3GMO
         JkoZi/7sHCM4DoNCoUz3dFpt2q/mqnukvixtQvcoc34jP4RGanupJJs/TdBlnYbYHBtc
         fsCQKJVbtJPo8CcdAlpaFsKXSezlvTyDgVvMG23hyOrmKcUGtE94tvm4bz4zggVC/SZO
         Cei5R0APuIvbACfMzzKQF6FtHu8jGQB+9rIsK/KscFix3TPyWw9RK1huTdU6kW24ExuK
         kHSiJhuvEv9zYnzCn8NDeTvFirdE8Q1idGAvHo/Dv8CUFK0dcRov7tLxCYkOJr8iuuDu
         JxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=t7cb1wo+zig4w5wRyfLayVY9BN4eEXg6/tPvYTE+r/M=;
        b=hZy6fSq76PpdrsolnwmGZNvpFYt6Gt3hdgGnI2f2mRuSW66CY7Fo5/NySEnsBOkuk6
         4NzDKC5UdC52SFLC4ygu+aPWcX79ZOCSOc7bQhwmEHCcu6tkENLzFSJ+U4oXLI/vI9Hr
         gPmcQ17UrDR5jHwyVyYwGB5OK3m8+OgzZILsTS08swqcTsnKZaFL5ZGpiSpG1wvAoT3g
         eN1ecHK1xSrK7bndS8kEaPDnMp3wIyBMHVdtqpObRGmI7XrE2CsD72Y+l0P8EXKFrfTE
         UNJz9erbkG31AhIN93OWDFRq0JWFRP0N9aMblykM2AIxtwgWkgFLUCdzZkzFnKDHGuCv
         bZHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nXwMW4Q9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x205si583210ybx.442.2021.01.11.11.06.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:06:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nXwMW4Q9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2WU-0002On-Q4
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RZ-0005yI-Gg
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:33 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RX-0006QN-M0
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:33 -0500
Received: by mail-pg1-x532.google.com with SMTP id i5so283012pgo.1
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t7cb1wo+zig4w5wRyfLayVY9BN4eEXg6/tPvYTE+r/M=;
 b=nXwMW4Q9gwcedvGzBG/JeCMSXLQGMumCuHav6OoSOTfElFgD6ewT5f1YHRN25Fp06M
 PgwurTbe7eQ/8aTCQxmu8IEB0poaF1rC4fULY4Ye3CYufZBTmOQHe0LkEnAx7CAeVmUh
 6UkzPMFZGGq2USV74v77Pe7idqzBCWiuFbohsZELfWq2AFXkJYWZpW551UT6JyYY/+mw
 CdqAB6KbFt1wPNrmOYpDBiCHfTrzJoBSsBai6jmFYbX7QoNiuobgje+3dJEZola7Lu1g
 KlnEf4mYr6YbIHAxWzzzLASDrhSQVIICAykV3UeDEubkMnx6xNwdh6KQMonHI8qevHW5
 kZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t7cb1wo+zig4w5wRyfLayVY9BN4eEXg6/tPvYTE+r/M=;
 b=tiJff+FXm3r8DYbM+dB1ivAUmWO9h0u0JIJxqZU+RzjzWh8GB2zJXitBiXkjwkyfIK
 ecRxfi+o/E3FOGWhbmj5BO8k31/cHz9LJO9Nn/br4+rzgp8hyFbpmRuukHuZcz3yIzjf
 YeTCcPloc5OzrOvx1d/2tRlhEVSSpRIhayhCp+dJnYUxkoHBZk0BY37yPMH8UJWwtHVu
 QCbdm2fYw3p/4PFir9Ug9JbOrnYa72MsejduYW69mXFcdFXor8IEuOa/dtpvLAbQt6DX
 p5b2dFKy47qW1H7dezYzF67DjEPX/tFUBYRLEZAshkNnPgOgcku3rQW8Wn+Dzo2OiTyU
 HKyQ==
X-Gm-Message-State: AOAM532rrTv9h92Uih4ywOv4UKWpPbkOgf3ZgiDmRBpDIK0IWudLh+Wh
 lGZD4cDBzrbVoCKtgKSa3huAv0YYBi2iyg==
X-Received: by 2002:aa7:8d12:0:b029:1ae:4344:3b4f with SMTP id
 j18-20020aa78d120000b02901ae43443b4fmr780455pfe.16.1610391690404; 
 Mon, 11 Jan 2021 11:01:30 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/30] target/arm: Move TBFLAG_ANY bits to the bottom
Date: Mon, 11 Jan 2021 09:00:51 -1000
Message-Id: <20210111190113.303726-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WFFQKNuuruPd

Now that other bits have been moved out of tb->flags,
there's no point in filling from the top.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 43bcd21959..aa2f2d3a04 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3275,15 +3275,15 @@ typedef ARMCPU ArchCPU;
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
-FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
-FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
-FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
-FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
+FIELD(TBFLAG_ANY, AARCH64_STATE, 0, 1)
+FIELD(TBFLAG_ANY, SS_ACTIVE, 1, 1)
+FIELD(TBFLAG_ANY, PSTATE__SS, 2, 1)      /* Not cached. */
+FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
+FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 /* Target EL if we take a floating-point-disabled exception */
-FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
+FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 /* For A-profile only, target EL for debug exceptions.  */
-FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
+FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
-- 
2.25.1

