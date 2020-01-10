Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp794860lff;
        Fri, 10 Jan 2020 06:55:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqxa6rU+cEw76JIeg9oqnOcLYpT/8KHjIGJauFKOVLFbE5n58m23+h4mt8XRBc5VLbvldYsk
X-Received: by 2002:aca:2407:: with SMTP id n7mr2602634oic.14.1578668114645;
        Fri, 10 Jan 2020 06:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668114; cv=none;
        d=google.com; s=arc-20160816;
        b=te4EgdNPRni1cSPByddnnO4hVE++Ozqh2e/hTb+EdKEofBP/FvxEHCvcvxIXZ5u20a
         eY07gPo6pAnjZPEGWSPOSD9SXOSBORmHglpypV9R7PWNa8MvRVqvhoBu7126rFT2WglY
         EgzsICUpXhDg0w60TNOFrlArPH1ryWV1QfRr4JMOpIhgCvIsAB08VPDER6oiCJbKenT3
         iJBiRHyfdLFucCOz6YydNP2ev0n4oXdmLdRxUkvH4InOeCoBakrFx8eaY0OuN7xN0+uZ
         xn+oZ/GzgdO1ODnWWHNgTnVXE4ON1erau7nJgxPVCKrqWd95aGpSQEYx6RsqqCH9t1wB
         xGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=gBKAcnxc2MYZzCoP970ndMhL3JY30iNVMqi2oK57oys=;
        b=rvhxVS/Six4VZL4CLWb+VI3icd/1hnpjjMhZ26Zl5PxLdtl+e5lfoiS97oGE+HPTv+
         adj7SRvo2FDo19yYiqvtExv6uhW7hTd9p0JVTJQAF++Jj+a6hgZHEPRyoj8vjqMgcp8M
         WGB3uVS++dvi//LEnGMtWImoTnx2SitRnuIRJqZv3sfpU5IxQDKr/VOB5rsmxRkNg4VU
         XnR4SLhKsl/4nuZgHgJEQUH1IdT0J2yTQ7h+/FCjWop3MPEasJg49IexTtQ1JEFdpGJ0
         ROJldp19UVYwHwjXzw3uwPEu3vJr1DM1Bl0E6D4pq6J6LdmMMMKz6xEgsQ2WYTot5WtB
         Qckw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNJzlCon;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n6si1558887otf.246.2020.01.10.06.55.14;
        Fri, 10 Jan 2020 06:55:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RNJzlCon;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgAJOzN (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 10 Jan 2020 09:55:13 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48584 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728422AbgAJOzM (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 10 Jan 2020 09:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578668111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gBKAcnxc2MYZzCoP970ndMhL3JY30iNVMqi2oK57oys=;
        b=RNJzlConDDNJyLKfAVOIcB28NlVTMKWNNfwAP1WZ9wxnoAS9E+xe4A9SndEUoZx3SrHtBW
        HUvjkqVQauMzL0NSNQSYT9lpbCeb9X97jCr4IEFZjEBFGVT4HAGPioUP7LzCdRCRFifDzG
        yxbNrCcpHsD8lwvicvKTmzrFHqIvYkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-JQMSqK-yNEazhUrjO_r2Cg-1; Fri, 10 Jan 2020 09:55:10 -0500
X-MC-Unique: JQMSqK-yNEazhUrjO_r2Cg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 841A6108838E;
        Fri, 10 Jan 2020 14:55:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5DB427BA5F;
        Fri, 10 Jan 2020 14:54:59 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 09/16] arm/arm64: ITS: Enable/Disable LPIs at re-distributor level
Date:   Fri, 10 Jan 2020 15:54:05 +0100
Message-Id: <20200110145412.14937-10-eric.auger@redhat.com>
In-Reply-To: <20200110145412.14937-1-eric.auger@redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: wTto/qXDECNR

This helper function enables or disables the signaling of LPIs
at redistributor level.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3-its.h |  1 +
 lib/arm/gic-v3-its.c     | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 93814f7..d2db292 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -99,6 +99,7 @@ extern struct its_baser *its_lookup_baser(int type);
 extern void set_lpi_config(int n, u8 val);
 extern u8 get_lpi_config(int n);
 extern void set_pending_table_bit(int rdist, int n, bool set);
+extern void gicv3_rdist_ctrl_lpi(u32 redist, bool set);
=20
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMARM_GIC_V3_ITS_H_ */
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 3037c84..c7c6f80 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -199,3 +199,21 @@ void init_cmd_queue(void)
 	its_data.cmd_write =3D its_data.cmd_base;
 	writeq(0, its_data.base + GITS_CWRITER);
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
