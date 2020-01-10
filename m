Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp794934lff;
        Fri, 10 Jan 2020 06:55:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXSh/RQKQnaf9cMA0Yj6pe00SEcxGf4+48kgNrGDi0A3yxg1pzgrMK3VlUoCBWhQ5/t+sJ
X-Received: by 2002:a9d:6b91:: with SMTP id b17mr2968597otq.321.1578668117377;
        Fri, 10 Jan 2020 06:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668117; cv=none;
        d=google.com; s=arc-20160816;
        b=Ox93MN6E8DRhTN162woS8SElCGS2qEDwXVTbBBOtnsPTj/ePNH3apw5dJUHXz0vsVq
         UYtaAczTPBS9bJWZGMLp8yIwUoZXWINgLgZVQfvTpnqZwY6zZKbKDSZ4w4yOhzhr4u4G
         trNwWswYE3Zo+UmUcIM+DSROhqLlBeA5wQte47WD3GwgXnvVu08yfNQmoAEu2cpb2krC
         mq6r2FwFhlw7YBjI6jmk3OyuqotLW3RfjHZxtlcqY4y1r/QgGIM8+dZJJ+bq72C5lYXE
         OHKjQA0AP4tGHN3MMqB2Cflg1osOpsLdr2suVy9lo59V8/BoIeimULpU+MHxlKb3NB5B
         lVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=A9N2aRoAuhJExNcXHHKcgXxx/GMzDOlebGq7Fw5BkDk=;
        b=J6+E5+Cka+H0OU5cYsFpM4ZIuNouc7TZiffHsZ0rCpwB4DjZK6L8b9Y7CoBSSIaKfW
         NB8rLylzJfKa+UZgvThEiyJH8bOcC2pEmKI6DCm03vQVLxaiLQ0WQbLaZDXe+A5P1AgX
         q9bNe1EBRLTAbXbdA1rJExcyc9gGM8eq4BA9FyifZ97x8I5WdLLi3pF3IdUpsLKtqs/j
         u9PXu3nwio1cEOxYaGgQxc39nDZCs0QQWS/jf0vaH3M+AZ/6ueAmaPbOCL7MzJFMnw1s
         BvJlCsEIZvddakWzempsjRV8XPsC+MAreh++Z+F/akqWbDCduTe95SdZeF+W+T39Eux7
         s5DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T++sQJcY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n6si1558887otf.246.2020.01.10.06.55.17;
        Fri, 10 Jan 2020 06:55:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T++sQJcY;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgAJOzQ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 10 Jan 2020 09:55:16 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24304 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727363AbgAJOzP (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 10 Jan 2020 09:55:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578668114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A9N2aRoAuhJExNcXHHKcgXxx/GMzDOlebGq7Fw5BkDk=;
        b=T++sQJcYvd6/4QW72EImRHQF1qU08x/Q92C75XduFj0EAD1fLR7IcXZ4xoI/q+Fi9rKieS
        wjzf2ATHJR440JM8SdI1Y0w9xt8q3Zw8OqBMVfbIBVN0TEkenDZ5Ok9vChIm8f0m/RYHEd
        C0TO78eU7Ny6s4yce+MNGoD2fVNmC8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-ePoRKuSlMn2JcuCbsgeOXA-1; Fri, 10 Jan 2020 09:55:13 -0500
X-MC-Unique: ePoRKuSlMn2JcuCbsgeOXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D690318C43CF;
        Fri, 10 Jan 2020 14:55:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC5647C3E2;
        Fri, 10 Jan 2020 14:55:07 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 10/16] arm/arm64: ITS: its_enable_defaults
Date:   Fri, 10 Jan 2020 15:54:06 +0100
Message-Id: <20200110145412.14937-11-eric.auger@redhat.com>
In-Reply-To: <20200110145412.14937-1-eric.auger@redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Cu4h4ZueKsh0

its_enable_defaults() is the top init function that allocates all
the requested tables (device, collection, lpi config and pending
tables), enable LPIs at distributor level and ITS level.

gicv3_enable_defaults must be called before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3-its.h |  1 +
 lib/arm/gic-v3-its.c     | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index d2db292..0e31848 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -100,6 +100,7 @@ extern void set_lpi_config(int n, u8 val);
 extern u8 get_lpi_config(int n);
 extern void set_pending_table_bit(int rdist, int n, bool set);
 extern void gicv3_rdist_ctrl_lpi(u32 redist, bool set);
+extern void its_enable_defaults(void);
=20
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_ITS_H_ */
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index c7c6f80..f488cca 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -217,3 +217,43 @@ void gicv3_rdist_ctrl_lpi(u32 redist, bool set)
 		val &=3D ~GICR_CTLR_ENABLE_LPIS;
 	writel(val,  ptr + GICR_CTLR);
 }
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
+	alloc_lpi_tables();
+
+	init_cmd_queue();
+
+	for (i =3D 0; i < nr_cpus; i++)
+		gicv3_rdist_ctrl_lpi(i, true);
+
+	writel(GITS_CTLR_ENABLE, its_data.base + GITS_CTLR);
+}
--=20
2.20.1
