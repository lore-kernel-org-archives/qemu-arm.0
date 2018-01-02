Received: by 10.223.134.117 with SMTP id 50csp11156596wrw;
        Tue, 2 Jan 2018 11:37:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBouWWRaTRWxzZsfjkg3XZw5rlnz1quKuUZ7+NdDnOaJFnKgngkO5U4vIEmHoNXj9rb3kwFol
X-Received: by 10.13.233.198 with SMTP id s189mr33411188ywe.267.1514921833672;
        Tue, 02 Jan 2018 11:37:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514921833; cv=none;
        d=google.com; s=arc-20160816;
        b=I/qqCWtweZZfhQ0jGo+hGhJ86x8+8EXbLPl/dHRC0+IdGlhRnFYZhggizm25+wrW7A
         W0AjEX/LgyfVcKWT8kMvPHYf6Yaw+k8xPHpwKI40i63gwEq8yW4qlTJImoLeWaKdBPlJ
         L97g9dLl4TowvyudvplCKVFRWhjlT339NdjQDMXcG+JVNJ2vQwDlHsvML7tedvRsZfha
         la7xuPDr0ArWI8WCaSdvzzwZmQ9IVOl1riHGBdksF78Qa0tXGis0zOIRxHhOPmf7oyMv
         XQxkr5C37l3XkNaWmD9O0vywbmCpgUNfuyhu2t8j4gyzcWqIzKnj3A+luQAX14i3uCqY
         V4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
        b=I4+fO7wxk4EcIqc3HtAhykWDfPHFX9A4OcBEiwD3Djebg08aYKa8BgdEivjIivLlRJ
         b6xqt+kNb5lJiqr9cj1tKTTsVfytZOnc/Ru0ciq2FGbm7o/YkUot73uk93w70nI/QrAC
         aO6D2iwvw7aBmEjaC1bgHivR2rpcRuHsXknRGCxL8BuyPO/BAkIqYSqY4mC3MYdI4ERH
         Z4WinweKoS9yMoRsq4EFjIl+7OeefOWS4TY9A/vMRG+f9mfUJXzyQ30lzdmfh+RmN2fP
         O5wiKZN2cSnS/R8hf6kC9b/PF8zHhBn2MXBD0p8VPpayU/P/EbLZeacFgP8wnXVVReGv
         GcoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gLlZpOjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9si1907531ybg.190.2018.01.02.11.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:37:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gLlZpOjv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSN7-0003Ya-3p
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:37:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMb-0003EG-I3
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMa-0000JO-Dw
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:41 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:40889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMa-0000Iq-7u; Tue, 02 Jan 2018 14:36:40 -0500
Received: by mail-pf0-x242.google.com with SMTP id v26so26019699pfl.7;
	Tue, 02 Jan 2018 11:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
	b=gLlZpOjvZ0dsWOlw6ifphKR698mV7MyfhRQlEQbgtx1hOBy6t947PHLQNzW08QcjHK
	sh1zO7ykRwQdk1S3mEZvy+89vgyK8dmOPcOPSrEZcvGcqFN+iZnw7QoqrWkpAmpAQOVe
	lFYiz/8MGURmuzq9c01qdfbP0S53mjbsyE8T41uxXimS3sp2AqKbNw9YRMb1ws2Fen8s
	pEqWLmK7mEIOy9SWx4WTEKfMebEFvtozZU+T/fhyEk6EJAkNc9ZN0slF2f2n58UQUpuK
	KWMsZvWmTfVtohWHv0qi34Yamo0WgwaTzEXHNJFXg94PtH+tzBFs7WGWAIdvXlnABFlQ
	YIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kMa8TkEq3z2Qro3C9PTAL2M+BRkC3wXbaQ/oArzF9YE=;
	b=EfdEVbFcUPF1RbDxAR/6leM477KJ1GWlPb7C6ukYIl+el4wwJGb4O0xs+rFHZxs+Q7
	xmDWNfbEBrGwEkwiZ43PXZWwabqf8DUxFZZNat7kxdEu2Ovv3Kozgt6GsCQPuL9Wub1i
	69ZJdaGw2OdjAIov4ibVRXCfnt+Bx3X+LfJ3UOXFba268h7LUHbZw9MM4kTtfk4jOqgA
	XXfkv20qaiMJJ2b3knlHJpjQW3RfY9tD1lT5CUxa8DTGQ5OXTmAOhfTZJPzjBJney4q4
	Hs7CAg0VFPMVPyd8zrbvm/tUz8rdtmgYx+3m7Cfl6GUKDS6msb06BsR/1dLnYtBAwI4s
	M6CA==
X-Gm-Message-State: AKGB3mI5WDgQnQWyZaMIgKUJXi5a4xje9DaHPJ6Rw4vdJ7o0iX7IIzY5
	CIGw5QNOY5FPAqjWA356ZvOMesTINQA=
X-Received: by 10.98.78.204 with SMTP id c195mr46812931pfb.51.1514921799087;
	Tue, 02 Jan 2018 11:36:39 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:38 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:16 -0800
Message-Id: <20180102193622.27215-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v3 05/11] imx_fec: Use ENET_FTRL to determine
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
X-TUID: kDa8GvXhNkzi

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

