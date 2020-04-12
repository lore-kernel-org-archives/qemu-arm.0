Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3138248lfm;
        Sun, 12 Apr 2020 15:39:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypIxUEYd7CdKHD8PQwcZ7Ic0PMf4iHSfHyLh/kj+Mmm1javPg2pKaYYk/N09GimWsiqjDr3i
X-Received: by 2002:ac8:3723:: with SMTP id o32mr9161443qtb.176.1586731177393;
        Sun, 12 Apr 2020 15:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586731177; cv=none;
        d=google.com; s=arc-20160816;
        b=jbmnPdrcforhy4I2IDxZ+cgRUnuyLvFOIXe69KbMAnUsy492rXj9Yy1r6DyKIj5WJZ
         0ddyC9q6Rp1U8eLdteyk7bONocf5BhT8V1SZe7/I4lGozQuqrQdEi2sAUddg+n/O9o3m
         A8z65BTi66n5Il0KB/VWQRxNVofZeboCHQLxe7AgjoUAjnaSJqpKe8tZmYwmd81osSUK
         f6yGZ9rFY15Hra0viyhMwFS71hdJEAfUauo0ghkZfXH2SFrbi+oVQZTOrtRceVVtNxVE
         0tRH1OMLsQuVMQ+/MOXFD1Ue4eLJDn6sXMk/WrGU2udNLuCL1h91OemDt9UnyhwoqQhH
         QIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GiwJ4gTZC8RX41lgDmd3v75v+8FpbTkDx97eHKIDhQk=;
        b=0fHMnPElEojzF3cm9vnp/0q2Qkzq/+a4AiuihtJSVbcqPOVgA+/1bVYMjs7PxN4jMw
         JKukB8jRYlqDrEb4FxBxuaWxYb0j9mZ89TZgIyRXB0xhV+CUTa8mIpTPwHg6+7JxCB4p
         j7xN309r/+ufhkRIzTt7tD9EMZWwBDYwTUyvmiZM5hn7CXVPylLvJwDH4zmFHZWMcYBi
         g6F+OtYrdUkCITHhUU6QiH56ZJG7zCz0/z4QL4iLqLn+zMoI82KHX9UPY8ISGwy/Q0li
         gETkUIEiKdOuKnjpryWJBawE/udsTF5t5kSj9OSsHWYkC/d95F+DWHxsFGzBC0USkWfe
         Jk3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mq797QED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v24si5039870qtp.44.2020.04.12.15.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Mq797QED;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlGK-0003Hr-PE
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDm-00061v-Jc
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:36:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDl-0002cp-I3
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:36:58 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36399)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDf-0002SW-57; Sun, 12 Apr 2020 18:36:51 -0400
Received: by mail-wm1-x341.google.com with SMTP id a201so8010380wme.1;
 Sun, 12 Apr 2020 15:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GiwJ4gTZC8RX41lgDmd3v75v+8FpbTkDx97eHKIDhQk=;
 b=Mq797QEDhRzAek9t4CjQkFwSgRFmMI4IZkDmNnSk2RGLFR7FblrPehzgX4xfKOdL9U
 /oohG/hJdPCpZbJc4gyMfvGoYu03fyun2A34w7ddDHMrji3JdYAO5h1l4SOsZh6romXL
 /D78Op7QyfJcr/rRUsGK5Ns96bm1Ks6dnB+qMCd+I+lc3PQH0sbPofP+SQ5ke2B1xR6l
 wVNyB+8U+7OCRqRwjpGXSse2INskpTqbPVB6eVp7KliYaT1yRvQl99ft5IqsDwe6gIIp
 ZLHLdGfb5Ph69ogAChQVeJ8El1KJTk8R6pJalWlCTddiESdrrne7lEmxefjrHOz8LnFz
 pprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GiwJ4gTZC8RX41lgDmd3v75v+8FpbTkDx97eHKIDhQk=;
 b=rDL7yLOUAgzNF6XzG0v1rL1koniUapbuqCVntlC/lZWYhfk3Egi+55XI9z9s0UYeg8
 4Ez2tcd3Xb8xBermtj2y5o3h3LGzQve8nbx5SpQu6NCwz8YDfvDN1489gjI8cPUh8a5G
 Lt+e6bK62TThgJ0SWkRJrl0P1blpgl0OF4lGBOC7sc6uyM5JbZPJq43GNJmUN+izkeHa
 vz0VkX5HtoZl/58E/CFX5vF7B3kI1w+66fYAkc02EuBNxJcsXhw+wd+6DlGxjdXUaQbr
 Qi9Ms3zxMmSyeLWjoGr9tTLMWslNwsyta4x859GugJ7zH94frMFcxScdR4R4FGrEnVD+
 JDPg==
X-Gm-Message-State: AGi0PuYFqwejdl1Eu0OrUNCRxWWCJq8ir39qdxo4LgLB0dZjJSCl6faU
 PsMppm9H4Xu4iCQq5jVJKg6wzJjur6seIQ==
X-Received: by 2002:a1c:3b09:: with SMTP id i9mr15471185wma.19.1586731008786; 
 Sun, 12 Apr 2020 15:36:48 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:36:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 07/24] hw/arm/aspeed_soc: Simplify use of Error*
Date: Mon, 13 Apr 2020 00:36:02 +0200
Message-Id: <20200412223619.11284-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UtPhRbIpgJTG

In the previous commit we noticed we don't need two different
Error*, drop the one less used.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Indent 'return'
---
 hw/arm/aspeed_soc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index debd7c8faa..4ee991ec16 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -234,7 +234,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     int i;
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    Error *err = NULL, *local_err = NULL;
+    Error *err = NULL;
 
     /* IO space */
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_IOMEM],
@@ -413,12 +413,15 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
                                  &err);
-        object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realized",
-                                 &local_err);
-        error_propagate(&err, local_err);
         if (err) {
             error_propagate(errp, err);
-           return;
+            return;
+        }
+        object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realized",
+                                 &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                         sc->memmap[ASPEED_ETH1 + i]);
-- 
2.21.1

