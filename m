Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2213365lfe;
        Sat, 21 Mar 2020 07:47:07 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtCTsed6jfYDd8y2uLfy1cKwlCHUHyWGAgkqiOV8WDsZvSUA/3Nr95GtZP5hqy4fCeC/Hyx
X-Received: by 2002:aed:3eec:: with SMTP id o41mr13928720qtf.343.1584802026960;
        Sat, 21 Mar 2020 07:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584802026; cv=none;
        d=google.com; s=arc-20160816;
        b=GNxPv/Wuh7eCVyEdRlN1dNmDtdqoiBRgKvN8FaZpk+ey9jXnFEmlpdwVYKGSJbGg4y
         JYW34GdD2ropqWmjDEGdfJuTPUqJNAgQljlgXOAkVXQxo/eG/U/Ng5CqIM+x7RZP4bUV
         eKHIb1t7tJc9g5AJBZsTfSE2hOsxZcVUHc9vAYKixPtoOv4gKpp5WsBT92RlVGO+2HpS
         FIW9JFvTBD0GnOgxcl41fqhcMIwuIXLoswNTuF9cPNMEEpnEWF7V59w5JnQaR3/2K4fb
         vCSlN3cw3WwdoxR5a76mpXSdXy5muzt7oljT7omoQvIe5+DskB5laWRWYgBFXJgfMR4e
         AYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aNR2u2S6oJHTNfAafS+3cPQs0kK7tiu5/JdDcxGLqd4=;
        b=hThR96ZvfsWu1NdqI5l5UBcJKrx+bfIyhubd7Xum9Fbo6Y4fcQ2loHFiWrm4cVtR4w
         ewyVxU2rxNipg/PaNX+2tK761Ak3htfYND6vm6qEcvYu7A9mBHUelutgCued6mgO+Av1
         2PgHf4IdeAKXrQVm1vs34yNkE7AGL2cC/RqqH8zE7+ySLJm9g+bm20iPVsRPZs1czaZY
         Cjn8c3w1aXh99CbB+d3Iq0wNTWPQqo2TLwgBk9uV2KwXqMWVU8fpdlivErArgID2uw54
         riJm5oBBUezX2KmDbxZ4Vmns3dTOeBR7k+1cBCdwInALhDYn1i/rjJ/hA4DWfxYCaegE
         r5yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TzWAPSv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si5465233qvs.3.2020.03.21.07.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TzWAPSv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFfP0-0004dH-AN
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFfK3-0005dd-M6
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:42:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFfK2-0007bI-HQ
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:59 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:52696)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFfK1-0007aP-00
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584801716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNR2u2S6oJHTNfAafS+3cPQs0kK7tiu5/JdDcxGLqd4=;
 b=TzWAPSv1RqrCxdmaoqRdaLLx+srUgl+ZMupmaktN6MwUHXfLrO48zlnboPf6/eqUnYGd8k
 einfYid5nh5RFK1kUC2E0PgxSz2NWMbEFU+KcYGgZqyHVudAJqKLpmIz40IbJGxJj9JJJE
 eNZP6oMFweLfqiwSUSD3sdfs0y9oWAY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-RyCPnVwdMymjoHg0clb_Rw-1; Sat, 21 Mar 2020 10:41:53 -0400
X-MC-Unique: RyCPnVwdMymjoHg0clb_Rw-1
Received: by mail-wr1-f72.google.com with SMTP id w11so4359905wrp.20
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=10vzrd1KB4hBe4ZZMwH09166mQI1VXUjkd4JvuSfJzs=;
 b=ppEOEumSo0FZOtJevxfqBq/Kqq10MVnSHWYHP6d4ZPCDbbAjVFb/Urm/w7GBYkF45+
 Qp7aJtVP4tComtu1prYESTyI4R4KtwuLLCDLt06JyAamdvphwciMxO7hptOxxnuMIQn9
 bbSMzmvB9aBbN4OYAo+FL5QQy3KR2ZXNMRqqWScZVV0/0/fIpFX6wgInhH/Nf/I4O3wN
 d8/8s99pLhE4l3a2LJAR9VbUKu65jKYFf907eMgGokxxFHOU9BFGDhvYfZft3N1GbaxX
 9O4mNut9LwqG56P12uX+DKmBdc0ZA7LYxI0FRbYLNOZX7Kz0WlWbvEbIIOneWQKqABqA
 N9Mw==
X-Gm-Message-State: ANhLgQ2sYpH0Tn/1ilNJ3docHopWaRJ7+YVAivoT9oVnBE/DPoOTsTxk
 WgLK13FKGZaiBxjHLZpuYjVz5ZJoD9BTZq/est0JADmBYGs1V8R/iSouoGyNDVyNXvM1E3C8//b
 fsLHmTnfnYve/
X-Received: by 2002:adf:a490:: with SMTP id g16mr17744345wrb.42.1584801712171; 
 Sat, 21 Mar 2020 07:41:52 -0700 (PDT)
X-Received: by 2002:adf:a490:: with SMTP id g16mr17744313wrb.42.1584801711853; 
 Sat, 21 Mar 2020 07:41:51 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id l83sm12694424wmf.43.2020.03.21.07.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Mar 2020 07:41:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 v2 06/11] hw/isa/i82378: Remove dead assignment
Date: Sat, 21 Mar 2020 15:41:05 +0100
Message-Id: <20200321144110.5010-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200321144110.5010-1-philmd@redhat.com>
References: <20200321144110.5010-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+9EvcQJAdxR

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

