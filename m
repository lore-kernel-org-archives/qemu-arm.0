Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3800503wrm;
        Sun, 20 Oct 2019 16:17:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJf3WQ1BUz57ktuSX7wdQ02neUyukPFMxzAOWEU4B123sWJ27LT1vmPCgKIOXQY9LQu79P
X-Received: by 2002:a05:620a:1f6:: with SMTP id x22mr15432343qkn.474.1571613425287;
        Sun, 20 Oct 2019 16:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571613425; cv=none;
        d=google.com; s=arc-20160816;
        b=mfd6o94Y7YvVsZrZTLr7UlGcVbBb+vb8G78YYOp53Cx/wONJdxrQP1qeNwYO9TiKY/
         oyrytiWj8DQgt0cD1CWJ7/YSataZjZC5o7pI+nkk2m8cM/FI/UayIvE1VTKvhXquXWCZ
         +NS2LKcvb8Wr1Cjm7mkHYtWdJP0uDTLsZN8CK+kD1bMJxjmnMSoO2EkgystF6v09YmGO
         vB18adz6CWtedyFtU487E8OMFpbI+ZSvuViZVtbGuEiniz/OG1bGNI25GUgsS3IPntPh
         xln30V1Ebb2iCrozw0OUOw/20dgpurS5qdGKUWK80D/dV/ZtEVbucdBfAvjpdwlUrQTg
         rS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DPbCDBS6I1JLm9PRPoFX786EP2/rQynjbMRZ4Kkujho=;
        b=HGWpFa1v8Xg0yTveG8SV79sPlAKbCqTgFLMMTadl3C24hgGGl354V/dXBJCLV/dM8s
         1Wo6mFo20uKkCGLib1PY0mqoqiVbx0PrsHX/1uo0LS+ESPeylZdaqjcMyotuljs2s01p
         l4Kh9qOKQbn4x7PhsTe5oIo0zCWcgGeswrIbHFGWEdjacpzn3P7rHuSoC65b2PWdA0Rw
         oEdO9kK/NrXF04PkYqWCLoIKQGaOkMiheATRZM1mkO9sG1HTJmPqp4dcLDGDFmWDR/h3
         50dGhmI/3jDk/DdVueO6s6MW8t7Ej9dxTstgXsCpez4nCFd7hCEw8RFgtapHKEiex1ib
         8bZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cae6LM3H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si11970534qkk.207.2019.10.20.16.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cae6LM3H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKRc-0000k0-JD
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 19:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKEk-0004PF-Se
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKEj-0002q6-Qg
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:03:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21314
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKEj-0002pE-Lw
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPbCDBS6I1JLm9PRPoFX786EP2/rQynjbMRZ4Kkujho=;
 b=cae6LM3HYa8PcQZWtAaHjxE0LfE5PA2wRWa2Q/hqOSVj1gd5sMNmTDMhT3JqFgTVfN+9rV
 N/OQ4i31PyLgXc0Pchv/uHmKeQN9lE3thUGOcvQvcWAUK3VsTMwStrodies+/qqNTrMm0X
 H6qccjVZhCj52e8aLHfDMX2D/2zLzp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-RRXfVU6QP4qD9tFzs4IRwA-1; Sun, 20 Oct 2019 19:03:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8469F80183E;
 Sun, 20 Oct 2019 23:03:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75EC760C18;
 Sun, 20 Oct 2019 23:03:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 20/21] hw/sparc: Let the machine be the owner of the system
 memory
Date: Mon, 21 Oct 2019 00:56:49 +0200
Message-Id: <20191020225650.3671-21-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: RRXfVU6QP4qD9tFzs4IRwA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-TUID: YUENWpswnuL2

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/sparc/leon3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index c5f1b1ee72..f58f2782c6 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -244,7 +244,7 @@ static void leon3_generic_hw_init(MachineState *machine=
)
         exit(1);
     }
=20
-    memory_region_allocate_system_memory(ram, NULL, "leon3.ram", ram_size)=
;
+    memory_region_allocate_system_memory(ram, machine, "leon3.ram", ram_si=
ze);
     memory_region_add_subregion(address_space_mem, LEON3_RAM_OFFSET, ram);
=20
     /* Allocate BIOS */
--=20
2.21.0

