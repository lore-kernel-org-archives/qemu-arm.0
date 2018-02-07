Received: by 10.28.71.27 with SMTP id u27csp242249wma;
        Tue, 6 Feb 2018 20:31:36 -0800 (PST)
X-Google-Smtp-Source: AH8x227q+iQJ7eKjrjHSqDzIwgepVBNOlpfmm9kPRA2fOkh6mp9sdmfO+zDloFkY0mAiO+dTFkBw
X-Received: by 10.129.103.87 with SMTP id b84mr3136703ywc.470.1517977895938;
        Tue, 06 Feb 2018 20:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977895; cv=none;
        d=google.com; s=arc-20160816;
        b=ccjRjaB84FRdYMbHhnxrzE3reUedDabRnyjqJOMb/eBf/zA2uN/+i6WvnDGWS3nIT9
         MsozN6/zTeOrUzKoMVRyofRN64TswCdyjFix6ZY2MK6IIaKOqKjyEdPaefLho0wSZKVG
         kQ13xVZnX5FwTF6yVRCFvA+OWK+MCsS8UnNzFJ1DbWCdJPr481foVI9dI5RJx94pJrWO
         Y8m9qNjolj1M3kSqB+1NN87pjIe7fRccrxkGfdcP4SStDMjjW+Z51l5LTlpkhwY+8Jxn
         LU3NnytuXKIQ0dPxEOxSDOZfRsfclc8yJBo/wr0PIvRv0PfdPh07N1vOYoXxyaKT9S90
         fEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SMj0MMeROKDaG5Nv95TjP+f98fkZRiE//o478QBuDX0=;
        b=DChkKKInFSjG4EH3ho8dfhJsQDsZm6kgz/Fv5vCS/jRzLyIDojtxXSyTXj8SEHKP4o
         2rn5PR1FbxBCD7OGJelqPneIJFscke1rwcQ9HX2uk0dXz8/5jNdnG4UzgerYbRWj81C+
         MX+gcyvAHGq/sAul4pKyppz5wCNcrS655T2102Tueuehibi/E33lWKylRwWGJQ3vF5DZ
         6oNsO1p5Wmfo9RXy66ecDGQJMqkyblEncsmSiv6iWRdLFFDUpKZxt/09Gr51j7aMzRy2
         El+9Hh4O3Mgwd7r7smjUAJc0sLsHDhtSP1YeyVa9Fws88AtBKaFrksxm/h/DMkpQ2E4K
         LRmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WQzH1dFw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u7si110662ywa.147.2018.02.06.20.31.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:31:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WQzH1dFw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHOR-000603-BD
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:31:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIN-0000Jn-HC
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIM-0003HG-FM
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:19 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:41032)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIM-0003GZ-3Q; Tue, 06 Feb 2018 23:25:18 -0500
Received: by mail-pg0-x244.google.com with SMTP id 141so2035813pgd.8;
	Tue, 06 Feb 2018 20:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SMj0MMeROKDaG5Nv95TjP+f98fkZRiE//o478QBuDX0=;
	b=WQzH1dFweYw07WFBSLKSXM3cNVkh19fzEQY9Nz7bmEOoyaTubYYu03SFXFw74xtWBg
	BT/vueiNExbERS0/XUWx2ZkZz7ogDGIk10kD+wZaUX8lBJqHHgM4TNJ/cJdJ6B4AzvZv
	zF9zEtZYvIynCyyah8rrcEeHMTxftD6BMj1lk6pdGWg9sgQJLIl+5pdZrVaSIDVYBzTU
	B+eDj2L2ei+KStE/pdbPfkBY+Eq95/BEmCkIMlZfhlZLNj3/EZXOqFyn8Imuv+zAx3gS
	BebU+yMApzvORHeitIhX6NR+cd+3C57XzodbSELScxsfV3OUsAaSpuZ0XiPVAIKkEkZv
	ulnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SMj0MMeROKDaG5Nv95TjP+f98fkZRiE//o478QBuDX0=;
	b=Mnw1SZjLMPn2+BTsPaHtlZ6DMNnRlwSZpK43UdYJrukHuInwlymF39JBzj/fwpM9xc
	pcjnQ1Bw/yWTdURDuJzFu/Scvc7GPEjd02YtSgyycIrA50u+xRCcabEZpqL5aRwYH65v
	aM2y+2+alacwQNua+/MvLP4ZEIl3lnjHwmyk/4rAMZYKEM9IPYufhFn89muh8J5lzOh2
	MLGLTuOWEyTKtsh47OsMTxQ55/VUtDNmW3fxSnG1fBDyPFwgkiIeAGjt79MbeD/TKPa+
	3lXQjl1vJelz+5z7+qU4aEO0tYUATTaLlUiRfG2TEPKB5RpgIfthc9LWaaAU4NncBbZH
	VvqQ==
X-Gm-Message-State: APf1xPDIklcuKlRjOe0KShwTUqiAAi+r6uqmq++sVAbkAQb1mjkff1dk
	HUdRKP2iFtK3EOv1qLB4Ako3BvMx
X-Received: by 10.101.102.73 with SMTP id z9mr3727227pgv.448.1517977516923;
	Tue, 06 Feb 2018 20:25:16 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:16 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:33 -0800
Message-Id: <20180207042438.15422-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v5 09/14] pci: Use pci_config_size in pci_data_*
 accessors
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vu/f9HgyTgfz

Use pci_config_size (as opposed to PCI_CONFIG_SPACE_SIZE) in
pci_data_read() and pci_data_write(), so this function would work for
both classic PCI and PCIe use-cases.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/pci/pci_host.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 5eaa935cb5..ea52ea07cd 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -89,30 +89,35 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
 void pci_data_write(PCIBus *s, uint32_t addr, uint32_t val, int len)
 {
     PCIDevice *pci_dev = pci_dev_find_by_addr(s, addr);
-    uint32_t config_addr = addr & (PCI_CONFIG_SPACE_SIZE - 1);
+    uint32_t config_addr;
 
     if (!pci_dev) {
         return;
     }
 
+    config_addr = addr & (pci_config_size(pci_dev) - 1);
+
     PCI_DPRINTF("%s: %s: addr=%02" PRIx32 " val=%08" PRIx32 " len=%d\n",
                 __func__, pci_dev->name, config_addr, val, len);
-    pci_host_config_write_common(pci_dev, config_addr, PCI_CONFIG_SPACE_SIZE,
+    pci_host_config_write_common(pci_dev, config_addr,
+                                 pci_config_size(pci_dev),
                                  val, len);
 }
 
 uint32_t pci_data_read(PCIBus *s, uint32_t addr, int len)
 {
     PCIDevice *pci_dev = pci_dev_find_by_addr(s, addr);
-    uint32_t config_addr = addr & (PCI_CONFIG_SPACE_SIZE - 1);
+    uint32_t config_addr;
     uint32_t val;
 
     if (!pci_dev) {
         return ~0x0;
     }
 
+    config_addr = addr & (pci_config_size(pci_dev) - 1);
+
     val = pci_host_config_read_common(pci_dev, config_addr,
-                                      PCI_CONFIG_SPACE_SIZE, len);
+                                      pci_config_size(pci_dev), len);
     PCI_DPRINTF("%s: %s: addr=%02"PRIx32" val=%08"PRIx32" len=%d\n",
                 __func__, pci_dev->name, config_addr, val, len);
 
-- 
2.14.3

