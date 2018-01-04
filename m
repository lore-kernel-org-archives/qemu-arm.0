Received: by 10.223.134.117 with SMTP id 50csp12820422wrw;
        Thu, 4 Jan 2018 06:42:15 -0800 (PST)
X-Google-Smtp-Source: ACJfBosHx0fxSuXkEcpni84+068Afy+ptMIOTg1dawPJbIBw1CTxjoeB0h29Hbj4hAj9vbv8ZZ/z
X-Received: by 10.129.118.20 with SMTP id r20mr4245522ywc.379.1515076935149;
        Thu, 04 Jan 2018 06:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515076935; cv=none;
        d=google.com; s=arc-20160816;
        b=FbLjZyD5FBNfG+AC0hKFy+bOaCnoUyLOHRzude1CBxq1HFG5bGyJIGkmN56M2V7pnr
         3l4F0isaLJ+sdCdkK4P2AR5LVInyS/zxOQnq0iEy1U8ThKQcaSokayH9JMTjeHH3LdSy
         2UAf6NQIVHk/dASJ9ihurFkGKFCb6JMcDB6Qse5UeRwcDfkwW64I0cS4fx3JO6tNOf9D
         4UQvZxQR8Z2DPM0Y20ndXRDPkYrutodBWBBGz4EokXVZ+FbNQovTmNz/Lr8t1qwc96VK
         iy96sgX04h/YdXzdTZp5R4AT8+2m4qa0cHJP8HAuX98knsATWoPG6q++UXomQf3EVwRR
         SCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cAoG7VphkUEFTzHsvOl83OAUEf6MFYJLtCKyEuj5PZw=;
        b=H80kW279R0tnMPLC2BRHW74CPeqJCzQHd2R6FFUlEei4pbHS4OoTaAy0kr0aQjSYs4
         wIRnqQPXSkYRJiNuzokOTDWipgF9SqJyNreg0DksUNrPZIDbQ2BdIK3iOxqyKPlcMKey
         nLikJ352Bk3uIxvplDoKj/uTycLHxePl2IORqyr8UCtKDyIYpkUEI0jLQGisHPk4oQX6
         cUHwLQvDwXJ04mkWx65Fp+qDwxAAwzNfrZIr0A2QQGMBjpyzbZYi8pJ7ZdbOgNqXi2Xt
         EXyZE/dXmA7zdmrvPzYoOFJEHnWJIH9PheR9Qn09iKJsUo4cIlzbaLbRA8M93LpRmam3
         3HEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CfX0sD5G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i184si475026ywd.729.2018.01.04.06.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 06:42:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CfX0sD5G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX6ik-00018u-Fc
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 09:42:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hw-0000rx-01
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 09:41:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hv-0003OL-7U
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 09:41:24 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:40718)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hv-0003Nc-3J; Thu, 04 Jan 2018 09:41:23 -0500
Received: by mail-qk0-x241.google.com with SMTP id q14so2149752qke.7;
	Thu, 04 Jan 2018 06:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cAoG7VphkUEFTzHsvOl83OAUEf6MFYJLtCKyEuj5PZw=;
	b=CfX0sD5GLS5xAAmYiXXcjeeEfRHMSgcxaxMa83e8Ri0Xye0ULR5sxKualSz9Kqk1Ga
	GUFKFhfbHKIzQnUQje/e5BYVh5q4io2Y3awUKlWxUDQrvAXQl83RSVAcMT2V0c7raZUq
	HyUceh255KupWNVwUcJCRR7OsW73Q02umJj5FTiDBpooOyXDRBdaPiAolDGwcsE61frb
	0+TXHtYYWJoNm4doIWA6gLSnx3pshoHiGOgEmipU6fi9XfXeFfxDxhg5wQL0ADkde/PG
	kSI0oHmwjWVHRPzJkHkGbQXr3luAx1M2YQQW58HjQSJYlbFk95UrbNdRnrO0FNrR7Yt4
	lnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cAoG7VphkUEFTzHsvOl83OAUEf6MFYJLtCKyEuj5PZw=;
	b=AUXw8Ms9xs7p0bAapdeTZVi65dLp2qilov9jVBWQEzvFNm0sPHd8/zcP0bUJcRZC3q
	h5Y3oYEbBsEbe+47kdApfMOQjmsjW8nY540ob76nv2nICgXalZ752QUPaqwLDYV93Efz
	Cs9tDyckR9GxwkKne/2PC6wAjCIWoRiRVU0UrjRgeR2W1rMdqb6HJqjL5vkWdzys4Bt/
	E1NLhNxtaDuYiqy8SQmt0g2VBOdG77jSqYuOJs+c7XSJm/Fz+qTLKh613gUZkGcaEvdh
	jTx+V0ySmCX/5grkvXHNMsK2RAAitD6DFmI1oBrM1X4sILWqRM1mEWw3Y5tuHHKzmFBC
	zEEQ==
X-Gm-Message-State: AKGB3mIwnZCr8Mkvb0V98nCmp2bvZe1paZQnB50JouvaL4cFoI+l/J11
	Ra7l6g7K7RW57xTtPgLpbkg=
X-Received: by 10.55.200.8 with SMTP id c8mr6519308qkj.3.1515076882448;
	Thu, 04 Jan 2018 06:41:22 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	l188sm2223304qkd.36.2018.01.04.06.41.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 06:41:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Date: Thu,  4 Jan 2018 11:40:46 -0300
Message-Id: <20180104144046.30793-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104144046.30793-1-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [RFC PATCH 6/6] hw/arm/xlnx-zynq: use FDT names for
 the Cadence GEM
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <famz@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f+AuDXd3HRsJ

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xilinx_zynq.c | 1 +
 hw/arm/xlnx-zynqmp.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index c45c364583..5ae18921c1 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -245,6 +245,7 @@ static void zynq_init(MachineState *machine)
     sysbus_create_varargs("cadence_ttc", 0xF8002000,
             pic[69-IRQ_OFFSET], pic[70-IRQ_OFFSET], pic[71-IRQ_OFFSET], NULL);
 
+    /* cdns,gem */
     gem_init(&nd_table[0], 0xE000B000, pic[54-IRQ_OFFSET]);
     gem_init(&nd_table[1], 0xE000C000, pic[77-IRQ_OFFSET]);
 
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 38f038786c..1aed89707c 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -150,7 +150,7 @@ static void xlnx_zynqmp_init(Object *obj)
     qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
-        object_initialize(&s->gem[i], sizeof(s->gem[i]), TYPE_CADENCE_GEM);
+        object_initialize(&s->gem[i], sizeof(s->gem[i]), "cdns,zynqmp-gem");
         qdev_set_parent_bus(DEVICE(&s->gem[i]), sysbus_get_default());
     }
 
-- 
2.15.1

