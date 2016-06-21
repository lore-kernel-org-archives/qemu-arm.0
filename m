Received: by 10.25.21.96 with SMTP id l93csp1954229lfi;
        Tue, 21 Jun 2016 06:41:20 -0700 (PDT)
X-Received: by 10.200.56.184 with SMTP id f53mr29030476qtc.39.1466516480779;
        Tue, 21 Jun 2016 06:41:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s69si52235774qka.43.2016.06.21.06.41.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 06:41:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFLvc-0007SF-6Q
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 09:41:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bFLfM-0006nc-5M
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 09:24:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bFLfH-0003qd-23
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 09:24:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bFLfG-0003qU-Su; Tue, 21 Jun 2016 09:24:26 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F6AA3B730;
	Tue, 21 Jun 2016 13:24:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5LDOO9b018541; Tue, 21 Jun 2016 09:24:25 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 Jun 2016 15:24:17 +0200
Message-Id: <1466515457-253194-1-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465492263-28472-5-git-send-email-imammedo@redhat.com>
References: <1465492263-28472-5-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 21 Jun 2016 13:24:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/6] fixup! cpu: use
 CPUClass->parse_features() as convertor to global properties
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
Cc: peter.maydell@linaro.org, rth@twiddle.net, qemu-arm@nongnu.org,
	ehabkost@redhat.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E0ScJV7S30bv

make sure that -cpu features converted to global properties
will not be ignored and QEMU exits with error as it used to
in case feature couldn't be applied.

fixup is on top of:
 [PATCH v2 00/10] globals: Clean up validation and error checking

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 qom/cpu.c         | 1 +
 target-i386/cpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/qom/cpu.c b/qom/cpu.c
index b34c4a0..a9727a1 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -314,6 +314,7 @@ static void cpu_common_parse_features(const char *typename, char *features,
             prop->driver = typename;
             prop->property = g_strdup(featurestr);
             prop->value = g_strdup(val);
+            prop->errp = &error_fatal;
             qdev_prop_register_global(prop);
         } else {
             error_setg(errp, "Expected key=value format, found %s.",
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 212d552..0f0a3f3 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2024,6 +2024,7 @@ static void x86_cpu_parse_featurestr(const char *typename, char *features,
         prop->driver = typename;
         prop->property = g_strdup(name);
         prop->value = g_strdup(val);
+        prop->errp = &error_fatal;
         qdev_prop_register_global(prop);
     }
 
-- 
1.8.3.1

