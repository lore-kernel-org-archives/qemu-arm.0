Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2762271lfo;
        Sun, 31 Jan 2021 08:51:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNDQD70t2ZM+rADUk6J75siGpW/S+XXZFaFMpevbtchYLWZvajwedzzJwe+hYq646EoQcz
X-Received: by 2002:a25:2456:: with SMTP id k83mr2568554ybk.99.1612111862654;
        Sun, 31 Jan 2021 08:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612111862; cv=none;
        d=google.com; s=arc-20160816;
        b=s4S/sEPEYxH+kOfkMqjRG41ty3YDJ04G1orIG46lPzCvqucz2Y/IyIcesU2JTy+eVb
         bBjz3gkjaWHRcH4b7GDIy7dzFPt7u9XfHm50pkqIWuKFSt3N3PbcqWdVrye/0V2+tcEd
         qmFyfU3pTNB/IsaPYBXb2YDaRkKXlIgVjkZ5SRSo4GfLKbHDfThSLOPqajdmnNF96Gvy
         oKZJGkw5eFp/FdvFe3d2HYub/AwIWjyo8izCD/tCmuDsCcWoUYIvSKGJGQilCvQmhhMe
         HIcE8Ai8gezsRK5UNqen6KVk7Yx/xuRaOmog29EPOxKRHT3tDKiuyc2TJ2fprcq86m1n
         WhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=P3RGtYOfTPa/4QX/PpSq+3Pw4Nd81ZJXrAdtTbdsm7Q=;
        b=JfroPHmUuaSms/j1bdxiWf+7OClETiQJacjpQeorou6y/vO5qKXBgcxVBa/bibEc5O
         SPLkXvgUkp9OgXmycM6vKdQf4QlK7BYukqbD73RrGDTJu70V7eMbLM5m3awSNOKkH3WC
         zvHhUIfRCZq4jrXNF1LfbzVe58NdSm0mK8fB2VyGsuik3hkJ6bY6urr15wASNlKUUVcv
         YX7yEIabi2aQ60Eg1J8q67nYuyY0osYVz09uh4GpClDz1XH1YYHSmrzST15dWImrWS3Y
         26la2xQJuouZfa6H+sIufuLHK/r4cj2N700Ytw6UfgfoEKmYv6o0sviQmqBGG3ilpz3S
         rqsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="A/dTHcDq";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si15515264ybi.4.2021.01.31.08.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 08:51:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="A/dTHcDq";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6FwE-0004Vx-1P
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 11:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpz-0008Vj-Rj; Sun, 31 Jan 2021 11:44:35 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Fpy-0001Ym-9k; Sun, 31 Jan 2021 11:44:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id o10so9975605wmc.1;
 Sun, 31 Jan 2021 08:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P3RGtYOfTPa/4QX/PpSq+3Pw4Nd81ZJXrAdtTbdsm7Q=;
 b=A/dTHcDqqwc/tv3bQIAUAgwkqkP9ogdiVYTHvGv4iS35a2bxwgVuewcC+imA8Fy/Dm
 9z8r+8Dz2f4j2yM5Zjwu7RZFN9ZeJlnWYz+El1ZewH64ly3EXRycrTgWz5utguWbI3mP
 f63oCoK/vERG7govyVTx2HOnU19BwZgdqHP3uDAIO+SKM9bWxBYaLsuvq+ZAA0cFYjHd
 owSiGCbvLHh86Ik9nixpSBy3859VTpWySRlnKU6AJz47ETY6a9riCJxSMbDvFccJjdOE
 v0Jn+pon3g2pbVh7IOiSWTYVuMokX3myMIN+wwIvYvgAmkbMxtGS0MAwfUsVAMlDlC01
 e7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=P3RGtYOfTPa/4QX/PpSq+3Pw4Nd81ZJXrAdtTbdsm7Q=;
 b=OgqhXRS2TjXIDQBQNzTXMRAYGvTx9o0eNDW5lUfM7gweu29RIcUbbqmaMAEZfOxWZS
 tBGbwvokvamrMbOu1ZV9UHQaQywUiUcXYEj1sfv2iszHi7AIoYWSUuTqZREo+6u6n6Rx
 IJ1Nc4ZPIbg51ApgJ4wNWSsy/fabjz1C94vSdNY2xLDaPTNWWzMkWA3cj2pHSIZFI+Qz
 q1bYYJL9iqqTmCG/YDPzFsy+HbgXWj0Gcc7SNq9p6x4tuqqZrLaBQZQAwDxejwy766fE
 4qSbeJhTu5VeU4ov6h+fKpDW/lLcbTaQadMJFOZq0++SSuceGYZAWnjE+xN+xjdWzCL/
 ffyQ==
X-Gm-Message-State: AOAM533P9vPrKYPtf54phqdMnnHZOJ+n1+y6Z79a+qOLq8rJGmf4j2MV
 pJmcmbfaQPNVL5WwJ70iSFXMP5iBX10=
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr7608936wme.103.1612111471488; 
 Sun, 31 Jan 2021 08:44:31 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d3sm26664724wrp.79.2021.01.31.08.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 08:44:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] target/arm/cpu: Update coding style to make checkpatch.pl
 happy
Date: Sun, 31 Jan 2021 17:44:05 +0100
Message-Id: <20210131164406.349825-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131164406.349825-1-f4bug@amsat.org>
References: <20210131164406.349825-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9+W1RI+fW2zs

We will move this code in the next commit. Clean it up
first to avoid checkpatch.pl errors.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d0853fae5ae..2d8312267f7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1956,7 +1956,8 @@ static void cortex_a8_initfn(Object *obj)
 }
 
 static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
-    /* power_control should be set to maximum latency. Again,
+    /*
+     * power_control should be set to maximum latency. Again,
      * default to 0 and set by private hook
      */
     { .name = "A9_PWRCTL", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 0,
@@ -1993,7 +1994,8 @@ static void cortex_a9_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
-    /* Note that A9 supports the MP extensions even for
+    /*
+     * Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
      * and valid configurations; we don't model A9UP).
      */
@@ -2030,7 +2032,8 @@ static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
 
-    /* Linux wants the number of processors from here.
+    /*
+     * Linux wants the number of processors from here.
      * Might as well set the interrupt-controller bit too.
      */
     return ((ms->smp.cpus - 1) << 24) | (1 << 23);
@@ -2077,7 +2080,8 @@ static void cortex_a7_initfn(Object *obj)
     cpu->isar.id_mmfr1 = 0x40000000;
     cpu->isar.id_mmfr2 = 0x01240000;
     cpu->isar.id_mmfr3 = 0x02102211;
-    /* a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
+    /*
+     * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
      * table 4-41 gives 0x02101110, which includes the arm div insns.
      */
     cpu->isar.id_isar0 = 0x02101110;
-- 
2.26.2

