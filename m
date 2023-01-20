Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1303377ejc;
        Fri, 20 Jan 2023 10:50:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsoomSZNIZlxd2bEKQCkRS+vrIh4fzPXMjE4EwwYQUwhMzCMtKMtX5WoHh8qmLVXcr4rzma
X-Received: by 2002:a17:906:dc44:b0:86d:abca:3f55 with SMTP id yz4-20020a170906dc4400b0086dabca3f55mr23249093ejb.15.1674240643511;
        Fri, 20 Jan 2023 10:50:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674240643; cv=none;
        d=google.com; s=arc-20160816;
        b=n/vbscOYmoZ8TBCY/XiA7NgwveO3KDtkZy1NuSHJHUVF3oI6Mvf2fLo0k2ghWGOoa2
         upHNy+UmMT3KuowNEPGAU7qcJH5ZEvWghsEpmb0lDOjHZMQfyqjZ5L55F08eTZmto5B6
         mtKLamCGru5GPVOBVwdGZsGAQO4+1fg61ZQIwcP/3t3TJ+UVwDysXszWA3VJ3oaDAmL2
         NiaU8fNcyeMI3BlYQ1MDAFvgvZHJrbUwUWcY8jyR/Av2VRk4VK/Hq7df2wiJJ54LjbHW
         6T8MwArPba/q89sjvgrGcGW7slLEYGKfIWRGrEB1wpxZ8f+be7rk7eWfpt9KYPt2U5qV
         9pSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=803GiSgTqChy/Qbq4GG3EJPIdzTiQakLSUrLHGe1MUs=;
        b=PeHYnT9aWUi9RMtWUBTC8xlI8HrP4RHNI+mTLE2AWWXvqQ4zfR2LzHTYDschg2KkoI
         xKlzkHm6TlF35yF5CaHwWC1SGaZpQB4FlEnfjiIOe2rmCDy3pipkECnnOsaJ3v97TDaZ
         mpPRwJ3aNq8BP/Uc8H9LFtYxzVK45uFvFgnrExJL6hTuAxGAqcef3WBnPqxuadf6S6zc
         RAd5t7iBUm5UzyBOsvRVeKjZQZ4SIFPiMN95I0NQeMLmxr/n9T4cyPSUpela1zDGB3Bc
         tLA+VIcaFkSXbEuUlg+s7Fo59OBiKUWH7fBYKt+Ap1RLxx8h/gbhTJXDgzC5EdHJHDer
         M9yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=2ZOnX4yz;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=zjQLmFGX;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id jg34-20020a170907972200b0087766403eb7si9027610ejc.818.2023.01.20.10.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=2ZOnX4yz;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=zjQLmFGX;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F99F5FC21;
	Fri, 20 Jan 2023 18:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674240643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=803GiSgTqChy/Qbq4GG3EJPIdzTiQakLSUrLHGe1MUs=;
	b=2ZOnX4yzVaz6+AFzbWGPTTmWOKTbvhuNVf1XrFylf4uM65gAIJEpP2GfMXhFqG1x7CzpXO
	uJZ7CSR0ZSQgE8z/vwlT4LQdDYOOhyk8uvhxeyAT7Cyxg/XvQCLr5vYRqgUQkS2S1dYMZL
	wY9IlMutf0OGDiX/AaFvaQpDQA8Hq14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674240643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=803GiSgTqChy/Qbq4GG3EJPIdzTiQakLSUrLHGe1MUs=;
	b=zjQLmFGXILQXIhS9oUBDKpaKrt6qq8Fk0u3VyLMj8jVLE1eKoPdQ6KHVWQT84RnF3n+O7h
	jYdQM4BCUSXFIXAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9273C1390C;
	Fri, 20 Jan 2023 18:50:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iFbZFX/iymNSbQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 20 Jan 2023 18:50:39 +0000
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
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v5 3/9] target/arm: Use "max" as default cpu for the virt machine with KVM
Date: Fri, 20 Jan 2023 15:48:19 -0300
Message-Id: <20230120184825.31626-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230120184825.31626-1-farosas@suse.de>
References: <20230120184825.31626-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VHULX87kAQ5l

Now that the cortex-a15 is under CONFIG_TCG, use as default CPU for a
KVM-only build the 'max' cpu.

Note that we cannot use 'host' here because the qtests can run without
any other accelerator (than qtest) and 'host' depends on KVM being
enabled.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b5c711c919..8091c74e3d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3005,7 +3005,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
+#ifdef CONFIG_TCG
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+#else
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
+#endif
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.35.3
