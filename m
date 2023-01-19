Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345719ejc;
        Thu, 19 Jan 2023 05:56:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsznXs2Fj1jZhmjepSy8tjz6CRnOG72AURhg8dwIiYchREzHufTmmN9FTf3kX3lAtA83cT0
X-Received: by 2002:a05:6402:501a:b0:47e:bdb8:9133 with SMTP id p26-20020a056402501a00b0047ebdb89133mr13996779eda.38.1674136617748;
        Thu, 19 Jan 2023 05:56:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136617; cv=none;
        d=google.com; s=arc-20160816;
        b=x6F/Qf4SFqjHRxgJVK31qa71Tgvs6VTqZ4W/0CAQiW24zmzpkOAnkTYnfcCaP2o8Br
         xax+56wzYg2WF6AyWFXm231792GKoQ6n+M4PKs661tpXsW/IrnBpz4+/lSJr2awP3TVa
         AWxcyLLtgB7aAPyC9G83UaN7yJSDk6IL2J7YypjBYnq/2Q975snGojivcTEzroMCOZG8
         UQ8iPGbm0SVT/FBaD7m4Jdd06orKkN1MdV2Jjlv7AUqUmPVOe12OtNt2w+sD0Yt7hSXJ
         xp7z1gBiQIreXIzcSXJ++HzQIkGF5hbcYglJ42YlB8bf35aCoyNRWhGT3NDJ72mT8V+m
         C8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=lxrWaE16yozIzsy6MYwQ2ElnYdRKzu+lkQhgFbpYZCs=;
        b=PXdYejrl7TuUDm4GWz9tr4CO4tmR/Sq5P0WAKwEnKdpsDKjE1KqQek11BeInVPTkOp
         HPvdsSjtB36f9tiDY8fQ6CZOZDNMRKKhl2Y28hQ3nRBXrKFST4YzuWMXfEX5VosdsLxo
         nwOpEubKpN0taSbntSK2lXCG2VU12qMOczzbMCg3rMhCzjzZrAAaf8emD+GqIsY77QFe
         eR4s45uSAjI7nHFQrl3HGKv2uCAC4+f9bclgrHDaB1ogyk7aTk7+ZhP3MrJyrN3Unusi
         sAXmSAGOihzug5sDy127+yIsc8T5ETVVpaEmE/6+nvrb3Xho5KYWmHxaWEFLMJnzzEGa
         jVoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NlRRNdGA;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id h20-20020a05640250d400b0049e5fecfe87si3458414edb.503.2023.01.19.05.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:56:57 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=NlRRNdGA;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A7123F42D;
	Thu, 19 Jan 2023 13:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxrWaE16yozIzsy6MYwQ2ElnYdRKzu+lkQhgFbpYZCs=;
	b=NlRRNdGAvSOg6zR76ssvfseWB89iZx3hK7Ot12ezt/RrypwCfxVM07eempfSN/1B6BHYSl
	oNj11537Lfsc6nHonWNYqubX1ZL1lK9Tfwqj41ki2PJJDnHihNug+3uONhsFxuumvKtgB5
	plajpx8dfQmFy5IyyKpYNzR1o69CyCU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lxrWaE16yozIzsy6MYwQ2ElnYdRKzu+lkQhgFbpYZCs=;
	b=3syI/HaJ3PkKJOQyQY9hlyKStjMYczEkIgbNbxq/f43izSdTFscuiaEsVMupxq04zbOkEp
	NyoYd20DfqabmjBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D118D134F5;
	Thu, 19 Jan 2023 13:56:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0OMhJSVMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:56:53 +0000
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
Subject: [RFC PATCH v4 07/15] tests/qtest: Adjust qom-test to always set a -cpu option
Date: Thu, 19 Jan 2023 10:54:16 -0300
Message-Id: <20230119135424.5417-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iRdRfjKdRUEY

Start using the qtest_get_machine_args function, which explicitly
sets the -cpu option according to the machine default.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/qom-test.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index d380261f8f..462e3c4281 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -78,14 +78,28 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
     qobject_unref(response);
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
+    char *args;
     QDict *response;
     QTestState *qts;
 
-    qts = qtest_initf("-machine %s", machine);
-
+    args = qtest_get_machine_args(machine, arch_get_cpu(machine), NULL);
+    qts = qtest_init(args);
     test_properties(qts, "/machine", true);
 
     response = qtest_qmp(qts, "{ 'execute': 'quit' }");
@@ -94,6 +108,7 @@ static void test_machine(gconstpointer data)
 
     qtest_quit(qts);
     g_free((void *)machine);
+    g_free((void *)args);
 }
 
 static void add_machine_test_case(const char *mname)
-- 
2.35.3
