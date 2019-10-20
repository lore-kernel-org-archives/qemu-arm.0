Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3789497wrm;
        Sun, 20 Oct 2019 16:02:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4gJtped7ajmjrX9GVr7CVeqlAfDJCPFPdDIFXKpmcj36Kfwxq3MtEAUdaz95YyLO6RG18
X-Received: by 2002:ac8:2191:: with SMTP id 17mr22391017qty.112.1571612549698;
        Sun, 20 Oct 2019 16:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571612549; cv=none;
        d=google.com; s=arc-20160816;
        b=aMGM3FKa8Bi9aqauosN/CeezMK+CRKDH3V2AnRNDC8CAwDKxS0gMMGavQlzyra2zJG
         Lkeyri/xG6Sz2DLZBwl1/8GkVaSeaU8+Ni8GWyZlsKKICjI00tpexH5Txviv+wjjLGso
         A9SEXUNcj/X1Gt4lSmhmUojhXdo0u6EKgk5sunftZXGUXFnGKClkiltkHCiaxJM9pwoo
         +yFuNcEXUkmFkbY6TX5C4ywAt6y/78BmCMSaTsuIOnGey8zO+z6LvjVOG4+lOmKSooOf
         263IIPELA4lYsuVJA6i3SomeM6Nv0F0rr6wcAUxKILkn9tW4kAb1D0qD900Cb1GIisNA
         1Fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V/98bWzvlzdStlbmzrzSO31ZGETUcQ5bD8hgywTwVrQ=;
        b=k5L18FyCElrbyceapBbwLoywRbhXaJ14rgrQ0IkG6/k7k7ZnYoW8fHt+1X2jPfBPns
         p0YCRE8bgt5pFhwV0ZE8puTEVU/Z/4xOi8+3rIwcpZJYbJETkY84l9DjVdOpOXLvj/jw
         v/e16cCaLp8oGOEHkgBS4dZWV6sKva33lmZf72kIQ2JmT/6rl2+CrVFwsispejV29iCu
         AR4sLXxVH53VnF95v7yfiBayujvwPrV3MnM4RWwVu3PxmSI9j1YtrkaPxG90LeKcMQ8X
         fqaAISDYhIZXYsh1G/XSrjHLgWwpn70PFsbRPHfuCzHQ1iN0EMwu8N7lCWK1ylRaPspM
         4G1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cveS1EZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d132si7999314qkg.294.2019.10.20.16.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cveS1EZw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKDU-0002i5-8z
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 19:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKC3-0001z7-HK
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKC2-0001og-Fg
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:00:59 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36681)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKC2-0001oH-C8
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/98bWzvlzdStlbmzrzSO31ZGETUcQ5bD8hgywTwVrQ=;
 b=cveS1EZw56ZlC1e8zji2BwBfT3d07IO/0v0UiUvImQAVGNhE0KUgSGDrAjpIGWCm83eaf4
 8O/KuWt6VBdArXNrfhaxMq06EKjEWnGI9TqOo9ge83CEtdOI/tsIlUjz3YGXh4yiWkV0cD
 Nz1cIxL26Q6yi+zmS0BRAtQRttev7tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-_r-ooev0M6WV5IRF89L3Kg-1; Sun, 20 Oct 2019 19:00:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 960341800D9B;
 Sun, 20 Oct 2019 23:00:50 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7ABF60C18;
 Sun, 20 Oct 2019 23:00:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 11/21] hw/alpha: Let the machine be the owner of the system
 memory
Date: Mon, 21 Oct 2019 00:56:40 +0200
Message-Id: <20191020225650.3671-12-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: _r-ooev0M6WV5IRF89L3Kg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0mnkKC49Klxt

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/alpha/dp264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index ddc249261c..5696b1e79b 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -78,7 +78,7 @@ static void clipper_init(MachineState *machine)
      * Main memory region, 0x00.0000.0000.  Real hardware supports 32GB,
      * but the address space hole reserved at this point is 8TB.
      */
-    memory_region_allocate_system_memory(&ram_region, NULL, "ram",
+    memory_region_allocate_system_memory(&ram_region, machine, "ram",
                                          ram_size);
     memory_region_add_subregion(get_system_memory(), 0, &ram_region);
=20
--=20
2.21.0

