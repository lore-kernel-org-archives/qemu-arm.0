Received: by 10.223.172.38 with SMTP id v35csp7098874wrc;
        Tue, 12 Sep 2017 07:02:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBey5PgsFJI59PCwoCycTw6b/XEfx8NnDZDusZorRZvNJQvj5tmbXYmPnVMwF0ggCrMHyGg
X-Received: by 10.31.224.134 with SMTP id x128mr9642659vkg.1.1505224940203;
        Tue, 12 Sep 2017 07:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505224940; cv=none;
        d=google.com; s=arc-20160816;
        b=f7+6g6CDSgZEwPrXtfLJ1JWXBCSwepPcD6U++q5mLRUUym5zAxs0JoUbzcCa5PdXXJ
         IVne53AZp9wsvAvISshSUK4GAga1JWVwM2CFHrkrKsYNbwIJmOgYNzScNXR6nq9VDt+L
         vz9mW6gsCYkJzcVxUFe9Hh+qYRu2R/oarhrVuLgbTxAQyeFCAqrKrncLZ1g/UCbJ544c
         kAlmMTZ4B6+CmY5/edRIepga7ugcjGzAViTdc9f4AHtiHamKzn1TlZ/WhU/9VwrD7CuL
         F4WbQQyoPj5F25lKNgpu9Zw3cb0WHxTZzUGi0DtNKP9IStT5Cq8eH045Ohs0GabQVdlh
         Mjog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=kvY67EewbI06A6wpeyYe0DM0rMHjmOW6CyQjVCBQqIs=;
        b=ffJwTPJLq+IcKVF2HZeD8tcDzdG0QM6/heDGidBDRxhMVVZlBZPETYSQiz17FbRMEr
         0ZGlaiuEGYXlum6ohKAZ50QcKoyPYRj/A3tIt9yXOxiy52Jk1TjykyUhyQkd+v34W56E
         gI4U8CBj6LcFQH+ldTZdS00EwHck9oXNFvXyW2MVNQ6apxcYowPFXAaAhoxLqV1DoLmz
         LbjkJ5YBwufkryUFMB8f+JFG+9nxXKm1OvvSIxJS2vmQykH4lGd2bvCAedqcChc9Xvw0
         G407NW83a2ZWtvDxpfXIn/G3LY4ghFpaRQxrMqOLTaunRwnblZeNjnr6k8AJa5szag4G
         9qxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j29si6536564uab.380.2017.09.12.07.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 07:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drllZ-00068k-Ut
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 10:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drllM-000660-FN
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:02:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1drllD-0002PI-7n
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 10:02:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1drllD-0002Or-1q; Tue, 12 Sep 2017 10:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA4FC69070;
	Tue, 12 Sep 2017 14:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CA4FC69070
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-239.ams2.redhat.com
	[10.36.116.239])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1AD817DF4;
	Tue, 12 Sep 2017 14:01:50 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 16:01:46 +0200
Message-Id: <20170912140149.7692-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 12 Sep 2017 14:01:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 0/3] hmp: fix "dump-quest-memory" segfault
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
X-TUID: 8GFBH6IBXSZa

Fix aarch64 and ppc when dump-guest-memory is
used with none machine type and no CPU.

The other machine types don't have the problem.

Update test-hmp, to test none machine type
with (2 MB) and without memory, and add a test
to test dump-quest-memory without filter parameters
(it needs the fix from Cornelia Huck to work)

v3:
  - remove blank line after a comment
  - forbid memory dump when there is no CPU

v2:
  - add arm fix
  - update test-hmp

Laurent Vivier (3):
  hmp: fix "dump-quest-memory" segfault (ppc)
  hmp: fix "dump-quest-memory" segfault (arm)
  tests/hmp: test "none" machine with memory

 target/arm/arch_dump.c | 11 +++++++++--
 target/ppc/arch_dump.c | 11 +++++++++--
 tests/test-hmp.c       |  4 ++++
 3 files changed, 22 insertions(+), 4 deletions(-)

-- 
2.13.5

