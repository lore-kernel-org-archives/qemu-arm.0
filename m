Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp727303wro;
        Thu, 25 Oct 2018 06:47:54 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cUgAbjILiyIxj4+Bf/NIfHzfWDmem1MLwYyJ0PQN3ky7PZiwBSP7pdrWqgQbt/TrbU3Bk9
X-Received: by 2002:a0c:9c8c:: with SMTP id i12mr1614751qvf.122.1540475274017;
        Thu, 25 Oct 2018 06:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540475274; cv=none;
        d=google.com; s=arc-20160816;
        b=rIoWIE6sIfiMzd0j5raHsgDex1e/akMf0xcCtmZ6QA3BOjKOVDeF9gWZ24xarBmQhe
         7E6NZDVCJ+2oiqoBuC6sK4hgIxXStkK1kK8833G6hc4Agp/mXWeiyllD5By+B/Iy5X9C
         S1fSOlWFBYJE7JJDNACIbEnzFSGQXite7MgOv9CxgOAtD8VZe9LgNVYMOdrnoGjugx+5
         13lDq3y0Y+FPvDt3YsOKjUaM6ZPrB6keMQZTls96DRBqGGOoK0Uj0HSYjFZqEAwEKhUS
         RQlzidV+8CtVBvg8/RM6E77hCeJ+Lrn246kg05+JtVLujACMt/4WDuVZ/Z7KgmOGhRKQ
         EJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=sSMLpxOzlLaElkpl+MaoqAofsK04U1LBHbo661ShjFA=;
        b=uhHxutJ5eTYtqpq099HQK1UCTDhJpHnV3RX+zz2UQ+OMNnJ4sZMZ6FcxhZF3o3tdF3
         G8IaLWl7IdFV5/9DjEycn4pMRn6hMaAmCfNsTRc3bgm3UcRij43pegnmjL/eqIkC1Q3O
         LHtsUkvfRS2OU6zWGRM1F0UauN4Dr/8REqWPeUcLrI6oFCIT6FNx6CEgtHyoSS/xgIb6
         pKoIrm/XugHWrCKZBquo30R6Sxv9XR71cfMohCHMdtKeDJ86s8Mdxw96hfpeRCgKHKlP
         9N8RWv4AaFDA8B4XVCynDfh0AWc25k8jRdWLvYhi1ReqIvY8AIJfIh5q0TYs7ol+8eYa
         3nIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2-v6si6594687qkg.195.2018.10.25.06.47.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfzN-0005lt-F1
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:47:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmt-00026L-HJ
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfld-0006r6-Ho
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:33:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38190)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfld-0006md-9l; Thu, 25 Oct 2018 09:33:41 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBF2C3091D6F;
	Thu, 25 Oct 2018 13:33:34 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BD2610018FD;
	Thu, 25 Oct 2018 13:33:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:21 -0300
Message-Id: <20181025133301.16578-4-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 25 Oct 2018 13:33:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 03/43] vl:c: make sure that sockets are
 calculated correctly in '-smp X' case
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
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
X-TUID: OlSTaCihmly3

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
index 31febe965c..1fcacc5caa 100644
--- a/vl.c
+++ b/vl.c
@@ -1230,11 +1230,14 @@ static void smp_parse(QemuOpts *opts)
 
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

