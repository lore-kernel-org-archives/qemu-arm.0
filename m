Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp794650lff;
        Fri, 10 Jan 2020 06:55:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxtzwk/WTF3kUdnZf6PtVtI21sJoYbESQm7MWzEIcadz+YDcrp/2KXRvwSQq27YuP/MF21G
X-Received: by 2002:a9d:7757:: with SMTP id t23mr3077494otl.315.1578668105340;
        Fri, 10 Jan 2020 06:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668105; cv=none;
        d=google.com; s=arc-20160816;
        b=AK8LaF2tIbGhCyHtobDfjxlM5uDxJVCzW/zVkZqoMzManRqnqkVik4/8eRt7nmfWtk
         CM/EvZVsOlYfCjyXqSQ50kHZu/01+8fVhbwbDsUJP2x0fzNmcVjxe4U3RY/SQ12w/o8N
         80CfULyiMi0K1Mn+8Rru2S3XHRKA+NYL9BzgVc0vRIFhColKR/29C7LgX9nJPGGAxto4
         hZGLyDwmk77FvFx4M+H+TgjQB7aLeRxtEnAgHRlVFsm3IAPGnAjn2wwNa5Nj89m3oSr6
         NC9wc3JAUEViMEftrI7kXfSympeLtvgn3UHs3GCBjv2sar6U4Vc2cBEX25WkkfF/AFZI
         IzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=uDvgNibxatEEV/F+WDrLb9KYif/63RzRdW4qJaHm4B8=;
        b=GVUHjvWnQYDIHO/uDLfWPjKgv92GJ0L/B93PSkQKGUJqGaqhviuUZiXx0CNo/2HUuU
         5QtridgSHpZwkwEJzdEWpol0nnmCpttAp8e4HFML3n5n/Q8/dt1kA1YcmxfwP7D2Fe9X
         jhkNUg47wxTEStaNQnB7zDBu8DBrXD3BciLml7ikq9zh98mCoBUNml56ml7GyBYRgnTj
         WzlXxGvSyl3IGRpu6oErKmieAJ8hifiHedifujdVRnRcO87Cfuz1tuf0zFNRM3RFn56C
         4t20vDnWqfEeK6ZnMJcGhapOsR+9BvZveRMeJNuudZ7tfY06zFHsdCl/lmqB1sh2DRbE
         pMMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K8BdgWup;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c2si1266985oig.255.2020.01.10.06.55.05;
        Fri, 10 Jan 2020 06:55:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K8BdgWup;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbgAJOzD (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 10 Jan 2020 09:55:03 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52228 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728422AbgAJOzC (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 10 Jan 2020 09:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578668101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uDvgNibxatEEV/F+WDrLb9KYif/63RzRdW4qJaHm4B8=;
        b=K8BdgWuptBdYE63G3iqJD0xUVK+55fFiMNY3cb5QeXGzqdkHoCtTuOnMup+u/NfdX++aZ0
        6BxadmuhF1hyPkRzRughHJguWLS2MMb5Sr3MWZZLj/AOaaUDP3CHeqvVVam+SgH8yDbiLZ
        53cpcB3Zb7g6D/0UDY4+bekf/uzlqDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-DYg8o0oeNLOx-mCafe7VpQ-1; Fri, 10 Jan 2020 09:55:00 -0500
X-MC-Unique: DYg8o0oeNLOx-mCafe7VpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 068151085984;
        Fri, 10 Jan 2020 14:54:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 989097BA5F;
        Fri, 10 Jan 2020 14:54:53 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 08/16] arm/arm64: ITS: Init the command queue
Date:   Fri, 10 Jan 2020 15:54:04 +0100
Message-Id: <20200110145412.14937-9-eric.auger@redhat.com>
In-Reply-To: <20200110145412.14937-1-eric.auger@redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: umcYGwFs+8r5

Allocate the command queue and initialize related registers:
CBASER, CREADR, CWRITER.

The command queue is 64kB. This aims at not bothing with fullness.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- removed readr
---
 lib/arm/asm/gic-v3-its.h |  6 ++++++
 lib/arm/gic-v3-its.c     | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 2f8b8f1..93814f7 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -75,10 +75,16 @@ struct its_baser {
 	int esz;
 };
=20
+struct its_cmd_block {
+	u64     raw_cmd[4];
+};
+
 struct its_data {
 	void *base;
 	struct its_typer typer;
 	struct its_baser baser[GITS_BASER_NR_REGS];
+	struct its_cmd_block *cmd_base;
+	struct its_cmd_block *cmd_write;
 };
=20
 extern struct its_data its_data;
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index 6c97569..3037c84 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -177,3 +177,25 @@ void set_pending_table_bit(int rdist, int n, bool se=
t)
 		byte &=3D ~mask;
 	*ptr =3D byte;
 }
+
+/**
+ * init_cmd_queue: Allocate the command queue and initialize
+ * CBASER, CREADR, CWRITER
+ */
+void init_cmd_queue(void);
+void init_cmd_queue(void)
+{
+	unsigned long n =3D SZ_64K >> PAGE_SHIFT;
+	unsigned long order =3D fls(n);
+	u64 cbaser;
+
+	its_data.cmd_base =3D (void *)virt_to_phys(alloc_pages(order));
+
+	cbaser =3D ((u64)its_data.cmd_base | (SZ_64K / SZ_4K - 1)	|
+			GITS_CBASER_VALID);
+
+	writeq(cbaser, its_data.base + GITS_CBASER);
+
+	its_data.cmd_write =3D its_data.cmd_base;
+	writeq(0, its_data.base + GITS_CWRITER);
+}
--=20
2.20.1
