Received: by 10.28.71.155 with SMTP id m27csp537932wmi;
        Thu, 22 Mar 2018 09:13:20 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv1RqNOEMpNvjaH4ItMEADmzQ8DcJdTS3vCbdyqu+fO6uES8oVyZAGVlASunHcyqyYZtjNU
X-Received: by 10.55.78.212 with SMTP id c203mr36042378qkb.351.1521735200737;
        Thu, 22 Mar 2018 09:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521735200; cv=none;
        d=google.com; s=arc-20160816;
        b=re/YJEs0qKH3QAm4aQyKrCEb5O8TVnnHt3XG6GcLa4H6i70cZLNDl5vnxvG1Q6jzq+
         bjkvMyt8rslkCjFKo/w1NX2qs59Hs915T9pRwzQB0Yzm0Zw8PVUu0bVtwAL30MICeS19
         GcJ3ybKLI4Pffa43PqeSKBNHSUylqeEeJtNeQ32u7QHJRYiYPDLv07ixdLK71d+YT4aj
         4IuhbAfDoZSZW2eXt/RelrnxKCRo/3GeDRCCUxwM0agfk9NM82dWCjMPjghJjRbwJMRV
         1Epid7BQd6MpfryezPJPdf0CvRRhZ0Fj1OV94j9GnZ2grnugSzc1veYurV9qlxhW3GQN
         graQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5yIlqNKxGZkXwcHDhcc8Lsh7bvqd033a/fOQR/KgZ/M=;
        b=NJeuIouyg+m6Ajopah7rnO3mHTuk/RZrkO6UDL1Sq/0nOCbwSQcgPxkHXNiFgCxCvD
         +4VjW6YihzF6ev97o+OK4fXX3SO/UukoEwgJpMVbL5C/hqQjOyelYx3+lX/rUKvjFzte
         xVt0SZSMxykLoeyhY4E0u5rLiSEmT3PodNOr5reCv6IPJdq30Io9FMwT+4C6sASiiA7b
         da+OZ98W5TBtehCk4fsPjSfVYVR7DQfHCddSo1yKkBvF+2PIXzFj/ruUaO2qMV6HoynG
         7HdJnQa2rBB1J7uxG22u3XT4QtdEf9KkQmtQBJhtzjAPjVa2UpBZcAq17krdaQGQnPZy
         +FfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5si8056026qkf.67.2018.03.22.09.13.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:13:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez2q8-00022c-3U
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:13:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2pi-0001oV-CA
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2pe-0007E3-Hb
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:12:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51164 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ez2pe-0007Dq-Ca; Thu, 22 Mar 2018 12:12:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D24FE818595A;
	Thu, 22 Mar 2018 16:12:49 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 468F72023230;
	Thu, 22 Mar 2018 16:12:42 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Mar 2018 17:12:24 +0100
Message-Id: <20180322161226.29796-3-lvivier@redhat.com>
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 16:12:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 16:12:49 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 2/4] error: Remove NULL checks on
 error_propagate() calls
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
X-TUID: r7KdzMaJ/2GC

Re-run Coccinelle patch
scripts/coccinelle/error_propagate_null.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 io/channel-websock.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/io/channel-websock.c b/io/channel-websock.c
index ec48a305f0..e6608b969d 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -586,9 +586,7 @@ static gboolean qio_channel_websock_handshake_io(QIOChannel *ioc,
         return TRUE;
     }
 
-    if (err) {
-        error_propagate(&wioc->io_err, err);
-    }
+    error_propagate(&wioc->io_err, err);
 
     trace_qio_channel_websock_handshake_reply(ioc);
     qio_channel_add_watch(
-- 
2.14.3

