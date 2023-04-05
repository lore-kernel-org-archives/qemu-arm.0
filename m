Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480380ejb;
        Wed, 5 Apr 2023 09:05:44 -0700 (PDT)
X-Received: by 2002:a5d:4cd1:0:b0:2ce:a8f4:2b01 with SMTP id c17-20020a5d4cd1000000b002cea8f42b01mr2108312wrt.32.1680710744093;
        Wed, 05 Apr 2023 09:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710744; cv=none;
        d=google.com; s=arc-20160816;
        b=axtURj14FaJdnqdJrllv1iUYfxWcQf8PG/FKcngrGYh7b7JN+2H8B5RHfOeBkMnXMJ
         mugpqgiJfimIxoRQKN4hvyVx2kS6EN/DHwFbDOctzF5Irs92W8YKwfEr7DDmlwF4DEY/
         mP0ARjERSK7sAfwOo4SljMXZ5TNhSM1KhpUT4gWK5sDMpT9V9bK6I/qM3Ztc6i6oLhH5
         hzLIjm5lJnECOaICg1GyK13wKxYkGDcE6dnSIKiUn9sUF8VbgWufW0gjqHNuni8UIwbq
         renZ9Jne6J6zGnifSZcSxq0ly2DcqREGsXKl8b5GI7bK+QJwBo9liimVNq94TznrUxWk
         EiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1nroHqABUajLqRunlI+qD37HAN4v8HXiRYQrqBTvdwE=;
        b=rg1rhqwfBRyZz7+KhUId/mh5mx1gf6flG+q/0STCZcNmFr6iynn0I2SIE1KTNWx6TV
         bjWtHqGyx0r/Vtwq1dtulEwEmiH9rb/mbScd54Ziz1S8ycRBmK620AMPSqolFJvWoDSG
         RWaTGxhvpghTmehFudOcKvomu9yNF+537XVvIkojsYeEZ78wxAuPVysOSn9dwYxK7hxk
         0n97fYGSG/FXSxxmtr4EkGUm1nKFHgByMO4fvEInthw7F+jzuVEKROSFCGBwpfGBtffy
         FY1u94Gmu/y9QeQOL3E1WMPqp1R+qepw23li+cz/QqNDQklck1Kkq0RpxZe6S2AYnmpS
         Y1og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qw5qTTc4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x24-20020a1c7c18000000b003ee0f4d4d47sor735024wmc.39.2023.04.05.09.05.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qw5qTTc4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nroHqABUajLqRunlI+qD37HAN4v8HXiRYQrqBTvdwE=;
        b=qw5qTTc4CNQPm1h/LZ0mTTXy0OF7gIZq7jkcglSCTingvHz0cqXrBwBojetrVCnaEU
         V3XSlu7iPDyJb/v2VW6Mfo7ZEcibrTott+zYeXs/SZP1HCHBMI39vaj3sfGTFwJQbfZo
         bPbd459qPJhpcD9HW2tSPRWW6uWhsivNaPaKQ8L/mgDLhLP0gasJOaP/HIEJmenRuRRk
         umwaalz/6EAfiwgdglIA20tavSVgQWBEjmI01ISEOl/XiJZYm6MLszMBTX98bQRndoHx
         htVpU34jeAGTXaELsldCnNYgFUNan9n4kpcE+bf1j5dhHWTQfNnLz94EFHsmMlTBB75M
         MoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nroHqABUajLqRunlI+qD37HAN4v8HXiRYQrqBTvdwE=;
        b=58PQ0ZxrSi8efZPH2PghKpjcL/SzWdz1v9xzDjxEPKU8ZuPOnnY0fKE3XeFosjiRbN
         /llAs0+oaD7T/ZYwnTeFCJJeP6kE996akPL7izl3CoyPv3aKZ/sXpOLWDDLUpB8Qxcir
         AdFU9Db+5jgyUBWdQSUYajF8dKu7oFZ+ztA/1kXNzITJ80CNmQRtv/6LNb/szx4TE9Zq
         YGlQ25jyhvbIb0KcD066v/sXUVCEIMD4FNTmtxVXWY2r5TS/lGBJsjIMX/vYVKpTKPiz
         /wnn1p14D1ykv/KJWAwPut0to6LTgRtyA3UE9OWrLxRvWFHtNV5ujxEw1fAgjSbXasVZ
         DUIQ==
X-Gm-Message-State: AAQBX9cXbv93OJmdUGiuyo2x3h9vsJqam//CT0F4KYzONjeRRfpFjq1R
	9Qa37/h5t0lILDdqcGdDvCOE1JWX
X-Google-Smtp-Source: AKy350avtCPFICutt8vrOag6ZCtLMApHyjgYl5gdC/mIgFAzkBuA1jps8xP9/D8yQimuv1rVe3m43w==
X-Received: by 2002:a05:600c:20f:b0:3da:2ba4:b97 with SMTP id 15-20020a05600c020f00b003da2ba40b97mr2228281wmi.19.1680710743845;
        Wed, 05 Apr 2023 09:05:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c4fcb00b003ebff290a52sm2565572wmq.28.2023.04.05.09.05.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH 08/10] target/ppc: Restrict KVM-specific field from ArchCPU
Date: Wed,  5 Apr 2023 18:04:52 +0200
Message-Id: <20230405160454.97436-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IbRWCX5PqUm+

The 'kvm_sw_tlb' field shouldn't be accessed when KVM is not available.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu.h        | 2 ++
 target/ppc/mmu_common.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 557d736dab..0ec3957397 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1148,7 +1148,9 @@ struct CPUArchState {
     int tlb_type;    /* Type of TLB we're dealing with */
     ppc_tlb_t tlb;   /* TLB is optional. Allocate them only if needed */
     bool tlb_dirty;  /* Set to non-zero when modifying TLB */
+#ifdef CONFIG_KVM
     bool kvm_sw_tlb; /* non-zero if KVM SW TLB API is active */
+#endif /* CONFIG_KVM */
     uint32_t tlb_need_flush; /* Delayed flush needed */
 #define TLB_NEED_LOCAL_FLUSH   0x1
 #define TLB_NEED_GLOBAL_FLUSH  0x2
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 7235a4befe..21843c69f6 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -917,10 +917,12 @@ static void mmubooke_dump_mmu(CPUPPCState *env)
     ppcemb_tlb_t *entry;
     int i;
 
+#ifdef CONFIG_KVM
     if (kvm_enabled() && !env->kvm_sw_tlb) {
         qemu_printf("Cannot access KVM TLB\n");
         return;
     }
+#endif
 
     qemu_printf("\nTLB:\n");
     qemu_printf("Effective          Physical           Size PID   Prot     "
@@ -1008,10 +1010,12 @@ static void mmubooke206_dump_mmu(CPUPPCState *env)
     int offset = 0;
     int i;
 
+#ifdef CONFIG_KVM
     if (kvm_enabled() && !env->kvm_sw_tlb) {
         qemu_printf("Cannot access KVM TLB\n");
         return;
     }
+#endif
 
     for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
         int size = booke206_tlb_size(env, i);
-- 
2.38.1
