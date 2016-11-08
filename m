Received: by 10.25.150.194 with SMTP id y185csp1782521lfd;
        Tue, 8 Nov 2016 12:22:07 -0800 (PST)
X-Received: by 10.55.200.27 with SMTP id c27mr13735168qkj.276.1478636527083;
        Tue, 08 Nov 2016 12:22:07 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w77si3944767qkb.124.2016.11.08.12.22.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Nov 2016 12:22:07 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx09.intmail.prod.int.phx2.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C993BC075677;
	Tue,  8 Nov 2016 20:22:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uA8KLfUH000643;
	Tue, 8 Nov 2016 15:22:03 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: pbonzini@redhat.com, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
        christoffer.dall@linaro.org, Peter Xu <peterx@redhat.com>,
        Andrew Jones <drjones@redhat.com>
Subject: [kvm-unit-tests PATCH v4 08/11] libcflat: add IS_ALIGNED() macro, and page sizes
Date: Tue,  8 Nov 2016 21:21:36 +0100
Message-Id: <1478636499-14339-9-git-send-email-drjones@redhat.com>
In-Reply-To: <1478636499-14339-1-git-send-email-drjones@redhat.com>
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 08 Nov 2016 20:22:05 +0000 (UTC)
X-TUID: 7iIb/sR/zJNF

From: Peter Xu <peterx@redhat.com>

These macros will be useful to do page alignment checks.

Signed-off-by: Peter Xu <peterx@redhat.com>
[drew: also added SZ_64K]
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/libcflat.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index 82005f5d014f..143fc53061fe 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -33,6 +33,12 @@
 #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
 #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
 #define ALIGN(x, a)		__ALIGN((x), (a))
+#define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) == 0)
+
+#define SZ_4K			(0x1000)
+#define SZ_64K			(0x10000)
+#define SZ_2M			(0x200000)
+#define SZ_1G			(0x40000000)
 
 typedef uint8_t		u8;
 typedef int8_t		s8;
-- 
2.7.4
