Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp795944lfg;
        Mon, 24 Feb 2020 13:24:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYwoX1BNrJoatI4QncmJt0RoxJqtB5OErBw2e1CLw/R7qDYrps0CBXZPYxYVNTLT4lLOBU
X-Received: by 2002:a05:620a:125b:: with SMTP id a27mr49929232qkl.203.1582579480932;
        Mon, 24 Feb 2020 13:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579480; cv=none;
        d=google.com; s=arc-20160816;
        b=OOTK1Ovp1oI1pGg6n6r+1yIOT4fBgFEKQ1LsWUgGJtcoKNyCNvcJpaCPKXjndHkg8c
         kJBqWB7ihFzErgFH7FbppFC4sMkfxRdGCnzJ2KtHb892tklvYotNRJfa6Vh2QD+5GvtI
         Ro0pIkPKLfY7OO+KopiQn3m5TVzM0gxhP4Ko3vLOjS2lhJ8ZgeW3/P6RJosJbLGMTzai
         vBmq16f5Qf1AHPc0FDCKWc0Mt8BoeQ0o/N0CvPj2H18VG70Vjs0VePhXsXCxaYsZpoZC
         HGlCyAJkVxO3ee1H6yo4yruzhXH3ybdUqLBeKx3+Ap1/+qdZIV6dfoNAcoYiDN9LyhSG
         SxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I6SdkZkbHtZbpGj30/TNvSyK6rwDYnvFekTs4gXk1Gs=;
        b=YsEziV5fXXxD4PklrwZcrk6dka3khOL1XIo8koOCLO+ZE4yoKEA4INM+mJaK4B75Cw
         6udhh5OiQj/em1Z0/7ywro5kJ7YpxAmEALmipsYn0aAzP749bSvP7mXQVRCpy3T5ztKd
         8UcG8rzBU6cZjX6kYkfAG8E1CqdAkT5u/XHIDsRHf4hMc0pTW7TTAvyinPr4vpyApSij
         NTJaT37mJ5U6Dq+Y19EYHopNpMKDBhN8DLOqy1E9sdUSo1JapjhpQJz1cpkmrl++GelJ
         YKUG1IUPgq7NLZPigtUK2U5WrHrdnmw0Xw0bpH1wpoD8HL7X50Qzv/1w99zWog7BhR/L
         b2eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M7oSuD3s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x127si6736953qkb.267.2020.02.24.13.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M7oSuD3s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LDU-0004P2-64
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KpH-0003yi-Mo
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:59:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KpG-000634-KW
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:59:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26799
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KpG-00062j-FR
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6SdkZkbHtZbpGj30/TNvSyK6rwDYnvFekTs4gXk1Gs=;
 b=M7oSuD3s4Y8EEhZDHwPLEqCdCH3jX0k2xvW4KZaATgIRRe/5Y/iXwG+ljKJbO94U1kDexE
 uN7LLUvFz21/s/8DfSxommH0HGJbZP/rjHgqEpTsZ8HNV2vvCbykD/vGGO+bZM3IesHBj9
 vCRBM0eCha8pzga6UlV1OqFD6X5XiRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-MKBC_ZuIO0i3O8O_6e9F3g-1; Mon, 24 Feb 2020 15:59:36 -0500
X-MC-Unique: MKBC_ZuIO0i3O8O_6e9F3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E7AC189F760;
 Mon, 24 Feb 2020 20:59:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B01135C651;
 Mon, 24 Feb 2020 20:59:17 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 15/32] scripts/cocci: Patch to detect potential use
 of memory_region_init_rom
Date: Mon, 24 Feb 2020 21:55:16 +0100
Message-Id: <20200224205533.23798-16-philmd@redhat.com>
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
X-Received-From: 207.211.31.120
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yIUdEgYGQ7Rq

Add a semantic patch to detect potential replacement of
memory_region_init_ram(readonly) by memory_region_init_rom().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .../memory-region-housekeeping.cocci          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/coccinelle/memory-region-housekeeping.cocci b/scripts/=
coccinelle/memory-region-housekeeping.cocci
index ee3923d369..9cdde71bb1 100644
--- a/scripts/coccinelle/memory-region-housekeeping.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -29,6 +29,25 @@ symbol true;
 )
=20
=20
+@possible_memory_region_init_rom@
+expression E1, E2, E3, E4, E5;
+position p;
+@@
+(
+  memory_region_init_ram@p(E1, E2, E3, E4, E5);
+  ...
+  memory_region_set_readonly(E1, true);
+|
+  memory_region_init_ram_nomigrate@p(E1, E2, E3, E4, E5);
+  ...
+  memory_region_set_readonly(E1, true);
+)
+@script:python@
+p << possible_memory_region_init_rom.p;
+@@
+cocci.print_main("potential use of memory_region_init_rom*() in ", p)
+
+
 // Replace by-hand memory_region_init_ram_nomigrate/vmstate_register_ram
 // code sequences with use of the new memory_region_init_ram function.
 // Similarly for the _rom and _rom_device functions.
--=20
2.21.1

