Received: by 10.28.71.27 with SMTP id u27csp240472wma;
        Tue, 6 Feb 2018 20:29:12 -0800 (PST)
X-Google-Smtp-Source: AH8x2244U4au7ykZbHFuAPaoBmEgGpgYwK0k+MLGAj8G9GQxm4f3vcnDR39FcSWMrGdp6g+blFAf
X-Received: by 10.37.97.200 with SMTP id v191mr3081988ybb.21.1517977752812;
        Tue, 06 Feb 2018 20:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977752; cv=none;
        d=google.com; s=arc-20160816;
        b=Lclb9Yb2l+K60npME/0ZKLamJ9oZO9E/GRBwPSJ8Wi0lbmqLZ7nybQUgNXaDsLhPHK
         gjaJuGaIydV8WwrxQpk3TfIWovKCTOoITZxrz/B+hnkPlxEUdncoIjEbpiMY0/V7ILWD
         ZxLLbwhbKjtQZ2lkrOw4u1ppuB4actna6snbwNPNYNKeAh8qYMRlJ8ilsHE98gY6kvZt
         O+XxJ8PnXDlP1A29LTpHUmL0yUjrMloCTR9BAId/KhOmrUTDRIv9dtXfkaoUgXmKy777
         QPvIC+Q+O7AmrhqTijY15oanmYDR/FV10gun2rAebF9fRa5QrITT1MnbKU4K6iUMvcZ5
         n6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=V0HdqB9TK/uPRcNnioHY6FtyI0Njmraqs4s1UalljE0=;
        b=ZxptrKgd7y2wYSGfLHbZXPwxlKlKnskCkfRe+g7u6XBM7HSOuI/TX2PtIeLOT04dXo
         2ixeOZoh4G6GDqp6IyD2Uco9NBrij5QamzqPp1RZg9HkZSHY0KbxYo+xnOkRZF52NxVO
         BDb3JzQs9aNcvxh39/t9+46ICiRZUptHoClgY5qOP1koldihvJFTzYyTFG75CEhaBLpf
         qolQzSfasFbFftUfoQV1N7IPlJrflrbFPex7Ig9m0JCxFRD9cxrKDmWOCrwXoxirph0C
         CJeDMWOXNRO48vmuYKzcs7ctZqEHKkYc7+SbkMj0qmnrB5ck8pHKQYVZxaHBFXSpqGty
         B+jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qKjbpI6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i29si111248ybj.701.2018.02.06.20.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:29:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qKjbpI6E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHM8-0003jt-6A
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:29:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIL-0000H9-B4
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIJ-0003BA-By
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:17 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:33820)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIJ-0003AZ-1w; Tue, 06 Feb 2018 23:25:15 -0500
Received: by mail-pl0-x244.google.com with SMTP id q17so2753559pll.1;
	Tue, 06 Feb 2018 20:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=V0HdqB9TK/uPRcNnioHY6FtyI0Njmraqs4s1UalljE0=;
	b=qKjbpI6E99ISBpyN21UNQc8gbu9U+9OkvPIdDnCmYUk5s6ryUeRDJWE8jmpcBQz2Os
	QfLRpBbRo8DtPQjC25AcwQr0yETYILoGUVuD6tvPmVGHT86Mpz/UNI52BjdPj+x4/EQE
	s+jcmB2aCXsiESEp/CXA+AJSX+toaWPq0zsGmURmpgq3ZoVFemzDVnCO0gxRMdSvWCJ5
	AWFh9tbe649r4pX5cyUn09Q9GpxM8NSDkBpMOAQhuHXsJY1UzF2m1TjXV7jQ2k0ivF9g
	xqDgcEHiAGp/P6qlgPR0bksqrlQSJHv9m7Q+RerO8ffWmvBCAW2dFgjZIB5hH8uWE0DD
	IKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=V0HdqB9TK/uPRcNnioHY6FtyI0Njmraqs4s1UalljE0=;
	b=LyQZpKZQvbaWBmcgpWds6O1/eCHsiWUmCQfmZvZWcDTuXT2WeoeRks4ZKEAE25zi8k
	hg7PqD3UFA3WZPOzyUNniUQMg6t79Lkk14st5kUMffPOPPu1wDbDOkcrJ/ALQ35cZ9MJ
	H345Az2hmsFGvPcAvB919C3/b5XxhB8OOI2smJ5l0HyGMOWpawdwBfYwNvl7bHwPIEq1
	v1uwb7MMsbASUp7xMEfzRxmrWR6sLTCYO2QM+4Y2NCXABtzrwIpBYy5nbXtTy6hNXBc+
	fPmk/5aDaHi43HjIjh2C6Gs0oGEIEhoLajdDo12jLbhho3QLqvFDyGCJq5Pasmpel4fs
	rjVQ==
