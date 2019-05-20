Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp308849wrg;
        Mon, 20 May 2019 08:30:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNq6rlmDQbpm9v2lluydmo/AlaKhHJNUnJdmhz6Zxpp/zggH1cKrcSAex2koT7977kGJw0
X-Received: by 2002:a50:b797:: with SMTP id h23mr67598773ede.197.1558366205385;
        Mon, 20 May 2019 08:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558366205; cv=none;
        d=google.com; s=arc-20160816;
        b=Tiw9uNQvpJXh1Y1Xn5iA4wHrG7dLeBfh8R229NtCL/I8uehTGty79MTrkp5AKrDsSx
         sEx7jFHpD2J8ZcL8ekaZs5bl5LPUq/xQ6mg0UFu2ALnb+CLDCAc6REKaP/N8+6aEE3mE
         7LhroQv++YH/U5lLBwx11ln6GNrtPc/3XyqyZRKRga5G+/Mh9sA3Xu8L9E+0NYST53sa
         IUjcWA7AXVDtsDa5VK4gUwXIhE3kMj4VKmpmqjVYAI+wFASY1MDW1H14Gy2t9/3vRYps
         +06qLvm9KDY8MEc4Sogjl1foFX3U6fCIxyu6XvT649Ftyd78o92/7vCEjH0w5rh6b5J9
         zCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=C++gch5+PTKE4I/wDsrfL7X6jGFa+HevsnMQ/RPYofM=;
        b=lzZg84LaXZPoPOU13k6ZmvWqwJFr6DzZ9AsISJn3ijtQIeOKtRf5P5FBqHWV6b7stx
         dPb0Hk1sE/3dgBeRgbhbcf2YXNHE7PjPEQuSAD7uTvPpi/MCaZDwduvhKCJucuH0ADaq
         YJtcjWEKlxThCpUsmP9K5QpUzF6t5MZdePIy9ITc7A2YfnHbl6K3XH9xfbw21Eyb7UiA
         HKCEFfQm5xFEcqLMeuJ63PCfIjJrLDfDn4emdyEesPRybaQALIvhSr2ukkS2uJdWTiPH
         ROAqFt8fdr95kK8008B+YjK/w5gfsvZKZdM9Qp8r0LgtHbNMKV0VPpWB96dCxxS9LIjV
         GY7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si456407ejk.50.2019.05.20.08.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 08:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSkEm-00012I-AB
	for alex.bennee@linaro.org; Mon, 20 May 2019 11:30:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hSkEG-0000oW-Qw
	for qemu-arm@nongnu.org; Mon, 20 May 2019 11:29:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hSkEF-0004W2-Qj
	for qemu-arm@nongnu.org; Mon, 20 May 2019 11:29:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hSkEF-0004Uw-Ki; Mon, 20 May 2019 11:29:31 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 480375D61E;
	Mon, 20 May 2019 15:29:25 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.40.205.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA42219C68;
	Mon, 20 May 2019 15:29:22 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 17:29:21 +0200
Message-Id: <20190520152921.15959-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 20 May 2019 15:29:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] numa: improve cpu hotplug error message with a
 wrong node-id
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
X-TUID: 6o/ERGNJl4JF

On pseries, core-ids are strongly binded to a node-id by the command
line option. If a user tries to add a CPU to the wrong node, he has
an error but it is not really helpful:

  qemu-system-ppc64 ... -smp 1,maxcpus=3D64,cores=3D1,threads=3D1,sockets=
=3D1 \
                        -numa node,nodeid=3D0 -numa node,nodeid=3D1 ...

  (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=3D30,node-id=3D1
  Error: node-id=3D1 must match numa node specified with -numa option

This patch improves this error message by giving to the user the good
node-id to use with the core-id he's providing:

  Error: core-id 30 can only be plugged into node-id 0

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 numa.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/numa.c b/numa.c
index 3875e1efda3a..c419c5b5b8ee 100644
--- a/numa.c
+++ b/numa.c
@@ -470,8 +470,9 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceS=
tate *dev, Error **errp)
                                     "node-id", errp);
         }
     } else if (node_id !=3D slot->props.node_id) {
-        error_setg(errp, "node-id=3D%d must match numa node specified "
-                   "with -numa option", node_id);
+        error_setg(errp,
+                   "core-id %"PRId64" can only be plugged into node-id %=
"PRId64,
+                   slot->props.core_id, slot->props.node_id);
     }
 }
=20
--=20
2.20.1

