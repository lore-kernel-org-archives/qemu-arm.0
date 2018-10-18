Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2839251wrt;
        Thu, 18 Oct 2018 13:39:35 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63Go6bJzzYI7Mmj78WCYF5gk2LyC84WcstW9k1N+XxcuIcAf2v15cFmcRymkGP21FbSJvKq
X-Received: by 2002:a37:93c3:: with SMTP id v186-v6mr30164813qkd.186.1539895174945;
        Thu, 18 Oct 2018 13:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539895174; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0sS9O80AX/+sJQcTnDX2EB5NBIMDQ3gumfI0z/5ZBTrWwWYvZotRFeFHqkwv1FFLZ
         jiROsiSp5HMvF4cXRiwSy9iQhTY2bQU8nArpO27nc97C6nFT9QmeWibobzw4sPVniQXD
         9V+4JPYjP2IjpOpLjfsYaMILg/gwsq0O/qSlRhS4naMna5FvUcuQZP6+S/CU+OqyPDyI
         GnCJ8lVapNoJESvqupjyVuGm1yMQ6ii6jo5mqCujmQYnJyciBXLtjRZ0wXL/CXSHsv9V
         xwWGWPlVGGDNCQHNDizam59gayONwB9D+tKu/KCYL7rBb0dZOfHiMPsFwwCGHWq3Jizh
         IZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=fPbu0RrE24kjoufASt2Yk7id5x42IlGDVzxhYENIfhM=;
        b=cEmVrudhUjcCcAktdsodhMJzkH2OcyMjBw1W882kDfy6vllG3atjrH2zdXz4cb/Y7/
         6Wl2fvj3c71TRdwH/TdQcMu4neYheIGW2hrG3pVMf04PcYJs+1uD2O9YgGvZJysvAWLw
         qGywljjnzJ9K7nhxfFNXALO1dehrYl1wnSzpvRrM3nYKA3gV42ZaHmOvJR47eYA8OZXT
         hU6fyNjTw5rHnskrgNh/w8O8hZATTwhHKGqda1aCUssajG+Uczsj13acGE5BzBKUUa+o
         +WmqUdjYu/F19s7j3P+aCzHwIES466k6NYp1VDlfhIv4ywXr6qFnIGmph/ChjKSPNova
         q3QA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c79-v6si16402782qka.3.2018.10.18.13.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDF4v-00040L-W6
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:39:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEcq-0004W7-QN
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:10:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEcl-0004dU-0U
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:10:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45282)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEcX-0004Wd-RX; Thu, 18 Oct 2018 16:10:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD2B4653C5;
	Thu, 18 Oct 2018 20:10:12 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A99D63BA1;
	Thu, 18 Oct 2018 20:10:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:22 -0300
Message-Id: <20181018200422.4358-46-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 18 Oct 2018 20:10:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 45/45] numa: Clean up error reporting in
 parse_numa()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6XlYz7GmPgjb

From: Markus Armbruster <armbru@redhat.com>

Calling error_report() in a function that takes an Error ** argument
is suspicious.  parse_numa() does that, and then fails without setting
an error.  Its caller main(), via qemu_opts_foreach(), is fine with
it, but clean it up anyway.

While there, give parse_numa() internal linkage.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20181008173125.19678-26-armbru@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/sysemu/numa.h | 1 -
 numa.c                | 8 +++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 7a0ae751aa..21713b7e2f 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -22,7 +22,6 @@ struct NumaNodeMem {
 };
 
 extern NodeInfo numa_info[MAX_NODES];
-int parse_numa(void *opaque, QemuOpts *opts, Error **errp);
 void parse_numa_opts(MachineState *ms);
 void numa_complete_configuration(MachineState *ms);
 void query_numa_node_mem(NumaNodeMem node_mem[]);
diff --git a/numa.c b/numa.c
index 1d7c49ad43..50ec016013 100644
--- a/numa.c
+++ b/numa.c
@@ -215,7 +215,7 @@ end:
     error_propagate(errp, err);
 }
 
-int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
+static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
 {
     NumaOptions *object = NULL;
     MachineState *ms = MACHINE(opaque);
@@ -239,7 +239,7 @@ int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
 end:
     qapi_free_NumaOptions(object);
     if (err) {
-        error_report_err(err);
+        error_propagate(errp, err);
         return -1;
     }
 
@@ -444,9 +444,7 @@ void numa_complete_configuration(MachineState *ms)
 
 void parse_numa_opts(MachineState *ms)
 {
-    if (qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, NULL)) {
-        exit(1);
-    }
+    qemu_opts_foreach(qemu_find_opts("numa"), parse_numa, ms, &error_fatal);
 }
 
 void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
-- 
2.18.0.rc1.1.g3f1ff2140

