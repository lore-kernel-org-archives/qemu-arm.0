Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1091444wrg;
        Tue, 21 May 2019 00:34:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8TfI9g6eC7/wMuOBvAtLtKVLKVUgovo7n614DnZVDmzOhKTb+GDMB8nS/XPlm7qmYatFq
X-Received: by 2002:a17:906:5048:: with SMTP id e8mr7349606ejk.91.1558424085526;
        Tue, 21 May 2019 00:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558424085; cv=none;
        d=google.com; s=arc-20160816;
        b=jIkQiaFBzu6R3RqPUrPs2F2eTblfgV+ktscqXbxPX3poAhjEz8Yxt6W/LaPEi5k+M/
         SAKy2kEGh5TTrVL+FAK4xmQ/YFjpvL1dYMjdQjoeKuCE8LJsXXZBpY8p5ggMhOuUhBvb
         sJ1avv5etWnLgJEypMORAatC7luptAzbdpkpHKJ347ai1G+B3p8LZW7a5hf4tMIQcpyA
         poWN7bdbDWaagek9ulxp5wWxkxFf4ELDR7tDCrl57oNUEK61fDgOY4PvC40P6MfOVmT5
         GkWW2Q9C2GC0OBBjr8XeBepuE6EwldWN/UAUrBu0tWmZefjwmGF61ciy42/DucC3333U
         PEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=+WaH4SO5SMJoFoYxfLmng7WoLuQbUpVRQzVhedHZfYQ=;
        b=U5GX59r6itsLUVjO1qZkbYLkJ6hyEDe3FDWswGJzct2P84vsNhPnPe7xbEu2ySAeHc
         ySiT/2BWbAQtXXcIyeVrxAY+GeuYb2bcHoYR4HF2fhbxxSWDdm8QxSt/H+nCsHk/abe2
         y1xd2VqsQH52/f8HmuVyIHUtFefQsKu8ijiXPwrC2l8+kT1Z/s2bTJaBSU5X7gn1b63M
         1nv/xfKCQdeQHut+Yd0FSApo0nobRuu6A2RB28T3XdhgOPTmVf76wlsi6aSW2wLgLxr0
         zY3zuCGzPIcppmPrGwAT/FZWoay4QRVA/p2WQvdvrjPQ/FjXt//H1QA7p3XxjYe7v4Lx
         a4ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y55si4075659edc.231.2019.05.21.00.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 May 2019 00:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSzIK-0006zV-I0
	for alex.bennee@linaro.org; Tue, 21 May 2019 03:34:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hSzI3-0006oi-Hf
	for qemu-arm@nongnu.org; Tue, 21 May 2019 03:34:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hSzI2-0002rO-Gr
	for qemu-arm@nongnu.org; Tue, 21 May 2019 03:34:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hSzI2-0002ZJ-BJ; Tue, 21 May 2019 03:34:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6844D7FDC9;
	Tue, 21 May 2019 07:33:55 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.40.205.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDD621001E6F;
	Tue, 21 May 2019 07:33:49 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 21 May 2019 09:33:48 +0200
Message-Id: <20190521073348.29657-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 21 May 2019 07:34:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] numa: improve cpu hotplug error message with
 a wrong node-id
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g47pXfzfmFTf

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

  Error: core-id 30 can only be plugged into node-id 0

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v2: display full topology in the error message

 numa.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/numa.c b/numa.c
index 3875e1efda3a..7413f821e2bb 100644
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
@@ -470,8 +491,11 @@ void numa_cpu_pre_plug(const CPUArchId *slot, Device=
State *dev, Error **errp)
                                     "node-id", errp);
         }
     } else if (node_id !=3D slot->props.node_id) {
-        error_setg(errp, "node-id=3D%d must match numa node specified "
-                   "with -numa option", node_id);
+        char *topology =3D cpu_topology_to_string(slot);
+        error_setg(errp,
+                   "core-id %"PRId64" can only be plugged into %s",
+                   slot->props.core_id, topology);
+        g_free(topology);
     }
 }
=20
--=20
2.20.1

