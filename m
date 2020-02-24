Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp791530lfg;
        Mon, 24 Feb 2020 13:18:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPs0z2eQp0TXHLQHopnnA741XjFnAivP/N05JmJGmcxyrOTd77+MWfBBR35B+KmA6qSAk+
X-Received: by 2002:a37:4e53:: with SMTP id c80mr28194699qkb.58.1582579136452;
        Mon, 24 Feb 2020 13:18:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582579136; cv=none;
        d=google.com; s=arc-20160816;
        b=KQWTloCtP4ypNAWyw3AY1gzFhZCvqo89MjiyONekEDcQClogBo+vALW++1Si2zndqn
         6mtsPLpOwEw7K8dcp2OLyFiUTsDKj7/dRAJJoZ4L5W8EfgbYuXUMtYpRIS9374fKIYBR
         zZaoo2ZjSCLtbZQSb0EdrOmgH9QC+BddTJUJH1YyltellH8bpokevSe4lFYEuMEL8Pma
         29Zy/wRS7no6WKsnQHZLb+Z8a7qiRLdBP/fxKMhBGBfY88hCNFcIjihQlyzq9o73Suzq
         BrDs9o53D6aGNoCtk7ZTkuQDXKjy9aB8xiw1KLQOWDliTMYBYZBFmS0n4Fi7Aw/upuIv
         LhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KKIXWkZQ88WTduFFFkbsC3MYjrqzYmU5aP3tKw4s+ro=;
        b=BYzfQWfEd0Ql4GfjLptDxhfwygYqjr6o9dIjKW9bOlFjdzUEnw4DyLxzT7+0ql9jh8
         KtTQZGZVSHXq/gFV25rB6xBw+ptow7zMewevzqcUfRz63EuFNdvqTkODINQwh7URHqgY
         l2R0rOSFl2/1D9n0UBgDDYf9vNBbL2rexjh+ELQzSLYF8Vo3V6uyIfx3q4JrjJfYsIqV
         BfAOEhdeXYCCY9Mcl3rjvR3VEHVW3qCuGou6S33sJuVUa+r+7HSYbkH3tv4fLaMYoVWR
         g/gX1B9iBzTmGXuoChuAMmDJsEFaZP/e9Op3Y+QkDkCSpuzPV65g9k1nvJqBse2UKvsO
         jNkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N5cwG3lI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si6582555qkj.306.2020.02.24.13.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:18:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N5cwG3lI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6L7v-0002Vb-Sd
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KnE-0000MY-8c
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:57:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KnC-0004HH-EL
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:57:32 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48264
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KnC-0004GH-8D
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKIXWkZQ88WTduFFFkbsC3MYjrqzYmU5aP3tKw4s+ro=;
 b=N5cwG3lIKM137pRXW3FN0r8aVox6cwlibHvenbQRwNEgmrjIa1nid2KOSzhR5qKCEwi8Wl
 89Q6a5Uv7SSRncghgBJGfYNQ5VEzcxAdLeH+hO7aqbU4jEUy39xLHUR0kXnBzfNDDOPlyZ
 /w8fjYijQilVJIu8mBIVjPd4FcgqlMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-ApolAFJKPmSPJtMxhx_p5A-1; Mon, 24 Feb 2020 15:57:14 -0500
X-MC-Unique: ApolAFJKPmSPJtMxhx_p5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B59881882CCC;
 Mon, 24 Feb 2020 20:57:09 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 463715C578;
 Mon, 24 Feb 2020 20:56:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 04/32] scripts/cocci: Patch to replace
 memory_region_init_{ram, readonly -> rom}
Date: Mon, 24 Feb 2020 21:55:05 +0100
Message-Id: <20200224205533.23798-5-philmd@redhat.com>
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
X-TUID: 4h1qcat+6DKP

Add a semantic patch to replace memory_region_init_ram(readonly)
by memory_region_init_rom().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 .../memory-region-housekeeping.cocci           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/coccinelle/memory-region-housekeeping.cocci b/scripts/=
coccinelle/memory-region-housekeeping.cocci
index 3699c1017e..ee3923d369 100644
--- a/scripts/coccinelle/memory-region-housekeeping.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -11,6 +11,24 @@
 */
=20
=20
+// Replace memory_region_init_ram(readonly) by memory_region_init_rom()
+@@
+expression E1, E2, E3, E4, E5;
+symbol true;
+@@
+(
+- memory_region_init_ram(E1, E2, E3, E4, E5);
++ memory_region_init_rom(E1, E2, E3, E4, E5);
+  ... WHEN !=3D E1
+- memory_region_set_readonly(E1, true);
+|
+- memory_region_init_ram_nomigrate(E1, E2, E3, E4, E5);
++ memory_region_init_rom_nomigrate(E1, E2, E3, E4, E5);
+  ... WHEN !=3D E1
+- memory_region_set_readonly(E1, true);
+)
+
+
 // Replace by-hand memory_region_init_ram_nomigrate/vmstate_register_ram
 // code sequences with use of the new memory_region_init_ram function.
 // Similarly for the _rom and _rom_device functions.
--=20
2.21.1

