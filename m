Received: by 10.223.159.74 with SMTP id f10csp7094599wrg;
        Thu, 14 Dec 2017 19:22:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBouH8k0lk+Jb398Q3LviHarVn7a0Iflo+Lo4h/xX0a66UhDKxnjNCM/g+LaQBpaPPSOM+Pel
X-Received: by 10.129.85.78 with SMTP id j75mr5951306ywb.358.1513308156544;
        Thu, 14 Dec 2017 19:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308156; cv=none;
        d=google.com; s=arc-20160816;
        b=iqVOazhtICVdAEsfthM7xPnpf0Mh/pjeN+2/Gdr2YqF0hAY2cE6hYy2qyltYaTwJZ0
         ZbYYJblL39pA4kUyObpLXtCpt8kMzUghz+eJ8mpmU9dM98/KC3fiO9SrMHUmEZyX932q
         0ug+J1v+VFGuVHWLCMslFqJeH9vgxpcfjDMV3JHm2R2GwZuV1fHwAEieiqGjn/kqqcdJ
         GZ2xBgoACR4097EHrXzlDQ/kNtgQgD716VPtjAagMrWS761MdHp6dYcoIwOXlGDGje2S
         i7qZzu8Qt4jRB3HsLSdYsEbuKyz1NIyUKD+PFUkGIwczMxpmBBtf6H8p2soruEKnzwaY
         Tuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=J+SWj8EMnVMOvdPpt4sTPaR12LLkVfqV/hu1+TW3FhM=;
        b=RHHXeK/MgzxAx5S+wgLYpnn00fQXorkDBNfWzKMetKc4HDa8pE4WmyaagzbEEzWOdI
         sTE49evw+8omrIzasHCCtcCE3ncFzsFphJLnhCa1/daXrbTvpPMbDrSXr0a68uAJLkNj
         uSsSGPaiQMKGyld76lWEhol43XBUwYKC/7BIYHcbuc/1bLsyFnxcry5kojMRimJacxAa
         UdX1lRMRDynNJqGVicbl1iLE3M6jWRrcXrBxOxd5YaRc7d9xfum0MNNVHEJyOjGnturf
         rdddfusvvUtgBrVygRuG5ZMQvWcEIaVQYMOEatgdTcZFwMGZ8SkbMg4gtDS99THmcdot
         WbhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SlD7Bvh8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l84si1087203ybb.320.2017.12.14.19.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:22:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SlD7Bvh8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePga3-00024C-Tb
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:22:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUV-00061n-5N
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUS-0001J2-0c
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:51 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:40601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUR-0001Io-SH; Thu, 14 Dec 2017 22:16:47 -0500
Received: by mail-qk0-x241.google.com with SMTP id b123so8848051qkg.7;
	Thu, 14 Dec 2017 19:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J+SWj8EMnVMOvdPpt4sTPaR12LLkVfqV/hu1+TW3FhM=;
	b=SlD7Bvh82kMbNTevQAmJYQmmMhwx4J43Pm4GHIprbJdXgEwcapeYAb25qxXBtyYjxj
	PRoeWgR7WF/Vmp2frabDGGEQ0lPRLB6QIE1N+9HWwIGdrXCfRcxX/n0otNcr8WyMq84b
	3hR/KQ/ZEksDsH2CdLqh1Oz3x6bBSK/mF3m7ZmW3KBicKNHgcEy5RvU1XH2g/rB6K1Vz
	9+a4IjbaCoK6s+IQ7hhlC36RW4ZXQxvZsPR0gR1svhLk80cGEAV/Eag9NmqUAI6Yz8CJ
	hmo124GUkWQsyLcIuq/PdpQyl+Dfgco95HxDcGUdALlEHqoeOTqEYqAVPcQp9tDqrhod
	FizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=J+SWj8EMnVMOvdPpt4sTPaR12LLkVfqV/hu1+TW3FhM=;
	b=dLUkuJB7qC7/w29HoS2eROmHfz0yR3BspwfUmC4qA8+3nPN6xi8roZkWDfWB56GGyh
	nQrH9Rbj7ADhL39CrGJTlYWzqwn0qE+xQbJgLY5QCaCFA50RgLGpcxTwmX1fLE1L5rKK
	Y2dJjVHjAX2KKeq5AbprrgRw+hn7GEJ3AlhKXT36R9DYYfVqXfKLywQ5s+1eLpN8G08m
	q8xgUOVZeGIGkvvDNfoXYVFGJLnir3+L+dFoOcDrAMV+H4U2Tr/5N2rx+9UPtNxhqTp+
	kzIqRCevnfQ2H4x200u/RoIH/kDoYF5ysFgIkZ9IaH3wTV7frXtGHMn/Zu4/Wi1Xmfez
	Kk8Q==
