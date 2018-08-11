Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp785375wru;
        Sat, 11 Aug 2018 02:12:07 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx0QsCifP5Vle1KjhEAhRWtUKapye8nioF6LHALNFSOsX16Q6XuzYDFO/GGMxO1En/waAoW
X-Received: by 2002:a0c:aa46:: with SMTP id e6-v6mr8617564qvb.50.1533978727381;
        Sat, 11 Aug 2018 02:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533978727; cv=none;
        d=google.com; s=arc-20160816;
        b=hodkY3GDop31jiq4KB7STrTygxlOD5MAllq/IXw3dJCP5y3FoHKWhL8InmEUetPI0s
         owFkuGWzbiu4i8k/rWmPpMnNkhX80bnBo8TCc8xY5zQp95GDvrVU+shq40b7mzyWmMmD
         i9XSaX4OkZ55GGfVnfxFUTmFY6U9OQLfUzY488tHqJhIoCvN7iNbP1SZk5xPLt8qdLyK
         yjP3ehpRitQWH4Gv95jM19s4A0IdJcNA4wzrjxuZlx1KoYEzbKkZkC31w5uobsbzxHzL
         PQVFeNg2t5e0GsfXTtyYhgpGV11P7R0kuBE0qg4F+Dz1KVIv3zY2TKSaJAITF4BRZFNY
         poQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Oq0odNywSrtzahWCv+jUPCROJETs86AVotecmXNJZd8=;
        b=wV9PvGtTUglqXH432SsGICLVUmgtuz6MY+LyPrRE+hBL6Q5ERQjx4vkbv7byW72voN
         j0CV1LpU5gaam0T3Tr57a3QBwpHDI5VjEKo9I7DDWgWQ9u3dYHWydVpKyDiYX+yT6qp/
         QZXtBay/4TWjz9GHAgIdEuP8NGymr9gdfDHDUv7nexEZc7s1TqFSBCQf3piwinon4pqh
         nY1tAqnYWkaKdL0tbseCh+sh6xolzVKrm0y6vxPZO3AvqoKVqVfT6btV/dELoxTgNNHd
         GFLS7P/5Q1jfA4DwYd0m0oyMkHSiayxMAoFgXzZr80/dG1y4i6z+IrmujKMJhfj/esiO
         q6zA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q11-v6si11756823qkl.387.2018.08.11.02.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Aug 2018 02:12:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1foPwM-0000ll-Ns
	for alex.bennee@linaro.org; Sat, 11 Aug 2018 05:12:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPtD-0005tr-B4
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPt6-00017e-Il
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:48 -0400
Received: from steffen-goertz.de ([88.198.119.201]:34660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1foPt6-00015R-Be; Sat, 11 Aug 2018 05:08:44 -0400
Received: from localhost.localdomain (tmo-080-6.customers.d1-online.com
	[80.187.80.6])
	by steffen-goertz.de (Postfix) with ESMTPSA id 0008F4BBA2;
	Sat, 11 Aug 2018 11:05:34 +0200 (CEST)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Sat, 11 Aug 2018 11:08:30 +0200
Message-Id: <20180811090836.4024-2-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180811090836.4024-1-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH 1/7] hw/arm/nrf51_soc: nRF51 Calculate peripheral
 id from base address
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBU488Xh2xeO

The base address determines a peripherals id, which identifies its
interrupt line, see NRF51 reference manual section 10 peripheral
interface. This little gem calculates the peripheral id based
on its base address.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/nrf51_soc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 9f9649c780..441d05e1ef 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -38,6 +38,9 @@
 #define NRF51822_FLASH_SIZE     (256 * 1024)
 #define NRF51822_SRAM_SIZE      (16 * 1024)
=20
+/* IRQ lines can be derived from peripheral base addresses */
+#define BASE_TO_IRQ(base) (((base) >> 12) & 0x1F)
+
 static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     NRF51State *s =3D NRF51_SOC(dev_soc);
--=20
2.18.0

