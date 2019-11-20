Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1718917lfc;
        Wed, 20 Nov 2019 01:10:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAhS2ez/HFp8uqmWpQzMhcXuVCWobQIxL96LgvNNgFLhSzH8NJerT9OXMupNSXJOnSXAR4
X-Received: by 2002:a05:620a:12c9:: with SMTP id e9mr1324646qkl.97.1574241044531;
        Wed, 20 Nov 2019 01:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574241044; cv=none;
        d=google.com; s=arc-20160816;
        b=QHw5tqRxADfmczjx6gimfFVo5UlNBcemHZMblkjp5nivfLSoge4U0n0aJi92p8p0N8
         yWGkBqfW4p9tEEHHUFRs9u6xcQJkiLkiUsCZ2H6tex4kX2GxYHe0LBiYeYhLECZam1NP
         0SAqHit/+p4e6/RWYbkja01tMJXsvVkA9F4NAlsdHqNXf0cALDc/deRbl994kTxP+XOs
         5KJUgqW2VATTbFp/X0uij8NgVnGIupDzAbJjk9PWMFxsR1J/6v341Ho2Yu2dTdwtOr9J
         PpA4Ad8936xP0Dnbh3bvuACGFjbVqwPliF/qCfX4+IWpuyudaEDmCtBI5WmOTVclO7fi
         0IIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jx6W6KbdS+Sf1/npLnl4DNxMvQ4NqoCiN0H3GPqK6b0=;
        b=c4mAV6U68aGEQ1VDKi5EJZxogp/5HmW0GYTkicA22TvrAuXq5mdjfZlt/Rn0HdE5DR
         72DPgc5tLvcdzWSXOUOSfxgd0ozJsXdMGaUAzZHN5rADmKonxFO3V5cM0+Q3kYjYxqh6
         k94rV+fo6CqWDMjiGkfCnDbD00goUogMk9qLiU2fznFR062gu3JMphtCrFC1rAqK7Ky1
         1PMwbALN/t8b1xgc3B47ODS0p957whDZfbzWzvka+N8P+AnRLOqhwJbvbKIbVzoJOVJS
         z7uU4IgRWvHpy+byHPy1diZK7P+nNr6pMqiywbmNjtgrO8VWbuxmpo1T6ptZsGMaSKud
         69YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QEjHjPKK;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id z137si230969qkb.316.2019.11.20.01.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QEjHjPKK;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574241044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jx6W6KbdS+Sf1/npLnl4DNxMvQ4NqoCiN0H3GPqK6b0=;
	b=QEjHjPKKacVE4Zlba4c8fZ2WPoOdYEPcjGDzzwaw8RVNXMgdzMUWAQJ8MAI+MiLsc/+pcj
	E5f2Khpfu/FYXkaQkW6t1td/NluZ2ZaH0fxB9LHMNOMbJhxUbFBBgdbCtXeJdXVTD90vII
	k1hdlw4Zm+++3OHODx34/4CW1mHgZ18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-VqG_IjzxOsyT0UHv2-X2rQ-1; Wed, 20 Nov 2019 04:10:42 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589B0107ACE3;
	Wed, 20 Nov 2019 09:10:41 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-131.ams2.redhat.com [10.36.116.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD0A760BAB;
	Wed, 20 Nov 2019 09:10:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org,
	libvir-list@redhat.com,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-5.0 2/4] hw/usb: Remove the USB bluetooth dongle device
Date: Wed, 20 Nov 2019 10:10:12 +0100
Message-Id: <20191120091014.16883-3-thuth@redhat.com>
In-Reply-To: <20191120091014.16883-1-thuth@redhat.com>
References: <20191120091014.16883-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: VqG_IjzxOsyT0UHv2-X2rQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: lW6ww3wNwZZn

