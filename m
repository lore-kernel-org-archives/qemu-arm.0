Received: by 10.25.208.211 with SMTP id h202csp1721615lfg;
        Tue, 1 Mar 2016 08:37:34 -0800 (PST)
X-Received: by 10.140.99.72 with SMTP id p66mr27443869qge.16.1456850254041;
        Tue, 01 Mar 2016 08:37:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k93si31555494qgf.62.2016.03.01.08.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 08:37:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aanIj-00043d-I7
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 11:37:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aanIb-0003u2-TW
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 11:37:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aanIa-0001R4-Uu
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 11:37:25 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56051)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aanIY-0001Qd-Jj; Tue, 01 Mar 2016 11:37:22 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aanIX-0005pJ-2o; Tue, 01 Mar 2016 16:37:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 16:37:20 +0000
Message-Id: <1456850240-21096-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [RFC] linux-user: Use SIGRTMAX-1 for guest SIGRTMIN+1 to
	avoid conflict with host libc
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j1us8kwfyXmk

We already have a hack whereby we flip the guest's SIGRTMAX and SIGRTMIN
signals, to avoid a collision between guest use of SIGRTMIN and the host
libc use of it for SIGCANCEL. However newer glibc also uses SIGRTMIN+1
for internal purposes (as SIGSETXID). Reverse SIGRTMIN+1 and SIGRTMAX-1
so the guest can successfully use SIGRTMIN+1.

This didn't cause any immediately observed issues in guests because glibc
does not check the return value when it registers a SIGSETXID handler(!).
However it meant that if a guest program with more than one thread issued
a setuid() syscall it would hang.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is sent as an RFC because although I think it is the right thing
it is potentially enabling a bunch of glibc code that we weren't
even going to attempt to run before. Probably this just means a
different style of deadlock if you attempt setuid() calls in a
multithreaded process, though...

Does anybody actually have an idea about how the "manual signal
delivery multiplexed over a single host signal" would work?

 linux-user/signal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 962111c..487cc5f 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -75,8 +75,12 @@ static uint8_t host_to_target_signal_table[_NSIG] = {
     /* Nasty hack: Reverse SIGRTMIN and SIGRTMAX to avoid overlap with
        host libpthread signals.  This assumes no one actually uses SIGRTMAX :-/
        To fix this properly we need to do manual signal delivery multiplexed
-       over a single host signal.  */
+       over a single host signal.
+       Similarly we reverse SIGRTMIN + 1 and SIGRTMAX - 1, because
+       host glibc uses SIGRTMIN+1 for SIGSETXID. */
     [__SIGRTMIN] = __SIGRTMAX,
+    [__SIGRTMIN + 1] = __SIGRTMAX - 1,
+    [__SIGRTMAX - 1] = __SIGRTMIN + 1,
     [__SIGRTMAX] = __SIGRTMIN,
 };
 static uint8_t target_to_host_signal_table[_NSIG];
-- 
1.9.1

