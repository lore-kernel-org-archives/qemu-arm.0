Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3223850wre;
        Mon, 28 May 2018 23:29:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIZRs0VJUEs0KCnUlAIBA4NqYZbdJWtPbdHbt3AEAK3M0CqDqlsGutxTDUTf+Hx+PSxphjw
X-Received: by 2002:ac8:6d2:: with SMTP id j18-v6mr14656597qth.306.1527575352694;
        Mon, 28 May 2018 23:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527575352; cv=none;
        d=google.com; s=arc-20160816;
        b=kw8656OU6HoaD2do3vYC5fse2JzQzPOGhubw6RuQOimItV9fpbGCmVPvymYIwzSc2U
         x9tA7JT76f8bm0Yuv9qgw07wReqz0o1M6ZBghxrXfTQZnAolTbJwU2A0Kue4QqqS5oJz
         rXBVhPt0OZ2QF312N5CqxbazVZtEGvCU2jRrjgyRuhYg/pI60xKzJEdssQor2DWVAWzx
         10wMdS/G2CNBkZGyXpO9eNjgmTdXswiIb6GlDg4biA6DmgBlL5NjLDrPZ62ddARMqcfN
         3eKN+wxjwSsgv/21IgRstDlaIpJCeqQuoWGWIj3x7ybzdFajEyWXdAhPlNrbsF4ck4av
         ASSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4L1VWf4YKhBQH7wnEpC3/asJkFmdXjoSrUrrVW2KAy0=;
        b=XOSQHL1QEM93eNTqy0jdXupg3MG855J3PUtVzWKaCRJjgFOTxX5Mx0XYzxw3JVe1vH
         j+INjlfLv2gE9/11cekmbU/9PG5eFhQOxU7ZUfOuuWILB9J31sKnrGMWCiYL/EZNbJr9
         DIaMZMuBk+C7KZCZM2cwqNR1XAXWSJtC6UYlbONox/BPF0Jj2xafhAKvdIs9LZvHy/c0
         nnpanEwls0OhDmYMzcgiaMd3B6Wzoe3R6B9IQ0tVvdQJ8H9L1iUxP9ixKlB589ynNZj3
         pKuwB62NAXORVy4UQVnLzmFtsGmVCvDtKp5OhBlotsmORqnzN2rhxH7DEyw1RM4REqMA
         2b7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r11-v6si3471371qkk.248.2018.05.28.23.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 23:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNY88-0001K6-4O
	for alex.bennee@linaro.org; Tue, 29 May 2018 02:29:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY7y-0001Ic-Ne
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:29:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNY7v-0001T0-J3
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:29:02 -0400
Received: from 6.mo68.mail-out.ovh.net ([46.105.63.100]:49222)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNY7v-0001Rf-Cf
	for qemu-arm@nongnu.org; Tue, 29 May 2018 02:28:59 -0400
Received: from player718.ha.ovh.net (unknown [10.109.120.5])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id C31BFE5182
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 08:28:57 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id 7B9FD4E00AE;
	Tue, 29 May 2018 08:28:52 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Date: Tue, 29 May 2018 08:28:34 +0200
Message-Id: <20180529062838.20556-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180529062838.20556-1-clg@kaod.org>
References: <20180529062838.20556-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17521535827166137264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheejgddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.63.100
Subject: [Qemu-arm] [PATCH 2/6] ftgmac100: add IEEE 802.1Q VLAN support
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
X-TUID: Fv8lJmi1QKhJ

The ftgmac100 NIC supports VLAN tag insertion and the MAC engine also
has a control to remove VLAN tags from received packets.

The VLAN control bits and VLAN tag information are contained in the
second word of the transmit and receive descriptors. The Insert VLAN
bit and the VLAN Tag available bit are only valid in the first segment
of the packet.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 7598d08c9cb9..50af1222464a 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -443,6 +443,24 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint3=
2_t tx_ring,
             break;
         }
=20
+        /* Check for VLAN */
+        if (bd.des0 & FTGMAC100_TXDES0_FTS &&
+            bd.des1 & FTGMAC100_TXDES1_INS_VLANTAG &&
+            be16_to_cpu(PKT_GET_ETH_HDR(ptr)->h_proto) !=3D ETH_P_VLAN) =
{
+            if (frame_size + len + 4 > sizeof(s->frame)) {
+                qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d b=
ytes\n",
+                              __func__, len);
+                s->isr |=3D FTGMAC100_INT_XPKT_LOST;
+                len =3D  sizeof(s->frame) - frame_size - 4;
+            }
+            memmove(ptr + 16, ptr + 12, len - 12);
+            ptr[12] =3D 0x81;
+            ptr[13] =3D 0x00;
+            ptr[14] =3D (uint8_t) bd.des1 >> 8;
+            ptr[15] =3D (uint8_t) bd.des1;
+            len +=3D 4;
+        }
+
         ptr +=3D len;
         frame_size +=3D len;
         if (bd.des0 & FTGMAC100_TXDES0_LTS) {
@@ -858,7 +876,19 @@ static ssize_t ftgmac100_receive(NetClientState *nc,=
 const uint8_t *buf,
             buf_len +=3D size - 4;
         }
         buf_addr =3D bd.des3;
-        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
+        if (first && proto =3D=3D ETH_P_VLAN && buf_len >=3D 18) {
+            bd.des1 =3D (buf[14] << 8) | buf[15] | FTGMAC100_RXDES1_VLAN=
TAG_AVAIL;
+            if (s->maccr & FTGMAC100_MACCR_RM_VLAN) {
+                dma_memory_write(&address_space_memory, buf_addr, buf, 1=
2);
+                dma_memory_write(&address_space_memory, buf_addr + 12, b=
uf + 16,
+                                 buf_len - 16);
+            } else {
+                dma_memory_write(&address_space_memory, buf_addr, buf, b=
uf_len);
+            }
+        } else {
+            bd.des1 =3D 0;
+            dma_memory_write(&address_space_memory, buf_addr, buf, buf_l=
en);
+        }
         buf +=3D buf_len;
         if (size < 4) {
             dma_memory_write(&address_space_memory, buf_addr + buf_len,
--=20
2.13.6

