Received: by 10.223.159.74 with SMTP id f10csp7095628wrg;
        Thu, 14 Dec 2017 19:24:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBotLs76+16006MBdnf3dXWc+74Qg6/QqOF7OBOmWCAn+sPx49MPdPwVnQl97xRQsd4RhiDBG
X-Received: by 10.129.96.86 with SMTP id u83mr6134023ywb.19.1513308243924;
        Thu, 14 Dec 2017 19:24:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308243; cv=none;
        d=google.com; s=arc-20160816;
        b=X4GDCMS1u4l7LPCxah3bmNz2llgw7pH+GSKGIFb3sLmO3o7OpY3rklYfjmCvq40L6G
         Q9hnSKQoCexeZ4RHBClAjdvxi/+3aBo7r/Ki0+kRXDxk33W8R0/ax5APBAyNA8WCbvRU
         ktAmHEIWEepQB/0ZJL/BvCfGQ5EbeXnrfLsnP72BVMV5r5n3tIwIhWrgRFP9hHOoAWl5
         m6qMZRoLT7Evj2XLcUzzagSuYhMiAuTtqeNYzGECluiHkfXPy5n2I7QpYbMqFj384H57
         DoJcX62XAvRUuJkFHCBLeEWo2Cd3LEkwLUosEWtLPHTIK2j1ZDv4GOyUp03goWeEuVyO
         J7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=t0RgSSk1uP4nV+0slBw4Fd2dQkH95uRZ931ovPZILCA=;
        b=a2j5qjADyNmRXSYWxC73br7CNlGyQSXeYkULOlneNUMEpU6ZpnEnf75wnwXOGNu6ga
         THj56SsZhWVN6zG/3iTiF4CIp5o3wmfUjrMaLahBIcjJpOKMDrXLAv+YiSS9wc1o0hYh
         I2q11VQOuTSiJwKIeBuWYhUtRAsLbfLPAdDe3HFCz5Ktsxzzo1Il4bbj8SP8GKAxFI4K
         ghxAK+hnWo6W8b5sSFfOeIvpALD/ASHhp7x/i5L36wfYQzlXzvPilMPUEG7lWQDeKez6
         xu4YLuE9AoRQ2CTUpEtb2JWGsCK5SlSpu0M0Q0Q2r/mAaxt09xdPkKGHwEri8z4eSwfF
         DfDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uEjHLf/j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c206si1124731yba.483.2017.12.14.19.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:24:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uEjHLf/j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgbT-0003eT-9D
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:24:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUe-00069N-68
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:17:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUa-0001S9-Vh
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:17:00 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:46750)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUa-0001Rk-RH; Thu, 14 Dec 2017 22:16:56 -0500
Received: by mail-qk0-x244.google.com with SMTP id b184so8852502qkc.13;
	Thu, 14 Dec 2017 19:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=t0RgSSk1uP4nV+0slBw4Fd2dQkH95uRZ931ovPZILCA=;
	b=uEjHLf/j7wlemFxW4P3iQuPEfIjar5HCd/VMfZgx2svdPNb7/wC9dwcxLDVjUlJuiq
	KkUYfRf/hkYS4RmVWB1lLUlJFBaoo4KpwASS71qakpL4ZRMlIcyt9fdEkFhrrdi4DzNh
	BX6WmuDGby0BZ4LZ8Y10rvaVkPgHXa9LE40CyfC/aWIqn5KdKg793dF0pxTo8CA3t3sd
	ssKC/Wxuz0pBrlDBv23FN8KwVFb5myrz3fKZGDKlhkMJ58SXz4PQBsBTHHqqRFJac3dW
	ZruYYxH63YtAqdOIHiGHMo+gMzjMEY4up/X18/VraHxQJ5//HTeF+DXP2oBaqeJPc2z+
	seqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=t0RgSSk1uP4nV+0slBw4Fd2dQkH95uRZ931ovPZILCA=;
	b=sRNojD+qODuPufhBYg1CnvArvXfy4OXBrQhPsvryKBNdO0fiZd5NeNVAnVpd7RLRtq
	w0WTm0jyIYh5FGU7o+UONxkSSJK49/06V7Da3DvSxBDr9j7XID4x648Lm1ORPhsOASuf
	H2OtGYcuGdnk4v5BVN7g1+PGU3l/uniCI3n1vKvyU1HOlokQySohY7/IrHCEyyGaFTKW
	73APn3CTqmdzLMq9tWiU1zBo3WvnfS0l0wRiR5vCzbM6T6SWwSFTSbQWXDEslKEAX7hZ
	dw9kBBHAMOxxn880ug2/PqWrI2vBqRxJwcXmfX0nzS9Jry2z9ON2lwjAQphG+EVfyGTj
	l+RQ==
