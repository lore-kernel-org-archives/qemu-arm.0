Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp305423lfp;
        Tue, 28 Jan 2020 02:36:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIgIDvxTqbd38TqWkwV5TqW8wOh5hpQES91w7MlV18ofvNCEV6orbtgmLza+QAT4FXn6Ow
X-Received: by 2002:a05:6808:8cd:: with SMTP id k13mr2413413oij.4.1580207780919;
        Tue, 28 Jan 2020 02:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580207780; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3bOpIEDr7ChUx+tee12QKdOJhMps03MAQGv6mZERPoqQ38ZzlFP58RNw3vwCmCldh
         NO1Nhdi4aesR9jD8u3/puhoRfkoK+I+Hl/SYLAgLFUkusZv/lcxHfAacR2iHadh1tHLI
         Fq+DtkabsNY32ktIZ9MVGPATumCKLMeBF2B4nXQJTR7gkEPrxKnHV7KkAxlRb3sRqwHH
         e/ebAy0kBc8viRUFyGidyICRLe+97MHSdr5NmrI0Mo5ZjVwU6fof//xCILzVdAEm4Wpe
         Lea6N57x6otlJ8nBUWoTXZ/yRnck4MgHJtJ6ioNpqfpPvkyiSIHLxcI02EkZAVjYB9rD
         g2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=54NPiD/s7NhXdHaaTgCUqqDcRiDlHdCFtYHnxyYOpT4=;
        b=Jhr/OqGbhUOEZbObL6LhhcA2NLSP8ZtIKmcuYveYeaAs/uUS1e/uffeD2DJUTWi04x
         W8C0UO4T3xgn9ffLSOAi6hMBrZ1DjGuc2sNoGQx3YKoZsqUD9c2v4AkTGJHWDKhqHfZu
         WoOm2eirUZie5Je0k1J1u9K3LvyTnKnO8t4E4T+EG6oWZq28b2ME4Jz/pzUf4ZDhrMvR
         7mmi0F28VHwXUmaGv5YeJ1h89k//a5B3/QL6B3oKLI8Iyyi7Qf/CHn09sc6OlVzDrVVW
         9ECZvRXLV4exFyWoF8NxbhiM09ladeqVZxYWtZc47Hh4nAE745gZV+xd6M+ZtVYgnUGK
         4MVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VfU4+uf0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s6si3478540otq.115.2020.01.28.02.36.20;
        Tue, 28 Jan 2020 02:36:20 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VfU4+uf0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgA1KgT (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 28 Jan 2020 05:36:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52479 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726281AbgA1KgT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 28 Jan 2020 05:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580207778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=54NPiD/s7NhXdHaaTgCUqqDcRiDlHdCFtYHnxyYOpT4=;
        b=VfU4+uf0eGdW8Nsk1hU2aAaus7IH2Br4UmxWhIj22nxKG+nBUN+byu//5H/uG2B/c6Iw+I
        oPYRuWLp0DT5hdH6KLjzi8z6RZj92xrBTNaCAx3sla2wP40OgSaAJZpfvfLq5cMnlD8sQX
        bsq3pnktRa/p/FPblFKkjmbETIIZvK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-rD51XNLdNO2IvgzW0-stYg-1; Tue, 28 Jan 2020 05:36:17 -0500
X-MC-Unique: rD51XNLdNO2IvgzW0-stYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73910100550E;
        Tue, 28 Jan 2020 10:36:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8F6981001B30;
        Tue, 28 Jan 2020 10:36:06 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 08/14] arm/arm64: ITS: its_enable_defaults
Date:   Tue, 28 Jan 2020 11:34:53 +0100
Message-Id: <20200128103459.19413-9-eric.auger@redhat.com>
In-Reply-To: <20200128103459.19413-1-eric.auger@redhat.com>
References: <20200128103459.19413-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: U3PlUNoDNu/B

its_enable_defaults() is the top init function that allocates the
command queue and all the requested tables (device, collection,
lpi config and pending tables), enable LPIs at distributor level
and ITS level.

