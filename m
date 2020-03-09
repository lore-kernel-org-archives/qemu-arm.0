Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp975539lfc;
        Mon, 9 Mar 2020 03:25:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vurlLqCW1Q1ACttHcXDwwq5BL2WWh5hbh/2kPforFZx8GjUSaPgOHQ0soJZoQGQRy8TECgQ
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr3921749otf.26.1583749525943;
        Mon, 09 Mar 2020 03:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583749525; cv=none;
        d=google.com; s=arc-20160816;
        b=YhBvQ5fKop3Vom9CF2qag5HNd6o+pAaG+Cx/g8SJXVT4OyCQ76UvRNnNDOkWqBtvS0
         Opgd6nUAcw2qVxJE2XVvnnfKH6pydGTFvgsFOeHmZGd36wv5mxkms7nJryrHe016u+bY
         PXGfsteE6XZ7zss3FyM2JIsx+OPlcFlT8zzaBrdYzWn5h3M6G/Hpopy0f344tw74OeVm
         v1MQkjyCssg+Gl4AfdtmB35AJy5foB6GC/7rC8R9P5VUfxj2yqydDRJt++abFgtoWyF/
         Y3aCLBlCqv+hzXWtorn36oqEYxeGff0Qj4WYAjdEgK7fS8DntKkBJctQghT82BxfTgU0
         j3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=CnmHcvAzlYerfEhzxJ/5Dt9qcTxe4wP+0MOD1yMQ9wI=;
        b=IuDKDCCpwSumNd7uj/yd23LjWTK5VUBpn607LOq8pO8K+tfgxFQ3eN2BatRMVfJo/a
         RY1OK+PnadXXNue6IoOzKPoJvZYHupUocHVqH0scO55QsCsXyyVktpYW0eVEeewmO0Sy
         O+F6b9lTS+6foEfGPVB//cOoRKf7lSl5hSUkyYSm6qqNWdnWttLpi+6vbEzsnlnmMj0A
         3D/GTs41b5Vra/dVg7xnJ4wuQdWfWVp2xZ35r/JAzKrsy6TEMMORd1JCQSN/GWteGqcm
         rJU0Kyk6B+kOfgxA2AWxsJjsagNUYHWPJZ0J7/QAKcXcWmCqH9Rrprr3xNO34iPhmIyF
         6ciw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JAtT9NxJ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id l15si4042879oic.220.2020.03.09.03.25.25;
        Mon, 09 Mar 2020 03:25:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JAtT9NxJ;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgCIKZZ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 9 Mar 2020 06:25:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42999 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726720AbgCIKZY (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 9 Mar 2020 06:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583749523;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CnmHcvAzlYerfEhzxJ/5Dt9qcTxe4wP+0MOD1yMQ9wI=;
        b=JAtT9NxJXHSjLzenZw1cq1noJwUvW1cJxfXOHicr2HOU2qvpYSq5tYgdMQB3Kzcyx+A16X
        eojx0k72tqUAN9nz9oKb3dmvpzxNNL1MDzTYdlZFhj/msr6SjAlscJvWoqafX4y6kbacnn
        6mUcE3fZXMCOTrOGfqCXg/8TaNcr2do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-HvVDyMhrOFO0eT-xP3RH8w-1; Mon, 09 Mar 2020 06:25:21 -0400
X-MC-Unique: HvVDyMhrOFO0eT-xP3RH8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD5E5800D4E;
        Mon,  9 Mar 2020 10:25:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D176887B08;
        Mon,  9 Mar 2020 10:25:16 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v4 11/13] arm/run: Allow Migration tests
Date:   Mon,  9 Mar 2020 11:24:18 +0100
Message-Id: <20200309102420.24498-12-eric.auger@redhat.com>
In-Reply-To: <20200309102420.24498-1-eric.auger@redhat.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: X0qZtI0HsjNk

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
