Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2205350lfp;
        Fri, 14 Feb 2020 09:59:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxGNR4F2t1Kp8iPVV13pNtnw1GQ09EZdOlpVltk4vKmyr+4ahugztJnvThwpJctXPxEiter
X-Received: by 2002:a37:6285:: with SMTP id w127mr3844763qkb.42.1581703141738;
        Fri, 14 Feb 2020 09:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581703141; cv=none;
        d=google.com; s=arc-20160816;
        b=CXfFPkqzvCrKAjtfS93zKAeLnIlgmGbLIM9RqmZsbSHYCOzr2Oj/jLDxkmJEzxYtep
         NaRJf7mkNicxkRP5Xk2jYgLpLs5u3W0DpTih3Drk8nVeCcnGXf4tQJ4YOh/ttODb3nNK
         U1C1DgOZVY9P+srQ7uQR1soBEmVVRsCaznI/fgVHix8yjHNrB7C2dwxIJ7ttrUhSNzzJ
         jpzz45ilIcGxE07I/BNCD+/Ab/HvV9Q1pvZe5PH2/wPCjQlo4RoJM6Bg1FVk84nWQid7
         hxCGyW/D1RKshOBPDeQKl+4KEtLj8UbsnB0pBo/0PisPd0Rt50RLtQfKt0v6Pju8rFSH
         JnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yBlr7RLXuaOwUWrVlg7CP/NZ0IeFAHTSIicsUai9nWU=;
        b=L7gj0X7ycv5CITmrAKn5WNWNkHVo0XuxPiWRb0ibYcZp2AniwH6jYrsOArjtvgszxh
         4iDT9ljD4cGF4JkfywpyRMQrqXYX0cPQ9sZ91dzb2QvPZ7b++GHxK4DItDnkrxwxxxl8
         DG1ik5429ZjMJP5QPmufrXGn2SUIP9BtaO8JI3lEXuOg+LHhZ6tsDACdRsmH7YDcp5R1
         ycINlzZyU4mzRoCmn8yRDbRDqemoOm5jk5+27o0OaYwH/GrrOQGKlln5Vi6gs+b+Nsvp
         q4ObzUaam/R6vMB9KM+Ohn6kwkxb42DzehG+IarKoDlbdUMVBN604BJbi/4yAgfWYg2G
         XKjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vBTlvwDK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p62si3122808qkc.295.2020.02.14.09.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vBTlvwDK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43015 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fEz-0003YF-3q
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7k-0005tL-EL
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7j-0000kg-80
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:32 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36992)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7i-0000in-88
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:30 -0500
Received: by mail-wm1-x343.google.com with SMTP id a6so11578530wme.2
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 09:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yBlr7RLXuaOwUWrVlg7CP/NZ0IeFAHTSIicsUai9nWU=;
 b=vBTlvwDKVpQvyC7BucuDnioGcfHw14OZ9eA4e9wpJLxYzEipRb797BLf2u0SAvDD4j
 qq7NoFoLmDle6555RyrKXltrifq8PWhuTWo3ZLQd4zOErUMeiRPmyzrbPdL0RgjiXjNu
 /pNfo3T+XmNto+C62pWNDcmLWeii6wVPBneaf2vgVvVqpUzK7OvxDaywLiALXHDLpzeQ
 aF/pBaD3R0aggy/E1CvT+iMkQk4vkFWk4Fks41i0MPMns8ZDHX32kV8qzwCkdV+B7HFl
 VgbITgJYY3lDbdeI5QicO+Q63WQSatDm27IHDdUanQqaVXVOny4N4pa986BxZYKxKcSl
 /RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yBlr7RLXuaOwUWrVlg7CP/NZ0IeFAHTSIicsUai9nWU=;
 b=qwiLlA4J1sFgvYareuAf1ZVncR4T6fkUs122Z3BjfmXBaodD9vuVnp6EJ5y7QQiGOJ
 R7uxwt4O3Ari+7iZlMh4Wh0ewPWtJI5tBwh6trWYPJOD25jTctIQ8UrIdUmuAeVhv6b8
 VXYC65Bglf0zYWTxxMHHkxexXFXPIE3NQsi1EgKlYcIck6ZnB1ZIEWljwVQFc/Pv1Gbf
 Q5HiivxHN6D6q6l5p5mEhbg9ClTpFcshTA2c0N84svUzt4t4fmn32A+O0iDKv3IxJvgy
 GOzB6YdGlAbj9W72X8mHR9TLwe35bjXaCg7n1LqpNiAIsZWX5tjaN3Dj6yC+rZ2mDagF
 QBDQ==