gicv3_enable_defaults must be called before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- introduce its_setup_baser in this patch
- squash "arm/arm64: ITS: Init the command queue" in this patch.
---
 lib/arm/asm/gic-v3-its.h |  8 ++++
 lib/arm/gic-v3-its.c     | 89 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 815c515..fe73c04 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -36,6 +36,8 @@ struct its_data {
 	void *base;
 	struct its_typer typer;
 	struct its_baser baser[GITS_BASER_NR_REGS];
+	struct its_cmd_block *cmd_base;
+	struct its_cmd_block *cmd_write;
 };
=20
 extern struct its_data its_data;
@@ -88,10 +90,16 @@ extern struct its_data its_data;
 #define GITS_BASER_TYPE_DEVICE		1
 #define GITS_BASER_TYPE_COLLECTION	4
=20
+
+struct its_cmd_block {
+	u64 raw_cmd[4];
+};
+
 extern void its_parse_typer(void);
 extern void its_init(void);
 extern int its_parse_baser(int i, struct its_baser *baser);
 extern struct its_baser *its_lookup_baser(int type);
+extern void its_enable_defaults(void);
=20
 #else /* __arm__ */
=20
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 2c0ce13..d1e7e52 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -86,3 +86,92 @@ void its_init(void)
 		its_parse_baser(i, &its_data.baser[i]);
 }
=20
+static void its_setup_baser(int i, struct its_baser *baser)
+{
+	unsigned long n =3D (baser->nr_pages * baser->psz) >> PAGE_SHIFT;
+	unsigned long order =3D is_power_of_2(n) ? fls(n) : fls(n) + 1;
+	u64 val;
+
+	baser->table_addr =3D (u64)virt_to_phys(alloc_pages(order));
+
+	val =3D ((u64)baser->table_addr					|
+		((u64)baser->type	<< GITS_BASER_TYPE_SHIFT)	|
+		((u64)(baser->esz - 1)	<< GITS_BASER_ENTRY_SIZE_SHIFT)	|
+		((baser->nr_pages - 1)	<< GITS_BASER_PAGES_SHIFT)	|
+		(u64)baser->indirect	<< 62				|
+		(u64)baser->valid	<< 63);
+
+	switch (baser->psz) {
+	case SZ_4K:
+		val |=3D GITS_BASER_PAGE_SIZE_4K;
+		break;
+	case SZ_16K:
+		val |=3D GITS_BASER_PAGE_SIZE_16K;
+		break;
+	case SZ_64K:
+		val |=3D GITS_BASER_PAGE_SIZE_64K;
+		break;
+	}
+
+	writeq(val, gicv3_its_base() + GITS_BASER + i * 8);
+}
+
+/**
+ * init_cmd_queue: Allocate the command queue and initialize
+ * CBASER, CREADR, CWRITER
+ */
+static void its_cmd_queue_init(void)
+{
+	unsigned long n =3D SZ_64K >> PAGE_SHIFT;
+	unsigned long order =3D fls(n);
+	u64 cbaser;
+
+	its_data.cmd_base =3D (void *)virt_to_phys(alloc_pages(order));
+
+	cbaser =3D ((u64)its_data.cmd_base | (SZ_64K / SZ_4K - 1)	| GITS_CBASER=
_VALID);
+
+	writeq(cbaser, its_data.base + GITS_CBASER);
+
+	its_data.cmd_write =3D its_data.cmd_base;
+	writeq(0, its_data.base + GITS_CWRITER);
+}
+
+void its_enable_defaults(void)
+{
+	unsigned int i;
+
+	its_parse_typer();
+
+	/* Allocate BASER tables (device and collection tables) */
+	for (i =3D 0; i < GITS_BASER_NR_REGS; i++) {
+		struct its_baser *baser =3D &its_data.baser[i];
+		int ret;
+
+		ret =3D its_parse_baser(i, baser);
+		if (ret)
+			continue;
+
+		switch (baser->type) {
+		case GITS_BASER_TYPE_DEVICE:
+			baser->valid =3D true;
+			its_setup_baser(i, baser);
+			break;
+		case GITS_BASER_TYPE_COLLECTION:
+			baser->valid =3D true;
+			its_setup_baser(i, baser);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* Allocate LPI config and pending tables */
+	gicv3_lpi_alloc_tables();
+
+	its_cmd_queue_init();
+
+	for (i =3D 0; i < nr_cpus; i++)
+		gicv3_lpi_rdist_ctrl(i, true);
+
+	writel(GITS_CTLR_ENABLE, its_data.base + GITS_CTLR);
+}
--=20
2.20.1
