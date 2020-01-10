Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp500315lff;
        Fri, 10 Jan 2020 02:28:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzQXLxWfUqFZ0GukccaK4NJSTAY99JUWQQsL/uV2p9r15OQBEYnegJ8E07XszaqKfrI2gSr
X-Received: by 2002:ac8:6697:: with SMTP id d23mr1792057qtp.350.1578652101612;
        Fri, 10 Jan 2020 02:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578652101; cv=none;
        d=google.com; s=arc-20160816;
        b=mbm7pNuPUxXtDW87e6tvD3I6H6RxaFX/dXZrY1U6I7iVUmx0Tz3AdoyF0fzWzOyp2O
         4CqGR+FHpJmC2Xgp0vTqNdnEF/H7MFffYGGyf+EqSvFo45gVmqyPZQcTjvVB9OY+6OD6
         2ovN41aqqIdkgRtOHb7NhL2NryYdgLmfZXzC5WHyfuXTj/ORTV4A+fZoGKiu7eqWSaia
         JYzJpYVd8vvtLYzuBQK8H9e5+g0JUjEPUFZ+/44TUQwQ9djxQVLNvqNXua1qIT2/oqRt
         zad0YIVUsmF36eXmLtm8fsg5G09KNVTGjSaDCvPlmSYpkf6GbB9rmNXArgy1zatMJ20Y
         hbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Tt7Mm5Hv8y/VOx8sreW8/Y3dO75Ys/n8MQ8rGpcHAdI=;
        b=WSlBnyGwg0LPJ9YDUfEPdcBi+YcKhqwiTh0t/acKgaSiyDZP7MQrcQwrahf6nsHut5
         Jk05Sq8GH8kJBZQMdBMPYdOiufNFf19Q1NX+D0TJbGx+NvigWSIw6AfYnBoLCiJ9CNgF
         LdRcJ+zPSmkh9kZihrLzHbR/1SfGi6HD9IikgTXhT6FULJ8axU8DoslaKUXqdYNP9z1H
         ifBs/yLdUbxyOEfamHhExR59wjKeUXflF1UNhgdo5GKpUenWc7sK30auckwxLKW1KH1I
         1uibWhng7Fb0MO0nGKGd4DEzhf5dW2ZEKM95vyCDMUTOU2t5vIpZge/4TB9qwL3jFkS1
         cFiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si1030013qkg.62.2020.01.10.02.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 02:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iprWe-00070r-DD
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 05:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iprUI-00038c-Rv
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iprUH-0006X1-P6
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:54 -0500
Received: from 13.mo3.mail-out.ovh.net ([188.165.33.202]:34605)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iprUH-0006R5-I7
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:53 -0500
Received: from player786.ha.ovh.net (unknown [10.108.1.121])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id C885623CA1C
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2020 11:25:51 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 8F3E2E3A06D6;
 Fri, 10 Jan 2020 10:25:43 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/5] ftgmac100: check RX and TX buffer alignment
Date: Fri, 10 Jan 2020 11:25:16 +0100
Message-Id: <20200110102518.4233-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200110102518.4233-1-clg@kaod.org>
References: <20200110102518.4233-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5849894445101845265
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepvd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.33.202
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
X-TUID: TV9qCmFXyD8Z

These buffers should be aligned on 16 bytes.

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

