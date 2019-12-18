Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1224456lff;
        Wed, 18 Dec 2019 11:26:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRQEudEtyQt3dXUqiMrv05yeLOT7zdQ5mYL4d7Gap3B5ps8HP1PDr9YLSCuxgZDlk6N0D3
X-Received: by 2002:a9d:2264:: with SMTP id o91mr4394897ota.328.1576697204546;
        Wed, 18 Dec 2019 11:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697204; cv=none;
        d=google.com; s=arc-20160816;
        b=cGEuSiIPNs0c2wOoBF+uCNMG8IaTQWIW2TnHrm2wDBtjkmmPs23etq1ubW+BPtt8n/
         X4TUtOIgyVju3EtHApwbRxI+IKgiBHqdai3jsB1767HZiXdX1IYKWc2eAIhAKpIhinRB
         nHJPzCiN1sdwWC4y1hgzBxqMAunkINxPutHKsAUZQk1DLNyNKg7Y77vlk3heP1LEebnT
         uMNsHDQPZUpy+W8NzJLcPh7MNCR9MmOPIpld7VBEHr+bXze7HW9Xa2k+QLInHMBJ9fj4
         uGgOWA78Xz86j2hWJQUPCjAQYcix7wsvhxHq3oY6qFAhy246B2RlJ0lB1OgpPOvGGsAt
         BcAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vYieTMV2GGryjAYltk1B6hSeskuepnCEd/upKBPg6sc=;
        b=F+2P0iNkJNkMv/a9+lXmAT1WIuGU261e6owAelwc6Y2xIviScAGVFRnWvIEkMrGHZj
         4/+EWxWHMOHz4N6fwHmFw342ei/AMpgBB4U65+smBF5qabqao3ka8l393xbbO/3mpHpD
         WJ14D5ulh6Y65Q0+Jpyp2OQy9NJv3lMmF7EVHzY+QYyyvJxwlL+iYp2Q5/upSLYHTLbf
         DDazFjQuSzCjf0kPLB0hGtswVK4wW6/3It6qvqIcLLkfvmwyjusiqYjCxRMsQpVOfFYh
         Vdv/60n3Rj6LjjpTZLr4A8eBWrcgTH0x+9sBtm7c0NWk+hpgGNSvBDHL6DjhSCnwE9Ut
         K/7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M6fdaq1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si1931441otn.311.2019.12.18.11.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 11:26:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M6fdaq1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihey3-0008V0-Eh
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 14:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihexi-0008IO-7K
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:26:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihexf-00044j-ST
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:26:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42349
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihexf-0003yN-NQ
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576697172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYieTMV2GGryjAYltk1B6hSeskuepnCEd/upKBPg6sc=;
 b=M6fdaq1Yt4oPBsyMg23IXo+khTps7qQ4oAiOYM7Jdk3A8HUd74Bdk2qMjW3oCyyHMyeUIC
 o6hGUi3YanVcgqP6rWNsMaNwjWh1cQx/xHmwDlki4FN5OpSwV+cWMNXVv8pulelNWpxQeB
 Npcv9svB4bLl2xw7SfZ1UyODNFM+2y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-GKU3JQVBO16wNXnwHLjn3A-1; Wed, 18 Dec 2019 14:26:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E60801E6C;
 Wed, 18 Dec 2019 19:26:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 002A260C84;
 Wed, 18 Dec 2019 19:26:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/6] hw/net/imx_fec: Remove unuseful FALLTHROUGH
 comments
Date: Wed, 18 Dec 2019 20:25:25 +0100
Message-Id: <20191218192526.13845-6-philmd@redhat.com>
In-Reply-To: <20191218192526.13845-1-philmd@redhat.com>
References: <20191218192526.13845-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: GKU3JQVBO16wNXnwHLjn3A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G0hd+uyv/o8l

We don't need to explicit these obvious switch fall through
comments. Stay consistent with the rest of the codebase.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-arm@nongnu.org
---
 hw/net/imx_fec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index c01ce4f078..5a83678f64 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -901,8 +901,8 @@ static void imx_eth_write(void *opaque, hwaddr offset, =
uint64_t value,
             s->regs[index] =3D 0;
         }
         break;
-    case ENET_TDAR1:    /* FALLTHROUGH */
-    case ENET_TDAR2:    /* FALLTHROUGH */
+    case ENET_TDAR1:
+    case ENET_TDAR2:
         if (unlikely(single_tx_ring)) {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "[%s]%s: trying to access TDAR2 or TDAR1\n",
--=20
2.21.0

