Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2802085wrt;
        Thu, 18 Oct 2018 13:06:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63w2Sbrta+CTxiP+W5wJznk6Q2+B13DFMvV4IYhevB1ogjqW4qdzS4VeOkZ66xs1UmIluBF
X-Received: by 2002:a37:37d5:: with SMTP id e204-v6mr29694286qka.1.1539893167596;
        Thu, 18 Oct 2018 13:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893167; cv=none;
        d=google.com; s=arc-20160816;
        b=Yd41CjmTGlHg21+dWApTwdqQxrp/8tAc4YNCFbRwYefUQH/gRStVokqSw0QFw0IZnC
         ojLTufxZ7SnRsXDdUYZqi+6yEYG7bIiQ+vLih0MRiWJEvSPCnE6l4kEWWmlTX+Jvl7qo
         XYIybIpkMy5HwzYgknMYQsGik/PvLY5HlL5tGtvQCQX/AjMBijV1e/1Z3vWvwcL0wOs9
         Mj3zvnFVqJJ9eheJ096zAxoa5TT9DNeG10BakT5sdgkQ87KQuDFHS7UutIchqWaZrfvn
         dOhenuqmCFlQQn3WJrwreX4/y4I922FwzC5Zi/m8bsFQlxVqoI06sc4jGvk+2KH4nCKh
         QBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=FCe12gnvOmhM4ytyOpHdG6+aAye6cjf9YHQzJ/FTHfo=;
        b=b1K3rC4+iE904geydxiS9cUI8Ovcyb4SWjKW2FJyL2W9TXOFOwp8J1v0ta8tVnNw25
         Q+bBqZQ4RJANwqB/wDROWMyITKFm+wyKulWKkptDi/+6NhMn2y0QJ4C1OfsfeX03tDHD
         elN0RAHEriGhCrHkF5GpWfpfsqS5E5R21XkfxqcEr31B8JPmkSY2BXYpoKPw0VJ6Ik9B
         JZ1+1v3YSqjULnDfRZ9OlMkMJMgqinDrGATHOmZA8hx5nlDrHNqJ1HDac2g35qhYohLp
         gKcJmWK62WPVhiUjjpvM+TXAewNpnbrJs0o9YFRvl/SzHlyeEC3LtqhLashSWtj+YWhf
         8i2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f17-v6si2327967qte.179.2018.10.18.13.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEYY-0008Ji-Qw
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:06:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXU-0007Zw-Nz
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXT-0007IN-8Y
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEXS-0007GS-Vl; Thu, 18 Oct 2018 16:04:59 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1565F7DD2D;
	Thu, 18 Oct 2018 20:04:58 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3979D1974F;
	Thu, 18 Oct 2018 20:04:52 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:41 -0300
Message-Id: <20181018200422.4358-5-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 18 Oct 2018 20:04:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 04/45] numa: Fix QMP command set-numa-node error
 handling
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
X-TUID: O3a6npWWrwRv

From: Markus Armbruster <armbru@redhat.com>

Calling error_report() in a function that takes an Error ** argument
is suspicious.  parse_numa_node() does that, and then exit()s.  It
also passes &error_fatal to machine_set_cpu_numa_node().  Both wrong.
Attempting to configure numa when the machine doesn't support it kills
the VM:

    $ qemu-system-x86_64 -nodefaults -S -display none -M none -preconfig -qmp stdio
    {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 3}, "package": "v3.0.0-837-gc5e4e49258"}, "capabilities": []}}
    {"execute": "qmp_capabilities"}
    {"return": {}}
    {"execute": "set-numa-node", "arguments": {"type": "node"}}
    NUMA is not supported by this machine-type
    $ echo $?
    1

Messed up when commit 64c2a8f6d3f and 7c88e65d9e9 (v2.10.0) added
incorrect error handling right next to correct examples.  Latent bug
until commit f3be67812c2 (v3.0.0) made it accessible via QMP.  Fairly
harmless in practice, because it's limited to RUN_STATE_PRECONFIG.
The fix is obvious: replace error_report(); exit() by error_setg();
return.

This affects parse_numa_node()'s other caller
numa_complete_configuration(): since it ignores errors, the "NUMA is
not supported by this machine-type" is now ignored, too.  But that
error is as unexpected there as any other.  Change it to abort on
error instead.

Fixes: f3be67812c226162f86ce92634bd913714445420
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20181008173125.19678-15-armbru@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 numa.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/numa.c b/numa.c
index 81542d4ebb..1d7c49ad43 100644
--- a/numa.c
+++ b/numa.c
@@ -60,6 +60,7 @@ NodeInfo numa_info[MAX_NODES];
 static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
                             Error **errp)
 {
+    Error *err = NULL;
     uint16_t nodenr;
     uint16List *cpus = NULL;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -82,8 +83,8 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
     }
 
     if (!mc->cpu_index_to_instance_props || !mc->get_default_cpu_node_id) {
-        error_report("NUMA is not supported by this machine-type");
-        exit(1);
+        error_setg(errp, "NUMA is not supported by this machine-type");
+        return;
     }
     for (cpus = node->cpus; cpus; cpus = cpus->next) {
         CpuInstanceProperties props;
@@ -97,7 +98,11 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
         props = mc->cpu_index_to_instance_props(ms, cpus->value);
         props.node_id = nodenr;
         props.has_node_id = true;
-        machine_set_cpu_numa_node(ms, &props, &error_fatal);
+        machine_set_cpu_numa_node(ms, &props, &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
     }
 
     if (node->has_mem && node->has_memdev) {
@@ -367,7 +372,7 @@ void numa_complete_configuration(MachineState *ms)
     if (ms->ram_slots > 0 && nb_numa_nodes == 0 &&
         mc->auto_enable_numa_with_memhp) {
             NumaNodeOptions node = { };
-            parse_numa_node(ms, &node, NULL);
+            parse_numa_node(ms, &node, &error_abort);
     }
 
     assert(max_numa_nodeid <= MAX_NODES);
-- 
2.18.0.rc1.1.g3f1ff2140

