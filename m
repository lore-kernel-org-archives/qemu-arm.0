Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2066020lfi;
        Thu, 2 Apr 2020 07:53:58 -0700 (PDT)
X-Google-Smtp-Source: APiQypIrnBWufXV1zlUzerSBFaJwkhOAMFRd7icc5/ageLd2w/9LHb84dSXArxW0xN2ijmE8Udb2
X-Received: by 2002:aca:bc56:: with SMTP id m83mr2407670oif.11.1585839238222;
        Thu, 02 Apr 2020 07:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585839238; cv=none;
        d=google.com; s=arc-20160816;
        b=nVgX5aRWRhyHlBahrDxLCtOuo0H/5/7ch2EWqEOEu6tI82xURDc1G3SDGmY83KGEug
         qquBEmVt91fFOmejlZXIOTuRavv5USiOJgnO9gxzzR3VzyxknwZf2YLJFSTIK+BlMjmR
         DrFBM9c8qC3JJ19q9MampigqI0v6sU1q6f+ZekWFB8slZy2qKF1J1B/Gb/wGJLczivDz
         cHKOo1AbO3zteH1GJwv3NUCzIe1A6aDEeTkXMtAo4Ffq4I6tiuj7Ag+dBTheODqCOwff
         5+I6rhLrbETzNcKWvdTDWzX89PDRB645DCuwdoT+vHofy3jz3XMWd6JIPh685GPKloJ0
         7jWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=CnmHcvAzlYerfEhzxJ/5Dt9qcTxe4wP+0MOD1yMQ9wI=;
        b=aWb+Csu/8NjdeHU4aS8cSztI8LwvXtdmOyMCranXS26l0ghz2Bn+oL2cb41b8Z8SvO
         IZuoBkR5tNApiNlYOCwiG2VhvLgQuhR3fFL8AEGNHZNQV0K/WsK6KCZvK0lHmIIYKhWP
         BBzmQ4iKKflJ2b6W1DYoVZf1he3xfb+U5gwYlo2TsPQ3UfepZHmG5CTlIrjErAJpQdvP
         Qc76+Mpmv05HJF3l6Vaah0zW6jt1Q2uw76/Z/zg17SiP7Tw9ywELf7AWwwaXd9p8T8xD
         W+8tVAkctnNCXHJ3OT9GgiGg7hz3PauAcBLP0dGOZyA5oq0CIqFzZqauJ746Mp5919xr
         KTaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HN1H//+K";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n82si2370912oib.123.2020.04.02.07.53.57;
        Thu, 02 Apr 2020 07:53:58 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="HN1H//+K";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388913AbgDBOx5 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 2 Apr 2020 10:53:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43916 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388808AbgDBOx5 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 2 Apr 2020 10:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585839236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CnmHcvAzlYerfEhzxJ/5Dt9qcTxe4wP+0MOD1yMQ9wI=;
        b=HN1H//+KAVAHOtS8Zilkw7OAfcUPwis2gzJ9EoADB9p64QVCV+BA11K954J2ieg/oSuQhA
        b+066Yp7wK4lMh7OxRAzpGB+Zcqe0P6fHEPmdWQwXX1kXw4/+YzkBmbBr8w4BlVCvmp0/T
        PSKW6JgQoKbawqKrOwo1Tq52BMENBaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-2zWo83tSNwCnwjJQLM56Jw-1; Thu, 02 Apr 2020 10:53:53 -0400
X-MC-Unique: 2zWo83tSNwCnwjJQLM56Jw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 516598017CE;
        Thu,  2 Apr 2020 14:53:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-58.ams2.redhat.com [10.36.112.58])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DE0135D9C9;
        Thu,  2 Apr 2020 14:53:45 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v8 11/13] arm/run: Allow Migration tests
Date:   Thu,  2 Apr 2020 16:52:25 +0200
Message-Id: <20200402145227.20109-12-eric.auger@redhat.com>
In-Reply-To: <20200402145227.20109-1-eric.auger@redhat.com>
References: <20200402145227.20109-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: e9m5tnG+q1N3

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

v3 -> v4:
- remove space around Elvis operator
- rename ___getchar into do_getchar

v2 -> v3:
- take the lock
- assert if more than 16 chars
- removed Thomas' R-b
---
 arm/Makefile.common |  2 +-
 arm/run             |  2 +-
 lib/arm/io.c        | 28 ++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arm/Makefile.common b/arm/Makefile.common
index b8988f2..a123e85 100644
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
index 99fd315..343e108 100644
--- a/lib/arm/io.c
+++ b/lib/arm/io.c
@@ -87,6 +87,34 @@ void puts(const char *s)
 	spin_unlock(&uart_lock);
 }
=20
+static int do_getchar(void)
+{
+	int c;
+
+	spin_lock(&uart_lock);
+	c =3D readb(uart0_base);
+	spin_unlock(&uart_lock);
+
+	return c ?: -1;
+}
+
+/*
+ * Minimalist implementation for migration completion detection.
+ * Without FIFOs enabled on the QEMU UART device we just read
+ * the data register: we cannot read more than 16 characters.
+ */
+int __getchar(void)
+{
+	int c =3D do_getchar();
+	static int count;
+
+	if (c !=3D -1)
+		++count;
+
+	assert(count < 16);
+
+	return c;
+}
=20
 /*
  * Defining halt to take 'code' as an argument guarantees that it will
--=20
2.20.1
