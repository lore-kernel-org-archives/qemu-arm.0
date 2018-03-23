Received: by 10.28.71.155 with SMTP id m27csp551514wmi;
        Fri, 23 Mar 2018 07:32:29 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvD7WmQCLvh4tGa9SiTcBmTakisVhwAF1KLpGw50m2HYikGCOf9M64JyYKx/LlLrFoO+LSH
X-Received: by 10.237.57.5 with SMTP id l5mr36868913qte.200.1521815549387;
        Fri, 23 Mar 2018 07:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521815549; cv=none;
        d=google.com; s=arc-20160816;
        b=hbpr69mwdP3w5WUhDHjhVBRUSHHvti9CTl9fx1lTfF3HsyHSlZE8senh3fHLz5tH21
         /yzlPc76jgOK02fITcDm7eh/jtwFC0qw2HKJ5INoLygVbcMYcRv5aCqQPBf7VeAEUMEL
         sflPRzJQcmYkj3FcunaVcq7ur/v36wErS820J2RI4DTji+E1GpRxEBMGYzELqrvfv+CI
         7boR/dmT9SfsJWIV1c387XNF2Yf+5AYSNsci1f2IcOkTAKNfHKReBf6BNJ59zqzx0mwf
         qH+yI8/I/jLMi/Cltxrhhrr/GaILOfqkWfgY17KM+MHs4gr9PmM37xDIW8LmpF634v0K
         sn/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=q4DPA+m8J7edAMYX+TBdcjUgd6gbdEufqwAib3i81yc=;
        b=mRZHe+Qzu5Bi4bheiSvZAw50wnwRmsRi3KUbVa/plEUyKmL7Am/lGWXiKvwul8QsMd
         HEQfap9MfPpCaCDuKcrOpmh44cWtEwnMT3pWsLK6IOpo8ozXev4uT6O4SyGKuBBx31eP
         +RLJMMuIjfsgsDh+GSWphxvS5gl4CDrrORGd1cYj8Kw8VeFDU9zP2lyD9vqaYzXsbkeO
         ypYe37DPnkC6tNkrZlZd3uv0xzD/JwZ5xgU4hFDxKoUW+A3euELdJBaFBDoryAWMmmQA
         5ljED+X+Gwzt7AZIy/47Fj/jCI7+ZB+PEqL5DgclamY8Wt3yoYzv24wQzr13pX1XJZC5
         tkDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b97si3466625qkh.406.2018.03.23.07.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 07:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezNk4-0003wJ-UG
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 10:32:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNjr-0003w1-L0
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNjn-00031E-Nd
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:15 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50602 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezNjn-00030P-JO; Fri, 23 Mar 2018 10:32:11 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0F5077068;
	Fri, 23 Mar 2018 14:32:10 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF072023233;
	Fri, 23 Mar 2018 14:32:02 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Mar 2018 15:31:57 +0100
Message-Id: <20180323143202.28879-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:11 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 0/5] coccinelle: re-run scripts from
 scripts/coccinelle
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLeCc2MPhNZe

I've re-run some scripts from the coccinelle directory,
and they have found some problems.

This series fixes them.

v2: only change PATCH 4/4
  - keep comments
  - fix indentation
  I didn't remove changes in autogenerated files as it
  seems they are generated only once.

Daniel P. Berrang=C3=A9 (1):
  make: improve check for stale generated files in source dir

Laurent Vivier (4):
  error: Strip trailing '\n' from error string arguments (again again)
  error: Remove NULL checks on error_propagate() calls
  qdict: remove useless cast
  Remove unnecessary variables for function return value

 Makefile                                           | 29 +++++++----
 accel/tcg/translate-all.c                          |  5 +-
 block/nvme.c                                       | 11 ++---
 block/quorum.c                                     |  6 +--
 hw/arm/exynos4210.c                                |  6 +--
 hw/block/vhost-user-blk.c                          |  5 +-
 hw/hppa/dino.c                                     |  5 +-
 hw/misc/mos6522.c                                  |  8 +---
 hw/net/ftgmac100.c                                 |  5 +-
 hw/ppc/pnv_lpc.c                                   | 16 ++-----
 io/channel-websock.c                               |  4 +-
 io/net-listener.c                                  |  6 +--
 monitor.c                                          |  2 +-
 target/i386/hax-darwin.c                           | 10 ++--
 target/i386/hvf/hvf.c                              | 24 +++++-----
 target/mips/dsp_helper.c                           | 15 ++----
 target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------=
------
 target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------=
------
 target/xtensa/core-de212/xtensa-modules.c          | 48 +++++-----------=
---
 target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
 .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
 target/xtensa/translate.c                          |  7 +--
 tests/m48t59-test.c                                |  6 +--
 tests/test-thread-pool.c                           |  6 +--
 util/uri.c                                         |  5 +-
 25 files changed, 117 insertions(+), 280 deletions(-)

--=20
2.14.3

