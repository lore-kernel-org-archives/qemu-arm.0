Received: by 10.25.27.66 with SMTP id b63csp1557158lfb;
        Mon, 6 Jun 2016 08:45:10 -0700 (PDT)
X-Received: by 10.140.232.137 with SMTP id d131mr17154372qhc.87.1465227910543;
        Mon, 06 Jun 2016 08:45:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h58si12427921qth.93.2016.06.06.08.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 08:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9wiE-0000JI-05
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 11:45:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wHA-0000V9-7d
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH8-0006yU-BC
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 11:17:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wH8-0006yQ-5D; Mon, 06 Jun 2016 11:17:10 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0B05C00EB0F;
	Mon,  6 Jun 2016 15:17:09 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtn1013155; Mon, 6 Jun 2016 11:17:08 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:48 +0200
Message-Id: <1465226212-254093-7-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 06 Jun 2016 15:17:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 06/10] target-i386: print obsolete warnings if
 +-features are used
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vSbpNJO9UOpk

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target-i386/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index f791a06..31e5e6f 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1975,6 +1975,9 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                 error_propagate(errp, local_err);
                 return;
             }
+            fprintf(stderr,
+                "'+%s' is obsolete and will be removed in future, use '%s=on'",
+                featurestr + 1, featurestr + 1);
             continue;
         } else if (featurestr[0] == '-') {
             add_flagname_to_bitmaps(featurestr + 1, minus_features, &local_err);
@@ -1982,6 +1985,9 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
                 error_propagate(errp, local_err);
                 return;
             }
+            fprintf(stderr,
+                "'-%s' is obsolete and will be removed in future, use '%s=off'",
+                featurestr + 1, featurestr + 1);
             continue;
         }
 
-- 
1.8.3.1

