Received: by 10.28.71.27 with SMTP id u27csp238179wma;
        Tue, 6 Feb 2018 20:25:26 -0800 (PST)
X-Google-Smtp-Source: AH8x226GSvkFmCuiz2fTKet0v11cUFagsio9FN4qLI3Jy6bMMXT/YQsu2lKm0BZz54WjEctc9F8r
X-Received: by 10.129.39.84 with SMTP id n81mr3030324ywn.5.1517977525907;
        Tue, 06 Feb 2018 20:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977525; cv=none;
        d=google.com; s=arc-20160816;
        b=W5znbvvejPbrmxtFiJmAmKjmUUd/oouKo2ENhEZsjXwEN1+Y0PosslXdsxCkK6ENnD
         houpn+vWAxNO5Yl06kW6KyFOSJzriT2pRBxNTUBYFDOZYYTO1VIk5Rd1fByNUpttSR6O
         AoXdYMC09gcPUNqpgAPRmtv7TinffW7qaHwiXV7MKZvlHQEeC62F14ActUvakJMGZ/q8
         v7Xepk7A8lxurb8Z1xXdJvLAyXaSdcSd1MjFish7TlW7w+CQdlfRm5f964AJTQll+UQn
         jvc+pw4pLjRvA1o6LZXD3AhW8ENP2ExfklQXYBdM+37jabCl5MvnZRoUlPJmCWHTJQTx
         aRJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=w+g8lqOhfCr0uzQGhShGS5quUZxBFT8U/+ixfyNUgHI=;
        b=R1dj5yprmInbaccw3pVemxCn20zf4S/JRlMng3+lqcy1Yk+QOb5QxBKgVmLLcde1X5
         JnqEIEFq3ldqCEYGNWX+bEyFWdpRfalDorOywrs6l7y6lCHLC9maRh4HMnmbqJ14eKrV
         3S88+gvbG7xCiT1Z1WbbqT1tCu59MrDIVtdyotwppUU2ftUUZNXTj6pG6RZ4JYUF/gdI
         GYg+2cbupddXrbmGwZ7f/6joJPm54C54pT2E/Kez7oQUeiLKKLvspdT0eo8L9MJOWG72
         zPOKxsqNQGawQgswcBd7DSAW3vHoLvqE8m72GMtJY1dc/rimfYezaFSUQAXt/BE2S//k
         KF5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RHRDYQQl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 84si111854ybq.476.2018.02.06.20.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:25:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RHRDYQQl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHIT-00007K-6G
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:25:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIC-00004z-Sy
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIB-00034d-LA
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:08 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:43073)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIB-00034V-Ew; Tue, 06 Feb 2018 23:25:07 -0500
Received: by mail-pl0-x243.google.com with SMTP id f4so2727231plr.10;
	Tue, 06 Feb 2018 20:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=w+g8lqOhfCr0uzQGhShGS5quUZxBFT8U/+ixfyNUgHI=;
	b=RHRDYQQlcn0Gnod3sEa2ZdKVvAzmmqd7Nfsdq74QKfMADdihqHM/wd4XvZcTB/FsUN
	Bg4mzYyr8MynBL4egAojFSBT7o3QnvcJ/oiVmsNOZHwVyPO1G5O3syUkSM2D7wnWpyt6
	qGPX/cveJAd3AGhQ17X2+CMt0iEV/Jy8l6nlfDC33+MuQTNHvCyL3r3de5FCtsr/hA4o
	cheSoB2ZqPj50EhHVmnDYoWOQKqaBxIhJz8v11OCQifQkK0uRTCzoBpdOl//OLVeHWBN
	pXwGA6Ste49cjbkSlKLPpWlVpYTsQJYzz98IF+x+DRTrysG8wvxC5/dyD7CaNwqaAIKS
	9ZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w+g8lqOhfCr0uzQGhShGS5quUZxBFT8U/+ixfyNUgHI=;
	b=E+5uQG4cKe16gwfNE9egR8u2+nVGL1ch1QqEjp0MS3/ZcM9fl2YdFK2dvM+8hE9dYA
	3aNazHSf4ozT68O+NwIRjrP+4k2BOODOugpxrMy4VWwTrd2mnBrkBGrTipPtOHKFlxnM
	+HtEXnUc3dP7l6GLtBbmnadaVbXrgDLQUnWLEhcJy5bKEF+m8TO/D11inH97hNrBTXn0
	0jEpzNvL8d1qVyWlkRkY2D/5tvyj8oCE5+76Qn3ww6CVlF4zMNICFfcnmV7rHwuUuu0A
	2nWzCYQ6isByOqKHXNYTpNVJCMNOmA2U3FRMKNkqWjfNgxaFvOr4wa+ljCWLH08PquQj
	SgHQ==
X-Gm-Message-State: APf1xPCoFM1VoRelhWgEo0g2xm8PjP3PF4nnvrvze0wYjnZGru5nZ5Kz
	Ir51AqQau5/0y4QlKCT3BjFr1lCG
X-Received: by 2002:a17:902:7586:: with SMTP id
	j6-v6mr4626658pll.23.1517977506249; 
	Tue, 06 Feb 2018 20:25:06 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:05 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:26 -0800
Message-Id: <20180207042438.15422-3-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v5 02/14] hw: i.MX: Convert i.MX6 to use
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IRJpaBs4oU2q

Convert i.MX6 to use TYPE_IMX_USDHC since that's what real HW comes
with.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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

