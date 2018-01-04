Received: by 10.223.134.117 with SMTP id 50csp12820378wrw;
        Thu, 4 Jan 2018 06:41:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBosalfOe01OxLGK13RW3dDoNSJkNFni8orDYL4GYhSltHibAdHSf+o367MsdGSOgy3JmTfcd
X-Received: by 10.37.234.18 with SMTP id p18mr4546494ybd.273.1515076895731;
        Thu, 04 Jan 2018 06:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515076895; cv=none;
        d=google.com; s=arc-20160816;
        b=zW/aR2pRO5ZAezm1YswzUh/2ohG2W3yPEmM6rsjQ8qr6ZD8NOieX2SUxSF+OzgSaJo
         K+q0E1ixPi798tJhAMfb+bdL4GVi+0WCp6PeIURzVvgbQjvtLIIrXpFZZ8rYu4EmDwSs
         anZPiAjz2xRe0H5EySoDpHVYSDtwGkXnEUmwoYqJsFZYfqv+JhIjScHfWPaF/HigAcix
         j9F/1puWdk2aWItTQdrDqLA4VNjCDWDGmRhpNCbCOykRkwu6dXzu4GmLcriP4NMM3Ha4
         5hURUSQDAhBtan1kb3qPV1PJ+myhBq02HGE4VuqmLZmjrUIILR4ObtSvuaR1M/Ym6sPE
         WktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=JRH7w+A9KQ+7j2RUYLYMc2679FKqvTKsJ/8GcIPoh7w=;
        b=gVA2ZoBEgMJ2NhdHSe6jZjQrTZrJXAF1WD/CJn9raVhP63VL1HOxIOQddyvAghy/+/
         8WXP4K7xC6Qt0JHRmBK5NKByOlnzGiFJ9Jd9crN+gRj6rkrTqfcjhtOQ6XDHieuKpzGY
         ntQKSZBXZvwNsME57ciyDJCtpUHseAjxqFWZF9RHwEoTWOuWSkgMssBbAbZl0LmUCc69
         EUdApdSEdlISQn9vKwAQ6CY4XwnMx2mZhERVhE1kVgHiTicnMMD+y+OQEwLH5YiaDNtQ
         2s1Fb0uGrKqvmE3uhQUSzDMeem8XNDINcrdA33NVgDFCMWvMUvPJh02EvKLAMQ6mCa4C
         /MyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JQaCHa3z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5si734665ywc.98.2018.01.04.06.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 06:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JQaCHa3z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX6i7-0000qW-5d
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 09:41:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6ht-0000od-68
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 09:41:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hp-0003FT-GQ
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 09:41:21 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33211)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hh-0002zs-P5; Thu, 04 Jan 2018 09:41:09 -0500
Received: by mail-qk0-x242.google.com with SMTP id x7so2150720qkb.0;
	Thu, 04 Jan 2018 06:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JRH7w+A9KQ+7j2RUYLYMc2679FKqvTKsJ/8GcIPoh7w=;
	b=JQaCHa3z84DXXNvHve4+aLeE5r25ZCYGOjq2h3oNQva3zgK5d8xSjYmjWaim/xnQMn
	tckzuCaNaxarxEMJVPcgjTC1Zx0jofyImWHuKggFKs/3pk5OUKGsNgy7kehR60tTmyED
	WZhC59SplWRdE//YHVOMhnnHgCrkkg+ImRVCGHvLym5JC774ZrVzpaAM0ZsLEjDL2Nga
	0TomZLFx64+QrJSJyw46Tby3MNqrAEN9g3mLFJJ0rYHHuUxKv6KUqfctzNXoeIwUngUA
	Gt4djLGK7pWA2Q0SiMOZIvux9sQXC+oT/VDCc+LY6yEN/OJ7NStgWnkOCZXMGr/mki8r
	eejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=JRH7w+A9KQ+7j2RUYLYMc2679FKqvTKsJ/8GcIPoh7w=;
	b=NzRrF3GLZ7ErxGx1p1V3KwI5lWshorw3TrvzPAZsBcbk1cRMokYIpwrDTD8ZEgtnZk
	SuYzeKqqrNj+tRwkY7H3pnlReXPkEujgowRBrexTP+XkqQQpOL+8n38xix6LE0XfydE0
	r4KJpRed2LiVMJRWdz3nRlj+J+DJ08N/mrDQNTeSXNbIXDKZWzk6PuNztuRmjsGSRJUd
	XYngoKWCU7a5qOVEG9xsVEjzZn5CAkj+mEZSLLcw5FybKGiaGIoyckJrvxKsQm9Mn0GH
	zJcxNW0bEaSLW+fuJiNyVZ2R+ewwD5fyYv4gPY6ZzQ+Z+fFVVSXKdFsZkagTMND9Njkw
	/Pww==
X-Gm-Message-State: AKGB3mIwZSeFy2KBNdMKwvtiif6Moe1dSAKhKAiYA0+0sbDaFXiEoqpY
	zCBmN8QSBeXIkawPoid/uCw=
X-Received: by 10.55.214.198 with SMTP id p67mr6335823qkl.250.1515076869182;
	Thu, 04 Jan 2018 06:41:09 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	l188sm2223304qkd.36.2018.01.04.06.41.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 06:41:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Thu,  4 Jan 2018 11:40:43 -0300
Message-Id: <20180104144046.30793-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104144046.30793-1-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [RFC PATCH 3/6] hw/char/cadence_uart: add FDT aliases
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
Cc: Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n8odpfQ08y0k

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/cadence_uart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 6143494060..6880827947 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -552,6 +552,13 @@ static void cadence_uart_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo cadence_uart_info = {
     .name          = TYPE_CADENCE_UART,
+    .aliases       = (const char * []) {
+                        "cdns,uart-r1p8",
+                        "xlnx,xuartps",     /* Zynq-7xxx SoC */
+                        "cdns,uart-r1p12",
+                        "xlnx,zynqmp-uart", /* Zynq Ultrascale+ MPSoC */
+                        NULL
+                     },
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(CadenceUARTState),
     .instance_init = cadence_uart_init,
-- 
2.15.1

