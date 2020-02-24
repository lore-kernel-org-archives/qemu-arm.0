Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp764980lfg;
        Mon, 24 Feb 2020 12:48:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwgbhXJMfhL9kVf7ftQe87VWT0pmPPco54z+sz06IhDOqoUj3RyIbAi+XtCqLwmos0bpfcU
X-Received: by 2002:a05:6214:13ef:: with SMTP id ch15mr47276810qvb.183.1582577332814;
        Mon, 24 Feb 2020 12:48:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582577332; cv=none;
        d=google.com; s=arc-20160816;
        b=r0ld3EXwfPwV43PnwcBeSy6ussBtw+2O/n9C/AS+DLBD/VfzManzHH1XdjjwuO1J5u
         FD2HBt6ccahl6wfRGFnQeDHnSYL2rt6Mmw88hcghWPSPiEEsm1M4ht9h0Bw9E4y6q+Q9
         Mm5LQ5/4Z4MiEK328r0XIBR0vYt0rAoFUVNLiTBbSr22xE+8ethbjhlVqS5Lpisubb33
         g0aIIGbHYOCOIk3yHaZkvpmayJxW0YByeLJgi+alFKkdE2OWy8dJBsJpKTCE6HjqSlJe
         r3bYtF0Ipc0p0BaBI2ZZ1vIqNASoPbpoHQOLVXw3iVtxrXYrG9bB0ZmAu93B0v5sAIhx
         XBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FHdRJiFy2+sRYmNBB/Zm10M7PeGOon/0i7FrH36WST8=;
        b=lsKJz8E6W2+og+h9R6J/hoS5OL0KXmwh7feVV/pRAlvk33JZilf+p6VeIgUqNinmUc
         Vi1ElCcM20okZTNhygV2y0ZGbZ8KTt3GWFmg/Ca1faun0DFfYF8ZN32tzTt064uS/MyZ
         QUDZkZottGwdVsAYuD5NDrC0amQoMwBJ7cWN3xGla0t1qwGMGypslIDTDVS2LMVoppSc
         tKB58pUHy3DuYxewhmXECv7ZAHW5cKTlED4ItmeDPAhhEEq3KVCNG+dOt/+RjvRLfQYb
         Ci9/JNkL2opTFk287kvjREqvnPxSa3u1OkxUx5HashMtXRfLNnzzlvNBPwSg6/JtwhKk
         Gxow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZWIGHcEU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si6925804qkl.147.2020.02.24.12.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 12:48:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZWIGHcEU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Kep-0000oC-U8
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 15:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kef-0000mT-Ba
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kee-0005yT-A5
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:41 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28561
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Ked-0005vy-Hn
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHdRJiFy2+sRYmNBB/Zm10M7PeGOon/0i7FrH36WST8=;
 b=ZWIGHcEUiZDuNwtg2v2GKwV08cJ9n44qA5LPGWwETzkCswIojgjIFjdqml6F4BedXbVJGp
 wv58biN3Y+EIlp00JaExc9sUKOPFX7oyXFHCaeKRnj8kxULaRTtOVDTjWnFLcoYto5e60y
 SBp3BJt3RkV4OIvL2tax/SgUrpZosTo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-fYyyknBrPLimY0ddFzsD_A-1; Mon, 24 Feb 2020 15:48:37 -0500
X-MC-Unique: fYyyknBrPLimY0ddFzsD_A-1
Received: by mail-wr1-f71.google.com with SMTP id z15so6185901wrw.0
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 12:48:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZClVMiunKveJxIk817JDRiraYdietQ4sjQAY6VMZbY4=;
 b=I4l7zPLX1jM6lY3WC6/lo/4jEsmciNztvD/RVqRx/viQj2HKtJsiuPjLiWAEFkfENg
 Y8kVmrwDOZKI4aBFCDSsBnllyAQCtEfew4hq2++SrU1zpcuI4PR63kWzFa/PEJYRK/Gj
 e5XccxGyC2J8uNN8MbmscWhhcnmBa+zIcO1mkRU6qdiYbxAys617VZbtNsqFLuTGf8Vc
 dfUbXfqyjXmhnVz/XWGSbaY1HS+vc4q0SzDteWdDQmIDz3bMKiGWcDKiGcN78K17U1F+
 gkugZGlyOyrD9UzOUa1ufTU4j3p+EFuXqZ7KsMUizTkJ1WMeQ9TMW3tVycMUSVrUMHFU
 /y6A==
X-Gm-Message-State: APjAAAUA6KL+0PnS3Yq3o45cfZj7QSwRqcHn1vNaY6arWlquItNzFv1/
 SY0Cu7wuZvTXoHJeVaaa+iuLdFrurfo2g27Na0h6Axm/ADYPnXEtahPDHVntY+NvTDh3Z/uNxtM
 8yz89SlNA05cv
X-Received: by 2002:a5d:484f:: with SMTP id n15mr68380897wrs.365.1582577316222; 
 Mon, 24 Feb 2020 12:48:36 -0800 (PST)
X-Received: by 2002:a5d:484f:: with SMTP id n15mr68380843wrs.365.1582577315965; 
 Mon, 24 Feb 2020 12:48:35 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v2 02/32] memory: Simplify memory_region_init_rom_nomigrate()
 to ease review
Date: Mon, 24 Feb 2020 21:47:58 +0100
Message-Id: <20200224204828.23167-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200224204828.23167-1-philmd@redhat.com>
References: <20200224204828.23167-1-philmd@redhat.com>
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5vgSbmMZdIVM

memory_region_init_rom_nomigrate() has the same content than
memory_region_init_ram_shared_nomigrate(), with setting the
readonly mode. The code is easier to review as creating a
readonly ram/shared/nomigrate region.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 memory.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/memory.c b/memory.c
index ce1179874e..6a327a54ed 100644
--- a/memory.c
+++ b/memory.c
@@ -1659,19 +1659,8 @@ void memory_region_init_rom_nomigrate(MemoryRegion *=
mr,
                                       uint64_t size,
                                       Error **errp)
 {
-    Error *err =3D NULL;
-    memory_region_init(mr, owner, name, size);
-    mr->ram =3D true;
+    memory_region_init_ram_shared_nomigrate(mr, owner, name, size, false, =
errp);
     mr->readonly =3D true;
-    mr->terminates =3D true;
-    mr->destructor =3D memory_region_destructor_ram;
-    mr->ram_block =3D qemu_ram_alloc(size, false, mr, &err);
-    mr->dirty_log_mask =3D tcg_enabled() ? (1 << DIRTY_MEMORY_CODE) : 0;
-    if (err) {
-        mr->size =3D int128_zero();
-        object_unparent(OBJECT(mr));
-        error_propagate(errp, err);
-    }
 }
=20
 void memory_region_init_rom_device_nomigrate(MemoryRegion *mr,
--=20
2.21.1

