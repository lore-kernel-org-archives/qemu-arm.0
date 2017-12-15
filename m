Received: by 10.223.159.74 with SMTP id f10csp7090584wrg;
        Thu, 14 Dec 2017 19:17:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBouI+XjKTr3ZNr5s3dVYl2fws9vJt/OdUl7pmnCRdR1RVSlo+baokyOlyCG7FoVLED8W6AKi
X-Received: by 10.13.226.132 with SMTP id l126mr5795785ywe.14.1513307820311;
        Thu, 14 Dec 2017 19:17:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513307820; cv=none;
        d=google.com; s=arc-20160816;
        b=p/+imZNI/6S1N7aI2Wco2XQohuaM0oavbDI7n4TOnwS9heOS1Om9hGdfeScL9SNLzs
         2b6hVBo8Ta+L1YBFg+A01pbBb6ssX/Xg6Nf8s+98sWN72iG0EN4iEyzdduF602I78HoN
         JiZ3q2b/MXEMn5a6dL82aEQkoUsPmKHodo4r98r4+uYjKg865SZc5oz/lxWk3DhjqazF
         bfj7AjkIdNsSEnNUY2GydQwxXUv8cDdNIZZkPOBTAL7CRCn6LHd2gq/FPUv5O1HklryI
         X9AuTAZ7G4Qdg0ZEnGbc84QyY/q8uuc6CAf5e5DjNS73sriHwWczaAXAUJtIbj5HKPYO
         e+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=k9V7DZlLtjZLYfHSvJMsBdEHnLqY/grjzM4ch8uc2I8=;
        b=Ie3FYb4ek520C3B7jKW21rhJAslngOI6p5axQzik20HIiPe0dhEJRqOSumRunOeG/R
         EvlzRVYc2LeXQly9VI3F3g30WVqofiIbDLaoLIN27sZ91wRURqpjPAcCemVEQYSoAhB/
         LG7ch++eECjMgEUhzIhvnQtZB9MvMXi7Yc22yxQkcPLjrg3m8QiERdccbUf5Wofh+PXJ
         PABUuUdMa2uo4t01tWK35z8a/sgLgoNhWNi4migNymYWRTbbNG6qlzoiqx2Ujv0uDXP5
         beFVopNV7S3KpgrBqN4w0PoWSt22NsTXj7tq34utTkWLOsl2qmifMaVyZD/OQAFH5MYL
         QrfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OP5FiS6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si11100ywa.805.2017.12.14.19.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:17:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OP5FiS6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgUd-0005x4-Nl
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:16:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTz-0005bc-12
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTy-0000p1-6T
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:19 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:40335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTw-0000mv-37; Thu, 14 Dec 2017 22:16:16 -0500
Received: by mail-qt0-x241.google.com with SMTP id u42so10552954qte.7;
	Thu, 14 Dec 2017 19:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=k9V7DZlLtjZLYfHSvJMsBdEHnLqY/grjzM4ch8uc2I8=;
	b=OP5FiS6S/YzI6zeO+vXceeRmfeDfxR03j1USqUNe+UHICpmrFUCNTt5FcTsu59OX0y
	hnhnAQ8WV54a8mPUkDLiXHg08hgpAbvQneLgp+AHyhVsnAtEvgtWAAuDjOovDjRW+eEO
	hoKyQ/m3M+qkVNHTDALY6RaPpqpjYS8qAPXkqtryE+wghDxLRvRmAarJpvn5yzkIC6oF
	iPN2FAfAsht4Kb9lVQFvDyfMVZ2wxbEIArOgidNkm+S0/+Iv2UNF2PPt0eXu1/4HIJHp
	XmuRklXY5YsUUTJRNuolFZm4ey5AAdxuSKHoYSXv1915uZjJeBPxwtVdTdaVTuokovxy
	5Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=k9V7DZlLtjZLYfHSvJMsBdEHnLqY/grjzM4ch8uc2I8=;
	b=pvZzqhQRmxjr/QLFBN8esNGpBIjr6JRRD6safAFYr+UZUMp2Wpl6SmQPIFNtxHqI3j
	hRKbcBjseRq2ygtk6nk+bWbmR02gxP4C5a7iapz2KrLWINhZfflx5/tvXBsTmoB4FER4
	dweW1bHkKzqUApCCnsusLFjoxDQRJCuyH4tvLqKfQqNsdqCQ0HlqgEXJjupM3+yjHfZ8
	nEdobtVIZcknMom1X5WHyKJdgq5bW+f9HrbOp1nJhkFy8Z3Rw2B28sK0RaqenF53Qv+3
	qbMCHbqgjLrs7ELhZcODi/HatfhpN/X5t4iG5odqtyHLD3AvuGQ0YEmX7nXrgB4lEqD7
	ssgw==
X-Gm-Message-State: AKGB3mKhOVawSYxs7ZCM77SZnmDATf2Zmw4PHF1vWm/uFeTO6TNsrzi5
	2iA/MZODkNG78Q6PXxbPVQM=
X-Received: by 10.200.25.47 with SMTP id t44mr20093309qtj.323.1513307775614;
	Thu, 14 Dec 2017 19:16:15 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Date: Fri, 15 Dec 2017 00:15:30 -0300
Message-Id: <20171215031547.31006-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH v2 03/20] sdhci: move MASK_TRNMOD with other
 SDHC_TRN* defines in "sd-internal.h"
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K/U4gYBPQrwU

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/sd/sdhci-internal.h | 1 +
 hw/sd/sdhci.c          | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 248fd027f9..e941bc2386 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -43,6 +43,7 @@
 #define SDHC_TRNS_ACMD12               0x0004
 #define SDHC_TRNS_READ                 0x0010
 #define SDHC_TRNS_MULTI                0x0020
+#define SDHC_TRNMOD_MASK               0x0037
 
 /* R/W Command Register 0x0 */
 #define SDHC_CMDREG                    0x0E
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 3c78033d49..2823da00da 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -120,7 +120,6 @@
     (SDHC_CAPAB_BASECLKFREQ << 8) | (SDHC_CAPAB_TOUNIT << 7) | \
     (SDHC_CAPAB_TOCLKFREQ))
 
-#define MASK_TRNMOD     0x0037
 #define MASKED_WRITE(reg, mask, val)  (reg = (reg & (mask)) | (val))
 
 static uint8_t sdhci_slotint(SDHCIState *s)
@@ -1052,7 +1051,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         if (!(s->capareg & SDHC_CAN_DO_DMA)) {
             value &= ~SDHC_TRNS_DMA;
         }
-        MASKED_WRITE(s->trnmod, mask, value & MASK_TRNMOD);
+        MASKED_WRITE(s->trnmod, mask, value & SDHC_TRNMOD_MASK);
         MASKED_WRITE(s->cmdreg, mask >> 16, value >> 16);
 
         /* Writing to the upper byte of CMDREG triggers SD command generation */
-- 
2.15.1

