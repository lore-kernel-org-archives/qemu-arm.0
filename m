Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414885ejc;
        Fri, 13 Jan 2023 06:07:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt75If7KOdIv2FNB/ufg6QTO99aac5V1X13+G0tdtUQ+D1MkIRBivhUxoxxhf7gvL4xQ4ok
X-Received: by 2002:a05:600c:3b95:b0:3d9:baf2:315b with SMTP id n21-20020a05600c3b9500b003d9baf2315bmr30943568wms.11.1673618851859;
        Fri, 13 Jan 2023 06:07:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618851; cv=none;
        d=google.com; s=arc-20160816;
        b=SXydjLPZO740b9Jh5R0uSWzsfEWM9Vlc7YXLqrJkIaXkka6HKmfy9V+29ZGgvyxc/x
         vSyH4mMIxKLt7DRN0FX34Ljki+YGSYHABciH8WNBlAuqscd+0/AzosYXrBJDY0Puxy52
         /GsPPW9/eD/izxDHEI1n4A7uG+NBU3jRnqLvZi0Vcr90ufo83AQwFzsOzBTX/9plcQ1S
         wqv4f9RQBYuN1xXEA2bFkEvoH2Sgy582RTzMDPgDSR7KaSFybNWnLdsjS4p8FQMO51KI
         +te3jUlFWH6OIfRUJ1ZkhVtwoJWjHjBHxAmpkfSBUrGAfSMDomf7jH1KsMaAoeqi3CwR
         ETpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=tsVab1v7flwJwn2herGnIiPeja3V6sloYUiKLt3jrmY=;
        b=aM1ACzd9ghk+HtJhotXdwfhoq9mT5Gq9tvOclpVFT7vCsiN8aGJg6mFHn2cOE8f7J+
         OBVnx0r4gUy5RncAwZ13TjpmLJf0eNGvLlfbyd1QzhmGrBW2TDsKjwZbUAvvU6YKGMo+
         MUti+y2G/SKFeeidPsgeJxPoZNDRKpl7FQc8gAI77bdFafcDnfgyPMgX6/YycWYtFMri
         02G93P78ukVAemYIGRoEArogmRlcPzyIUHZyUPan4kPIXKPR3PKquDSvSFwAGda17HYP
         L5xBVNiUpkv/sJTvTmwewXqAh4R7+8La/OKiL7ZB6fEyQQ+J3VKxArO/q5tHUWYIhxu2
         GpNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="H76Yj/Qv";
       dkim=neutral (no key) header.i=@suse.de header.b=coboO5Vh;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id e6-20020a056000178600b002bbeac5fb38si14940408wrg.778.2023.01.13.06.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:31 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="H76Yj/Qv";
       dkim=neutral (no key) header.i=@suse.de header.b=coboO5Vh;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 615E86069B;
	Fri, 13 Jan 2023 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsVab1v7flwJwn2herGnIiPeja3V6sloYUiKLt3jrmY=;
	b=H76Yj/QvENq5JsalBRsPQDCGB+WVDe+NnksPch/VLXNLMcPtLK0GWdLXppGkuZjC62UQAC
	c/fyFvswOKRR11RKEFIytnIFjxAYaitATLcLUvd7p0yh9FjvyHW+lbHJ7LS6o7Pk3llqu2
	Fss1ZR6EcBSIDJphm1X4hXd72laQ2HM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618851;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsVab1v7flwJwn2herGnIiPeja3V6sloYUiKLt3jrmY=;
	b=coboO5VhYHWQvk8jfWqOeHWt7cOnefaWcMkK0eJ9K/SDmySMEcpB8V3DXbBOx5bS7Db/XV
	CRW9L4GeUu3ANCCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5FEE71358A;
	Fri, 13 Jan 2023 14:07:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4L6mCqBlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:28 +0000
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
Subject: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG when CONFIG_TCG=n
Date: Fri, 13 Jan 2023 11:04:12 -0300
Message-Id: <20230113140419.4013-22-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3Os5qfwaGTEZ

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 4be1415823..9a052e41fc 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
     qobject_unref(resp);
 }
 
+static bool tcg_disabled(void)
+{
+#ifndef CONFIG_TCG
+    return true;
+#else
+    return false;
+#endif
+}
+
 static uint64_t resp_get_sve_vls(QDict *resp)
 {
     QDict *props;
@@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
 {
     QTestState *qts;
 
+    if (tcg_disabled()) {
+        g_test_skip("TCG support disabled in this build");
+        return;
+    }
+
     qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
 
     assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
@@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
 {
     QTestState *qts;
 
+    if (tcg_disabled()) {
+        g_test_skip("TCG support is disabled in this build");
+        return;
+    }
+
     qts = qtest_init(MACHINE "-cpu max,sve=off");
 
     /* SVE is off, so the map should be empty. */
@@ -429,6 +448,11 @@ static void test_query_cpu_model_expansion(const void *data)
 {
     QTestState *qts;
 
+    if (tcg_disabled()) {
+        g_test_skip("TCG support disabled in this build");
+        return;
+    }
+
     qts = qtest_init(MACHINE "-cpu max");
 
     /* Test common query-cpu-model-expansion input validation */
-- 
2.35.3
