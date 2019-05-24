Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2858215wrg;
        Fri, 24 May 2019 03:45:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz02jWZ7n4UTTUTTOJhpZj3hK3Rx9n7lnKoXsUgDigDzvCiq0J2kiSFFOWQUlNia+H90YZ9
X-Received: by 2002:a50:fb19:: with SMTP id d25mr102930875edq.61.1558694744549;
        Fri, 24 May 2019 03:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558694744; cv=none;
        d=google.com; s=arc-20160816;
        b=fsmu2n3Y1+WAn31Fe9Ms+Rngsgk2ezyuvwGUVv+65YyOsWjVfjkel3GA36Mna3LV5J
         NuH6kLGk+39ViE6dYW+NM+AQphnT6BVf9TaUUUWYJJrrQ0GRPP42CxXRJAWN5e66vxOF
         9Qa98JlWoKboMKXsq7PLGjgqKMalMgszZ88wUjujo2iWBoGLPSTpWtN0a+ekZvcjgka6
         IGzwqW2FuA4Goo8H41mqN59jETFZJc1dVbrgKftuD3jMfUJObMHAFVVFHTX0suN9p2xJ
         P7bYjjxxFjdjxE7Gz9RnuQsOnLgzna8YGAgF4KGjq4fEUEyU8lRfGpHVDtHiSspEhj2B
         +eHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=QwOjCePo4dmCKRGR10/w8Ewh7gCbdd4EVJ2R3R9TO0E=;
        b=kbRETczyVVjKYMEEItYu3uU/TJQ3LFXfqbGlUTtEPcIr6YXkEE2NKMjGVtjMe7jQoc
         oFDvV//h52N/DP2PwRNb357OyPanJ26RO30JagX/awwXk4w9GivOYYhz1yUFB8jiCTXl
         3zprTvuWxdo5pdJuQso15szvGccIrHpZQksfNHLSZR32FnSKZCWaq6DyUWerrAUsGA8v
         frxZtCIMppC8sqhV91eB9L3Hrbbx5b8BB700/1ylpd5NVkSm54W2Jeh3Rrzi/gcFrZUA
         AAfOKI05HyQ4s7ma6siVb7ntOuHA2FLAz8DBqRm+PpJxsa0iNjjCNKIgkzTnFYU376PC
         3qYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k39si1445375eda.333.2019.05.24.03.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 03:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hU7hn-0008N1-Ev
	for alex.bennee@linaro.org; Fri, 24 May 2019 06:45:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hU7h7-0008Az-8I
	for qemu-devel@nongnu.org; Fri, 24 May 2019 06:45:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hU7Y5-0004R8-WF
	for qemu-devel@nongnu.org; Fri, 24 May 2019 06:35:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hU7Y4-0004OG-PA; Fri, 24 May 2019 06:35:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F82D821D1;
	Fri, 24 May 2019 10:35:25 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.40.205.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C178868417;
	Fri, 24 May 2019 10:35:22 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 12:35:21 +0200
Message-Id: <20190524103521.13847-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 24 May 2019 10:35:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3] numa: improve cpu hotplug error message
 with a wrong node-id
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iJys8oumMWx3

On pseries, core-ids are strongly binded to a node-id by the command
line option. If an user tries to add a CPU to the wrong node, he has
an error but it is not really helpful:

  qemu-system-ppc64 ... -smp 1,maxcpus=3D64,cores=3D1,threads=3D1,sockets=
=3D1 \
                        -numa node,nodeid=3D0 -numa node,nodeid=3D1 ...

  (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=3D30,node-id=3D1
  Error: node-id=3D1 must match numa node specified with -numa option

This patch improves this error message by giving to the user the good
topology information (node-id, socket-id and thread-id if they are
available) to use with the core-id he's providing:

  Error: node-id=3D1 must match numa node specified with -numa option 'no=
de-id 0'

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v3: only add the topology to the existing message
        As suggested by Igor replace
          Error: core-id 30 can only be plugged into node-id 0
        by
          Error: node-id=3D1 must match numa node specified with -numa op=
tion 'node-id 0'
   =20
    v2: display full topology in the error message

 numa.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/numa.c b/numa.c
index 3875e1efda3a..7882ec294be4 100644
--- a/numa.c
+++ b/numa.c
@@ -458,6 +458,27 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **err=
p)
     set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
 }
=20
+static char *cpu_topology_to_string(const CPUArchId *cpu)
+{
+    GString *s =3D g_string_new(NULL);
+    if (cpu->props.has_socket_id) {
+        g_string_append_printf(s, "socket-id %"PRId64, cpu->props.socket=
_id);
+    }
+    if (cpu->props.has_node_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "node-id %"PRId64, cpu->props.node_id)=
;
+    }
+    if (cpu->props.has_thread_id) {
+        if (s->len) {
+            g_string_append_printf(s, ", ");
+        }
+        g_string_append_printf(s, "thread-id %"PRId64, cpu->props.thread=
_id);
+    }
+    return g_string_free(s, false);
+}
+
 void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **=
errp)
 {
     int node_id =3D object_property_get_int(OBJECT(dev), "node-id", &err=
or_abort);
@@ -470,8 +491,10 @@ void numa_cpu_pre_plug(const CPUArchId *slot, Device=
State *dev, Error **errp)
                                     "node-id", errp);
         }
     } else if (node_id !=3D slot->props.node_id) {
+        char *topology =3D cpu_topology_to_string(slot);
         error_setg(errp, "node-id=3D%d must match numa node specified "
-                   "with -numa option", node_id);
+                   "with -numa option '%s'", node_id, topology);
+        g_free(topology);
     }
 }
=20
--=20
2.20.1

