Received: by 10.28.71.155 with SMTP id m27csp1949048wmi;
        Thu, 12 Apr 2018 07:02:49 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49QMW4x58Ph8fll2PYdD1H7J5shAbuROKeBtPE126AfGwOhgecVIeqv87eHhiwKOXpHH0WF
X-Received: by 10.129.62.31 with SMTP id l31mr465301ywa.34.1523541769476;
        Thu, 12 Apr 2018 07:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523541769; cv=none;
        d=google.com; s=arc-20160816;
        b=D63lczz7KMiozYRjVa3hcucNpqEBEQE+130h7iYWys/2rKFXmUsAflbNu9WigN4gFA
         RntctGZb/xLCAdIn/1WQflSK4O20xKI+6cFKlZsW2OEhNgXu5awNkxp4A2vuCtmyE3eB
         e3qPFuqi3P9DH2IUgnrMiZIUqgOI+vPdsPJvl5P0NacQEKjEmyQn6zTqRYzeuPWXj+Ie
         nvIlEZ6UzreJolyCZpHLmwH6TanabUj9hf0F3CfFykeFArkSgNoZi7TBrekAwAQQacji
         JDEQlAZ3iC23QZK+lDX7RFFhe/csD3KmVbrK3nZUtIm7mlMyjtnHuqqTJLKnhHTCmoKn
         pAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=7BNJSD6kSyeAWy4h09Zdk1smEW1HMoxGmDgyTve+9EU=;
        b=f8UuL3yYXvwv50m852qT/lu4KcGTFjo0Kk/fldNoOohGISlYR1mA/qhWXlPQnn7b9z
         716GyDUVjAG+GfHR8QWdqiq4sc6DZ1Od3nQ2xbOLNVcCu468KtsxfUBnRHxE7dVQNAQO
         qaHdul4zX6iN3NbKgGJweMQMa0VKzeda5PDziLUYcB0O10igNvugpuC9zHmrnQ9wq6oZ
         gt7gGOKXmO3Oh2zi7eVoBVvTc1HLKD7cmPY4tAMVR5p9hzHYwetxBNBSjNupMHf3+bIO
         tjk8nrL9oF208CR/hRoRNdkm7C9tLWBlnErLzD7GOTF+DOq7tIyPv8jxjkVfjI11KsyA
         +IlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x94si1387062qte.94.2018.04.12.07.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 07:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6coL-00078O-0c
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 10:02:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f6co8-00077p-RA
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 10:02:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f6co4-0002zD-1R
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 10:02:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40790)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f6co3-0002uR-QG; Thu, 12 Apr 2018 10:02:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f6cnv-0000P0-0w; Thu, 12 Apr 2018 15:02:23 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 12 Apr 2018 15:02:22 +0100
Message-Id: <20180412140222.2096-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12] linux-user/signal.c: Put AArch64 frame
 record in the right place
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Richard Henderson <rth@twiddle.net>,
	Laurent Vivier <laurent@vivier.eu>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QF8IHTnYGATi

AArch64 stack frames include a 'frame record' which holds a pointer
to the next frame record in the chain and the LR on entry to the
function. The procedure calling standard doesn't mandate where
exactly this frame record is in the stack frame, but for signal
frames the kernel puts it right at the top. We used to put it
there too, but in commit 7f0f4208b3a96f22 we accidentally put
the "enlarge to the 4K reserved space minimum" check after the
"allow for the frame record" code, rather than before it, with
the effect that the frame record would be inside the reserved
space and immediately after the last used part of it.

Move the frame record back out of the reserved space to where
we used to put it.

This bug shouldn't break any sensible guest code, but test
programs that deliberately look at the internal details
of the signal frame layout will not find what they are
expecting to see.

Fixes: 7f0f4208b3a96f22
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I'm marking this as for-2.12 on the basis that it puts our frame
layout back to exactly what 2.11 had, and so seems safest.
No sensible guest code should really care, though, so this is
in the "only if we're doing an rc4" bucket; but I think that the
softfloat fixes deserve an rc4 anyway.

 linux-user/signal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 8d9e6e8410..e6dfe0adfd 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1843,6 +1843,12 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         layout.total_size += sizeof(struct target_aarch64_ctx);
     }
 
+    /* We must always provide at least the standard 4K reserved space,
+     * even if we don't use all of it (this is part of the ABI)
+     */
+    layout.total_size = MAX(layout.total_size,
+                            sizeof(struct target_rt_sigframe));
+
     /* Reserve space for the return code.  On a real system this would
      * be within the VDSO.  So, despite the name this is not a "real"
      * record within the frame.
@@ -1850,12 +1856,6 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     fr_ofs = layout.total_size;
     layout.total_size += sizeof(struct target_rt_frame_record);
 
-    /* We must always provide at least the standard 4K reserved space,
-     * even if we don't use all of it (this is part of the ABI)
-     */
-    layout.total_size = MAX(layout.total_size,
-                            sizeof(struct target_rt_sigframe));
-
     frame_addr = get_sigframe(ka, env, layout.total_size);
     trace_user_setup_frame(env, frame_addr);
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
-- 
2.16.2