X-Gm-Message-State: AKGB3mJOEEXj+FIu0/JTs4Lt1qqzlL264BkWact1lBKqHH6JIoFdGuVh
	vpmSlyUC8m8vCUphevqIc1c=
X-Received: by 10.55.183.71 with SMTP id h68mr19892432qkf.315.1513307816388;
	Thu, 14 Dec 2017 19:16:56 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:39 -0300
Message-Id: <20171215031547.31006-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v2 12/20] sdhci: fix CAPAB/MAXCURR registers,
 both are 64bit and read-only
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
X-TUID: 1aLUH2c3OnZf

running qtests:

  $ make check-qtest-arm
    GTESTER check-qtest-arm
  SDHC rd_4b @0x44 not implemented
  SDHC wr_4b @0x40 <- 0x89abcdef not implemented
  SDHC wr_4b @0x44 <- 0x01234567 not implemented

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sdhci.h |  4 ++--
 hw/sd/sdhci.c         | 23 +++++++++++++++++++----
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 715048d77b..a8ffac9dba 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -76,8 +76,8 @@ typedef struct SDHCIState {
     uint16_t acmd12errsts; /* Auto CMD12 error status register */
     uint64_t admasysaddr;  /* ADMA System Address Register */
 
-    uint32_t capareg;      /* Capabilities Register */
-    uint32_t maxcurr;      /* Maximum Current Capabilities Register */
+    uint64_t capareg;      /* Capabilities Register */
+    uint64_t maxcurr;      /* Maximum Current Capabilities Register */
     uint8_t  *fifo_buffer; /* SD host i/o FIFO buffer */
     uint32_t buf_maxsz;
     uint16_t data_count;   /* current element in FIFO buffer */
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0f3ff657cf..9c1b28d9dd 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -906,10 +906,16 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         ret = s->acmd12errsts;
         break;
     case SDHC_CAPAREG:
-        ret = s->capareg;
+        ret = (uint32_t)s->capareg;
+        break;
+    case SDHC_CAPAREG + 4:
+        ret = (uint32_t)(s->capareg >> 32);
         break;
     case SDHC_MAXCURR:
-        ret = s->maxcurr;
+        ret = (uint32_t)s->maxcurr;
+        break;
+    case SDHC_MAXCURR + 4:
+        ret = (uint32_t)(s->maxcurr >> 32);
         break;
     case SDHC_ADMAERR:
         ret =  s->admaerr;
@@ -1129,6 +1135,15 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         }
         sdhci_update_irq(s);
         break;
+
+    case SDHC_CAPAREG:
+    case SDHC_CAPAREG + 4:
+    case SDHC_MAXCURR:
+    case SDHC_MAXCURR + 4:
+        qemu_log_mask(LOG_GUEST_ERROR, "SDHC wr_%ub @0x%02" HWADDR_PRIx
+                      " <- 0x%08x read-only\n", size, offset, value >> shift);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "SDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0x%08x "
                       "not implemented\n", size, offset, value >> shift);
@@ -1272,9 +1287,9 @@ const VMStateDescription sdhci_vmstate = {
 /* Capabilities registers provide information on supported features of this
  * specific host controller implementation */
 static Property sdhci_properties[] = {
-    DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
+    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg,
             SDHC_CAPAB_REG_DEFAULT),
-    DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
+    DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
                      false),
     DEFINE_PROP_LINK("dma-memory", SDHCIState, dma_mr,
-- 
2.15.1

