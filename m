Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663902ejc;
        Mon, 9 Jan 2023 14:43:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsQRGNN3FAuFKSmUuTBrTr9D0E96EVCczoRKBLWiyU36Xx3kULTd7N/+0EoxEb1T/49TIvZ
X-Received: by 2002:adf:ec4f:0:b0:27b:a73e:33ae with SMTP id w15-20020adfec4f000000b0027ba73e33aemr33853712wrn.8.1673304218192;
        Mon, 09 Jan 2023 14:43:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304218; cv=none;
        d=google.com; s=arc-20160816;
        b=BEx66v1wRcdWqUyYN3NuHzCh5fg2WNq5vjsBSnJtjOy/Rb/DMRf/6LMECDdmtgXtuS
         tmatYLQJjoc7Pwdkd8RKDk530zGxZgoo4XHoTOPb4uxA85Fa3UessArgMY7P7p9gnFAo
         GNZ0quDkyM20Vu9nRIxdXiSCvR5U3nCwYMUGl2pB6b3qVzBRgn6NmHNtbnlFkYjuI00o
         4NJDd/5vmCuDgVh4LqH72JEq3i001JNj666P9S8O7fDPIoPmWpgLgbLxchUenw7PmM0H
         PMvtCW8xBFeBcvchG5NcstQImjgUkQLJlsUpZ4oYhOnipW/WPNiIKq5YTGhw2teNtXhT
         pbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=GJJaQ6RX18AB1IgIirPBH7v9XndR2ZG0D9lUt6BsoB8=;
        b=P56rfc5T29TDxDsLvV2x59Vju1Z8D/ZI6o4J3q2L61JC2cbZzFuDzsSVNkcsTg0C1E
         XU+aKFhrTtfMGPE7qJQvTZ4abS+wMfI8Md0CMAB+iEr/0kmnu8GTed6uHvEPXmj/Fpuo
         ckqv3KE6bPEaskQ1i1jo6yGOAiq5JjxJkcrXR0AqWOfgCZMPXkKVvU1h8l7GDobQFMlq
         NNg6YK38F7zrUMP14KbekYHYB8pBztPao0YN6zBLf+8pE9eSNt7zkGsltIyJuZvfquot
         o3rVkf7sqni+HGevKnskrELfxbeew9SyBOkugvJF05yQ2giQpPcvoHA18sGKS3PEmOZ5
         klgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zHhLLfRv;
       dkim=neutral (no key) header.i=@suse.de header.b=h2shsNdX;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id i17-20020a5d5231000000b0027898e16e47si8018539wra.300.2023.01.09.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:38 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zHhLLfRv;
       dkim=neutral (no key) header.i=@suse.de header.b=h2shsNdX;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6E93C4D34C;
	Mon,  9 Jan 2023 22:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304217; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJJaQ6RX18AB1IgIirPBH7v9XndR2ZG0D9lUt6BsoB8=;
	b=zHhLLfRvhjUr7LV5rAIfzHgU2/WZFTBhz7ImM+U1AzkyQJRtixaVnPm4J5iFVa4myOEzmF
	zDNVVy4Ja5wAHX3XFMcgC3DbuYeI5lhdEBmXzQXqcoy8UtRbN5r5ERAinmVA5QaaD9RPXn
	XKki7LYPbgQEgS3N5PEXkoHm8mRCM90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304217;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJJaQ6RX18AB1IgIirPBH7v9XndR2ZG0D9lUt6BsoB8=;
	b=h2shsNdXIdCsBnrxdBpNaV/a8dKdocNaO4NE8Z/zu5RUmNnOIcrvepiJ4ZODoiFZ8Hg07t
	dfnNVk+QzLYoqTAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D65FF13583;
	Mon,  9 Jan 2023 22:43:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IKaoJ5aYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:34 +0000
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
	Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v2 19/19] target/arm: don't access TCG code when debugging with KVM
Date: Mon,  9 Jan 2023 19:42:32 -0300
Message-Id: <20230109224232.11661-20-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iFpEijclUib7

When TCG is disabled this part of the code should not be reachable, so
wrap it with an ifdef for now.

This allows us to start using CONFIG_TCG=n (--disable-tcg in the
configure line).

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4bda0590c7..2af75d0904 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -254,6 +254,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
+#ifdef CONFIG_TCG
         CPUTLBEntryFull *full;
         int flags;
 
@@ -270,6 +271,9 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
+#else
+        g_assert_not_reached();
+#endif
     }
 
     if (regime_is_stage2(s2_mmu_idx)) {
-- 
2.35.3
