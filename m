Received: by 10.223.159.74 with SMTP id f10csp6409686wrg;
        Thu, 14 Dec 2017 06:56:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBosJ6Db5gae1TIv0YlCZFHArRatr/S/2puSKBb+L6yrJnww3JoRVNcI5Y+hpfSydVLD4jrD2
X-Received: by 10.129.200.68 with SMTP id k4mr4373092ywl.130.1513263418418;
        Thu, 14 Dec 2017 06:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263418; cv=none;
        d=google.com; s=arc-20160816;
        b=v3oMJvocQ9ZDUaFknTDpLQGUsWv6bumb4X86BTOv6eyMnpe6Y6rpnv76kul3QZyMkc
         j1lv4QRNjF8vYronZsCPurQFfH3QSG/VfdmpLo9WgR3Mo2LPBATLunojU8/BZjIrh8No
         JgRjz5S8W2ozWGSNNpXkhftBF+kTcB6VIb27msbh9SrNN3rayHlUBGrYoZhTEH/qkD/5
         nmr2TXCsYzQYZhNS35o+TRBiS7+xezY7kyseAnY8apgvaricEerPez05mhpmLEHv3SSG
         arwEhsIDGYIqFVKow0JuxnrilXZVh2QUiDVup2loh31VyDo03iclqI0hzin6kffJLajr
         uzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zc3tJ3GiwAz2q6hrm6F2ynicdt/gKVnWAy4u0ysngQw=;
        b=gakX8hTpeSshPJeQDZw6Ow1aWkKUjTK7TsyUBQmz2eB4oWwaAI5i2EZ+nKOlHKORav
         lCpvs8vOitQjVqWgmzYwPg34JUYRxNt2y0iMf1y9YDxNNePBmXnKiyIchO3PaAF0f8tq
         2/iOsNqlafelnUBSqCwiLNPTTlcl0rXaxai/ZkKbAkIuKpsLOiGqrB9972bNdLWhKVAi
         2WozJ0Bt/4e9w7r2tLJC7LDh7rbV1NEgJ/vSg7jdgWznNkUh+X0a+vsWcaOdKIfphx8x
         gkJjwZe3rqIMiqZjnw9i2bvw8r6cbVWHEtUroGtK+nFKRU7LA+SdXkmtT8GQJpflvN12
         TzAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cfc9q/WH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d6si820728ybj.175.2017.12.14.06.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:56:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cfc9q/WH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUwT-000494-PW
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:56:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtJ-0001cK-Sr
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtI-0000p5-Sm
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:41 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:40329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUtI-0000nx-NE; Thu, 14 Dec 2017 09:53:40 -0500
Received: by mail-pf0-x241.google.com with SMTP id v26so3770747pfl.7;
	Thu, 14 Dec 2017 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zc3tJ3GiwAz2q6hrm6F2ynicdt/gKVnWAy4u0ysngQw=;
	b=Cfc9q/WHRPsoCWBZpTwZfTH1kJEtT5MOHjTNpynsoPyqLhLynD1srfo2nKsL9flaGQ
	4fuVSK+ZYF4w4Qe9E2aEzLGSWcd59ndehnpRSV3TAQG5nkZczqYNYJbx/1GN9d2i2sad
	V0FiPBLWAuIkXLhU0+Wm77LrIYoM25/AOhMsa1vhLyBkYXRMM7DMkESvUAdDNGpSxrin
	SYZHcm3pELIoEw9z+PzoEMDg49fPFndBGquqsLz3GnAOC4b5nb6p2MP5u9pLOYCsRoMw
	Xv7p0Zx3SbTc9DCeKR2bJZmiYESPBoM0ok/AnwSrN2uGXjKWi/wr32cru59izfsemiR+
	ShFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zc3tJ3GiwAz2q6hrm6F2ynicdt/gKVnWAy4u0ysngQw=;
	b=LMgLm5GqSWyrzH8QAToc1NouGTaWg86MLWHcG00z0nsXgkYhspQYwyAeQ7YMlj2YvQ
	fPxCfL5i6491ohxaL/Arm0D+H8eASdahRjrIVgSK2EwTDp7tAKtqO45LuWRBaLj1fWv4
	yCBbk0k8atyeV3K5TMzdESPk+HmwQ1tmjzIjDAMj8SEjGgSms9LuuK1UUQgD8IJpq6wJ
	xRnirS5+1d9xsR0QFcY/M6OUp9inxabWHnvg8u4tWO0BE0muoNX1JkRVce/cAkj53TG4
	g7o5ZLwxgWKiCC8aXLWG7vh/RDjCr8YH5xnqDy9BKMWzzbOUvtHEDwu3ZeYZZYCKBh8m
	M2aA==
X-Gm-Message-State: AKGB3mKTFyDfwj6QtYdLm6dcRzhUVEKCuHGJthtptgyjDEiwMP0H8UP6
	2KczLYdGtrUox0kR6WaR7v8Lwvcb
X-Received: by 10.98.178.17 with SMTP id x17mr9731316pfe.239.1513263219511;
	Thu, 14 Dec 2017 06:53:39 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:39 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:55 -0800
Message-Id: <20171214145255.31545-16-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v2 15/15] sdhci: Implement write method of
 ACMD12ERRSTS register
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
X-TUID: s1LjIHo2PoOB

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 758af067f9..cb9e0db9fb 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1139,6 +1139,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         s->admasysaddr = (s->admasysaddr & (0x00000000FFFFFFFFULL |
                 ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
         break;
+    case SDHC_ACMD12ERRSTS:
+        MASKED_WRITE(s->acmd12errsts, mask, value);
+        break;
     case SDHC_FEAER:
         s->acmd12errsts |= value;
         s->errintsts |= (value >> 16) & s->errintstsen;
-- 
2.14.3

