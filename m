Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4844985wrg;
        Tue, 25 Jun 2019 04:29:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxuSsR+bTUZ+mXkLi1h4AFRBC8JrRR38yZ0C+TJI10LOf2N5AnN9P+mmGmj13eXec9i4ieM
X-Received: by 2002:a50:8dc5:: with SMTP id s5mr6891338edh.138.1561462152255;
        Tue, 25 Jun 2019 04:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561462152; cv=none;
        d=google.com; s=arc-20160816;
        b=y56yCYWPkbaNQnHVCfdVFwFdzXw+7Zu7XAuTuoQqN+Z2MD6oMz0dR3ozWjMOwkHejE
         eIQfKvYRX+pmMg6ajaOwlrvfvf/c8qJiRGVj/THNuITbMwMKt2UWfvEXFQy24Pr+tTNa
         ZN18Zaw89d+UIUn17sO9LqW+ckZDVsfSLqk51B7bt5mWk5/8v/sQiGK1ZvKoFM7J6flo
         YBHw9Hn6CGfJoyEPRv8RIdJxBTmldVsMvdlW6JeEF3rdGJOYDHo3ZeigvhVepaSNJcIR
         ABEz1/mH5nMTfKBE9ABYZw8zLF5BPFdcm+EJiJQ1S/ArcLlGOLUcOsa1jo7BquaTBqcA
         YmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=69jW7mbjQYW9ccov3gXjLPT5UAXOUyBx/gCsq3TvDJE=;
        b=tRxhs3atRQniHZws4VxpuPOJoa9XvJPWPX9BRdJXNmv3LXK99Ri6sahHTSq+e6Ovi4
         tlf2NvoUbxidHN54IldLYxnPdquAZRt5k8lIOViBIwSQo+x2WtZqwy2B7+rE8lg2jrNH
         ECaJEr+5rldLOWCGYRx1kb3g9Ecgy7xCIQFAevPayN2Q2CllVS5t2SV5CCJMKUim6HoB
         7uItcATdI9TSCgFhHnRekB8s48fHTVXQ3do9dOyONdWGVblod8oeUSsVNH7H83YV0AV5
         la6RFdx5DD2fCDBdsyH3bCR+QnpPLmnj14bJA++Wyi5ZIwqTljDHbP/DOjtUl0JhN8bc
         eznQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si129131ejy.395.2019.06.25.04.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 04:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfjdP-00078t-C7
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 07:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53672)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjdC-0006wv-1B
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 07:28:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjdA-0004AK-Pp
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 07:28:57 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43144 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1hfjdA-000473-Eq; Tue, 25 Jun 2019 07:28:56 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4D2265566C1C50019565;
 Tue, 25 Jun 2019 19:28:53 +0800 (CST)
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 19:28:46 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Tue, 25 Jun 2019 19:27:52 +0800
Message-ID: <20190625112752.83188-8-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
References: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [RFC PATCH 7/7] Temp: Add to ARM64 makefiles for testing
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jcm@redhat.com,
 linuxarm@huawei.com, Auger Eric <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: apk9R0onjgKQ

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 default-configs/arm-softmmu.mak | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 3158e1a10a..d5d4c8ecf1 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -41,4 +41,5 @@ CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
 CONFIG_SEMIHOSTING=3Dy
 CONFIG_ACPI_APEI=3Dy
-
+CONFIG_CCIX_LIB=3Dy
+CONFIG_CCIX_EP=3Dy
\ No newline at end of file
--=20
2.20.1

