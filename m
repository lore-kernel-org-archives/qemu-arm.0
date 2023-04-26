Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593278ejm;
        Wed, 26 Apr 2023 11:00:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350bHWsympwqvbMj/+qPN69Q2UvUJIcLNTJnW25MlxJC0Q5NpdxZiucOyeYPPqJrXFFA/uc0J
X-Received: by 2002:a5d:595b:0:b0:304:794c:732e with SMTP id e27-20020a5d595b000000b00304794c732emr8765870wri.41.1682532029194;
        Wed, 26 Apr 2023 11:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532029; cv=none;
        d=google.com; s=arc-20160816;
        b=kOkdetCCH8dTobSi82ymg70R6SFBQ4nAOI30UYQX1JUbwkJdLiZdaXvi4A+gEXPedn
         b4wQR5xV1PZZbA+LRjXDvSM9r2BJIgC4cvmaHXmfmITJzln02NOIEymGDyHaRw7AbOy+
         SdM50E8M111b/Q5oR4bHxwiG9X8UByEB0Ev0zXKhCdIJiqRbIAHzGizgQS4MqIGKATAN
         xvWcYFJd1gziTsYtuQQjBUHV2lqaTLAQcilyycvPbzjpBA/WLUJY+I8xfbLkt/g5jbz0
         s9TNdpwDuBwVNeAB6tUmPYbGB3j+3+RUgqRzJhDPA+uMaMCNkglJvh53ugJy9UJeu8nS
         i2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=679l1G1eg5s+D4ExLZtD6ilV+z+jWiSD9vIaYHPFtlE=;
        b=RJ5bsp8bx4kSgLQPQRCS3ToBklpBs18FeOsXhLyHWT25LpXvshAQB7OXjJ4hM7azAo
         nVIwAnhUf358trCw4wytkZUOSgqPm1crX2iFmba0L037pskI2qXKFiBTGS7SzvE4DWXr
         e1KtpnCCteslJofIkA5711FoyLdHRPR01XPizPRAKZwBulUHNo3FUYNVb67nKPyHlReF
         bu5pMlJdGKAc743T72yionHO81FelIp95S5MbtzrQP/jtDXS83RIenE6rw+PFUeEc+J+
         u15d70P5eJsjG3ICCZgpv748vl402LfBVci1r36yvVLc1SFKF+v3+rLfll0bl72X3pjI
         nicA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RKTuVFIm;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=0b2ujZem;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id o15-20020a5d474f000000b002fb25670bc6si9899363wrs.739.2023.04.26.11.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RKTuVFIm;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=0b2ujZem;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D71DC219ED;
	Wed, 26 Apr 2023 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=679l1G1eg5s+D4ExLZtD6ilV+z+jWiSD9vIaYHPFtlE=;
	b=RKTuVFImmrYTFw2cYb7/02hMXtiTVDRVGiMFMsqKBfJip0Jz9AcuCpvzxWywamlE/9Xde2
	4ax05KdsxP9T1vfwwSKPInWVcQ7IdgX/sO3KRIPxnif0rF64RZIizSwcLF76FlX774kQAf
	yfvFbM5RM+KZuQRTCHcNfM7so2Gtgy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=679l1G1eg5s+D4ExLZtD6ilV+z+jWiSD9vIaYHPFtlE=;
	b=0b2ujZembaIvCOcu1ay5KVKoH/PnczJ2D9n8Fq4v6CCZD0QIyQZ4Mm8Kehf1yF+cWXSL2O
	QOt8OgoyQltbu/BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01AAF138F0;
	Wed, 26 Apr 2023 18:00:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WFqXLrlmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:25 +0000
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
Subject: [PATCH v11 03/13] target/arm: Extract TCG -cpu max code into a function
Date: Wed, 26 Apr 2023 15:00:03 -0300
Message-Id: <20230426180013.14814-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pmSIZgOgyFeo

Introduce aarch64_max_tcg_initfn that contains the TCG-only part of
-cpu max configuration. We'll need that to be able to restrict this
code to a TCG-only config in the next patches.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu64.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fb5e1b69db..e9161522b8 100644
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
