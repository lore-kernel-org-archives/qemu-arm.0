Received: by 10.28.4.212 with SMTP id 203csp2768189wme;
        Mon, 16 Apr 2018 08:19:58 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48erYgS5rZoLEIZz0xx2gyF2SBNL44a7GgkJzS6GlS1p+JEkxVZ4Gs26IECnweT3HRBpSJJ
X-Received: by 10.55.160.142 with SMTP id j136mr5894676qke.225.1523891998812;
        Mon, 16 Apr 2018 08:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523891998; cv=none;
        d=google.com; s=arc-20160816;
        b=W5PoIhVzveP2dDyGWUGXfFs+1g9iP1osojrY9/MzbueT4/GLCwipiYpF/FMLfG1NyU
         8mBJHygQbbdkaMiMS682q1plt+HWK9rhx8Ym75ETiz/pE+ZlkHbRHZx05y7xmsWq4P6M
         ymBqlDA5US0Kpb5T7aZBYe3Yy4Y3zZkaeN9vJ682JHxPkHJgqFoBgPXMKWoxCnZIT7Ob
         eVXw0LZ95vlOIW/S2IpDgRgvSF0aRuRRp8RqfZphpkwRvIFV8pKwiqUUmnGwKFTRcQJ3
         8T+1LfazxZzbJO4o3mPpup/f5YDriexFrVP0oeoji4y5Ab/epxsT3IIaC0jvDdqVve2l
         HZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=42uJ75OkQJU2R2VTVrE3sL3sD1EhC5JUcTwuJvYd2QU=;
        b=AXpN2mZX9qMGaDpqntdlwL9uruZeTSdkJqiH4WnvO8Rak09nWgxNKitRalCe6qk6OU
         nGMkfIeAcVB1nQI5WR5nJ7yBXnMZCrwfi0E6BGrfFqrANNcCfaBPx6o9sCqs+jxNDvCx
         dWMq4gYrmAXm4E0sJTLlOPXIsMQNqa1NavlusvzqRB7h4OD71ciJYd5FeR6TyAQTsm30
         NMZJwSK8/cnRRygiR8qSIv4fB3Arl+PyhO6YyifR/CZl4ze7fRHgtg/gIr0voyfZwmsp
         hHSn1cZLSU1IsXAnhniBPoc+Kcy4ZmSJn5Z7dP2D36uScTYmIk8FUt5BcZmG7mDTzbNO
         9nUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si388877qkr.63.2018.04.16.08.19.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 08:19:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f85vB-0004wY-JR
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 11:19:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f85uu-0004pe-3o
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 11:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f85uo-00088D-8W
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 11:19:40 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f85uo-00084b-1b; Mon, 16 Apr 2018 11:19:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f85ue-0002Kg-U0; Mon, 16 Apr 2018 16:19:24 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 16 Apr 2018 16:19:23 +0100
Message-Id: <20180416151923.22588-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [prefix=PATCH for-2.12?] linux-user: check that all of
 AArch64 SVE extended sigframe is writable
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
Cc: Richard Henderson <rth@twiddle.net>, Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L+IrUfC50co8

In commit 8c5931de0ac7738809 we added support for SVE extended
sigframe records.  These mean that the signal frame might now be
larger than the size of the target_rt_sigframe record, so make sure
we call lock_user on the entire frame size when we're creating it.
(The code for restoring the signal frame already correctly handles
the extended records by locking the 'extra' section separately to the
main section.)

In particular, this fixes a bug even for non-SVE signal frames,
because it extends the locked section to cover the
target_rt_frame_record. Previously this was part of 'struct
target_rt_sigframe', but in commit e1eecd1d9d4c1ade3 we pulled
it out into its own struct, and so locking the target_rt_sigframe
alone doesn't cover it. This bug would mean that we would fail
to correctly handle the case where a signal was taken with
SP pointing 16 bytes into an unwritable page, with the page
immediately below it in memory being writable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The requirements to trigger the bug sound implausible, except
that the stack page might be unwritable because we just
executed some trampoline code from it, so perhaps not so
unlikely as it first seems? Not sure whether to put into 2.12
or not...
---
 linux-user/signal.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index e6dfe0adfd..b283270391 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1858,7 +1858,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     frame_addr = get_sigframe(ka, env, layout.total_size);
     trace_user_setup_frame(env, frame_addr);
-    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
+    frame = lock_user(VERIFY_WRITE, frame_addr, layout.total_size, 0);
+    if (!frame) {
         goto give_sigsegv;
     }
 
@@ -1904,11 +1905,11 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         env->xregs[2] = frame_addr + offsetof(struct target_rt_sigframe, uc);
     }
 
-    unlock_user_struct(frame, frame_addr, 1);
+    unlock_user(frame, frame_addr, layout.total_size);
     return;
 
  give_sigsegv:
-    unlock_user_struct(frame, frame_addr, 1);
+    unlock_user(frame, frame_addr, layout.total_size);
     force_sigsegv(usig);
 }
 
-- 
2.17.0

