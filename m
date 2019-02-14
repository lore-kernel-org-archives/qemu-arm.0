Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp952529wrp;
        Thu, 14 Feb 2019 05:04:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaisUwqY3HpF3lNvmibH61+CuaTHDOE7n5mfCyPoaqmGYrkqWFh6aAAkTrw/DxiV+sH/Wsq
X-Received: by 2002:ae9:ee02:: with SMTP id i2mr2603945qkg.179.1550149482573;
        Thu, 14 Feb 2019 05:04:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550149482; cv=none;
        d=google.com; s=arc-20160816;
        b=tQ4UwFLTWJF0WUb0AyBcg9Oa9CzPWME21NjDYLJJnQspWal+e+oOZkYLlH7tNRRxuC
         K6vfjuMmd6o9c8cB53p2zf95Onjxi6cLrNHcUnJ+zszZMl0D9Qqow5IlgZZlOnn65nO/
         SIsTd172pLcvVSFkmopwrYFDVH0okrkq+E8EHpRLGDoTq7Ju1CjNH04XQNmvhxLJjdtb
         YoIKKeo8mZBGgJHB9gcxnCI1ptSANp/50jwPVXlVdNLbNvIFKyalDHYu9vVhYmKMpyts
         rPq7r7RMTTeQG2U6uyezeBobsh34Uq2ZVKXzqV6q72N3jN37OGdtu8OYo4nXsyWaTn+p
         jarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=vaS39ErdvakXDhjr2AJlzEtf1NZBf73g6lMHeNCY3fs=;
        b=e36u33O01o4JrA3xZbyk4yL8xDqG5CzU3dALcwDLm+2P/UpRTljaYP4eqfs9qiPsv3
         QgH4IpChFVErJloDWB6AZIdxUi38e+aENCe1KyTCB6FdPZ3mPimboZhn1bO1TT/kovBT
         KkyGiByX8ravLqFYq0i4+8W4QCH8Mx67z8GNpqlmh66SrN/YlvNIfm4PnNNiWqmlHq+U
         U5cBnr0pdYFRjBElHCbkXiNxBTWY/W0lYmOi2Gn9FC488llitxDz2LJJlDcnJcW6lZZ/
         lZQRBDyCirH1c2HRSrdyaAXUVQjmPmvM9+B+fzJPZqexDqGU7JiWfgZpm/edquSlwgYl
         aCuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OlJCJtVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si1512268qtc.367.2019.02.14.05.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 05:04:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OlJCJtVB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guGh0-0004xM-1a
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 08:04:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGeD-0002zc-P1
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 08:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guGTx-0006RO-79
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:14 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36941)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guGTx-0006Qh-1N
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 07:51:13 -0500
Received: by mail-wm1-x341.google.com with SMTP id x10so5925950wmg.2
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 04:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vaS39ErdvakXDhjr2AJlzEtf1NZBf73g6lMHeNCY3fs=;
	b=OlJCJtVB2LvWDyzuPYVS8RradArrRRjjE6HjgcFad8rjTF4UWhmyhuWB4cEW3ZrMHf
	nY6WCwuH2wpwu2cDv4vU46aBQxcRWKL0w9D5HH4/BKcfeL8WuCF2pUFJu9FsqpEghNgt
	TVPZVl2hEJrkeabRX64496eRmt3fPNDw/zrIg1x+pAPPVel5jDaz+AZKWoooxWBq+uc1
	dl35LdhhAt//9+vR1Ep3O6bdSwQYnWUnEyRe+GzOD20uL7mmG+ZLaIKmvKCPh/CdzPEr
	1WfFEsJ4Eh2JkfpqBKbGJDnh0X5Q9jYfEHQ7ixX/XKcC8dinpqI2l85Knd5B6rCha7up
	B8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vaS39ErdvakXDhjr2AJlzEtf1NZBf73g6lMHeNCY3fs=;
	b=RRNRa83sLGZT64RpGyyTpvsIAkt3Y0uLjP7psyzHkqazh22MVjwPsktTIiRmEXdxF4
	LSgtcaohHNL8Unlmji6UVrkidphtUsjOVlx9N7r4UbgWdRAtl/kaZmZXnL2w/eFEtgxA
	zjSXjuOoJTKr1D9gYjPZU4uCgBWSjdzHXrrRzXXjYlJEydeKT3UdsTSi/dP7VA5PL0/k
	mZ9rAJDDydUnFCQsWPXQVAonmpqAEXUaNB9w1IpjL07B0xVV+insFZVsyZVN+m4jFlIS
	5lLEK9xJByRxQluWK2j19owEsJymUEfFFiAZv75j6LYCeDxyBmfphPx04qaqJE+acaCc
	FKqA==
