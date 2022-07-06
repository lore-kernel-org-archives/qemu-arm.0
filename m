Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4570891lft;
        Wed, 6 Jul 2022 02:32:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1udmBnF544j/6KlT+W/tWfM5C3Xf0pLvEhK3aDxjFUoVeLPinXv6q5b+WIWmp7sPelxQ1m7
X-Received: by 2002:a0c:eac3:0:b0:472:fccd:633f with SMTP id y3-20020a0ceac3000000b00472fccd633fmr9406076qvp.7.1657099956621;
        Wed, 06 Jul 2022 02:32:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657099956; cv=none;
        d=google.com; s=arc-20160816;
        b=s1P8yviYhK0mTxHGdr2xPD+vAuNhyjarHt7Ayvs8/YnxMqPSLo1Uk6Dc1SCVUuy1mQ
         sXP9DaB8unlV9C20tDien2Q8E+XbsKqYBAFVVF1Sqg/oQUVtxK94PGxZ9ZM7/FSSJID3
         aJCjaeLVyc9P0k4FAMAYlAsYsCQDSW+QgDd0wEduAnDTjzaFTQvkG+qqwsD6Xr2zuhE7
         cEnFS7C3AxVV8A0dmN5kyVYsQ9ddMaVi9AmKWb7oMXA7mYVzlgEt5DW7vhLFEHhXQblR
         ySlYIKDP1zFWnOtERT+s0U6ph+3XCfX5KI2cowLvB9gEYsp3KZhrXZ0g7ZA4E30NM1rB
         OT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
        b=uN+lYG1BLpc7roUeTW78H4k46+p50gSWhWMR2KPIlJh0erNYwgSpRge3lIYCl3cWXl
         ekESkVQ/0BvqLBpEn8d/q7mlmyPFK1nit1n+MBamCiZIKgnNt8kgItwY4y24Pyu4Q4wb
         IouVdTONMtpAoxDyIj6L8YPewMMEU6cSioceHaLpUNFw4JK8PdPXDI074pT/x+AX2zkz
         EuhwXGInJwyDcxOJV9gt3UPNZlWhwyxy0Ktwnix86U2R3w2UyI0uenackRE+HBanM8HD
         i4VBVdgbL1c7ruosaj4drPf7A4NRmtR+Frg3r3TDryD4j/U+r1q5ExRou7WUR2+ta6E9
         NCCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2hNMV3t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu14-20020ad45cce000000b004730a0db001si2275524qvb.203.2022.07.06.02.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 02:32:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n2hNMV3t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o91Oe-0004gX-2y
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 05:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M2-0006lB-Ux
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:51 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M1-0000mv-DC
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:25:50 -0400
Received: by mail-pf1-x433.google.com with SMTP id e16so962165pfm.11
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
 b=n2hNMV3ts2wFxtT24y+x4xXHsfW308Op6TfP7lT4JO/GiK5FErs+ji73c80l6fHUyv
 Mdk/U+oobIb3pIbkZvTb52ybSO7aWGaE3IWjkhCvxOxBfw55pzU+vOB8HuZivaeyM3TY
 kyczvzj1yDEn4q+NCaDqfPkkv5lvE4tj9cXP/IuLDA0Y80HEjjrgG0AXLAE3MUi2JMLt
 Vc+Sx/HjhBBH0SjHrPUdsV9Cu+laH1skrHGDO8/WEcDU1EaFkBGFJQ5emb5YD95XrTCJ
 9bHJXh+9pMVdaMmddDwFHdfw+PvkPEf0GJ3jVsjy4bKeqQr+xYkkNbZ+MRzWLrfdw8x5
 ptVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PME71S11cSPKZ4C3ISqAJ4KA5QkjnbMhk+jE1tP2f8=;
 b=MOucZjVjBjDQAgqlG2vQa25oZGyAtgV+GXfkdmkolPM2RRejqgM5pZyy0bIFIYPsJM
 QECWmySgXYN6TfjuwLg+BMt30uct30LFqMwWxt6en/5kEnrul1p21Fjyxrv8w6R5CMO4
 AR3mwhWPK3H3f5RkTJXT2BwkMapWn2ynbT4yfR6Jvr4pR/XaEMekuRxFMmnDIcvMiNNA
 EqHXbGy1gsmTJmv2f3n643FZXjYcc1GR5iK7hn3XiNybnVhQ8u8CNPafGBXKaLVj7cuS
 TSveEVKbKCFFz3sf7igIInc4hZEVEfFua6HT6kJscjf6Jj7lyFvO8rVJTpNYHYajU9iP
 bWbA==
X-Gm-Message-State: AJIora84X3DlXz2nQoeiBUkAPY6zpdfrbcIJ8PsgnwyEYPkRGdVbRVv/
 +BrJ+sAh2ZACy/RYCAma5l5FEJzi8XdcVTdC
X-Received: by 2002:a63:4b17:0:b0:412:83cf:ecaf with SMTP id
 y23-20020a634b17000000b0041283cfecafmr4827391pga.105.1657095947553; 
 Wed, 06 Jul 2022 01:25:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 33/45] linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
Date: Wed,  6 Jul 2022 13:53:59 +0530
Message-Id: <20220706082411.1664825-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FN4N2AzDdxjF

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_cpu.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
index 97a477bd3e..f90359faf2 100644
--- a/linux-user/aarch64/target_cpu.h
+++ b/linux-user/aarch64/target_cpu.h
@@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
 
 static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
 {
-    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
+    /*
+     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
      * different from AArch32 Linux, which uses TPIDRRO.
      */
     env->cp15.tpidr_el[0] = newtls;
+    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
+    env->cp15.tpidr2_el0 = 0;
 }
 
 static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
-- 
2.34.1

