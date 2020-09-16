Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp20912lfq;
        Tue, 15 Sep 2020 17:46:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUZr8wwaTdU0n4NCzrfmpgMwtKBb+XfKNy/fYK3Z3IbO56A062zNaqjjo+fa5wgYXUWUzI
X-Received: by 2002:a25:380f:: with SMTP id f15mr784575yba.411.1600217217032;
        Tue, 15 Sep 2020 17:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600217217; cv=none;
        d=google.com; s=arc-20160816;
        b=TrBVJso0rzZu8VUnfsKhxy4Ope30sXIhIK2EbLAET3dzYHYvh7spNiv06WaUCpybu/
         EvjcqsmDqbNGdNqwg0oTFaVrS9w4ia6Y0dI0Xi4R6orWgu629M+o6ydtWvuwIHypgVdL
         XjgH8KBtlTkSV14oNdVO44YPzPSkmpZ8tUGLm9hgcC7yFIxIs+cSkbicgR/ipFvONFAq
         7A9ujyS+D5ZOaQaPq9/w4/CxntXDNbQQGa1CcYdx+A5LVIVqufc4JQg4U20AlSAV97Jx
         x9ezDxiL0g5/k7D8fzas6xXsKIdZ1X0qIzhrevQ70ina2mVxM7JmhRXhh6Lzf19/kOZ+
         RFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RffEK/rCiFhZmvHDae5MdJFHwlUbrlsn383XqLguch4=;
        b=qNmiJVsxh26uMBq6AisUSJ7gvjKvVb21+Nlx3/rSnme3z5wN6SbB4htwOKbv3ET4ui
         dTDdsgmbNP/V8evH7XkY/j0nOcTYxcyHtUTm1gzdk95FWgYt+B1cJQv9RTzUDJ1jHXun
         Rtp/IhcURGryFlth4ofG2G6b38uxvOtB+V5RZgUy7+fjFGDZBJsZoZCfhP2p5QjSsK8l
         34rJryZtt6r2tWOLFggK5rZ2QlBO23eITZAUjZFzhiG5XPhUB4bfTOhbVReOPTAwtEU2
         xpBrAZyNySzzrBbC2RK78lKlWcCCcRFK2B4v7jxwec+7FUEMi+779WuL3IvUoEx9zS+1
         e/ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h3gEi3/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si18265582ybc.228.2020.09.15.17.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 17:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h3gEi3/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kILb6-0006GD-8v
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 20:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kILaw-0006EV-Rc
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 20:46:46 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:40773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kILav-0001Vl-BI
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 20:46:46 -0400
Received: by mail-pj1-x1041.google.com with SMTP id gf14so637398pjb.5
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2020 17:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RffEK/rCiFhZmvHDae5MdJFHwlUbrlsn383XqLguch4=;
 b=h3gEi3/slhIcV2djfTfSFVwGQfUeVhbW29GKU+wNBAYZRYASifAYiwU2GhWCopKRrk
 L2cRJicJ2fWTVWiBNOcHYFAz4Qr/dcDtREvGcwoaxy8BN2MEl96W6+FOOlxL+etoCmmV
 vXOHiIIIkQGcTwAY7n/vW6A6O79WtP+H/k9ECczFOK86JyP5D+yF5qVmu0F3Pcz8xnN6
 mrQNM9gkBYfRtKrSmvaYZ8I3tPv+F3t1TF6ejXJ+HAKyJuHDLHlh/eX0OKChTdzNY1gH
 hykkkHPW44bEvk/L/qE95/bsMGOS2aRLAsmVG684xbfTYTPUjRaG63/YNHjVq5w++TDU
 0c5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RffEK/rCiFhZmvHDae5MdJFHwlUbrlsn383XqLguch4=;
 b=OpAznTO5FLeGXYLds0Pye0M4K43eDF3hbf+nU4+ZRr08MWfxOFfV5Scw0J3BrLzmvV
 usosHu4hAvajvvZtEdLoWU3kCJKrc7D0Antt/GCnKLouAZUUpa/8Kst/czjtfgxNkaH1
 rRuzjfjQNAMIF4qH+Ec6M74jdpXQuRwFkrMDaIh07xSA4eX/Vej1qbGPTvRkW4MR4W7c
 N/RQ6uaDzv44oTpXdC9FU8uywkNpfB1P0U56SvN0EA0DmMHJcqs5/ENMLpwtZo2gqMkU
 qd8VET9K/6xYyiyS8+otjCBRKMYuoNfIwCtPPf5rU9ZC/nYPTBzdKEOvIy4J8wZ2eGbD
 S0uQ==
X-Gm-Message-State: AOAM533G53E9zuAJgn9yIqUYyNJDBr9Ogs98q5vimFvHDnqpbTndOipy
 ruREsF2WZUEPztZeMht1kW/rIQ==
X-Received: by 2002:a17:90a:ad8b:: with SMTP id
 s11mr1713407pjq.40.1600217204217; 
 Tue, 15 Sep 2020 17:46:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kf10sm611723pjb.2.2020.09.15.17.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 17:46:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] target/arm: Set instance_align on CPUARM TypeInfo
Date: Tue, 15 Sep 2020 17:46:35 -0700
Message-Id: <20200916004638.2444147-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916004638.2444147-1-richard.henderson@linaro.org>
References: <20200916004638.2444147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: If03wJvE8VCp

Fix alignment of CPUARMState.vfp.zregs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7b5ea65fab..a7643deab4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2290,6 +2290,7 @@ void arm_cpu_register(const ARMCPUInfo *info)
     TypeInfo type_info = {
         .parent = TYPE_ARM_CPU,
         .instance_size = sizeof(ARMCPU),
+        .instance_align = __alignof__(ARMCPU),
         .instance_init = arm_cpu_instance_init,
         .class_size = sizeof(ARMCPUClass),
         .class_init = info->class_init ?: cpu_register_class_init,
@@ -2305,6 +2306,7 @@ static const TypeInfo arm_cpu_type_info = {
     .name = TYPE_ARM_CPU,
     .parent = TYPE_CPU,
     .instance_size = sizeof(ARMCPU),
+    .instance_align = __alignof__(ARMCPU),
     .instance_init = arm_cpu_initfn,
     .instance_finalize = arm_cpu_finalizefn,
     .abstract = true,
-- 
2.25.1

