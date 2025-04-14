Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2126470njc;
        Mon, 14 Apr 2025 09:41:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4POje+mIFzXUGs1AnquFS97fUpIy8nni4P71e5BO3ah1jnQRgfzTx4WplOswh4prUeeLkcCVu1mOmnA==@linaro.org
X-Google-Smtp-Source: AGHT+IEFrHan6LG+P/WXS8lVbphWg+kr6EaCtEqvhuVKnKfEJ8yRlJdEGdK6yROArMoSjvia5u3c
X-Received: by 2002:a05:620a:19a9:b0:7c5:53ab:a74f with SMTP id af79cd13be357-7c7af1f32famr1760099985a.39.1744648875242;
        Mon, 14 Apr 2025 09:41:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744648875; cv=none;
        d=google.com; s=arc-20240605;
        b=Qj5YLW/raDzHQVtgVg5w8wcprZybMylN2eBBzZIhkbtQ0iUDdHn7W/N3o1yRqgqBVb
         PH9IzEfPT1/8mteIkNF9NA3mDCHWZ10Sj0CVpLt6juqRvJ98soryhMB5zgF6zEmx2HJ0
         lcbcI3gmnGtdZ2rFugFCRvTgCKVQEUpdiLZAdlHQKZ4lOle39tnHs4UnnIowS4FBCmo1
         0w/Nq/JnRDfCgZn5K9Z9MJAbUFEFfE7AuoqUDt3WHCpKpvi5zAHi8gk9I3WZ1oocdCBC
         PHwqaZr1Dru/V465fF/ZgRgoebHznYxfieuac4KGKlFLpiD1ZypPIQ61kWjyDNsaS7/c
         LfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8EyLEZ3HI7CqZABdZVcXz92ZT3jwespQsaTUlJJTXjs=;
        fh=6xsxbRFvSPtT8TG3B9HOEDad133GF2zMAz688Nd5+nE=;
        b=cVPSOZ8BZEoPbREhoGxYhRhCqKxCk+6QIw2QwNe2kE8NIc8JBDih8PQqehXuhIx9TI
         i2MWT4b5ZkVFRMnBws2APRCxOpUrbVcY/5ld2+hyS3H3aGz2yuOM6OCdd/Kv7aj+J7nw
         0+wJ6g/u5kQSEN/4GWLhnyhLdYpc+vsyFftZTxzC5vcbU0l+10/nuEsWowQm6UZ0azrK
         9eTUy1FbU2Z3d5gDl7E3rhRA8VIhVlUBMpvjZvuNWiq6YeXpXO/nTg9z4qccft5mX0A7
         mBn4aZCIggobDgHzUl/MARm/Tpg+6aIK7ccej+H2+UJIVGq6o+sCxGzPosRPxalzS9Js
         ioAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h0iKVKi6;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a8957539si848934485a.138.2025.04.14.09.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:41:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h0iKVKi6;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8EyLEZ3HI7CqZABdZVcXz92ZT3jwespQsaTUlJJTXjs=;
	b=h0iKVKi6f+3J5tpIpV2lVjzavDkjhGZypk5WmMy2+3Jn5bAkGzn2jwvLoHOi8uZzmP3w4x
	O6LB5v3fYoAAuBfCvENSlWBFAtKHG0gZy8cWfw7ZnqWcHgHGDmGH4jOAF0lbaYokgLnPdr
	ZoazfSANWA2xZAW/rRaJLcBDkS8AMTE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-N-mCmTkQNBSx3dUD_6wKJg-1; Mon,
 14 Apr 2025 12:41:11 -0400
X-MC-Unique: N-mCmTkQNBSx3dUD_6wKJg-1
X-Mimecast-MFC-AGG-ID: N-mCmTkQNBSx3dUD_6wKJg_1744648869
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46F5118001E3;
	Mon, 14 Apr 2025 16:41:09 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D2700180AF7C;
	Mon, 14 Apr 2025 16:40:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com
Cc: agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 07/10] arm/kvm: write back modified ID regs to KVM
Date: Mon, 14 Apr 2025 18:38:46 +0200
Message-ID: <20250414163849.321857-8-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: X4CdWi8XM4fX

From: Eric Auger <eric.auger@redhat.com>

We want to give a chance to override the value of host ID regs.
In a previous patch we made sure all their values could be fetched
through kvm_get_one_reg() calls before their modification. After
their potential modification we need to make sure we write back
the values through kvm_set_one_reg() calls.

Make sure the cpreg_list is modified with updated values and
transfer those values back to kvm.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/kvm.c        | 44 ++++++++++++++++++++++++++++++++++++++++-
 target/arm/trace-events |  1 +
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b07d5f16db50..9e4cca1705c8 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1083,6 +1083,39 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
     }
 }
 
+static void kvm_arm_writable_idregs_to_cpreg_list(ARMCPU *cpu)
+{
+    if (!cpu->writable_map) {
+        return;
+    }
+    for (int i = 0; i < NR_ID_REGS; i++) {
+        uint64_t writable_mask = cpu->writable_map->regs[i];
+        uint64_t *cpreg;
+
+        if (writable_mask) {
+            uint64_t previous, new;
+            int idx = kvm_idx_to_idregs_idx(i);
+            ARM64SysReg *sysregdesc;
+            uint32_t sysreg;
+
+            if (idx == -1) {
+                /* sysreg writable, but we don't know it */
+                continue;
+            }
+            sysregdesc = &arm64_id_regs[idx];
+            sysreg = sysregdesc->sysreg;
+            cpreg = kvm_arm_get_cpreg_ptr(cpu, idregs_sysreg_to_kvm_reg(sysreg));
+            previous = *cpreg;
+            new = cpu->isar.idregs[idx];
+            if (previous != new) {
+                *cpreg = new;
+                trace_kvm_arm_writable_idregs_to_cpreg_list(sysregdesc->name,
+                                                            previous, new);
+            }
+        }
+    }
+}
+
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
 {
     int ret;
@@ -2050,7 +2083,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
 
-    return kvm_arm_init_cpreg_list(cpu);
+    ret = kvm_arm_init_cpreg_list(cpu);
+    if (ret) {
+        return ret;
+    }
+    /* overwrite writable ID regs with their updated property values */
+    kvm_arm_writable_idregs_to_cpreg_list(cpu);
+
+    write_list_to_kvmstate(cpu, 3);
+
+    return 0;
 }
 
 int kvm_arch_destroy_vcpu(CPUState *cs)
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 17e52c0705f2..955149ee1ac4 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -14,3 +14,4 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
 get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64
+kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
-- 
2.49.0
