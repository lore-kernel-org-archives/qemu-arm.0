Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp688251wrg;
        Sat, 15 Jun 2019 09:03:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbBPo1EbF2VA/XBkGTE8T+s5b362I2yLKVHCnc7kZnq9s6mCwWGCqdmhriHK7m98ugLNpH
X-Received: by 2002:a0c:df8a:: with SMTP id w10mr2839944qvl.140.1560614606832;
        Sat, 15 Jun 2019 09:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560614606; cv=none;
        d=google.com; s=arc-20160816;
        b=GgRhwpmLvwIioLK+3jFHZ4GV8rXh43gxo38NuLpKy5utqU3qneTlxrssJz5a4hmVxn
         IV3kI1ywP/crAs4VvsLDP83QXNApbzU9aScvIS5LinuyeEaZiaJk3x3AvC3Qb3Za5L31
         BWaDDk8JfuthXrJzHJ+y7jfIj2zcatpGF5gL3X8GnP/7s1Vans5o08ZoUlslb3cbhum4
         lQtKaB0DP0BU21gDnTyOSjh8im5ESNKVKxaJ/VWbfAUX3Zmb1FQTAtus9dlWAMktIswL
         MYYUpnfXYKeN9gk5/QXzHPVaraxwjHPaJGdjT9iNabLTTMSd6G6MErVqQCVcheeG0B33
         BxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Oz9B2AwP3waKHsmdHUl/lCo4Sj1itIhfYqhu5lNdPyI=;
        b=b1ec1See8GilrkFYTkA93BBqdgnAy/3faLMq1QyNQF6X084HyL/kOuD3bdW1lvL14W
         F0YAaVaIvcp7Ykd6LkB3CkXoJdnVl6F5Xm9xIA8+Ju3bPQR+cUoUEq2oDd1HIeTP4h0W
         OS0fkhQl95Zk5L+H5gPhWv9+pc62EWHM4VFYbqR07RyZVPlOT9t8qwBr37jYwqP1H3ZN
         5r7DIraRqmdxStUADKq3pSlnOgx/WBSkmjHhAHOS/hovHUpxh+L35vxGzy+siuG8Daf+
         yVv8LssR4AQRu5El9NI+WHAwjNyDeRpZ/NXd9WH1N6Tyq6u7FcA4viUwA112fT5JesvQ
         N34Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j46si4066692qtj.287.2019.06.15.09.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 09:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcB9K-0002cj-3j
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 12:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36123)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcArL-0004Wv-AJ
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:44:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcArK-0001pX-A5
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:44:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52312)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcArH-0001eC-Sf; Sat, 15 Jun 2019 11:44:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 251BD37E88;
 Sat, 15 Jun 2019 15:44:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7BA21001B05;
 Sat, 15 Jun 2019 15:44:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:51 +0200
Message-Id: <20190615154352.26824-23-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Sat, 15 Jun 2019 15:44:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC PATCH v2 22/23] target/arm: Restrict semi-hosting
 to TCG
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sfAXqJcLhK1m

Per Peter Maydell:

  semihosting hooks either SVC or HLT instructions, and inside KVM
  both of those go to EL1, ie to the guest, and can't be trapped to
  KVM.

Let check_for_semihosting() return False when not running on TCG.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8b7ce0561b..a3843a5508 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -20,7 +20,6 @@
 #include "qemu/crc32c.h"
 #include "qemu/qemu-print.h"
 #include "exec/exec-all.h"
-#include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "hw/semihosting/semihost.h"
 #include "sysemu/cpus.h"
@@ -30,6 +29,9 @@
 #include "qapi/qapi-commands-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
+#ifdef CONFIG_TCG
+#include "arm_ldst.h"
+#endif
=20
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable =
*/
=20
@@ -8270,6 +8272,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *=
cs)
=20
 static inline bool check_for_semihosting(CPUState *cs)
 {
+#ifdef CONFIG_TCG
     /* Check whether this exception is a semihosting call; if so
      * then handle it and return true; otherwise return false.
      */
@@ -8345,6 +8348,9 @@ static inline bool check_for_semihosting(CPUState *=
cs)
         env->regs[0] =3D do_arm_semihosting(env);
         return true;
     }
+#else
+    return false;
+#endif
 }
=20
 /* Handle a CPU exception for A and R profile CPUs.
--=20
2.20.1

