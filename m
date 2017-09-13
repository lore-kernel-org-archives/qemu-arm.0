Received: by 10.223.172.38 with SMTP id v35csp1104411wrc;
        Wed, 13 Sep 2017 07:21:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBOYR/NreZz0ujO7GqAIG3sR8qv1PI03MBwFfpDgCZ+wwG6FUZbqUtceMphzJ51SwHCcQpW
X-Received: by 10.55.32.138 with SMTP id g132mr17069178qkg.122.1505312473275;
        Wed, 13 Sep 2017 07:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505312473; cv=none;
        d=google.com; s=arc-20160816;
        b=aWzQfx9dBL73IsIq7Os0BfsiGA5dDABzam4PSP+Xtv6o1CFwTNcbVO45M+BHL20SSH
         ukdcl7wSTj753HDaytMe3yxL1hH7Rm7ake19mgDKYuM4X4tfYwvSpRyurFGbV9YBS+fM
         L+is5hlmvw3J9xuKp0OFhlRCu1jCiR6a9SUgzUSXV7hkxDN4Fkd/GppdToHpR6GjOCKz
         ZF5ojoP0+L0d350l0WRfCY+a9/Ioru6E88LBX8Eyj8Wq7PUQJqvgFmgtlhFqU0mHAhS0
         rnwStR6gx96Tg2d8MynpdZMcD4ZRq5si4vU2L8wzQQrcYQMrViwibUAdZhi+5JQsYoRI
         MnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=e6ch8uoXdPLqgNmyK0Z8R1gRjj6szySUhrrzNtcXtrA=;
        b=yOTkjmMwWL2GFbyy2cjAatCfcpokLci/LO0vT8GlHsoXYF0BynbCd101LgELkgZslE
         MyspG2SZ3+PTr0aYHYbq09sdQGICqAgXAFldQcg7GiZZdd1n56eZ52Bb7TcRsqK2o+XV
         5RRuf1SkyC+ChGr/rlA3JlZp9B/uNzH+spPcGEHNEPg1YTpv418eXkbJvLDYe0wmSHLF
         LDa7yfOkEw28nWlQ+WdDJ7FSAhfdHc2d7VRxAeAdktQQqdeUINC82qknw6OXLPOi07OG
         mxI+HjIzcBD78dAA/a9JEGtrw90b/yu/pS7FQx/ddFM33UequR2j2mhANcp8c3lupxmB
         IQaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 80si4711891qkx.495.2017.09.13.07.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 07:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds8XP-0004dl-1D
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 10:21:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8X1-0004Zr-Fd
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:20:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8Ww-0003LA-LR
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:20:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54604)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ds8Ww-0003KN-6w; Wed, 13 Sep 2017 10:20:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE302C0587E5;
	Wed, 13 Sep 2017 14:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EE302C0587E5
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A2466062A;
	Wed, 13 Sep 2017 14:20:37 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 16:20:32 +0200
Message-Id: <20170913142036.2469-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 13 Sep 2017 14:20:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 0/4] hmp: fix "dump-quest-memory" segfault
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
	Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3bM6qQ7XJpn9

Fix aarch64 and ppc when dump-guest-memory is
used with none machine type and no CPU.

The other machine types don't have the problem.

Update test-hmp, to test none machine type
with (2 MB) and without memory, and add a test
to test dump-quest-memory without filter parameters

v4:
  - update comment in test-hmp.c
  - add cohuck's patch

v3:
  - remove blank line after a comment
  - forbid memory dump when there is no CPU

v2:
  - add arm fix
  - update test-hmp

Cornelia Huck (1):
  dump: do not dump non-existent guest memory

Laurent Vivier (3):
  hmp: fix "dump-quest-memory" segfault (ppc)
  hmp: fix "dump-quest-memory" segfault (arm)
  tests/hmp: test "none" machine with memory

 dump.c                 |  6 ++++++
 target/arm/arch_dump.c | 11 +++++++++--
 target/ppc/arch_dump.c | 11 +++++++++--
 tests/test-hmp.c       |  4 ++++
 4 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.13.5

