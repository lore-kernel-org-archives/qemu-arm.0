Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1076250qvm;
        Tue, 14 Apr 2020 09:48:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypIyoSf9kVt3nfeeSClLVZ2DBHgCbqBGeesQnNtI5woCBhu45L/sUPpPCWqjnuImvK+w61uy
X-Received: by 2002:ae9:e509:: with SMTP id w9mr15005493qkf.252.1586882932641;
        Tue, 14 Apr 2020 09:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586882932; cv=none;
        d=google.com; s=arc-20160816;
        b=0JIEbzYIlidiI0rpEDzCk6Nch93rhWeeuFo+7+EOQJGfAXQiiJUMBAaXKTruHdPJ9+
         4jUFAwc9zbqzQ+BtK3egPSBbHhK4WCnTa+DpPg9Zm0NnqMR5O8sxsfBqSzJ+7XZtMcEA
         MHtT+ZKDcpmHNLmxksbC1TIv7QB36dS+kv7WKhQYWsSkQs120h5wBhrVTUIpsaip6TRz
         d9kpYLdNgrK96TD7T4R/LHjFQXU3arJWtTwiq2McB00paNz3gS72UXrbX5UeQq4UZ+Gq
         7rF3CQLYReKcLhVtEdMBPpAdESfe01q2Y6SLjI16sgWRkkFi19SOWsKn6eUwhUa8uz9H
         RFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=P044dvCGY+OjnhTCca21kcGYqk6pkGT1ZkSmX3AzxY4=;
        b=lo5P20s6KPkLefxsf5ftYtgyf2MhMMmrKByaQM3+3FSUMNST+RqnVD8kp1xdJOwC20
         cXYZVMcpkLP36DLR2SpuZ6hwAyc1+zxGCl2dTd1eY217Keo78JATfI2c/8u5m2u2tT+o
         xKqOC74t1QXuOFQUIWbsYq2U9wDiKpm5cD1RkTDv0k2SyN3KKRpRvFPVsvipUGY1V7rQ
         3r4LyfcrKQ1CGMoZssUotWSa3EWd9pPN3+CN6/KimExw5xzjrlsSbt4zA2z3iBXFbsOF
         9FXdNY4F+yqUn3Y/08us5lxuSsZ7+M8DNh3FB2a6KokavwBdg1zkAtbKeKMw5yoM/RXJ
         N36w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OlBgHsdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si7906216qkn.149.2020.04.14.09.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:48:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OlBgHsdw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOk0-0003eB-4T
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60585)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOiU-0001SG-JM
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOiT-0000oT-DY
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:47:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32751
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLez-0008I8-8X
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 09:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P044dvCGY+OjnhTCca21kcGYqk6pkGT1ZkSmX3AzxY4=;
 b=OlBgHsdw1akwjcLTR2pJx7+X/wxCHp/25lludZ4nyzvc0aOSdd0UEKW1TWgm9Xmr5lWa5s
 HsSj9HR0f9OGem7MCjf3XSz+pM5tZZsnpGGsnrBklhPPXoEn1h+qiYihZ6MGZkuErMyIA5
 z6kx4hiKHABrwhjq4qE9lwfXUzYcqAA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-mY4tTmHSPh62gF-9tGFvxw-1; Tue, 14 Apr 2020 09:31:27 -0400
X-MC-Unique: mY4tTmHSPh62gF-9tGFvxw-1
Received: by mail-wr1-f72.google.com with SMTP id h95so8651139wrh.11
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 06:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xOsd+sUVGYzNkkVeZbzr6M338X1UIcZTXkjxKBvcId0=;
 b=qQQzZ0KWyP/oMhV1Tv49AM/Mwyygm+/WdY6O8dbjMelF02rMcgCmF0qQBY81ze5oZ6
 Pg4Hv9U2ZVKADzpAVRwTPE5RFMLIoiOb5TMQO2BWfY3SAZVURNL3a+jM325rkgpYnSMx
 b5yK5FYRyzr8dvOJDzG+mAB3Z9agXaxcdRzr0h8yBMQa4hNTaLqkNwyp2enipxpi/yBY
 Q8A53maBsWeuiRdNMe+QgwyHwWa9DwcF2h10roF+EQOclsKaxV6E5tyj1jPMffKgpzi9
 dAp8YQFxwVOr5d411lzJwPmhZ0nCXGZJQKaDoViXrNZsL/Nt19WDYgy90OpA25X2esYz
 g4nQ==
X-Gm-Message-State: AGi0PuZXaq7Fpvsd8OD7zvDfxfJNVpsCptHtzHcj0RGN9abyZMVPAbNb
 CX1VADsgz6gbtcqguvWqn9coLzIpxA664f+vesw7NQg0qLuLsVPMTMaSVHryaYy0c7SVNAzGUcZ
 XxTIYCu81d6dw
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr25248739wme.82.1586871086025; 
 Tue, 14 Apr 2020 06:31:26 -0700 (PDT)
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr25248707wme.82.1586871085864; 
 Tue, 14 Apr 2020 06:31:25 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id 145sm19761961wma.1.2020.04.14.06.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 06/12] hw/openrisc/pic_cpu: Use qdev gpio rather than
 qemu_allocate_irqs()
Date: Tue, 14 Apr 2020 15:30:46 +0200
Message-Id: <20200414133052.13712-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /aIxg8XJzt0I

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Coverity points out (CID 1421934) that we are leaking the
memory returned by qemu_allocate_irqs(). We can avoid this
leak by switching to using qdev_init_gpio_in(); the base
class finalize will free the irqs that this allocates under
the hood.

Patch created mechanically using spatch with this script
inspired from commit d6ef883d9d7:

  @@
  typedef qemu_irq;
  identifier irqs, handler;
  expression opaque, count, i;
  @@
  -   qemu_irq *irqs;
      ...
  -   irqs =3D qemu_allocate_irqs(handler, opaque, count);
  +   qdev_init_gpio_in(DEVICE(opaque), handler, count);
      <+...
  -   irqs[i]
  +   qdev_get_gpio_in(DEVICE(opaque), i)
      ...+>
  ?-  g_free(irqs);

Reported-by: Coverity (CID 1421934 Resource leak)
Inspired-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20200412212943.4117-4-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/openrisc/pic_cpu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/openrisc/pic_cpu.c b/hw/openrisc/pic_cpu.c
index 36f9350830..4b0c92f842 100644
--- a/hw/openrisc/pic_cpu.c
+++ b/hw/openrisc/pic_cpu.c
@@ -52,10 +52,9 @@ static void openrisc_pic_cpu_handler(void *opaque, int i=
rq, int level)
 void cpu_openrisc_pic_init(OpenRISCCPU *cpu)
 {
     int i;
-    qemu_irq *qi;
-    qi =3D qemu_allocate_irqs(openrisc_pic_cpu_handler, cpu, NR_IRQS);
+    qdev_init_gpio_in(DEVICE(cpu), openrisc_pic_cpu_handler, NR_IRQS);
=20
     for (i =3D 0; i < NR_IRQS; i++) {
-        cpu->env.irq[i] =3D qi[i];
+        cpu->env.irq[i] =3D qdev_get_gpio_in(DEVICE(cpu), i);
     }
 }
--=20
2.21.1

