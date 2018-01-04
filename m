Received: by 10.223.134.117 with SMTP id 50csp12821007wrw;
        Thu, 4 Jan 2018 06:46:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBosTKYg/BPYNIr7ufday329+iX2oK+EpTjFCNW23T6aiz5jODLGoIAj3mNogfEXVARLQ0Ye6
X-Received: by 10.129.177.133 with SMTP id p127mr4335007ywh.416.1515077208724;
        Thu, 04 Jan 2018 06:46:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515077208; cv=none;
        d=google.com; s=arc-20160816;
        b=EzjrA67JfYfi337ntEEV2p4cZ/IWU5NCOwzq22i7SD01v8zEgDxOGTmQEO1VTwuc1A
         xCIEwrUp0a52XzhPYcs6E1/WiI3p0P1DtbPWBKA5Y1Y9vH9bX7o01uIfCvfzzM/c5Mzb
         LDclh2tS5mtDiutRvq2b1Gdps6BSU5xLz5ABEHpfWttPEPFR8O7bYtBlRVre/a/BITm8
         qMvHX5iqAERukJZ8NJmS6s7e896mxnb/uJP5qmV3l0ClwNm89IJIY1qtBAyKaeTIJj6z
         EMoY6V+a8hTv7H0aA1ncYgWcQ91Znpo9dY8efMvO1q15NE4pWZM8MCkvlqi8lkKaMMKg
         mZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rdDW/K+V2S1TJmsCE2B1sG6m5yq9IskzODbwzPOi1SI=;
        b=H8C5XXzfeMsSLj2Yb45dPxlvhRTKslJIpJ4qdBNj+ynZ9itbbNQElqncrWSIfrwEYg
         /a1FXgyJg4b72CzzQeZoZX5Xy1AM5yjRUae7Hxt6nvJRexaXigTIdpIEjRJLg7NVrjU8
         d9wSI5LX/Rr5DGuleEFPxYHGNOeuoUXKoEg0q1ZFcR10tfdIzy+UUDRDdCgrqd0jAyS5
         CNqkafuGu35ZK/NofheJfctRgOEUTJ2BCWsLbfhdit0NoXIWBjhB5cR42A1LPI37fOW7
         +Mtj6qO6AT34UbM+hVjvc7xRZV52a441eHjdyHEdc1ZGWTwYpD0n9QWz1qWOlr3FWUxP
         IT4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D62nis4i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o189si757154ybc.295.2018.01.04.06.46.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 06:46:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D62nis4i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX6nA-0005u2-2J
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 09:46:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hq-0000lL-1H
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 09:41:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hm-000397-68
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 09:41:17 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:37218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hl-000380-UP; Thu, 04 Jan 2018 09:41:14 -0500
Received: by mail-qk0-x242.google.com with SMTP id p13so2144453qke.4;
	Thu, 04 Jan 2018 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rdDW/K+V2S1TJmsCE2B1sG6m5yq9IskzODbwzPOi1SI=;
	b=D62nis4iz0dwH7+xfYZCgqgOm9Hey68kHKnzqV8jbfBq1WJ1iC9EcJec7bLM/HS3cO
	dPcpTmWG6XgQM8Gz0rFCijp90U3CUdVejl70HM2RllltFSM7ENPL8BLmYB3v/kqhoaif
	ZDJocTdwV+CBzltYLyqol30g1Ud4qGw/pg309C5iYxVc1ny4bvF7yCdQ9rfovE0Juz5e
	EOFBQKRut4wl+lI4vyVFqtiKAe0u4klQqnhNxox5TArygyElzeGuqZ2hPMt5g9cdhJLn
	Vk1EtCBgfp3zMsOctUuehlFcHIxsMMNS8gV0mWQyEnAn39+epWqS1G+8g6FZuypcQYjF
	lMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rdDW/K+V2S1TJmsCE2B1sG6m5yq9IskzODbwzPOi1SI=;
	b=NZGjF/XsPHM0feX5B5zUQTTnMRHTdeftWrs0RmZZDvQUNlcb0cUP7JfIYz6aZ5Bi41
	kfiVUWF3IeCijGxUbrdbf9vBk8IJ1Z3GI8PCBRTFcdYX7e30mwWwgxnlovALlFm5he+n
	OW3dRWfK5tK5IYfmXtNkxLFccVsME4uGyqhCpm8l+Woxpsst2fcHvpiU63ckyuOdXowZ
	rUoJ60YY+NnYKyDw+LJePWbOHHP40KfPmEixQcFf5cIriHgmTKaFj+Pb0Cc0rU70yhxM
	SpnJqek2glAx8fbXb+o8nzX0Hbx4H5qRUMj9MYbP0Hv1U6s/x2gQMvVhSOuZOJTkzn69
	YZ0Q==
X-Gm-Message-State: AKGB3mIpTSZVmFm80gkeNXr/KsDHouq+h+Cnx8Xgy+JBiPg2KSZdZAW0
	lOKHcvUKrxU5DmIFTog4z4E=
X-Received: by 10.233.237.14 with SMTP id c14mr6377856qkg.323.1515076873418;
	Thu, 04 Jan 2018 06:41:13 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	l188sm2223304qkd.36.2018.01.04.06.41.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 06:41:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Date: Thu,  4 Jan 2018 11:40:44 -0300
Message-Id: <20180104144046.30793-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104144046.30793-1-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [RFC PATCH 4/6] arm/xlnx-zynq: use FDT names for the
 Cadence UART
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
X-TUID: PxLIGjBY/5Tq

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xilinx_zynq.c | 1 +
 hw/arm/xlnx-zynqmp.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 1836a4ed45..c45c364583 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -236,6 +236,7 @@ static void zynq_init(MachineState *machine)
     sysbus_create_simple("xlnx,ps7-usb", 0xE0002000, pic[53-IRQ_OFFSET]);
     sysbus_create_simple("xlnx,ps7-usb", 0xE0003000, pic[76-IRQ_OFFSET]);
 
+    /* "xlnx,xuartps" */
     cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hds[0]);
     cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hds[1]);
 
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 325642058b..38f038786c 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -155,7 +155,7 @@ static void xlnx_zynqmp_init(Object *obj)
     }
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
-        object_initialize(&s->uart[i], sizeof(s->uart[i]), TYPE_CADENCE_UART);
+        object_initialize(&s->uart[i], sizeof(s->uart[i]), "xlnx,zynqmp-uart");
         qdev_set_parent_bus(DEVICE(&s->uart[i]), sysbus_get_default());
     }
 
-- 
2.15.1

