Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663744ejc;
        Mon, 9 Jan 2023 14:43:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMDAaCZmURP6eExIMweJ8A2v0Yxu3gPk0sEGbKvpQyhr9Osl6wutqW9TfG2fGdXXviIOMa
X-Received: by 2002:adf:e383:0:b0:242:69f4:cb6f with SMTP id e3-20020adfe383000000b0024269f4cb6fmr41535771wrm.32.1673304198745;
        Mon, 09 Jan 2023 14:43:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304198; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlYn07z3Osp22xkDYT19PGpl5xIAPBSqMm2YNkOZEfOndrhYeN7is7N274irRBy/45
         EysqCFJYVHpidnB7zsFc6DF/8dxEVVw5WlAxi265GdcxFZ/vGD4sHbSv8PJG/9qxPwTE
         h39p40HuMxoghWCiKs2oNkZ9TiDJknAdeF+/S/s9Q/6c0vKJEjiZl+Ms9M6vRWZM+DPz
         8rI+5uj8HyN6DFi2yVlTN205lCQx7JL5clTiG8TcxIZG/cNWpTNa7P0D+LAnF9H6EIR2
         F+xMUXWRxjJM8wQtHV9rG8ItkHRTxqGgXBosz0mKQFnq3x7PZHjYfi9Ht4OrkkttCqwr
         8G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=1TOeNshkMsKn2Y3CsqOHq9PQkcZYQvOcN/VHQdwTADc=;
        b=lRFomcgE9EOHZDPOZFV8rQ2j/eCEPFmF0AGHOF4ROuIKZQYiPgdqZhTrhk0V3RoiwI
         a/o+1v9VymQ/kxalSoJQErY2RUPQofuFXSSNZPiLnZQBxTFEUR2UAst5/WP9aWns3H5m
         qsp5/TSk/sP9XDR7g1QwtzBRHqJquM7qsak+hAwd3pr6kBHr9QBW9wWgK/JrjnIQnalR
         WyCwLblX6c/qNme4eXMilUdPXRnmoH7zOusZ/sz9gCAimrKikScbSOl1YyFeeE+MkqHW
         MudDKu6rMIZ8t/wUCqAMZWsjGyK5+0T5MnV3JU7rABO8bKaPcldlNxcrtEnI40dRoVbc
         I0eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Y5mJLlJU;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id 6-20020a056000154600b002b945cc6e5csi9245061wry.877.2023.01.09.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:18 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Y5mJLlJU;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 459053F8AB;
	Mon,  9 Jan 2023 22:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TOeNshkMsKn2Y3CsqOHq9PQkcZYQvOcN/VHQdwTADc=;
	b=Y5mJLlJU7jn+plUG6zJNlfKJxcqtf+AauJMcOcvYiqKWOtAllU1C/pBlh1R5TB1iBJ+K71
	Rw54NziHeG/qXubVsGHpjYJU+amU7LTTxHyfA2fOA4WC4RWvI6wGOe9mZphh1p0loZkigQ
	5/AcAcPLhoen364OsiF157lvChfI+Ok=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304198;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TOeNshkMsKn2Y3CsqOHq9PQkcZYQvOcN/VHQdwTADc=;
	b=ZEr9t76sBPGskZ9LDMLm5p269z52td372NzYsVh7HOyiZXUtyFhIEhE2JYhUzpAPxz5oJm
	1sMjkr5XMemRENBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 05C9F13583;
	Mon,  9 Jan 2023 22:43:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4Gs4MIKYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:14 +0000
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
Subject: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines for ARM KVM-only
Date: Mon,  9 Jan 2023 19:42:26 -0300
Message-Id: <20230109224232.11661-14-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vB+tpOGz6fGW

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
