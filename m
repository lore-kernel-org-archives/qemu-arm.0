Received: by 10.223.134.117 with SMTP id 50csp12820650wrw;
        Thu, 4 Jan 2018 06:44:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBovKvIx4hntDm+vUpnmSPVvY798YX5Ta9GtsQuwq1aLGUEv+SoIR0POq6Sur/L1K5rMhtKrq
X-Received: by 10.37.205.68 with SMTP id d65mr4353163ybf.525.1515077091846;
        Thu, 04 Jan 2018 06:44:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515077091; cv=none;
        d=google.com; s=arc-20160816;
        b=Pi2T2S0Vh8F6Zt04KSn2XKhXpvp1ji3tYB8IgoJsUHZtRR1hPNQCHeAUIgRvIma0Jm
         C72XcVZdmoBwWGdau5WDqfcCk0qhj5na8Qci34tv1GVX1hCrMm24zFldLZy6BMB4szs1
         +p//JWg1+fbifCBzMQRwSoXt9b0FUodpq1+IT5uxnlK/mbB1MCB+1cv/BrDcfp2wMWhs
         fQlCvzTmqfBOzmoULSCd0o5yyW2jfm5FXXjqA/cZHxi0I0KnJ15KxkrfbY8g0cw+OvNj
         8KtMZNpbyx/1K5k2Qf9KcR3cQSiwyIBMLxwu5zReNhu3cyqixfq2NyAFnh5AQB/uB/vF
         B3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=hvwfH9sq1jQvr58Q/oGbYfQYA6o+JX6tCyEjRLjlqCI=;
        b=kM6+d6A81LrCtju0QFsAR6C3XTpMLjAzYmbgAspSnTl3TUpM8pdr5dmSRXZlU6e3ZB
         0n7fp9JLnsonXkbv3IXG0DzIqeQz7jdVy/J9c6K4z52aB830KUx4LlXdo+wi2t5rRD0F
         MyRHakHORiVZAM0gC//+5sBO/BTs5QI2ftoegZHMV1LRoxHsG1hR/TG6jk045mrwfTz4
         MnvEyJO252iIu3fHYcJN2QXXYgqrfYmvgMoRE7x9+Cr9Sct5FM5seHSuYB0O37ookwOH
         QZSgWtUwjAjAM42oHAh6Wo48S6gMAMLzF4zetx7BJXXqW0Fon/dkrh5H0EF5AxXrF85L
         flFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rj7dvaEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si730573ywj.15.2018.01.04.06.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 06:44:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rj7dvaEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX6lH-00043e-8Q
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 09:44:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hx-0000tf-4v
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 09:41:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hr-0003Id-7g
	for qemu-arm@nongnu.org; Thu, 04 Jan 2018 09:41:25 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eX6hd-0002uS-K6; Thu, 04 Jan 2018 09:41:05 -0500
Received: by mail-qk0-x244.google.com with SMTP id 143so2148893qki.2;
	Thu, 04 Jan 2018 06:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hvwfH9sq1jQvr58Q/oGbYfQYA6o+JX6tCyEjRLjlqCI=;
	b=rj7dvaEQr1wsxUBGnpJMqyKrN5cbhJA64NG9QWvXqwGtka1h7j3fe0HdopQ77xxJLc
	4QeRsyhyWRqB0t+4jqJCq3W4ISvPIM1Ch0nThsvD0mDPEeKboLAh5wJqm9jfMFmMoQB0
	HC3d4d6fM3PkUp6jRROo6iHP9zks5YKeGg038ifVP+DznLhEtPMR78/cbihm4Lb61HX9
	Q+tlShCl6iIjPx1f45jRxDAqxzNK6KFISDmchtUiUdm2ULXP5DsKnr0oa1Qq8yefYXX2
	eAY4yNl6F77wF/FQz35/GqQGRlI4/G7kamOX1GtmFk/3V82SyX9RYnIW39A8TA8+h+79
	GvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hvwfH9sq1jQvr58Q/oGbYfQYA6o+JX6tCyEjRLjlqCI=;
	b=fpHfl5ELz5p1c7M1EeHzC6CvRgFyZkVB7jyrNJNSaC9O/GVfCKrwaZzKcjYXirJMqT
	P6jQbi6jyJuJFqBiOhY/Ju4bop4M9qoRJYOyTTt3atwFMvBPp2eIkvp/A+THb2Fq6hon
	mqwTddV4Oo0VMj1aH9Fp5OnOvP5ym4UmM07GexfpcVT094CuvrU/uNxb0ErhQPyXBINd
	TOMbhFPXyVJeUm/yTbXbmVkwS7uEIoZp1TbTuvHPLnTQ3lbTg6dIf2doGHwy7vGR4R4i
	hqTF1aECWmYEkrcsjIx81BWPJVBmIeMH2F1PT5lgh8bXBuycC9kcGc5jb9FE58aJIBpf
	9U/Q==
X-Gm-Message-State: AKGB3mJ7wACSt+jyDfJNaorMF84ikaVppCYQnZ2gRpAnGckYrlDHBYw7
	yK3GfUweNgfUJLRJDr1bTU0JyVzsXqM=
X-Received: by 10.55.39.204 with SMTP id n195mr6073357qkn.68.1515076865030;
	Thu, 04 Jan 2018 06:41:05 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	l188sm2223304qkd.36.2018.01.04.06.41.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jan 2018 06:41:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>, Alexander Graf <agraf@suse.de>
Date: Thu,  4 Jan 2018 11:40:42 -0300
Message-Id: <20180104144046.30793-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104144046.30793-1-f4bug@amsat.org>
References: <20180104144046.30793-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [RFC PATCH 2/6] hw/net/e1000: real device name is
 'e1000-82540em', 'e1000' is an alias
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
Cc: Fam Zheng <famz@redhat.com>, Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uxl23p7rsmfR

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/e1000.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 05a00cba31..2280f7fdf9 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1648,6 +1648,7 @@ typedef struct E1000Info {
     uint16_t   device_id;
     uint8_t    revision;
     uint16_t   phy_id2;
+    const char **aliases;
 } E1000Info;
 
 static void e1000_class_init(ObjectClass *klass, void *data)
@@ -1695,10 +1696,11 @@ static const TypeInfo e1000_base_info = {
 
 static const E1000Info e1000_devices[] = {
     {
-        .name      = "e1000",
+        .name      = "e1000-82540em",
         .device_id = E1000_DEV_ID_82540EM,
         .revision  = 0x03,
         .phy_id2   = E1000_PHY_ID2_8254xx_DEFAULT,
+        .aliases   = (const char * []) {"e1000", NULL},
     },
     {
         .name      = "e1000-82544gc",
@@ -1725,6 +1727,7 @@ static void e1000_register_types(void)
 
         type_info.name = info->name;
         type_info.parent = TYPE_E1000_BASE;
+        type_info.aliases = info->aliases;
         type_info.class_data = (void *)info;
         type_info.class_init = e1000_class_init;
         type_info.instance_init = e1000_instance_init;
-- 
2.15.1

