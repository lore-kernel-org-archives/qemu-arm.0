Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4583227lff;
        Mon, 16 Dec 2019 06:04:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqyr1ugBRHUVulwl38PpHwVBb/50LHnzrYR88UHSR6EzDrWlJJ8qKGGcYx1Sbsp2OOZ6zvdO
X-Received: by 2002:aca:d7c6:: with SMTP id o189mr9057822oig.130.1576505056104;
        Mon, 16 Dec 2019 06:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576505056; cv=none;
        d=google.com; s=arc-20160816;
        b=oHHtqlgFjGeuYFNX2jKpZgoyC5/e5B8Cjo9yHw/sQP8+WxZqBLvhBCsF4e80rxhsC/
         D8ol/J/9arf+88w4u5P4eguuHBq4QioJt2kN4GqPJuEmoUPbfwJcrYnq1VowGP3UOHLL
         W+oA6wn3MnKpSHw+ovacMzJ+ZEvh0JyMflc4TC1uqpAdgjNWKyi1HEDW2m0dsShUsVbm
         /XLFyf1vavEJLei7svEPLmnXZQzjNTOHzqY9IG3xVJkq79Q37mw4lNxIeYMAmuwU42FW
         QFwbheasVXh8jEWT0SFG6qSuNVzQRbqZoamjBgdzl0ozoeB5ThEw1BLCpu1EciC0wtEq
         9UAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=OCRQ/pdsIh4TpbiB2k9WKBIlHq8frf2VL5aV01rBiHQ=;
        b=aYuS/FTHP2fEKWZh2KdJR33Boo2e4rvq8OgOvWeMw+UutLDadEpJyMO6UeLroy4bCJ
         oQ1Jif1Su54QTHWgGuqsj3KCKm+511q1JhC/qOxOtYSiarCPQniQah/yCh3OQeF/wXpd
         4L6NKeLItpjvyGsNg7qqR030/VXBZORR1h+McaAWIsjzwo/sz05UtYz7JOOaAfnBXt8o
         vWJcV81ztxFifCEg1iqjdntNHPHe1Q9LhPGaJqn+TcYHxM1aXz2CdVzILi/Cy2K2/xTo
         gh6B5Ng3H1fKheJVCDwfOrzajSycUmGXCu7jWIZClpM8so7EI16Dp3VZbY5UUi8/UwNO
         ESwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eHhVD94O;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d5si10196620oij.139.2019.12.16.06.04.15;
        Mon, 16 Dec 2019 06:04:16 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eHhVD94O;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbfLPOEP (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 09:04:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44195 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727965AbfLPOEO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 09:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576505053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OCRQ/pdsIh4TpbiB2k9WKBIlHq8frf2VL5aV01rBiHQ=;
        b=eHhVD94OqnPQ/aKluQHF3Q743GPiau8yLs+1UY6ZGrXBoX0zFkHsn9bbjeV+ESfCBoSxnk
        CfzFafFqLJ19sjc7wXJ7yEiot7cOOEcaWe+2P8uvSAp6uJvZ4x3u5g49OLuj8DJ+Hg2z82
        nIT+D1/a+yOmeqPEhmY95sHNvvAm2vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-d9quq6-aOwC9kim1AWnO3A-1; Mon, 16 Dec 2019 09:04:12 -0500
X-MC-Unique: d9quq6-aOwC9kim1AWnO3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85EBD1809A43;
        Mon, 16 Dec 2019 14:04:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 72116675B8;
        Mon, 16 Dec 2019 14:04:07 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH 09/16] arm/arm64: ITS: Enable/Disable LPIs at re-distributor level
Date:   Mon, 16 Dec 2019 15:02:28 +0100
Message-Id: <20191216140235.10751-10-eric.auger@redhat.com>
In-Reply-To: <20191216140235.10751-1-eric.auger@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Ga+k9oBURJCo

This helper function enables or disables the signaling of LPIs
at redistributor level.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3-its.h |  1 +
 lib/arm/gic-v3-its.c     | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index ed42707..d56a17f 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -138,6 +138,7 @@ extern struct its_baser *its_lookup_baser(int type);
 extern void set_lpi_config(int n, u8 val);
 extern u8 get_lpi_config(int n);
 extern void set_pending_table_bit(int rdist, int n, bool set);
+extern void gicv3_rdist_ctrl_lpi(u32 redist, bool set);
=20
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_ITS_H_ */
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 8b6a095..b0f7714 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -225,3 +225,21 @@ void init_cmd_queue(void)
 	writeq(0, its_data.base + GITS_CWRITER);
 	writeq(0, its_data.base + GITS_CREADR);
 }
+
+void gicv3_rdist_ctrl_lpi(u32 redist, bool set)
+{
+	void *ptr;
+	u64 val;
+
+	if (redist >=3D nr_cpus)
+		report_abort("%s redist=3D%d >=3D cpu_count=3D%d\n",
+			     __func__, redist, nr_cpus);
+
+	ptr =3D gicv3_data.redist_base[redist];
+	val =3D readl(ptr + GICR_CTLR);
+	if (set)
+		val |=3D GICR_CTLR_ENABLE_LPIS;
+	else
+		val &=3D ~GICR_CTLR_ENABLE_LPIS;
+	writel(val,  ptr + GICR_CTLR);
+}
--=20
2.20.1
