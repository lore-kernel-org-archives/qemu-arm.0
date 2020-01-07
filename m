Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24333617lff;
        Mon, 6 Jan 2020 23:56:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyEarJ0snxYFFQYjU4ugpHFCfP9A1bQqPEmc9pCswoom4ELV/ca7S1PHG7aBO6XVEPvHESy
X-Received: by 2002:a50:e3c5:: with SMTP id c5mr111001380edm.7.1578383782057;
        Mon, 06 Jan 2020 23:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578383782; cv=none;
        d=google.com; s=arc-20160816;
        b=Fr2EZRz3aCfL1/Zcu2gKgkPhBhSsEGGsm4pJLsF7k6pKpntwAj25vf/dMOTSC+rHm+
         /BZl63TBNqRu8DNf2Dah2bhEGuKD2A7osskYPEycV8rxM+x547N0bQk23XtncULpL78n
         qb16NaPE8zhwdHrXlaJCCKXhIfyirAVJI6fDUnhLH0aoDsh6iA1ctRvZwaFQ3HFIjMHY
         IoZDOUW6ERqIhOO7irkdzyLAaLQudDZVxlGRKe3ABBiZZnK4IP2rVjJfk65Qh/PQQG0p
         NZhuVTuBkFMLkfalPzBwx8jmFeNH7MYK1nURn/ZU9Bevsvz8qnMqyCg8S3CFRgv/HTJt
         6iNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Tt7Mm5Hv8y/VOx8sreW8/Y3dO75Ys/n8MQ8rGpcHAdI=;
        b=CUynrlqkXo9Il1kNhbsV3ku492PsffIerKwPkrlgCAUWYlaLbn5oMLyEm9AnL168Kd
         wAU7t6bBXKCYVaA09d4z7RwAzbDJfp9TINzdcVKh0qfCy77Uzh9p4sJ99Gm9/4Toef0w
         QYCxnW8ZCxNefAtQPMMv10iQRRk6+WJ0BgQDSpjUIWb0PAfEoR8cZed3bMZIqGb1m1MK
         TqMS6SMoqo0Lkguh7KNxX5BZEWQhh/2xCTjiFEVYw6KSo7CsZZw4KSSvuFuyCLEH7iHM
         ypHtmuYZUcJrgp/arjs6bwcWvl71IJX+s/bON2AUJbCAFlvsyM0809JWeu2hvmTZA9Qd
         9oIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22si45826799edq.69.2020.01.06.23.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 23:56:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iojir-00017Q-K8
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 02:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iojOD-0002fm-JH
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iojOC-0006qr-AV
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:57 -0500
Received: from 20.mo5.mail-out.ovh.net ([91.121.55.239]:54738)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iojOC-0006pl-43
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 02:34:56 -0500
Received: from player755.ha.ovh.net (unknown [10.108.1.20])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 8E0752658D1
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 08:34:54 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id AD922DFE0D2B;
 Tue,  7 Jan 2020 07:34:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/5] ftgmac100: check RX and TX buffer alignment
Date: Tue,  7 Jan 2020 08:34:21 +0100
Message-Id: <20200107073423.30043-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200107073423.30043-1-clg@kaod.org>
References: <20200107073423.30043-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3791467940324739857
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepud
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.121.55.239
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p4YuPqqJsGr1

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

