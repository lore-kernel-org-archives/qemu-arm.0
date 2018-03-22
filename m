Received: by 10.28.71.155 with SMTP id m27csp537443wmi;
        Thu, 22 Mar 2018 09:12:54 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtl6hZs8jQOJ3Cwn6tucm08Sg+ujFaXVOY1uK7OcpvF9vEbpP/b2LUue7VQYLexjsVeJ1kR
X-Received: by 2002:a25:6c1:: with SMTP id 184-v6mr8781642ybg.272.1521735174728;
        Thu, 22 Mar 2018 09:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521735174; cv=none;
        d=google.com; s=arc-20160816;
        b=VmKASdvWVfimWg7W4vsb/dkp22N2uwJErsvSkC2R3EwUsBCehiSuwL1J1mskIZcD4c
         RYQ92Yjk9og8eO3QAZhu4mIIBO22jBPHmegXqdwkhK8ILY2T7B2T6v3MMvFhq2+L4xJf
         ygbX7lrZX6WgoNTcJ+ufStM3pWHgWXZ9YaCMEQpfwGNu+oKly7AtMwQ7vV+zgio/Kb2g
         36FxhzCAFEywx6k0Omeaxa2qQO8FaQcDXrUs4Dms876Y4Fpiaa3jNJ9i0WCye0NlHquE
         OxrtZrwSBQj23Ke/byKG3kmuucEsC0CTTwRd5NizcNIjDvCDuNi5lO265DjjuRL9H2vT
         qTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=QAKxRH68/K3El4fcATV+M1QDY9hxj1IN7Py/hTJ4mNY=;
        b=lfeEy+m3UPf+PhIahpHZ4Rm497IXvOGm194TTUTKXMWpifFP/MFQ2KSomhQR0LeqEw
         vYUrRHQgBU+nVMbj5SgZbygWvCBn4qUr8xGigD53maYYnHlzHedXFfyS8jVa9h9RASEd
         i5gu3xGW/ptU70O7r+fkMN0F8g4WtjafqttaDeWVO23re2jPUfxRxq2VcKPUVKh74cgH
         L+RgJBkswzK+S8HvjD8i3E6Wq6t9HieL+2LR9dVruyrASbKsG8lBaJZLN5LyeeHYimsW
         nWMDsiIv+rdDqJPkjiWt2pi9BYUyOjHQqL0nYaKkfWVCiHg9G9EQBSnqxfzhORrnLYbi
         +9vA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si5299115qth.467.2018.03.22.09.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez2pi-0001eu-4U
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:12:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2pV-0001ds-FJ
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:12:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2pR-0006uP-Cz
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:12:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49268 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ez2pR-0006tE-6o; Thu, 22 Mar 2018 12:12:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0DB90722D0;
	Thu, 22 Mar 2018 16:12:36 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB1E72023230;
	Thu, 22 Mar 2018 16:12:27 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Mar 2018 17:12:22 +0100
Message-Id: <20180322161226.29796-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 22 Mar 2018 16:12:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 22 Mar 2018 16:12:36 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 0/4] coccinelle: re-run scripts from
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
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ldWoOSaRyrm1

I've re-run some scripts from the coccinelle directory,
and they have found some problems.

This series fixes them.

Laurent Vivier (4):
  error: Strip trailing '\n' from error string arguments (again again)
  error: Remove NULL checks on error_propagate() calls
  qdict: remove useless cast
  Remove unnecessary variables for function return value

 accel/tcg/translate-all.c                          |  5 +-
 block/nvme.c                                       | 11 ++---
 block/quorum.c                                     |  6 +--
 hw/arm/exynos4210.c                                |  7 +--
 hw/block/vhost-user-blk.c                          |  5 +-
 hw/hppa/dino.c                                     |  5 +-
 hw/misc/mos6522.c                                  |  6 +--
 hw/net/ftgmac100.c                                 |  5 +-
 hw/ppc/pnv_lpc.c                                   | 14 +-----
 io/channel-websock.c                               |  4 +-
 io/net-listener.c                                  |  6 +--
 monitor.c                                          |  2 +-
 target/i386/hax-darwin.c                           | 10 ++--
 target/i386/hvf/hvf.c                              | 24 +++++-----
 target/mips/dsp_helper.c                           | 15 ++----
 target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
 target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
 target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
 target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
 .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
 target/xtensa/translate.c                          |  5 +-
 tests/m48t59-test.c                                |  6 +--
 tests/test-thread-pool.c                           |  6 +--
 util/uri.c                                         |  5 +-
 24 files changed, 94 insertions(+), 269 deletions(-)

-- 
2.14.3

