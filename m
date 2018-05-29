Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3223928wre;
        Mon, 28 May 2018 23:29:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ+HvbFHJVkDitEYkc8R0mVVMfUBZjCrTo3keesbh7Nf/rCNEEUWoQRtRqf0BgwTqD3I2AV
X-Received: by 2002:a37:9342:: with SMTP id v63-v6mr14669633qkd.40.1527575361090;
        Mon, 28 May 2018 23:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527575361; cv=none;
        d=google.com; s=arc-20160816;
        b=RtYd5cZF1zM1wfGmAROJbRlhXfMpoINAA3U3hHzDgBgB+awa2OJeu8O82pASQ3RES1
         SAifTo76J7kpWL2Z6R9OomxijyWcsXBeANIniVr7HAApm+0MWFTrP889sjxcjHZn6xt7
         iRgyCtdjQsUMKLAPgD58NTlzoSdGgDFYNciUa7DZLTMlK0eCyVExJSIynoasazoVQKEd
         XbT/uaoZ+TzD7a7D4EBgW/v9kkmnyrqo/6MFLulTu6y5/yavAxVlO99uMGqWTAfJnyKL
         BSp7CxkocP9hgPuoyF/Xg/FNMQtGYjjEmVeb8UwpuBw+V1IdTXUYbh+dLRfHYZt1eg4m
         EGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=oz9KBNrGlPWG9RQ8EeSlDe6mufYbmKLHh3YMM1h08NQ=;
        b=cFX0Szpszt0+yB44icNsk5EK6eiAQZXVgxz/rWORElCiLuI3pZ8tkFchWvtj0FIMVg
         8fKb2xZleKeidPqFbBe7hUYebWcrwkR2ED5HtfTR3w7KJ7kiw9vQJ6sCDHelqhTGBZqI
         I1OVQ6no1/NzJgGx255vWoHl/3bwsJh0WsPQZXRYeRTDKHe7UamVtt/U312WBTwkqch0
         Rkf3VuF5Jm1vLcDcehV5VF48jni1EqwJQoiaT8gmbWSNcpo2oY9gKdM+xarO16a9KBre
         4PsaksQWDLHtNGnQBNX7gL/EfVxsHWy9vQt/Clt0N7186AqpWZJaxHR3Sx76AMYmmK7p
         GyBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y48-v6si8245134qta.177.2018.05.28.23.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 23:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNY8G-0001N6-Gz
	for alex.bennee@linaro.org; Tue, 29 May 2018 02:29:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY81-0001KH-9l
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY7x-0001VD-WF
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:29:05 -0400
Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149]:36930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNY7x-0001N6-Pe
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:29:01 -0400
Received: from player718.ha.ovh.net (unknown [10.109.108.88])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id EA5CFB24C6
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 08:28:52 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id 479C54E008A;
	Tue, 29 May 2018 08:28:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Date: Tue, 29 May 2018 08:28:33 +0200
Message-Id: <20180529062838.20556-2-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180529062838.20556-1-clg@kaod.org>
References: <20180529062838.20556-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17520128450964327344
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.61.149
Subject: [Qemu-arm] [PATCH 1/6] ftgmac100: compute maximum frame size
 depending on the protocol
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pDEkjGVY2rUn

The maximum frame size includes the CRC and depends if a VLAN tag is
inserted or not. Adjust the frame size limit in the transmit handler
using on the FTGMAC100State buffer size and in the receive handler use
the packet protocol.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/net/ftgmac100.h |  7 ++++++-
 hw/net/ftgmac100.c         | 23 ++++++++++++-----------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index d9bc589fbf72..94cfe0533297 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -16,6 +16,11 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
