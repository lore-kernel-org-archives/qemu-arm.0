Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1709127wrh;
        Sat, 27 Apr 2019 07:15:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxyfOXtH50OG9QgQPhlrXlW4DEA6F3HlfIEv4m//SOgzdkpBZkcpuKevn/r6eA5Hdxc6RmP
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr11352433wmc.54.1556374530267;
        Sat, 27 Apr 2019 07:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556374530; cv=none;
        d=google.com; s=arc-20160816;
        b=07zA/JGjEYp8nfXgv3+AJfvRv08/uCOBaW4xMKZqn+VXJEoW2rXYM1B1icgbVdFDI7
         ic0hG5sTjqAWUhx526ecfqbAV0A7WCiG44W1e72etWjVptk9AvGA1bbWTShe7vEagv+/
         +ruEGxfd9EFzFoH/pKTDI06J+DHch3GsQUZBmkeTZ0trQI+oYA0TX2yeF3+X9CZs5fWw
         2GUxKX+xnL0bqh/UNIrwLYII9B9WsSJJQDCpAilWcUaK4RDJVHtD3dN96ZCOcnHaj2R5
         LbyjLiMZ0YBlEIYe4dgx2/dzgnJ/0zu89bbAwEOBoxqpIl9XWxsukf+fXty/Z/bSxKk8
         YCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CGCGbjlGJv2F+yy3e5wUT6rvZteU9sZ3r38vOjYu0c4=;
        b=GduAnJZqnD/it1jPnJbs3yMz9CAGFfWEH/UQaZYsqn3XASMph1RxXR679hM2xSyl9M
         yiP8a+Ft4FjoZXCQ86UD1qDF6vRgS1XUKu7LyxTTs3HR0TpkiMjxoUM66606VR1L+Z7p
         8Y2/WFDe6q8xPeiI/N6l0JKSivt08liKXbkLGC7fD5TCaHyuq5H8f+w4kb/ZQ8Ts0PbI
         CvHscrZumfmuhApf4pvH899DHxSrQQ6iNWBKcN4WRC8XeSRn1WUBBFFH58QZ78HsZu/z
         kIkFtcKdXxub5NbxWWBQbFzo7pMcEnh7kiQ7QTvYkE7xbU9XnSVHHFLksul3sUCENbYT
         Vjrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si20779152wrq.137.2019.04.27.07.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 27 Apr 2019 07:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hKO6z-0006Gs-BF
	for alex.bennee@linaro.org; Sat, 27 Apr 2019 10:15:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKO6k-0006Ex-8x
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 10:15:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKO6j-0000Xb-GT
	for qemu-arm@nongnu.org; Sat, 27 Apr 2019 10:15:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55266)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hKO6j-0000XJ-BF; Sat, 27 Apr 2019 10:15:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8115046202;
	Sat, 27 Apr 2019 14:15:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-83.brq.redhat.com [10.40.204.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2DF02E0B0;
	Sat, 27 Apr 2019 14:15:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sat, 27 Apr 2019 16:14:57 +0200
Message-Id: <20190427141459.19728-2-philmd@redhat.com>
In-Reply-To: <20190427141459.19728-1-philmd@redhat.com>
References: <20190427141459.19728-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 27 Apr 2019 14:15:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/3] hw/Kconfig: Move the generic XLNX_ZYNQMP to
 the root hw/Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iv/ZaW8+FCL0

The XLNX_ZYNQMP config is used in multiple subdirectories
(timer, intc). Move it to the root hw/Kconfig.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/Kconfig       | 3 +++
 hw/timer/Kconfig | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index 88b9f150070..c3c78f43eb5 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -72,3 +72,6 @@ config XILINX
 config XILINX_AXI
     bool
     select PTIMER # for hw/dma/xilinx_axidma.c
+
+config XLNX_ZYNQMP
+    bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 51921eb63f1..eefc95f35ec 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -34,9 +34,6 @@ config TWL92230
     bool
     depends on I2C
=20
-config XLNX_ZYNQMP
-    bool
-
 config ALTERA_TIMER
     bool
     select PTIMER
--=20
2.20.1

