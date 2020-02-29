Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1317453lfg;
        Fri, 28 Feb 2020 17:28:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyw9XrTK/Kzb0f901v03MQmpQjU34nwSBW5BAbwiSxZuSfipm32mi0GpSUIk33VQ184dfMG
X-Received: by 2002:a37:9245:: with SMTP id u66mr7242670qkd.102.1582939723348;
        Fri, 28 Feb 2020 17:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939723; cv=none;
        d=google.com; s=arc-20160816;
        b=KlFcVCn6EvhRVWAGrmQVOu6XJrqu46HLt2aQaca5yvqzItikcpyGyYxvIBzqRo6ZwS
         N2Twh7pvGpALdhjPcKeCQLPA1iFSF1GZfa/v7+OBykIltfR3e2PuZVAj+aYhdk63Mi97
         eOShQx8pQ3AIZuUpH1h8B9xrTCP39p2Te9c2/LlwsFLZtr01Ug259YAmIp/gJf+eo5k7
         c+pLm+aReYoCa5umdiv4MQKVfMBpZzSgI4vwU5EjNIVtQ7h8fedrijs4szce0HVc0Ej+
         30ArAVcpz5mTVrUx1olx8HhXfsYFgEdGS87Jo1ir5I1qZ/2m2PWOwFRyPdWxwZKKiVa9
         X+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lD3FYS9OIbqt/7rZmxRR9Ucvpf5WCTg8Pk1gx8FKewE=;
        b=k/UTJIhZQgQJ1Rsbf+VNB5sM/rGfZ2GX6kN0aaUWlHNau0j/U/0VKw1z7ucwLsPOyO
         pecj5HMUovDgwhceQOUFwm4D3XvbjG8a/w5kz7ZvfHFpReKuji2W6tN8quMYCYXQNUDB
         /MCNQ8WdquyObFv2xfs1rOvfLxqUzvTo/vhBq+gRzgZsk1GmCzncbqalLW34vVNv4kAv
         Vli3zWXDkrWAHuqwc6LZBnUpzLuqUq07eMFMpJRv1hI1mYJjFm8VT3rPY94GNbjdF/qB
         tcJaTM5uRuoSCIqz/swbnaqr3TTREEBSjWBxKU3UyTAPmj5drJ0rjySu2nBYAsdhZ3fn
         6Crw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvRi+YXc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26si2197581qto.306.2020.02.28.17.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:28:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvRi+YXc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7qvq-00055i-PR
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:28:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvV-0004jm-SK
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvU-00060R-Ut
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:21 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46307)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvU-0005zz-PI
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:20 -0500
Received: by mail-pl1-x641.google.com with SMTP id y8so1896509pll.13
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lD3FYS9OIbqt/7rZmxRR9Ucvpf5WCTg8Pk1gx8FKewE=;
 b=TvRi+YXcZh9gcJikXK9coMz/2htbtC9rHOisjlUaVrG63xZ3frhynSwcyMQDvAXS34
 Nz24MnTDsoq6FtwQbQug/V7b2uj3Rtf+3fqYjn05ctDxwEEPpkqIdE7DZyj3waqix/at
 t4Ko+cXIJnxvay7RODwZhdmcxaJnT+o9CixVftYyEedMGZiUT0QSjr50+YbyVk7cpXoA
 VIzow+zV8UU0ocrDttICXwfrfhy93OONuZlm45rZtx/BH1PHXGWQVh1LmXq7ICQCzobe
 BVHCKX8BQas1pEcstmd4RsMG7ynaarQ+oZEaGqlhbIXULiHZBCUAIXY/2zJv8W1g65LV
 /pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lD3FYS9OIbqt/7rZmxRR9Ucvpf5WCTg8Pk1gx8FKewE=;
 b=YWlIlpbMshupYKszudA3ZwutvPGb2v7+5n/gIR/kVVgsWzR+DD5BG+P1bEsOqg+Jg6
 K0PSzFG5vAB8UUiagXtmREbc2LeHo8hIc9LcMEObOHWPUqWZvA5fs6IhiwWKysF5OTVd
 EZh0Mni+/eACkFQIYb4WKtVMcxok0tfDQ0GHB1X6uogtBqksKofuM+QJTjRXbNc6V6Rs
 DX6yYPN63qLt9c6ZnOU4mEmSQ5lzaF4k+VCLR3X7GAheK9U0JKPI+MmJ3/UVzgxpNqw/
 3SBSS7Nj7HH2P5TaLrHZj7wk+VQatWeIE1E6pjGQtC+dAoSBfrT+do0hbvafM1xuQCqm
 sDXg==
X-Gm-Message-State: APjAAAXUQo0VByyyfeLIv8gRwVislqtPmoGsktNEB5iQZYltvULd8dr8
 H35+zt4Xb9lHhWdUy8ySJyYHJHQEXRY=
X-Received: by 2002:a17:902:523:: with SMTP id
 32mr6715470plf.148.1582939699893; 
 Fri, 28 Feb 2020 17:28:19 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/12] target/arm: Remove EL2 and EL3 setup from user-only
Date: Fri, 28 Feb 2020 17:28:03 -0800
Message-Id: <20200229012811.24129-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-TUID: +HkFERnOi516

We have disabled EL2 and EL3 for user-only, which means that these
registers "don't exist" and should not be set.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 33c28fe868..af541431e6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -191,19 +191,13 @@ static void arm_cpu_reset(CPUState *s)
         /* Enable all PAC keys.  */
         env->cp15.sctlr_el[1] |= (SCTLR_EnIA | SCTLR_EnIB |
                                   SCTLR_EnDA | SCTLR_EnDB);
-        /* Enable all PAC instructions */
-        env->cp15.hcr_el2 |= HCR_API;
-        env->cp15.scr_el3 |= SCR_API;
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
         /* and to the SVE instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
-        env->cp15.cptr_el[3] |= CPTR_EZ;
         /* with maximum vector length */
         env->vfp.zcr_el[1] = cpu_isar_feature(aa64_sve, cpu) ?
                              cpu->sve_max_vq - 1 : 0;
-        env->vfp.zcr_el[2] = env->vfp.zcr_el[1];
-        env->vfp.zcr_el[3] = env->vfp.zcr_el[1];
         /*
          * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
          * turning on both here will produce smaller code and otherwise
-- 
2.20.1

