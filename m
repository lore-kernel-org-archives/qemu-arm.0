Received: by 10.28.173.206 with SMTP id w197csp1015568wme;
        Thu, 11 Jan 2018 13:05:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBosYNP7HLCKdC35FWpOGlaFnp8hxl1JDm6HIcfljryXImGLjG78lbHZpDbg5GzjEsM5JyUlR
X-Received: by 10.129.124.67 with SMTP id x64mr16916128ywc.418.1515704758532;
        Thu, 11 Jan 2018 13:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704758; cv=none;
        d=google.com; s=arc-20160816;
        b=rdWZjIyQJEweT6Si0qwWQXtUkPD+IyshYVo/RRv1Z5WR0eoLYWBOpgwGcXauWy8U3t
         A3Kuzvpty8cR43f+lqg5w4jfOt2yqfpCIb+Jue51sebd/egA2l8ZqHy1kSJySTKKXnXM
         OSwSPo2EtTyDReLCRQMhqzKBCgcG74kv5oE+aEApHHyQQLpMQDJPM3U31N5yAsc8xIW8
         oMf0Z58mltublQ3CnyLiXhZ6Vb5C0LumFKxmHLndHsCUiUuVxBms4DIcDhJZVWvHxULI
         O3WLsgMKp7ctDcrDZnMkH4TO7AWk5k7zj8rHRYtTqCOpGIrq0+EWacah3Iy0gcXbZVBU
         MAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=buuGLR8jFlJL57hyoVNS4fZqIk265a3dfZ5siyqpeWo=;
        b=WeXn0uBgX/iUXUPVbfJCqK83VCnRHkxfdB55U3HdOx3WoYAcBDhoH3to3nolL/a3Lu
         0q4PI5b4s5RMoXv/a94YAdilbpC+Yc47bRJ4Vv+6yvZceE8DHGPNwMIlUUqq2dqpMdeT
         fUXTPWjz9bG6Y1x5dEpWA1Z4erqjUXqh0Nubv6zOXDBH3QMAEqfGGFjsGUGNh4wAtrQa
         g3xdQyNBhiLMvoJ7xwCRCaTO6dap6fuiXFwUQY3uQDaDSlHIig2jSgwBz6WkUYi5HS3V
         p29Xhm38LFnoPML3c3x8D1vppDbh/XWrEiaZqxpZBh8V+oAR29F4oYhv/FM6BNvL3g3D
         I2pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W9I7NI9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4si4337932ywm.360.2018.01.11.13.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W9I7NI9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk2v-00053e-U6
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:05:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvW-0006y5-MW
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvV-0003KW-U9
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:58:18 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:47085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvP-0003DR-Uk; Thu, 11 Jan 2018 15:58:12 -0500
Received: by mail-qk0-x244.google.com with SMTP id l64so6040547qke.13;
	Thu, 11 Jan 2018 12:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=buuGLR8jFlJL57hyoVNS4fZqIk265a3dfZ5siyqpeWo=;
	b=W9I7NI9FWpyWprskR43oBFpyQDhpNvL2sLamwpD5sDazCWO4PdPqj5UOyUzQ4bvjg1
	s1A9X/2NdllfdNosdLzZRO5ETfGuzUrHLJ5UgWHute1bu0Fc/emot5pTV5QE55Dk8epW
	pcSoMm3ECeIwebpY5nyr8ZYmQFHsqYA11rbFuoMH3KKpyat6oEJ0FAL0Kjb15QFSxmOY
	vHUoCXyfEhF3oHy0sn9h/mKcqiM3KttnwXHAP7RUf3ow73cIiWWCTArtrdx80+9niaon
	G9zBs3D8KgTzAYaWbvzXfKxybFErQXPmXjZ/PwrV6XMNJZvs7+Osx5fVpHedAW5aOeu1
	hw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=buuGLR8jFlJL57hyoVNS4fZqIk265a3dfZ5siyqpeWo=;
	b=rWwiT8G5c9fVvEF7legNF58SCtbF9JNzyAO+3rnQKBlqKXOLduypb4OhrQ0xWDlqNk
	RDVNgNDrJiQbvdat9Yya4KSiYcktglWg7aJxLsH7cXsMlxT0rK8bjl6sqnVxfHlJHlka
	AbGqcavpIuXZBVhmaMiUxNPQZYiCm4yMjl3B6lpY3F2LV1sqAhg2kEUVSXDi5hVRrlwC
	FJDe8KxmuLLLfTrI2WcwVSqr2n4IRMLgQWa0tfCnYxhGL9aTqSORkKgEfwXVc6iKN45w
	QmPlfTf7iRN+rkCMRgGv1LXiio9nHIGctThkTBujdnlOxV7PJCHJ31AUZNM+urlAWd7T
	yRRA==
