Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5330803wrv;
        Wed, 31 Jul 2019 00:57:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzINh/JUrn6/Xe4zxXK0kPmd4dJ3izZ7XXcsgsN/fMOCrv58MVcq9RGmOsk9H6ftwkuZpyx
X-Received: by 2002:a50:97ac:: with SMTP id e41mr105798140edb.27.1564559836467;
        Wed, 31 Jul 2019 00:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564559836; cv=none;
        d=google.com; s=arc-20160816;
        b=igvBl/sBMYMl5tRFiT4F2V1srDFjBIa8J8Hl/EqDEs5TQ1pwagjjThX2saWfnNwumm
         tMwU5j+e3HdD25q8R4lM2CEq8lGJ3WXn751vAHPLk83h0hGIy9DUW7GjOXOPbiIQ5g3z
         c/PydQlkLju8h90aa8mUG3hKk6Dsddtw5ksobzwUIvRPICqogcEKss6TgxMB+DmTm0C5
         CWk6NNV6JIoA/SlaJV75TuuAyqI3fm5TaQJ2PD03V7iPlPAj1g9yHwgibZuxXpGxnCHd
         ACwMhr63bxQR0z41wLjBYr9JMHYxem+K7eBx+3YzPExHGr5yw7r0/QitsM/uZIyuZsNz
         BSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=o7pi8qdvheUZXfDZgPcwrzN75ywO2gCdjBuFFAFq5+o=;
        b=qHuXxWR9qiy5whvG1IxiejinWyF1MHAenGeERncoivNNyMnwqWre7qC2h0C9Sv+XJZ
         0pnyjo727u7xaxPURIL6wYaw/N5sUUMv6v3H/ssXqOm384kkilkT0LN1i/QuLi100eE+
         8nfQCiujLiWQASDZUnkeoQ8jF4iykvlung/z4nXbbargpdKiHCMrx9iB5a/+x6xF+u9Z
         0vASPLyQBwOK2/Biu2gxT7pjueveq1zDhG1GaKoM0Y0jPFhnyPiBnJ3wDvH0Kq92e9CJ
         PdoT67WdCoDlrBXLP9BS9knLCIVirzl3Fh/GopsHZCl6b4IPgjehGO4gE2jPmsKcoMGd
         vChg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si18042841ejs.337.2019.07.31.00.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 00:57:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsjU3-0001rA-J3
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 03:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58570)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hsjTt-0001fd-C2
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hsjTs-0007v5-Dp
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35634)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hsjTs-0007ue-8v; Wed, 31 Jul 2019 03:57:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D0B28552A;
 Wed, 31 Jul 2019 07:57:03 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E10B55C1B5;
 Wed, 31 Jul 2019 07:57:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 09:56:45 +0200
Message-Id: <20190731075652.17053-2-thuth@redhat.com>
In-Reply-To: <20190731075652.17053-1-thuth@redhat.com>
References: <20190731075652.17053-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 31 Jul 2019 07:57:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/8] hw/Kconfig: Move the generic XLNX_ZYNQMP
 to the root hw/Kconfig
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VtFKLUNTzyho

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The XLNX_ZYNQMP config is used in multiple subdirectories
(timer, intc). Move it to the root hw/Kconfig.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190427141459.19728-2-philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/Kconfig       | 3 +++
 hw/timer/Kconfig | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index 195f541e50..dbae1c0852 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -73,3 +73,6 @@ config XILINX
 config XILINX_AXI
     bool
     select PTIMER # for hw/dma/xilinx_axidma.c
+
+config XLNX_ZYNQMP
+    bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 51921eb63f..eefc95f35e 100644
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
2.21.0

