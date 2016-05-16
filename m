Received: by 10.25.208.137 with SMTP id h131csp1145539lfg;
        Mon, 16 May 2016 00:57:31 -0700 (PDT)
X-Received: by 10.55.110.65 with SMTP id j62mr28646866qkc.166.1463385451659;
        Mon, 16 May 2016 00:57:31 -0700 (PDT)
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l72si21819760qhb.23.2016.05.16.00.57.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 May 2016 00:57:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CAF97201FA;
	Mon, 16 May 2016 07:57:30 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-204-50.brq.redhat.com [10.40.204.50])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u4G7vPBF018488;
	Mon, 16 May 2016 03:57:28 -0400
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, andre.przywara@arm.com, peter.maydell@linaro.org,
        alex.bennee@linaro.org
Cc: christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: [kvm-unit-tests PATCH 01/10] lib: xstr: allow multiple args
Date: Mon, 16 May 2016 09:57:15 +0200
Message-Id: <1463385444-12916-2-git-send-email-drjones@redhat.com>
In-Reply-To: <1463385444-12916-1-git-send-email-drjones@redhat.com>
References: <1463385444-12916-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 16 May 2016 07:57:30 +0000 (UTC)
X-TUID: fLCwhSzFx5Lk

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 lib/libcflat.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index df50615b43666..ba29041b731e2 100644
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
2.4.11
