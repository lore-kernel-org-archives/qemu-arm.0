Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4719775wrt;
        Sun, 25 Nov 2018 13:08:11 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VGL3R6uESLYsnm0IAOf8B9v7oEfiTBeuyW8P0OkDuZRZV6w18m3dfku6kDAJvS5Y5/NW4X
X-Received: by 2002:a25:1043:: with SMTP id 64-v6mr24977544ybq.159.1543180091204;
        Sun, 25 Nov 2018 13:08:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543180091; cv=none;
        d=google.com; s=arc-20160816;
        b=EBg6j9dQcLUw6VDFiZrop4V1kkDvAjUlqTp0OI0y77q3Bpql9o4futEiTBrY6AWACM
         5SBNQb8pnlJ54E4wK1XEv/pBEomqP+Nxy+vsgZfpMxJTPFXVj/faei6+5FVzwO5YEtjR
         akUt1hG7egk/sDkMaxshYup5Ys3QA/Pppt34Vor1xelFU7q0wv5MLSCBUu9JTZC7EjFV
         b3PAT7i8VL6vv6faHiT3KIzp3xe0Wjm2FjA3zYNGaHFCqtyBubJP3f2hWKM7Vvr79V+v
         rjo8sZvz+oiOlRkjnzMe8cmD+hb/rSSk06vIOCgPFbrjbKycrxo3G0LzTMTKeLg3rkHo
         /2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=VbtaHmuAJoXCdY+iMXA//ff6kfbZRgIVVZdLS65DGEQ=;
        b=dfwb2qxdpSu03TNhwT+BcVvV/TsyQNpng2LG6L82rqIxbipClJ5z5Bc86G8FGFbHpm
         reTz/7ARmmoRiuIOQwxizjTAsrJTQnBg9UiBfW5rUsxVqcz1QUpuurAty7jmBW83RvCK
         ku8eBd48ESMTUZyORjPCTPcYsBw1x0g6VzEst6XwpNJrKQFE1KA8m5m3ttKh4xMxqOsr
         B0UDJ+EzekwxD7XEWdj1OqrCp+qzYHr5TY5PzXvQjj83jCTMmsRwIQHrvnavlLLE5zfR
         w5m4PuClVnmTFzchly4YA71IYCI6XD1a/5LSaNO1pJEFGvK+7WnFrkv4ZAYSje4wV5V9
         1vVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c64-v6si35130856ywe.122.2018.11.25.13.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 13:08:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1dS-0006lo-Jh
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 16:08:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1OK-0000wj-Os
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 15:52:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1OK-0006Jz-2l
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 15:52:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45744)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1OH-0006HM-Jr; Sun, 25 Nov 2018 15:52:29 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA52C3078AA3;
	Sun, 25 Nov 2018 20:52:28 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4985C1B2;
	Sun, 25 Nov 2018 20:52:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Antony Pavlov <antonynpavlov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 21:49:50 +0100
Message-Id: <20181125205000.10324-16-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sun, 25 Nov 2018 20:52:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-3.1 15/25] MAINTAINERS: Add missing entries
 for the Canon DIGIC machine
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R1mZeO9viGW4

This pattern now also matches:
- include/hw/timer/digic-timer.h
- include/hw/char/digic-uart.h

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eab0fb9742..e04f2f1a44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -527,6 +527,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: include/hw/arm/digic.h
 F: hw/*/digic*
+F: include/hw/*/digic*
=20
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
--=20
2.17.2

