Received: by 10.223.172.38 with SMTP id v35csp5601601wrc;
        Mon, 11 Sep 2017 07:21:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCPbS8OCvt5hBZQ0c1bHYg51IMigkQDyyu1bV7uuKTGeSSFhmNDihzUzrqsaT3OFl4xQpMu
X-Received: by 10.55.190.198 with SMTP id o189mr14551949qkf.103.1505139674872;
        Mon, 11 Sep 2017 07:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505139674; cv=none;
        d=google.com; s=arc-20160816;
        b=UxuJmoygMVJAkhBHhSzycg5PksPbd4FYvY9Tlh7bLnbKSXsdOLmlPMBUz/vWOxiRrt
         44v6PRPorhp9ceQkxRf9j2tMTIRNW59XM7ucNZN9lDY3mrM1ycp3m4mzqb6OvzwcFQht
         T4u3bhG8lcPhF2V30BRK4Rh3oq+BQhaTA6fimo6ZCg7Pbx6HJsxr66giCUPexW24Q0o1
         esDiFxMQVBpfLtxqvVZXJr5R0SGpfl/pNW+zdLZvtGpAryhnu3LSrQcVZi1H7p4Vl8Xb
         /oTx1BO7+A06iSksGeK2hSt6SvZwqz/Q8IrTjdM8QvgDSmbvpt0leXf0PbrvRxvhi6Sx
         pkCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=lxREdtv+GU1qBNFZDYriLG9iNTc5eIFwwcNZNrzGgi0=;
        b=iOriaZDUrvPxUt6iSicgfdUkMMS80ZgPGzN21tr6KpfQklz+YBx9Mzsi22xMypLIO9
         1LWOc7e0aEWOhIduHSOr+vYIaX8pNGqutaiMCDUwPKIBC3hSjVpSc7Lup8SDVneqYTAP
         jpU2yHKanJh9qpB246DMyt4yJcHD1ZHZ+ty1TqaXccRAP8A64LgPH+/rj8MyyWc3wnXe
         p79TzAI5iMoWod2yxd82bhQWsPsBSNMIBEBemqRzl8mn0HdAp96mClDbIt39YvgIbgbS
         m7cMZ7xSgyYkk5HcFqgV7r+E7Ix/j2CRtglPO0NQ8xCusduN5BqEF4A1AItaf4mC/EXE
         SHAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9si9340931qtf.106.2017.09.11.07.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 07:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPaK-0007Tp-IA
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 10:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drPaD-0007TC-M8
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:21:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drPa9-0001iR-SQ
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 10:21:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55352)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drPa9-0001ho-ML; Mon, 11 Sep 2017 10:21:01 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F0E3B8BB3;
	Mon, 11 Sep 2017 14:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9F0E3B8BB3
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-239.ams2.redhat.com
	[10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD95A649CC;
	Mon, 11 Sep 2017 14:20:57 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 16:20:53 +0200
Message-Id: <20170911142056.15643-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 11 Sep 2017 14:21:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/3] hmp: fix "dump-quest-memory" segfault
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
X-TUID: yG2REqmxtBwY

Fix aarch64 and ppc when dump-guest-memory is
used with none machine type and no CPU.

The other machine types don't have the problem.

Update test-hmp, to test none machine type
with (2 MB) and without memory, and add a test
to test dump-quest-memory without filter parameters
(it needs the fix from Cornelia Huck to work)

v2:
  - add arm fix
  - update test-hmp

Laurent Vivier (3):
  hmp: fix "dump-quest-memory" segfault (ppc)
  hmp: fix "dump-quest-memory" segfault (arm)
  tests/hmp: test "none" machine with memory

 target/arm/arch_dump.c | 52 +++++++++++++++++++++++++++++++++-----------------
 target/ppc/arch_dump.c | 17 +++++++++++------
 tests/test-hmp.c       |  5 +++++
 3 files changed, 50 insertions(+), 24 deletions(-)

-- 
2.13.5

