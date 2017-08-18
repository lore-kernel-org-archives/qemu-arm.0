Received: by 10.223.188.70 with SMTP id a6csp615630wrh;
        Fri, 18 Aug 2017 10:08:37 -0700 (PDT)
X-Received: by 10.55.190.134 with SMTP id o128mr13023270qkf.58.1503076117710;
        Fri, 18 Aug 2017 10:08:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503076117; cv=none;
        d=google.com; s=arc-20160816;
        b=wOLgN988A3nhRkcnePyDCBaRjJ7EyxLzK++ep2Bw/r15NBitPaeXPQjBg4mJaTMvL8
         wH7No+Bz1x4riJ0GXPGIyEYIiJT642RxaDgCtv7I6zqzBBcOTQSfHqbNP+qp6I5uNdVe
         FlkxHh743kXodWiy519LzKLgwEjxRCSAxo7fgvVV4MVfhanfjuR30BCTW5m6QlCHpoPx
         UfYd94Qna3zej6pCJXqhC4OYPDlidTFmpJndkw8dHIml4c/J9dXT4kSHOiHTr5Ip/6nQ
         MnU1NyDicj+jSH13U2tOMOioc6Jwj1Gwh6yCr0zerCTDVrqMnEsdgAe1YNYUJHMqrSic
         0DJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=mtHEOY4AvI9el/beLq12C4eIjmqRA55nYp8lUSGn8pc=;
        b=q7/L+cAsTkGWhbAnfs3IdlDEISHXoyQk8S7u1nymycpwfS6hPcHBzz3y/WsppudYpB
         N7PtIM4FnWvS2M1QgmB1M+SS16pCjOkNdfl/gxZu1JeAsER1Vg3Wrqmx3a5hkM/0Qfhq
         FdLnEfyiCpJcNjPgH4eEIEG30TX4m58HeDj5mwFvS0yeMJVREGgLFrTWWb+hJ5Nhxodr
         1gCAUV7l6klAhPMyT7k5N4quv4gg4yTrFG1DhulKtFshddcv/nwCEN7EdCW4a/BzTtPm
         jTj4QAaoIIE3j/U4wXh0gmpgLr1tG/3rdlcl0D+E9O2V5cQOqnuvJXXhVaGumzT5chpf
         q81A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c66si5345401qkd.87.2017.08.18.10.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Aug 2017 10:08:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dikl9-0004rM-Dr
	for alex.bennee@linaro.org; Fri, 18 Aug 2017 13:08:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dikky-0004nz-Qs
	for qemu-arm@nongnu.org; Fri, 18 Aug 2017 13:08:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dikkv-0003QG-GD
	for qemu-arm@nongnu.org; Fri, 18 Aug 2017 13:08:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dikkv-0003Pv-9d; Fri, 18 Aug 2017 13:08:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 524B7C0587E6;
	Fri, 18 Aug 2017 17:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 524B7C0587E6
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-94.ams2.redhat.com [10.36.116.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBF64784B3;
	Fri, 18 Aug 2017 17:08:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Beniamino Galvani <b.galvani@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Aug 2017 19:08:16 +0200
Message-Id: <1503076096-14220-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 18 Aug 2017 17:08:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm/allwinner: Fix crash with -nodefaults -M
 cubieboard
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Li Guang <lig.fnst@cn.fujitsu.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Y9D1xSl4udo

The allwinner-a10 device uses serial_hds[0] without checking whether
it is available or not. So using the cubieboard with -nodefaults
currently results in a segmentation fault. Fix it by adding a
proper check here.
And while we're at it, mark the device as "user_creatable = false"
since this apparently can not directly be used by the users but has
to be wired up in code instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/allwinner-a10.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index f62a9a3..e152566 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -109,8 +109,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, s->irq[56]);
 
     /* FIXME use a qdev chardev prop instead of serial_hds[] */
-    serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq[1],
-                   115200, serial_hds[0], DEVICE_NATIVE_ENDIAN);
+    if (serial_hds[0]) {
+        serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq[1],
+                       115200, serial_hds[0], DEVICE_NATIVE_ENDIAN);
+    }
 }
 
 static void aw_a10_class_init(ObjectClass *oc, void *data)
@@ -118,6 +120,8 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
     DeviceClass *dc = DEVICE_CLASS(oc);
 
     dc->realize = aw_a10_realize;
+    /* Reason: Needs to be wired up in code, see cubieboard_init() */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo aw_a10_type_info = {
-- 
1.8.3.1

