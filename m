Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663881ejc;
        Mon, 9 Jan 2023 14:43:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtropPxs+aw0zsgwa9RqsoBtsF2l34X12qTUt40IMc1fiVOxCqPAjo9GwXJqzCIa4Nq6J2P
X-Received: by 2002:a05:600c:4920:b0:3d3:39a9:e659 with SMTP id f32-20020a05600c492000b003d339a9e659mr50593139wmp.21.1673304214874;
        Mon, 09 Jan 2023 14:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304214; cv=none;
        d=google.com; s=arc-20160816;
        b=k48pPBeUBE4zrDaLpBVgGKaOraQC69j2uoPgVnBXp1o1s8S5FZi6vUZTVa8qkHYNeL
         v1FDCxzG+b1SyNyLVUJvuQhhq0wuf8MinWMWtJMUGP/FJNjddc6kCfYqhA+m5yM6Xxui
         KDaTR0frzJZh4f7mqQfknzflN3bTXBz9O60Gjo/ZqbDomPc9pUQGyfofmPWtYO2X41QN
         xzp2lEP4L2rmKclhBvCTDQD19BWlhRC96rNooGARXLM6IcQgv/aQEGadeIVtn6SazlLO
         PSAbubj7jqL1NqR4oDloujgDUCNDojAkZeC5+yCHqXFTo9/UvWqdwMAmaaPNbALk/b7y
         UxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=UcPvJ2TkX8BmU0xYGg1vpayMTRS1XI7tg4m7dSlXwDU=;
        b=RnXxNXXOMj6uk/utO4ssJ62R4+B5I+FkRKO2x/P5chjeTUrBbrv2e4C0recUCEQIoq
         HW1JTgvIgCuFAUl4WmCZq7aJ6GZ9e5kkeI22+I7J2RH+R3MilN/V7Coq8d/a49RqrzC4
         CKdN1mOPzwRIRqyBHXzppR5IBUjtsYWbz9qAajpUguArSnQWyYFZ5+t2NAAJpcNCR/xV
         kLDLnLud23pGWafhqBlN0FQyW5Pl7tUuNokFhgyaxJLVklLo4WP06VbEzRIFSqz8FBRV
         3DxXZyRrjj//IosG24FaqoSpuIgLro8ihvCzRKZlrJUuQvs1BjFGO/e9imSLVVfefnF2
         HgMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="1q/S1jlg";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=sEkkpLQU;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id bq18-20020a5d5a12000000b002366db17cb0si7922794wrb.915.2023.01.09.14.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="1q/S1jlg";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=sEkkpLQU;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 724FB5CDDF;
	Mon,  9 Jan 2023 22:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcPvJ2TkX8BmU0xYGg1vpayMTRS1XI7tg4m7dSlXwDU=;
	b=1q/S1jlgKvGsJxOItlLNN7nJvVmPUIJk6RwWsG7iCcndL6hXg8SWxuq4xrU8PAKTMF2hUS
	607JHLI4V5X4NSxftcRQX3iYYFe+v21h18QnidIMABm9EC+UhMSdcO3N9DOyVo2leshRza
	quNCkPksybxSLp5EWXXZlxt+pGhl6Yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcPvJ2TkX8BmU0xYGg1vpayMTRS1XI7tg4m7dSlXwDU=;
	b=sEkkpLQUHcvJtHvwJaKBbtA7qMjeNgbRGn4fM63RuH+Pr6SjrcDZWSX7s90axsx13flqds
	QjarXhbG2iNW28Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D62CB13583;
	Mon,  9 Jan 2023 22:43:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0Bp1J5OYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:31 +0000
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
Subject: [RFC PATCH v2 18/19] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
Date: Mon,  9 Jan 2023 19:42:31 -0300
Message-Id: <20230109224232.11661-19-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EvkKn/KfwOrT

This struct has no dependencies on TCG code and it is being used in
target/arm/ptw.c to simplify the passing around of page table walk
results. Those routines can be reached by KVM code via the gdbstub
breakpoint code, so take the structure out of CONFIG_TCG to make it
visible when building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 21309cf567..d5a4f30717 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -135,6 +135,10 @@ typedef struct CPUTLBEntry {
 
 QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
 
+
+#endif  /* !CONFIG_USER_ONLY && CONFIG_TCG */
+
+#if !defined(CONFIG_USER_ONLY)
 /*
  * The full TLB entry, which is not accessed by generated TCG code,
  * so the layout is not as critical as that of CPUTLBEntry. This is
@@ -176,7 +180,9 @@ typedef struct CPUTLBEntryFull {
     TARGET_PAGE_ENTRY_EXTRA
 #endif
 } CPUTLBEntryFull;
+#endif  /* !CONFIG_USER_ONLY */
 
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /*
  * Data elements that are per MMU mode, minus the bits accessed by
  * the TCG fast path.
-- 
2.35.3