X-Gm-Message-State: AHQUAuZqV5X3fpmBRgEtq3b3LzvOxeguk2a67k4PBbvF1ek+M0Tq8iKZ
	6wVuMTqPq97KF6dEFlM2u9beWjXmHJHD4Q==
X-Received: by 2002:a1c:f901:: with SMTP id x1mr2667013wmh.84.1550148671731;
	Thu, 14 Feb 2019 04:51:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id j3sm1488073wmb.39.2019.02.14.04.51.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 04:51:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 12:50:55 +0000
Message-Id: <20190214125107.22178-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190214125107.22178-1-peter.maydell@linaro.org>
References: <20190214125107.22178-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 02/14] hw/misc/tz-ppc: Support having unused
 ports in the middle of the range
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 42KRfnrYSf42

The Peripheral Protection Controller's handling of unused ports
is that if there is nothing connected to the port's downstream
then it does not create the sysbus MMIO region for the upstream
end of the port. This results in odd behaviour when there is
an unused port in the middle of the range: since sysbus MMIO
regions are implicitly consecutively allocated, any used ports
above the unused ones end up with sysbus MMIO region numbers
that don't match the port number.

Avoid this numbering mismatch by creating dummy MMIO regions
for the unused ports. This doesn't change anything for our
existing boards, which don't have any gaps in the middle of
the port ranges they use; but it will be needed for the Musca
board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/tz-ppc.h |  8 +++++++-
 hw/misc/tz-ppc.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/tz-ppc.h b/include/hw/misc/tz-ppc.h
index fc8b806e4df..080d6e2ec17 100644
--- a/include/hw/misc/tz-ppc.h
+++ b/include/hw/misc/tz-ppc.h
@@ -38,7 +38,13 @@
  *
  * QEMU interface:
  * + sysbus MMIO regions 0..15: MemoryRegions defining the upstream end
- *   of each of the 16 ports of the PPC
+ *   of each of the 16 ports of the PPC. When a port is unused (i.e. no
+ *   downstream MemoryRegion is connected to it) at the end of the 0..15
+ *   range then no sysbus MMIO region is created for its upstream. When an
+ *   unused port lies in the middle of the range with other used ports at
+ *   higher port numbers, a dummy MMIO region is created to ensure that
+ *   port N's upstream is always sysbus MMIO region N. Dummy regions should
+ *   not be mapped, and will assert if any access is made to them.
  * + Property "port[0..15]": MemoryRegion defining the downstream device(s)
  *   for each of the 16 ports of the PPC
  * + Named GPIO inputs "cfg_nonsec[0..15]": set to 1 if the port should be
diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
index 3dd045c15f5..2e04837bea9 100644
--- a/hw/misc/tz-ppc.c
+++ b/hw/misc/tz-ppc.c
@@ -181,6 +181,21 @@ static const MemoryRegionOps tz_ppc_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static bool tz_ppc_dummy_accepts(void *opaque, hwaddr addr,
+                                 unsigned size, bool is_write,
+                                 MemTxAttrs attrs)
+{
+    /*
+     * Board code should never map the upstream end of an unused port,
+     * so we should never try to make a memory access to it.
+     */
+    g_assert_not_reached();
+}
+
+static const MemoryRegionOps tz_ppc_dummy_ops = {
+    .valid.accepts = tz_ppc_dummy_accepts,
+};
+
 static void tz_ppc_reset(DeviceState *dev)
 {
     TZPPC *s = TZ_PPC(dev);
@@ -210,16 +225,33 @@ static void tz_ppc_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     TZPPC *s = TZ_PPC(dev);
     int i;
+    int max_port = 0;
 
     /* We can't create the upstream end of the port until realize,
      * as we don't know the size of the MR used as the downstream until then.
      */
     for (i = 0; i < TZ_NUM_PORTS; i++) {
+        if (s->port[i].downstream) {
+            max_port = i;
+        }
+    }
+
+    for (i = 0; i <= max_port; i++) {
         TZPPCPort *port = &s->port[i];
         char *name;
         uint64_t size;
 
         if (!port->downstream) {
+            /*
+             * Create dummy sysbus MMIO region so the sysbus region
+             * numbering doesn't get out of sync with the port numbers.
+             * The size is entirely arbitrary.
+             */
+            name = g_strdup_printf("tz-ppc-dummy-port[%d]", i);
+            memory_region_init_io(&port->upstream, obj, &tz_ppc_dummy_ops,
+                                  port, name, 0x10000);
+            sysbus_init_mmio(sbd, &port->upstream);
+            g_free(name);
             continue;
         }
 
-- 
2.20.1

