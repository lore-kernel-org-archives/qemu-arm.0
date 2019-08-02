Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp782168wrv;
        Fri, 2 Aug 2019 05:26:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybOxbm1xn6jLg+IetP9AtCQI2GzmYM0peLcDKjIvKAf6xr1j8QH8NYwcDnb/xkZwYJl4qL
X-Received: by 2002:ac8:323a:: with SMTP id x55mr92698147qta.211.1564748773173;
        Fri, 02 Aug 2019 05:26:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564748773; cv=none;
        d=google.com; s=arc-20160816;
        b=J8/YV53QAS7D6B+2TqIs3e+mvRhCQ6cc6vRaC0JMC0o6MhdXiMLqhheNIhIxfEWQdn
         1Ax8Bowg+CoEwtRedkZsMbHhwIY519yef6xaR+NhmCw+N7RSqqW48p17JySw7Fm7zma/
         LOiqe6xkb/4R3HwPRzmlYMIhuOemkkpZW8WKbd6JX/oPpiZjP6RWI3ZzK0lquxgeBGkJ
         F0wfCU1acJ1DASeOmExXT1z/AHcTrdzxk8hN0wwytAO/DAZgZW0NXGEb256so+D/sq1o
         IIH/u3bOjyZ0KrEw4HJm2n4cpQpI/Asx6GsPCnFYTfVO3P4Kf3NKazGrcdV2dQvdvKFq
         lZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=POoV7JcQaI2bC1B9viwHetmyyKcZ//gcDokbbeqbrBc=;
        b=yksu6SX5vmx7ies90tB0H9cIR6Ei365dNxT+M18gBXE9HwZMJlKmnt9b2EFG69quG9
         PhoY88BeQose+NCYYHFScHTWjIoMcvl3/Re90+QTKlaJjuaAJFjrr7dsBSZo2HcO08n/
         Dke0+Sw9CFNmI9r5barm5gPPw6ExxJhrbC0zpk//6GGgTNJiIOfJI+DoJRZOoDhtoLv/
         IuetCRGof2LGGU8uOkKWsP2XY2cyn+r2C/GWlKdcV6Z0Bch4pHQfMRrVKlwRSazHEUub
         hEwUHWvu+TyOItW2DitDZXg++UJZaKk58CzFl37IKUWM8Got0kS+fVZJ082bBG8k0zfD
         IRpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v30si43560105qte.385.2019.08.02.05.26.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 05:26:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5945230821A1;
	Fri,  2 Aug 2019 12:26:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FD745C205;
	Fri,  2 Aug 2019 12:26:07 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v3 05/15] target/arm/helper: zcr: Add build bug next to value range assumption
Date: Fri,  2 Aug 2019 14:25:30 +0200
Message-Id: <20190802122540.26385-6-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 02 Aug 2019 12:26:12 +0000 (UTC)
X-TUID: NKcmW87Y3ZHb

The current implementation of ZCR_ELx matches the architecture, only
implementing the lower four bits, with the rest RAZ/WI. This puts
a strict limit on ARM_MAX_VQ of 16. Make sure we don't let ARM_MAX_VQ
grow without a corresponding update here.

Suggested-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b74c23a9bc08..3064067c69a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5300,6 +5300,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
+    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
     raw_write(env, ri, value & 0xf);
 
     /*
-- 
2.20.1
