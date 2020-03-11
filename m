Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp260321lfc;
        Tue, 10 Mar 2020 21:09:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtaOiaBzdc4M+zqF+WVrp9E4spxkt8TaYVLty4a9XGc0J/g9Fn29VLIgsPZucz4lkVUu8Fv
X-Received: by 2002:a05:620a:94f:: with SMTP id w15mr950218qkw.241.1583899786269;
        Tue, 10 Mar 2020 21:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583899786; cv=none;
        d=google.com; s=arc-20160816;
        b=bsD81zdR0RfwWv+9dSWNVeX+mVP8LKA1mS7tpCF0D1jvfzt2ZaB6vPHK0y6AeFk9o/
         vuvx2n4knTN7PB6wh+jtxBrFmRqAZQgJePe939XMcP4HbTZoH9yhOXMudE+U8KhF8flT
         zPxHt9WzJbMYAPpjQ2BlL6InRx8yIymD89QEqe1W+OtKVXbtzi5CCqJ1ZL8tpk6YLMlN
         +QNt9t4xuTzy8xGfBKw7KFcrc1xLQsJASmn3HTM1X1cwrVI9Y0FmFozxqH+iKOHwn/O2
         drg9LYS4pLbU31nAVffqmN3ufyd/vLUUkbk1SLHp/D7v6k5/LX6wP20JJ97LGq/E3No/
         OwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yS+wEzXMkBQY0dXWQ1w2qDOShiCCvLOOnWkysOKyZ18=;
        b=VK85+XA6PgOOVs3ZsLwaN2p33icIgoy5PfLTJkcTiZNnV5pjbOxGk0srWs27apQtTG
         4PoPvX4L4m69U8MWu55LFaH1uo1qVMgDyyneMglW72lLiPGRTIX3tfIIammV0Wllb+cv
         SsL7HYny/uurxAPNIER3RkWdPO6rD7UaZNO5G3i1tCzvjhf81hD3dGtR+icSmJZSIrT1
         /NYsycBkT+3/CfAjYs7juWI9s114v/Gg3dvkS0iNEziqbAHR8N9cHMMmMmEiL0+fBmoW
         +9s33zJo1CCddo1ZppH5gdZFA1ZSVTURssC+S2eS710QKF2WdSCYvQI/C7FmFzpugIRL
         fQ9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RxkCG3A+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z22si311391qka.114.2020.03.10.21.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 21:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RxkCG3A+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBsgj-0003hk-NO
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 00:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1jBsgb-0003hU-By
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 00:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1jBsgZ-0005rJ-El
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 00:09:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35816
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1jBsgZ-0005qu-Aa
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 00:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583899774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yS+wEzXMkBQY0dXWQ1w2qDOShiCCvLOOnWkysOKyZ18=;
 b=RxkCG3A+AlyNjNy4TfkrKIMO8vMi97LcA8hPbFlzlBMqkpKyUC7Y32dgCdtcu1mPLwPl2S
 5z6tPOzhhqSPwPpiggTMktEpMbSH6DzxxRdx2Uxu2XjU3/O3XkWjt+GyCd8H3YMoSgv/rl
 hmOhZMYBS4AuxKDIQSRsOZFyrZt3Kkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-cvemdRrsPKymtZqQ0dmXfA-1; Wed, 11 Mar 2020 00:09:32 -0400
X-MC-Unique: cvemdRrsPKymtZqQ0dmXfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFB01800D48;
 Wed, 11 Mar 2020 04:09:31 +0000 (UTC)
Received: from localhost.localdomain.com (vpn2-54-67.bne.redhat.com
 [10.64.54.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B0545DA60;
 Wed, 11 Mar 2020 04:09:27 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3] hw/char/pl011: Enable TxFIFO and async transmission
Date: Wed, 11 Mar 2020 15:09:23 +1100
Message-Id: <20200311040923.29115-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: peter.maydell@linaro.org, philmd@redhat.com, marcandre.lureau@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jER7wx8ykNe9

The depth of TxFIFO can be 1 or 16 depending on LCR[4]. The TxFIFO is
disabled when its depth is 1. It's nice to have TxFIFO enabled if
possible because more characters can be piled and transmitted at once,
which would have less overhead. Besides, we can be blocked because of
qemu_chr_fe_write_all(), which isn't nice.

This enables TxFIFO if possible. On ther other hand, the asynchronous
transmission is enabled if needed, as we did in hw/char/cadence_uart.c

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v3: Use PL011() to do data type conversion
    Return G_SOURCE_REMOVE when the backend is disconnected in pl011_xmit()
    Drop parenthesis in the condition validating @size in pl011_write_fifo(=
)
---
 hw/char/pl011.c         | 105 +++++++++++++++++++++++++++++++++++++---
 include/hw/char/pl011.h |   3 ++
 2 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 13e784f9d9..dccb8c42b0 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -169,6 +169,73 @@ static void pl011_set_read_trigger(PL011State *s)
         s->read_trigger =3D 1;
 }
=20
+static gboolean pl011_xmit(GIOChannel *chan, GIOCondition cond, void *opaq=
ue)
+{
+    PL011State *s =3D PL011(opaque);
+    int ret;
+
+    /* Drain FIFO if there is no backend */
+    if (!qemu_chr_fe_backend_connected(&s->chr)) {
+        s->write_count =3D 0;
+        s->flags &=3D ~PL011_FLAG_TXFF;
+        s->flags |=3D PL011_FLAG_TXFE;
+        return G_SOURCE_REMOVE;
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
+    PL011State *s =3D PL011(opaque);
+    int depth =3D (s->lcr & 0x10) ? 16 : 1;
+
+    if (size >=3D depth - s->write_count) {
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
+    PL011State *s =3D PL011(opaque);
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

