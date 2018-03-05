Received: by 10.28.91.67 with SMTP id p64csp2458364wmb;
        Mon, 5 Mar 2018 03:54:06 -0800 (PST)
X-Google-Smtp-Source: AG47ELsHVhOH2PjD6mWvzXNNPdqHwvbXJ9+SNIGeh+lnj8UAvS+wp+q6+mZEp3uedmUwiWKx/G4Q
X-Received: by 2002:a25:a126:: with SMTP id z35-v6mr8573671ybh.482.1520250846213;
        Mon, 05 Mar 2018 03:54:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520250846; cv=none;
        d=google.com; s=arc-20160816;
        b=q/vf6495kH0bkxu08qgfR/Fbyb+wKCZs0p7OiC1eThtnkqNphlUH5WuUy6m/9QkNls
         tBRDFRIrtihp+MrNekC55ZmvbmxN2fcNLT+tosW3+CTySeqBYkzxdE8m7DsDDlgmvMz/
         soQ9dNOjmHbt4Vi4H2pEX2h3HWpZ5pPbVjPfcvsvdv8hbwdzl98rJym/joYilpRoVIes
         Pf4aZYUP8xzqR0evbIfspozdgVFL/9If1IEVvlRHs5Acg2ngKFOotRwd+P191B4yLgXY
         zuwppLlFmkktxlI6XxfIBbR/yNCXqNZhNFGb0kIE/cszu34RWwXA7w12+6de1rLchouH
         SRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=CAb+wta0wEs2+Mdeu4nRoeUEL/WV+6Oly8onn57JaZY=;
        b=JU2caKEVq2+7ea/MVDoksxZY7yWlraFGaJP9f9q9bOd4v97LMfUntbgjPF7U6S7y+9
         9DqAg+t8Zq9SGAFTmSblYAjEbn531oI1HqMWjOixB88ckTsy6Yu8SohaOuvgAKWQAz0s
         nazHp+zA/TggJiy3mybRR0mMacV9jlr9ScvqNAGO8jQzzSf0nHgy6mqQoLUvkdU8fqtU
         CUgM3Qhe+7Mzny2BqiXGXu9OfXr9SOOdt9ZrISGwXSgmeXJjmbP3X1mw63PhIkn1wCcW
         uMkiQKTJ8zt9TkM2GMfJhgrsd+d7uElYslGdFYx4rxQhPeY1ODg5Zz0E3XXM1IKJN5SW
         jpZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g0uKD8Bz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v66-v6si1123993ybb.735.2018.03.05.03.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 03:54:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g0uKD8Bz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esogv-0006C8-JN
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 06:54:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoI2-0004Bs-QA
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 06:28:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoI1-0007MT-NS
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 06:28:22 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:36237)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1esoHr-0007AJ-Mp; Mon, 05 Mar 2018 06:28:11 -0500
Received: by mail-wm0-x242.google.com with SMTP id 188so14712854wme.1;
	Mon, 05 Mar 2018 03:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CAb+wta0wEs2+Mdeu4nRoeUEL/WV+6Oly8onn57JaZY=;
	b=g0uKD8Bz41lLLpCdd7h2n1k/d/ABz17jHPoLxsT0pojJ/Jz5vXTr2/9WRAa/7t3maU
	lL7PEGK1rI3BOeW1D1Q8pXtncg/l4ExrA6JD6NXvuJPetWELCg1xzOXHsdaBihslca5H
	tmiYPgRYG5BXrxyWgKfxvf/8QN78ZEvnsoorHVhuzpRbXsNXffr4fw/tas01JPaU49cS
	3hK0xSle69AQWb7Ns439u5d6Ddi+j1t0/ITB630LnZ0Wuwv8La8cFAKuV3QMZhoaKAbH
	fIYjZuTHzoH1vhftxNLmVXw74r2mcitb08iITiGEsR9vwURRtckytRv5AO/oceDj+9XZ
	xc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CAb+wta0wEs2+Mdeu4nRoeUEL/WV+6Oly8onn57JaZY=;
	b=YCgAqhLJKBjTo6dzXghc0LLdEMQ+y0+GG41iIrf/yR6u7zGAzvA643pybNfVQpUU89
	/LyZ9XcO2oQZzeytTtnitb0I28cjEHPV1++qhxWXWQ6/soBN3YE4o0eYOPNkxb4Nb8Nl
	55d+aeGMKcHN+eDzzaZMUzdVkBn+lRt678ewlf1/MHAKD3n4vufZR92UzWu1VzIAQvkY
	p4ZuAb6c5b6nRB6H6tbNOG1trc864CivvOrEX76+KE/YPX/5EJs0arYycK04O4wk/NfZ
	askSuBVk3ryWHEq2p/Zda9kb5dWpNtdEcQk8wUpI42RCboU7oVuiirx0sXbddvUPlLd7
	ACkA==
