Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3138181lfm;
        Sun, 12 Apr 2020 15:39:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypKudFKuFtgWjirgA9T2n8tUt1IrU4yt+yMhIAonVg5hHI+i5ZTjk/TMp4p5iIZBNMTFnufy
X-Received: by 2002:a0c:f00f:: with SMTP id z15mr6262087qvk.113.1586731171506;
        Sun, 12 Apr 2020 15:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586731171; cv=none;
        d=google.com; s=arc-20160816;
        b=Psok4F6Q5/Xw2fY1OC2Qgs/YaFz8+cPW6TpXxt/0b4lWtzTwkwbPmiYXkha5a6Z77h
         I/DNltQAM4NzPyLznVqNKRDqN0vSlTkomPArW+RIm/tcOIeK9UfS/4FzfElBci5p7iNS
         ld9PqW9uKw83i7mhgVtpdXaR5SWkCGDMRekam8WoCnzelAzudQYcZSDaG0v3zgb/QpYR
         O9IOOhrujcuTzRYLVHS+y1IiHRq3a2uWaIcjl+6BMK1XBdaU2isBMDfiam+fY/InUgTJ
         q4HEWpRw5hnIvh0+wJ2BL118aBReG4u7cDOHNqpM0hblckf7MDsNAZmYJwU5oRmek4UG
         jJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ka9JmXySXeITJiplOCZ70eou6aa9wIREycqvE6xVzj8=;
        b=voF0LDZT7B6NzU+lbcTj+3kwIjp/6D9dGnx1TwGUDzJOhxaYCV/zLA0j84kNJcoGX/
         TjyoWJK2gqAazmmMSL07Iem9LDtqrryClZDdwAKcs7wqNHyz+hGn0Z16SOquY4K00KSn
         5mpkn2M59qtk+MmogUoFhouHXDj73o8cSiuTPtwWdpqeIeP+hMVCI2w9gbtvYEtlBk2O
         /ZDcyrR5UjtRRKsEiiBjxPJCRfGomSDAlorA6THpgVMoCZu1mSYekAoBo/75YqnIoROP
         BetxHmTKhVtjm8ca4VzytSDBSE43Z53VwMI63KzBRyFwL0ANb9u2jCnBOjMEKSDgRFBD
         3peA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JMmBxFo9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si703287qkc.256.2020.04.12.15.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:39:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JMmBxFo9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlGE-00035u-VE
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDi-0005oe-7l
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:36:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDh-0002WM-9L
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:36:54 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDa-0002Iz-Jx; Sun, 12 Apr 2020 18:36:46 -0400
Received: by mail-wm1-x344.google.com with SMTP id e26so7921171wmk.5;
 Sun, 12 Apr 2020 15:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ka9JmXySXeITJiplOCZ70eou6aa9wIREycqvE6xVzj8=;
 b=JMmBxFo9W6guTx5y4YNMxVa9hls4ECr2UCBhgY57EoSt12UEVLCUR6IhrLpzCvw7ua
 NszSCCW40ZDuWSywzpQhnrrbJt8Thby5lQ4kMxuEXxEOVFrlZKVmjL8AN+effCJTHFp3
 ETSt2tbUFllDgoUNUzTVpzBh90H1CVvNMG9Hzu8r/Q4UrPdU72hb4UpUUNn66xaqJIJl
 LP4BB+px1BenInjryZ65FHZIVZ/z3cfiD6NowjgTU26Do6trRpGEXwh8tAUiMaaLdaAQ
 LHP76abRP2DfG5/VtAMeJj9hdY7xwJs1y7uLeLPqOlG6J2foJy6/MPiLal6O6KKZGMPm
 bZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ka9JmXySXeITJiplOCZ70eou6aa9wIREycqvE6xVzj8=;
 b=cT73/eVznmEGv/xSs2nltyYqyySFqEymr+xPE8UOH8aE7QIXkohbUSqULTIq2YrkY7
 x9QDoEUozuGzcZ7BhA133Gx8BfKxeftSs5RDpielsZjPE3Zr3y3X/7//KVcBBugkIYZB
 grFfcros9q509KhQqI45s/B0jGtOD0YBQ1q0g//XdN2ODiEIAs2Uf4z+Lw1JAPuAf/XH
 ApT1HSM3K0peaTRozUQXiK+wIj2kqC4E5doir2lY0CT5bUsoSZdmnq2klF9jKko6vpvT
 jWGJMfhm4BmtDU2ZZbGQVJtdzpXloz6A+OTJwCK1Ivqpdlo9MhtN5OOBHZo3BRtj233g
 2U9w==
X-Gm-Message-State: AGi0PuaxlGAPass/L3RNI0bJB0+QHffnZKJc3cwBI4/69Sh7tj48ofK+
 WOvqMEDNNdT6iyc9N0SSiTWDgYVkJ6NbAA==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr15569288wme.75.1586731005469; 
 Sun, 12 Apr 2020 15:36:45 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:36:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 06/24] hw/arm/aspeed_soc: Move some code from
 realize() to init()
Date: Mon, 13 Apr 2020 00:36:01 +0200
Message-Id: <20200412223619.11284-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
X-TUID: uFokacTh+aRh

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/aspeed_soc.c
  >>> possible moves from aspeed_soc_init() to aspeed_soc_realize() in ./hw/arm/aspeed_soc.c:231

Move the calls using &error_fatal which don't depend on input
updated before realize() to init().

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Typo 'depend of' -> 'depend on' (eblake)
---
 hw/arm/aspeed_soc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 696c7fda14..debd7c8faa 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -183,6 +183,7 @@ static void aspeed_soc_init(Object *obj)
         snprintf(typename, sizeof(typename), "aspeed.spi%d-%s", i + 1, socname);
         sysbus_init_child_obj(obj, "spi[*]", OBJECT(&s->spi[i]),
                               sizeof(s->spi[i]), typename);
+        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &error_abort);
     }
 
     for (i = 0; i < sc->ehcis_num; i++) {
@@ -360,10 +361,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 
     /* SPI */
     for (i = 0; i < sc->spis_num; i++) {
-        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
-        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
-                                 &local_err);
-        error_propagate(&err, local_err);
+        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
-- 
2.21.1

