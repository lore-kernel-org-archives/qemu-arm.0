Received: by 2002:a05:7108:4017:0:0:0:0 with SMTP id a23csp2847572gdh;
        Tue, 23 Aug 2022 09:10:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7olYHPFNd5kLGocMgOu5TGs72Eukvp+u+NpwE6yIZ9TNAY0VvL5f0gYabjIt1wC6VVRTDI
X-Received: by 2002:a05:620a:288c:b0:6b3:9d1:dbf1 with SMTP id j12-20020a05620a288c00b006b309d1dbf1mr16157797qkp.593.1661271026355;
        Tue, 23 Aug 2022 09:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661271026; cv=none;
        d=google.com; s=arc-20160816;
        b=xUYAJTZXy/2zisfWBVu5TIbJiIPdJGgddBNfekMHG/0eCybG6GQfT1ldDK/bV4r8Dy
         JEcCYJ5arA3aVYe/m2bXdgvwC+JsqeZWgtAebcEPVPJ1j4LSCMc00jBo5IC3GCkcC+hX
         xp7Vew+H/eYxFJNA805X2Z8M4CDIsxegxFaWFDWNu7NqjYMQDZTJk8hCM6BfZcBDui91
         mchBjKsakVHrz00P97s/YGYjSN8pwr92Viw4ObwwOR06P30duar8xze0T7LtuVYOXsy1
         eAJQGnMemvmcbP3hKTOt7BZhD2vdz1yd/2Pw9p9FERta6TE9cMh0TCY1Gnh1Sr/WUzak
         yBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z6UpMHqLpSYUanFSBt94iEIwQJiNmdEgVqsaLVU9QzI=;
        b=ZiJTz5MIoYELCX9OAHx9mCTmWzQCjoNMSZ2j8B9OWhyFNppHl8iIUyuJEwa12kNPF3
         Nw12BaOVuBcRn4598ZT9w+8Op7SnnLtgvvTd8qZnxZ/jdeSNz3s9TFOY5MbyHFe5kwsx
         OPFgumJLbB2ibT5ZUdXqnCHgTSMKvMju/msL78MeQzAy+WUSZmrK1+4rwmuLcYsa4bf4
         YOnI2U+mLafOOj1GnMIRxWm6geL5lFBCx/3AI9niSK3JwK7kBhTDQfaaD0s4tgtt9Npq
         e1OAFx6kOv1dLyjkj+z/+rCi1KdR/wNyFUQ10Ko8oQol/uCkImbs/vz3msaLvRo+QOAV
         gueA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dFym4hwe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18-20020ac85452000000b0034490214786si5703781qtq.513.2022.08.23.09.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 09:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dFym4hwe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQWTx-0007kU-Uk
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 12:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQWO9-0003Xs-28
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:04:25 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQWO6-0006NV-EK
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 12:04:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id s23so7439442wmj.4
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 09:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=z6UpMHqLpSYUanFSBt94iEIwQJiNmdEgVqsaLVU9QzI=;
 b=dFym4hweN9eIBFysnI4ro+5FfrD0hSSv6WTuzgPepPE9rsWDiTR4LaPft7qA72gtXd
 8JpyOjn1y3ccZ2UufCzAOM9T6YIOHjF6o11pphFxj5NYeqBoXMeTDaPDD8z5/xXmohxf
 dWK+0LzfvN4badvIXhSykVcytgmr44yGGdOQRpYmlirpwzVsDXtKgZ54jZjaI7jBna9b
 b62S5N7C26sO4Ul/bmRH9gsa8BmbTfzYIXfTcbKC6KP34pSqGrHoEwYVbII/i2sv00uW
 tpEOtjthyzCKs0CGcNPe7uz/0AGFDtKyd7Ha4pTolRTAXFVYK2+gyk/7QvhEFeNM0cPs
 PUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=z6UpMHqLpSYUanFSBt94iEIwQJiNmdEgVqsaLVU9QzI=;
 b=nZQ2Wt0ZH34Y1m4irCrpJQor+q425NapJxwewK0mq1/9mWWyJ0kwnyAyfgHh2ryfU4
 SRtN5d7RQezHCmApdZVrb5cYmPhjg7CMS+ESxYi8AGRdy/IwYLu1dSloNLAnzbxTULTn
 V927cMc4Asy6a5EKz6iYwe+ALTsYlJnfrTVRBrcM1DTTNMZKxPHrLcQQGk2PEbn1GqrP
 5vOXGmGl1j5sGW6vrLpacKheYzM5aEQDYy+3tk3PdnmXihDJK0S7SIxIWGv3Tmq6Piaf
 KBaoEAeYTNJQfKx9HaaZvcmTREIssctjWDr6B1qohkepwBenZt0sVsOSTBwpDIjBTduv
 kUeA==
X-Gm-Message-State: ACgBeo15kccmDzlZGBT2rc35jjuU0Jt8xXFgG9wNH7C7oRhyIOyZU0Lh
 WZdQzd3tPpNiDP6jWPWb9xm4MA==
X-Received: by 2002:a05:600c:190f:b0:3a5:f6dc:f542 with SMTP id
 j15-20020a05600c190f00b003a5f6dcf542mr2673628wmq.130.1661270661086; 
 Tue, 23 Aug 2022 09:04:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a056000181b00b0022549ac786asm9152241wrh.47.2022.08.23.09.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 09:04:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
Subject: [PATCH 1/2] target/arm: Remove useless TARGET_BIG_ENDIAN check in
 armv7m_load_kernel()
Date: Tue, 23 Aug 2022 17:04:16 +0100
Message-Id: <20220823160417.3858216-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823160417.3858216-1-peter.maydell@linaro.org>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AQdUTSWb2BzT

Arm system emulation targets always have TARGET_BIG_ENDIAN clear, so
there is no need to have handling in armv7m_load_kernel() for the
case when it is defined.  Remove the unnecessary code.

Side notes:
 * our M-profile implementation is always little-endian (that is, it
   makes the IMPDEF choice that the read-only AIRCR.ENDIANNESS is 0)
 * if we did want to handle big-endian ELF files here we should do it
   the way that hw/arm/boot.c:arm_load_elf() does, by looking at the
   ELF header to see what endianness the file itself is

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armv7m.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 990861ee5ef..fa4c2c735da 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -572,17 +572,10 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
 {
     ssize_t image_size;
     uint64_t entry;
-    int big_endian;
     AddressSpace *as;
     int asidx;
     CPUState *cs = CPU(cpu);
 
-#if TARGET_BIG_ENDIAN
-    big_endian = 1;
-#else
-    big_endian = 0;
-#endif
-
     if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         asidx = ARMASIdx_S;
     } else {
@@ -593,7 +586,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
     if (kernel_filename) {
         image_size = load_elf_as(kernel_filename, NULL, NULL, NULL,
                                  &entry, NULL, NULL,
-                                 NULL, big_endian, EM_ARM, 1, 0, as);
+                                 NULL, 0, EM_ARM, 1, 0, as);
         if (image_size < 0) {
             image_size = load_image_targphys_as(kernel_filename, 0,
                                                 mem_size, as);
-- 
2.25.1

