Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4583722lff;
        Mon, 16 Dec 2019 06:04:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqw9elLzCT5CuQH540otF4qryOWOpJu9DtRqFd95JvpMgJaiRzaLk1w6YTh4ZwTaWqxwCP1t
X-Received: by 2002:aca:4c15:: with SMTP id z21mr9615559oia.12.1576505076426;
        Mon, 16 Dec 2019 06:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576505076; cv=none;
        d=google.com; s=arc-20160816;
        b=trKwQ/jicacylnZhZ3xxksfkdNCS09qFNviIqbQGHhEl2gsYggeUJ955QG1hecKDzO
         nEVvmwnUCJSXHX/It1JG67fSCOzUp8Qw/zXBT/UJ+zf4baZaYMZvAsXRdq7Rkkwq7MrK
         UIJT8lPy6LpwFtFa36w2532gz/IKka+nCiB3GYTsHnyPhZ6bJHOK+HsZbu/ASKxS0d2g
         YxYRtEhApLzezILNp7P7na6aWVWvmbR47zfhCNkp8dVmyDmSw9qQmBSKX/71eou4Gy9N
         sJ2b/aJYJR9D1kBSwoHybOtGTmH7UScz7nnwYCLPRcEqN6+3+5lcBbKpEaCDh0uv70/f
         iV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=iaB3mhmOVrr+BW+SeTs3iK+cp3Zt+YUYyPdWpraAu7A=;
        b=pWForPt4/0sP8AgYcCFkgc2ZAvBCBoZxKEJS34m9Xb4tkDtkDPyfzXT8Ysm/EstlEF
         UUbbycY+ca8lLlEZeQKdXPrs9Z7fCfYS3fpWHyugdXSW5810bYVHcgPozxQ6JmtWLMdg
         XM+ALTeiRcdjQiTh2zEg+fPqovY3uZhtJQdOgzGP7hz77GeYNmWOXDogca+YASV4pv5q
         2s5kHjFqhJfWj0ds85iSV/L0MP/HsYF1CzNPAF0BHdJ8rsTV7+EFwnrovBHIld+Lt6Fs
         n9+3YghSQq+u6i6b2XkMFTaAiNJL4IDjYGdqWoMaYLytlSMQ2qaN+ZJveuK27IOdWHQM
         cIcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iLHS6eDB;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g200si10601772oib.273.2019.12.16.06.04.36;
        Mon, 16 Dec 2019 06:04:36 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iLHS6eDB;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbfLPOEf (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 09:04:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45502 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728157AbfLPOEf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 09:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576505073;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iaB3mhmOVrr+BW+SeTs3iK+cp3Zt+YUYyPdWpraAu7A=;
        b=iLHS6eDBvxQIX5aglh4w8x7JVCGRYJXQLL9xvgOkq0z+pGy8cbn1luvS4wtap/itV1dRMQ
        YStexdpvVrD3jsP23/rGaTDm3nndMOncrKUKPuvJcja1x0fojPaFBXH0qPtvSHXq/Gt/6l
        BpdBdRyWkR7geMofwfy6BabPLNZTnXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-jrVVURoXNyO-sGEQ6te3lw-1; Mon, 16 Dec 2019 09:04:31 -0500
X-MC-Unique: jrVVURoXNyO-sGEQ6te3lw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E45C800D50;
        Mon, 16 Dec 2019 14:04:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 83197675B8;
        Mon, 16 Dec 2019 14:04:26 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH 14/16] arm/run: Allow Migration tests
Date:   Mon, 16 Dec 2019 15:02:33 +0100
Message-Id: <20191216140235.10751-15-eric.auger@redhat.com>
In-Reply-To: <20191216140235.10751-1-eric.auger@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: xPA8JQVLZKpn

Let's link getchar.o to use puts and getchar from the
tests.

Then allow tests belonging to the migration group to
trigger the migration from the test code by putting
"migrate" into the uart. Then the code can wait for the
migration completion by using getchar().

The __getchar implement is minimalist as it just reads the
data register. It is just meant to read the single character
emitted at the end of the migration by the runner script.

It is not meant to read more data (FIFOs are not enabled).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/Makefile.common |  2 +-
 arm/run             |  2 +-
 lib/arm/io.c        | 13 +++++++++++++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arm/Makefile.common b/arm/Makefile.common
index 7cc0f04..327f112 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -32,7 +32,7 @@ CFLAGS +=3D -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I=
 lib
 asm-offsets =3D lib/$(ARCH)/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
=20
-cflatobjs +=3D lib/util.o
+cflatobjs +=3D lib/util.o lib/getchar.o
 cflatobjs +=3D lib/alloc_phys.o
 cflatobjs +=3D lib/alloc_page.o
 cflatobjs +=3D lib/vmalloc.o
diff --git a/arm/run b/arm/run
index 277db9b..a390ca5 100755
--- a/arm/run
+++ b/arm/run
@@ -61,6 +61,6 @@ fi
 M+=3D",accel=3D$ACCEL"
 command=3D"$qemu -nodefaults $M -cpu $processor $chr_testdev $pci_testde=
v"
 command+=3D" -display none -serial stdio -kernel"
-command=3D"$(timeout_cmd) $command"
+command=3D"$(migration_cmd) $(timeout_cmd) $command"
=20
 run_qemu $command "$@"
diff --git a/lib/arm/io.c b/lib/arm/io.c
index 99fd315..aa9e1b5 100644
--- a/lib/arm/io.c
+++ b/lib/arm/io.c
@@ -87,6 +87,19 @@ void puts(const char *s)
 	spin_unlock(&uart_lock);
 }
=20
+/*
+ * Minimalist implementation for migration completion detection.
+ * Needs to be improved for more advanced Rx cases
+ */
+int __getchar(void)
+{
+	int ret;
+
+	ret =3D  readb(uart0_base);
+	if (!ret)
+		return -1;
+	return ret;
+}
=20
 /*
  * Defining halt to take 'code' as an argument guarantees that it will
--=20
2.20.1
