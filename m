Received: by 10.223.172.38 with SMTP id v35csp1106553wrc;
        Wed, 13 Sep 2017 07:23:15 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC/5X9msWYrz62di+Z5r7LVbfSv4io9RNoB3PHJBy/omAV3jXSzComkjWHc6j3OBCKGJMN1
X-Received: by 10.55.10.76 with SMTP id 73mr23418344qkk.205.1505312595394;
        Wed, 13 Sep 2017 07:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505312595; cv=none;
        d=google.com; s=arc-20160816;
        b=SRoRqD3ZP7I+bbpiFEY/W6Y3NQ8iwcrAp98J05SdZe8RnvWzoQ7ajdb+qaulYIl+hY
         JzrDzI8sriY/P0pO1ZrKcVoK3dA1QBzkY3YaDnMBSR1w7n8qX6QXuhb+7ipEufumHOAo
         bauAD+hm90BPvB9bXDyfSqo30i72lIdCVDC0AMe7AOj3SPzd1BADjS45m+iP7gwPvcnI
         qxYuJFkPlTBlq13Ts6P4icIUqX/Dt1tm7mJClqP0w89MG6c6w3XEuFunjT7ae+4jtoXv
         Qk5NvZ9VP+QCH1pzjEXYvnylKUvzAZFlrUaNcriDZp20GCL69CkhQ7apdWeHKeNSH/0M
         vFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=s96DRnmz9dQl5BwoHttcvfLR3wu5qgM3Tvzvk4PRS6c=;
        b=NCPyuOkGYAGKyFRZZmEWKXM9frJ4gdT9SUCEjANU7rPgQ353tDQuUirUM9wz2uvLov
         QyihY0kfdeQjnlirhTHdULRvkFB5/aFkucQj0w6P/KjKPco+d4pROTNIssSNejvweZV4
         +ZJRffBkOGww4tFtImCyvMcwZg5BTnOeDvnS0TrkwfkCFbUFMtA/JkWxmpV5Tx+RECc3
         XoWcRQvKbKwIrWKItYk6HjZV3wPPBCRaYqealMLuG+cVz0RkB0Z8V1hUUnaLvnUM1Hhg
         W/TSqi6E+KGOGoEQcptqlrdIBWXyiGCJqB7+mQ2vRI4n4dyu1bSveUTNpo1n+PxvD4Yb
         GC5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29si15300204qtk.103.2017.09.13.07.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 07:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds8ZM-0006HQ-UQ
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 10:23:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8XJ-0004jc-Pt
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 10:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8XD-0003Yr-Rv
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 10:21:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ds8XB-0003VR-Fx; Wed, 13 Sep 2017 10:20:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A1AD4A6FC;
	Wed, 13 Sep 2017 14:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8A1AD4A6FC
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1039D17F58;
	Wed, 13 Sep 2017 14:20:51 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 16:20:36 +0200
Message-Id: <20170913142036.2469-5-lvivier@redhat.com>
In-Reply-To: <20170913142036.2469-1-lvivier@redhat.com>
References: <20170913142036.2469-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 13 Sep 2017 14:20:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 4/4] tests/hmp: test "none" machine with
 memory
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /hWsGRUQLsCr

and add a test case of dump-guest-memory without
"[begin length]" parameters.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/test-hmp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/test-hmp.c b/tests/test-hmp.c
index 729c0339f7..d124e81850 100644
--- a/tests/test-hmp.c
+++ b/tests/test-hmp.c
@@ -35,6 +35,7 @@ static const char *hmp_cmds[] = {
     "mouse_button 0",
     "device_del mouse1",
     "dump-guest-memory /dev/null 0 4096",
+    "dump-guest-memory /dev/null",
     "gdbserver",
     "host_net_add user id=net0",
     "hostfwd_add tcp::43210-:43210",
@@ -159,5 +160,8 @@ int main(int argc, char **argv)
 
     qtest_cb_for_every_machine(add_machine_test_case);
 
+    /* as none machine has no memory by default, add a test case with memory */
+    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
+
     return g_test_run();
 }
-- 
2.13.5

