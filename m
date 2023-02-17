Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128840ejb;
        Fri, 17 Feb 2023 12:15:24 -0800 (PST)
X-Google-Smtp-Source: AK7set++McMMGfG5SRt/eK0FKCO5DMMHm5oWYCgDb6I3nKh5dBFZHMWJq1uSQGAgzg6gEZfyiw/t
X-Received: by 2002:a05:600c:2e83:b0:3e0:6c4:6a38 with SMTP id p3-20020a05600c2e8300b003e006c46a38mr1191281wmn.33.1676664924150;
        Fri, 17 Feb 2023 12:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664924; cv=none;
        d=google.com; s=arc-20160816;
        b=wBX6qtLDLO4JceN4l+3hBqqw25MqNjzKNfuqUSVmZcYagTjen65sPgOZ0I3HGrwvtc
         e2lmM5ihyQt+bUT1DixqaLMpZdzgv+gXhv+pX7nWdDu7/IiBiaDL5O09LeLX68rcNTzQ
         iPua7Y5aKyP2+qy3muDr0e25u+30ychQoIrXdJSDKkhnlQqyeA9Kx1c5BGVzD9/Eg2ED
         RlPMEv/udhFLcRb35Ek8DHPlfzt01HZIEjpb/bOC9dzTDuadZhuCouLlCbmozlTCBu/u
         xi8bkuLYM/KSw0YIpIXaP0HaEsQOQWbeSmKYYTh2ZLYMhxUPA0RIKa/ZTZ6aWPY6AEWo
         Ly+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=YZq8lMRctNgZk9sWCbt1LBIQIow6pNjQpnkRoo98og4=;
        b=OYT8y4keoXEPV0dsverG5dbJBQjc7JyE0/rVkZTDNzQYeaYpwvfrWlM72Qqqyms2kn
         n+ij2slkSNGjCH1xi3l/6sH1aN4QPCs+cLxt1rwp9ljzrfWVG9gdFzRbjmE2Ftxj0zWP
         DD6TxkZz83fFFjO91E5rK9+8URYzFAtglK7bohO6C42oBxaoixLAG4wVZ3I4ig9R+LEy
         Mzh6mvNLxeNQBb9gQ5d6ol/GwMIgp7iXXS/285Sv/pAAqdaPdsQ3859EmQiWfnI8CKNp
         ogfOLGA6pCyo3mU+ekmrrN//j5T6znMK9LxRQBzdKgKcbMBxGLrIeXMRF6z34Leiwt1q
         pqLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=1Hut9i51;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id m17-20020a7bca51000000b003dff7adac19si7859633wml.103.2023.02.17.12.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=1Hut9i51;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C101434657;
	Fri, 17 Feb 2023 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZq8lMRctNgZk9sWCbt1LBIQIow6pNjQpnkRoo98og4=;
	b=1Hut9i51JKlbNKG3xv96tqEgPSIEzH+6WA3LRVTqCBB48orTq75pL2u58c/VqdvGb1QLhj
	DVTngyhv8HNpMJXjoQx+fk75jcigEULXfPrWMiXd0w54gRD5jm5K2M5bzCjhxvdbvDDjnL
	Tcd0v7q+SZ0IbUyIW3/59IRaGJsztYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YZq8lMRctNgZk9sWCbt1LBIQIow6pNjQpnkRoo98og4=;
	b=L3oVKCsLV406C55lqnaX2SMzBXnr2W/VA/CT23FBH36N3OLbxADn9lZ6ZwDA3ks5iTdfU7
	ifeGB2mTasRCjNAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31767138E3;
	Fri, 17 Feb 2023 20:15:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cP+bOlfg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:15:19 +0000
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
Subject: [PATCH v6 25/29] tests/avocado: add machine:none tag to version.py
Date: Fri, 17 Feb 2023 17:11:46 -0300
Message-Id: <20230217201150.22032-26-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Fh6y/Rffonxm

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
