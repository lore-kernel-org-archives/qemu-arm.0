Received: by 10.223.159.74 with SMTP id f10csp6407106wrg;
        Thu, 14 Dec 2017 06:54:11 -0800 (PST)
X-Google-Smtp-Source: ACJfBoux8wnzk3pdXoi1JynBqCHFFT1qvbnv5dYvj4izEiIVu3AEUe9pNTZDhIlzLHDlgTA2rTLS
X-Received: by 10.129.138.67 with SMTP id a64mr4487734ywg.35.1513263251816;
        Thu, 14 Dec 2017 06:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263251; cv=none;
        d=google.com; s=arc-20160816;
        b=O7xM4tjhWSx6OipsqVBcMHyypmJ2DwLuwRun+7D+rCG0WhY7hQWw1Bh45aMxZp7Rw2
         EgaeLbSkgI6Yf4pXSYxxKl97diTwmnvWIx0NrUvXE7yyl0ZdgtZeQ21rnlg8w5DGOPG4
         665Ckaw79+C9kko/jPDW93/n4PpEMn/E0FZ+0OhbmCbvHU+xGKizBPpQYb8d43t9akAF
         TcxTuFSyLikKs6pGb/yTwOSS0twuiJCuBZRYrRNE11pBJIsqO6lRjQHvhMm36VFyyxQI
         jfyoiJajxo6OFFSSeaTYEgkv9q61SRxUcX3e6urHw96VhnKjf1w7K9Gr8f+IreqDLnNC
         9TtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
        b=ZuM/77+f1/Tk1cYWb8POzAxEMhK/5OfDRJc/iGpWPy+aGltIOal7orTb00saN5RS5C
         n+XTCmQ29g4njRvGtv+t1r7WFqZlvCeT777cc9lPb+xHKLTxpDVlDofTog8FYu1oUjQ1
         c+QAQBvBrATbKf85phtF0WTp1YsLRzc0qxpT/gSv9qf/jTdpZ3NG2rF5FlVeg4edr9h6
         h/Kl9/uM1/KBna6TZuyYIEjbX6AshqXkoX4oggQ8cYMjJoysBUxfrhUyj9fLwb+M1xvn
         wLIk/0/+i5FfXplGSpI1e+I17REPtTkyK9swCrER2buO1J1g65dumVW2uWTZyQE2lKao
         marA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z/y+rmMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l17si875577ybj.730.2017.12.14.06.54.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:54:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z/y+rmMY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUtn-0001rw-84
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:54:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55132)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt6-0001Od-47
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUt5-0000OG-6z
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:28 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:41641)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUt5-0000N0-1E; Thu, 14 Dec 2017 09:53:27 -0500
Received: by mail-pf0-x244.google.com with SMTP id j28so3763294pfk.8;
	Thu, 14 Dec 2017 06:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
	b=Z/y+rmMY6Om7+dzLEqIq3dDatdl3V5YwA1P+0woypwiH6tKqOxoGItoQxAOqEPYnVZ
	PGMIQwDjaRkeWm0VpDZbAfh1xf9LIWIny1r+oxumM8ZxEbyCSevEneU05Xjsb9i5otuC
	mvumptJdvtIL3+J+Q9y0c8ObPH/YXWpGdB+XPSDkuJwsHI6zQ7X6cEi+gquIOqhpUaVH
	PdBSCvub+4jO+DWiU0fL29WWMQx1eiBBy27azjB1JEDzbHolNAxX+wKKXwNKJfcGF+PX
	3kPD6oWkNgQYSFaVVB9VNLjGyNiJf2tJTFX807QFLWkpI/UtU7kx4aU1sXyCnwh7khGU
	58uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
	b=rqWeEfg7JFXmGK9HLRQ54D5ZIJZUTNdW0MmbKHTyBOxam9EPfD4ZPe+vaSQsZDMko3
	0TEs+kj/aMKd+l9f6nEydDz5T/D+XaMszYfJ2Q7SH1KKiGSvzt0SRSvrFqNFIrTDp9YM
	1cW5mG3wd2Ii3aSewLaJX74N61QQwKHlM4VDUEL++rJ9doblg1sTJBcDVBvX6nDkASFd
	AMJeBFStJiaFZSnuzYIlui0eDxPqOsTfK9R7pBHFy/SZ/76o+KR1eg53xCFTwCQezN0S
	m2TrrgE5ouZAJYKHF3GEvSKztGyNA0vazj0xUToVJVCqqWYsf6fX2pCt61GNvUj8Y0RE
	sQiQ==
X-Gm-Message-State: AKGB3mJEEPgKxTSazS7woNv9+7bS93pJjRR4xxnvDHolne9MPOMs70r1
	jOzLwPsQZ8N/yvFTNaeDO+T3YN7x
X-Received: by 10.159.207.136 with SMTP id z8mr9924843plo.223.1513263205697;
	Thu, 14 Dec 2017 06:53:25 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:24 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:45 -0800
Message-Id: <20171214145255.31545-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v2 05/15] imx_fec: Use ENET_FTRL to determine
 truncation length
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +RzpiIwIT9U1

Frame truncation length, TRUNC_FL, is determined by the contents of
ENET_FTRL register, so convert the code to use it instead of a
hardcoded constant.

To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
increase the value of the latter to its theoretical maximum of 16K.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c         | 4 ++--
 include/hw/net/imx_fec.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 56cb72273c..50da91bf9e 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1052,8 +1052,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     crc_ptr = (uint8_t *) &crc;
 
     /* Huge frames are truncted.  */
-    if (size > ENET_MAX_FRAME_SIZE) {
-        size = ENET_MAX_FRAME_SIZE;
+    if (size > s->regs[ENET_FTRL]) {
+        size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
     }
 
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 67993870a2..a390d704a6 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -86,7 +86,6 @@
 #define ENET_TCCR3             393
 #define ENET_MAX               400
 
-#define ENET_MAX_FRAME_SIZE    2032
 
 /* EIR and EIMR */
 #define ENET_INT_HB            (1 << 31)
@@ -155,6 +154,8 @@
 #define ENET_RCR_NLC           (1 << 30)
 #define ENET_RCR_GRS           (1 << 31)
 
+#define ENET_MAX_FRAME_SIZE    (1 << ENET_RCR_MAX_FL_LENGTH)
+
 /* TCR */
 #define ENET_TCR_GTS           (1 << 0)
 #define ENET_TCR_FDEN          (1 << 2)
-- 
2.14.3

