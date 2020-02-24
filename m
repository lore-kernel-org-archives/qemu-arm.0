Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp765318lfg;
        Mon, 24 Feb 2020 12:49:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLE6Pv2mR3w59KRTMTa3PkW02UoZtd8l3DL/Y84j5O7DUCMWQs2pDwG2Sxmp8zgmMN6kTe
X-Received: by 2002:a37:9a8b:: with SMTP id c133mr9205866qke.132.1582577359686;
        Mon, 24 Feb 2020 12:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582577359; cv=none;
        d=google.com; s=arc-20160816;
        b=aTgqZ/vS3z8NWNTk+IFG0gP83MolliJI8zot5ECxeBBeHnuRqkgj5YpxMfXRPNBSrO
         EPY2aHAiuhpY8b0PT2RZ0BssM0HrKoBrN1qmUe/+x7yiDWvjj53kb8BGDkkifKw298cO
         bAhbuj8SRnjEu04rktcwCnzI9P8If3vLQ4W4YOxm32Asjpfjrmx1ds+nH6a0h587tcTI
         ZjIGPVJDdaylNc2VJE3iAbawcstSWXcd9UF9i+5m+YF6Mn8Ep+2bZRgfJkBXWPIbiWA7
         j9ooUrlkPBk3GBvLOnWPKmrxHDt447EnIRYztmPO7RhzP7VFeM+MJz6HGqWmGlBtTkOw
         2N4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pxC+1Wm7lZTcIVTNIaK8R7xk0TXOBYBpGoQjSWP/PII=;
        b=NJNjJerybCHjo+u66XuSegIPT5vAopiJEm8VDfJ5GPRock0UxRoXoPnlu8DiGnoQN+
         9jwvCA1799qKDnImAWF54NDFINnLqd98W78QxC8JtqpyAzFBiH9QM76E3JQNc6D5mTTy
         VZEAH/43kzDzK/s8Tv4sCg0lyyMbUuaATQy+9PTGa+4X8rFV1XK5jNNQpcVVqw1UI813
         NG+SYwKSuG6B02jNGCv3uYBH7at7SBDiucdevF7yIskgErWG7ATud5y4I4At4MquIkL1
         ynsl8vssT+HiMgMUaaa03m3xUjR68bSoCMcbvkQYtkW8G1Dz/uiz/PjJY7az7wHs6yUs
         97/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="gpOZfqF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si5660272qvb.11.2020.02.24.12.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 12:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="gpOZfqF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6KfH-00025H-2u
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 15:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Keh-0000qc-TN
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Keg-000621-Bn
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:43 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50231
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Keg-00061N-6x
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 15:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxC+1Wm7lZTcIVTNIaK8R7xk0TXOBYBpGoQjSWP/PII=;
 b=gpOZfqF/ANAOa8Vyg9v5U2u9P9RF4w6sPxdJQSSAMzdj2KZ2pDfN1nM7gSDzO+ntQksVBm
 g2l0Fhf+0kxFymTtjn64Rt8Gjt8DHGN7cY8/U9BSJbAV5urzB3OfkouYizWsbrXLBqnEC3
 tLS/WgF9rOH+CG0LrKP3bbvgc/q3OsI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-BmKIb7lKO7qWbNict_5dvA-1; Mon, 24 Feb 2020 15:48:39 -0500
X-MC-Unique: BmKIb7lKO7qWbNict_5dvA-1
Received: by mail-wm1-f70.google.com with SMTP id 7so229436wmf.9
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 12:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxYYROcVaswdAAx61tJuJg4MU34WxQsacT4wWudpNIs=;
 b=uhdb9laoS11GNqV64gG9gxPsS7qP85ZL/e+nD1/wu2g3Cq0hV6KXZTbw54LI58Ut32
 tWpfMGvRHUMHYtBnLdeUwc+sYK9NJ4A4xU7AxzCM8h4v5M+JbYRVrAtlnb/InCIa4Psv
 rVyNhIhBxx1v2AVAolZoYFSo/z50Zs8HU1/VjLXAPd+SBNlzJgVGyj2dD0cG5G2cP4AH
 MJdEqDdA/wqvhCKp5UXdS1Z28bAn+7Q2OLb4bmLXPtl04XQUwkqT9IEYvRiltq4w3sSQ
 SLwZbEqQ+JV/6wsH6UW1idBkAkeT43Z0irvs31YqHLtRsvONTIe0gQiva+P9JVuSPJCX
 aT0Q==
X-Gm-Message-State: APjAAAUhB2yoacyO3uJIIRBsLyVBdXAijCpM6x/qZrkmv8r5GuGMVQVY
 0NbdDw2v1zgJ28nb9f+riIDFlDgKOubYdLF1x0ZLiYU3pXlMfvsviapBc2vVEhDgykdCFFNvkuy
 Yu00fknNxBDQ/
X-Received: by 2002:a1c:988c:: with SMTP id a134mr754273wme.163.1582577318814; 
 Mon, 24 Feb 2020 12:48:38 -0800 (PST)
X-Received: by 2002:a1c:988c:: with SMTP id a134mr754255wme.163.1582577318492; 
 Mon, 24 Feb 2020 12:48:38 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v2 03/32] scripts/cocci: Rename memory-region-{init-ram ->
 housekeeping}
Date: Mon, 24 Feb 2020 21:47:59 +0100
Message-Id: <20200224204828.23167-4-philmd@redhat.com>
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
X-TUID: QztAAlLt8ecn

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

