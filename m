Received: by 10.25.159.131 with SMTP id i125csp1771785lfe;
        Mon, 5 Dec 2016 13:47:22 -0800 (PST)
X-Received: by 10.55.36.149 with SMTP id k21mr51658326qkk.252.1480974442029;
        Mon, 05 Dec 2016 13:47:22 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 22si9884226qto.248.2016.12.05.13.47.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Dec 2016 13:47:22 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 292CFC05AA48;
	Mon,  5 Dec 2016 21:47:21 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-120.ams2.redhat.com [10.36.4.120])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB5LksKZ019596;
	Mon, 5 Dec 2016 16:47:17 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, drjones@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org
Cc: andre.przywara@arm.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
        pbonzini@redhat.com
Subject: [kvm-unit-tests RFC 05/15] arm/arm64: GICv3: add cpu count
Date: Mon,  5 Dec 2016 22:46:36 +0100
Message-Id: <1480974406-29345-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 05 Dec 2016 21:47:21 +0000 (UTC)
X-TUID: DUWQjDFhdzK6

Add a new cpu_count field in gicv3_data indicating the
number of redistributors. This will be useful for enumeration
of their resources such as LPI pending tables.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/arm/asm/gic-v3.h | 1 +
 lib/arm/gic-v3.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index ed330af..039b7c2 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -58,6 +58,7 @@ struct gicv3_data {
 	void *dist_base;
 	void *redist_base[NR_CPUS];
 	unsigned int irq_nr;
+	unsigned int cpu_count;
 };
 extern struct gicv3_data gicv3_data;
 
diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
index 6246221..9921f4d 100644
--- a/lib/arm/gic-v3.c
+++ b/lib/arm/gic-v3.c
@@ -12,12 +12,14 @@ void gicv3_set_redist_base(size_t stride)
 	void *ptr = gicv3_data.redist_base[0];
 	u64 typer;
 
+	gicv3_data.cpu_count = 0;
 	do {
 		typer = gicv3_read_typer(ptr + GICR_TYPER);
 		if ((typer >> 32) == aff) {
 			gicv3_redist_base() = ptr;
 			return;
 		}
+		gicv3_data.cpu_count++;
 		ptr += stride; /* skip RD_base, SGI_base, etc. */
 	} while (!(typer & GICR_TYPER_LAST));
 
-- 
2.5.5
