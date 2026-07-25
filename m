Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7EEC531C9
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Jul 2026 01:02:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnQlV-0000uu-Hr; Fri, 24 Jul 2026 21:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnQTT-000738-22
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 20:42:43 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wnQTR-0000sm-Ka
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 20:42:42 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-977258a75d9so574216241.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 17:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784940160; x=1785544960; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6XwavS7Vmn+SIE6qd8LrtngwH7IkOtkdttru+6DtMCY=;
 b=emu75k5qH+OYjb/bzt3wjDqWuzzKz29Qg/te0L80nofuXPirvJWk5qSLOrovib0M6Z
 E4DMJStMVOvGoeVNqNlghmjwhO5N8O1UauNkCQUyM9qFe07HURPXftRPJbiAMrd9rRGL
 /VsjGVpCv85IuB9JB0uwNAG8PhCbad/gcCki34ozAZ+exyyWviQPrVuN/gLBP4RUm8iX
 +gYKRy7mTDYHPcmzm5CLAUQ+pRIaA02N1yp1CQh/cPGvE/0FNihGcGpMTMfDHEg573PO
 ytAATyOgX7RpOCOiUamhpzBL7g+cr4+u/akgoL3kWu9pM5CCSlAiQNFipOwOyiRI7J6e
 BEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784940160; x=1785544960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6XwavS7Vmn+SIE6qd8LrtngwH7IkOtkdttru+6DtMCY=;
 b=kJA5t6Wq3AS/tEYvUBv5wHRBZv+uU0Ah9bSszeHIC7gMi+tonsAq0mHkX6NqGXqUJ0
 tPqdHWKBlhUr7XCVXK4lKzd63mrs3kkJCmBRk8JkC6PYo47GFDfYPOAhRICcpmscp40d
 KcSt3nY4doHnBbvx2wo3z0LpNH0OMKl6WgRZBEPn4bekHllN8/wMBRpCGaNhyfHJEJOz
 VhXhUizAyu3uE3iApHrS/5eB23D6J55ywCnMuNgC38Di5dkcHVykAquMWZUSMlh60Xbs
 RsMH4fOHPPmkEbcjUBbXzBU7CiVTa9GKsmpk3S8sQB30ejT8CXGzymgnb/EZIHNzj92T
 uYYA==
X-Gm-Message-State: AOJu0YxHInpFcHXHABOyA0qE7u7i7GyjRm3nWz/ZPjuU1rlJJxMUGaMY
 gPuPHf83FMecUHwW8JNufBuqozUd1UcP28d6n7CLVy4pc1CFWocpAmw0
X-Gm-Gg: AR+sD12c08WepwvwY7vdrDRdnrUlLn5nRx26x9Ub2izvsFgC3+U9rpfG9wF+UoTRmo0
 qWsPCtyXd1XSebcvywP3pgg2iCv2zSVEnp2i22I5JgBAGy3BuYWskzPfca2Roel15u/38DGvLoN
 wONTLSPpK4lQkgry4FLC7a/0GgVzGEKKm7pNHC7fOPhW8yhkpev18Nu2PuUMev0yBT0+obpxhBR
 y6ipPmR44SyHrqNT5WucbRz1URF4wuS+ZY7t29bgPPqhh8kICkoPpjMDsdG8HwNoOhXlCsTUwPy
 rcT80byYJRIU0DZyvO61I7CsvuoIYr4JvsqSI41eGImSmY4JWiFXxsEn55HfCJIiV95pXi7yfGD
 2Yk6eZbaOb7J+sBtSsJaJeoHeUXfzUx4yazLoaiGBxCi8mbJVkD9IZefNy/kSyNw2JvulPkXY8n
 v4LiJC69J+BxPWm4uWyCSXfNYcAcACrPHC
X-Received: by 2002:a05:6102:54aa:b0:739:5cfb:50f4 with SMTP id
 ada2fe7eead31-7503e671e86mr806409137.11.1784940160632; 
 Fri, 24 Jul 2026 17:42:40 -0700 (PDT)
Received: from localhost.localdomain ([146.71.8.128])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-97774f12690sm930591241.12.2026.07.24.17.42.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jul 2026 17:42:40 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jason Wang <jasowangio@gmail.com>,
 Sergey Kambalin <sergey.kambalin@auriga.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 18/19] docs/system/arm/raspi: move PCIe/GENET from missing to
 implemented
Date: Fri, 24 Jul 2026 20:42:17 -0400
Message-ID: <20260725004219.66222-19-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260725004219.66222-1-marcelomanzo@gmail.com>
References: <20260725004219.66222-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=marcelomanzo@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Jul 2026 21:00:29 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

raspi4b now has a working PCIe Root Complex and GENET Ethernet
controller (added in the preceding patches); move them out of the
"Missing devices" list and into "Implemented devices".

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 docs/system/arm/raspi.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
index 44eec3f1..a4f83d0a 100644
--- a/docs/system/arm/raspi.rst
+++ b/docs/system/arm/raspi.rst
@@ -36,10 +36,10 @@ Implemented devices
  * VideoCore firmware (property)
  * Peripheral SPI controller (SPI)
  * Broadcom Serial Controller (I2C)
+ * PCIe Root Complex (raspi4b)
+ * GENET Ethernet Controller (raspi4b)
 
 Missing devices
 ---------------
 
  * Pulse Width Modulation (PWM)
- * PCIE Root Port (raspi4b)
- * GENET Ethernet Controller (raspi4b)
-- 
2.47.1


