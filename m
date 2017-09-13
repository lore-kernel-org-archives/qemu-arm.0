Received: by 10.223.172.38 with SMTP id v35csp1107304wrc;
        Wed, 13 Sep 2017 07:24:01 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDPOJ4NrdwK65onJMCNZaoJ9nFA6JYjHBA79K+Z6cBY2G+Zzp8qaXgJOulUk7/0M9kU4FO0
X-Received: by 10.233.216.134 with SMTP id u128mr6746997qkf.127.1505312641529;
        Wed, 13 Sep 2017 07:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505312641; cv=none;
        d=google.com; s=arc-20160816;
        b=P4RRtJRwy36RgGI+T+QhQcFV7cBQjyA/sQpVWPJaUvBcNFMjH2l7Wqjkbl6pMiCTp3
         dBzbe1LozgbiPO9sPTeRDMXck7cdPpLR+giaTc+WcRILBnA7hlHYTgKW4qYxv6K8w7lm
         CmjZhOLtkw9ebliNKNX1awmfVM1vK420vsOjpsqGA+Fde0qGRR6Hilj03A9lynx0NH+D
         2p4vowx6lwPZ1wm//5Ft2oFUXYPm/HEFzcHZmI5IYrOT8UY0g4qJaGTHMbOeRpd6Ni2L
         dhx+YgVZlFv8Fah2pCTlZuVplWbFkES5egmFLjmurybkjXd8vqmVMYbMCVvhq8m6YJsW
         aZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=/kYyBPLOsZnQXZKmMNQz+LlaYtKYXL2aVeyn/QmiGZc=;
        b=ve5omy7iXnhfbkDgqD8Fda1kdOurS4nAXND3tvsqSt8VmjaRAZyV5o5n733PMPLHy6
         433fJuD/1Zu6zihA3H2vh48S1YkSHbmmYrmrxgPKKRncA25AJr2XdIkif/A19fMDY/c9
         Ojh72EqvDtfWfJ2LtwMQiL9pfdh0QramRauqM5fGlfennHUggvVErt+ZW+UFFKuKHNIa
         gV83e3fNC+yyLTyNPeTPDrnCFWgdgzWK6X3KA7DXMmaZBTSFVCgISONetY9ZuDzpbOso
         IVvlf+Rk0oVg7cLSbwvBn5jQaoRMmEbvl1EyvXT1Hhrs+siZJw5hxO9Gpi+jdZ90rMt1
         UHeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v65si14325029qkd.289.2017.09.13.07.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 07:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds8a7-0007Oz-7T
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 10:23:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8XA-0004cr-He
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8X6-0003Rk-O4
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:20:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ds8X6-0003RA-Hs; Wed, 13 Sep 2017 10:20:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DE69C04B94B;
	Wed, 13 Sep 2017 14:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9DE69C04B94B
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2096F993;
	Wed, 13 Sep 2017 14:20:47 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 16:20:35 +0200
Message-Id: <20170913142036.2469-4-lvivier@redhat.com>
In-Reply-To: <20170913142036.2469-1-lvivier@redhat.com>
References: <20170913142036.2469-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 13 Sep 2017 14:20:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 3/4] dump: do not dump non-existent guest
 memory
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Xd1uWLf40Rq

From: Cornelia Huck <cohuck@redhat.com>

It does not really make sense to dump memory that is not there.

Moreover, that fixes a segmentation fault when calling dump-guest-memory
with no filter for a machine with no memory defined.

New behaviour is:

(qemu) dump-guest-memory /dev/null
dump: no guest memory to dump
(qemu) dump-guest-memory /dev/null 0 4096
dump: no guest memory to dump

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 dump.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/dump.c b/dump.c
index a79773d0f7..d2093e141b 100644
--- a/dump.c
+++ b/dump.c
@@ -1536,6 +1536,12 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     fprintf(stderr, "DUMP: total memory to dump: %lu\n", s->total_size);
 #endif
 
+    /* it does not make sense to dump non-existent memory */
+    if (!s->total_size) {
+        error_setg(errp, "dump: no guest memory to dump");
+        goto cleanup;
+    }
+
     s->start = get_start_block(s);
     if (s->start == -1) {
         error_setg(errp, QERR_INVALID_PARAMETER, "begin");
-- 
2.13.5

