Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp848282lfc;
        Tue, 10 Mar 2020 07:55:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs0xvQy37YyGvthAOdlGakhSsBGxSBfOBzsexGlC5j2ydp7uRMgWe0AhEQGb5YHNFObTIoP
X-Received: by 2002:aca:ef08:: with SMTP id n8mr1381467oih.115.1583852101492;
        Tue, 10 Mar 2020 07:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852101; cv=none;
        d=google.com; s=arc-20160816;
        b=G27EJfJd0yvVTDToUAg29e4V2zbFl1zOOX9v4+c6j2mJw9dHePLxcxjBXhzrO5f56V
         pN34b9/ybZ7UI0eb3Mx+mxkfa7mGYPpXGi/tXa6mEa4OP8e+jnlrhJsA14CjPYCm4v8Y
         jD7RPJr1AhcXWf8Gy5hH27Tl4XjSsSjHN7LSowbELSBi5kXUAKTTqK2Lq46BFeDJpliw
         9VWYUn81MF12sq1bFerVdK2tpWrt2OCzuNUphOqUIgg0Q39E7bnzUzJSYtzn5HPsDNXS
         GaKRGKsv17mxShtXZMZYZ7IiyvA6a9tNPmA32CwUq7Q/vJNxdYUUguj+K8zW0G4FY8gQ
         6f/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=rMMqzIlomdRTmib0wLnFox/FP64dO+1/TcqycOnCcSk=;
        b=iM18jpi8Tp2wg8BPfm+Uz42fFyZCeljuuy5FgjU/3gV8nSRZCC2nkAe3S+1u5fIW2z
         UJqlwmxj6vnAAhQwzdkjxz9RhyW3jFgj/50EyePT5w+ymOsITAC+mmLcf/mtIMGknI5M
         pThEZjgFMxpjffIMCiDTz4AJNDJ8PmxcCXASOMJrGryLxDfvXwDC2BcypzngAAamXrDz
         sPseyaY7Wnns14RFTcanQ9EfjLJuiASklVWjtOuxrO/5CrugNkm8mgJyKARbzlWT6Leu
         omAOgzU8LmMSa9aWbYJ57IqgqxOvvjIZXi4uOg5yNbFgpmD+HRJ6sAvd+ZmlZ4rTxjew
         cTeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hginzynd;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id i7si5431916oth.143.2020.03.10.07.55.01;
        Tue, 10 Mar 2020 07:55:01 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hginzynd;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbgCJOzA (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 10 Mar 2020 10:55:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38985 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727635AbgCJOzA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 10 Mar 2020 10:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583852098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rMMqzIlomdRTmib0wLnFox/FP64dO+1/TcqycOnCcSk=;
        b=hginzyndcbbnOPTN9mFp1WkDZRb/IuW360B9huu6lzo6/9/iVlFnjfTYaSKiWd1+7MgnXK
        3tpRXB0ONK0J7QmEbXo9MivYQ+qq0P+O/0jAGai8oizxs9l7zqTcR/hV/SL0Jxq1+nfbaw
        I8cz087/NY1e5KwYMSapca739Mfs1iU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6--qdor9Y7MdmWAlWpHiq8sg-1; Tue, 10 Mar 2020 10:54:57 -0400
X-MC-Unique: -qdor9Y7MdmWAlWpHiq8sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53A131005509;
        Tue, 10 Mar 2020 14:54:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-85.ams2.redhat.com [10.36.117.85])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A51F560BF3;
        Tue, 10 Mar 2020 14:54:50 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v5 07/13] arm/arm64: ITS: its_enable_defaults
Date:   Tue, 10 Mar 2020 15:54:04 +0100
Message-Id: <20200310145410.26308-8-eric.auger@redhat.com>
In-Reply-To: <20200310145410.26308-1-eric.auger@redhat.com>
References: <20200310145410.26308-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zTsFf1IjWKST

its_enable_defaults() enable LPIs at distributor level
and ITS level.

gicv3_enable_defaults must be called before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v5:
- some reformattings moved to earlier patch
- add assert(!gicv3_redist_base()) in alloc_lpi_tables()
- revert the usage of for_each_present_cpu()

v3 -> v4:
- use GITS_BASER_INDIRECT & GITS_BASER_VALID in its_setup_baser()
- don't parse BASERs again in its_enable_defaults
- rename its_setup_baser into its_baser_alloc_table
- All allocations moved to the init function
- squashed "arm/arm64: gicv3: Enable/Disable LPIs at re-distributor level=
"
  into this patch
- introduce gicv3_lpi_rdist_enable and gicv3_lpi_rdist_disable
- pend and prop table bases stored as virt addresses
- move some init functions from enable() to its_init
- removed GICR_PROPBASER_IDBITS_MASK
- introduced LPI_OFFSET
- lpi_prop becomes u8 *
- gicv3_lpi_set_config/get_config became macro
- renamed gicv3_lpi_set_pending_table_bit into gicv3_lpi_set_clr_pending

