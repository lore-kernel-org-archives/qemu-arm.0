Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593445ejm;
        Wed, 26 Apr 2023 11:00:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350YPaxibE+YqXo6e86+rEc1qs1fOcwrNIcPY4MLQQIDV1BGDwJ9u80CTax6CoN0743DA4yZ7
X-Received: by 2002:adf:fb49:0:b0:303:6209:65f4 with SMTP id c9-20020adffb49000000b00303620965f4mr10938947wrs.38.1682532039895;
        Wed, 26 Apr 2023 11:00:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532039; cv=none;
        d=google.com; s=arc-20160816;
        b=Wj4xhLvvBfa2hepfsV9qQbOVCBfNHBHWcd75fF9IkZdfmhOC8qxK2UijnaM05ZVTn4
         aY/j4+q+rO3vUawqIVswYDbjxxuTGvM+n9aTMpGYqNabmMKrlqhLbKV097m/Dt41MAtj
         cGLHlC3UcBJ/WeK49O3SeNSVaDdoX5842r8xRAUFT+xt1L4kby0kv5B9f1GuzU2I6TQH
         5WL8lb36P9DawffB17xph5lZ7n02G6LPhIaFhjqjgIxB+nAW3Zlgrb4mTw7aQyMcTdOJ
         lJKEu1br81B9+l4ZYqmgYwJLYX1Ji7ajU3bXRkT+SQpDjtT9n6BUy+CY3m2znIS6wfPl
         F5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=I+3veZcdIkWERrIq0U6SOTlgqwDPgCl2NC5OIDpuMSU=;
        b=BI9p89y6zl3YUf1JLisCigqrGu4b+ejyKZJ9c3qzTc7SUEp+J0/+dSAlXQHJscv3v8
         jl7POEz6UqaAG+bgFX9Akjql6O/9ffGd+MJNw0bXKe2vh8CCAZku96TYIpj6iUf65OAG
         DJ/KXhJnvxlgcX1R+mrJy5We4cj2ZljbNPQoK4hrs5bR2FfBOVW4BTixWSCsTZ2ZpF4Q
         Njd9CMhMPye48uSHPCzNzAvC3OxwAdDjHzVOtF4xcI65V8PHTrPS4ia0inXGmRo2JzxS
         ymebFOfAjJDx3kIO14IFWLOkOYrewv9lKI7a3hHmBSVG8uLG3kt21Vnc91lNmpk+oM/K
         uWnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oPudpkUd;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=U4af43ui;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id k6-20020a5d5246000000b002fb6f19391fsi10886451wrc.525.2023.04.26.11.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=oPudpkUd;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=U4af43ui;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 90A4E1FDD9;
	Wed, 26 Apr 2023 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+3veZcdIkWERrIq0U6SOTlgqwDPgCl2NC5OIDpuMSU=;
	b=oPudpkUd7w/8C3Q8ir2Vtd5u6uHqVW2hK/k12YqZNKwizHRb0F8wyMQcHqQOGExd21R12q
	tt4oJIaKfGX303xACXKBGioQEbBCMRUkQspHYZ9gGmfxFEp1xn0hqeCMnqsYERRZypiAiB
	cirjbqhHdSVfJRLfQY8IsFqsAAOmg08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532039;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+3veZcdIkWERrIq0U6SOTlgqwDPgCl2NC5OIDpuMSU=;
	b=U4af43uiO4zpeLlLUQQ3ut3wIalvH5tqRZz0/znkbyenwTk+evskP8U0vzMsUB+lfiYG8S
	GeTrDvnW5vNeiTDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48399138F0;
	Wed, 26 Apr 2023 18:00:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WGpDBMRmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:36 +0000
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
Subject: [PATCH v11 06/13] tests/qtest: Adjust and document query-cpu-model-expansion test for arm
Date: Wed, 26 Apr 2023 15:00:06 -0300
Message-Id: <20230426180013.14814-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OFAqPfZCt56I

We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
query-cpu-model-expansion test to check against the cortex-a7, which
is already under CONFIG_TCG. That allows the next patch to contain
only code movement.

While here add comments clarifying what we're testing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 1cb08138ad..3fc33fc24d 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -506,9 +506,23 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         QDict *resp;
         char *error;
 
-        assert_error(qts, "cortex-a15",
-            "We cannot guarantee the CPU type 'cortex-a15' works "
-            "with KVM on this host", NULL);
+        /*
+         * When using KVM, only the 'host' and 'max' CPU models are
+         * supported. Test that we're emitting a suitable error for
+         * unsupported CPU models.
+         */
+        if (qtest_has_accel("tcg")) {
+            assert_error(qts, "cortex-a7",
+                         "We cannot guarantee the CPU type 'cortex-a7' works "
+                         "with KVM on this host", NULL);
+        } else {
+            /*
+             * With a KVM-only build the 32-bit CPUs are not present.
+             */
+            assert_error(qts, "cortex-a7",
+                         "The CPU type 'cortex-a7' is not a "
+                         "recognized ARM CPU type", NULL);
+        }
 
         assert_has_feature_enabled(qts, "host", "aarch64");
 
-- 
2.35.3
