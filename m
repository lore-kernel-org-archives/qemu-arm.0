Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp849358wrg;
        Fri, 21 Jun 2019 09:35:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5uCZoSmklLjbjZlWzf+FZGZCKQvnwru84nJoLIfsZktdWkV/nsqbdV+VR55IW8RLn7aM8
X-Received: by 2002:a0c:86d8:: with SMTP id 24mr34516908qvg.56.1561134915626;
        Fri, 21 Jun 2019 09:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134915; cv=none;
        d=google.com; s=arc-20160816;
        b=M6ZgBbzLAZe0QOq4aqPdGD+MdgP3di6Mib+yEwLuiU9h8IKN6KGonJkRt1V8f29mjN
         K0JKOzLAXxk8iRYxI/ZFai1LIK29rh2IdwgT1FU6qs25fM/orfCPmPA/pZpnwR0cVf6b
         O06OIufkjDwXRPF4NvkZa4sBAv54+9CcGRlpC5U5TdjVkpM6G5p04527GmtdTEpY+aTh
         bAMmp6M2bg8/nakEZCCMvOkSoidjGfnqNgLOXOxegmOg3d6K7c2tjAjcjgYYgKNodQza
         o7hLnePvtyFF1+Z7IS9QphUp+KfF2lMoOj+LmXrVZ+BOJ8RReINI4rUsUJ1ng4Dl6LgZ
         1pPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Obm+AfrOghYIjZUbsbjCWWAdITRhoMdbnuykwt0HuKE=;
        b=F46x7ZNNsX8Dy6WAsBp9CRySLRsUF6zV3Fekcv6+HLY/DFVLgCbrbC3YTMqw3WxQi0
         35o3cIRiFN5ZKglsYDWwKkrJ2uVlgXmLv8s3HSqDru6FPcbD+3FQSpozuEGEs0nmBgho
         UOmdEFLZfg6oyamWs/ssAHCww3VBPAaC+hK1sEHskjZC3aOFEp6ZLXB+UECu3uW1an2V
         3ZUCukvoegWMB6GxOIYfrW+a/Y7/6KyC2IwC4LdIeH6n0D/Ihdn9QoL1cTCZdfTmxuOV
         OWu+7hmXh1ilniAGtPBBkoey+vwd27qgKUbaCj3MgDc6OWT01JpVVw+FES0EsHOPX7kX
         d+fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 40si2368565qvq.174.2019.06.21.09.35.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB0E585540;
	Fri, 21 Jun 2019 16:35:09 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7755E1001DE1;
	Fri, 21 Jun 2019 16:35:01 +0000 (UTC)
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
Subject: [PATCH v2 08/14] target/arm/kvm64: Fix error returns
Date: Fri, 21 Jun 2019 18:34:16 +0200
Message-Id: <20190621163422.6127-9-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 21 Jun 2019 16:35:09 +0000 (UTC)
X-TUID: seMshlfRmD75

A couple return -EINVAL's forgot their '-'s.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 target/arm/kvm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 45ccda589903..9ca9a0ce821d 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -856,7 +856,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
-        return EINVAL;
+        return -EINVAL;
     }
 
     kvm_arm_sync_mpstate_to_kvm(cpu);
@@ -997,7 +997,7 @@ int kvm_arch_get_registers(CPUState *cs)
     }
 
     if (!write_kvmstate_to_list(cpu)) {
-        return EINVAL;
+        return -EINVAL;
     }
     /* Note that it's OK to have registers which aren't in CPUState,
      * so we can ignore a failure return here.
-- 
2.20.1
