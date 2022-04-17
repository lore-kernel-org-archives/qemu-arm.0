Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1284029lfk;
        Sun, 17 Apr 2022 11:42:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye8mhT+u5h1iNjlJcf2N/3NLlUtydRdubuaGWhnwrdNioGmhTgPYLFzfJ3Tz1j1DtX5/Fu
X-Received: by 2002:ac8:5855:0:b0:2eb:87af:ab50 with SMTP id h21-20020ac85855000000b002eb87afab50mr5134907qth.406.1650220978948;
        Sun, 17 Apr 2022 11:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650220978; cv=none;
        d=google.com; s=arc-20160816;
        b=qAcwntoMsQzr/ewHmqVYOUPtd4aHSUDGCO5702dPEjjcs9Vek5J6xYz8PLjR3zD1PO
         hfaHtkUHGw7cAvSB/Sj6d9I2cIio1jIUnUnCQmjaaMzoOXju+HWIPWu8ywdk8Ieth2G6
         KqPQb6MIP8vdKA1o+5iCZdHSZwKpLm1iTCLIAWFaNMv1eaaMeqbfEZ3mfCkV+grIn1Oo
         wu2LA7UT7VS0ghF2BSrJD7C0rnec9vEs9jhglfC4Yy/+003rXwOivMYU1vJFh9hnfZ1g
         H35y01doFpx43QKPesbgpHlR1Iy8EwVthIdXigJLqzMV5ForFsgytdjXTFJ+0xtthKxI
         Hmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Ra+HmlDmjq5MC1Bo0b0qUr7KsvywnTjoaMfVjleqeaE=;
        b=Vn4Cwy4u2jZEe242lB2XzPvwAH6OTCbwXb/LerWxB/eSeBknXlZSNJMd2kuRKSQBP9
         yMkxjvietvCH+8xfI86Y3LRn1bEJ1toGwRmQQvY49MioZKfA4gCskDIuPMh3ZTqJO3Sa
         yqrf+XXP0rlSYRnbPL0Fw8WUo6vJtHoZloHkGpv8kLoYkMXvUxxJBwOdJq13YghEaGeL
         O160N6WsuZFlAc1PMuZPXBCKCqlmIHMU4ArSUFQsDUD4MegdPtt39pNpdcvURmJuRHtg
         kaDocYJgrUizGccQlOES0olAcge6kAc/DSOcAELVlMUrhKNa3EryK2sogsTCLec9i4UR
         I8bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B5l28oZW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05620a430900b0067e4be239e8si2558788qko.557.2022.04.17.11.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:42:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B5l28oZW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9rO-0007uz-9u
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90Y-0004m5-BB
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90W-00046s-KT
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so736730pji.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ra+HmlDmjq5MC1Bo0b0qUr7KsvywnTjoaMfVjleqeaE=;
 b=B5l28oZWCEaPX16JktO6lmO5Gg+6b++FQW/pRoaRiT3pmR6WbHSzmdhBF+JcFoPxJr
 e4vHea6LIEz+69Sy3oc8QKdn9L7hHrFX1P/jCRd3TTgEw2bIlX1jpt0zifUSQFqFd19d
 bbmZMNxPF7ahYoS1D8Ddnlf/hTa9Rz6/og4nRprVGnr53qWweEymRp9CAb0ieU7oFwxh
 d5aYOR0j8IMm5OR+FOfWowNE52DlkiorhYmwq4RU1o9UxCl8PSERY+dPona7/mLPpFlY
 4xJgt/HjTLncszBMkEVBgS4BsR100Rmn6qOyRe7SE/jdQZs/bMzjG7veCpZcqFY8sSRG
 T38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ra+HmlDmjq5MC1Bo0b0qUr7KsvywnTjoaMfVjleqeaE=;
 b=gvN9y5M8B4ChxLS5KNS+mOGkdDNBJuFd6MELJL+xIyOyWny0YLYOmfH69ajslzl/DP
 WvijPzUW+hOpsJGhz6e8rGZHvGJCiJEO3N69Wwnbw3lFkvpuihxArBj4bj0f4zuI3prq
 MAImwFz+WLJg9bKThIgwDlrE3sADNheUAJMn5mO+6doIkKPxn5XKT+Is4F1zSReiGLSK
 067UdstJqac36fuKghdSIgGlPsWJzQYsJR9w1dXs8r/yZv2EBqC1vtUoQtZL86EL7N0T
 ddz6q6X+nAFNPaFquwL4oMAQ/YKWtg9Nz3BqrbI1N6sIiKSYK/e8HMdJ7cMPp50Fsgdc
 OP1Q==
X-Gm-Message-State: AOAM533qKR1oojcpuZWqhCyq8b6HzasNMy0UPFQvoZv6oseBf88WJJm9
 LhvbiMTkqZASNO0HeX6/y2LN3nR27ZAcRw==
X-Received: by 2002:a17:90b:390d:b0:1d2:7a7d:170e with SMTP id
 ob13-20020a17090b390d00b001d27a7d170emr5351329pjb.230.1650217699222; 
 Sun, 17 Apr 2022 10:48:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 57/60] target/arm: Enable FEAT_CSV3 for -cpu max
Date: Sun, 17 Apr 2022 10:44:23 -0700
Message-Id: <20220417174426.711829-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9zmOETGpw5TZ

This extension concerns cache speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index aebe3be1ba..f75f0fc110 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -15,6 +15,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
+- FEAT_CSV3 (Cache speculation variant 3)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6ccbcb857d..6139f51267 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -749,6 +749,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV3, 1);      /* FEAT_CSV3 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 762b961707..ea4eccddc3 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -74,6 +74,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
-- 
2.25.1

