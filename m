Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1347197lfg;
        Thu, 20 Feb 2020 20:49:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzx1zdW4VDXq5R53hXS6FQq6ASENB4jgo93UzhQwLB3YW6IkU8TVjg+TbDT/lWOLOE+mJs
X-Received: by 2002:ac8:7352:: with SMTP id q18mr29204834qtp.125.1582260576744;
        Thu, 20 Feb 2020 20:49:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582260576; cv=none;
        d=google.com; s=arc-20160816;
        b=DetARYsyp0JVnPWQewTtN4yDJqU7Woj29cQL9iXaegrtU6q+KRBsiOgSQLKgj38drO
         m8VY3fHpdSqSFo/CptmNVWoAtJRGkhYavpdXKyDGqcoPA3fl0v21jYvUZcTLNPemw1zE
         7ePerkGL/OGwLiDGhMk5la3Or1AOyYpeujL9h9BWzKR5kVeGLvQwxOUNE9ucbjkl+59V
         fbfhBBWdeOBYzIKcg9aOb1TptJJNHJeQ0IlZCOwzj3qp89qpI46jmTZrYXmzry7LTwML
         IQ4WcCjI+kZrsBPA/9yCQkb7KvMJR5l1EjV4ZyMgcHfZfVhGYR9C9s6LfN2t3oAi/joK
         847Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=fVFk6qdpzP/7d1y8e7epnpAZvVHSpmiKOcRMG5HzU2E=;
        b=B9VulQz+nTkecaGTMLVGlKXDpFCLnvvKXZUJmVg2iaJSlAzDswrFk8Rx0/ojyvLmq1
         0yxi541BUDsMfcr6tzH9cgiP4xGxZqu6BUudsc2plH2TRJpBB2qiyFTTRYQA6Kq6z4K9
         Jiu7b5yErBYaPeELRHPVqi9rYCz2nLuDVLyXXcVGt5KRVaIKclwnlzjHdgdCbns1jD0p
         m7/A69utyxEJMSy7S+EM5JkhsVXY0Q44JNHjY7DCFoV8KzUE8sjMFVq7GGIpenJafy9i
         LoSJrx3f9Ynh/PqbAxJVAIhcpMD3tr/p1/p8Zx31eSZf7Pz4NneUNtk3tVCREJYcK2Mz
         cuJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=db0g2Z3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si845569qte.121.2020.02.20.20.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 20:49:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=db0g2Z3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j50Fs-00086D-4M
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 23:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45243)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j50Fg-00085J-Tn
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 23:49:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j50Ff-0005Wk-1s
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 23:49:24 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55386
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j50Fe-0005Um-Qt
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 23:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582260561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fVFk6qdpzP/7d1y8e7epnpAZvVHSpmiKOcRMG5HzU2E=;
 b=db0g2Z3Al03NM8BlLK7TnDa/87LpOlNvnO4hxBVYpw85nuyxmYy8iHmoE4T2cR2iQWUAqd
 oWo+LNU3MCz/cUl+1niEyIyPENEhU8aWhQyuGFbXZ1emP/5cNAzkbBY6jySftoGkqBUcBn
 Jn1cZ7ziQhAvyXUzT8k2bMTFHb7FK9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-5V-TDf9gPiqknk8a3izArQ-1; Thu, 20 Feb 2020 23:49:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0402D8017CC;
 Fri, 21 Feb 2020 04:49:19 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-80.bne.redhat.com
 [10.64.54.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCF301001281;
 Fri, 21 Feb 2020 04:49:13 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] hw/char/pl011: Enable TxFIFO and async transmission
Date: Fri, 21 Feb 2020 15:49:08 +1100
Message-Id: <20200221044908.266883-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 5V-TDf9gPiqknk8a3izArQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, maz@kernel.org,
 shan.gavin@gmail.com, marcandre.lureau@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TZqFQWQj1ebA

The depth of TxFIFO can be 1 or 16 depending on LCR[4]. The TxFIFO is
disabled when its depth is 1. It's nice to have TxFIFO enabled if
possible because more characters can be piled and transmitted at once,
which would have less overhead. Besides, we can be blocked because of
qemu_chr_fe_write_all(), which isn't nice.

This enables TxFIFO if possible. On ther other hand, the asynchronous
transmission is enabled if needed, as we did in hw/char/cadence_uart.c

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/char/pl011.c         | 70 +++++++++++++++++++++++++++++++++++++----
 include/hw/char/pl011.h |  2 ++
 2 files changed, 66 insertions(+), 6 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 13e784f9d9..14ed04c8c8 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -169,6 +169,66 @@ static void pl011_set_read_trigger(PL011State *s)
         s->read_trigger =3D 1;
 }
=20
+static gboolean pl011_xmit(GIOChannel *chan, GIOCondition cond, void *opaq=
ue)
+{
+    PL011State *s =3D (PL011State *)opaque;
+    int ret;
+
+    /* instant drain the fifo when there's no back-end */
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        s->write_count =3D 0;
+        return FALSE;
+    }
+
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
+        guint r =3D qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
+                                        pl011_xmit, s);
+        if (!r) {
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
+        s->flags |=3D PL011_FLAG_TXFF;
+    }
+
+    if (size > 0) {
+        memcpy(s->write_fifo + s->write_count, buf, size);
+        s->write_count +=3D size;
+        s->flags &=3D ~PL011_FLAG_TXFE;
+    }
+
+    pl011_xmit(NULL, G_IO_OUT, s);
+}
+
 static void pl011_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
@@ -179,13 +239,8 @@ static void pl011_write(void *opaque, hwaddr offset,
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
@@ -207,6 +262,7 @@ static void pl011_write(void *opaque, hwaddr offset,
         if ((s->lcr ^ value) & 0x10) {
             s->read_count =3D 0;
             s->read_pos =3D 0;
+            s->write_count =3D 0;
         }
         s->lcr =3D value;
         pl011_set_read_trigger(s);
@@ -306,6 +362,7 @@ static const VMStateDescription vmstate_pl011 =3D {
         VMSTATE_UINT32(int_enabled, PL011State),
         VMSTATE_UINT32(int_level, PL011State),
         VMSTATE_UINT32_ARRAY(read_fifo, PL011State, 16),
+        VMSTATE_UINT8_ARRAY(write_fifo, PL011State, 16),
         VMSTATE_UINT32(ilpr, PL011State),
         VMSTATE_UINT32(ibrd, PL011State),
         VMSTATE_UINT32(fbrd, PL011State),
@@ -313,6 +370,7 @@ static const VMStateDescription vmstate_pl011 =3D {
         VMSTATE_INT32(read_pos, PL011State),
         VMSTATE_INT32(read_count, PL011State),
         VMSTATE_INT32(read_trigger, PL011State),
+        VMSTATE_INT32(write_count, PL011State),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 14187165c6..aeaf332eca 100644
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
@@ -45,6 +46,7 @@ typedef struct PL011State {
     int read_pos;
     int read_count;
     int read_trigger;
+    int write_count;
     CharBackend chr;
     qemu_irq irq[6];
     const unsigned char *id;
--=20
2.23.0

