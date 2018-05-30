Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4385969wre;
        Tue, 29 May 2018 23:21:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKVfSIdVvhnUuEQSsAd1nY/qn+6F2lXXrPDyREqCk19y2TSoFaRsFi//z1/nP86STU9/UVw
X-Received: by 2002:a0c:9e5a:: with SMTP id z26-v6mr1291450qve.109.1527661319181;
        Tue, 29 May 2018 23:21:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527661319; cv=none;
        d=google.com; s=arc-20160816;
        b=Kho+kUHuOn04ywDDMwfsBf2h0LYBsbXpJd9rDbWobkZ4uZxkUj2zaI8yJixfRddgRf
         vZX5f+hH4yIhGmDSyjoL7RtbPj5wTaCt1JqntQS0BEExDce5MJ6v4IdsvQwoEMFzNHrO
         puIghyNEQY1a7I5Sk3dW1AgxyUKppazfqfaeHhqWGL1Hgy/k2yG6Ei+Q/GAOd0DmTKul
         tMsxxYbOc2jOp6wCdv22BLQpId00JnJKiuaDINg8HWBGmZjSB6z5yhLeFM152ez99TGL
         aGVXRcMilap4c2u/kcKtTFijvjsroHHD4uSLjTBEr8qROJl8E79PDX/FY4MJsAMniYtJ
         U/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Q4Ms2rZAhjCOf9UOIm2ogC5HSFXC51c2Ysi0rJwn3NA=;
        b=ecQgGgMPZzKZOOFNl+NaNvJK37SetxGYYA1c2tSQnIILCyfUeFkSo+5abDBaYQdtRM
         WzQiveBRTNbbqCFbZ9h6f04Msv/7XECQ/cilF0YYVSprZu0duuZ+lA4GfhRZE4H/KLGY
         Zc+v8G2XvA0OrOT+tFOk/tfGTVpEuAuv6EfuXQ1Fa0HOVNMKuGoTjpB72JlLgYt6kDQM
         7PiGJB5vi2GHm/trZ/zFwruvSPUrV7GwL7j7VYdfaSaxEjPiimXZWhFjHZrAJ6cx1DHv
         mPmWFWj9Igr4ti98E22fiJQyxZD0s5F5S1TwUgCIpyiJaP5rMgM90e5vPs+TDUkU+vO6
         r4yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g103-v6si9021402qkh.42.2018.05.29.23.21.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:21:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuUg-0004zE-LZ
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:21:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuQS-00024E-76
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:17:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fNuQP-0001E8-0Z
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:17:36 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:50687)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fNuQO-0001Dm-Qn
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:17:32 -0400
Received: from player718.ha.ovh.net (unknown [10.109.120.47])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id A706415CA5
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 08:17:31 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player718.ha.ovh.net (Postfix) with ESMTPSA id 6B6374E009E;
	Wed, 30 May 2018 08:17:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 May 2018 08:17:09 +0200
Message-Id: <20180530061711.23673-3-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180530061711.23673-1-clg@kaod.org>
References: <20180530061711.23673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 4754393832553614335
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrheelgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.44.197
Subject: [Qemu-devel] [PATCH v2 2/4] ftgmac100: add IEEE 802.1Q VLAN support
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eTqWjQDfrbb1

The ftgmac100 NIC supports VLAN tag insertion and the MAC engine also
has a control to remove VLAN tags from received packets.

The VLAN control bits and VLAN tag information are contained in the
second word of the transmit and receive descriptors. The Insert VLAN
bit and the VLAN Tag available bit are only valid in the first segment
of the packet.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---

 Changes since v1:

 - replaced byte shifting by store/load helpers
=20
 hw/net/ftgmac100.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 425ac36cff87..abf80655f28f 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -443,6 +443,22 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint3=
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
+            stw_be_p(ptr + 12, ETH_P_VLAN);
+            stw_be_p(ptr + 14, bd.des1);
+            len +=3D 4;
+        }
+
         ptr +=3D len;
         frame_size +=3D len;
         if (bd.des0 & FTGMAC100_TXDES0_LTS) {
@@ -864,7 +880,20 @@ static ssize_t ftgmac100_receive(NetClientState *nc,=
 const uint8_t *buf,
             buf_len +=3D size - 4;
         }
         buf_addr =3D bd.des3;
-        dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
+        if (first && proto =3D=3D ETH_P_VLAN && buf_len >=3D 18) {
+            bd.des1 =3D lduw_be_p(buf + 14) | FTGMAC100_RXDES1_VLANTAG_A=
VAIL;
+
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

