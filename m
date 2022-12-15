Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp921337ejb;
        Thu, 15 Dec 2022 14:49:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4yTabnzMhO7eY/7LzH3UIJ8xnezalifj4W1bxN9zFEZFzlxzKsRDoKlyNw/+B+GXxBoYc+
X-Received: by 2002:a5d:5b19:0:b0:242:8177:62ad with SMTP id bx25-20020a5d5b19000000b00242817762admr19518330wrb.0.1671144571584;
        Thu, 15 Dec 2022 14:49:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671144571; cv=none;
        d=google.com; s=arc-20160816;
        b=TsZYoXhiFAsO0GKqVcZPhaVvp0H3uK1jv05DtSNzoB2Hck2ncF57K8AoGyDJSPD37e
         VfGLaH0g47JDMC1jl8UD8UDlhHBpgUimh6Y9HiHFQgdqkdT8xuqIMYR6GPsfCnMvnIID
         3okfKBS+3c2va2q9nww7Vue8Mwq7UQfPkoVlYN/fbN4BQ4QP4tr5NuRn9P/7IzaNoe2L
         mWeEWiw4SfwugSYK52i7pmcYFSF1I97hLUIZhtpn5EHO3ZFyNG7YBsoidgeBzh/jXz5a
         BsHisosR5XP6SQ8u+/iLj7qEbvQwvSImAmxLYiuVa41l0taWYPgma93beRz7qJSKf6nq
         bSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:dkim-signature;
        bh=xHImpbO/Kbeh4sBJvJm6yzeHdyRcjBltEhJoVVJdlXE=;
        b=feZlW3MhfgQCQVSEGBCLKnZij2iymO9VdUoLbugeLW0YaWgg1TYly1j53vszXm/kre
         imyTQQ1PYeTV1BFWbsxH9rwDPw4g1Nek4BwkEiN4yK6cS12Hj83P1eLHXF00auUSZW0j
         mCh+5/AqfP0UxnmzoOSR648GIqVJDSBTlkqAMMqa/eAtWc3JOsZaa78VLEcPFURVnTnB
         83cpiHTgNELgH4kDktNbav7twcv2IkJx2vkD+4ocJcDbQHtAxkY6n9AWsUG+znkV/FLL
         cd8c8idRbczwudnzDHnrtEExNQNiZG0X3VP6r3qITIPAjhInQqcxmonY5DMIhjNFcnGW
         SMMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=R+Az0bMr;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="5NfAw/9u";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id o9-20020a05600002c900b002421c387b0csi537254wry.756.2022.12.15.14.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 14:49:31 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=R+Az0bMr;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="5NfAw/9u";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E15C922B3C;
	Thu, 15 Dec 2022 22:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671144570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xHImpbO/Kbeh4sBJvJm6yzeHdyRcjBltEhJoVVJdlXE=;
	b=R+Az0bMrYJBC48r41Ss9mBVP98MBXiLZWuLqqPaxmI7rL9pLgY0VocZZ0+PxKWSM4QD68H
	EtTl8d3ZMULJElmFjsSJ1qvosZq0OD6y7FlvRNyf2n7w90b8dZIL9CjyVR1MBMr+tHVqri
	+9NIGRUoDG1bAehSASLM8S7t63x5vbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671144570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xHImpbO/Kbeh4sBJvJm6yzeHdyRcjBltEhJoVVJdlXE=;
	b=5NfAw/9u9R4v6ZkLZlaS8TUQiJ8N1bK/IPu+3q/5P2qOPd0v1vHAqF5/aMI67Rz5iFRN7N
	X0sC6pEtoSX95XBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87B2B13434;
	Thu, 15 Dec 2022 22:49:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EjUZE3ikm2POPAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 15 Dec 2022 22:49:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] tests/avocado: add machine:none tag to version.py
Date: Thu, 15 Dec 2022 19:47:25 -0300
Message-Id: <20221215224725.3236-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HqppFlQBNiyb

This test currently fails when run on a host for which the QEMU target
has no default machine set:

ERROR| Output: qemu-system-aarch64: No machine specified, and there is
no default

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
