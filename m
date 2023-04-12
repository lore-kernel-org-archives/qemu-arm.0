Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp281105ejc;
        Wed, 12 Apr 2023 05:18:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350bpYvYnR09HmwIXR4y5HXOj85Zv5ROoVmUzAT7DrDffV7vhYpUhlhBQ+quC8uvzrcaTuNPm
X-Received: by 2002:adf:f0ca:0:b0:2ce:a096:3ff2 with SMTP id x10-20020adff0ca000000b002cea0963ff2mr4726277wro.63.1681301926661;
        Wed, 12 Apr 2023 05:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681301926; cv=none;
        d=google.com; s=arc-20160816;
        b=TEoqyUqkGGlDmEDtBEHt6+Sqp6xc7JDHfKplIZTJS7ssIxqaSp1RQBBsVetZ4STxZ3
         gR9NTeYfbPXhi0H+ZKNqmEOd1693m2WwQItCaKHsr2f16napv3TiZOxsi4lhIURU6Gq6
         621uH9Qwue0+wdKYNkFFT3OhuJxxNBPnTAnko1YY3+AgR+t18jzimCk6wBdN5sGU8L5c
         6P7JdxmUSW+lCUG1BtlDb+WsdYaGs0PtsdAovaDi4qUcLhtTDQm1SAEgTiN6MVI+U7iB
         AQSCl3ZvIRpFNObTL+8JQ7eXvsprcM0wAoxmPUvSA6p067afkwTl937YK52lrKRTejpA
         wB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=WwILoklTtJTkoVOKb6pFl3hhYYvbvDadcuYthJgrHoQ=;
        b=Tg7fzTJIEkFIz0av/b4NQBjPYEHPSuXlRH/iR41SyS+XFhiKGJOb4kEnGdArVle8iV
         81v+q0qkzPi1o+pH5XK5ZbiMaPQiQxRB6Fggs0N/aj/zKt0eRw9Mc3up3TSq/e9PqB6B
         TTDQQgnyHwtlIAPbOqKKyY7qpbl8fhnsCz6MXzLEzkmrvpHI+uZLzMStgeBN87WeWNUz
         4S+qf/yjTvu6KdHpkQ1IfDgcLqhzWar0yM5OBWn5F9mymgK3565Pwt4mgyXN4hUVd/vq
         BYF0sTgP1kEanb+EPywCCFUWVl4l8rl1PbQRx02X496eC+vK7exgvtRlUea0Cixux6Bz
         1i5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zo+l2swv;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=kjV6bRIj;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id n16-20020a5d51d0000000b002f1413036d0si4953840wrv.433.2023.04.12.05.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 05:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zo+l2swv;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=kjV6bRIj;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 579BD2195D;
	Wed, 12 Apr 2023 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1681301926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwILoklTtJTkoVOKb6pFl3hhYYvbvDadcuYthJgrHoQ=;
	b=zo+l2swvGQEPH2FRiwVcphIrzYzIZcc3VmLkvJnVfBQY3imphF+DR3ni3SU/lEqjHyFmk2
	1wQnbJDbMH6/0grqdEZDJ7DVr4TVBx+zC9cSDq/o9NQ9XLIpYAgWpLhmtXS1Y93ZKX5dF5
	ggXKeIX+xIleJxJy59UNchApfPQygRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681301926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwILoklTtJTkoVOKb6pFl3hhYYvbvDadcuYthJgrHoQ=;
	b=kjV6bRIjot6UChRRkokLWA40GS7A2XAMpRr/n5wbr0/tFANFFDk8PZMyT/aeVeA1DICQGh
	kPV+u0J3852oJZBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4629F132C7;
	Wed, 12 Apr 2023 12:18:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AI59A6OhNmSMUgAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v10 03/11] target/arm: Extract TCG -cpu max code into a function
Date: Wed, 12 Apr 2023 09:18:21 -0300
Message-Id: <20230412121829.14452-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4wK/7pLOoXsP

Introduce aarch64_max_tcg_initfn that contains the TCG-only part of
-cpu max configuration. We'll need that to be able to restrict this
code to a TCG-only config in the next patches.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu64.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0dd041cfb..4537aec141 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1178,27 +1178,17 @@ static void aarch64_host_initfn(Object *obj)
 #endif
 }
 
-/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
- * otherwise, a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
+/*
+ * -cpu max: a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-arm is defined in cpu_tcg.c;
  * this only needs to handle 64 bits.
  */
-static void aarch64_max_initfn(Object *obj)
+static void aarch64_max_tcg_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint64_t t;
     uint32_t u;
 
-    if (kvm_enabled() || hvf_enabled()) {
-        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
-        aarch64_host_initfn(obj);
-        return;
-    }
-
-    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-
-    aarch64_a57_initfn(obj);
-
     /*
      * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
      * one and try to apply errata workarounds or use impdef features we
@@ -1367,6 +1357,20 @@ static void aarch64_max_initfn(Object *obj)
     qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
+static void aarch64_max_initfn(Object *obj)
+{
+    if (kvm_enabled() || hvf_enabled()) {
+        /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
+        aarch64_host_initfn(obj);
+        return;
+    }
+
+    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
+
+    aarch64_a57_initfn(obj);
+    aarch64_max_tcg_initfn(obj);
+}
+
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
-- 
2.35.3
