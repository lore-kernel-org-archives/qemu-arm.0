Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2051632lfe;
        Sat, 21 Mar 2020 04:50:43 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vstE5k2b5E/4DOq0r0QqJa9xLLOA6rr6NmbDl5KU51Yt9AL/0ydaY5ugdCpBgDaEiE4ZmjF
X-Received: by 2002:a05:620a:22b:: with SMTP id u11mr12503803qkm.225.1584791443634;
        Sat, 21 Mar 2020 04:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584791443; cv=none;
        d=google.com; s=arc-20160816;
        b=A/8aUtvwYIdRNUAkciyxgiXyQbKts0Z9Zbc81Gxhm2lGNeKwStgX7wK67x+Rb3zK6e
         yc/6sZ+lltaSJ1V5PkS6nEonyRwvGwFlEvqdIJlcSHNmjDf83K853GxwGPdRfkkiyg+l
         +bHwceOZ05zsW5Oc43pN2JZ4c2PJJ7GVF4Vg//Ow24dnkcae4XeIoW8dkE1RmMri7I4g
         l0hWzCMloZgQxyKFsSYEA4eqgOs7b5b5YuwWen7Wh6pVn4OHetVEuUv1K8fUoCWW89ZO
         Rf+l/s8451G4d8KIosQ/TOfxAFLFc3RbUERQyV5QMZ/LH0mRdtB4ilkjPp4eeGakztor
         uNJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aNR2u2S6oJHTNfAafS+3cPQs0kK7tiu5/JdDcxGLqd4=;
        b=Rs0ur9WS3j/5CVFtlR5PvMdch97CYhqVZmVbkpeepDb23M+iG7CGAO/Z7HDhhpsbQJ
         jbqpNEjIyG3rOslXg6VGxB2dQG4gvMuU4arnj6mW3m4wy3fEz0jHONeHykbZjP/cHG+z
         ET7ZLK+RVyOnp0InFitpS7zstwnecDGUmMamCZjb+nco+WIELK15eEzP2L4EULCXwlz3
         nRoMeXLKrqX28zZ4I1mkSdnf5L6nrztfJdQNhHaEl2GfWQIkfD09w/Owx75Nt9nmtWGw
         iiwNPCXY/sBqkjEG/qh46Buh59ktLzHgC31rLGtfRev/z5Q63xiJMR9FKdEHZxT+Us1e
         hcdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Tq/L3856";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si4946711qvx.12.2020.03.21.04.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 04:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Tq/L3856";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFceJ-0008K8-1d
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 07:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFcav-0001oi-FR
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:47:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFcau-0006mI-Cu
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:47:13 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:32827)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFcau-0006lv-8k
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 07:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584791231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNR2u2S6oJHTNfAafS+3cPQs0kK7tiu5/JdDcxGLqd4=;
 b=Tq/L3856aXpuuOxtrB+E6F7Q221K6zc0EbsoHat46j6Ucl+Gd/3yZkf/gNx8OxjctnD4xz
 /Y1k5nHNztKxizYd5uFYMYsC6gWIUoAnM2a3YGInzN/+IvWIhTlQpLVqu2L7PZZzWRZlN9
 1aWfvnjYXZasJbsQE1OXBP0PBKK8pAk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-zayRbczbPfm3hldlPf6teQ-1; Sat, 21 Mar 2020 07:47:10 -0400
X-MC-Unique: zayRbczbPfm3hldlPf6teQ-1
Received: by mail-wr1-f72.google.com with SMTP id t4so4194608wrr.1
 for <qemu-devel@nongnu.org>; Sat, 21 Mar 2020 04:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10vzrd1KB4hBe4ZZMwH09166mQI1VXUjkd4JvuSfJzs=;
 b=uGLxLXLXQs9BxQ2G++p2u87OKLQCqldLa7lB6dIlIN1MGb0xTc5UwKHoZVsbufvhqx
 SL++kbGjjPB16AjhtGnSiqz+ujebXI7odfBJU6HtauRYwQJZBKED1JNqvtVaJmsoYZIb
 pwN+TUFKiMJCwzCG+kLJuaP0ohNzWJjWE32O1OULbx71yco3gI8xVB53rsHiyDV7tgHh
 ExGGmiGT08oWBE72XdQ9FCzGa4X9zPozJ45UmN+KKEI8d1kmu+lPxlubAUpxmKtXkf0Y
 rJRNT/pDlB0vM775xURiNyTvkpSq7sssd1DfB6PHLeZ09C1y3SwveVMFe7WtjkLo7gYf
 t6Qg==
X-Gm-Message-State: ANhLgQ0fwLCCQmJ4dwXRvk3uxXMxjRP8OqzDspqa3sHX/T/kSctPom+7
 lxvl7KNbL8ACBy9GG0wePowg6QL5IY+cG64zXJ/Vt8yFDoWQv2RMxeps89ieVtugYoHvszRLHv0
 FyfUBegCMIxPRbXY=
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr16571800wme.185.1584791229021; 
 Sat, 21 Mar 2020 04:47:09 -0700 (PDT)
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr16571770wme.185.1584791228755; 
 Sat, 21 Mar 2020 04:47:08 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id v7sm12822140wml.18.2020.03.21.04.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 04:47:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 06/11] hw/isa/i82378: Remove dead assignment
Date: Sat, 21 Mar 2020 12:46:10 +0100
Message-Id: <20200321114615.5360-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321114615.5360-1-philmd@redhat.com>
References: <20200321114615.5360-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FgMszI0fe4pV

Rename the unique variable assigned as 'pit' which better
represents what it holds, to fix a warning reported by the
Clang static code analyzer:

    CC      hw/isa/i82378.o
  hw/isa/i82378.c:108:5: warning: Value stored to 'isa' is never read
      isa =3D isa_create_simple(isabus, "i82374");
      ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/isa/i82378.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index dcb6b479ea..d9e6c7fa00 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -67,7 +67,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
     I82378State *s =3D I82378(dev);
     uint8_t *pci_conf;
     ISABus *isabus;
-    ISADevice *isa;
+    ISADevice *pit;
=20
     pci_conf =3D pci->config;
     pci_set_word(pci_conf + PCI_COMMAND,
@@ -99,13 +99,13 @@ static void i82378_realize(PCIDevice *pci, Error **errp=
)
     isa_bus_irqs(isabus, s->i8259);
=20
     /* 1 82C54 (pit) */
-    isa =3D i8254_pit_init(isabus, 0x40, 0, NULL);
+    pit =3D i8254_pit_init(isabus, 0x40, 0, NULL);
=20
     /* speaker */
-    pcspk_init(isabus, isa);
+    pcspk_init(isabus, pit);
=20
     /* 2 82C37 (dma) */
-    isa =3D isa_create_simple(isabus, "i82374");
+    isa_create_simple(isabus, "i82374");
 }
=20
 static void i82378_init(Object *obj)
--=20
2.21.1

