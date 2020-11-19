Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp756840lfb;
        Thu, 19 Nov 2020 14:06:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxH+WfyMtZFbOJKOEFTRX7wjvmF9BxLZuLP+R0VOFA2fyYMp8/6lgp1e7gT9ME9gzOUcvXD
X-Received: by 2002:a25:7453:: with SMTP id p80mr22287927ybc.31.1605823618482;
        Thu, 19 Nov 2020 14:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823618; cv=none;
        d=google.com; s=arc-20160816;
        b=xSsTkgKu6POf+0ABGvfVckAVQnpfXTidZZ3bOqQFdB+aCnyfVr6YqcqupNPzSfy+kz
         HHr7Xi8LuT9xVFBY6EGQ7kg9kNf6p6+FlTZTNnCTBqola0STz/QpZyDDhXoQQyZXnw/I
         sR56W6cDnigKexzQBTNO3jsVaxMeDUW6pFNJ9fyllyaW6GdWboqysw2KnzeSNJUx/y2+
         FIRA+1B6xNgaCVPtVJdF2Qlp8ULX8Vwlcdm4iinUObR0pQ7y13RZmeeHwIXPYlszmolO
         ffhfoCwqSVvvkOD5+VoUfK9A89got8qwOWGHNWlmr42THdX4PdrlUlb6Z/0vAUGfVRQ9
         vNpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v15Qy4cmfx4WYV2eDBerGMLhauNtxeDDRpl5ncA8vg0=;
        b=mtKdoYrNS8u+YQJMojH+zjyRR63Z+KhO3dpFf2SVBgRr6KKXqA///7Oybx21IQRbjK
         v5KIxAaNFnMnlD0BOL2TarVnZUYjMmQzhJdtLC7yD86/MlxQyLbMiZW6JSLVE8A7nUFd
         X6R/g3/kl7UjTiXtUCy5y8jzOlk7CgPMgKl/1b/g3rl0+CmLgj8I9ulOHM0oJg7+Y9+I
         ppSykDmZBAD5MUWHDVdDpj/tdLIzCv93v4LfDdMKrQMSF9l51Og8n5MyKYXfUU6aCcMs
         eal8i8DMqbdDAhHOOAiQmSqMqDwhljBLXQFJot1/zh40bK6CBGGs+d2dQ7SMWhofNxe0
         +X9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AmN8XAie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f73si750478ybg.420.2020.11.19.14.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:06:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AmN8XAie;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs4v-00053q-Oc
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvD-0000rz-Ql
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:55 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruz-0004DS-9k
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:55 -0500
Received: by mail-wm1-x341.google.com with SMTP id h21so8073052wmb.2
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=v15Qy4cmfx4WYV2eDBerGMLhauNtxeDDRpl5ncA8vg0=;
 b=AmN8XAie1TKtvsdLRfjQ/dFCvWAJHMslGdiIQ/DWeD+q/5w78IypkBWjWW2nxld5iJ
 JOfR0SQ6UPpTyAJy8fa3SEJwe7Iz96+SxMVlyRWcDJrwiO98WiT8vxiaER9ekoiQAq8p
 Pbp8hfVAcM7oBIJY2VDIkQHnoQokjUuYHwDkK+svsnx15aSPyi5yKi0J3x/m8uLAgC7K
 P6Z1ZI/82SI0TnjpEigRhIZD88bwZXlyOPgXdIgVbPjGTsVtwGIUbnulq3EMs9Caj37S
 3ABuwFz2fPF0df6tQRkkHmwtaiJHIyTfK98D1EgHOzOOkSBk6PjyBCqOE59Z8cg/xNo/
 Vlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v15Qy4cmfx4WYV2eDBerGMLhauNtxeDDRpl5ncA8vg0=;
 b=eekj42lmPS/iA7YJmSvFgbHOeljSNqZK2/2JsBOKru3p7ojB8YRPa6D3Mu7qbqfb5X
 szhQejaFS7SyhizEgcrA544oKPX/vbrDNehnObfbKJ/WPlhQBP4NTJMqkptdRnRT+RUb
 nW03ZEzcjJp+G4ES2zJB6/6z9p5Ilywsb+i7VTlpmNS/iqLYpKHqcbvTDVFs5++0LIYy
 XAKXOnhA0NYg7wgqoFmLTr8W4YRNR/IDuT6dY4bebnZgSvO5Sd7lsvqtouQU8PgteGIH
 ve4aIjiCg7seGL7rsc8kueu363Zw3WPu+ETiVQJv6s99jk6mEnbGOJv2Pt6W6G0q9rAf
 zYOw==
X-Gm-Message-State: AOAM530YL1U1qM8Pp10DP9IvlNN4GSoHq2Wtc6dJSz2WFu3VLYYRAgK6
 jXpmLx0N+eG/M9TWK9OQ/0re42klbxythQ==
X-Received: by 2002:a1c:490b:: with SMTP id w11mr6599129wma.101.1605822999633; 
 Thu, 19 Nov 2020 13:56:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/28] target/arm: In v8.1M,
 don't set HFSR.FORCED on vector table fetch failures
Date: Thu, 19 Nov 2020 21:56:06 +0000
Message-Id: <20201119215617.29887-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bBlnwqd3ChGs

In v8.1M, vector table fetch failures don't set HFSR.FORCED (see rule
R_LLRP).  (In previous versions of the architecture this was either
required or IMPDEF.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 721b4b4896e..9cdc8a64c29 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -722,11 +722,15 @@ load_fail:
      * The HardFault is Secure if BFHFNMINS is 0 (meaning that all HFs are
      * secure); otherwise it targets the same security state as the
      * underlying exception.
+     * In v8.1M HardFaults from vector table fetch fails don't set FORCED.
      */
     if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
         exc_secure = true;
     }
-    env->v7m.hfsr |= R_V7M_HFSR_VECTTBL_MASK | R_V7M_HFSR_FORCED_MASK;
+    env->v7m.hfsr |= R_V7M_HFSR_VECTTBL_MASK;
+    if (!arm_feature(env, ARM_FEATURE_V8_1M)) {
+        env->v7m.hfsr |= R_V7M_HFSR_FORCED_MASK;
+    }
     armv7m_nvic_set_pending_derived(env->nvic, ARMV7M_EXCP_HARD, exc_secure);
     return false;
 }
-- 
2.20.1

