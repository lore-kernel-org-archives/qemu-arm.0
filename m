Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp200647wrt;
        Fri, 11 Jan 2019 06:29:10 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4cYs0nLNh+KV3ejWPEUcNA7KsPZbTopzYdlHDCS5oS7YCqNre1HY1lVMTaYNiY33QNv0fP
X-Received: by 2002:adf:8068:: with SMTP id 95mr13887512wrk.181.1547216950621;
        Fri, 11 Jan 2019 06:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216950; cv=none;
        d=google.com; s=arc-20160816;
        b=iuSj4Jyr9Fv14JLIrw2uOjhv5YnlhhW53nxrVKZsaUuakMcDZut/UTQPOOSLmM0WIi
         5wtfHxFDTFuKMZQuSs39I4vYbCkoB3IcGc2nqIK3SFMPN+i4jUMIpf75eCkCuNZ2J9qs
         HiVpmkQ1BnPzvYn2MdSljgBwOvSs/DRUyBs51GXPHJq6T/nNNMckuYpJ2zwyaxbxGN17
         lhRtyPWi6Q+/FsN41zbzlk2Yt3RiyZSPE1siLYTBoqGw3QS5inK+syOMadn9GvrDwE88
         frE6FqQGAuHsnVDS/y1u4mXVVZMgN2U8Z2OKxq3rH8yJOjkpdyTuIKmdwieaZInFNNGL
         xd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ilCk+5M6VeznCOw5anOrW46Mb+bRnh/XZ/J9WKiNRFo=;
        b=pTgqed/XVsX0nPOfcvJ2WdRQKGcjFOHf6dJ+yjJbQeaUcbCcWEcJF/R8r64hiQq9Ii
         1wQ4cDLjxIK8N8qBYqsy6lZ5xv6fYKACqtE32tP4h+O8qMUkHVs2/ZgzSjNMnEenEbLr
         P77l/ZLXTctbwJexQ2xXd0iQAlSmirmdPzGYpWYdQvX6y9nbdzQxz56dFugClWPofRV5
         uqtaOnN6GOUqkPIxiFZ7oikRzsfqK+SpjVwiTRUI0pECutaPd2G8jS2WRWE85fa7dg3b
         gOfYkY9z3ScCzMn5EfQhpF32YBEtPFiuUAZlkWXjjPOnyA+pzi1DdD53BMfbKTlI2PR3
         96fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l64si13857967wml.126.2019.01.11.06.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxo5-000616-K8
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:29:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxdx-0005cP-7s
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:18:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxX7-0005xV-PK
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:11:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43826)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxX3-0005P9-Kb; Fri, 11 Jan 2019 09:11:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5ECA37EE0;
	Fri, 11 Jan 2019 14:11:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94A9C5D6A9;
	Fri, 11 Jan 2019 14:10:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:51 +0100
Message-Id: <20190111140857.4211-10-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 11 Jan 2019 14:11:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 09/15] hw/i386: Remove PCMachineClass from
 "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tbWYVi+bAo1i

Files requiring PCMachineClass already include "hw/i386/pc.h".

To clean "qemu/typedefs.h", move the declaration to "hw/i386/pc.h"
(removing the forward declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/pc.h    | 4 ++--
 include/qemu/typedefs.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 84720bede9..2c7a69b8f5 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -96,7 +96,7 @@ struct PCMachineState {
  *                  way we can use 1GByte pages in the host.
  *
  */
-struct PCMachineClass {
+typedef struct PCMachineClass {
     /*< private >*/
     MachineClass parent_class;
=20
@@ -133,7 +133,7 @@ struct PCMachineClass {
=20
     /* use DMA capable linuxboot option rom */
     bool linuxboot_dma_enabled;
-};
+} PCMachineClass;
=20
 #define TYPE_PC_MACHINE "generic-pc-machine"
 #define PC_MACHINE(obj) \
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 165d335f87..5e9a070ff3 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -70,7 +70,6 @@ typedef struct PCIExpressDevice PCIExpressDevice;
 typedef struct PCIExpressHost PCIExpressHost;
 typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
 typedef struct PCIHostState PCIHostState;
-typedef struct PCMachineClass PCMachineClass;
 typedef struct PCMachineState PCMachineState;
 typedef struct PixelFormat PixelFormat;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
--=20
2.17.2

