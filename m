Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp783357wru;
        Sat, 11 Aug 2018 02:09:06 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx2xf9wdK55E5eZksVg0DJKoLSV21iG7bSerWheqrI9xiMP97jlYyUaG6qzSaq5avyRMPAX
X-Received: by 2002:a37:5285:: with SMTP id g127-v6mr8461378qkb.377.1533978546177;
        Sat, 11 Aug 2018 02:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533978546; cv=none;
        d=google.com; s=arc-20160816;
        b=e1RZ+xvwliUWzv1m7H7E+C6DvKm6gEfLk0zd0NuJBeZa87AZSbtWe7WsSjNeIvOvmR
         lOT/kmB29lJeK9OXOwAaAjB1aFPRYirQCcw09PQJC5XnKABGReTD92wQtTzT6uGYNzh7
         tl1LAMuH06UdxWGlYQCAEYQOdmYR4+xZFW65nvvyRBLsniC5hHCOD3oOgpIBVf6HPADV
         HJJpR+68lrh3PlArw5eRAzOiNf4XkYwptYmvsEEm1g22VS9PHj/EtEV491O7hom0tE3u
         oe1vWrD/ksCz45kdKpPqqGa2ztJml1Uf1t3CLxvZGBIFiymSxvXodXEFFhL5iKVZAyws
         KLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=X1lrQBh4Z8x5hXqrx7eLKPACBmBYaq4oVtVJP08KP84=;
        b=XLUQTcaU91P5usgHlR3AJDz4ZJfbaAj+Fwq0svU87mD6XBj6TifOKjpklsKAjGBiSa
         lmlOvAO4b+YKjMzxRZTRKQ5Kgs9sLrUs44VnNo9akTecKtJ43ighlFEPaYIqHm3vrH8t
         S99nvJUGB6I7c/xGWBQ7sD0S6dUlDoKlSyQAn6D6FrsfMCsLrpcrzlWTjgi7rl2Qq0FR
         xhslehlUbzUHqUuQoqa8DxXPF51E25lyuitzC/2smSX2DE2umB8a28253sos/TT4kT/7
         d/ejcSOLdYf8wTg/MSfKyP+lhq8V2Oqj5MC6Yl77d/DYYHdHym5aK4R9x1Sak6xzqw+0
         34XA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b190-v6si3516323qke.317.2018.08.11.02.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Aug 2018 02:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1foPtR-0005uy-JP
	for alex.bennee@linaro.org; Sat, 11 Aug 2018 05:09:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPtB-0005sm-3A
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1foPtA-0001Fl-1M
	for qemu-arm@nongnu.org; Sat, 11 Aug 2018 05:08:49 -0400
Received: from steffen-goertz.de ([88.198.119.201]:34700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1foPt9-0001Ev-QT; Sat, 11 Aug 2018 05:08:47 -0400
Received: from localhost.localdomain (tmo-080-6.customers.d1-online.com
	[80.187.80.6])
	by steffen-goertz.de (Postfix) with ESMTPSA id 000D94BBA9;
	Sat, 11 Aug 2018 11:05:38 +0200 (CEST)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Sat, 11 Aug 2018 11:08:33 +0200
Message-Id: <20180811090836.4024-5-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180811090836.4024-1-contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-arm] [PATCH 4/7] arm: Add additional datasheets and copyright
 lines
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
X-TUID: 24BSfDBFjt0j

This patch adds a link to the product specification
which contain additional information about the
Nordic Semiconductor nRF51 SOC series.

Furthermore it adds a copyright line to all
files that get changed significantly.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
---
 hw/arm/microbit.c          | 1 +
 hw/arm/nrf51_soc.c         | 4 +++-
 include/hw/arm/nrf51_soc.h | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index d6776dea0a..bb6ddb6a79 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -3,6 +3,7 @@
  * http://tech.microbit.org/hardware/
  *
  * Copyright 2018 Joel Stanley <joel@jms.id.au>
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
  *
  * This code is licensed under the GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 85bce2c1e0..2265d30352 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -1,8 +1,10 @@
 /*
  * Nordic Semiconductor nRF51 SoC
- * http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.1.pdf
+ * Reference Manual: http://infocenter.nordicsemi.com/pdf/nRF51_RM_v3.0.=
pdf
+ * Product Spec: http://infocenter.nordicsemi.com/pdf/nRF51822_PS_v3.1.p=
df
  *
  * Copyright 2018 Joel Stanley <joel@jms.id.au>
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
  *
  * This code is licensed under the GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 24212f9174..45d9671dc3 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -2,6 +2,7 @@
  * Nordic Semiconductor nRF51  SoC
  *
  * Copyright 2018 Joel Stanley <joel@jms.id.au>
+ * Copyright 2018 Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
  *
  * This code is licensed under the GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
--=20
2.18.0

