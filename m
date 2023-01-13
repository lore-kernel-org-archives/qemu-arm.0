Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414830ejc;
        Fri, 13 Jan 2023 06:07:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXucjiqh5qkPGiBheSmm1FQulv7HiA9SBGO8HAGMJEyNncLibCICL3iGLwsYxYjeVUwZT8gl
X-Received: by 2002:a7b:ca54:0:b0:3da:26e5:10ba with SMTP id m20-20020a7bca54000000b003da26e510bamr800021wml.19.1673618848879;
        Fri, 13 Jan 2023 06:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618848; cv=none;
        d=google.com; s=arc-20160816;
        b=XkpYo3uvCi+aGM2X9VCKPNhK0hrVhOptjzZgWaONOZYzK5aFkH6Ery6H+/ZiE0LCde
         2XWG5WQoUmZkUys8+IJXqXlLp8Esijl6DmeHoe4EOL7T3//5nP/LhxyOkNw9tqsrD89m
         rOj9DUmh1ZQds20BVmQSJIHoPi7DVXbPebDMwV9EATgBUfECOmXN5ITWAqGXz8XO8ssd
         2BeIfzDNkwX0gTFfN5ZoxnvKb5nvC23m0HzBCtCZ1qG8h4Kx/rTzdbdNjG7Cw2LLacOb
         Oikhq52dgnZqU1WH5eDIqaBo2JhRdcImx1eqveSgwSLoWO3BK1Fajs5ixBklBeAG+VeA
         0MRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=5bF0kBNPYXnCCOfoP1XmA8Hs86RBaTeS2DR5VwhZdKs=;
        b=KJi7/f5uTCzZA8pMjq0Z71eM74JB90+ataVO+KwVy9HsF1QfVMv5J1jiAlpTY5dess
         v+A3ASv1WbO9Xls8ym5Cpwr8Oaa+2akXaSPMh0YQ90yUbtDvScPVlUIAp7CYT1H4GAsa
         Df65BMplFWYJCb9jEMsENMXVztfDTLaV+4/NMXqRcFWhjKa/N1U8N53Uyhcy8+jmNMcZ
         rp6WjB7813EHZDO0Uo3KC5ENeNRXEosUtPYksOKwmPskI4YkexBGHYXSnktlREC4bXlm
         6r2x47jFb1h3Y1n1wsl/KvTs+9Wue3B2xG0IY8XbTH902fMFsAEGgfUnOqH8189IR/LV
         KfvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Dbjkwskh;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id e19-20020a05600c4e5300b003b4fb04184bsi20088493wmq.139.2023.01.13.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:28 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Dbjkwskh;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E9AA921980;
	Fri, 13 Jan 2023 14:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5bF0kBNPYXnCCOfoP1XmA8Hs86RBaTeS2DR5VwhZdKs=;
	b=DbjkwskhHWc8p/UR3aq6mFWrPZPF0o0rW9R2uXYVwEu/nZt5FFsuJg2E9gxE0Rn4JPCLQX
	ZRDuo80YxynM8PDdSCoZf/RWg13KQQtLUL6MzwAVZBBSr2/79P3OoloMMdRG1i88KupyXi
	EnkkRt+i2LE4KtQBDh/p3jBWSqRRG+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5bF0kBNPYXnCCOfoP1XmA8Hs86RBaTeS2DR5VwhZdKs=;
	b=+0J7x79kXFoRN3x+WFr6baEMoCqLzagsIVrxK9rLUY114zEIY0PxfdQgK4sXSilOOHA9kb
	PKtWMhAnksIfzPBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E088D1358A;
	Fri, 13 Jan 2023 14:07:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EN8JKpxlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:24 +0000
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
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu for KVM-only build
Date: Fri, 13 Jan 2023 11:04:11 -0300
Message-Id: <20230113140419.4013-21-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YzroriJ2HVdn

The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
cortex-a57 as default cpu for KVM.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/virt.c                  | 6 ++++++
 tests/qtest/arm-cpu-features.c | 3 +--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea2413a0ba..19854f4137 100644
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
@@ -3003,7 +3005,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
+#ifdef CONFIG_TCG
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+#else
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
+#endif
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8691802950..4be1415823 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -507,8 +507,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         char *error;
 
         assert_error(qts, "cortex-a15",
-            "We cannot guarantee the CPU type 'cortex-a15' works "
-            "with KVM on this host", NULL);
+            "The CPU type 'cortex-a15' is not a recognized ARM CPU type", NULL);
 
         assert_has_feature_enabled(qts, "host", "aarch64");
 
-- 
2.35.3