X-Gm-Message-State: APjAAAUBtCRCaP/4oHvKN5jjMviG6CihV8o4pfpWOXEixiawsZBrru3E
 iOb+blcrRoQ3T+cIcLuAvDIX8zRkDmA=
X-Received: by 2002:a1c:bdc6:: with SMTP id n189mr6009881wmf.102.1581702688695; 
 Fri, 14 Feb 2020 09:51:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/21] target/arm: Add and use FIELD definitions for
 ID_AA64DFR0_EL1
Date: Fri, 14 Feb 2020 17:51:01 +0000
Message-Id: <20200214175116.9164-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SdK9ZOMPRS7b

Add FIELD() definitions for the ID_AA64DFR0_EL1 and use them
where we currently have hard-coded bit values.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use FIELD_EX64/FIELD_DP64 for 64-bit ID register
---
 target/arm/cpu.h    | 10 ++++++++++
 target/arm/cpu.c    |  2 +-
 target/arm/helper.c |  6 +++---
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ef0feb228ab..081955094dc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1821,6 +1821,16 @@ FIELD(ID_AA64MMFR2, BBM, 52, 4)
 FIELD(ID_AA64MMFR2, EVT, 56, 4)
 FIELD(ID_AA64MMFR2, E0PD, 60, 4)
 
+FIELD(ID_AA64DFR0, DEBUGVER, 0, 4)
+FIELD(ID_AA64DFR0, TRACEVER, 4, 4)
+FIELD(ID_AA64DFR0, PMUVER, 8, 4)
+FIELD(ID_AA64DFR0, BRPS, 12, 4)
+FIELD(ID_AA64DFR0, WRPS, 20, 4)
+FIELD(ID_AA64DFR0, CTX_CMPS, 28, 4)
+FIELD(ID_AA64DFR0, PMSVER, 32, 4)
+FIELD(ID_AA64DFR0, DOUBLELOCK, 36, 4)
+FIELD(ID_AA64DFR0, TRACEFILT, 40, 4)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 56f2ab865da..12bf9688007 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1718,7 +1718,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                 cpu);
 #endif
     } else {
-        cpu->id_aa64dfr0 &= ~0xf00;
+        cpu->id_aa64dfr0 = FIELD_DP64(cpu->id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
         cpu->id_dfr0 &= ~(0xf << 24);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c53d6406474..376c6412f91 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6266,9 +6266,9 @@ static void define_debug_regs(ARMCPU *cpu)
      * check that if they both exist then they agree.
      */
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        assert(extract32(cpu->id_aa64dfr0, 12, 4) == brps);
-        assert(extract32(cpu->id_aa64dfr0, 20, 4) == wrps);
-        assert(extract32(cpu->id_aa64dfr0, 28, 4) == ctx_cmps);
+        assert(FIELD_EX64(cpu->id_aa64dfr0, ID_AA64DFR0, BRPS) == brps);
+        assert(FIELD_EX64(cpu->id_aa64dfr0, ID_AA64DFR0, WRPS) == wrps);
+        assert(FIELD_EX64(cpu->id_aa64dfr0, ID_AA64DFR0, CTX_CMPS) == ctx_cmps);
     }
 
     define_one_arm_cp_reg(cpu, &dbgdidr);
-- 
2.20.1

