Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp806253lfg;
        Mon, 24 Feb 2020 13:37:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxc60e3vVD4EcaATup8W7opcdB6AY6B8PhQeMSmt3jWDn84vlUaAFGle/RUEoGlRK0az4a5
X-Received: by 2002:a05:620a:54c:: with SMTP id o12mr51964014qko.2.1582580259768;
        Mon, 24 Feb 2020 13:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580259; cv=none;
        d=google.com; s=arc-20160816;
        b=nc+RmdZuvpiorKLGxPyPJfruRArlkkBDRJe20rVA+ZHu6mcdhRlktjFlmbG6rxfhMJ
         mxiUMMEMwbe+UoheQIiN45JhLtcnuKdGukDWO0KsaNJ6FXmRa7gKznKOGHYkzbikmPok
         iXA4AECOm0Jye7sIona8iDBapmZozplo+Xzx8wOChQqSS8woa0exFXSa+prYtPl9vxRZ
         GKTMvrQ5OBuFDPTGnvHcolOQiP2k4oPMGsG8SJu+QKkmNOTIDHFT5sNYrXLsOZv+9Ru9
         OAjE1OqdxW3tGAZio2f0DG/R2ox7EuSPImeQpno7B+EuCdAiTmtAurXPO1s+RJXwRiWV
         aMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EyHoT0Qb2y3urabGTzLY9V8OCntZ8ljZmUDxRnm6IFA=;
        b=oPt6t8K7hyGH5y4c3Qnl8An5ZQWlH0gdUQuQ3pGqijbDWnXe/NdLvk5lexjYNB4dkn
         PrBYDjvJoUMACsE65uMz9ypvhoqzsax/FKXEaFaYtkNjn2Q6pHh0qtMt0F0AZPQFTVyN
         CkOWOoVnITTH6FLbyaIs3wBx8zXDlQuM1juX7xozmh3zFJrqpzLHsulBRx9Qw+tUIXNc
         Abndu0p0DdpXhhY1+nnryReQvqvgHIHmy3W8NHrqpEpbXiT9hTpIiY5ajDBYv03GjimC
         0H5QHW3qcWz2gtDwXS8EIE/fgHTH8lUURQLApESCU5kPkkSLhsYhyb+igO1Jb+6r2JH/
         l9nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CTKJMnNh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si7135783qkl.180.2020.02.24.13.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:37:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CTKJMnNh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LQ3-0001ck-62
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52700)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KqA-0005VW-0k
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kq8-0006h7-Ul
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:00:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31822
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kq8-0006gb-Qc
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EyHoT0Qb2y3urabGTzLY9V8OCntZ8ljZmUDxRnm6IFA=;
 b=CTKJMnNhTNZWpA982mq0hXkzIDRAvEcfIZgTOTWhK0yCKk0Pg1H+0b/x7n9OW9vbE5817w
 gZpZQkS6NsCPEaYrx7EugMg7LlazGVj0Z3UfvQu6XrkdbBD5RSeKaGLk1CsmwrW8NYdyoI
 UPWRg9xrI5QFAbMJCzEKFNIvCPPThNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-a_m10qtTNKiPziwI6xmWdQ-1; Mon, 24 Feb 2020 16:00:30 -0500
X-MC-Unique: a_m10qtTNKiPziwI6xmWdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BD60DBA6;
 Mon, 24 Feb 2020 21:00:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F76F5C241;
 Mon, 24 Feb 2020 21:00:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 19/32] hw/i386/pc_sysfw: Remove unused 'ram_size'
 argument
Date: Mon, 24 Feb 2020 21:55:20 +0100
Message-Id: <20200224205533.23798-20-philmd@redhat.com>
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
 qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
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
X-TUID: PoYZViVQBBHz

While named 'ram_size', this argument holds the size of the
flash. Since it is unused, remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: qemu-trivial@nongnu.org

 hw/i386/pc_sysfw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index e864c09ea8..07b35ee9d9 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -51,8 +51,7 @@
 #define FLASH_SECTOR_SIZE 4096
=20
 static void pc_isa_bios_init(MemoryRegion *rom_memory,
-                             MemoryRegion *flash_mem,
-                             int ram_size)
+                             MemoryRegion *flash_mem)
 {
     uint64_t isa_bios_size;
     MemoryRegion *isa_bios =3D g_new(MemoryRegion, 1);
@@ -182,7 +181,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
=20
         if (i =3D=3D 0) {
             flash_mem =3D pflash_cfi01_get_memory(system_flash);
-            pc_isa_bios_init(rom_memory, flash_mem, size);
+            pc_isa_bios_init(rom_memory, flash_mem);
=20
             /* Encrypt the pflash boot ROM */
             if (kvm_memcrypt_enabled()) {
--=20
2.21.1