X-Gm-Message-State: AKGB3mLa3IQwif/HCpfm0B5YFsi+ysn7XS+6ck4mAr17VKOleyfHG1Ia
	8YbfVfM9Si57HXoAmDpNrrI=
X-Received: by 10.55.142.3 with SMTP id q3mr19915491qkd.276.1513307807442;
	Thu, 14 Dec 2017 19:16:47 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:37 -0300
Message-Id: <20171215031547.31006-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v2 10/20] sdhci: add a GPIO for the access
 control LED
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TWHcx81QPOTi

It blinks to caution the user not to remove the card while the SD card is
being accessed.
So far it only emit a trace event.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sdhci.h |  2 ++
 hw/sd/sdhci.c         | 13 +++++++++++++
 hw/sd/trace-events    |  1 +
 3 files changed, 16 insertions(+)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 1b6a98d578..5391430c59 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -47,6 +47,8 @@ typedef struct SDHCIState {
     qemu_irq eject_cb;
     qemu_irq ro_cb;
     qemu_irq irq;
+    qemu_irq access_led;
+    int access_led_level;
 
     uint32_t sdmasysad;    /* SDMA System Address register */
     uint16_t blksize;      /* Host DMA Buff Boundary and Transfer BlkSize Reg */
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index ba3afddcf2..866be44db5 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -202,6 +202,16 @@ static void sdhci_poweron_reset(DeviceState *dev)
     }
 }
 
+static void sdhci_led_handler(void *opaque, int line, int level)
+{
+    SDHCIState *s = (SDHCIState *)opaque;
+
+    if (s->access_led_level != level) {
+        trace_sdhci_led(level);
+        s->access_led_level = level;
+    }
+}
+
 static void sdhci_data_transfer(void *opaque);
 
 static void sdhci_send_command(SDHCIState *s)
@@ -1050,6 +1060,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
                 !(s->capareg & (1 << (31 - ((s->pwrcon >> 1) & 0x7))))) {
             s->pwrcon &= ~SDHC_POWER_ON;
         }
+        qemu_set_irq(s->access_led, s->hostctl & 1);
         break;
     case SDHC_CLKCON:
         if (!(mask & 0xFF000000)) {
@@ -1160,6 +1171,7 @@ static void sdhci_initfn(SDHCIState *s)
     qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
                         TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
 
+    s->access_led = qemu_allocate_irq(sdhci_led_handler, s, 0);
     s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
 }
@@ -1185,6 +1197,7 @@ static void sdhci_uninitfn(SDHCIState *s)
     timer_del(s->transfer_timer);
     timer_free(s->transfer_timer);
 
+    qemu_free_irq(s->access_led);
     qemu_free_irq(s->eject_cb);
     qemu_free_irq(s->ro_cb);
 }
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index e4e26c6d73..f821db2046 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -13,6 +13,7 @@ sdhci_adma_transfer_completed(void) "ADMA transfer completed"
 sdhci_access(const char *access, unsigned int size, uint64_t offset, const char *dir, uint64_t val, uint64_t val2) "%s %ub: addr[0x%04" PRIx64 "] %s %" PRIu64 "(0x%" PRIx64 ")"
 sdhci_read_dataport(uint16_t data_count) "all %u bytes of data have been read from input buffer"
 sdhci_write_dataport(uint16_t data_count) "write buffer filled with %u bytes of data"
+sdhci_led(bool state) "LED: %u"
 
 # hw/sd/milkymist-memcard.c
 milkymist_memcard_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-- 
2.15.1

