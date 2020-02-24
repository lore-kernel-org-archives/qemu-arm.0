Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp806981lfg;
        Mon, 24 Feb 2020 13:38:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHwMTKDFE/G1tnCKOxAz9eb4tW1FoCzlK4r9RvJFe909xL3mmiTsBiY8hGuu4hoY5Ik5eK
X-Received: by 2002:ac8:76c1:: with SMTP id q1mr2899056qtr.66.1582580323137;
        Mon, 24 Feb 2020 13:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580323; cv=none;
        d=google.com; s=arc-20160816;
        b=m2M0qI13MrLmpatlgVx83NZ6DU7DMTCzjucN8VNXSzh2vFpf5wIj9dnA3qhr02q0Ay
         iEu4BmINRpXrsSoePL3Ibh2F9xQ8VgRkDxoXXFGAAkR320a1hcp7PEPbUtCkH9MO25m8
         Hxhbs/gvmwvwlWKAMEIaSM84f8uqbT+i6ixcJWCV/25QmjOmw0FCrxQ11cWJEboGtKet
         W32U2ypgPbOSgxUsddYwoQYQMnLBx0T5ngoGZxgCufgzb4JtIgvDjnFdrfbpdJdvtvTB
         sOYDa82y/JZQBNEoJruAk7r9niO9x/OGDt6/YWDPGE4DjZ7CBM1tyKzr2G+8aEmQEfvv
         vBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dr08go/2YrQpr64iTe2NKgIJYkg6wpcV7MJXPAVLFyo=;
        b=id5DwSIUSV0itP/Ucap6x75nj2IKS9Z6VsturAzlgvuCWg98Vh2K9kb5pYZGyma2Q5
         cNjbX+9gKQ3WrKlJRBhqE9f/mSIiRdFnqJBn4Fy2UUcYUTRSqU+E6vvskd+QBnQmCQtm
         AeLHgKKTFuJcjfaEl4Bpy7P91j+Ce4P+OrDBlYNDWwLVP0HG4YZ3b40I0aYMCcTs+AEt
         a7c01KbCMVra+1+NykgoH4i+B2TbEj+Ix0KoQWKiCqmPgb8bAYSO5N2pQyOeBgkdFEgx
         RQeyWHzghJIVFlvqYY1b2jTSrlvfmcSEeBiiG1VOAbiU1OMKC8YJCQmSMqM4tyjRUaLd
         3MFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Z/I1sDun";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y185si6808248qkc.171.2020.02.24.13.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:38:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Z/I1sDun";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LR4-0003ST-HR
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51689)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KoF-0001yx-VA
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KoE-00056Y-TG
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:35 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40494
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KoE-000561-Om
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dr08go/2YrQpr64iTe2NKgIJYkg6wpcV7MJXPAVLFyo=;
 b=Z/I1sDunlFRRnuSeerHB53LGebiUWQIGH+3iiikcW3vclZZdWTWVuB1xW6yQ4blYJTNckr
 +jNd6Y5RfrM+8sF3vysEdbBKvbb/CFxSZ6//Eo7QDSE6VD4WevVlSsazIipOTgfb2qNoLu
 2g5FxycS8VyUleW5QGVac8wvO3lMIHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Gnpu7LidMyms5mntC0aeZg-1; Mon, 24 Feb 2020 15:58:32 -0500
X-MC-Unique: Gnpu7LidMyms5mntC0aeZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BABB107ACC7;
 Mon, 24 Feb 2020 20:58:28 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37FAB5C297;
 Mon, 24 Feb 2020 20:58:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 10/32] hw/pci-host: Use memory_region_init_rom()
 with read-only regions
Date: Mon, 24 Feb 2020 21:55:11 +0100
Message-Id: <20200224205533.23798-11-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8kZgXTvjM4Ha

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/pci-host/prep.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 1aff72bec6..1a02e9a670 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -325,9 +325,8 @@ static void raven_realize(PCIDevice *d, Error **errp)
     d->config[0x0D] =3D 0x10; // latency_timer
     d->config[0x34] =3D 0x00; // capabilities_pointer
=20
-    memory_region_init_ram_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZ=
E,
-                           &error_fatal);
-    memory_region_set_readonly(&s->bios, true);
+    memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZ=
E,
+                                     &error_fatal);
     memory_region_add_subregion(get_system_memory(), (uint32_t)(-BIOS_SIZE=
),
                                 &s->bios);
     if (s->bios_name) {
--=20
2.21.1

