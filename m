Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp305883lfp;
        Tue, 28 Jan 2020 02:36:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzA5gUsXjPTl7DOHFuXWFoTNEP3O3tlLTJr4/G99/5PnmZXrRt515NezPqO+Rsf35ds2aah
X-Received: by 2002:a9d:c42:: with SMTP id 60mr15344489otr.182.1580207808794;
        Tue, 28 Jan 2020 02:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580207808; cv=none;
        d=google.com; s=arc-20160816;
        b=EnCwBSWaz3cmDMGHcRJ0kHm7EKt7fR4J2LVka0DbCspl9LsCyBXuPTzbQgrHiJ5E8E
         ienQmK8CmiWEp2pxOpUc9AqSb7Mq1Mv2uGlnmoineBn2p1hxpiUtWm2bERWGiMDIIzmc
         S5x/6fPYd51uRJ4susfgZccxit2wmzbKeMMSc1Ee3LOr1vE32NQvYexQ9zMoHFcsFKy6
         PonStRE2mCbRJtDFRCIhD+kBkTUDA7R5GSy7+GJE1KsZ9atm9VtDPjD5UmKZhEeoA6B+
         O0rPBHnyl1Z/fN0cViyyp+WHEnqJ8UsPQcl2mU+zDvgls2DrLwBt+1WIrRs1zpPAL5cg
         8D9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=4rg/k06agYpeHTMb6VPLMCe1FRP5QhHn6nkrtKzHYyU=;
        b=azLdas4phv1Zh2/JD9+ULLAVA3u/Qztt5VfrDDAXjPwKvKdAxc679wP4dEmxwIo/3X
         teJrlVXCJ0moCkY7e5jYe/7ZrFuwFnaSCnEhHHTXqD5SpFj8naLaEakf38JnkR/4axYm
         hP0NwWpFqnFFlQ1696ikc1gL5MPmECwALi+ySzy/xGeB4f/C8yydmZwqlYa8mAmFKvsC
         8JvVYOaz6YJknu9X77MXyjFwl+wB8f/B998xwD2HsS2AkQP5dnUfkAYx2VOPR41F4df6
         KZl5kCPIg9LOUvZfwosqYNkgThEMh4gxur0TEes6HIP126zG9VPJoEL64Hgq2q9zRTWV
         N8zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hS7ojwrP;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s6si3478540otq.115.2020.01.28.02.36.48;
        Tue, 28 Jan 2020 02:36:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hS7ojwrP;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgA1Kgr (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 28 Jan 2020 05:36:47 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35326 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726360AbgA1Kgr (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 28 Jan 2020 05:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580207806;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4rg/k06agYpeHTMb6VPLMCe1FRP5QhHn6nkrtKzHYyU=;
        b=hS7ojwrPl2KOHOqqDjee8mkf4RRBab7GJVyEbtneiEKg8C/OTueLMFCly4Pyb6rKNivn7b
        Mv/or+DSxg/QiH2JSQsGSWPDHQaTczd0ArzaHsBN67TOk1k1fHqcW6e3uDl+Ll8OwoDuxn
        IqQw36eOocKUgPegUOXNTXKFpLqaL9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-qhqu4rEkMkGvCxNOhUNI6A-1; Tue, 28 Jan 2020 05:36:45 -0500
X-MC-Unique: qhqu4rEkMkGvCxNOhUNI6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92C1E108442A;
        Tue, 28 Jan 2020 10:36:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6B67510027A1;
        Tue, 28 Jan 2020 10:36:38 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 12/14] arm/run: Allow Migration tests
Date:   Tue, 28 Jan 2020 11:34:57 +0100
Message-Id: <20200128103459.19413-13-eric.auger@redhat.com>
In-Reply-To: <20200128103459.19413-1-eric.auger@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: RXHoa/95Wcs0

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
index 99fd315..d8e7745 100644
--- a/lib/arm/io.c
+++ b/lib/arm/io.c
@@ -87,6 +87,34 @@ void puts(const char *s)
 	spin_unlock(&uart_lock);
 }
=20
+static int ____getchar(void)
+{
+	int c;
+
+	spin_lock(&uart_lock);
+	c =3D readb(uart0_base);
+	spin_unlock(&uart_lock);
+
+	return c ? : -1;
+}
+
+/*
+ * Minimalist implementation for migration completion detection.
+ * Without FIFOs enabled on the QEMU UART device we just read
+ * the data register: we cannot read more than 16 characters.
+ */
+int __getchar(void)
+{
+	int c =3D ____getchar();
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
