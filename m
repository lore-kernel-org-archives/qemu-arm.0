Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1640851wrg;
        Sun, 12 May 2019 01:36:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4+VPjT2md2HHdlbsceITEoUqjOzAr/S8Dzi5osmrVx4jAImtFhQWDgpL27ZBkhLhPLxFJ
X-Received: by 2002:ac8:8fb:: with SMTP id y56mr18173872qth.160.1557650199461;
        Sun, 12 May 2019 01:36:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557650199; cv=none;
        d=google.com; s=arc-20160816;
        b=qQSYAC2N5EOo4lb+FV8eKg/jGhZMWyNx8T3ecXz1c/6YSsJ4pODqfIdcGVXMEdUAhq
         dbn7+iaXVKCrC9EvBwZVfg2X8zoDNTY9yoEG7DyNbsYPWTvvr6oAxvGKzSt4muO2SFJ0
         9E6fHirzydu27eUknMzY0RBGotRfdPa98/WBybr/U8883IH7hk8djBrPQVOL/gpQg027
         et1fid/WeJ8JtucqOe0yiFDSW2DXTviJ/e7ErM/OzQQ16tIUYvN1D4Gj9t93jZeYWNFv
         nd4utcaM+PIlXx1fNfxR7dqooG2v4LWxw38IK/qcwBBIHfOiVfoFMVVJVP/sCKJGCbtj
         5hlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hUHv+EyXHU4A/hCNnUtfZz+qUv9gSLkbVfBWxfAaHYA=;
        b=MSk6lXn4vJyF1oskBR+Wj5geBoevhqRogMfgeGTD90nWs8e/SKEO9O4RyoyovJOQ4D
         QBga2bgEMlRzRjQwz0cDVbGbmhl6Pr7U9o7JlqzMJxiX2FIlYulw8pUWvyMXm7wO9woW
         Pd1vEz7QdIlKd9FvB8ukRVh4tYc1nZurmRa4/HKz6sDqFUfJHfwK/9aAOen63MLW02mx
         zl57a02o9Sv2e8OXS00yZ8dIZaP25oSeegzrxMB7RE0Y0QSRV1RFCpi6YsbzSRScL4gH
         35OJH5y0NZ6V9JcHNvuXCgyxr5t8AZ5SFLcb9PFIAXaJcBRRqbIQEXg1x6x2+nF8RXK6
         8VYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b19si1098383qtq.251.2019.05.12.01.36.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 01:36:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40A748667B;
	Sun, 12 May 2019 08:36:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-87.ams2.redhat.com [10.36.116.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03F115D706;
	Sun, 12 May 2019 08:36:33 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	abologna@redhat.com
Subject: [PATCH 01/13] target/arm/kvm64: fix error returns
Date: Sun, 12 May 2019 10:36:12 +0200
Message-Id: <20190512083624.8916-2-drjones@redhat.com>
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sun, 12 May 2019 08:36:38 +0000 (UTC)
X-TUID: yBClpdPNhCR6

A couple return -EINVAL's forget their '-'s.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e3ba1492482f..ba232b27a6d3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -841,7 +841,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
-        return EINVAL;
+        return -EINVAL;
     }
 
     kvm_arm_sync_mpstate_to_kvm(cpu);
@@ -982,7 +982,7 @@ int kvm_arch_get_registers(CPUState *cs)
     }
 
     if (!write_kvmstate_to_list(cpu)) {
-        return EINVAL;
+        return -EINVAL;
     }
     /* Note that it's OK to have registers which aren't in CPUState,
      * so we can ignore a failure return here.
-- 
2.20.1
