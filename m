Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4802259wro;
        Mon, 29 Oct 2018 15:34:56 -0700 (PDT)
X-Google-Smtp-Source: AJdET5da/yxXQkc7nMMEehypVV02S1taq6ESOcd506Hr9mCNzO9DuYqQ/Ci/pCBvW6x/S97EKqJV
X-Received: by 2002:a0c:a043:: with SMTP id b61mr14769532qva.57.1540852496412;
        Mon, 29 Oct 2018 15:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540852496; cv=none;
        d=google.com; s=arc-20160816;
        b=Xusd+ZVyygRkz3HvEdmdbh8bQckZoQr0mDF7MCwvPzuLbU1rHDT7Tg+R6eKuvIrBpt
         0jWuJrcPYoMbQuRCZPrtxhqQDEjHUH0pKXYB7HB3MyTthb7J4kNoPv48JgdyxGCOH1fp
         +Qt25PHwb5+DtPQcczDz9DJXRPGf3h24U3nvOoLUJqKl7TIANdjj4uuwKHpe5x+BfyWY
         wNHigv75wnanUEV6H/ETruAStV4CakccGJbTJqXuWW7r4AA1UzVgErNKuF7HoApDD+Bt
         2Comm9gFSpdSc7Hon4SagNnf8oaeNA7T/1H2J3KNkOxdkyRnVmawe81Ovflh1Zkpf+MI
         gKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=yyQwaqvTqD0fARaYzylR9LJl8Bh6gC8YnPkRPIzZsJ0=;
        b=cl7+bd7MiKWDu8v4LHKySBzlv9MKqN+bJkNoV2eCu0L6sCqa+Tw0bQKw6HDDlgMHUE
         5DHk0KsJnmLcK89wcRGFCrZXNQGnNHxu5bbLc/n5bVh0B7YQZOB9Ryp6pKMGvz8RU15E
         76IrcJXxyiyj2ctzYP6hV/S5p0jfiO/W+EIJ7jbjLFNubQaeUclKGh2uB33ZlK0tzz5S
         naagEtDJasPkijMgq6BAV/r/H5PyQm+bdeSGHfXDNDLPXzR4GQZRlpVpoNxWg3EqhWkP
         to2pzk0k96+ccGtg8P+ZvS+6qJFffGx7FIxGqoNmH3nVjE03Rw4C8dZpoLw0PAKOR3go
         UvuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a193-v6si3121069qkb.20.2018.10.29.15.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 15:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHG7b-0000en-R3
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 18:34:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHG6n-0000c9-PH
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 18:34:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHG6m-0006rO-K7
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 18:34:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHG6k-0006qN-7S; Mon, 29 Oct 2018 18:34:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 467594E90E;
	Mon, 29 Oct 2018 22:34:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DBF858A9;
	Mon, 29 Oct 2018 22:33:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>,
	Guenter Roeck <linux@roeck-us.net>, Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 29 Oct 2018 23:32:07 +0100
Message-Id: <20181029223207.31878-4-philmd@redhat.com>
In-Reply-To: <20181029223207.31878-1-philmd@redhat.com>
References: <20181029223207.31878-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 29 Oct 2018 22:34:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] arm: allwinner: Enable USB EHCI
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lLY8G8rTRwwU

From: Guenter Roeck <linux@roeck-us.net>

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Intented tabs -> space]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/allwinner-a10.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 0a8ac929f5..92ab66354a 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -116,6 +116,8 @@ static void aw_a10_realize(DeviceState *dev, Error **=
errp)
     if (machine_usb(current_machine)) {
         sysbus_create_simple("sysbus-ohci", 0x01c14400, s->irq[64]);
         sysbus_create_simple("sysbus-ohci", 0x01c1c400, s->irq[65]);
+        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c14000, s->irq[39]);
+        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c1c000, s->irq[40]);
     }
 }
=20
--=20
2.17.2

