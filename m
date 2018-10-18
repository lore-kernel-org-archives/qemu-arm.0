Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2801240wrt;
        Thu, 18 Oct 2018 13:05:29 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63v1WrLSjHZ0PeXc+fbdl0kljSnaZMTWYzbDrnsDuiFeVmx9QFyKCGkXNQ0G0ZYtFptBJZ8
X-Received: by 2002:a0c:819c:: with SMTP id 28mr32269894qvd.7.1539893129169;
        Thu, 18 Oct 2018 13:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893129; cv=none;
        d=google.com; s=arc-20160816;
        b=ftauaMZ9cF5gk98JF8pkR5gMF6S4UznPAe32pQocWj/Ju5vz81jlDkYYFJd0N1ZsfB
         YOR31WgGHWKcgB9ENgPCBNDqVsfQlgSEQMJSOnC74jEnGmmgQjsu1qcGiKm0c9C8BRB8
         MVbkQxHzjnOF5nIcD5Tw80cvM7mOP2urq6IWoi8n53BYFm7E1WtFtzzaKcXp3JE5RDKt
         i/5xPpkBobZfV54uoP0dq5jxK7Lc+b0pOL8ogLGZnuK41U9XPll0e69iFPQQsIfcV4uB
         eY9bKBnlR6VjfgfbJ9yC/mW6I5uo3c4bSQkDqpDMbtTDULdCW7gO/o7cRdE2BA7aWI+c
         GUNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=yE85EZOglS0N0/DtuzqeOYjv1hfGEq9fCPU1Pco8ArI=;
        b=kXTqvlgEavD4w2CucAoVb5AFU1onI7PW1TFOIXGjg+s829ck6zR+eWuDMuw3jm1fsm
         JCu6h8PqsumCieXsiYwcx4hs/avt+ztNIuZHsc9zTDHbjDJqEmpbegr1BOG3ALGbSk5m
         Ep5osaPf+87eKTPTkDTvJ3HE7qRHT7tc/TOiwgCKVd2GM5mnaLF+hztBEM1wYCEG/sed
         akj3U7LpYXfSMq0K25PeH3gBE2FdyHMZsx1OaqiPbIlDQzK3LpS+7VrWD7jV+UNHbQhF
         xm/ut05qKKTCzMvfZl6qofNxEkyF3Atay/D0rZ8/sUKsU6zBMAoiIzfSjkOErtLDyc62
         fJcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i22si15789761qvg.194.2018.10.18.13.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44261 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEXw-0007m5-FM
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:05:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXO-0007Va-Vd
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXL-00070Q-Mx
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:04:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEXL-000703-GM; Thu, 18 Oct 2018 16:04:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94EC63001A52;
	Thu, 18 Oct 2018 20:04:50 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 080E660160;
	Thu, 18 Oct 2018 20:04:44 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:40 -0300
Message-Id: <20181018200422.4358-4-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Oct 2018 20:04:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 03/45] vl:c: make sure that sockets are calculated
 correctly in '-smp X' case
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GDjXhcAko0Fb

From: Igor Mammedov <imammedo@redhat.com>

commit
  (5cdc9b76e3 vl.c: Remove dead assignment)
removed sockets calculation when 'sockets' weren't provided on CLI
since there wasn't any users for it back then. Exiting checks
are neither reachable
   } else if (sockets * cores * threads < cpus) {
or nor triggerable
   if (sockets * cores * threads > max_cpus)
so we weren't noticing wrong topology since then, since users
recalculate sockets adhoc on their own.

However with deprecation check it becomes noticable, for example
  -smp 2
will start printing warning:
  "warning: Invalid CPU topology deprecated: sockets (1) * cores (1) * threads (1) != maxcpus (2)"
calculating sockets if they weren't specified.

Fix it by returning back sockets calculation if it's omitted on CLI.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-Id: <1536836762-273036-3-git-send-email-imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 vl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 027d04c7ca..2324321d91 100644
--- a/vl.c
+++ b/vl.c
@@ -1199,11 +1199,14 @@ static void smp_parse(QemuOpts *opts)
 
         /* compute missing values, prefer sockets over cores over threads */
         if (cpus == 0 || sockets == 0) {
-            sockets = sockets > 0 ? sockets : 1;
             cores = cores > 0 ? cores : 1;
             threads = threads > 0 ? threads : 1;
             if (cpus == 0) {
+                sockets = sockets > 0 ? sockets : 1;
                 cpus = cores * threads * sockets;
+            } else {
+                max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
+                sockets = max_cpus / (cores * threads);
             }
         } else if (cores == 0) {
             threads = threads > 0 ? threads : 1;
-- 
2.18.0.rc1.1.g3f1ff2140

