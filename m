Received: by 10.28.71.27 with SMTP id u27csp3545934wma;
        Mon, 22 Jan 2018 19:08:12 -0800 (PST)
X-Google-Smtp-Source: AH8x227vM0cPQh4k4upvnhymo7meF1V4DdxLzdb6zov3Hi79H5k7rG2be4QBF+8ODAw9Je2ZRcPh
X-Received: by 10.37.124.134 with SMTP id x128mr1002527ybc.94.1516676892707;
        Mon, 22 Jan 2018 19:08:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516676892; cv=none;
        d=google.com; s=arc-20160816;
        b=iAKCZZ92G6mFF/8wAc5BVhyiRucJMvo6/13X+YtR4dbNzo9SJKy7rGAadNrV0+FM27
         ScJ/fgqQb0selEJdzKSZJjLZfU2kkJzmicC5nmfrq4F6zDHq4tPf1eRqC9uXwyPUGNcE
         3XGeZlUotzr8yO3sWBY/lkoSZ1CPSea2Yz/zYo9jLd+8eaAPeNhvpaZi9WrSsHb3WU66
         /gOvuC1CZBkncghVGp2RvaAYHDzVMzChKLf66iSYnFHOprcvlhYU9i3YGvXfCc3Ph9wg
         5JlXsVKyp2rUX5MJO912yeZlczRCrfyGX0hs0o4FS02XK1Z2whvVTsSApjG7Ji3ECjhT
         WGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Gu/Eqan30o1O2/UMJTVqvJRQlI3bHoyfYQiB4ofumhM=;
        b=ycWv4sqDoCVajBhvy3gflnqi4Mh+C5B9FA/9nvOgeQYkyofVqUWftaO9LsFGPxB5+F
         EUqOw0Bb8fl8ggNqHEgKzCNIU1/PAcxh/omIj0l70jf58uau2rKgplmVBm4XDsLf9ITb
         Kedy2RGZFwSdLvyCDKJ4z2gVtdZP390UrM5a7760blLd2cM8+cFUv3NKZVR2wR+nqWJx
         iBhnk07GH0MLcFYEUNGsxuNpIu7bILChtYWjS/CTYuOPOe/WGPobD6bzELApXn8ujsQq
         2rLTyMqiZC5ut2cdRIljP0Gcu0bgMoRleK4jeeKBVYoC5QrF+xi+u/A837ZFLH0UFPHK
         K65g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cCtixFBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d125si2205539ybd.414.2018.01.22.19.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 19:08:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cCtixFBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edowW-0001bd-4M
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 22:08:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovU-0000tu-DT
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 22:07:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovT-0004rd-Gg
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 22:07:08 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34610)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovN-0004nb-7k; Mon, 22 Jan 2018 22:07:01 -0500
Received: by mail-qt0-x244.google.com with SMTP id a27so13209922qtd.1;
	Mon, 22 Jan 2018 19:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gu/Eqan30o1O2/UMJTVqvJRQlI3bHoyfYQiB4ofumhM=;
	b=cCtixFBtO9R+CmTIqofuaIKgFDHKSeCesukWxe7t/CKXKgy4fJ5hesRgT6UdlXpAau
	xDwrAiFPFtNE2VdNI03ecfJan60pGrW2sx3wbWG7L3HVXXhRm4MBhESuCudvRCKlDyLb
	ZAiCC653OjvFtrRlwxzcT0Ao/lJu+1joyOgCxi36ajTSSZqcoHcLKKXI+N08Vi0bAbJa
	OpQDvRtulQD4dE91OQ8gmNArNaK5IKrZ0NiA1FzVpx61P9mk1Y0fg0fTC2IMW+1P9bUD
	JYB6cgJeE2+MQweLiRyLGKG/iGIMgYvjLTussBUX/BIk7mnc9a5GRt9Ay1/Z0Sa4bDkm
	eU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Gu/Eqan30o1O2/UMJTVqvJRQlI3bHoyfYQiB4ofumhM=;
	b=lnMePK2h8VmMPz5dz7Tlqtr7QZr4BrAo+8abkGQe1H+8QGhjIjfLZz72wqY7rFTj7p
	g8ZpDNIS/4vfd/8hMvOOFi5/YhRO0SqE9mVtBFqsXmMxuRFuOWABAu2cgUmmToIoc4Z4
	2IjynF4T+utT9QzSfCix6+Y/xlGbHo4JlUw80OXAi6W+9Su9iP9u+4KIMPM/UYL11WJU
	LS82e3IKiLi2SIVAQuIWkV6lf3poBbTGZLr7XqNXcWry5UpkMp1trZK/wZyxpbCp8D1f
	Gsw/zj+Y/L2rxvlc8lZpEwOv5dijywdjomdMr3xk105NuVObcXM2BNds89JFHPsd2rj2
	a0jw==
X-Gm-Message-State: AKwxytdqWHLIEpVG1v0N4kERk/JZceSnP+0r3FU6vMd6Oi7+r1D6su42
	fP/L4/n+qKieMPHPrISc4lE=
X-Received: by 10.200.37.216 with SMTP id f24mr1528181qtf.165.1516676820859;
	Mon, 22 Jan 2018 19:07:00 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	v20sm4174785qtg.79.2018.01.22.19.06.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 19:07:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jan 2018 00:06:23 -0300
Message-Id: <20180123030630.26613-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123030630.26613-1-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH v8 07/14] hw/arm/bcm2835_peripherals: implement
 SDHCI Spec. v3
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3cWJ84UxH9v3

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd11af..0570cc4ad3 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -254,14 +254,19 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
-    /* Extended Mass Media Controller */
-    object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
-                            &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
+    /* Extended Mass Media Controller
+     *
+     * Compatible with:
+     * - SD Host Controller Specification Version 3.0 Draft 1.0
+     * - SDIO Specification Version 3.0
+     * - MMC Specification Version 4.4
+     *
+     * For the exact details please refer to the Arasan documentation:
+     *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf   ¯\_(ツ)_/¯
+     */
+    object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &err);
+    object_property_set_uint(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
+                             &err);
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
-- 
2.15.1