v2 -> v3:
- introduce its_setup_baser in this patch
- squash "arm/arm64: ITS: Init the command queue" in this patch.
---
 lib/arm/asm/gic-v3.h       | 13 +++++++++++++
 lib/arm/gic-v3.c           | 25 +++++++++++++++++++++++++
 lib/arm64/asm/gic-v3-its.h |  1 +
 lib/arm64/gic-v3-its.c     | 13 +++++++++++++
 4 files changed, 52 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index 064cc68..d2fd5ab 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -59,6 +59,10 @@
 #define LPI_PROP_DEFAULT_PRIO		0xa0
 #define LPI_PROP_DEFAULT		(LPI_PROP_DEFAULT_PRIO | LPI_PROP_GROUP1 | LPI=
_PROP_ENABLED)
=20
+#define LPI_ID_BASE			8192
+#define LPI(lpi)			((lpi) + LPI_ID_BASE)
+#define LPI_OFFSET(intid)		((intid) - LPI_ID_BASE)
+
 #include <asm/arch_gicv3.h>
=20
 #ifndef __ASSEMBLY__
@@ -97,6 +101,8 @@ extern void gicv3_lpi_set_config(int n, u8 val);
 extern u8 gicv3_lpi_get_config(int n);
 extern void gicv3_lpi_set_clr_pending(int rdist, int n, bool set);
 extern void gicv3_lpi_alloc_tables(void);
+extern void gicv3_lpi_rdist_enable(int redist);
+extern void gicv3_lpi_rdist_disable(int redist);
=20
 static inline void gicv3_do_wait_for_rwp(void *base)
 {
@@ -142,5 +148,12 @@ static inline u64 mpidr_uncompress(u32 compressed)
 	return mpidr;
 }
=20
+#define gicv3_lpi_set_config(intid, value) ({		\
+	gicv3_data.lpi_prop[LPI_OFFSET(intid)] =3D value; \
+})
+
+#define gicv3_lpi_get_config(intid) (gicv3_data.lpi_prop[LPI_OFFSET(inti=
d)])
+
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_H_ */
diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
index d752bd4..a1302d1 100644
--- a/lib/arm/gic-v3.c
+++ b/lib/arm/gic-v3.c
@@ -199,4 +199,29 @@ void gicv3_lpi_set_clr_pending(int rdist, int n, boo=
l set)
 		byte &=3D ~mask;
 	*ptr =3D byte;
 }
+
+static void gicv3_lpi_rdist_ctrl(u32 redist, bool set)
+{
+	void *ptr;
+	u64 val;
+
+	assert(redist < nr_cpus);
+
+	ptr =3D gicv3_data.redist_base[redist];
+	val =3D readl(ptr + GICR_CTLR);
+	if (set)
+		val |=3D GICR_CTLR_ENABLE_LPIS;
+	else
+		val &=3D ~GICR_CTLR_ENABLE_LPIS;
+	writel(val,  ptr + GICR_CTLR);
+}
+
+void gicv3_lpi_rdist_enable(int redist)
+{
+	gicv3_lpi_rdist_ctrl(redist, true);
+}
+void gicv3_lpi_rdist_disable(int redist)
+{
+	gicv3_lpi_rdist_ctrl(redist, false);
+}
 #endif /* __aarch64__ */
diff --git a/lib/arm64/asm/gic-v3-its.h b/lib/arm64/asm/gic-v3-its.h
index 331ba0e..1e95977 100644
--- a/lib/arm64/asm/gic-v3-its.h
+++ b/lib/arm64/asm/gic-v3-its.h
@@ -88,5 +88,6 @@ extern struct its_data its_data;
 extern void its_parse_typer(void);
 extern void its_init(void);
 extern int its_baser_lookup(int i, struct its_baser *baser);
+extern void its_enable_defaults(void);
=20
 #endif /* _ASMARM64_GIC_V3_ITS_H_ */
diff --git a/lib/arm64/gic-v3-its.c b/lib/arm64/gic-v3-its.c
index 4c9c0db..c431f31 100644
--- a/lib/arm64/gic-v3-its.c
+++ b/lib/arm64/gic-v3-its.c
@@ -97,3 +97,16 @@ void its_init(void)
 	its_cmd_queue_init();
 }
=20
+/* must be called after gicv3_enable_defaults */
+void its_enable_defaults(void)
+{
+	int i;
+
+	/* Allocate LPI config and pending tables */
+	gicv3_lpi_alloc_tables();
+
+	for (i =3D 0; i < nr_cpus; i++)
+		gicv3_lpi_rdist_enable(i);
+
+	writel(GITS_CTLR_ENABLE, its_data.base + GITS_CTLR);
+}
--=20
2.20.1
