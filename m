Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1790635ejb;
        Tue, 6 Feb 2024 05:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEY4SGC9wN3PaJGqxmPDD8nDGupxSRbAjzvbFlHzhYyldfWWj+icZYitQa/x7t4YHB6axb
X-Received: by 2002:a05:6102:358d:b0:46d:1cba:fc45 with SMTP id h13-20020a056102358d00b0046d1cbafc45mr2053001vsu.16.1707226253654;
        Tue, 06 Feb 2024 05:30:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707226253; cv=none;
        d=google.com; s=arc-20160816;
        b=vzgW3eHvQhvFaCnxfNCjPRlArM7NQNDLXgk96Ndl1bGecogVZEhzZkBdxQxloCt0M/
         JABmyGj7ZOS8R7w1CLEj7cnZjUkVqRxPBhhDgs6F3K+InU5fx1arEYsih6lftetwv8em
         7LI3KNnKLF/oactozKbZ/x+GMBDwA+umm06/TxknBy3JSr9bUuQJIKMYXTy2eO6xKCqx
         PJROwDx5dSZ+fORveR5lB5WslaMvaTxHLExBNNU34yGt48S2KZZSlUc09m/NRcXw8QoE
         uym3AlA7LmPg1OlQFcHmN5V23Dus/1wZKii6tD7rhDxdmuhwRF4GozcB2pn7cY37hblj
         nMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xyto0qdSuakUvujUrl1EewzD93xhnNFTVZXku884bPo=;
        fh=25/Be5wA2SGYMd0s5Kg8O3k1Y2kedvvHq8DzywzICe8=;
        b=aNZhuzKIpGCaJGy6xah/MEGfyfRdhXIRStc/QXYM7PFWgwl/W9IjN5TB6/4TD1aYkU
         2j95OEYutfxCvmBAJ1oMO99ohYUVzIvGszdhRKJYQuG0ZE8Ca5l3lCUkql8VggvRHFL3
         aLa8jPWIZjp9z6LOveRluzqy+m2NEZq7cA0zxFjHeCXp6s8jWGBvLKnasbwqQ4bP1Ytq
         LtsPrd6Tn8sgmlQdPBKG6FOQA/+0Kl5tms2HV4BZruP7upiYlaxIGwwN6eoBCiI9m6uL
         FJUIdzW3udUmoc8iIi0kaR4w9Y+XblvYgMnGqRuLCzD/iHOPwLRfVMBfAhRkjbmN0IWR
         R64A==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQEuNbV9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXmTUKVzuOnphvd4efX+XYgS7SHzvfhmRGb8VOObiX+LToqPDvV7ANXVCmc6eBaFHBKsg8gC1mdTe9TosL9fuVgTiRAcgxp
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020a67f74f000000b0046d385eb76esi236288vso.561.2024.02.06.05.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 05:30:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yQEuNbV9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXLWB-0000Xo-7y; Tue, 06 Feb 2024 08:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLW6-0000OA-4M
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:29:38 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLW3-0008DT-6N
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:29:37 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b130f605eso3639783f8f.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 05:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707226173; x=1707830973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xyto0qdSuakUvujUrl1EewzD93xhnNFTVZXku884bPo=;
 b=yQEuNbV9M2kDgteppxDS3TogvFmU99dlPAK1lUg9MOjNUWmmPhADqCrnvC2IXNtuBf
 OFrYbQYUEhxQe44GIeEwXs6EDgxYUvjT0hXuVmccA10dZNziqLiVj/KZ95B8461PCrQJ
 6PAI9kCFUo+AJj8zW05Y/vXOd+bYWvtn+aqfJKaIeYmkhwmKa4ax2AzvrlL6tINa450Y
 buJuMT6D26REGvyFa4iMplxnyop93FZ1lwCOGWSLqWcncSlj9QRQd1MgrxrvoR0y8oNG
 fEaffQc0G8HXSF3a4mIW8rtuXlyIFB3txT3J0ywM6OPmoa+H7y/VFRKsks/PmRG3OKQe
 E1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226173; x=1707830973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xyto0qdSuakUvujUrl1EewzD93xhnNFTVZXku884bPo=;
 b=cfLYc5WOuPzaY4embJGi1Qh482TuDvYePozOTE7YF+U9lsxlmv3C2x/95qKcq9Xe1J
 iMhbNLH+mOVxeEiqNKN4nQG8UmaACLRBb34dt/VAQL+snMBCyu5LDGeXOLR3NgFdfTPj
 489SlmQRHMhyfvvtMOJzSK9s7G0sENNjPsN65M763qsQ5wqC3nPvpEupCVbrsr+MOaA+
 n9VcbUsC7ufVFsGQmATJTcTYhkZeTojN2cJnZQNu41HD5BtAF6BxnrKsZvtvUUU9RBxz
 CI2SUUEnblnDfd+2GcSauII/jfLPP4Wrtbv8vFjJtGAskXETXxnlkmwsQh/tMnDMlXwb
 z7gw==
X-Gm-Message-State: AOJu0YwAC0eaUYiECTBauZhPGlQDOkblsPhQAm4zMKlS+CvRiL81zfpU
 3C+YSak/Duk5w7vACz64t+zuXG3Y6cU35woWUskeQE3UeWqcgibiqOAZ8uF+r5uHPxJajiwuhK7
 Y
X-Received: by 2002:adf:ce0c:0:b0:33b:312:e11b with SMTP id
 p12-20020adfce0c000000b0033b0312e11bmr1218815wrn.38.1707226173523; 
 Tue, 06 Feb 2024 05:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUEIlGuibX0oEJFSwre5Y4D0Lo8vb16efeRH4uR4uwbYCKpCNJT5mDDAdBRLjv9VBIvgsw7ShJZh+FKvWPrBWV2o18KuME=
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a056000108700b0033b470a137esm1492932wrw.79.2024.02.06.05.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:29:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/13] target/arm: The Cortex-R52 has a read-only CBAR
Date: Tue,  6 Feb 2024 13:29:20 +0000
Message-Id: <20240206132931.38376-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206132931.38376-1-peter.maydell@linaro.org>
References: <20240206132931.38376-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 42mEb2e1D1G1

The Cortex-R52 implements the Configuration Base Address Register
(CBAR), as a read-only register.  Add ARM_FEATURE_CBAR_RO to this CPU
type, so that our implementation provides the register and the
associated qdev property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/cpu32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 11253051156..311d654cdce 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -809,6 +809,7 @@ static void cortex_r52_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_PMSA);
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
     cpu->midr = 0x411fd133; /* r1p3 */
     cpu->revidr = 0x00000000;
     cpu->reset_fpsid = 0x41034023;
-- 
2.34.1

