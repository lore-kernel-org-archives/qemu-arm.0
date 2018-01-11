Received: by 10.28.173.206 with SMTP id w197csp1014666wme;
        Thu, 11 Jan 2018 13:05:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBot3kkt27KJiVqGLoQeIz3wqSvKChjdu7prsT+oMqDfnaAK2ndhbTscGWctwiOAA5DbR91XI
X-Received: by 10.37.139.11 with SMTP id i11mr21232692ybl.510.1515704708508;
        Thu, 11 Jan 2018 13:05:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704708; cv=none;
        d=google.com; s=arc-20160816;
        b=f4YC/snT9zctFElHK/kcWJo3wInx/DOalitM47ArF4/VGigGDQZD88J/SyJYqwJ3A1
         NH+p8NzoqOamWlK6ndpWpPyhpceedX2x6NaNbIfihjQ6+LeZplEPJA+Sn56PfT/fbN4f
         ImF2m5Ur1hEPFWjy5HaOdNYtDbT+KbYrBj01pCjWtBxHe4bPuQxViyAhf54o4rJ6QNBX
         8lvjmtD2wV67QVB3FZz1LPpfKXlUMBIakujLrzjAwD0uItqScZneCwQD/Mwa5rGTYNNK
         4kJWQjt1BzHsX/m7SmbLswzV/eDue9ncPDOd8joQthk010JXokkOsJDEXD4k3KKiouo4
         Vg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Di4FFkogtDaOD6jrT5Ce9vduls4j3Ej06Oqgjo8glt0=;
        b=IUFXgpkFxNyARWXb5b4B71X+XZM4W6VD6zJX/qbx4JIrHB9phIEmwfNXwXvA4JUZIY
         eiR81n5qdVtqI6Ynvkx5YWkPZjDiGxo2Fy04uuhuokUOLCDszBv5YhmAzxWAI34vNbV2
         EE+nCKOHTSlF4y3ZWB72Cm2uHVY73oyYOsE6DHdjz8kP1nmSvJt3xNC/xlMiZkcNv0qj
         hRMB9EDZFvU5l034S9d3F2zeuy/F5svxyIneBJE+9d+ek56qEceSeGxlvYSpHfLJxSOY
         nMo5j3mtrqlYXCpVGpNHHmPgUbi0+nUO+Rs1Q6YvQYF/FVmBSxcNsfntOpGfu6n9daWa
         byRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fQqK7qBs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8si70115ybi.39.2018.01.11.13.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:05:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fQqK7qBs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk27-0003e0-T3
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:05:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvV-0006w6-Jn
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:58:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvU-0003Hq-Jk
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:58:17 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34643)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvU-0003H6-Eo; Thu, 11 Jan 2018 15:58:16 -0500
Received: by mail-qk0-x244.google.com with SMTP id b76so6134857qkc.1;
	Thu, 11 Jan 2018 12:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Di4FFkogtDaOD6jrT5Ce9vduls4j3Ej06Oqgjo8glt0=;
	b=fQqK7qBsEWM3BoUCyiVXUwGjzWkRNJskCuwtRE1Ybe9bgwoiooqjSRVzh3lXCxugp0
	Xrz3/cauOa/9PQ/+NHVmv8YEkDTueDazDd6R9gxQB9iZeSAxhNCSnoesfIaw61wZTbGt
	2M07RtHA+jz88ygoeINsUgUwdfyh+Ck9rqkmuZLfvUx+jwc6dTaP2djlpDF7Ja6KpEDe
	sbLOgR1nJ20eJdnC7PvpeeB6ePXbXOAfBU9F+RBQG0rYwCBEBs5cPmrv81FyAGuJjsAA
	aS9uTAwYmy0rLMt3BKvHNuF7YTtC/kSKxCrpja1kB2QMZsWZLhYL5+AyBj1M70+0LWWs
	wh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Di4FFkogtDaOD6jrT5Ce9vduls4j3Ej06Oqgjo8glt0=;
	b=bqb+fgTZS7M9f0Y7IAhrRcTU91IZs8sOvZdfXZcst4VpVi469yTvm4FxDu4IULhitB
	7OF5N7zBaqK7NjVFQnmIKxXycbxdFHIDvqygqiZ67Q2UG+/H3sfoN3zl746ikzGVWTf7
	eq3vBY/pNovaAFHUvyXu2CVtnUpP3qpZNP35vSo1Xg00xCTVxa5z2LXlcOqONkFkOVdI
	EuCeUn9hCL4zfg7ogvKC2+wpplDssLnj3XmChLFXDDxi63omU45SGlMDLFX43rNFXLal
	mTIu+6AFNiMy9rkgArpowI3lsZXIwn5kMOk2rm90x+5vjwkrRf80u6VGvdyFQ2M5xL+e
	H3pQ==
