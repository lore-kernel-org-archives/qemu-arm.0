Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp9504674pjq;
        Wed, 29 May 2019 09:08:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxy089BBfLaBafRyz14t7yn/R1aKCn1FceEN654ptNJKs/HBbYZRhf5O1zd5zYV/eKglIOF
X-Received: by 2002:a37:f50f:: with SMTP id l15mr5961953qkk.343.1559146102241;
        Wed, 29 May 2019 09:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559146102; cv=none;
        d=google.com; s=arc-20160816;
        b=crY1wkuXTD8r8W0B9hdxLp/ROvmpXQ9zYt1bliKeCgKH0RnMnKoH0qr4oFwM9AppLx
         ATIv6eNQU+UBVzP4s2FiSHEyrWMo0FE/zHDMN5kMeWKRjUt816t3j26eLIcXQ0x043i/
         2SIGDG3Ix3rVR5/KYE0w6m30zf4cR1sIAQFmmaZvJ0fIsMsphyR1KtAlmrLTAU0h+Qja
         9C5YxtJhjEvz5kr1L5Kuq4/yFLRxdQJW0OJa67sP4AUIqicw0DQLMqFVEZxaUH3ZVESw
         NgzNrDWtOV+ZYWfc3kSYXNDOTQ6FZY9wd0zzA83FjOMj2wCiJ8x+1FgVtMMmsnr090Wo
         jjVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=oZq08cQExjLD+NcLNNaPK5sAr4cwlMIldabQsXw0u2o=;
        b=yhGBYKcnfDrwobclHGl8dfDMbBRG3RZZgbMKBXpC0bONjkOsbiwUTdZKsKwLwxBngN
         OARYF8vs0XYtzNr+YWJdvCOAxVKAkmOFjnyEuO7ulza+KK+LxcyyHL/jFihkFB4aNwu1
         h0tICl60oeQqtgCxkRCKpXQkT7Q3n7Blh09RVFnbKXE/x09zjstu7y5RPKO5t1vAxRjO
         386Ubu0UbINOWABHKGZSjbw1L7CcfeEKpFPUK05UKOqD0uK9kZV8ocf5z/kTP1NGM7SQ
         y7acBlKTwfeCX9kzDbYzFQOWnvoAhWw/rbvjRPbILZqwKXs8ttn4F2UiVFvClXvsAqVL
         NGKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u56si3119367qtb.382.2019.05.29.09.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 May 2019 09:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:57405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hW17l-0001gc-Nt
	for alex.bennee@linaro.org; Wed, 29 May 2019 12:08:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hW17b-0001gM-8x
	for qemu-arm@nongnu.org; Wed, 29 May 2019 12:08:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hW17W-00020A-6q
	for qemu-arm@nongnu.org; Wed, 29 May 2019 12:08:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46570)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hW17V-0001zV-2t; Wed, 29 May 2019 12:08:06 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6969B307D97F;
	Wed, 29 May 2019 16:07:58 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-181.brq.redhat.com
	[10.40.204.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F5521001DD8;
	Wed, 29 May 2019 16:07:53 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 18:07:47 +0200
Message-Id: <20190529160747.778-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 29 May 2019 16:08:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4] numa: improve cpu hotplug error message with
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
X-TUID: /QTCiy84J0JZ

On pseries, core-ids are strongly binded to a node-id by the command
line option. If an user tries to add a CPU to the wrong node, he has
an error but it is not really helpful:

  qemu-system-ppc64 ... -smp 1,maxcpus=3D64,cores=3D1,threads=3D1,sockets=
=3D1 \
                        -numa node,nodeid=3D0 -numa node,nodeid=3D1 ...

  (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=3D30,node-id=3D1
  Error: node-id=3D1 must match numa node specified with -numa option

This patch improves this error message by giving to the user the good
node-id to use with the core-id he's providing

  Error: invalid node-id, must be 0

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v4: simplify the message
   =20
    v3: only add the topology to the existing message
        As suggested by Igor replace
          Error: core-id 30 can only be plugged into node-id 0
        by
          Error: node-id=3D1 must match numa node specified with -numa op=
tion 'node-id 0'
   =20
    v2: display full topology in the error message

 numa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/numa.c b/numa.c
index 3875e1efda3a..955ec0c830db 100644
--- a/numa.c
+++ b/numa.c
@@ -470,8 +470,8 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceS=
tate *dev, Error **errp)
                                     "node-id", errp);
         }
     } else if (node_id !=3D slot->props.node_id) {
-        error_setg(errp, "node-id=3D%d must match numa node specified "
-                   "with -numa option", node_id);
+        error_setg(errp, "invalid node-id, must be %"PRId64,
+                   slot->props.node_id);
     }
 }
=20
--=20
2.20.1

