Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128568ejb;
        Fri, 17 Feb 2023 12:15:08 -0800 (PST)
X-Google-Smtp-Source: AK7set8v+S2om9/HgXcHjD8qzD8ScSGTkxRmS2IVD3YZgjC/mDqCZcLkjWkqf68tJebqzPeJngze
X-Received: by 2002:a05:600c:4aaf:b0:3dd:dd46:171b with SMTP id b47-20020a05600c4aaf00b003dddd46171bmr1347446wmp.10.1676664908580;
        Fri, 17 Feb 2023 12:15:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664908; cv=none;
        d=google.com; s=arc-20160816;
        b=c00A1oEzYN/ClfjqlRHOw3xk/1TH1MNQmnN9Rz2YxuO2j9GnAkIlNoAvU3B+KlQyDc
         LbxNBJCFZUwJFF/ar1uyZv2Wv0poazHxHXFnM8XDLdVz2rF5DZr6azndUDoi9XifrYQU
         s4+8L0PH8ecHXIdNJGITR7fv2kIKNs/wX9lCXN5V/TOZlvOXoXvIA2/GyxxzZ/HBzB+E
         PonZSSsDsR4dt9MlQQQ2FDvz6twPkIeDXZNmSXdLnQNS+hSX0PL+8S2P4bGK2WDtzX34
         21PCzuelcXIkQpZo+OOmwn9FuabMWXQOIuqANh29RKZNFy5c+gwAXNOulOQd4VOrHbF6
         wQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=3zSBNK/x2PCz3ddU5zb6WO8TpdG7txZJwJv/m5PJvtE=;
        b=ZbXPewSF5IzzGLkYeMCQKPT29j4vi1tvF8TpnOy9akxpNpWT/zzX6ZX/56/Gk3v5zf
         xTZ/zpwbW/0fc8hk/j76DLjLOxklQ10u+pVcfRRoOOddVyBydD4LDaz9McVvYvVj0fOD
         EJm5Y5qul6l8ZEVJHFOAhYjD+Beqh7w8vMBrnh45XcvI0RPtDY9WpUqlcmYCxZi6vDl4
         UoXz2BLwSup7jAz0E2xJCJMD7LZjrMtuQWsM9a9RFsCczwSaxlClhQ+aXI5qx0hw1S88
         aADH10PUJN7P+HdjX4J5pjvdiCUz4PhJNF87sQy7CBqPpdPFbJAxTONyOK1z62jddlFs
         Tijw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TenAMysy;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id s6-20020a7bc386000000b003dfe8c4c48bsi7993658wmj.217.2023.02.17.12.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TenAMysy;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3729034657;
	Fri, 17 Feb 2023 20:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zSBNK/x2PCz3ddU5zb6WO8TpdG7txZJwJv/m5PJvtE=;
	b=TenAMysyDGDjWDEKh1+/UO2tttxg4nq/Q7MvokU8u69X5z6Zmn+L4j/afj3oQltBpVW2Jj
	4Mi+45AmCIal0+nYXWjXomHSj0LFaeFMXDijDOJ6oJSy+e7AFj/4VjT8yqc/vyl0HV6KcS
	665mnQu5BdM8uiDSmFIO9/S1qnf5T+c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664908;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zSBNK/x2PCz3ddU5zb6WO8TpdG7txZJwJv/m5PJvtE=;
	b=5+I8xFRd8yAJFDStBJmXppzP2F2ZuqmAi1ze3n7X9hZPa56aQ6K4bGPdcpCH9Yj0oULwAz
	IuyHxcuuujTU97Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2235A138E3;
	Fri, 17 Feb 2023 20:15:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sFHqNkjg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:04 +0000
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
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v6 21/29] target/arm: Use "max" as default cpu for the virt machine with KVM
Date: Fri, 17 Feb 2023 17:11:42 -0300
Message-Id: <20230217201150.22032-22-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1QmEQotZvXjq

Now that the cortex-a15 is under CONFIG_TCG, use as default CPU for a
KVM-only build the 'max' cpu.

Note that we cannot use 'host' here because the qtests can run without
any other accelerator (than qtest) and 'host' depends on KVM being
enabled.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fbeeed115d..cc6b8ff85f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3015,7 +3015,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
