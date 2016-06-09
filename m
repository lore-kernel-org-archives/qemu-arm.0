Received: by 10.25.27.66 with SMTP id b63csp432066lfb;
        Thu, 9 Jun 2016 10:21:18 -0700 (PDT)
X-Received: by 10.200.40.197 with SMTP id j5mr11217888qtj.14.1465492878071;
        Thu, 09 Jun 2016 10:21:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t64si3924033qkt.220.2016.06.09.10.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 10:21:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB3dt-00015X-Dx
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 13:21:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bB3UF-0000a2-MM
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 13:11:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bB3U8-0007YO-Fs
	for qemu-arm@nongnu.org; Thu, 09 Jun 2016 13:11:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bB3U8-0007YK-A4; Thu, 09 Jun 2016 13:11:12 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBA093F720;
	Thu,  9 Jun 2016 17:11:11 +0000 (UTC)
Received: from Igors-MacBook-Pro.local.com (ovpn-204-90.brq.redhat.com
	[10.40.204.90])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u59HB4rW031581; Thu, 9 Jun 2016 13:11:09 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  9 Jun 2016 19:10:59 +0200
Message-Id: <1465492263-28472-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
References: <1465492263-28472-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 09 Jun 2016 17:11:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/6] target-i386: print obsolete warnings if
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
X-TUID: thaFMCSJIHCD

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 target-i386/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 947cf18..3f886a5 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -1979,9 +1979,15 @@ static void x86_cpu_parse_featurestr(CPUState *cs, char *features,
         /* Compatibility syntax: */
         if (featurestr[0] == '+') {
             add_flagname_to_bitmaps(featurestr + 1, plus_features, &local_err);
+            fprintf(stderr,
+                "'+%s' is obsolete and will be removed in future, use '%s=on'",
+                featurestr + 1, featurestr + 1);
             continue;
         } else if (featurestr[0] == '-') {
             add_flagname_to_bitmaps(featurestr + 1, minus_features, &local_err);
+            fprintf(stderr,
+                "'-%s' is obsolete and will be removed in future, use '%s=off'",
+                featurestr + 1, featurestr + 1);
             continue;
         }
 
-- 
2.7.0

