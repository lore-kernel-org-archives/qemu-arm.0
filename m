Received: by 10.223.172.38 with SMTP id v35csp5602618wrc;
        Mon, 11 Sep 2017 07:22:01 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBs62L1ME4Ktpsqwa9Q1IvyYhaWOx/FZAoM5slic/27wFD+UcHkKNCZ+yC3JiDcPVzJhTAt
X-Received: by 10.200.55.83 with SMTP id p19mr15356476qtb.21.1505139721697;
        Mon, 11 Sep 2017 07:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505139721; cv=none;
        d=google.com; s=arc-20160816;
        b=BBrgUL81VgiuWNj8pIoic/7aTeZvxIXCoS8wb43OF0WqzjNMoJJUP9HPE9iWJAWy4l
         JrL2o8gvgrxxFiexGgpfaP6QrL4rW0+AoDGkcP0F3cyaBd5NROn9JSaBZAmYocRHRwCl
         Ja3OPtTEc5Z5VWzfuQzGzOb5odlxW45yuI+XqAq3vDj7MmT4wh9zp9qH3LX7qMOrM95R
         FEYN7t1g6ideTkz6bIdxk8TWft2XIOdPb+6bOB4b15+Jz5eKLXKfx9QKX6r0SkeEN1fd
         6OGhipLb9zNm5mxFUKjl/rhuh6PT/ZGXdBltBHGw73zg73YgAKJCw1oz2tTILvPuTI5A
         gSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=ydleV/iNe87OQVUTORBU5lJoB5Rp50/JiS85PVmByfs=;
        b=RxwsTNpQTULRZuK5gTg3OpLMPoge/Fdvomh0dz42XLrtOgcVmER6SCY3x6nvuRG4Va
         /S/ahb/3ITmwKostJMqvtO1W8U3KF4Wh0aj0GjUbtp8iTbk/0F7dyUbH2QuzOInmeGVa
         JibTGjCoAeK3kgmMQPBb5Z6GZv8bjuDiCkqSoFAU204aB17sKtXDu4S853JNl1iZDNXJ
         y8jpf1ldkXZoMRpEihXD14n2GxXFij8fK1UAn4SUM3v2S8FgnXn2tkZBbwBfSP3CvuoJ
         YCwLLmnswxeg9qK7i+VdzRHhUJ7au1A61XsVEhHztDybLC1Ngi7kdSWVdlCbTxlKDXmI
         60yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l23si1750140qtc.185.2017.09.11.07.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 07:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPb5-00087R-Bs
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 10:21:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drPaM-0007Xz-EI
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:21:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drPaJ-0001nd-Mu
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:21:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43984)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drPaJ-0001n8-Gd; Mon, 11 Sep 2017 10:21:11 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72962C5477;
	Mon, 11 Sep 2017 14:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 72962C5477
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-239.ams2.redhat.com
	[10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79F1719621;
	Mon, 11 Sep 2017 14:21:07 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 16:20:56 +0200
Message-Id: <20170911142056.15643-4-lvivier@redhat.com>
In-Reply-To: <20170911142056.15643-1-lvivier@redhat.com>
References: <20170911142056.15643-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 11 Sep 2017 14:21:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/3] tests/hmp: test "none" machine with memory
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rm49PIXmHhEv

and add a test case of dump-guest-memory without
"[begin length]" parameters.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/test-hmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/test-hmp.c b/tests/test-hmp.c
index 729c0339f7..90693c0ce2 100644
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
@@ -159,5 +160,9 @@ int main(int argc, char **argv)
 
     qtest_cb_for_every_machine(add_machine_test_case);
 
+    /* as none machine has no memory, add a test case with memory */
+
+    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
+
     return g_test_run();
 }
-- 
2.13.5

