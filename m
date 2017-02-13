Received: by 10.25.77.65 with SMTP id a62csp898479lfb;
        Mon, 13 Feb 2017 06:46:24 -0800 (PST)
X-Received: by 10.200.39.200 with SMTP id x8mr21068070qtx.159.1486997184828;
        Mon, 13 Feb 2017 06:46:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i44si7380334qte.117.2017.02.13.06.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 06:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdHtW-0007nx-4H
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 09:46:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcF-0008Ec-MI
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:28:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcE-0005F0-H8
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:28:31 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cdHcE-0005C4-A7; Mon, 13 Feb 2017 09:28:30 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cdHc5-00014o-HG; Mon, 13 Feb 2017 14:28:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 Feb 2017 14:28:17 +0000
Message-Id: <1486996099-15820-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/4] cpu: Clarify TODO comment in
 cpu_generic_new()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 56xYHdIouUHo

The TODO comment in cpu_generic_new() suggests that we want to
move to having all callers do the parse_features work by hand.
In fact the intention is that we would prefer to have this
happen automatically via machine core work or similar common
code changes. In the meantime boards should use the
cpu_generic_new() wrapper rather than calling parse_features
themselves, because this means we only need to change one
place in future if we change how parse_features gets called.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Change based on email conversation with Eduardo...hopefully
I have understood the intention here correctly.
---
 qom/cpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/qom/cpu.c b/qom/cpu.c
index a783aec..eacce5e 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -80,8 +80,14 @@ CPUState *cpu_generic_new(const char *typename, const char *cpu_model)
 
     cc = CPU_CLASS(oc);
     featurestr = strtok(NULL, ",");
-    /* TODO: all callers of cpu_generic_init() need to be converted to
-     * call parse_features() only once, before calling cpu_generic_init().
+    /* TODO: we should really arrange to have parse_features() called
+     * only once, since it needs only to be called once per CPU class
+     * rather than once per instance of that class. Perhaps this would
+     * be done by changes to how machine core code works or by doing
+     * something in main(). In the meantime, board code should prefer
+     * to use this function rather than calling parse_features()
+     * manually, so that refactoring how we handle this is easier in
+     * future.
      */
     cc->parse_features(object_class_get_name(oc), featurestr, &err);
     g_free(str);
-- 
2.7.4

