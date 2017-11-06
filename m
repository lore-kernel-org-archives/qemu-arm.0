Received: by 10.223.150.237 with SMTP id u100csp2788459wrb;
        Mon, 6 Nov 2017 07:54:30 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RcbkGxfUKiG4wC0SHnDpiGXw9wnB/VE7PS7hOFoO8PjxOeHt5NGLun8NgbWcCqzXlykImH
X-Received: by 10.13.253.134 with SMTP id n128mr4880076ywf.285.1509983670406;
        Mon, 06 Nov 2017 07:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983670; cv=none;
        d=google.com; s=arc-20160816;
        b=XjZTpJiBxV6ULp6ocGCjrx/1k59G45x28qjMFu0pEkk3xEC8SqvWwohVpTqKNqg66W
         jXAndVHZyHkWncCozfA3FiqHFrfFSYWEg3Ov5guuLBgkSyjio/XwvY3+iTsVQwfSv4SM
         tLkaRbTozPEpOFBKpSUT3R9getcRkSGdK4iI8jqhX87yRZP8/XRgQ8/WrB6/HgUyl0QI
         lrsrz8810FuNZeNiFt9XdEfRB2nD7yr/5bSf9TY32VmM0YaTZ0u812f322CdzED55BhR
         QloV5Uz4sceP1UxHwKGNamXmBp3GvGZFUBgGiO2CJQekpxmwvLKlGvbEtdM/ChkS/Z4K
         lHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=XJlfyebN1xeOK575CC0qYGfAM4pk4xf2XoJ3QxQde7o=;
        b=PK+mZ+fY0jORClVZeQk3b3+aIRI8Lozpkf3JQdo3Ts7+McQxevizHuhIylMW5rR2c9
         l9xUo6+w3GXbKDtL3p20HbwH5d53Sf2OaFiPoquCfJ60L1pvNqRjAkPh5Pu56WdSmTB0
         m2h+pQO4et4xE51tVRKhBytgmHV3v763kqFtf+igcWaiewV8oKw97rhj5KYiF7H/5y4O
         szbPYmXJvqmpt/dEVzfbpcwE/8IdJXuNb7ZDjFn3VhQTrcuAeP7lXScs6PRp9Xn4UasM
         emOoPg/3TRzYlHjAIG7UOQ0+/Z+quruLPxOhUxyPE9eJhBSR9iIkBgUa/4eQFFGg42BG
         9JVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bUYjupTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l127si2700133ywg.287.2017.11.06.07.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:54:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bUYjupTc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjjJ-0003bF-Pp
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:54:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjde-00074d-Q5
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjde-0000Qr-6y
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:38 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:48203)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjde-0000QV-0Q; Mon, 06 Nov 2017 10:48:38 -0500
Received: by mail-pg0-x244.google.com with SMTP id v78so8513014pgb.5;
	Mon, 06 Nov 2017 07:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XJlfyebN1xeOK575CC0qYGfAM4pk4xf2XoJ3QxQde7o=;
	b=bUYjupTc7mPoquFC6AIF0gRmtlhXSMkgud4tnN89lZqIYbnUaQWjsGl6bjUSYehlTK
	wZe294nO4H8Y+VIotGXzf66kLNZaZ1qHSivVPzJTdMp11gNbmO7LMzlVctyEMqvvXi8n
	fiEV1ot1NKDxXfaD/ySeqsio9B8cPnEhejiD5cdssuLOWUKo2EHuwBrzqvA/muG11ZPk
	dOg9V2i8MXqzdRlGaRNF0JuPsLeTbate1nr2vO+TjI+5wjYFLcM/1IBZMOcQjDKf3IpF
	R83gaev3nsyDvB8oolQQ0+fMUtnEfbzXfrgw83seCFWjuvRBD8lbP6jqRZdd6LOcl1L6
	T9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XJlfyebN1xeOK575CC0qYGfAM4pk4xf2XoJ3QxQde7o=;
	b=FkxtmT+UjVs9iv1T0vHctAjb6n6sJ0XoEhc1lJcsXKs+sU2tW11YPvsClFBOZVft8S
	3+gh7Z0scOlDNl//spWgsTT79AOCRK049/RKj0oIA0DX2CQdImXBal2uyj5rPaUC0tA2
	n30KWBbSsA97Od/n5WG6j2REJmr8n0a0iroUpTdxLt4RxJgk/g0JFrcRmzJjJRd9DOhG
	PlMvHOBWenWwssJvfA7rWg6jzwZmQ70kQwyJ9YBOSxjSN72UFzqwg32tPZDOXic+UwlN
	k4FkKHidddmXLT5Br3ZUUFxcZUtuqPxZOi9wU+KPLlvB1ewkWnoG8nDc7/2IEgg4++ok
	OEEg==
X-Gm-Message-State: AMCzsaWmYPYGVFl1PbGwnxExGCw0dXDZcCAi/HGu4TG9/YlKVw28yWs/
	ypjAqWhZrP220wDNPEBqFaaRa8nRIAI=
X-Received: by 10.98.156.207 with SMTP id u76mr17090839pfk.211.1509983316661; 
	Mon, 06 Nov 2017 07:48:36 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:36 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:51 -0800
Message-Id: <20171106154813.19936-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v3 08/30] imx_fec: Use correct length for packet
 size
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
X-TUID: 3VSB8246wuMJ

Use 'frame_size' instead of 'len' when calling qemu_send_packet(),
failing to do so results in malformed packets send in case when that
packed is fragmented into multiple DMA transactions.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 38d8c27dcd..eefb3b2c62 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -528,7 +528,7 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
                 }
             }
             /* Last buffer in frame.  */
-            qemu_send_packet(qemu_get_queue(s->nic), frame, len);
+            qemu_send_packet(qemu_get_queue(s->nic), frame, frame_size);
             ptr = frame;
             frame_size = 0;
             if (bd.option & ENET_BD_TX_INT) {
-- 
2.13.6

