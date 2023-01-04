Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8306210ejb;
        Wed, 4 Jan 2023 14:01:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv13OjhQNjYF+NZJokIUX32RAdKVl9bETkrj6vmThA7t5ZhrA6SPR1gOMKMBX3LX3pVUqKa
X-Received: by 2002:adf:f4d1:0:b0:285:d8b3:147f with SMTP id h17-20020adff4d1000000b00285d8b3147fmr18598401wrp.53.1672869716368;
        Wed, 04 Jan 2023 14:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869716; cv=none;
        d=google.com; s=arc-20160816;
        b=Sxm9gHRZ+o4/XfbZ3sIvptR6utY860LoPSdywTHfp58S8n17QkE2gEz9aLghrq+EiR
         3yY/KARp3jpPZW9/rDUuky61dBSUWMbNuNpCF8rcCU5Cua+c2E34daxUoNPy/uNvZiSJ
         f6B/pO5BW9Y2W5S7GhPnWVQmUa8R2HPfblxQaQSLM91i/I1Lxmw42pXWnec3YXw5bfS6
         HDymA0ehbmnrGQmeK4g6ZEGvP7PuE6vdFQio1ZwvkQsR8akYOYBoQHNqy+C1eqg+pplS
         zYgC2q6QFPfhk46qLeyfEoQaue6+/vh7idRh7B7nxyXiDoECMTL7CRbm26wYbeUS9IiG
         8AGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=1TOeNshkMsKn2Y3CsqOHq9PQkcZYQvOcN/VHQdwTADc=;
        b=dh5+schsAwiItYDX3NuVcLI5bAYoqTM0pzdLz1hdG8IrwJNg/pG0qt3xV4tBarKMT4
         WiWWbKu0GzTLFuUaxIN/xmCf9MVYC6oRRC/Cf4uGraFRHqJ/eICxm5MsVazFtI+pHJI0
         vNihY0k/VcM0Ce8ms4C3cBCJRK42C35HVDhXPamWSaFjNvMyulrm9IZGdpNyZlWv2o0N
         xEFBHfCJGGCs1yxpEi8yZpMUht1uNTZv+/5zXAEI6LXFc/Mqeeqm7HoL9NgIbfZYW0J4
         HI1Joo7SMCTR57vdwFMcdvQay6U+maFOyWlFuyTn2aESg/s2dDXkSb8ZOMmJTo6/8zCE
         lEDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="eXSCp/gW";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id p12-20020adfce0c000000b00280bb21ed6fsi15035594wrn.49.2023.01.04.14.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="eXSCp/gW";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8AB333F17C;
	Wed,  4 Jan 2023 22:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TOeNshkMsKn2Y3CsqOHq9PQkcZYQvOcN/VHQdwTADc=;
	b=eXSCp/gWu2Cof2cJn/t9xoLGfBH9SygXX0M5uNpu2+2ZmjjASK/+hnfix5i+E7kaREzfRw
	umujj2nmpKnNO72Tc1jBn+dIGp51viYmt00NFf24Uxd1SCu7m5lyCski/n9WG85bFuXCoC
	3T5bjXAtQxms2NhH+shJmKvkXVeCzQk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869715;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TOeNshkMsKn2Y3CsqOHq9PQkcZYQvOcN/VHQdwTADc=;
	b=q9AzV4kGlvTzw2USkS+u1kDcmhlJgBov/189rtDp+LV75/XzcP94XLFNWBUIkDKmwmhwgP
	6T0p4e/V6rG10FDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 342B81342C;
	Wed,  4 Jan 2023 22:01:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GEkdO0/3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:51 +0000
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
	Laurent Vivier <lvivier@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [RFC PATCH 23/27] tests: do not run test-hmp on all machines for ARM KVM-only
Date: Wed,  4 Jan 2023 18:58:31 -0300
Message-Id: <20230104215835.24692-24-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jcktdNq1Kqo1

From: Claudio Fontana <cfontana@suse.de>

on ARM we currently list and build all machines, even when
building KVM-only, without TCG.

Until we fix this (and we only list and build machines that are
compatible with KVM), only test specifically using the "virt"
machine in this case.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
cc: Laurent Vivier <lvivier@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
---
 tests/qtest/test-hmp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index f8b22abe4c..daa1e76a06 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -157,8 +157,29 @@ int main(int argc, char **argv)
 
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
     /* as none machine has no memory by default, add a test case with memory */
     qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
 
-- 
2.35.3
