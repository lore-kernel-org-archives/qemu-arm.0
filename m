Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4585099lfg;
        Sun, 23 Feb 2020 19:13:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNeM70VYh04x5ProEc2q8Jjor6KtO79w8bCOFYt/AmVfCjDs9bu8yoND1uONPbK1iaUOSL
X-Received: by 2002:a05:620a:2093:: with SMTP id e19mr47980636qka.355.1582514027887;
        Sun, 23 Feb 2020 19:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582514027; cv=none;
        d=google.com; s=arc-20160816;
        b=doy4qiPPntkafmUGOX/cNo2GJCX3boUsxzTUvkvztDp6AuWgWBd7PI9JygYfY0MIMQ
         57+dFh1F55nT/YlRAGUErUp1KwBjDaJaJroXFDK7Ah6jRDjadyNVJvwUrnGjoNyQ4/Zm
         VC98Yqc4VLpRljmkqNFIEYDgiA302HvG5OXxppjtfai4GnyrSJCmJc5iH8KPsDuOt5AT
         SuoYv7g0SSD/8gfHfQTB5pLpD0ZftV94n51GJIwXy9MQZBjqFH7dt+kWQRSp69HbOkIH
         ayaqQdhaCZchfJCd8cFSinC5WqaJpSLfOg9X7Ztj2zM6mvdKBb/1VE8DuNlT7kWx4GAU
         ZF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4CzboXwg1gWo9TZKssbatq5M6sKvMbEROQSbtSwtE1E=;
        b=wD4Pd1+rFBg91uNEOP2/EoXQqVXtJov+v7esYOSbhqVFy42IASrdQrAjAdnVprSADN
         3nd5vYxIg3EdnI/oZ3Tg7QkLpAe+HAe924IN8xCxJ4nxsR336Xh+bLhlqf9QTcE7x53Y
         DDVpbUjKeaQZobhKbY5n0Lg1fnP/5zjRcquI3RZNKlrOwbQWnHlvB/UDm/7qVW+b6co7
         1G+Tg45q1Kf13eF5+BliWsb4r1bDn+IYMwASwm5Uqu4ak2rtJcw5tMzMc4FfUDcys4ER
         q51iggwvGkT43uYlvRvGeYpjHo8eL1r39FleTgHmQ7KJmqHmUpYABqNrp5P6eb0z09JZ
         /R0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hl3u6ty8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk20si4727324qvb.16.2020.02.23.19.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2020 19:13:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hl3u6ty8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j64Bn-00039a-Ar
	for alex.bennee@linaro.org; Sun, 23 Feb 2020 22:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j64Bd-000365-Bc
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 22:13:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j64Bb-0000N2-KB
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 22:13:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52960
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j64Bb-0000Mj-G5
 for qemu-arm@nongnu.org; Sun, 23 Feb 2020 22:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582514014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4CzboXwg1gWo9TZKssbatq5M6sKvMbEROQSbtSwtE1E=;
 b=Hl3u6ty8cERG98BXtGzdfqGI3rJiQ5sg7gCMO11Q1iaApa2Fiy8uWrvYCW56PmoXFRX9ir
 K5z9DEkNHwwJ1xBfVI1H7VPwtYmDuwia9GGKDGL+HgAG0dV8sj8CyZkPGFe8LN8npk/ikz
 wBwGWKdiQUTl/aaUoOgWj2KiIm0AeYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-xNNXLyR8OymBEgbmArWC2g-1; Sun, 23 Feb 2020 22:13:32 -0500
X-MC-Unique: xNNXLyR8OymBEgbmArWC2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E6A13E2;
 Mon, 24 Feb 2020 03:13:31 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-48.bne.redhat.com
 [10.64.54.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C9F60BF4;
 Mon, 24 Feb 2020 03:13:26 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2] hw/char/pl011: Enable TxFIFO and async transmission
Date: Mon, 24 Feb 2020 14:13:19 +1100
Message-Id: <20200224031319.84392-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, shan.gavin@gmail.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PN/QK8nA43IR

The depth of TxFIFO can be 1 or 16 depending on LCR[4]. The TxFIFO is
disabled when its depth is 1. It's nice to have TxFIFO enabled if
possible because more characters can be piled and transmitted at once,
which would have less overhead. Besides, we can be blocked because of
qemu_chr_fe_write_all(), which isn't nice.

This enables TxFIFO if possible. On ther other hand, the asynchronous
transmission is enabled if needed, as we did in hw/char/cadence_uart.c

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v2: Put write_{count,fifo} into migration subsection
    Don't start async IO handle if it has been started, to avoid race
    Update with PL011_FLAG_{TXFF,TXFE} on changing write_count
---
 hw/char/pl011.c         | 105 +++++++++++++++++++++++++++++++++++++---
 include/hw/char/pl011.h |   3 ++
 2 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 13e784f9d9..de5c4254fe 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -169,6 +169,73 @@ static void pl011_set_read_trigger(PL011State *s)
         s->read_trigger =3D 1;
 }