We are going to remove the bluetooth backend, so the USB bluetooth
dongle can not work anymore. It's a completely optional device, no
board depends on it, so let's simply remove it now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/usb/Kconfig         |   5 -
 hw/usb/Makefile.objs   |   1 -
 hw/usb/dev-bluetooth.c | 581 -----------------------------------------
 qemu-doc.texi          |  15 --
 4 files changed, 602 deletions(-)
 delete mode 100644 hw/usb/dev-bluetooth.c

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 555e09377b..5e70ed5f7b 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -82,11 +82,6 @@ config USB_NETWORK
     default y
     depends on USB
=20
-config USB_BLUETOOTH
-    bool
-    default y
-    depends on USB
-
 config USB_SMARTCARD
     bool
     default y
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 303ac084a0..0ab20f9d73 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -25,7 +25,6 @@ common-obj-$(CONFIG_USB_STORAGE_UAS)  +=3D dev-uas.o
 common-obj-$(CONFIG_USB_AUDIO)        +=3D dev-audio.o
 common-obj-$(CONFIG_USB_SERIAL)       +=3D dev-serial.o
 common-obj-$(CONFIG_USB_NETWORK)      +=3D dev-network.o
-common-obj-$(CONFIG_USB_BLUETOOTH)    +=3D dev-bluetooth.o
=20
 ifeq ($(CONFIG_USB_SMARTCARD),y)
 common-obj-y                          +=3D dev-smartcard-reader.o
