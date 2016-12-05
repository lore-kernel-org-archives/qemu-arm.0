Received: by 10.25.159.131 with SMTP id i125csp1771938lfe;
        Mon, 5 Dec 2016 13:47:50 -0800 (PST)
X-Received: by 10.200.35.105 with SMTP id b38mr52337953qtb.28.1480974470210;
        Mon, 05 Dec 2016 13:47:50 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n3si9886550qta.222.2016.12.05.13.47.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:50 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 403358AE72;
	Mon,  5 Dec 2016 21:47:49 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKg019596;
	Mon, 5 Dec 2016 16:47:45 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 12/15] arm/arm64: ITS: create collection
Date: Mon,  5 Dec 2016 22:46:43 +0100
Message-Id: <1480974406-29345-13-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 05 Dec 2016 21:47:49 +0000 (UTC)
X-TUID: IrUf8VOdU2qc

Helper function to create a collection, characterized by its
collection id and the target address. Currently the number of
collections cannot exceed the number of redistributors.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 lib/arm/asm/gic-v3-its.h |  1 +
 lib/arm/gic-v3-its.c     | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
index 31589d6..af82b32 100644
--- a/lib/arm/asm/gic-v3-its.h
+++ b/lib/arm/asm/gic-v3-its.h
@@ -190,6 +190,7 @@ extern void its_setup_baser(int i, struct its_baser *baser);
 extern void enable_lpi(u32 redist);
 extern void its_enable_defaults(void);
 extern struct its_device *its_create_device(u32 dev_id, int nvecs);
+extern struct its_collection *its_create_collection(u32 col_id, u32 target);
 
 
 #endif /* !__ASSEMBLY__ */
diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
index c230959..1b50fc5 100644
--- a/lib/arm/gic-v3-its.c
+++ b/lib/arm/gic-v3-its.c
@@ -286,3 +286,20 @@ struct its_device *its_create_device(u32 device_id, int nvecs)
 	its_data.nb_devices++;
 	return new;
 }
+
+struct its_collection *its_create_collection(u32 col_id, u32 pe)
+{
+	if (col_id >= gicv3_data.cpu_count)
+		report_abort("%s coll_id=%d >= cpu_count %d\n",
+			      __func__, col_id, gicv3_data.cpu_count);
+
+	if (its_data.typer.pta)
+		its_data.collections[col_id].target_address =
+			(u64)gicv3_data.redist_base[pe];
+	else
+		its_data.collections[col_id].target_address = pe << 16;
+
+	its_data.collections[col_id].col_id = col_id;
+
+	return &its_data.collections[col_id];
+}
-- 
2.5.5
