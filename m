Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5152790wrq;
        Tue, 12 Jun 2018 03:45:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKHfYVb/SGELgHCSg80zYhnSHvt2IuyBHo6MAY3pp+7cJmVGM0sbs2EBalYGnAXoIB28u4F
X-Received: by 2002:ac8:710f:: with SMTP id z15-v6mr2803125qto.93.1528800328494;
        Tue, 12 Jun 2018 03:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528800328; cv=none;
        d=google.com; s=arc-20160816;
        b=UKkkOeh/2voW4fN3as53Xo07isesAmcwKGkfFEIVxsnm8OvrUfnPbc6t67mln3f5jm
         z/+qRiylF8kQuEXmOGgdG7lgqDDIs7YYnRgMJYQltd8Ezq4HwH0ipquWMV5urPYUazs/
         xIuT4RRvZqf/2Gnrkat4bVF8FrL38A66MqoRV0yHaOxtV1uNtadaBXtrj8Fk+Z0n+KPP
         wJ3dW4HtGv1uUVEmofLNfsvf3lyK/mZcCmQ60It8MpCHxd7FsZ2qLyPRnJA6OTAJiJyD
         G4XO3Zu9EOcHE6skuZkrZW2OnaMzRsm0qRcmXc2v0Ivq3FWWTPZXwVjDwvI31qhKJaUN
         EvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fYfEWrlgScT9mknULP6C9XpFuAbaZ197uGTcmPJ8oTw=;
        b=A75Q8zonEiTAxNxPvR8cdGna0c23EYhAWgHkJ6sKIf3OSYwh4POUU9y67uQg1bGoa5
         w/Q5ZTDcHF1jYh5yM0lSYR7FbtUNJUQeKf2ddAt+2AW1lwjJ8Te8IZ+oThLaXeZOPmJl
         C+E+wTfecpPBd1HarYfNkRTLIMukmDsz76vEVq0a/UFUuV/BULvuSqQh2/6nVtNfpuhC
         90YHajy7gielsb7B5yLqXUvPDSIvl1uCPfu6Z/UOtDO/XO/ipShjzOrPyICGcwwt0oSt
         IN1/ittuYUGnqShs5CB3fKlb1F4OILOnXZYlHiBOLH+7oKDzX0kL20r3+TBsUyBFhWR3
         SUnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q70-v6si598502qke.108.2018.06.12.03.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 03:45:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSgnl-0003Ng-43
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 06:45:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmy-0002nd-7Y
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fSgmw-0007sd-6J
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 06:44:36 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49350 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fSgmw-0007sC-0B; Tue, 12 Jun 2018 06:44:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6871A77889;
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1656C20284D6;
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id BFA094FD4D; Tue, 12 Jun 2018 12:44:30 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 12:44:30 +0200
Message-Id: <20180612104430.25745-9-kraxel@redhat.com>
In-Reply-To: <20180612104430.25745-1-kraxel@redhat.com>
References: <20180612104430.25745-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 12 Jun 2018 10:44:33 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 8/8] usb-mtp: Return error on suspicious TYPE_DATA
 packet from initiator
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
Cc: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
	Zhang Chen <zhangckid@gmail.com>, Bandan Das <bsd@redhat.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PjY7SHb8SJNp

From: Bandan Das <bsd@redhat.com>

CID 1390604
If the initiator sends a packet with TYPE_DATA set without
initiating a CMD_GET_OBJECT_INFO first, then usb_mtp_get_data
can trip on a null s->data_out.

Signed-off-by: Bandan Das <bsd@redhat.com>
Message-Id: <jpgr2m8ajfk.fsf_-_@linux.bootlegged.copy>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-mtp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index b0ab6a7912..1ded7ac9a3 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1700,6 +1700,11 @@ static void usb_mtp_get_data(MTPState *s, mtp_container *container,
     uint64_t dlen;
     uint32_t data_len = p->iov.size;
 
+    if (!d) {
+            usb_mtp_queue_result(s, RES_INVALID_OBJECTINFO, 0,
+                                 0, 0, 0, 0);
+            return;
+    }
     if (d->first) {
         /* Total length of incoming data */
         d->length = cpu_to_le32(container->length) - sizeof(mtp_container);
-- 
2.9.3

