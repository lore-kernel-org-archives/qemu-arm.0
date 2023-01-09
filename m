Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663774ejc;
        Mon, 9 Jan 2023 14:43:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsXedXfDBBTDnvVGvjuKXOatT2WVWQ5BLq9Vu2+VlbO/EBVFBdXL0uDcX7G9RUBp3QzUsBI
X-Received: by 2002:a05:600c:354b:b0:3d0:4993:d45b with SMTP id i11-20020a05600c354b00b003d04993d45bmr49068842wmq.4.1673304202326;
        Mon, 09 Jan 2023 14:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304202; cv=none;
        d=google.com; s=arc-20160816;
        b=qM4yyBaPAtd/NvQ3qJcBzzlZ+TpqkLQ0hjl9mw8IbmDWjBjVZX3/g/R40xBbj6gWpM
         dZBM9sn+MFE9DyAo/9yqqIvQ5oFjtXjRnDW2HqFQdDxiso2m/8MBQ7TxVP6reCjHoih2
         +PyJD6WHK5j5cGyVk0uO05GAmjiuqhGuUBjDBW6BmA3GL4uxsUdhE0sod1ae1aaDGx9B
         uVOAJt7KaNHLM4HRO0/Gzvs7kR7nXQloWP9ol9c6N5dE0JfTTbdMdK1otWBnZChpRFJF
         Y0c1vl66/s0NaCP8Z8uxtWTCQX4QWDQYCO3otcyVWlYdrqMr9XlaOGlzNB1jA2kDIQr8
         7llg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=dDe5vfmZ31EwcRxKz3+oipci4tDkatYe8l7lx/XZLg4=;
        b=W6nr44KuTJxOiKXnxusM55nyR+L6Kd1M08XpvFxw4uys4bRsr89608tNt0vn8xwDa4
         vM/3ZD1RH8osVB32lpn3ym+ubEVfr3RKm+gCDEhMwPObvWG/Vz4UW2Brs33nt47O6xmB
         IcxCalQdLziw8oxygDqx+Bv4qZykYPLEniQOop6diiz9JJUiBIkcXhyz3Fau6Cy5uLO3
         Kz2/FvqSgc7uFD7As9Jx3P/YCFEY0+P975B3iSkcxI5tlxXi90SqwQFCKy6PWE0EZTE8
         6DZL85i4sHGQQ567FQSO8gH5Q/yEiB5C2D81tkWMlXKTimDLCxmj3GxE6+18QlCW+hHc
         t+CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fMv+tufB;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=6vqqybGY;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id n19-20020a05600c3b9300b003cf763bf47bsi9161732wms.151.2023.01.09.14.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:22 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fMv+tufB;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=6vqqybGY;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA06A4D34C;
	Mon,  9 Jan 2023 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDe5vfmZ31EwcRxKz3+oipci4tDkatYe8l7lx/XZLg4=;
	b=fMv+tufBZX1rjQwENHKv7D/dAmX8tqAaoJlOekWyDO3AgSjFssSCKOEzhamRFPvFsjKb2d
	TN4AGC+DDBe12yW6nvCJYseN57hcBMnPlZ4NMHPkIDahfTvg1SOFsUVsQytx2uzv3OCHyu
	xZDIR9ZAQ1kczkjSVxTB8WOKI+0kNYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304201;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dDe5vfmZ31EwcRxKz3+oipci4tDkatYe8l7lx/XZLg4=;
	b=6vqqybGYt70MaIQ3oxk5MsqA4QU02cW6nQc5qAnZNc+lW68dbd4Pwk/T99zrpy/go2rZRO
	roctYdqXC642hzAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA41813583;
	Mon,  9 Jan 2023 22:43:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wHy1HIaYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:18 +0000
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
Subject: [RFC PATCH v2 14/19] tests: do not run qom-test on all machines for ARM KVM-only
Date: Mon,  9 Jan 2023 19:42:27 -0300
Message-Id: <20230109224232.11661-15-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Ag8y7ZSCMsax

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
