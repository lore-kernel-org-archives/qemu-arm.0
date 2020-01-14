Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5331746lff;
        Tue, 14 Jan 2020 02:37:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwzPGYrzrIA5PgW6RGEMcfTtGzIhXmqamv8sBmwKolZHEgoaYHltiLfAqUiS7ebKh4inOAg
X-Received: by 2002:a17:906:60c9:: with SMTP id f9mr21826089ejk.273.1578998250761;
        Tue, 14 Jan 2020 02:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578998250; cv=none;
        d=google.com; s=arc-20160816;
        b=DRsR+Ti8kv51KIW2zpH9WCIruL1Z7tUoWyENOY9wYaY3X2QM6bq1lsUx09Gwgvgr6w
         y3uTLsglyBWv28Y02wNimc7PuZSo+6ys61+wPgGPkkMjklOaV4J85vrjY58ZUCSPX8db
         xM+xxPDVVKMacC9RA8Xmz0I0SW+Wz7EJLzfTnfY4EbpHC7srOZ2GfzzQRj9b6YEqsJgW
         SdkQZtPRBHk4cW5fnym+/REXyJJ3MHi2O/6LYVxMfczvbk5jHwEtKT88fVQimPQDb2DT
         WF/2Ch20JXeVMMEvTFXM4qgu2xrd/CcXiw/dye5oyCNBjqStN830F7s8fzfnk5C7vD0H
         C9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=e0WDtpFJEiOvLRUu8B3PJgh8dv1Xn4y/+Fv1eR90fXo=;
        b=dr8kofBi2sX+ssvgA3/AHWZ4wlK64z6bvM9Px6KAhhmvw5dsg44PSh6ieWikFcRnGe
         6PopxuWlO1LhAUJEI1InCXzFXyE/PQs9VlG+3+AHRPm07a6IZbSwCAyIpCEE7nqvbxU/
         AEv0hywInSGDgRXYQoZc1QV5RyPx8GgKPGQBUeGLhcgW5EdVF3sK+kVFgRiMqG0La/RB
         XHWK6DRetJQuFQz0CaMhwPxcLQS5f+AqC7pReVAd13f9BPUQqQBGlErjhG5NKmFI6ePQ
         OvehRBV09wlZ1Rtlyyobi98n8qU1TJRtwqlGpj9o6rGIlCXCZL8NdcwKPo2W6s2mBckR
         wQIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25si8917521edv.168.2020.01.14.02.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 02:37:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irJZh-0007G9-OR
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 05:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1irJXa-00053b-T6
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1irJXX-0003hI-3u
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:18 -0500
Received: from 9.mo177.mail-out.ovh.net ([46.105.72.238]:50159)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1irJXW-0003gx-Dm
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:15 -0500
Received: from player798.ha.ovh.net (unknown [10.108.54.74])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id DEA5011E26A
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 11:35:12 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 9D929E4CFF14;
 Tue, 14 Jan 2020 10:35:03 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 3/5] ftgmac100: check RX and TX buffer alignment
Date: Tue, 14 Jan 2020 11:34:31 +0100
Message-Id: <20200114103433.30534-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200114103433.30534-1-clg@kaod.org>
References: <20200114103433.30534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11051833489830087441
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.72.238
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DphnMULbL7J0

These buffers should be aligned on 16 bytes.

Ignore invalid RX and TX buffer addresses and log an error. All
incoming and outgoing traffic will be dropped because no valid RX or
TX descriptors will be available.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 86ac25894a89..051f7b7af2d6 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -198,6 +198,8 @@ typedef struct {
     uint32_t        des3;
 } FTGMAC100Desc;
=20
+#define FTGMAC100_DESC_ALIGNMENT 16
+
 /*
  * Specific RTL8211E MII Registers
  */
@@ -722,6 +724,12 @@ static void ftgmac100_write(void *opaque, hwaddr add=
r,
         s->itc =3D value;
         break;
     case FTGMAC100_RXR_BADR: /* Ring buffer address */
+        if (!QEMU_IS_ALIGNED(value, FTGMAC100_DESC_ALIGNMENT)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad RX buffer alignment =
0x%"
+                          HWADDR_PRIx "\n", __func__, value);
+            return;
+        }
+
         s->rx_ring =3D value;
         s->rx_descriptor =3D s->rx_ring;
         break;
@@ -731,6 +739,11 @@ static void ftgmac100_write(void *opaque, hwaddr add=
r,
         break;
=20
     case FTGMAC100_NPTXR_BADR: /* Transmit buffer address */
+        if (!QEMU_IS_ALIGNED(value, FTGMAC100_DESC_ALIGNMENT)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad TX buffer alignment =
0x%"
+                          HWADDR_PRIx "\n", __func__, value);
+            return;
+        }
         s->tx_ring =3D value;
         s->tx_descriptor =3D s->tx_ring;
         break;
--=20
2.21.1

