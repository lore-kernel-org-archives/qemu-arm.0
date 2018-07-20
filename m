Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2867278wru;
        Fri, 20 Jul 2018 07:57:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdkNed3jqh1KnQMoHMc1qHTyEHLe5PfLQPXVlsMbd9kCwnorwMq/EwDb8Uy1nMgMIfmKPeg
X-Received: by 2002:a37:5a43:: with SMTP id o64-v6mr2135084qkb.211.1532098642016;
        Fri, 20 Jul 2018 07:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532098642; cv=none;
        d=google.com; s=arc-20160816;
        b=xSAGgCXvHbS8P4W8CU1itetNaBQfjelujZiqU8DxEyoo64jOmy5bz7p7+v133wbUuk
         3xWZ5tz7JHWBLZ8nqcskYd5lQV046nOFrUVmaLBSIhVbwdBIk7nrFZaf5Dc2WcvJWhRT
         szCuXSfXa8+4D9ZKWRVJH+e6m7r9HJC3+L/C69I82J+XK8mLw7eD/iHuZpk03G8HDgux
         6qEFDafU0BORt6HuMNkb9CUNuhHTWcVK7hNNdIUGHvqhkJhvAjS0jgosAbM7yvce5m73
         vzzAud14ObnWhvSPHv3CG45Eu6lwdH2IUCDu4QcwF81I2Sw5l7o448UjdCEt3D1MKqOG
         5qug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=OdNE7Lhiavh4cbq/TJIE+D+NZ/ssx41+Ml7YsvyoMks=;
        b=QrfqLt53Cpo/wKCbSsXolO5wHDGCjRl53c8vd8SFQMiX6YthuVB8YshnA4MfkigZ8R
         2rxUm/mGYDaNk5ilpDdNSS7gilqN9DWB6bfXZo0xiV4Mle18YgeAVv2fluYz97jzqMnK
         LnTsfSpw5Zj6NQNoKYIHMFPFUFOAlQycM8LsQ0goQsnyRH6/bYx30vqc8hizc4GVBKHb
         OervN2xvMfZFKhoRFxp523vepjH0peBzqnA/Sy36m5QjvoAG7I53OBAYKvufXILaTPsl
         a1jS1F++PIqUq7PLeEp2xaxaOy7DgsMJ3EifGQ1qqrilR3Ejn9zOWIH/8WkyLNQnwRcr
         xiwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d202-v6si1588383qka.17.2018.07.20.07.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 07:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgWqP-0000VU-EE
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 10:57:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq4-0000TB-Cx
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq3-00061H-Fl
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:57:00 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fgWq3-0005xz-7Z; Fri, 20 Jul 2018 10:56:59 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fgWpt-0004zx-Qo; Fri, 20 Jul 2018 15:56:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jul 2018 15:56:45 +0100
Message-Id: <20180720145647.8810-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720145647.8810-1-peter.maydell@linaro.org>
References: <20180720145647.8810-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/4] target/arm: Initialize exc_secure correctly
 in do_v7m_exception_exit()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GixVxiVJnWS5

In do_v7m_exception_exit(), we use the exc_secure variable to track
whether the exception we're returning from is secure or non-secure.
Unfortunately the statement initializing this was accidentally
inside an "if (env->v7m.exception != ARMV7M_EXCP_NMI)" conditional,
which meant that we were using the wrong value for NMI handlers.
Move the initialization out to the right place.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3ec6114599b..efcadfc7fa9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7052,6 +7052,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
             /* For all other purposes, treat ES as 0 (R_HXSR) */
             excret &= ~R_V7M_EXCRET_ES_MASK;
         }
+        exc_secure = excret & R_V7M_EXCRET_ES_MASK;
     }
 
     if (env->v7m.exception != ARMV7M_EXCP_NMI) {
@@ -7062,7 +7063,6 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          * which security state's faultmask to clear. (v8M ARM ARM R_KBNF.)
          */
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            exc_secure = excret & R_V7M_EXCRET_ES_MASK;
             if (armv7m_nvic_raw_execution_priority(env->nvic) >= 0) {
                 env->v7m.faultmask[exc_secure] = 0;
             }
-- 
2.17.1

