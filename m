Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547430ejb;
        Mon, 13 Feb 2023 12:32:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/VZIMub3JgqgvBP4P7ng1ut1NqWSxoHyYYKunzTn51hyD8g1B/dplMWBpCv1veTxTk3LM/
X-Received: by 2002:a17:906:4406:b0:8b0:2397:8003 with SMTP id x6-20020a170906440600b008b023978003mr245097ejo.29.1676320375299;
        Mon, 13 Feb 2023 12:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320375; cv=none;
        d=google.com; s=arc-20160816;
        b=OFRJ8KTZAV+0f80m+UXIJvKRctn1GIE7ACxbxKFTO4JPCH90WBhvRXt2Z3cwL5NLgl
         GxYe+1reOBMnJ4lhhk+BOkHaa/4cgBti9X5AwH6/SIhFaOuJkb7mTu5+F061XClTS9sZ
         7nx/1tY2lmcLb1B4QF63YMug44Xjm5UuWTD5Haahr12cWB2eLHyho1kV10bdkdGmAsDq
         mAMFQ07wKgZ2G4blO8QuPDJIHQnHocnoyOwx5B1U+tZnhY6Bhf+jRjAv2FAqfKKonN3S
         pMUUZVUZpZUu7DUU7JtLqeY+r+IKA0stV51h/klFs4oJk4ZOTaXC7IAcy2wbVsugq0J/
         +Jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=3zSBNK/x2PCz3ddU5zb6WO8TpdG7txZJwJv/m5PJvtE=;
        b=AbXgIESfTBqsT05dLKw8mnyN724qK8x6BlBygkQycDBySRgCTrKMMNrJumpXZ9dwKN
         pyJJ5mI8UIJ7y3nPh+jR5XOTlRVphXHCWAQ3ffHt6sBGByAdTQN9+xrVwqayJoL/Me8n
         /ud7t2IQvCCbi/GedBb9mVv6eOrRSSUVdPoVYCKFPBm8Cf+N2wK5aPtsj61HoIvJyfCl
         /5I8T/efH/1+061vioFA2v3ds0gz5uc8F5VmeMDVuMi5cwCgKMw/4ofDNPsiudmxLWFp
         rXxFPFQxYTk+Pio5c0EF9skMb5mobwepL1hOyV+v111HWX98pKo3OE5okBCRo6O7d3Bl
         NkTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SKWLvzJ3;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id n3-20020a17090673c300b00878562dbf66si17704914ejl.848.2023.02.13.12.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:55 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=SKWLvzJ3;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E0D8720287;
	Mon, 13 Feb 2023 20:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zSBNK/x2PCz3ddU5zb6WO8TpdG7txZJwJv/m5PJvtE=;
	b=SKWLvzJ3yF6YfF5cCskMGcu0lqpLIf0yi4qPiUxMzJSVWo1Q8zlW/x7D1zmicDVWNJwJ1k
	Je2M1ul6q2CHOaAjNxN1kef82his3MgStb/ytNYLoXEBOKalF1sf7qNS+L44CNz4rkBopp
	dIfWcSbmh7LUtkOwExeXKJKt8ngJn1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zSBNK/x2PCz3ddU5zb6WO8TpdG7txZJwJv/m5PJvtE=;
	b=xwd75gIVbeAIn1Ahk1SbzBgmC4KM/EyNxdguYU2d/pEFWpZl5F1i+EgjTQd5pmK1ogP+rX
	n2lBRgrcMwLfZ/DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F0921391B;
	Mon, 13 Feb 2023 20:32:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ME4sGXOe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:51 +0000
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
Subject: [PATCH RESEND v5 22/28] target/arm: Use "max" as default cpu for the virt machine with KVM
Date: Mon, 13 Feb 2023 17:29:21 -0300
Message-Id: <20230213202927.28992-23-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CG/o7k7T76wT

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