X-Gm-Message-State: AElRT7EZmTKYwTuGFIobn8pvNt6+OFZyukZp/wVDkJbzI+YKpyHJgX8x
	TyQD7Wqi6EzRVv1qjaBp9ffMOv/mZQs=
X-Received: by 10.28.223.212 with SMTP id w203mr8465248wmg.96.1520249290532;
	Mon, 05 Mar 2018 03:28:10 -0800 (PST)
Received: from x1.local (ABayonne-654-1-79-224.w86-222.abo.wanadoo.fr.
	[86.222.222.224]) by smtp.gmail.com with ESMTPSA id
	k45sm11744388wrf.62.2018.03.05.03.28.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:28:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Date: Mon,  5 Mar 2018 08:27:25 -0300
Message-Id: <20180305112732.26471-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180305112732.26471-1-f4bug@amsat.org>
References: <20180305112732.26471-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: [Qemu-arm] [PATCH v2 23/30] hw/net: use the BYTE-based definitions
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, Stefan Weil <sw@weilnetz.de>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
	"open list:Allwinner-a10" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u93NDtVTMr02

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/allwinner_emac.h | 4 ++--
 hw/net/e1000e.c                 | 6 +++---
 hw/net/eepro100.c               | 6 ++----
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index 4cc8aab7ec..93ec0e7067 100644
--- a/include/hw/net/allwinner_emac.h
+++ b/include/hw/net/allwinner_emac.h
@@ -125,8 +125,8 @@
 #define EMAC_INT_RX         (1 << 8)
 
 /* Due to lack of specifications, size of fifos is chosen arbitrarily */
-#define TX_FIFO_SIZE        (4 * 1024)
-#define RX_FIFO_SIZE        (32 * 1024)
+#define TX_FIFO_SIZE        (4 * K_BYTE)
+#define RX_FIFO_SIZE        (32 * K_BYTE)
 
 #define NUM_TX_FIFOS        2
 #define RX_HDR_SIZE         8
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 16a9417a85..767b35fca8 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -81,10 +81,10 @@ typedef struct E1000EState {
 #define E1000E_IO_IDX       2
 #define E1000E_MSIX_IDX     3
 
-#define E1000E_MMIO_SIZE    (128 * 1024)
-#define E1000E_FLASH_SIZE   (128 * 1024)
+#define E1000E_MMIO_SIZE    (128 * K_BYTE)
+#define E1000E_FLASH_SIZE   (128 * K_BYTE)
 #define E1000E_IO_SIZE      (32)
-#define E1000E_MSIX_SIZE    (16 * 1024)
+#define E1000E_MSIX_SIZE    (16 * K_BYTE)
 
 #define E1000E_MSIX_TABLE   (0x0000)
 #define E1000E_MSIX_PBA     (0x2000)
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index a07a63247e..6fdeb05259 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -60,8 +60,6 @@
  * changed to pad short packets itself. */
 #define CONFIG_PAD_RECEIVED_FRAMES
 
-#define KiB 1024
-
 /* Debug EEPRO100 card. */
 #if 0
 # define DEBUG_EEPRO100
@@ -104,9 +102,9 @@
 /* Use 64 word EEPROM. TODO: could be a runtime option. */
 #define EEPROM_SIZE     64
 
-#define PCI_MEM_SIZE            (4 * KiB)
+#define PCI_MEM_SIZE            (4 * K_BYTE)
 #define PCI_IO_SIZE             64
-#define PCI_FLASH_SIZE          (128 * KiB)
+#define PCI_FLASH_SIZE          (128 * K_BYTE)
 
 #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
 
-- 
2.16.2

