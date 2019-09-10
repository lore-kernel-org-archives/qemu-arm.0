Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5573820wrp;
        Tue, 10 Sep 2019 07:50:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUaaatk0Aa7npNNo9yxpu3oxNYykCUjFso+J4d8kXC8PELuqggt0sp2YGaRc1fRpSfG/Mz
X-Received: by 2002:a05:620a:1356:: with SMTP id c22mr27218312qkl.119.1568127021739;
        Tue, 10 Sep 2019 07:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568127021; cv=none;
        d=google.com; s=arc-20160816;
        b=SdyKXhEqhUopp6LNRJW4j/OE1cGnu7gFZaqHbiYu3FgJYz5I3McWLq58GzmvnRcvVO
         mgFx4YrCW2YFQmmk9FnFHFFZbqjUnwZAaFxfgCONjUJpgVfI24n1SG5O6FQxUzNGCWqK
         Aun/SiLnlfWDEnGLMyzgK4JlY4VCGtuzHMpdMQLDhGR3bNlO3rgZcGmO8coxONVsnSIb
         wq1dOZ+3fy0k1ISFCMoK5KRXO6wKLcx7sGPSLaziK0pTqM/2iJWSAPxkWBY8r1jyKIf5
         J00waQyGa8nMlZ1ZXCMlcG8yDpxdTQ741DvmwbWjP2Kv8ExpViKLjlS5+o515aPRAYvm
         Mwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YNt4rzxDLZvJ3mLelApZg/g3aGU83zBv6U6suQNcbas=;
        b=xJk+e9eLC/gEb5CrGdlZ/4DWkaDpEFmbg9IcvzTcoSusMyTa2e3o6voIakcUGdQl6N
         smuNc/zuaDyNdcG1/sE0MZqIxQwbWTxyW2J6VPA18bLfpM1M2wSVKVu5IuBZOWTtLH1S
         5tlJSiEfL9GJoyqFhy2uWl8aayMmojcNkdQxzeSFzb4+yE7yCfjKGxh8Btc+DuZzsRBn
         cqu0VRUv7eMzvvS6l6K69GkiH1TZP4NAqH+VNKsYST7t0M1Q1VCfqOZGA/GXpDeCWKgW
         DnarPFQlHsMGgnQlCRaOzDe4Hj//15p20ViaAww2mTdUw/r1xe+8r+3m1N2skZZS29w1
         7+lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FpfoOZur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si10120311qvf.154.2019.09.10.07.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FpfoOZur;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7hTI-00023B-97
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54205)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNv-0005eT-W1
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7hNu-00057U-SA
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:47 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39187)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7hNu-00056v-Ln
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:44:46 -0400
Received: by mail-wr1-x442.google.com with SMTP id t16so20833486wra.6
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YNt4rzxDLZvJ3mLelApZg/g3aGU83zBv6U6suQNcbas=;
 b=FpfoOZur9SeiO5+ovdwDYbHq6hgY6rbpK/dv9x8sQf3BJy2GaAu7MQuZ1a2E3E0XDT
 YVs0B5uMpkF9uag6dPn7MlYSKCo0zmuLggIJJVhvKllv10u96rc05E5vWgsdlLN4VaHZ
 sI15QxR7jvaDBR6COKIkQSCcPXZ6QSB2ssG4UvWxNzTLBT5x7GQ+mnRZLv2s0V5YQ3xI
 hpEvXUl3qo4W5YzjIBteUUC1YjXlUtpNrzrg3lzLyc6htpvPMs4D1YfpiL4sFYc9H4Hz
 +LUox7B3Sdu084rI+Z7jZqdkeE97Uj6xVJaObKt0+NwX34vUCz+rgQb5NlRVDXbyN38b
 W2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YNt4rzxDLZvJ3mLelApZg/g3aGU83zBv6U6suQNcbas=;
 b=uOLPQ4eTLe3pXt4Diy4bPT2jE2C70TO3B692Zbm3I9DsUli/ogXRyu8P4iMYGj2u6R
 FXuffObu2tZ9qSaOXtIN7JnavzSGHyCRvyKF+M+CO86de/NyFSnzZRbLprvZ6spZ1zm+
 OAs0L66aSq0yfiP7Muv0ld5PZNT3VlMy2igNd33rQ5Ljo1bAaBOUXjF03tWs2ytwtRCG
 lnw3FMz9xygaI7CKVHGD4rgDCSwhGU0LKakZe4BC3TzBqG9tjEr1E2jkEVwBPE3EIpY/
 0MYjboWSd5HZ/x4kwEO/+Mbhfpnt2fTA4Gl755Y44k2HopMUK9L90D6JZPKyouJZaRNT
 aIZw==
X-Gm-Message-State: APjAAAXlXaP2bv/cBNdpSXngC6GcJCurxp91QrLDNjgoLTAgGoAbkHwv
 QyXz/iS9eIV0LnCbIiiMcyKWchcbVue4JQ==
X-Received: by 2002:a05:6000:1189:: with SMTP id
 g9mr28272944wrx.117.1568126685607; 
 Tue, 10 Sep 2019 07:44:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a192sm5703814wma.1.2019.09.10.07.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:44:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 15:44:28 +0100
Message-Id: <20190910144428.32597-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910144428.32597-1-peter.maydell@linaro.org>
References: <20190910144428.32597-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 13/13] target/arm/arm-semi: Implement
 SH_EXT_EXIT_EXTENDED extension
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
X-TUID: UJ/czJJcZVP+

SH_EXT_EXIT_EXTENDED is a v2.0 semihosting extension: it
indicates that the implementation supports the SYS_EXIT_EXTENDED
function. This function allows both A64 and A32/T32 guests to
exit with a specified exit status, unlike the older SYS_EXIT
function which only allowed this for A64 guests. Implement
this extension.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/arm-semi.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 0df8d4d69d6..3900bd4e1e6 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -66,6 +66,7 @@ typedef void TaskState;
 #define TARGET_SYS_HEAPINFO    0x16
 #define TARGET_SYS_EXIT        0x18
 #define TARGET_SYS_SYNCCACHE   0x19
+#define TARGET_SYS_EXIT_EXTENDED 0x20
 
 /* ADP_Stopped_ApplicationExit is used for exit(0),
  * anything else is implemented as exit(1) */
@@ -485,7 +486,7 @@ static const uint8_t featurefile_data[] = {
     SHFB_MAGIC_1,
     SHFB_MAGIC_2,
     SHFB_MAGIC_3,
-    SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
+    SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
 static void init_featurefile_guestfd(int guestfd)
@@ -1026,11 +1027,14 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return 0;
         }
     case TARGET_SYS_EXIT:
-        if (is_a64(env)) {
+    case TARGET_SYS_EXIT_EXTENDED:
+        if (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(env)) {
             /*
-             * The A64 version of this call takes a parameter block,
+             * The A64 version of SYS_EXIT takes a parameter block,
              * so the application-exit type can return a subcode which
              * is the exit status code from the application.
+             * SYS_EXIT_EXTENDED is an a new-in-v2.0 optional function
+             * which allows A32/T32 guests to also provide a status code.
              */
             GET_ARG(0);
             GET_ARG(1);
@@ -1042,8 +1046,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             }
         } else {
             /*
-             * ARM specifies only Stopped_ApplicationExit as normal
-             * exit, everything else is considered an error
+             * The A32/T32 version of SYS_EXIT specifies only
+             * Stopped_ApplicationExit as normal exit, but does not
+             * allow the guest to specify the exit status code.
+             * Everything else is considered an error.
              */
             ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
         }
-- 
2.20.1