=20
+/*
+ * Max frame size for the receiving buffer
+ */
+#define FTGMAC100_MAX_FRAME_SIZE    9220
+
 typedef struct FTGMAC100State {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -26,7 +31,7 @@ typedef struct FTGMAC100State {
     qemu_irq irq;
     MemoryRegion iomem;
=20
-    uint8_t *frame;
+    uint8_t frame[FTGMAC100_MAX_FRAME_SIZE];
=20
     uint32_t irq_state;
     uint32_t isr;
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index a6d27a7b01df..7598d08c9cb9 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -207,16 +207,18 @@ typedef struct {
 /*
  * Max frame size for the receiving buffer
  */
-#define FTGMAC100_MAX_FRAME_SIZE    10240
+#define FTGMAC100_MAX_FRAME_SIZE    9220
=20
 /* Limits depending on the type of the frame
  *
  *   9216 for Jumbo frames (+ 4 for VLAN)
  *   1518 for other frames (+ 4 for VLAN)
  */
-static int ftgmac100_max_frame_size(FTGMAC100State *s)
+static int ftgmac100_max_frame_size(FTGMAC100State *s, uint16_t proto)
 {
-    return (s->maccr & FTGMAC100_MACCR_JUMBO_LF ? 9216 : 1518) + 4;
+    int max =3D (s->maccr & FTGMAC100_MACCR_JUMBO_LF ? 9216 : 1518);
+
+    return max + (proto =3D=3D ETH_P_VLAN ? 4 : 0);
 }
=20
 static void ftgmac100_update_irq(FTGMAC100State *s)
@@ -408,7 +410,6 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32=
_t tx_ring,
     uint8_t *ptr =3D s->frame;
     uint32_t addr =3D tx_descriptor;
     uint32_t flags =3D 0;
-    int max_frame_size =3D ftgmac100_max_frame_size(s);
=20
     while (1) {
         FTGMAC100Desc bd;
@@ -427,11 +428,12 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint=
32_t tx_ring,
             flags =3D bd.des1;
         }
=20
-        len =3D bd.des0 & 0x3FFF;
-        if (frame_size + len > max_frame_size) {
+        len =3D FTGMAC100_TXDES0_TXBUF_SIZE(bd.des0);
+        if (frame_size + len > sizeof(s->frame)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes=
\n",
                           __func__, len);
-            len =3D max_frame_size - frame_size;
+            s->isr |=3D FTGMAC100_INT_XPKT_LOST;
+            len =3D  sizeof(s->frame) - frame_size;
         }
=20
         if (dma_memory_read(&address_space_memory, bd.des3, ptr, len)) {
@@ -788,7 +790,8 @@ static ssize_t ftgmac100_receive(NetClientState *nc, =
const uint8_t *buf,
     uint32_t buf_len;
     size_t size =3D len;
     uint32_t first =3D FTGMAC100_RXDES0_FRS;
-    int max_frame_size =3D ftgmac100_max_frame_size(s);
+    uint16_t proto =3D be16_to_cpu(PKT_GET_ETH_HDR(buf)->h_proto);
+    int max_frame_size =3D ftgmac100_max_frame_size(s, proto);
=20
     if ((s->maccr & (FTGMAC100_MACCR_RXDMA_EN | FTGMAC100_MACCR_RXMAC_EN=
))
          !=3D (FTGMAC100_MACCR_RXDMA_EN | FTGMAC100_MACCR_RXMAC_EN)) {
@@ -814,9 +817,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc, =
const uint8_t *buf,
=20
     /* Huge frames are truncated.  */
     if (size > max_frame_size) {
-        size =3D max_frame_size;
         qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %zd bytes\n"=
,
                       __func__, size);
+        size =3D max_frame_size;
         flags |=3D FTGMAC100_RXDES0_FTL;
     }
=20
@@ -934,8 +937,6 @@ static void ftgmac100_realize(DeviceState *dev, Error=
 **errp)
                           object_get_typename(OBJECT(dev)), DEVICE(dev)-=
>id,
                           s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
-
-    s->frame =3D g_malloc(FTGMAC100_MAX_FRAME_SIZE);
 }
=20
 static const VMStateDescription vmstate_ftgmac100 =3D {
--=20
2.13.6

