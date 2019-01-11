Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp194443wrt;
        Fri, 11 Jan 2019 06:23:10 -0800 (PST)
X-Google-Smtp-Source: ALg8bN79M4DGDCKfY0AemI8TonMGgSwoOZggnd6YMvkCwOTiDnebvOXVjW+dw8D4CZqeF2X4OpTI
X-Received: by 2002:a5d:68c3:: with SMTP id p3mr14161406wrw.34.1547216590261;
        Fri, 11 Jan 2019 06:23:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216590; cv=none;
        d=google.com; s=arc-20160816;
        b=GcxZK6asETX9ieERbXXogtjwhr/aRuhuOMdpiy7hskgLKSnXGw9NMfYGC9EBmvGtxL
         GBmNMLvO2tIhcmFLFxz7HJ8pHX80MlXFtkDlwt3wvOE5KI1J//xcxXxo6/NS7TjNs25s
         ckDJqzsE1hGxw74KLYqqhBg88OsCY8J7CylO6Slu+ZyCnB7M4tFtquPlhfksWvYuwfNt
         IWXFwjNT0+rp0dvcH/gNrDKaE2/uugfjptDNcgTkUeuEtUvLITxL9jiPaUGEnVuMPaMY
         19kyOqx7Mt2gwHbkTeblhzF+vivL7T4icc7rTMbbEhR87c2QoiKJ3Moz4cVFuaivEfq5
         4t5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KNnC6jCzh/wpIhVzHSwQH9q9caEqI2j+ON6rOne0/T4=;
        b=c0OExR6JqynH4UjEcrmUjzc0N8inD1jMcNUBiJeSECFgfhvG1nRkGgowPsx0Pfv0OI
         O/K/f3qsyL4UsNz/B0xdYJtzwQqoLPuytRQughTiKggxgarQuscnH5UtsvBEdpshLRMU
         fnXMvfe5/ll56c02pCtXgUFD5GhsScjrEKPFGZZAkn6dE2PaiLm1g6jgUBe/aqIyII7U
         60tUN9VTFtUoR6SV8LhuvOInvPMDVrNQ/Ta4s97LBMQas/A1EGFSwUemWbGxRCJzAjWJ
         rwyD7zGzyEzKiMgM08VTGKGG/+ywaWGf5YgKagrjfX4/E5AAocxVu7GS1arBTTTnmSRr
         tjWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si13212065wmt.146.2019.01.11.06.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxiH-0000qQ-9Z
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:23:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxdy-0005uM-Lv
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:18:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxWR-0004D1-0M
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:10:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51577)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxWP-00045C-8i; Fri, 11 Jan 2019 09:10:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24561A0361;
	Fri, 11 Jan 2019 14:10:52 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6A865D6A9;
	Fri, 11 Jan 2019 14:10:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:50 +0100
Message-Id: <20190111140857.4211-9-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 11 Jan 2019 14:10:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 08/15] hw/char/serial: Remove SerialState from
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
X-TUID: MFbB57KHxlbv

Files requiring SerialState already include "hw/char/serial.h".

To clean "qemu/typedefs.h", move the declaration to "hw/char/serial.h"
(removing the forward declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/char/serial.h | 4 ++--
 include/qemu/typedefs.h  | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 0acfbbc382..abd5cf71a9 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -35,7 +35,7 @@
=20
 #define UART_FIFO_LENGTH    16      /* 16550A Fifo Length */
=20
-struct SerialState {
+typedef struct SerialState {
     uint16_t divider;
     uint8_t rbr; /* receive register */
     uint8_t thr; /* transmit holding register */
@@ -77,7 +77,7 @@ struct SerialState {
=20
     QEMUTimer *modem_status_poll;
     MemoryRegion io;
-};
+} SerialState;
=20
 extern const VMStateDescription vmstate_serial;
 extern const MemoryRegionOps serial_io_ops;
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 92f9996107..165d335f87 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -99,7 +99,6 @@ typedef struct QObject QObject;
 typedef struct QString QString;
 typedef struct RAMBlock RAMBlock;
 typedef struct Range Range;
-typedef struct SerialState SerialState;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
--=20
2.17.2

