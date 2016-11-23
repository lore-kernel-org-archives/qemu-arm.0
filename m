Received: by 10.25.150.194 with SMTP id y185csp2659742lfd;
        Wed, 23 Nov 2016 08:54:14 -0800 (PST)
X-Received: by 10.55.91.193 with SMTP id p184mr3465955qkb.301.1479920054612;
        Wed, 23 Nov 2016 08:54:14 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 37si12465623qtw.58.2016.11.23.08.54.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Nov 2016 08:54:14 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B83A564C0;
	Wed, 23 Nov 2016 16:54:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uANGs8RV001736;
	Wed, 23 Nov 2016 11:54:11 -0500
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, marc.zyngier@arm.com, andre.przywara@arm.com,
        eric.auger@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
        christoffer.dall@linaro.org
Subject: [kvm-unit-tests PATCH v7 01/11] lib: xstr: allow multiple args
Date: Wed, 23 Nov 2016 17:53:56 +0100
Message-Id: <20161123165406.32661-2-drjones@redhat.com>
In-Reply-To: <20161123165406.32661-1-drjones@redhat.com>
References: <20161123165406.32661-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 23 Nov 2016 16:54:13 +0000 (UTC)
X-TUID: w5jP47DZjEJw

Make implementation equivalent to Linux's include/linux/stringify.h

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/libcflat.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index c622198677c1..c3fa4f24c499 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -27,8 +27,8 @@
 
 #define __unused __attribute__((__unused__))
 
-#define xstr(s) xxstr(s)
-#define xxstr(s) #s
+#define xstr(s...) xxstr(s)
+#define xxstr(s...) #s
 
 #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
 #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)
-- 
2.9.3
