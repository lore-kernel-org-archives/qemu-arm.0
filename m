Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345786ejc;
        Thu, 19 Jan 2023 05:57:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsxwc41IZxAyxjcBVfORUGd47H8RffzFfTF3eBpcXZrwj7pt/gBy2MLMbJkXh0g9lwx0P3z
X-Received: by 2002:a05:6402:f20:b0:468:58d4:a0f2 with SMTP id i32-20020a0564020f2000b0046858d4a0f2mr13787048eda.23.1674136625883;
        Thu, 19 Jan 2023 05:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136625; cv=none;
        d=google.com; s=arc-20160816;
        b=ExLZdXqrVKOE/vNcx5Md3Yh+NcOPlwAwRezHT6VAwXFBFlWb/lEg7M6THxLdes2TeS
         ygyat27+RoYZ8zVnYKIH4mUQ9voEB0830u6USMHrog20Sa3NWz1t1juuRAKmNCtDISgp
         AB4oWCzpM/FBNvqHg5rgVwnsRf3/JPIF1IWrn9mdGz6oDulZoXYK3ADKIM4ULixguWK9
         FThp6eGzSkxVMNT8rnHI01kQzT3qIoIn7j5pOVmTV0MLAHXfyl5kT3N/fm+gF9/pLCpH
         ys6jZqf/5Kk2HbiYf6e2AY6F/8arXh5KZeruaNYnOFwHhaTdlHfJ8tKZ84G9qNQHOx8W
         KQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=lSvdW174UOhlYXful1RQDh/oCdWhWPqa904YnapxfRM=;
        b=l6FpvKRKe+tEYFYdnm6Z+IGd57n95DqYBSEm+b1niJQcApI5+Yaz46dDVqgklciXbU
         wDXpd5W5B+oIEj19Q0st8wt7HjIrTC/pyXXrJkZ0P6mTfrWnQEpYP4g/y8RbaykR1Nwc
         ouXOxsnChGe+J53JoWG67qo1o0AbGoYxWS68sAPb4AqBh5jaj4rFBkz5jynh5+CYErtI
         SH+6yoOvhN4b6N2HR2fBvLi2QXEkroIGueMgErz4hVXPyA1o5Dv5/3nTY36gVg7ZirRi
         a13CwyXqdCk4cfETu0zBccFBudzUvsSMXGD1PVHjkZgaJDjb9+oLNMpAHOPQz/YVkP0D
         tn9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QUorfxsh;
       dkim=neutral (no key) header.i=@suse.de header.b=L2aRj21H;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id t8-20020a056402020800b00493ed28befbsi34795410edv.562.2023.01.19.05.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:57:05 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=QUorfxsh;
       dkim=neutral (no key) header.i=@suse.de header.b=L2aRj21H;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 812F95CE74;
	Thu, 19 Jan 2023 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSvdW174UOhlYXful1RQDh/oCdWhWPqa904YnapxfRM=;
	b=QUorfxshpZcBdQ+tm2eXoTXzKsVxQmVHr+mc8l4n1SCmWq3A7af0JmicFtznPkwGmmmonI
	EK9lx/NqzjWvEhTsJNgXxpjfdiOnLg3qD2/060ttjLbi/gz/DLAPuaQbJFJaGmwr3J0BeS
	eMvw7XzT7sIxDnwMnCmu2aKVdHcJv68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSvdW174UOhlYXful1RQDh/oCdWhWPqa904YnapxfRM=;
	b=L2aRj21HezDQy7QuS8hkyo2FOCr3cc7x3SG/LC/VZyzu2XotU7kGO72qIvChC/O8biYkFt
	+dg4DY+rbLXzPcCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0609A134F5;
	Thu, 19 Jan 2023 13:57:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YLplLy1MyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:57:01 +0000
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
Subject: [RFC PATCH v4 09/15] tests/qtest: Adjust device-introspect-test to always set a -cpu option
Date: Thu, 19 Jan 2023 10:54:18 -0300
Message-Id: <20230119135424.5417-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WnuhjDgb9Atg

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/device-introspect-test.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index 5b0ffe43f5..7d6ff6e3ef 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -304,17 +304,30 @@ static void test_abstract_interfaces(void)
     qtest_quit(qts);
 }
 
+static const char *arch_get_cpu(const char *mname)
+{
+    const char *arch = qtest_get_arch();
+
+    if (g_str_equal(arch, "aarch64")) {
+        if (!strncmp(mname, "virt", 4)) {
+            return "cortex-a57";
+        }
+    }
+
+    return NULL;
+}
+
 static void add_machine_test_case(const char *mname)
 {
     char *path, *args;
 
     path = g_strdup_printf("device/introspect/concrete/defaults/%s", mname);
-    args = g_strdup_printf("-M %s", mname);
+    args = qtest_get_machine_args(mname, arch_get_cpu(mname), NULL);
     qtest_add_data_func(path, args, test_device_intro_concrete);
     g_free(path);
 
     path = g_strdup_printf("device/introspect/concrete/nodefaults/%s", mname);
-    args = g_strdup_printf("-nodefaults -M %s", mname);
+    args = qtest_get_machine_args(mname, arch_get_cpu(mname), "-nodefaults");
     qtest_add_data_func(path, args, test_device_intro_concrete);
     g_free(path);
 }
-- 
2.35.3
