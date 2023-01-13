Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp415050ejc;
        Fri, 13 Jan 2023 06:07:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsg09/8EyNGjphHlUUtfig13BT1aXd+9cO6ugIUwvZSnNF2A5zMvDrU6JMKIO/l72xtsyXA
X-Received: by 2002:adf:cf01:0:b0:2b9:d6ba:21ee with SMTP id o1-20020adfcf01000000b002b9d6ba21eemr18369563wrj.1.1673618862398;
        Fri, 13 Jan 2023 06:07:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618862; cv=none;
        d=google.com; s=arc-20160816;
        b=AT7LGOWuodPaNLheS65b4tL+mKj8kSbrf4KNG9YEkPNdgZhy3ouBWSpQ3tkpi5c0MC
         OSM71daQgtGeaAGoVz4pC9OEwGn0eAtZrSSzrlY1lBZp+z0fXYblbTkgw2rqnjuFIuOl
         iAHP8XBWIZY0IME2W13v6reay3MfDUirKscyJZ+KDhZm/TGMp9w8XHZKIIRrHVJbeceB
         4VZKKG+KnhdJ7JVB4b0xtIF5lVR38eaRbgUan8SNmzED6CSRWsgC/3MZjK93aE8lK7ag
         pXHA7n59OoxR/HHFlNhLsszrndRjxKJ2XIYzv0pof9kvor6T8cVJHNYV0CVIlEEnVKOP
         5zTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=b9wgLuv1S8KisqJZ2hXcODVe9gh+CNpuuMmjcOOVIBo=;
        b=0mwX3NRv9fLvLBcq/4c2bcSaJBPltCw6xI413S+vC7430clDm5PnrUNVinenruvwHn
         BumpLDLvCndbaEmLKUZysQyhPmeh1Nb5ZduroyMwsH0ehdkSI5UYoUWhMrvpdM7Yd22v
         9njSujxYDEGf+oR8ZBhGOJy5ILgwm7HMUuqHOIT08d/tsET7vgjbN4SBeoCXeHL00QVO
         fGmoDCbNoHUvIIXUoSriqcKNeXduMWNFiVqbfW79z/in2QPNHzuyZsrPcMA4/q2MqU7e
         w3TSRpZp/4qVbK1kni5Dl494DUe8pJ77ILuCeMpIs8hJtWkCxDY0jKNFDARyRDXLv63Q
         UiMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=m8675CmD;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id bn18-20020a056000061200b002bc8025828dsi11321880wrb.90.2023.01.13.06.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:42 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=m8675CmD;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF86A6B4FE;
	Fri, 13 Jan 2023 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9wgLuv1S8KisqJZ2hXcODVe9gh+CNpuuMmjcOOVIBo=;
	b=m8675CmDyRyQNUZqeVQQdU6+mDipNdN5/k0gLr3/L06s16gA4h13fdGVI1KueyNAcWoRf4
	oKl8eLzsGGf38QzPQNYm4ujjgOpOvzIx+KJ/8C2o5VkGB/x1U/eoSx6yBScruro+9799VV
	q+Zf2oyLMXEHZCHoJosTDLcDiVAANak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618861;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9wgLuv1S8KisqJZ2hXcODVe9gh+CNpuuMmjcOOVIBo=;
	b=Kg688s8Gpwt3iPgb+mJPKZuJBJG20Ry2ipEqrdc+m9ff5W8l3Q9djlY0FDE1rGGcYSfAqU
	RRretHyEF/tD6tCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EEAB1358A;
	Fri, 13 Jan 2023 14:07:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wFf6FaplwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:38 +0000
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
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH v3 24/28] tests/avocado: Skip tests that require a missing accelerator
Date: Fri, 13 Jan 2023 11:04:15 -0300
Message-Id: <20230113140419.4013-25-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GC8wiAHsWOkZ

If a test was tagged with the "accel" tag and the specified
accelerator it not present in the qemu binary, cancel the test.

We can now write tests without explicit calls to require_accelerator,
just the tag is enough.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/avocado/avocado_qemu/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 910f3ba1ea..ed2809210b 100644
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
