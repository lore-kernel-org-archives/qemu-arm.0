Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345593ejc;
        Thu, 19 Jan 2023 05:56:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvXw2f9iRGUEpCwyHc7tiAUO+wRRE/ELXqkrVRkAbz2bb9V0c4oFgx+Wd1H7Nzivhld58Av
X-Received: by 2002:a7b:c5c4:0:b0:3d7:889:7496 with SMTP id n4-20020a7bc5c4000000b003d708897496mr10227648wmk.17.1674136601954;
        Thu, 19 Jan 2023 05:56:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136601; cv=none;
        d=google.com; s=arc-20160816;
        b=0EQIq93a1/dME4nm3X9CJ1M/co3KC/3vYi660751vyePJ/swVydth3f+ksOvE6fARr
         YFh+uQ6Zdyo45fpYTaAWV1qNZ2BDjRqamI4lRCsv0FNSrF+Zx6maZWIo2zk5O+rY2OPb
         zANcXZGSe+FeIIb0yIVa1yLOAcHGgTG6KWRvE8pT57XYognJdsYRs74ur8fqafBQcEd+
         GUjV3DN+rToxwmyko258M4urHBFw/nKBqpOvtCbBH6/MNFEjH8XOQ9KXqvttXzvKrMR3
         Hq1F5A+Z8elkwyudLJBW4FLCalU8wYwCnNZTzPY0Dp6uLHEl305QjUPaLjtC+VgvyklK
         dJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=vNdn5MPI5AOTr7lKP6lfdpZLD0+9Efs6p4/kTTR5bA4=;
        b=DrYJevMI7T3bsl4NdaH/JdWSHMalMgTLeEmrqyp37r97El6mdoGaqqhFRcdh+risoR
         ljwGRfcgpWcP/HOgy0WqH33fHiDbDlI/r6yiwvyPhoWGNCMNARPfiIi4PkoU/kmSG+WJ
         vgzDBrJHdQ3BqKHr/wm2DOszO9VnI+TmQXwxyk8aTc8uh/Hzvz2dH3UXECscvg82jvMx
         DMnD/HLRMpM0hDZgfK/ou3/PGWj9Qi63+Ge7aDDcRCbG0eIb00jWY5c3F3YWzZyglO47
         dl5GjCr/F9RJAk5ouBMMtflwSYzY3lMn0Qj9e5vijbI8/sS7YP+FT4mutRyCqjUe8xlo
         B2Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SMNTYu2P;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uORhP+ly;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id bd12-20020a05600c1f0c00b003d02d55853esi5524749wmb.40.2023.01.19.05.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:56:41 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SMNTYu2P;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uORhP+ly;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 657A638B86;
	Thu, 19 Jan 2023 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNdn5MPI5AOTr7lKP6lfdpZLD0+9Efs6p4/kTTR5bA4=;
	b=SMNTYu2PjDR0PmwEDVypYrDEmr5rHqsGLNZkqGT2N1G0c3WjhmNJzqZIzQXJC7Zaj2+L2q
	yiQ7/2IT/BtYQeBIAqH96OKpl+Ecw8iZU9WwErMrbIJkEnw/fCtH9LgYiItVjxT01VYVC+
	0NJN8y40dY4uCPAl6GaDQHnOTF6ohG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vNdn5MPI5AOTr7lKP6lfdpZLD0+9Efs6p4/kTTR5bA4=;
	b=uORhP+lymcjMo+JaWPzYlr35Tx9uDN8M/ZLNbgvxHeq2v2yq558/01wsgM/sQYAfpuVibG
	GOz4VKkT7DY+ORCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF2BA134F5;
	Thu, 19 Jan 2023 13:56:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GNehKBVMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:37 +0000
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
	Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 03/15] target/arm: Remove default cpu for KVM-only builds
Date: Thu, 19 Jan 2023 10:54:12 -0300
Message-Id: <20230119135424.5417-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xsLGC8/ci2NP

We'd prefer if the user always had to specify the machine and cpu
options in the command line instead of relying on defaults.

Since the KVM build already doesn't work with the current default of
cortex-a15, remove the default altogether for KVM builds.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/virt.c                  |  9 +++++++++
 tests/qtest/arm-cpu-features.c | 12 +++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea2413a0ba..fa8baf3156 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -203,8 +203,10 @@ static const int a15irqmap[] = {
 };
 
 static const char *valid_cpus[] = {
+#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+#endif
     ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a55"),
@@ -2025,6 +2027,11 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    if (!machine->cpu_type) {
+        error_report("No -cpu specified, and there is no default");
+        exit(1);
+    }
+
     if (!cpu_type_valid(machine->cpu_type)) {
         error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
         exit(1);
@@ -3003,7 +3010,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
+#ifdef CONFIG_TCG
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+#endif
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8691802950..4ff2014bea 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         QDict *resp;
         char *error;
 
-        assert_error(qts, "cortex-a15",
-            "We cannot guarantee the CPU type 'cortex-a15' works "
-            "with KVM on this host", NULL);
+        if (qtest_has_accel("tcg")) {
+            assert_error(qts, "cortex-a15",
+                         "We cannot guarantee the CPU type 'cortex-a15' works "
+                         "with KVM on this host", NULL);
+        } else {
+            assert_error(qts, "cortex-a15",
+                         "The CPU type 'cortex-a15' is not a "
+                         "recognized ARM CPU type", NULL);
+        }
 
         assert_has_feature_enabled(qts, "host", "aarch64");
 
-- 
2.35.3
