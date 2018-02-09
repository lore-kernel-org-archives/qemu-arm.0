Received: by 10.28.71.27 with SMTP id u27csp1037881wma;
        Fri, 9 Feb 2018 07:11:48 -0800 (PST)
X-Google-Smtp-Source: AH8x224hHyklUmMQVGroCXSmcJR/rAOog163NMjx+PSVtTjnzLNyhIpCWHzPf44n3DX1PJ5FqH+T
X-Received: by 10.129.158.142 with SMTP id v136mr2077248ywg.171.1518189108638;
        Fri, 09 Feb 2018 07:11:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518189108; cv=none;
        d=google.com; s=arc-20160816;
        b=jgtLPStX+Nyd0zLNU4ngH01ik/jLPlZfJrwFQM90sV9BTvAVUNPifCr2Ysu+z34NG1
         73yRRHW6F/5Ltl4Jz1pTVUZWtSL+AkVlnZ5g8Iigoy20bYob8vjXCMPsE1GT16BKkFqM
         AxsOIyB1Jz8+Vvu/ECaQgi5m953zD/Gs0i5ASngS6TYFuo85NM/MMambwMzePkDjl/qn
         yGBF8wyInJJ42ob7jcl6KNfbZgU/nDnmomaMAQt6DqJTL0IpYO/dV6pCoHtfMmVgaDbJ
         kxjbD1CFnloR2jC6Fy4dCh0VZf0UMZyWYXjL37nLSmfkybqzwfuN9O5p74+DvWDUoyAw
         OX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
        b=yN0HvRik4JMGQZEnttW9NXweZ8n4+YkcSJrsCRbYXsWWqHdNzGlTb0uJnz0BydAVsv
         k1vfIf/gB4HSfCGibzYypdYulODX1y9PvHmKEleX7H6BF+adUd8KDyJLbheFvcT9VILJ
         RN7NUEtWLrIfR/KJMuYQ4jubZtB+k9AP0oly9ua2OQ3fmm40zWOubFgxxClEliFVaI3J
         BY7KRk5Xaq6y0FXJEiu2mfrwMMFBO4gEWAM8OX4tp/YAs5ZFMz7GqptLQBZeE0HxcEvK
         cESyt5QYP5l199FUn718IT88NnbjtKDs9YpXnfdUMk4h0Ye8hTLo//6SUpSrg7aF5D+b
         NNRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5hIj5wU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c187si433296ywb.682.2018.02.09.07.11.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:11:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5hIj5wU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAL5-0006u7-Rz
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:11:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5b-0002bm-Aj
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5a-0005lG-EZ
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:47 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5a-0005k4-A2; Fri, 09 Feb 2018 09:55:46 -0500
Received: by mail-qt0-x242.google.com with SMTP id s27so10837471qts.4;
	Fri, 09 Feb 2018 06:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
	b=t5hIj5wUYraEyFbXc2jGoiKe28TK6MqXm/eqJ+Cwuve5vRzld+slG+Qk6qVtW1yHWJ
	0kqmXvQVoQcBIhdgIeT3XyKmIIaL34XPd0PfZ5ZoGobhuLmZJEFTMyv9koZuG6ct2hLn
	N/wBOTctXoLgjZGh/elLNOstbRaa/euZEnimRKOPaEXR+RT8MUvxlKITUk5lwxpQFGwL
	VsEWMJKH9vMfcC20LWn/CCAMCuLSYfct8rIZP0DLDTyivSC/cG4W5JcT1bv63sZ6aeLG
	IyTP1llR/aGAEceI2rL5QuUKVC6mM+CK+/o6fN1z3+krKOOzg/feeeq/UeNr1Q1D2xyG
	QGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
	b=tw3BPypFA0mlixAFSUh15/BdFKi8g+LV9t6ZTw6oz8veIC1vuvbVJF+eoIlj8N2w0M
	Jf/+Shj2N4H9Utry7MmzhIcZuKcz30RmCwyBxYzxheZZrOUuhhB+4sW1AohrYP7vx1mC
	HY+5LC4a7fcb/dTfTBoiNBdap27wNrFDz4+2Gls+A7ixNfi3oUSAel8fnz63Eg51xEBR
	jbzrq1akg0HhQSbFSzJT2GIYXH1ResC8N7JMvcb5HQXO/Px3sElFUyC/WpgaYaL84qH4
	xEHDTD9worGEQoLjJ/OLy/Wi1QEstZuq8PhMuNaMgYqWzJXF/Sout4cX0850UDRbvwOA
	JdtA==
X-Gm-Message-State: APf1xPDk21xb1q8F1ca+I1D63L+UR+qcynwwWIvtXFrD3TafHTyQkjke
	8V5BUQNg+xzsU6BVoUsxIsRdF01s
X-Received: by 10.237.57.100 with SMTP id l91mr5031419qte.25.1518188145796;
	Fri, 09 Feb 2018 06:55:45 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id b29sm747841qkb.28.2018.02.09.06.55.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 06:55:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  9 Feb 2018 11:54:24 -0300
Message-Id: <20180209145430.26007-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209145430.26007-1-f4bug@amsat.org>
References: <20180209145430.26007-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v12 24/30] hw/arm/bcm2835_peripherals: change
 maximum block size to 1kB
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
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I5SyRSdOnaW9

following the datasheet.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/bcm2835_peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index ca971e83e0..13b63970d7 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -19,7 +19,7 @@
 #define BCM2835_VC_PERI_BASE 0x7e000000
 
 /* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
-#define BCM2835_SDHC_CAPAREG 0x52034b4
+#define BCM2835_SDHC_CAPAREG 0x52134b4
 
 static void bcm2835_peripherals_init(Object *obj)
 {
-- 
2.16.1

