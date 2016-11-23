Received: by 10.25.150.194 with SMTP id y185csp2659899lfd;
        Wed, 23 Nov 2016 08:54:33 -0800 (PST)
X-Received: by 10.55.48.66 with SMTP id w63mr3516014qkw.294.1479920072936;
        Wed, 23 Nov 2016 08:54:32 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w28si12477070qtw.261.2016.11.23.08.54.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Nov 2016 08:54:32 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08B5CC057FA5;
	Wed, 23 Nov 2016 16:54:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uANGs8Rc001736;
	Wed, 23 Nov 2016 11:54:29 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, marc.zyngier@arm.com, andre.przywara@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org, Peter Xu <peterx@redhat.com>
Subject: [kvm-unit-tests PATCH v7 08/11] libcflat: add IS_ALIGNED() macro, and page sizes
Date: Wed, 23 Nov 2016 17:54:03 +0100
Message-Id: <20161123165406.32661-9-drjones@redhat.com>
In-Reply-To: <20161123165406.32661-1-drjones@redhat.com>
References: <20161123165406.32661-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 23 Nov 2016 16:54:32 +0000 (UTC)
X-TUID: 4hpltUbbEylR

From: Peter Xu <peterx@redhat.com>

These macros will be useful to do page alignment checks.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
[drew: also added SZ_64K and changed to shifts]
Signed-off-by: Andrew Jones <drjones@redhat.com>

---
v6: change to shifts [Alex]
---
 lib/libcflat.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index c3fa4f24c499..bdcc561ccafd 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -33,6 +33,12 @@
 #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
 #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
 #define ALIGN(x, a)		__ALIGN((x), (a))
+#define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
+
+#define SZ_4K			(1 << 12)
+#define SZ_64K			(1 << 16)
+#define SZ_2M			(1 << 21)
+#define SZ_1G			(1 << 30)
 
 typedef uint8_t		u8;
 typedef int8_t		s8;
-- 
2.9.3