X-Gm-Message-State: APf1xPAJd2WMEdb2qz1jGvuPsCU6/APm4ftnNgSo4L6VPJlbbphLEibp
	6p2nPwjaA9EjgSU+2nAqG1nMdnkz
X-Received: by 2002:a17:902:9003:: with SMTP id
	a3-v6mr4689485plp.338.1517977513866; 
	Tue, 06 Feb 2018 20:25:13 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:13 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:31 -0800
Message-Id: <20180207042438.15422-8-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v5 07/14] i.MX: Add i.MX7 GPT variant
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wyTCGWjhE7R+

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/timer/imx_gpt.c         | 25 +++++++++++++++++++++++++
 include/hw/timer/imx_gpt.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 4b9b54bf2e..65e4ee6bcf 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -113,6 +113,17 @@ static const IMXClk imx6_gpt_clocks[] = {
     CLK_HIGH,      /* 111 reference clock */
 };
 
+static const IMXClk imx7_gpt_clocks[] = {
+    CLK_NONE,      /* 000 No clock source */
+    CLK_IPG,       /* 001 ipg_clk, 532MHz*/
+    CLK_IPG_HIGH,  /* 010 ipg_clk_highfreq */
+    CLK_EXT,       /* 011 External clock */
+    CLK_32k,       /* 100 ipg_clk_32k */
+    CLK_HIGH,      /* 101 reference clock */
+    CLK_NONE,      /* 110 not defined */
+    CLK_NONE,      /* 111 not defined */
+};
+
 static void imx_gpt_set_freq(IMXGPTState *s)
 {
     uint32_t clksrc = extract32(s->cr, GPT_CR_CLKSRC_SHIFT, 3);
@@ -512,6 +523,13 @@ static void imx6_gpt_init(Object *obj)
     s->clocks = imx6_gpt_clocks;
 }
 
+static void imx7_gpt_init(Object *obj)
+{
+    IMXGPTState *s = IMX_GPT(obj);
+
+    s->clocks = imx7_gpt_clocks;
+}
+
 static const TypeInfo imx25_gpt_info = {
     .name = TYPE_IMX25_GPT,
     .parent = TYPE_SYS_BUS_DEVICE,
@@ -532,11 +550,18 @@ static const TypeInfo imx6_gpt_info = {
     .instance_init = imx6_gpt_init,
 };
 
+static const TypeInfo imx7_gpt_info = {
+    .name = TYPE_IMX7_GPT,
+    .parent = TYPE_IMX25_GPT,
+    .instance_init = imx7_gpt_init,
+};
+
 static void imx_gpt_register_types(void)
 {
     type_register_static(&imx25_gpt_info);
     type_register_static(&imx31_gpt_info);
     type_register_static(&imx6_gpt_info);
+    type_register_static(&imx7_gpt_info);
 }
 
 type_init(imx_gpt_register_types)
diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index eac59b2a70..20ccb327c4 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -77,6 +77,7 @@
 #define TYPE_IMX25_GPT "imx25.gpt"
 #define TYPE_IMX31_GPT "imx31.gpt"
 #define TYPE_IMX6_GPT "imx6.gpt"
+#define TYPE_IMX7_GPT "imx7.gpt"
 
 #define TYPE_IMX_GPT TYPE_IMX25_GPT
 
-- 
2.14.3

