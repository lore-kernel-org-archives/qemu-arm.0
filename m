Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp345868ejc;
        Thu, 19 Jan 2023 05:57:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs2xn9nS61hkyCEqFm1EK062z8eV/+LquqtLrFGYmj0Hf8w/dHNuTJdYXyoyBSg/RduScUi
X-Received: by 2002:a50:c049:0:b0:49e:5902:39d0 with SMTP id u9-20020a50c049000000b0049e590239d0mr4909047edd.12.1674136634017;
        Thu, 19 Jan 2023 05:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136634; cv=none;
        d=google.com; s=arc-20160816;
        b=QQTWsJzKVxhDCSrwUBuGhmZNnTBZ7S9zR1+NDgXCWzmZywDCCHGvi8I6CSE8ASS3PN
         2KzqDreB9QHWSgr8fuZATPmoZAKDOSgVFOrg/RDrEbJzahYwWhxqW0yui+VML8tdl4PZ
         cK0UwmnFDN9QGlJxbi4Vs8DfpGASyvtlQWKwbsN9Dq+FBnu/+h6Tl+dAUoz9a/4H5ckN
         lK5pN9Y6KlQ8P5Jdd7npJDBEXS5tnkYeGkrlSeZ+vs86d4ElY7CvdhKgnHsPKaR7GJOC
         8jLI6PrT0Qv+7Q/Ut5Tl9aKaCEK+OqfHcLWQWyS4+8n54NqPBmidFAV24/pEhbvO6Js/
         Z/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=h4d91xynMc5IIw1RU4/KLmHgzvnhALzMPZPXiX5/5wA=;
        b=ZRr7+vIoUtPcsk0osUaediFuYCGyscMYIF4b03aug9HCRK6k2cc2STWHYGuD7tq+VQ
         z5qjaeEDcr7wro/RWqe40CVReYxfTEDouivyvjXo4Kj63YdL2ECSEeyS8y2lNktmYpKG
         P3fkTGaEnBVg5NmXn2fK+NVMzJTeGutanqlXk3dg6CmaVrYr0T571fTTWeYfUlXXD9Rg
         c9YdEG8Il+MUf48BfDVpXdsgQ0RvrkRViFPZIxOSV7zaCsnWZ8orYSS00OwfaVwro7wr
         95g06PpoXfJRSDAnIdtsTh5yxXUHzQfeSKG5R/VnT1OWik14QCR/dPcHqtDXZoK0c1qs
         4onA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XSQYS8nI;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id x12-20020a05640226cc00b0049e050e1547si1658317edd.239.2023.01.19.05.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 05:57:13 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XSQYS8nI;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 88B0738A48;
	Thu, 19 Jan 2023 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674136633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4d91xynMc5IIw1RU4/KLmHgzvnhALzMPZPXiX5/5wA=;
	b=XSQYS8nIX8qWFSfewC1zP9Yqwd+CDsgo/bqVNUsaA39TNuy94Fhrwsfe2Jsn5lO440DawY
	7wxsdZ2V6UcK0qFpW9JpYIpdPAwzO+nNqsSK+gxKJrCyvxSg7VDIoKfPekWfG3H6wcPRMy
	aAO6Upfh43ui7AWi9OGH7+r+yCqKCkM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674136633;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4d91xynMc5IIw1RU4/KLmHgzvnhALzMPZPXiX5/5wA=;
	b=kqgHQaBmmAFcN7sLN9r8R5tDoGrsQ7ICzPcmPkE/425yC7pyY/NAm2KdygxYJmYeAFdMDB
	8k09tKI6aPb3MdDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09770134F5;
	Thu, 19 Jan 2023 13:57:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GLIPMDVMyWOCFAAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 13:57:09 +0000
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
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [RFC PATCH v4 11/15] tests/qemu-iotests: Allow passing a -cpu option in the QEMU cmdline
Date: Thu, 19 Jan 2023 10:54:20 -0300
Message-Id: <20230119135424.5417-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230119135424.5417-1-farosas@suse.de>
References: <20230119135424.5417-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: C7eGZp40OIxT

We're removing the default CPU from aarch64. Every QEMU invocation is
expected to have an explicit -cpu value.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qemu-iotests/testenv.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index a864c74b12..4bb80ea656 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -244,6 +244,13 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
             if self.qemu_prog.endswith(f'qemu-system-{suffix}'):
                 self.qemu_options += f' -machine {machine}'
 
+        cpu_map = (
+            ('aarch64', 'cortex-a57'),
+        )
+        for suffix, cpu in cpu_map:
+            if self.qemu_prog.endswith(f'qemu-system-{suffix}'):
+                self.qemu_options += f' -cpu {cpu}'
+
         # QEMU_DEFAULT_MACHINE
         self.qemu_default_machine = get_default_machine(self.qemu_prog)
 
-- 
2.35.3
