Received: by 10.28.173.206 with SMTP id w197csp3161320wme;
        Mon, 8 Jan 2018 18:05:12 -0800 (PST)
X-Google-Smtp-Source: ACJfBov+lsX/Mtgvt4M3fSuQCBPBjr5L/e0TS59ksULW2QdzcCcNGJqiXlJSV9QIeiI2a15hhoYV
X-Received: by 10.129.67.1 with SMTP id q1mr13251178ywa.464.1515463512442;
        Mon, 08 Jan 2018 18:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463512; cv=none;
        d=google.com; s=arc-20160816;
        b=Ip/7dQ4q/1c05rkSbiokWCU/olVv8a5pYx/fl/majrtTC+mYiw51XfqSjyAk7o7Mvv
         rY9gHQy8KfYKmhXlZnTxpyGL0WtAE9j7sZdX7NepnnKeST6CKPJky6USMOkmgiktd+tg
         vGptAYgmP1BvlFYVOJmzzoX/Rp+mD5Ew50IBUGtYTJVcrw6nncJ6/Jcjrc2UY32T8vG3
         GROQsuDKXJZlRHD4RudgshVUQCi7QtthuypRX/hC+dmi127drEIchoLB+x59efLi+vgE
         DnM27il/+/tzF3mlBWmsaQiK3YNmJBo0ekazH8wvIq6siZDOw14T0WPzwV8raqb6AKnE
         90Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=UAfx+sxq0Rh+kh0AjW3s4syhERUc0lT0IffTA6AguMw=;
        b=cO0a5jNt3SQtCNm9T7fUDYt+eJhiARFhpRXl0SQFo5GBQP8xGfzYdMv6CVeudWNjuR
         2CyPzliivuYYWZ75k7D8e4q1HIbciODNCXXDBf3b60jZzUEmmJmhoCooPeMY4Ivj/Z2H
         GGYiQpBbxVlR/6ZqV8q69Uq0XwiLyuC9BjuFnnZnYu5oHhIN8EZJClvPnhOsTr5LN2IR
         ZMYl4nkD6hJ24JM47ZpaAv3JauEQ8eU3Ck9eqIifvARLVsGCf+sSKWyLpPzufwyoV1Iz
         tNHHiU1YE/ML3s+DICqxoR/8IAo12UlGqO8V4kQ8RyhEBlwtCzLeW4FVjiQOtoVxohgJ
         +a6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JFq0SeGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x206si2722044ywb.706.2018.01.08.18.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JFq0SeGx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjHr-0004om-Qg
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:05:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEV-000267-KK
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 21:01:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEU-0002U1-Tt
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 21:01:43 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:44789)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjES-0002S2-TH; Mon, 08 Jan 2018 21:01:40 -0500
Received: by mail-qk0-x242.google.com with SMTP id v188so16706978qkh.11;
	Mon, 08 Jan 2018 18:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UAfx+sxq0Rh+kh0AjW3s4syhERUc0lT0IffTA6AguMw=;
	b=JFq0SeGxhVu7nT10NvqPV80OvTCRd3tCubTgnaTHxZwsf1C9IlcEEFuPxbFMP5U8Xk
	w5deg1xBL/s/jSpR414+um/4y2m6o0MF05N0FEWogXRUpaToDLOIemQZJ+S84NTcznSb
	cjTSPkDryuLBP7WuTFRE6jJ25y//b8RiVlNPwpev9LYhVaW45AzcV1XDsNHnNlNTpTAH
	L5p7fIkP9f8K/hX5Fuapr/X7biGOMauWwFA3o3EKBoyOcx7B0HlJpZfRL2d46auFfLQy
	35UA1zB8x+ZQL1YcENiYUGtf3HOdY8IFZ9z2e2Qb4EfLwoqICW7dNZPcOOh0k58/z9s7
	8aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UAfx+sxq0Rh+kh0AjW3s4syhERUc0lT0IffTA6AguMw=;
	b=sFK+U0Ty3OH82p9tlQ3xJhe7HUXqUNme4OrdHpcIDtX3vS03uFWImn5EV0hLvVrZ11
	E+XFGZ4sGfWHi5upO0TFCx7BRtzCGbUytTqDE5UNXpHu3YUkyrmjxMzp6AhHkZVUcP6C
	EZSlCkAMf7QoKIcUWCdT2bkdKFmnBLFHRGwvoMrf/zQ1Gb1W/QHGqhEXXYqHbquLC//O
	JqhF4F3C7lSDMvy0J1nk50VIlpt3ORQMDDtSpmPP8x2EjO/5XqxZ+fLP44iA3/73URZm
	BmKhF+jLyFusFDdR41lSZeTRUD5VdnTcL6uOCJiKMTQyjpf0N08yz/vKRYJ4YWr5S1Lk
	IPDA==
X-Gm-Message-State: AKwxytcsCzF3B0PUoOdnsDzj/fT8T5NeHPQpx1lCn25jYe2ieT6ryuVd
	VRoSutkZRUbRDcR+yt4aEFA=
X-Received: by 10.55.24.96 with SMTP id j93mr19418939qkh.113.1515463300212;
	Mon, 08 Jan 2018 18:01:40 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:52 -0300
Message-Id: <20180109020054.32553-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [RFC PATCH v2 7/9] hw/ssi/xlnx-spips: add
 'xlnx.zynq-qspi' FDT alias
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W0IgXsKPJ3J7

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/xilinx_spips.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index d8187fadd1..9f7edc7a14 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/sysbus-fdt.h"
 #include "sysemu/sysemu.h"
 #include "hw/ptimer.h"
 #include "qemu/log.h"
@@ -1443,6 +1444,7 @@ static const TypeInfo xlnx_zynqmp_qspips_info = {
 
 static void xilinx_spips_register_types(void)
 {
+    type_register_fdt_alias(TYPE_XILINX_QSPIPS, "xlnx.zynq-qspi");
     type_register_static(&xilinx_spips_info);
     type_register_static(&xilinx_qspips_info);
     type_register_static(&xlnx_zynqmp_qspips_info);
-- 
2.15.1

