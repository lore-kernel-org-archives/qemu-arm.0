Received: by 10.28.71.155 with SMTP id m27csp551975wmi;
        Fri, 23 Mar 2018 07:32:57 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtOjfF+Ilx5OPLMvCZzoFRyN+EG1JCe7JoiTNbZfjhGcoVhiRz4rtBDZUGcX2ji2HX6m2+x
X-Received: by 10.200.32.153 with SMTP id 25mr41343960qtd.274.1521815576885;
        Fri, 23 Mar 2018 07:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521815576; cv=none;
        d=google.com; s=arc-20160816;
        b=qgQ4YurDpEdz/YwI5eq91PcI6yvptVie9fe369Nak5z5T9vVikmWTOCRKl/pSi1mFl
         ArMX0LV4cnTx2LeUHDT6vZRdlTGp4HHKXyABhxU23zemRjx0+UbQH8OkopHc+589yluV
         BgixdeSxZ4zzzw8PHTOi6dyoOuO/yggQb3xW3+Qnw6wxa116Bx+wtDMGGOerRXeu2xAr
         xs+B01M6Y/GSINRFdDUhr+jPOJ2y7Si+hZ7Frzi3GD6bT1HLskneqv9v78MFeOyAYCSo
         VHnJEt/9WjAGYhRrRm7dWKpk0+/Lw0XtAyb0pLTKUSsqpVBsVvabBxtJZebxtUHNqh32
         KdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5yIlqNKxGZkXwcHDhcc8Lsh7bvqd033a/fOQR/KgZ/M=;
        b=upSiadDkoVya9G+Hja/j0WCkTVNd63UqJYsfWih0MWPBhK9Hce2Gu9Blyqihn6sZv9
         /XP4JNHm1H7BD/tDyZWK1uR8WIlk0rEBOYkfGAYQjSxkG/DkVPIOUUV9TrnSOeRu7bk7
         6g4RFipIEob3+54hTt7DpHH7dAtNFdwQiWzwyj4yv1KLSluIkIZLuamazaxMknYUfn3E
         k+bTIx6PJMv7/uWF4nR8ciCN8hVbRPca8mxbYGoOhDk1CixydX1G/iz/kuoTKbUADpc1
         lM0HinlVyJs3tkDD+S8PtxhM+eOTO1Qm33ofjaPIG7Bn8bRP+Y8VzjmPxqeNwC+oboA5
         YgWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q126si3530383qkb.218.2018.03.23.07.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 07:32:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezNkW-000491-9g
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 10:32:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNk9-00046w-IN
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNk8-0003CX-S1
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50644 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezNk8-0003CJ-Os; Fri, 23 Mar 2018 10:32:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D457EAEB8;
	Fri, 23 Mar 2018 14:32:32 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A3A52023233;
	Fri, 23 Mar 2018 14:32:25 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Mar 2018 15:32:00 +0100
Message-Id: <20180323143202.28879-4-lvivier@redhat.com>
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:32 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 3/5] error: Remove NULL checks on
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
X-TUID: 7g/m4pkA7SUC

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

