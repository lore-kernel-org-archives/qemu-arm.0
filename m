Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4416385wrh;
        Tue, 30 Apr 2019 00:37:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybWg4h764lUKTTOU7n3nfEFNiiwa512NbL6TgsG+RqO44KyacZu7o0dvHQ/0ZhOr63E2me
X-Received: by 2002:a5d:4684:: with SMTP id u4mr19686814wrq.33.1556609843071;
        Tue, 30 Apr 2019 00:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609843; cv=none;
        d=google.com; s=arc-20160816;
        b=r2uHdKWVtyrKq0WG6ocQ66nxC7Lsu8BKapMaDmC69IkAWA8YqJZKERjXH2D2827fFw
         x3jg/bdlQVjLBZ+bBZZxJllW73BmFxjv4JGmoBtnmhDuKj1mQW+s8gjDWy5p11tqecYL
         BF86tAHYHJvdIaUZ9kaWsaQJyz7ahBcDljr2QzfDs5i2Rw8r3iyuhEYwIPI+16m3+eFK
         etwl22n/5j3xc66yvT2TeWlqLMJM1rlo0Yt701bQdvTtG2Kzr9iYtbVo2Evm74563pLu
         jqfyAea5Hf0a84P95Pih490ad0F4CCjePDoy9H2HOxD2ZzUnwnxvhByJZHZ/nedO6LcB
         OPag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7/tV10etgLk5/QwRV+UcFbarepj6U+o5ZgvC+grDtok=;
        b=SnWM/zV9Z3FAG+ouegbF8NsJAGN6g0AXrIqnwS5QmfWXui09Ux1zxK/DFjm9E0DUFn
         nSHyF0paXNmZ91ofaq7elFE9+ECOwyiBwuIL/vnx43ufLw065g/75xaxIQIRDDgQLL3R
         H4M+grXhb/0/NhWpg2us2YzVRCUD8Ki4Z27cIyO1ht7f4R1bMCDT1qipxDyJhHYhm2f+
         p7xna+pMNOJK3dqgvhyXfDkEO7v/NBp/fCmv516ZP3XfmZk67+euRatQehoRyrrtX50t
         5s4egiohBd+tA91e2tbbZU7CeJk2WXOf58g6/KE4VnoEhuEPQ+T6N8JvX5fchOILKH08
         EeQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11si1041359wml.114.2019.04.30.00.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNKM-0007pf-4L
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:37:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN3V-0001pU-F1
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN3U-0006WI-Kt
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:19:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN3N-0006RJ-HQ; Tue, 30 Apr 2019 03:19:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9942D307D962;
	Tue, 30 Apr 2019 07:19:48 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 170D11001E85;
	Tue, 30 Apr 2019 07:19:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:14:05 +0200
Message-Id: <20190430071405.16714-31-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 30 Apr 2019 07:19:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 30/30] hw/arm: Remove hard-enablement of the
 remaining PCI devices
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yncZ8Eq/nP2O

The PCI devices should be pulled in by default if PCI_DEVICES
is set, so there is no need anymore to enforce them in the configs
file.

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 233937f394..f23ecfd5c5 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -36,14 +36,6 @@ CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
 CONFIG_MICROBIT=3Dy
-
-CONFIG_VGA=3Dy
-
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
-
-CONFIG_PCIE_PORT=3Dy
-CONFIG_XIO3130=3Dy
-CONFIG_IOH3420=3Dy
-CONFIG_I82801B11=3Dy
--=20
2.21.0

