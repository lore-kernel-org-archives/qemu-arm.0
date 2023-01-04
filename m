Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8306252ejb;
        Wed, 4 Jan 2023 14:01:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt60w1tzwR0RoTrovJ9ULzDai1rGwfYq9OZAMI3BlrDtZRm6IlWK5mdoI4Y+9Vd1chmwjm1
X-Received: by 2002:a05:600c:1d18:b0:3d9:73fe:9744 with SMTP id l24-20020a05600c1d1800b003d973fe9744mr26447819wms.26.1672869719531;
        Wed, 04 Jan 2023 14:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869719; cv=none;
        d=google.com; s=arc-20160816;
        b=AC2i+sMg8TKxNN43IbOu2JICI2G8B0h08yc91hTjLQf9LoIUBUKm4VXXF7q7MUAPRI
         UEHBKMZoqi0Ix/TJXgFozfZOgpVdX1juuXjO30gEW0G1TeFlLHUEOqr34zbeFcMMo5QL
         vfhtguQe3Lw91kBr38yPQHqPeaTQjyyUlNDQLgWZphvi5QLoV3XvmJ9jkU2In8+9wKHM
         lz1GSQ218YRQdQsy1sEANjuRIbAOSkJ/dSQlpuWhQZQTGSrdomvjAFyQclp6XNR9qXqI
         J5STGsLFyCoO2EZCipO4wocx4ltY2E2kdAKQI6/yztMDtRyzmOssD36ADsBCwJes3BrU
         Bspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=dDe5vfmZ31EwcRxKz3+oipci4tDkatYe8l7lx/XZLg4=;
        b=UQLXEIrN01ICikwiryizNXaAKltVsZD9nYYi/o13ZPHhNRa8iQ6x8sGnqBbg7Pg5jT
         9ToNyYoqa947Q5A/PcKX9b/qSxwnd0P7cyhxpy4vjHQBioTidScRtaDxl7cP97TrNliN
         Gc5siTRkI7W+8Vwd/CFjgIdMaz2zLC+Zl2RffAI+A7GVKV0nYUZoqmQ5sFB2nT1JpvP5
         jBxmBSG3iDbAPXLg9Hwz96nKUDuUV9TdtXVsdNvsj4RhUNvqF8miArT3q7yvZW+wlh+H
         gxca9QDxuKoHJo1PT3IPdI04KBNjLkVx4Mh9c403BvEHlxUsgh/E1sAywAabx85JbfOG
         EajA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cpS6XJ8N;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id f8-20020a05600c154800b003c712be1c5csi93351wmg.132.2023.01.04.14.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:59 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=cpS6XJ8N;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F89D3F16C;
	Wed,  4 Jan 2023 22:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDe5vfmZ31EwcRxKz3+oipci4tDkatYe8l7lx/XZLg4=;
	b=cpS6XJ8N7//rox2is1FPdNyuYWdObzrRveiyKpN8i2bBzKRmUS5KMZkIpMfwSIfomVb4NM
	9zmlFcmudtMkJkdQe6B/Wi7Y6i3kzTddbtbqmfEoAUjkuxsJYwi8crYkz3oEQ3QAZ3ccUi
	nNGSlSRejhZZ4nGQYkGhD5ppwG0BAt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869719;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDe5vfmZ31EwcRxKz3+oipci4tDkatYe8l7lx/XZLg4=;
	b=qp4BGwudRro49PNDmElJ8qlLMZQTJcU9dxHmVA0waJwKbBC/qU5BpLWtSUCteFgoGqSZ8e
	VID+af3RtoaXTsCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3AB51342C;
	Wed,  4 Jan 2023 22:01:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WNVELlP3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:55 +0000
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
Subject: [RFC PATCH 24/27] tests: do not run qom-test on all machines for ARM KVM-only
Date: Wed,  4 Jan 2023 18:58:32 -0300
Message-Id: <20230104215835.24692-25-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pqEUn7Bq58wj

From: Claudio Fontana <cfontana@suse.de>

on ARM we currently list and build all machines, even when
building KVM-only, without TCG.

Until we fix this (and we only list and build machines that are
compatible with KVM), only test specifically using the "virt"
machine in this case.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/qom-test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index 13510bc349..aea969ef60 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -105,7 +105,28 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
+    /*
+     * XXX currently we build also boards for ARM that are
+     * incompatible with KVM.  We therefore need to check this
+     * explicitly, and only test virt for kvm-only arm builds. After
+     * we do the work of Kconfig etc to ensure that only
+     * KVM-compatible boards are built for the kvm-only build, we
+     * could remove this.
+     */
+#ifndef CONFIG_TCG
+    {
+        const char *arch = qtest_get_arch();
+
+        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
+            add_machine_test_case("virt");
+            goto add_machine_test_done;
+        }
+    }
+#endif /* !CONFIG_TCG */
+
     qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
+    goto add_machine_test_done;
 
+ add_machine_test_done:
     return g_test_run();
 }
-- 
2.35.3