=20
+static gboolean pl011_xmit(GIOChannel *chan, GIOCondition cond, void *opaq=
ue)
+{
+    PL011State *s =3D (PL011State *)opaque;
+    int ret;
+
+    /* Drain FIFO if there is no backend */
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        s->write_count =3D 0;
+        s->flags &=3D ~PL011_FLAG_TXFF;
+        s->flags |=3D PL011_FLAG_TXFE;
+        return FALSE;
+    }
+
+    /* Nothing to do */
+    if (!s->write_count) {
+        return FALSE;
+    }
+
+    ret =3D qemu_chr_fe_write(&s->chr, s->write_fifo, s->write_count);
+    if (ret > 0) {
+        s->write_count -=3D ret;
+        memmove(s->write_fifo, s->write_fifo + ret, s->write_count);
+        s->flags &=3D ~PL011_FLAG_TXFF;
+        if (!s->write_count) {
+            s->flags |=3D PL011_FLAG_TXFE;
+        }
+    }
+
+    if (s->write_count) {
+        s->watch_tag =3D qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HU=
P,
+                                             pl011_xmit, s);
+        if (!s->watch_tag) {
+            s->write_count =3D 0;
+            s->flags &=3D ~PL011_FLAG_TXFF;
+            s->flags |=3D PL011_FLAG_TXFE;
+            return FALSE;
+        }
+    }
+
+    s->int_level |=3D PL011_INT_TX;
+    pl011_update(s);
+    return FALSE;
+}
+
+static void pl011_write_fifo(void *opaque, const unsigned char *buf, int s=
ize)
+{
+    PL011State *s =3D (PL011State *)opaque;
+    int depth =3D (s->lcr & 0x10) ? 16 : 1;
+
+    if (size >=3D (depth - s->write_count)) {
+        size =3D depth - s->write_count;
+    }
+
+    if (size > 0) {
+        memcpy(s->write_fifo + s->write_count, buf, size);
+        s->write_count +=3D size;
+        if (s->write_count >=3D depth) {
+            s->flags |=3D PL011_FLAG_TXFF;
+        }
+        s->flags &=3D ~PL011_FLAG_TXFE;
+    }
+
+    if (!s->watch_tag) {
+        pl011_xmit(NULL, G_IO_OUT, s);
+    }
+}
+
 static void pl011_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
@@ -179,13 +246,8 @@ static void pl011_write(void *opaque, hwaddr offset,
=20
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        /* ??? Check if transmitter is enabled.  */
         ch =3D value;
-        /* XXX this blocks entire thread. Rewrite to use
-         * qemu_chr_fe_write and background I/O callbacks */
-        qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        s->int_level |=3D PL011_INT_TX;
-        pl011_update(s);
+        pl011_write_fifo(opaque, &ch, 1);
         break;
     case 1: /* UARTRSR/UARTECR */
         s->rsr =3D 0;
@@ -207,7 +269,16 @@ static void pl011_write(void *opaque, hwaddr offset,
         if ((s->lcr ^ value) & 0x10) {
             s->read_count =3D 0;
             s->read_pos =3D 0;
+
+            if (s->watch_tag) {
+                g_source_remove(s->watch_tag);
+                s->watch_tag =3D 0;
+            }
+            s->write_count =3D 0;
+            s->flags &=3D ~PL011_FLAG_TXFF;
+            s->flags |=3D PL011_FLAG_TXFE;
         }
+
         s->lcr =3D value;
         pl011_set_read_trigger(s);
         break;
@@ -292,6 +363,24 @@ static const MemoryRegionOps pl011_ops =3D {
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
+static bool pl011_write_fifo_needed(void *opaque)
+{
+    PL011State *s =3D (PL011State *)opaque;
+    return s->write_count > 0;
+}
+
+static const VMStateDescription vmstate_pl011_write_fifo =3D {
+    .name =3D "pl011/write_fifo",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D pl011_write_fifo_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_INT32(write_count, PL011State),
+        VMSTATE_UINT8_ARRAY(write_fifo, PL011State, 16),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_pl011 =3D {
     .name =3D "pl011",
     .version_id =3D 2,
@@ -314,6 +403,10 @@ static const VMStateDescription vmstate_pl011 =3D {
         VMSTATE_INT32(read_count, PL011State),
         VMSTATE_INT32(read_trigger, PL011State),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections =3D (const VMStateDescription * []) {
+        &vmstate_pl011_write_fifo,
+        NULL
     }
 };
=20
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 14187165c6..9d1c24db48 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -38,6 +38,7 @@ typedef struct PL011State {
     uint32_t int_enabled;
     uint32_t int_level;
     uint32_t read_fifo[16];
+    uint8_t  write_fifo[16];
     uint32_t ilpr;
     uint32_t ibrd;
     uint32_t fbrd;
@@ -45,6 +46,8 @@ typedef struct PL011State {
     int read_pos;
     int read_count;
     int read_trigger;
+    int write_count;
+    guint watch_tag;
     CharBackend chr;
     qemu_irq irq[6];
     const unsigned char *id;
--=20
2.23.0

