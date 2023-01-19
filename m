Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345756ejc;
        Thu, 19 Jan 2023 05:57:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtJ2oU/WsbK1v0P5wLKiWncWlpbi6tEy7b3Y671MVthggMn/nO10VFVKCa/r+WAzPP25KQi
X-Received: by 2002:a5d:4f90:0:b0:2af:8d8b:726e with SMTP id d16-20020a5d4f90000000b002af8d8b726emr9668123wru.1.1674136621953;
        Thu, 19 Jan 2023 05:57:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136621; cv=none;
        d=google.com; s=arc-20160816;
        b=mHATnWnw4mVlE2/wcnPUFrejl69ueAWkzNTSPY9jodFUDKek/UTcsW6UBd1scANbMB
         O9yVpTuKLPhQcn9s18Al1LTnNVTl96kDKRh5rxf/pOoHFyfxf82lai8iDjpPJ18UFZ/l
         LPXmkycASWCAcNT7bvq8u2YFDvSMdYXnozh/luKVV2nZLJXVWe61xFVGLiaAFNLlQQ2f
         acZOPZJvuTRNlHDNiaXDcYW/IKS1QEP6s4IaV0FN58HUaY87kybr+g/AHmQ3K6fHTfp0
         +sn1nQBMcKYxyFjVwF2RHouNLrx0zW2mBXAvWYfYTgw8WHcxm39bE4loxiWR29qO/AfB
         5oSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=jVIAoajRUGSfIyuCmuIYwLpNRsCSx50sO+LkAUTEiBQ=;
        b=NhMWVcuIzJPt+g6b/FPMeiUQrfVaykgWUsnoNAK26pvHsjjzJrJb74LaTa8yqEn8y1
         SnGXyqAw2pNH3S0aTs2X3pn9CeiVeC7pm9NGIrqPl/HTcrJ6ffp9hf9ylDwTnSbs9iP/
         cSOojwjwR17SLP37ENlu1gSDdsIAYKypm0XBaacvbSaFdBUlKUstZXDki2JhyHjFN9bb
         /xll5UGGOsSUJICd4AhpUI961AhVJWQBg04CgVhuapQZrqRmN7UO/68RJT8xgDFc32HO
         iBjcytbFwm5zoPTbJRLyyADfHz0jzfp2Ze86nv4Q5MChonxI8Uf65/+Wh52YAGMyiTOM
         kqNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=b47EtG+3;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Ufvsker1;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id n12-20020a5d588c000000b002bbdb48c889si7159874wrf.363.2023.01.19.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:57:01 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=b47EtG+3;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=Ufvsker1;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E38D5CE73;
	Thu, 19 Jan 2023 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVIAoajRUGSfIyuCmuIYwLpNRsCSx50sO+LkAUTEiBQ=;
	b=b47EtG+3hHfdBHb7Q1kuWl1Rvud7VOQIAiPSxNMZG8JpGdOxQOy5mc8Pkr1JBXNnLwoTpc
	5hhdtND/mGDtATABmWoaO13RHVbQ51wLG9cW2lE0SDcV9TOppKSSJHqqq8zQlvNpR0ErqM
	RrblfZKPI/6OlwYgtR3V4kc8XYNSC1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136621;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVIAoajRUGSfIyuCmuIYwLpNRsCSx50sO+LkAUTEiBQ=;
	b=Ufvsker160jzUSC9OqfDZqBGmOVMgrlzw4DkAtb3a99EteIAGOLz4Av5fMTEEMaFy2eDdY
	j/ER5pTj5bfnU/Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDFD3134F5;
	Thu, 19 Jan 2023 13:56:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uImKJClMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:57 +0000
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
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>
Subject: [RFC PATCH v4 08/15] tests/qtest: Adjust test-hmp to always pass -cpu option
Date: Thu, 19 Jan 2023 10:54:17 -0300
Message-Id: <20230119135424.5417-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tS11aAGN1P/V

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/test-hmp.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index f8b22abe4c..c367612d4a 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -121,21 +121,49 @@ static void test_info_commands(QTestState *qts)
     g_free(info_buf);
 }
 
+static const char *arch_get_cpu(const char *machine)
+{
+    const char *arch = qtest_get_arch();
+
+    if (g_str_equal(arch, "aarch64")) {
+        if (!strncmp(machine, "virt", 4)) {
+            return "cortex-a57";
+        }
+    }
+
+    return NULL;
+}
+
 static void test_machine(gconstpointer data)
 {
     const char *machine = data;
     char *args;
     QTestState *qts;
 
-    args = g_strdup_printf("-S -M %s", machine);
+    args = qtest_get_machine_args(machine, arch_get_cpu(machine), "-S");
     qts = qtest_init(args);
 
     test_info_commands(qts);
     test_commands(qts);
 
     qtest_quit(qts);
-    g_free(args);
     g_free((void *)data);
+    g_free((void *)args);
+}
+
+static void test_none_with_memory(void)
+{
+    QTestState *qts;
+    char *args;
+
+    args = qtest_get_machine_args("none", NULL, "-S -m 2");
+    qts = qtest_init(args);
+
+    test_info_commands(qts);
+    test_commands(qts);
+
+    qtest_quit(qts);
+    g_free((void *)args);
 }
 
 static void add_machine_test_case(const char *mname)
@@ -160,7 +188,7 @@ int main(int argc, char **argv)
     qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
 
     /* as none machine has no memory by default, add a test case with memory */
-    qtest_add_data_func("hmp/none+2MB", g_strdup("none -m 2"), test_machine);
+    qtest_add_func("hmp/none+2MB", test_none_with_memory);
 
     return g_test_run();
 }
-- 
2.35.3
