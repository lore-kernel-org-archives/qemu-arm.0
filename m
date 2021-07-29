Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5538408lfc;
        Thu, 29 Jul 2021 04:17:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcCR8i4EP8cSmVQiz1E8AofzUaKca+G0HBn8t0EkEUdsCHX335pNkCqUCZ0KtJrmMoOz1e
X-Received: by 2002:a5e:8208:: with SMTP id l8mr3697018iom.197.1627557447931;
        Thu, 29 Jul 2021 04:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557447; cv=none;
        d=google.com; s=arc-20160816;
        b=lzruQcb3B1unkTRf8ckIBydBndgFAE37Gur9IptsKywxwkrrEirei8TuPc+bvMIirR
         FJ/AaOPWrN8ktfs382LXOTzEtffxHyJA4k2iMPckvub2Nuhs60rpHPGcH6NUAIi+Objs
         58BGNK089gpmgtsQQd8A7mMwDovDGStvnOlTvnT3YriGGUYp7UjIyWBpNYz7Bw348S7c
         uU2J5dAHHqiPB8FkdEbx6BTR6RtGs0OoopoXjr7mIIHfhmP9tBdBRyiUYVEBU2j5JYtq
         or9wytOHAx60xOsFkBovaA3/gj+bJuHdaQQnnmkWI3wMHo88ohrbuJonsmG3tbnhyHof
         F5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9E2l5jElzoIn6FznnRlfJdbmRFg2UKvriErGukFqqJw=;
        b=NfVf9ePi+ceZwj2k2BiiEnb4eYRXQpQKoVN26RtPWJzODdK62C0deTcLLNw6jC7jgv
         PkWqYwtIgrkIzGmolswKJxSK2PW43fegHtWilvVFUfFR7TPMTcTq/TguoYrGWn0OSV0R
         Z30HnuSX08E3MwNlZrZmrtNwQ98TKtITZCISzOQY6fjo0G5Aela9ixf8CgwDUcLQ0Yuu
         c+qjm6QqPC/hGNgUn3DCH/8hbqjsvkMSkDlCQZAyUQAm3mXQSdBx9g01T1Ssec6dQ9Dx
         cXFf7OHgNLxT0679zjft+oSG6B1jI9tYtMzXCzsQwRtq8y5wGrxxfP58GJCqt7A0AXQm
         6TGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p71GY64S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si3331852ilf.126.2021.07.29.04.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p71GY64S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m942Z-0002tw-5V
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940n-0000Tm-Jr
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:38 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-000146-Sr
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:37 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so5028353wmd.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9E2l5jElzoIn6FznnRlfJdbmRFg2UKvriErGukFqqJw=;
 b=p71GY64S4bkwnzaHIPsCIIXm2YhNf/9nXFFqcyR1DUFSBqemp5Mdvx/eh3hm0bTdm/
 NGr5DNhmXLqXBDNuqReLCVMM9p/SS7aPzxfoHJdpX1+nq0nYjNllSyDcLApwax7pQ8rD
 rWPDWg8+SuVAMUUYrLI4InDE+epjnaY3/4ZIp31RUc5qK9xCk4izkmA+ca4wHLXMOziV
 8RrgP1+OUAAbWK6SsYeRvfPIkLj1vNRshK3PzVWgje3BTPqAFb41yW1j7vxgF3mTQ6ue
 Xtklzd8t5p6zKMqyDQKMNFyQ50Wv5LHs5tMjshXy4T663COXk9HvK8WDy67z8+OBjBNT
 bdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9E2l5jElzoIn6FznnRlfJdbmRFg2UKvriErGukFqqJw=;
 b=bnYKzDwQgL0TnvYssoyxmS4aDTei0+D6LZpZU9NWSK+ufCYcaPgAod3vAtqe1HMbeV
 OtMiFzuwwybwmrldfA/BaXahpzxBJVfbHTTlkfWala9iUjY0vxqZoSs8TwQz+ug0nbn3
 ukOgEMRk4KZqSMMa66uAgYwqMCnqLp3DnoH+ZeO8mhc5Py+HqLQPdW3jAiUYjnnFuWw5
 55cPk/FXKkbljZ8e9HWA93VpMYi+/AUZYhINmm6i70q5Dp57IA87K565bPvSjnoL1mjx
 oP0QUciLJaOK2GUWw2jQDJy73BVyL2Vj3YC/hPXjRI6LTd1/dQ/qnkjMQplm+yOTPHHi
 bMSQ==
X-Gm-Message-State: AOAM531sjRNoL634cdXnd0vK4tA9Q7/kbq2B91SeKYqtzT+Tf7fXrfW9
 3wgorI7/YZyx2KX7MkYnk6uLdwGf621p8Q==
X-Received: by 2002:a05:600c:21d8:: with SMTP id
 x24mr4153217wmj.59.1627557323542; 
 Thu, 29 Jul 2021 04:15:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 11/53] target/arm: Fix VLDRB/H/W for predicated
 elements
Date: Thu, 29 Jul 2021 12:14:30 +0100
Message-Id: <20210729111512.16541-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WOb83et8mi8F

For vector loads, predicated elements are zeroed, instead of
retaining their previous values (as happens for most data
processing operations). This means we need to distinguish
"beat not executed due to ECI" (don't touch destination
element) from "beat executed but predicated out" (zero
destination element).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bc89ce94d5a..be8b9545317 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -146,12 +146,13 @@ static void mve_advance_vpt(CPUARMState *env)
     env->v7m.vpr = vpr;
 }
 
-
+/* For loads, predicated lanes are zeroed instead of keeping their old values */
 #define DO_VLDR(OP, MSIZE, LDTYPE, ESIZE, TYPE)                         \
     void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
     {                                                                   \
         TYPE *d = vd;                                                   \
         uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
         unsigned b, e;                                                  \
         /*                                                              \
          * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
@@ -159,8 +160,9 @@ static void mve_advance_vpt(CPUARMState *env)
          * then take an exception.                                      \
          */                                                             \
         for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
-            if (mask & (1 << b)) {                                      \
-                d[H##ESIZE(e)] = cpu_##LDTYPE##_data_ra(env, addr, GETPC()); \
+            if (eci_mask & (1 << b)) {                                  \
+                d[H##ESIZE(e)] = (mask & (1 << b)) ?                    \
+                    cpu_##LDTYPE##_data_ra(env, addr, GETPC()) : 0;     \
             }                                                           \
             addr += MSIZE;                                              \
         }                                                               \
-- 
2.20.1

