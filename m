Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3625681wrw;
        Mon, 12 Nov 2018 13:53:03 -0800 (PST)
X-Google-Smtp-Source: AJdET5efgHkA9aFe5LMrV64qfBMCfeOEHtNsirabG8+RRx4AYPudcxp/0tp4c+Acm3ctx6a54Lad
X-Received: by 2002:ac8:2e44:: with SMTP id s4mr2614971qta.355.1542059583713;
        Mon, 12 Nov 2018 13:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542059583; cv=none;
        d=google.com; s=arc-20160816;
        b=UqEJZRPWa5d57DWkrweueoL3YzdyLfnyZNjnLMzZr1c/xteeGZF81AyVwSBJOlOzxz
         PdFr7ZRyW9gUBILs4FedUV0MU9dSjzJs0yarQD1Vvt7e/XhewnAltwiM0kevYFUOSUjt
         y9hS4/i5XWghQPz7u+Md0PyuR7w7jkANPj5W4i3dv1lGdzoHlCnJdddRH6aWGyLgid/5
         U79u/UmjeTaXXNCDRIuyzwfrrh1QKHLYTLFBJIXCjAMQeZ/D6thqVXFvX4+/e/Fv7Bm0
         j/JdznaZQ2jy/lU+nfuw1MMf8UBq/ybTmTd4ibEckIHMpK8pFa7LfyiXo4+aFjurnPfB
         DARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QCPRzhNPw9flYNKO/rgWGdCbdRbQSC78HJmREX+ll84=;
        b=hiwqkr+vKpHZ7YtymIoodjvPTnArqYookAjSSNWkp1gx0mzGXANSJ/TgGC7VwvJNCC
         RG36szDW65XtO34syvoSm4kO6ghUnW+a19dBx43wl4oyUA4poAIrcL4e9gB4IcLeig/P
         bqN/w72wo1TefD+Zi65EzPwweNIlXuf8W8aqoev4dz3SJL6w6k2XkFA6Dxez+TQdtb5v
         KgHXsLT1W5Jlychll4GGV/Q+0hquN1BK0XpgvXxJYQ4Z08RnpzOXmUeDeufiCGiCWciR
         O1t/L7Ip2TIuddYj+fw2VWR29RSqyzqu6uciGu3CkegrBdAJTN7s4iKd5RJk1Mafq8j6
         0zEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r32si5635546qvc.136.2018.11.12.13.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 13:53:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMK8l-0000Y1-4H
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 16:53:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJzl-0007MQ-FF
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 16:43:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>) id 1gMJza-000310-6p
	for qemu-devel@nongnu.org; Mon, 12 Nov 2018 16:43:40 -0500
Received: from steffen-goertz.de ([88.198.119.201]:35654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <contrib@steffen-goertz.de>)
	id 1gMJzK-0002fi-Ii; Mon, 12 Nov 2018 16:43:19 -0500
Received: from gouranga.nyu.edu (unknown [192.76.177.125])
	by steffen-goertz.de (Postfix) with ESMTPSA id EFE275072F;
	Mon, 12 Nov 2018 22:39:45 +0100 (CET)
From: =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>
To: qemu-devel@nongnu.org
Date: Mon, 12 Nov 2018 16:42:24 -0500
Message-Id: <20181112214224.31560-15-contrib@steffen-goertz.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181112214224.31560-1-contrib@steffen-goertz.de>
References: <20181112214224.31560-1-contrib@steffen-goertz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: [Qemu-devel] [PATCH v5 14/14] arm: Add Clock peripheral stub to
 NRF51 SOC
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wbip5ksl0QnE

This stubs enables the microbit-micropython firmware to run
on the microbit machine.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/nrf51_soc.c         | 27 +++++++++++++++++++++++++++
 include/hw/arm/nrf51_soc.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 86ee91c7cc..ab95e26282 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -36,6 +36,26 @@
=20
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
=20
+static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
+                  __func__, addr, size);
+    return 1;
+}
+
+static void clock_write(void *opaque, hwaddr addr, uint64_t data,
+                        unsigned int size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
+                  __func__, addr, data, size);
+}
+
+static const MemoryRegionOps clock_ops =3D {
+    .read =3D clock_read,
+    .write =3D clock_write
+};
+
+
 static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 {
     NRF51State *s =3D NRF51_SOC(dev_soc);
@@ -147,6 +167,13 @@ static void nrf51_soc_realize(DeviceState *dev_soc, =
Error **errp)
                                             BASE_TO_IRQ(base_addr)));
     }
=20
+    /* STUB Peripherals */
+    memory_region_init_io(&s->clock, NULL, &clock_ops, NULL,
+                          "nrf51_soc.clock", 0x1000);
+    memory_region_add_subregion_overlap(&s->container,
+                                        NRF51_IOMEM_BASE, &s->clock, -1)=
;
+
+
=20
     create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
                                 NRF51_IOMEM_SIZE);
diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
index 89525dcb39..4610d0c7ae 100644
--- a/include/hw/arm/nrf51_soc.h
+++ b/include/hw/arm/nrf51_soc.h
@@ -40,6 +40,7 @@ typedef struct NRF51State {
     MemoryRegion iomem;
     MemoryRegion sram;
     MemoryRegion flash;
+    MemoryRegion clock;
=20
     uint32_t sram_size;
     uint32_t flash_size;
--=20
2.19.1

