Received: by 10.25.0.144 with SMTP id 138csp186866lfa;
        Fri, 14 Apr 2017 01:40:54 -0700 (PDT)
X-Received: by 10.237.42.164 with SMTP id t33mr6910997qtd.105.1492159254281;
        Fri, 14 Apr 2017 01:40:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d133si1220319qke.206.2017.04.14.01.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 01:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cywmj-0000nA-OC
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 04:40:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjc-0006ob-5U
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cywjX-0008PQ-GF
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 04:37:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33582)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cywjX-0008OT-A7; Fri, 14 Apr 2017 04:37:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4638F19D22F;
	Fri, 14 Apr 2017 08:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4638F19D22F
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4638F19D22F
Received: from thinkpad.redhat.com (ovpn-116-243.ams2.redhat.com
	[10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE85160A99;
	Fri, 14 Apr 2017 08:37:31 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Apr 2017 10:37:17 +0200
Message-Id: <20170414083717.13641-5-lvivier@redhat.com>
In-Reply-To: <20170414083717.13641-1-lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 14 Apr 2017 08:37:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/4] qdev: remove
 cannot_destroy_with_object_finalize_yet
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
Cc: Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: znLQ9Qldn2sf

As all users have been removed, we can remove
cannot_destroy_with_object_finalize_yet field
from the DeviceClass structure.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/hw/qdev-core.h | 13 -------------
 qmp.c                  |  5 -----
 2 files changed, 18 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index b44b476..ac682a6 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -113,19 +113,6 @@ typedef struct DeviceClass {
      * TODO remove once we're there
      */
     bool cannot_instantiate_with_device_add_yet;
-    /*
-     * Does this device model survive object_unref(object_new(TNAME))?
-     * All device models should, and this flag shouldn't exist.  Some
-     * devices crash in object_new(), some crash or hang in
-     * object_unref().  Makes introspecting properties with
-     * qmp_device_list_properties() dangerous.  Bad, because it's used
-     * by -device FOO,help.  This flag serves to protect that code.
-     * It should never be set without a comment explaining why it is
-     * set.
-     * TODO remove once we're there
-     */
-    bool cannot_destroy_with_object_finalize_yet;
-
     bool hotpluggable;
 
     /* callbacks */
diff --git a/qmp.c b/qmp.c
index a744e44..ab74cd7 100644
--- a/qmp.c
+++ b/qmp.c
@@ -548,11 +548,6 @@ DevicePropertyInfoList *qmp_device_list_properties(const char *typename,
         return NULL;
     }
 
-    if (DEVICE_CLASS(klass)->cannot_destroy_with_object_finalize_yet) {
-        error_setg(errp, "Can't list properties of device '%s'", typename);
-        return NULL;
-    }
-
     obj = object_new(typename);
 
     object_property_iter_init(&iter, obj);
-- 
2.9.3