X-Gm-Message-State: AKwxytd8/8t6NdNJ1+bU9wyzNtfCU1lcmRqpzedu4TxG+kSom5UQ4dnl
	0WtPfF8PNx9PNiseN90269E=
X-Received: by 10.55.207.86 with SMTP id e83mr26516092qkj.157.1515704291417;
	Thu, 11 Jan 2018 12:58:11 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:58:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:22 -0300
Message-Id: <20180111205626.23291-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v6 17/21] sdhci: add Spec v4.2 register
 definitions
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s7rVry8XSZgN

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci-internal.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index ac4704eb61..b82e847636 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -191,6 +191,10 @@ FIELD(SDHC_HOSTCTL2, V18_ENA,          3, 1); /* UHS-I only */
 FIELD(SDHC_HOSTCTL2, DRIVER_STRENGTH,  4, 2); /* UHS-I only */
 FIELD(SDHC_HOSTCTL2, EXECUTE_TUNING,   6, 1); /* UHS-I only */
 FIELD(SDHC_HOSTCTL2, SAMPLING_CLKSEL,  7, 1); /* UHS-I only */
+FIELD(SDHC_HOSTCTL2, UHS_II_ENA,       8, 1); /* since v4 */
+FIELD(SDHC_HOSTCTL2, ADMA2_LENGTH,    10, 1); /* since v4 */
+FIELD(SDHC_HOSTCTL2, CMD23_ENA,       11, 1); /* since v4 */
+FIELD(SDHC_HOSTCTL2, VERSION4,        12, 1); /* since v4 */
 FIELD(SDHC_HOSTCTL2, ASYNC_INT,       14, 1);
 FIELD(SDHC_HOSTCTL2, PRESET_ENA,      15, 1);
 
@@ -219,12 +223,16 @@ FIELD(SDHC_CAPAB, DRIVER_TYPE_C,      37, 1); /* since v3 */
 FIELD(SDHC_CAPAB, DRIVER_TYPE_D,      38, 1); /* since v3 */
 FIELD(SDHC_CAPAB, TIMER_RETUNNING,    40, 4); /* since v3 */
 FIELD(SDHC_CAPAB, SDR50_TUNNING,      45, 1); /* since v3 */
+FIELD(SDHC_CAPAB, CLK_MUL,            48, 8); /* since v4.20 */
+FIELD(SDHC_CAPAB, ADMA3,              59, 1); /* since v4.20 */
+FIELD(SDHC_CAPAB, V18_VDD2,           60, 1); /* since v4.20 */
 
 /* HWInit Maximum Current Capabilities Register 0x0 */
 #define SDHC_MAXCURR                   0x48
 FIELD(SDHC_MAXCURR, V33_VDD1,          0, 8);
 FIELD(SDHC_MAXCURR, V30_VDD1,          8, 8);
 FIELD(SDHC_MAXCURR, V18_VDD1,         16, 8);
+FIELD(SDHC_MAXCURR, V18_VDD2,         32, 8); /* since v4.20 */
 
 /* W Force Event Auto CMD12 Error Interrupt Register 0x0000 */
 #define SDHC_FEAER                     0x50
-- 
2.15.1

