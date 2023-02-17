Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128317ejb;
        Fri, 17 Feb 2023 12:14:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/8IJ6Zve1pUG+S85fADgBd872fm4F4yjAujal65cE8LQiHJ5ci1klrENSZETWOqtTey6fn
X-Received: by 2002:adf:fc50:0:b0:2c5:d3d1:dd6a with SMTP id e16-20020adffc50000000b002c5d3d1dd6amr3222280wrs.53.1676664893769;
        Fri, 17 Feb 2023 12:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664893; cv=none;
        d=google.com; s=arc-20160816;
        b=cH4sIpeSTtBF5AfxjsPOECAalL2+ABanoXYB09HksSVjttlJ/vFz+0LXy/hFYf+Bjn
         PArUknS+PqABp4iQYvQZxcD/JwbO3dUxgd1cC83mbnvgA3S5bNi5dJPmw6wjCvapV/Hd
         16xOC0KyERGiilncMITgg10SM+c2KnNLhc7FkJp1gNL8+QQ0eRNp8vKGzyA/U7SCW/0C
         x5towyRprM1UXkdqWi/YppJwcNoS3CkPRLD+VxWwVNNJ36Dk3EGz2I+eJIfatNJtTVJJ
         df8egSifqKqMkQx85oQ3zxlOXrY7DbKKHekliCVV5vi0hkuO90fUhd6XhXHvtbl0Ty7q
         zqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=FooQIYNRpaG7p/4mjdUizDlxlIhcISAOHW7u6JUqYUI=;
        b=XJf3p8tarc8/SJSDnbQi6EdKPjvME5DK6j1Nj4PJgXbG7I8cV0OOmwaRuL9BV1ogzM
         Zm52FwIB/EmNxU1cSZBWpH9uPsF5+8gRVcxGkfx647DCFTMcf7BNQQXf7hIBHp6hmolZ
         1EhvSv2OmIZbaULoQ1tTpn+/VO0LpUejfzWoF/jBipPkB96zQzfeQMcrfXz/wI0r5VPC
         zPUfuRC/rKdcviWuJ+t7xPeANLq0D/q1tpeeX7KAQ18IFoK3ULB2A7D2gEw3xXZFQ3xb
         FNhuqpj0ZFUqczhWfnjds70f/sHlmmLtD1xUFtn67UA1bHhNvCB2r7bY7vK3W8AiKGjf
         cEcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="fJ78/HxB";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id m17-20020a056000009100b002c561ddb521si5130438wrx.998.2023.02.17.12.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:53 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="fJ78/HxB";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5820B20FB9;
	Fri, 17 Feb 2023 20:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FooQIYNRpaG7p/4mjdUizDlxlIhcISAOHW7u6JUqYUI=;
	b=fJ78/HxB4HfLJK+25Z2SafORrHTMzf0edR/1PCS2R2QrnHPpxSZ+wWQ8WyBGboGKwAZnAt
	P7+nlwtCR1rk33cSg1381QznKYtv57ivVdsBRJJzwhBU4B4IOo8pekgL4LGpj4KuX+lt0H
	BiodhXCl7/ky/rTYfeOFJtbzQAHcS0o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FooQIYNRpaG7p/4mjdUizDlxlIhcISAOHW7u6JUqYUI=;
	b=udChJITD7f02FICj/w2K0EJvhpuCtNFm2fXqgwaLgg6CUTIOzFZRlTSrSw9dZBucj/Ai4O
	xBzh5v5zb9EG6TCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC455138E3;
	Fri, 17 Feb 2023 20:14:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WCvGJDng72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:49 +0000
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
Subject: [PATCH v6 17/29] tests/avocado: Skip tests that require a missing accelerator
Date: Fri, 17 Feb 2023 17:11:38 -0300
Message-Id: <20230217201150.22032-18-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DlE3eZK3z17r

If a test was tagged with the "accel" tag and the specified
accelerator it not present in the qemu binary, cancel the test.

We can now write tests without explicit calls to require_accelerator,
just the tag is enough.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 25a546842f..a313e88c07 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -274,6 +274,10 @@ def setUp(self):
 
         super().setUp('qemu-system-')
 
+        accel_required = self._get_unique_tag_val('accel')
+        if accel_required:
+            self.require_accelerator(accel_required)
+
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
-- 
2.35.3