X-Gm-Message-State: AKwxytc+4/rGvS+R06klCWGWMxtBnd+Ga9qPBc7iaGc5nLay9q/q/hu2
	vVlGIrujwWVWwCrnh1ZwEoo=
X-Received: by 10.55.53.205 with SMTP id c196mr22137165qka.311.1515704295857; 
	Thu, 11 Jan 2018 12:58:15 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.58.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:58:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:23 -0300
Message-Id: <20180111205626.23291-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v6 18/21] sdhci: implement the Host Control 2
 register for the tunning sequence
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vsb0zcuEQAE6

[based on a patch from Alistair Francis <alistair.francis@xilinx.com>
 from qemu/xilinx tag xilinx-v2015.2]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sdhci.h |  1 +
 hw/sd/sdhci.c         | 22 +++++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 890dd1bbac..e66d6d6abd 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -71,6 +71,7 @@ typedef struct SDHCIState {
     uint16_t norintsigen;  /* Normal Interrupt Signal Enable Register */
     uint16_t errintsigen;  /* Error Interrupt Signal Enable Register */
     uint16_t acmd12errsts; /* Auto CMD12 error status register */
+    uint16_t hostctl2;     /* Host Control 2 */
     uint64_t admasysaddr;  /* ADMA System Address Register */
 
     /* Read-only registers */
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 8e4805c84e..834b835f3e 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -312,14 +312,29 @@ static void sdhci_end_transfer(SDHCIState *s)
 static void sdhci_read_block_from_card(SDHCIState *s)
 {
     int index = 0;
+    uint8_t data;
+    const uint16_t blk_size = s->blksize & BLOCK_SIZE_MASK;
 
     if ((s->trnmod & SDHC_TRNS_MULTI) &&
             (s->trnmod & SDHC_TRNS_BLK_CNT_EN) && (s->blkcnt == 0)) {
         return;
     }
 
-    for (index = 0; index < (s->blksize & BLOCK_SIZE_MASK); index++) {
-        s->fifo_buffer[index] = sdbus_read_data(&s->sdbus);
+    for (index = 0; index < blk_size; index++) {
+        data = sdbus_read_data(&s->sdbus);
+        if (!FIELD_EX32(s->hostctl2, SDHC_HOSTCTL2, EXECUTE_TUNING)) {
+            /* Device is not in tunning */
+            s->fifo_buffer[index] = data;
+        }
+    }
+
+    if (FIELD_EX32(s->hostctl2, SDHC_HOSTCTL2, EXECUTE_TUNING)) {
+        /* Device is in tunning */
+        s->hostctl2 &= ~R_SDHC_HOSTCTL2_EXECUTE_TUNING_MASK;
+        s->hostctl2 |= R_SDHC_HOSTCTL2_SAMPLING_CLKSEL_MASK;
+        s->prnsts &= ~(SDHC_DAT_LINE_ACTIVE | SDHC_DOING_READ |
+                       SDHC_DATA_INHIBIT);
+        goto read_done;
     }
 
     /* New data now available for READ through Buffer Port Register */
@@ -344,6 +359,7 @@ static void sdhci_read_block_from_card(SDHCIState *s)
         }
     }
 
+read_done:
     sdhci_update_irq(s);
 }
 
@@ -909,7 +925,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = s->norintsigen | (s->errintsigen << 16);
         break;
     case SDHC_ACMD12ERRSTS:
-        ret = s->acmd12errsts;
+        ret = s->acmd12errsts | (s->hostctl2 << 16);
         break;
     case SDHC_CAPAB:
         ret = (uint32_t)s->capareg;
-- 
2.15.1

