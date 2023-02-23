Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp710006ejc;
        Thu, 23 Feb 2023 05:11:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9EjOWrUy3LZwj/4tD8OZtouWjQKZqGL0ubcBSPUtA6+wsq96eXHWZJ+ImMK/ZQia4fXaIG
X-Received: by 2002:a05:600c:ac8:b0:3e2:91c:7cb7 with SMTP id c8-20020a05600c0ac800b003e2091c7cb7mr7830525wmr.39.1677157902826;
        Thu, 23 Feb 2023 05:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157902; cv=none;
        d=google.com; s=arc-20160816;
        b=SWtjDuuygo9i8HSWczvDSzgqWG6BPDkDS5aaXjdPz/TcnsBsbu2LLXcQfIRkuhi5U2
         PseoTYgeJKRid8IF/NhkKdJBv3dCP6Sj5eKUK+4ydLwy+e8xo9WzusDecMU2OL7DgHF3
         pj7/F4wN4q2saFN0GFcH41X8tetlEI2876o5l2hEFXLtDf0Psd8I9WRMwhU04NLA1zPE
         UTPu84UsiJm7VX6qzsOCFx8C58PsjfEHZDYRTLXCDfM2kfl3voVPVDGEFF6ZQn+LU5r+
         FP3lUPbdchjcTEiV92KJuhCq+9MzSL8loU4870UWytQwZ32fsSfixmCB63Hx6m88Q7k5
         UyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=YZq8lMRctNgZk9sWCbt1LBIQIow6pNjQpnkRoo98og4=;
        b=Su+Tbl0smmVKgLJajWe+XW0+cqrMQC25aCsLLMAKqQqX/x63bBvNiNlStSzUIXErd0
         /o4dmeP42A0rx9HK+n3ZcMd0nZ/LjLRgkE0aKPo1ljleBTQwFkaQbipH9yajF+UB0K4n
         IxmRWwT4idMN6FrsjQy219JD965jfQp8UiqON1cwbx0GNHWo4ay7yKBKx4ajoJkO/GZY
         iHCabCUCAlejQwSSH1gVqX+fb/NPHIx64Ugi5FwnFBfAvtOuLQYvMRW0fAJsi2svOp2X
         Wxa2SOv+hL8uQT45WlmHNFsetVyHeMv9UqK0l0xAbEWmfxeP0TC4pfcSZvRxARZZS8un
         seXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wJgkdkdf;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id s26-20020a05600c319a00b003e206ef6c7asi2032936wmp.18.2023.02.23.05.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=wJgkdkdf;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 75E07218A9;
	Thu, 23 Feb 2023 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157902; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZq8lMRctNgZk9sWCbt1LBIQIow6pNjQpnkRoo98og4=;
	b=wJgkdkdfc8+ADoRmoKLN0woHqzcIs3SS7aPcxS49fgiV5yQLtgbMcQe7QWwE7RjMPcE8Ix
	pM8RbrMgxJ4WR2dSNn/KeBHShlmI1Fzak6CK7SjlVzgHpjwsBNUyGWYYN9m8oX2ijOK819
	neVgwc56bo7/LkFwWg7BjPW+QlijHfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZq8lMRctNgZk9sWCbt1LBIQIow6pNjQpnkRoo98og4=;
	b=Zq2QxIR6Uxxk10pAQFTa8OcdPR2U9aUWTLaftaJZe48mPd+p4+f9fdAyNooPUG3wo+E7KV
	plEmzORQpK8fKuCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4D3B139B5;
	Thu, 23 Feb 2023 13:11:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id UND5Jgpm92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:38 +0000
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
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v7 16/20] tests/avocado: add machine:none tag to version.py
Date: Thu, 23 Feb 2023 10:08:37 -0300
Message-Id: <20230223130841.25916-17-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uc+5MKG4IhGB

This test currently fails when run on a host for which the QEMU target
has no default machine set:

ERROR| Output: qemu-system-aarch64: No machine specified, and there is
no default

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/avocado/version.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/avocado/version.py b/tests/avocado/version.py
index ded7f039c1..dd775955eb 100644
--- a/tests/avocado/version.py
+++ b/tests/avocado/version.py
@@ -15,6 +15,7 @@
 class Version(QemuSystemTest):
     """
     :avocado: tags=quick
+    :avocado: tags=machine:none
     """
     def test_qmp_human_info_version(self):
         self.vm.add_args('-nodefaults')
-- 
2.35.3
