Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp783283lfg;
        Mon, 24 Feb 2020 13:10:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxueJDm0rwyHVQQs58ypA4logMy8uFxrX+JbuVefaqn3zIx4imVVS7+yokEG1O58l7Evn5T
X-Received: by 2002:ac8:36dd:: with SMTP id b29mr49123733qtc.285.1582578606355;
        Mon, 24 Feb 2020 13:10:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582578606; cv=none;
        d=google.com; s=arc-20160816;
        b=hF7QlY9JIABcjxgLi6tLU2MFdddzcX7R8VGFftcg3hIwsCNowG5pbpIhGQ0P/HLlG+
         9NzzsPp3/YV1m2bymRlLpOCYdAZa6jVrn0HJ7+wjn6X4P4H4bFr6sLRPfbM9FKKWvw/i
         mMukYPG/R1hRBr7BcyCvXl7Tn6tPJVuLt23FJrtHqhaGCaKrcHS5ji89R6JY6P6YgzAJ
         9TIWF6ib2xRz8/IJBaRswGgb+IamTT9PPnlYAqK9urCsXhZ6MD6A3LOkiDnZqljDSSpj
         7cmowt5ro3Yc4MlEsM6k48AT7ayi4oIu1/dC6r93+D/SIDCbllVmO7lP/NdIhsLjUHzg
         GK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pxC+1Wm7lZTcIVTNIaK8R7xk0TXOBYBpGoQjSWP/PII=;
        b=YgTv75MrAdFH420AweTixMvv6eOPutsL7BFSy31/HNk87LIx1k6Q46JZrvIKuxAOpT
         iGiiUMqoGj08IuRuG7HA3AAq83RQyae4GFYqsZlq8ysFvo9mns2axOIkQidmJpv/e3uU
         z3KNtbFWUJRMjXiZdLg5reISTsnpM7rv5xsaGRq8PYE8c9qMEjKP7OFdFhJ8c7JnCT4m
         icvpD2hkbVuhp2ziTsWjw0BQsRLTwZxMK0jMJAQ/PabJgW+24HaJ1lmpBF45rmMoUpx2
         F5WQBgfaXjRm2kgciKqCXcZ6/asqHMKe0t9csdP4hWEDYrwR/qy7rbBfzxhajIvB9pjf
         L5ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SRhIM+Tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si6590642qki.342.2020.02.24.13.10.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:10:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SRhIM+Tg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6KzN-0003Hm-Nr
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KmS-0006zg-Eu
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:56:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KmR-0003Uf-9E
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:56:44 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58408
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KmR-0003Tl-55
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxC+1Wm7lZTcIVTNIaK8R7xk0TXOBYBpGoQjSWP/PII=;
 b=SRhIM+TgDp2i5P0dJi6aik0JN29ICMtBUxNYDUrBhLhjX9w5mbkNtjbyfl71eFwDs1dXwT
 /WEKoTIUtThtVFflbItb7/oEuSjdggbSb6n/omcMag3/UqZSRJd0nLzhlKosjObP5pMQm5
 WPqZqYiPozSvtxsYyjrEMr8bT98/RFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-sOX200VyNxifcfS9zL5_kw-1; Mon, 24 Feb 2020 15:56:40 -0500
X-MC-Unique: sOX200VyNxifcfS9zL5_kw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6FD6801A10;
 Mon, 24 Feb 2020 20:56:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3215C21B;
 Mon, 24 Feb 2020 20:56:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 03/32] scripts/cocci: Rename memory-region-{init-ram
 -> housekeeping}
Date: Mon, 24 Feb 2020 21:55:04 +0100
Message-Id: <20200224205533.23798-4-philmd@redhat.com>
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
X-TUID: 8hmOH8ObkoLN

As we are going to add various semantic changes related to the memory
region API, rename this script to be more generic.
Add a 'usage' header, and an entry in MAINTAINERS to avoid checkpatch
warning.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 ...t-ram.cocci =3D> memory-region-housekeeping.cocci} | 13 +++++++++++++
 MAINTAINERS                                         |  1 +
 2 files changed, 14 insertions(+)
 rename scripts/coccinelle/{memory-region-init-ram.cocci =3D> memory-region=
-housekeeping.cocci} (84%)

diff --git a/scripts/coccinelle/memory-region-init-ram.cocci b/scripts/cocc=
inelle/memory-region-housekeeping.cocci
similarity index 84%
rename from scripts/coccinelle/memory-region-init-ram.cocci
rename to scripts/coccinelle/memory-region-housekeeping.cocci
index d290150872..3699c1017e 100644
--- a/scripts/coccinelle/memory-region-init-ram.cocci
+++ b/scripts/coccinelle/memory-region-housekeeping.cocci
@@ -1,3 +1,16 @@
+/*
+  Usage:
+
+    spatch \
+        --macro-file scripts/cocci-macro-file.h \
+        --sp-file scripts/coccinelle/memory-region-housekeeping.cocci \
+        --keep-comments \
+        --in-place \
+        --dir .
+
+*/
+
+
 // Replace by-hand memory_region_init_ram_nomigrate/vmstate_register_ram
 // code sequences with use of the new memory_region_init_ram function.
 // Similarly for the _rom and _rom_device functions.
diff --git a/MAINTAINERS b/MAINTAINERS
index 195dd58cac..316a8edbb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1998,6 +1998,7 @@ F: include/exec/ramblock.h
 F: memory.c
 F: include/exec/memory-internal.h
 F: exec.c
+F: scripts/coccinelle/memory-region-housekeeping.cocci
=20
 SPICE
 M: Gerd Hoffmann <kraxel@redhat.com>
--=20
2.21.1