diff --git a/hw/usb/dev-bluetooth.c b/hw/usb/dev-bluetooth.c
deleted file mode 100644
index f6944fa74f..0000000000
--- a/hw/usb/dev-bluetooth.c
+++ /dev/null
@@ -1,581 +0,0 @@
-/*
- * QEMU Bluetooth HCI USB Transport Layer v1.0
- *
- * Copyright (C) 2007 OpenMoko, Inc.
- * Copyright (C) 2008 Andrzej Zaborowski  <balrog@zabor.org>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation; either version 2 or
- * (at your option) version 3 of the License.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "hw/usb.h"
-#include "migration/vmstate.h"
-#include "desc.h"
-#include "sysemu/bt.h"
-#include "hw/bt.h"
-
-struct USBBtState {
-    USBDevice dev;
-    struct HCIInfo *hci;
-    USBEndpoint *intr;
-
-    int config;
-
-#define CFIFO_LEN_MASK=09255
-#define DFIFO_LEN_MASK=094095
-    struct usb_hci_in_fifo_s {
-        uint8_t data[(DFIFO_LEN_MASK + 1) * 2];
-        struct {
-            uint8_t *data;
-            int len;
-        } fifo[CFIFO_LEN_MASK + 1];
-        int dstart, dlen, dsize, start, len;
-    } evt, acl, sco;
-
-    struct usb_hci_out_fifo_s {
-        uint8_t data[4096];
-        int len;
-    } outcmd, outacl, outsco;
-};
-
-#define TYPE_USB_BT "usb-bt-dongle"
-#define USB_BT(obj) OBJECT_CHECK(struct USBBtState, (obj), TYPE_USB_BT)
-
-#define USB_EVT_EP=091
-#define USB_ACL_EP=092
-#define USB_SCO_EP=093
-
-enum {
-    STR_MANUFACTURER =3D 1,
-    STR_SERIALNUMBER,
-};
-
-static const USBDescStrings desc_strings =3D {
-    [STR_MANUFACTURER]     =3D "QEMU",
-    [STR_SERIALNUMBER]     =3D "1",
-};
-
-static const USBDescIface desc_iface_bluetooth[] =3D {
-    {
-        .bInterfaceNumber              =3D 0,
-        .bNumEndpoints                 =3D 3,
-        .bInterfaceClass               =3D 0xe0, /* Wireless */
-        .bInterfaceSubClass            =3D 0x01, /* Radio Frequency */
-        .bInterfaceProtocol            =3D 0x01, /* Bluetooth */
-        .eps =3D (USBDescEndpoint[]) {
-            {
-                .bEndpointAddress      =3D USB_DIR_IN | USB_EVT_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_INT,
-                .wMaxPacketSize        =3D 0x10,
-                .bInterval             =3D 0x02,
-            },
-            {
-                .bEndpointAddress      =3D USB_DIR_OUT | USB_ACL_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_BULK,
-                .wMaxPacketSize        =3D 0x40,
-                .bInterval             =3D 0x0a,
-            },
-            {
-                .bEndpointAddress      =3D USB_DIR_IN | USB_ACL_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_BULK,
-                .wMaxPacketSize        =3D 0x40,
-                .bInterval             =3D 0x0a,
-            },
-        },
-    },{
-        .bInterfaceNumber              =3D 1,
-        .bAlternateSetting             =3D 0,
-        .bNumEndpoints                 =3D 2,
-        .bInterfaceClass               =3D 0xe0, /* Wireless */
-        .bInterfaceSubClass            =3D 0x01, /* Radio Frequency */
-        .bInterfaceProtocol            =3D 0x01, /* Bluetooth */
-        .eps =3D (USBDescEndpoint[]) {
-            {
-                .bEndpointAddress      =3D USB_DIR_OUT | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0,
-                .bInterval             =3D 0x01,
-            },
-            {
-                .bEndpointAddress      =3D USB_DIR_IN | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0,
-                .bInterval             =3D 0x01,
-            },
-        },
-    },{
-        .bInterfaceNumber              =3D 1,
-        .bAlternateSetting             =3D 1,
-        .bNumEndpoints                 =3D 2,
-        .bInterfaceClass               =3D 0xe0, /* Wireless */
-        .bInterfaceSubClass            =3D 0x01, /* Radio Frequency */
-        .bInterfaceProtocol            =3D 0x01, /* Bluetooth */
-        .eps =3D (USBDescEndpoint[]) {
-            {
-                .bEndpointAddress      =3D USB_DIR_OUT | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x09,
-                .bInterval             =3D 0x01,
-            },
-            {
-                .bEndpointAddress      =3D USB_DIR_IN | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x09,
-                .bInterval             =3D 0x01,
-            },
-        },
-    },{
-        .bInterfaceNumber              =3D 1,
-        .bAlternateSetting             =3D 2,
-        .bNumEndpoints                 =3D 2,
-        .bInterfaceClass               =3D 0xe0, /* Wireless */
-        .bInterfaceSubClass            =3D 0x01, /* Radio Frequency */
-        .bInterfaceProtocol            =3D 0x01, /* Bluetooth */
-        .eps =3D (USBDescEndpoint[]) {
-            {
-                .bEndpointAddress      =3D USB_DIR_OUT | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x11,
-                .bInterval             =3D 0x01,
-            },
-            {
-                .bEndpointAddress      =3D USB_DIR_IN | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x11,
-                .bInterval             =3D 0x01,
-            },
-        },
-    },{
-        .bInterfaceNumber              =3D 1,
-        .bAlternateSetting             =3D 3,
-        .bNumEndpoints                 =3D 2,
-        .bInterfaceClass               =3D 0xe0, /* Wireless */
-        .bInterfaceSubClass            =3D 0x01, /* Radio Frequency */
-        .bInterfaceProtocol            =3D 0x01, /* Bluetooth */
-        .eps =3D (USBDescEndpoint[]) {
-            {
-                .bEndpointAddress      =3D USB_DIR_OUT | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x19,
-                .bInterval             =3D 0x01,
-            },
-            {
-                .bEndpointAddress      =3D USB_DIR_IN | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x19,
-                .bInterval             =3D 0x01,
-            },
-        },
-    },{
-        .bInterfaceNumber              =3D 1,
-        .bAlternateSetting             =3D 4,
-        .bNumEndpoints                 =3D 2,
-        .bInterfaceClass               =3D 0xe0, /* Wireless */
-        .bInterfaceSubClass            =3D 0x01, /* Radio Frequency */
-        .bInterfaceProtocol            =3D 0x01, /* Bluetooth */
-        .eps =3D (USBDescEndpoint[]) {
-            {
-                .bEndpointAddress      =3D USB_DIR_OUT | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x21,
-                .bInterval             =3D 0x01,
-            },
-            {
-                .bEndpointAddress      =3D USB_DIR_IN | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x21,
-                .bInterval             =3D 0x01,
-            },
-        },
-    },{
-        .bInterfaceNumber              =3D 1,
-        .bAlternateSetting             =3D 5,
-        .bNumEndpoints                 =3D 2,
-        .bInterfaceClass               =3D 0xe0, /* Wireless */
-        .bInterfaceSubClass            =3D 0x01, /* Radio Frequency */
-        .bInterfaceProtocol            =3D 0x01, /* Bluetooth */
-        .eps =3D (USBDescEndpoint[]) {
-            {
-                .bEndpointAddress      =3D USB_DIR_OUT | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x31,
-                .bInterval             =3D 0x01,
-            },
-            {
-                .bEndpointAddress      =3D USB_DIR_IN | USB_SCO_EP,
-                .bmAttributes          =3D USB_ENDPOINT_XFER_ISOC,
-                .wMaxPacketSize        =3D 0x31,
-                .bInterval             =3D 0x01,
-            },
-        },
-    }
-};
-
-static const USBDescDevice desc_device_bluetooth =3D {
-    .bcdUSB                        =3D 0x0110,
-    .bDeviceClass                  =3D 0xe0, /* Wireless */
-    .bDeviceSubClass               =3D 0x01, /* Radio Frequency */
-    .bDeviceProtocol               =3D 0x01, /* Bluetooth */
-    .bMaxPacketSize0               =3D 64,
-    .bNumConfigurations            =3D 1,
-    .confs =3D (USBDescConfig[]) {
-        {
-            .bNumInterfaces        =3D 2,
-            .bConfigurationValue   =3D 1,
-            .bmAttributes          =3D USB_CFG_ATT_ONE | USB_CFG_ATT_SELFP=
OWER,
-            .bMaxPower             =3D 0,
-            .nif =3D ARRAY_SIZE(desc_iface_bluetooth),
-            .ifs =3D desc_iface_bluetooth,
-        },
-    },
-};
-
-static const USBDesc desc_bluetooth =3D {
-    .id =3D {
-        .idVendor          =3D 0x0a12,
-        .idProduct         =3D 0x0001,
-        .bcdDevice         =3D 0x1958,
-        .iManufacturer     =3D STR_MANUFACTURER,
-        .iProduct          =3D 0,
-        .iSerialNumber     =3D STR_SERIALNUMBER,
-    },
-    .full =3D &desc_device_bluetooth,
-    .str  =3D desc_strings,
-};
-
-static void usb_bt_fifo_reset(struct usb_hci_in_fifo_s *fifo)
-{
-    fifo->dstart =3D 0;
-    fifo->dlen =3D 0;
-    fifo->dsize =3D DFIFO_LEN_MASK + 1;
-    fifo->start =3D 0;
-    fifo->len =3D 0;
-}
-
-static void usb_bt_fifo_enqueue(struct usb_hci_in_fifo_s *fifo,
-                const uint8_t *data, int len)
-{
-    int off =3D fifo->dstart + fifo->dlen;
-    uint8_t *buf;
-
-    fifo->dlen +=3D len;
-    if (off <=3D DFIFO_LEN_MASK) {
-        if (off + len > DFIFO_LEN_MASK + 1 &&
-                        (fifo->dsize =3D off + len) > (DFIFO_LEN_MASK + 1)=
 * 2) {
-            fprintf(stderr, "%s: can't alloc %i bytes\n", __func__, len);
-            exit(-1);
-        }
-        buf =3D fifo->data + off;
-    } else {
-        if (fifo->dlen > fifo->dsize) {
-            fprintf(stderr, "%s: can't alloc %i bytes\n", __func__, len);
-            exit(-1);
-        }
-        buf =3D fifo->data + off - fifo->dsize;
-    }
-
-    off =3D (fifo->start + fifo->len ++) & CFIFO_LEN_MASK;
-    fifo->fifo[off].data =3D memcpy(buf, data, len);
-    fifo->fifo[off].len =3D len;
-}
-
-static inline void usb_bt_fifo_dequeue(struct usb_hci_in_fifo_s *fifo,
-                USBPacket *p)
-{
-    int len;
-
-    assert(fifo->len !=3D 0);
-
-    len =3D MIN(p->iov.size, fifo->fifo[fifo->start].len);
-    usb_packet_copy(p, fifo->fifo[fifo->start].data, len);
-    if (len =3D=3D p->iov.size) {
-        fifo->fifo[fifo->start].len -=3D len;
-        fifo->fifo[fifo->start].data +=3D len;
-    } else {
-        fifo->start ++;
-        fifo->start &=3D CFIFO_LEN_MASK;
-        fifo->len --;
-    }
-
-    fifo->dstart +=3D len;
-    fifo->dlen -=3D len;
-    if (fifo->dstart >=3D fifo->dsize) {
-        fifo->dstart =3D 0;
-        fifo->dsize =3D DFIFO_LEN_MASK + 1;
-    }
-}
-
-static inline void usb_bt_fifo_out_enqueue(struct USBBtState *s,
-                struct usb_hci_out_fifo_s *fifo,
-                void (*send)(struct HCIInfo *, const uint8_t *, int),
-                int (*complete)(const uint8_t *, int),
-                USBPacket *p)
-{
-    usb_packet_copy(p, fifo->data + fifo->len, p->iov.size);
-    fifo->len +=3D p->iov.size;
-    if (complete(fifo->data, fifo->len)) {
-        send(s->hci, fifo->data, fifo->len);
-        fifo->len =3D 0;
-    }
-
-    /* TODO: do we need to loop? */
-}
-
-static int usb_bt_hci_cmd_complete(const uint8_t *data, int len)
-{
-    len -=3D HCI_COMMAND_HDR_SIZE;
-    return len >=3D 0 &&
-            len >=3D ((struct hci_command_hdr *) data)->plen;
-}
-
-static int usb_bt_hci_acl_complete(const uint8_t *data, int len)
-{
-    len -=3D HCI_ACL_HDR_SIZE;
-    return len >=3D 0 &&
-            len >=3D le16_to_cpu(((struct hci_acl_hdr *) data)->dlen);
-}
-
-static int usb_bt_hci_sco_complete(const uint8_t *data, int len)
-{
-    len -=3D HCI_SCO_HDR_SIZE;
-    return len >=3D 0 &&
-            len >=3D ((struct hci_sco_hdr *) data)->dlen;
-}
-
-static void usb_bt_handle_reset(USBDevice *dev)
-{
-    struct USBBtState *s =3D (struct USBBtState *) dev->opaque;
-
-    usb_bt_fifo_reset(&s->evt);
-    usb_bt_fifo_reset(&s->acl);
-    usb_bt_fifo_reset(&s->sco);
-    s->outcmd.len =3D 0;
-    s->outacl.len =3D 0;
-    s->outsco.len =3D 0;
-}
-
-static void usb_bt_handle_control(USBDevice *dev, USBPacket *p,
-               int request, int value, int index, int length, uint8_t *dat=
a)
-{
-    struct USBBtState *s =3D (struct USBBtState *) dev->opaque;
-    int ret;
-
-    ret =3D usb_desc_handle_control(dev, p, request, value, index, length,=
 data);
-    if (ret >=3D 0) {
-        switch (request) {
-        case DeviceRequest | USB_REQ_GET_CONFIGURATION:
-            s->config =3D 0;
-            break;
-        case DeviceOutRequest | USB_REQ_SET_CONFIGURATION:
-            s->config =3D 1;
-            usb_bt_fifo_reset(&s->evt);
-            usb_bt_fifo_reset(&s->acl);
-            usb_bt_fifo_reset(&s->sco);
-            break;
-        }
-        return;
-    }
-
-    switch (request) {
-    case InterfaceRequest | USB_REQ_GET_STATUS:
-    case EndpointRequest | USB_REQ_GET_STATUS:
-        data[0] =3D 0x00;
-        data[1] =3D 0x00;
-        p->actual_length =3D 2;
-        break;
-    case InterfaceOutRequest | USB_REQ_CLEAR_FEATURE:
-    case EndpointOutRequest | USB_REQ_CLEAR_FEATURE:
-        goto fail;
-    case InterfaceOutRequest | USB_REQ_SET_FEATURE:
-    case EndpointOutRequest | USB_REQ_SET_FEATURE:
-        goto fail;
-        break;
-    case ((USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_DEVICE) << 8):
-        if (s->config)
-            usb_bt_fifo_out_enqueue(s, &s->outcmd, s->hci->cmd_send,
-                            usb_bt_hci_cmd_complete, p);
-        break;
-    default:
-    fail:
-        p->status =3D USB_RET_STALL;
-        break;
-    }
-}
-
-static void usb_bt_handle_data(USBDevice *dev, USBPacket *p)
-{
-    struct USBBtState *s =3D (struct USBBtState *) dev->opaque;
-
-    if (!s->config)
-        goto fail;
-
-    switch (p->pid) {
-    case USB_TOKEN_IN:
-        switch (p->ep->nr) {
-        case USB_EVT_EP:
-            if (s->evt.len =3D=3D 0) {
-                p->status =3D USB_RET_NAK;
-                break;
-            }
-            usb_bt_fifo_dequeue(&s->evt, p);
-            break;
-
-        case USB_ACL_EP:
-            if (s->evt.len =3D=3D 0) {
-                p->status =3D USB_RET_STALL;
-                break;
-            }
-            usb_bt_fifo_dequeue(&s->acl, p);
-            break;
-
-        case USB_SCO_EP:
-            if (s->evt.len =3D=3D 0) {
-                p->status =3D USB_RET_STALL;
-                break;
-            }
-            usb_bt_fifo_dequeue(&s->sco, p);
-            break;
-
-        default:
-            goto fail;
-        }
-        break;
-
-    case USB_TOKEN_OUT:
-        switch (p->ep->nr) {
-        case USB_ACL_EP:
-            usb_bt_fifo_out_enqueue(s, &s->outacl, s->hci->acl_send,
-                            usb_bt_hci_acl_complete, p);
-            break;
-
-        case USB_SCO_EP:
-            usb_bt_fifo_out_enqueue(s, &s->outsco, s->hci->sco_send,
-                            usb_bt_hci_sco_complete, p);
-            break;
-
-        default:
-            goto fail;
-        }
-        break;
-
-    default:
-    fail:
-        p->status =3D USB_RET_STALL;
-        break;
-    }
-}
-
-static void usb_bt_out_hci_packet_event(void *opaque,
-                const uint8_t *data, int len)
-{
-    struct USBBtState *s =3D (struct USBBtState *) opaque;
-
-    if (s->evt.len =3D=3D 0) {
-        usb_wakeup(s->intr, 0);
-    }
-    usb_bt_fifo_enqueue(&s->evt, data, len);
-}
-
-static void usb_bt_out_hci_packet_acl(void *opaque,
-                const uint8_t *data, int len)
-{
-    struct USBBtState *s =3D (struct USBBtState *) opaque;
-
-    usb_bt_fifo_enqueue(&s->acl, data, len);
-}
-
-static void usb_bt_unrealize(USBDevice *dev, Error **errp)
-{
-    struct USBBtState *s =3D (struct USBBtState *) dev->opaque;
-
-    s->hci->opaque =3D NULL;
-    s->hci->evt_recv =3D NULL;
-    s->hci->acl_recv =3D NULL;
-}
-
-static void usb_bt_realize(USBDevice *dev, Error **errp)
-{
-    struct USBBtState *s =3D USB_BT(dev);
-
-    usb_desc_create_serial(dev);
-    usb_desc_init(dev);
-    s->dev.opaque =3D s;
-    if (!s->hci) {
-        s->hci =3D bt_new_hci(qemu_find_bt_vlan(0));
-    }
-    s->hci->opaque =3D s;
-    s->hci->evt_recv =3D usb_bt_out_hci_packet_event;
-    s->hci->acl_recv =3D usb_bt_out_hci_packet_acl;
-    usb_bt_handle_reset(&s->dev);
-    s->intr =3D usb_ep_get(dev, USB_TOKEN_IN, USB_EVT_EP);
-}
-
-static USBDevice *usb_bt_init(USBBus *bus, const char *cmdline)
-{
-    USBDevice *dev;
-    struct USBBtState *s;
-    HCIInfo *hci;
-    const char *name =3D TYPE_USB_BT;
-
-    if (*cmdline) {
-        hci =3D hci_init(cmdline);
-    } else {
-        hci =3D bt_new_hci(qemu_find_bt_vlan(0));
-    }
-    if (!hci)
-        return NULL;
-
-    dev =3D usb_create(bus, name);
-    s =3D USB_BT(dev);
-    s->hci =3D hci;
-    return dev;
-}
-
-static const VMStateDescription vmstate_usb_bt =3D {
-    .name =3D "usb-bt",
-    .unmigratable =3D 1,
-};
-
-static void usb_bt_class_initfn(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(klass);
-    USBDeviceClass *uc =3D USB_DEVICE_CLASS(klass);
-
-    uc->realize        =3D usb_bt_realize;
-    uc->product_desc   =3D "QEMU BT dongle";
-    uc->usb_desc       =3D &desc_bluetooth;
-    uc->handle_reset   =3D usb_bt_handle_reset;
-    uc->handle_control =3D usb_bt_handle_control;
-    uc->handle_data    =3D usb_bt_handle_data;
-    uc->unrealize      =3D usb_bt_unrealize;
-    dc->vmsd =3D &vmstate_usb_bt;
-    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
-}
-
-static const TypeInfo bt_info =3D {
-    .name          =3D TYPE_USB_BT,
-    .parent        =3D TYPE_USB_DEVICE,
-    .instance_size =3D sizeof(struct USBBtState),
-    .class_init    =3D usb_bt_class_initfn,
-};
-
-static void usb_bt_register_types(void)
-{
-    type_register_static(&bt_info);
-    usb_legacy_register(TYPE_USB_BT, "bt", usb_bt_init);
-}
-
-type_init(usb_bt_register_types)
diff --git a/qemu-doc.texi b/qemu-doc.texi
index ed3df01dac..eea91a2d1e 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -983,21 +983,6 @@ For instance, user-mode networking can be used with
 Smartcard reader device
 @item usb-audio
 USB audio device
-@item usb-bt-dongle
-Bluetooth dongle for the transport layer of HCI. It is connected to HCI
-scatternet 0 by default (corresponds to @code{-bt hci,vlan=3D0}).
-Note that the syntax for the @code{-device usb-bt-dongle} option is not as
-useful yet as it was with the legacy @code{-usbdevice} option. So to
-configure an USB bluetooth device, you might need to use
-"@code{-usbdevice bt}[:@var{hci-type}]" instead. This configures a
-bluetooth dongle whose type is specified in the same format as with
-the @option{-bt hci} option, @pxref{bt-hcis,,allowed HCI types}.  If
-no type is given, the HCI logic corresponds to @code{-bt hci,vlan=3D0}.
-This USB device implements the USB Transport Layer of HCI.  Example
-usage:
-@example
-@command{@value{qemu_system}} [...@var{OPTIONS}...] @option{-usbdevice} bt=
:hci,vlan=3D3 @option{-bt} device:keyboard,vlan=3D3
-@end example
 @end table
=20
 @node host_usb_devices
--=20
2.23.0
