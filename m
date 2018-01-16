Received: by 10.28.173.206 with SMTP id w197csp3376803wme;
        Mon, 15 Jan 2018 17:38:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBotUh5y+xd+r2UEQwcQ5BcUpoN1EWITumAMR269xCaYQSsurylnH+40YTL5OATSGUcF6NSwv
X-Received: by 10.37.36.4 with SMTP id k4mr33502400ybk.311.1516066680561;
        Mon, 15 Jan 2018 17:38:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066680; cv=none;
        d=google.com; s=arc-20160816;
        b=JnNxPR1z5CYfEzZaEWhKEEy7BTdLi/rBD5emyTAUs6H4SQFuh6TVAwTC1ZT2tECcTb
         rCasxJ+/kNaFN3uysVGTbnbsNMQqywKaSGGOHUYnU3WZigW+WSINRg8WA1gQB2rWP3zI
         B0eMYYFBmLQml+Z+xBLKJZla5uyjmy6W0pDRtsbh7+R1qx8IThN6/RBE8ucsj3FaQZjG
         CcuG4XshgSHpNqU8Keg1vZSPjW7Vji4fzmp6lS7oo1JRBCvx1pmQfPHp8EilqSiDPEdL
         s1Qu4PApg1cBv/jXyR9i2M4KrpjMAXOa7+HAQTQQ9A5p+ITNQZY6JU0iO8ldQCK2Xven
         hR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=GfpjiwYve0+eA8Vi68DD/zLMe0628N08dTKTMLPq/70=;
        b=QK+4FNrJVzEX7pq8OIHS2Fa/qmd83cen1OHIn5jg+DEfVbOTVn5egf1L2JumlEwApt
         HuGBUsICVgCryFf9Xu0yP+NdKca268QbhabEAiSTXvpZ/BNQcroQNvT3mv+70MxMJbw2
         ut0igHpKIJhJHGUudNcrePJRbQWDMRVQi9kI/oqL/WAxWvyrqhJb6qnww4TAzb03JfCz
         oOWhHy6VYBSQtI29p1nnvpzoglNUpY5jatd0HWZ2zK6vqwSJRXxZzPmxrFeJpg2AlHba
         cMWXQWwkiYwHZ0/OCOohzQeB62N67bZJw0kbip/VCxh6E8F8lFw4wbl4DtiIoR0cIU/4
         MB0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BXq33byG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g84si219526ybg.102.2018.01.15.17.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:38:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BXq33byG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGCN-0006Ad-VR
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:38:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38596)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGBy-0005wb-VA
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGBy-0005Ci-67
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:34 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:43241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGBx-0005C4-VF; Mon, 15 Jan 2018 20:37:34 -0500
Received: by mail-pl0-x241.google.com with SMTP id f4so3543583plr.10;
	Mon, 15 Jan 2018 17:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GfpjiwYve0+eA8Vi68DD/zLMe0628N08dTKTMLPq/70=;
	b=BXq33byGSpWIpiub7bCFFyslKJFs/7FK0kqpITQH6V+QaHzb1Qz9mgbdxsgGkGxQcn
	ChQ5kiu5ek1WMyG/SuzuZpv8PvVpseA/yPisZpFbz79wH6KcB/5M7E2euQ+UrpbzQr0Z
	01Jm8HnP4jK8L5UZd1R9bekAmBTYAMWjPBirPl54znkIgBv+y0ruXHbrOlY3YKoEvGRQ
	hmqAll8yLCKrNDL6QserkQ9OR66io3fq4/qwTXnRS2Quz7pLRLSPE54FO2Zw/enKm5Cv
	GXYG7X395IV0QRP/GzVHhiovSZ2L06VwtrlkcMbQhTdbgRMp3l0/dqhV3F1ZaJ44qvrO
	DR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GfpjiwYve0+eA8Vi68DD/zLMe0628N08dTKTMLPq/70=;
	b=npt8Uy7XNK6WmijABq/9VKktO61Pr01wzaxhcWtRFZZ1NGQLGq7uSIwZ6gZ5vePuk4
	GV822Yk33NmtAOZt5Pczgu/51PsimSAxVes7MPZLFD/kfc2+nGlXH7XLY09ctBu1NqnK
	EhPMG6wLSogOPlsCBBozwfZW5MKbHDPMh1CzXDs9Kd7xCYnMTmSjdwbSnckLrELC242W
	3a8pG18VaPWe3lKP6PbsGlP2I57boTT3UKY4ras9QJ6kKIRP8Ebhg1nRcG6Fm4vtYxR9
	v9HAsuT65cC1gPUFl8WTu+NaKICcTkDg5HSbzsGcbZQQ/gRA+NmxP6r1n2+hDF+Rw/oS
	abOg==
X-Gm-Message-State: AKwxytdXAqnpvzim0KhfCpbsYIfsNjmBJfOlx3+CYHtq7MRF0iQnf9ps
	f3AaaT3iKQCV5nbWozOkN4aYo1In
X-Received: by 10.84.235.131 with SMTP id p3mr12829589plk.18.1516066652710;
	Mon, 15 Jan 2018 17:37:32 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:32 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:36:57 -0800
Message-Id: <20180116013709.13830-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH v4 02/14] hw: i.MX: Convert i.MX6 to use
 TYPE_IMX_USDHC
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
X-TUID: i+xt8WevJnNJ

Convert i.MX6 to use TYPE_IMX_USDHC since that's what real HW comes
with.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/arm/fsl-imx6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index b0d4088290..e6559a8b12 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -93,7 +93,7 @@ static void fsl_imx6_init(Object *obj)
     }
 
     for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
-        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), TYPE_SYSBUS_SDHCI);
+        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), TYPE_IMX_USDHC);
         qdev_set_parent_bus(DEVICE(&s->esdhc[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "sdhc%d", i + 1);
         object_property_add_child(obj, name, OBJECT(&s->esdhc[i]), NULL);
-- 
2.14.3

