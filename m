Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547251ejb;
        Mon, 13 Feb 2023 12:32:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/uDZUHk7YP0GUaN7gGd7XH+gCXgrmalZWxPUjAF65DWHRGtZgmA5vTIYsw2iKf44TJLE1c
X-Received: by 2002:a17:906:5342:b0:88a:a09d:e650 with SMTP id j2-20020a170906534200b0088aa09de650mr155358ejo.58.1676320359489;
        Mon, 13 Feb 2023 12:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320359; cv=none;
        d=google.com; s=arc-20160816;
        b=IPWRdIr5e24CoruCRux01BRhFXdkfvfOZvxe9nx9lbi8zodErYZQxNzkjoAf8LSrdE
         d5ejFz3uy21Kd0fPWCQFrjN3R8Cd7h7+rSHlMQYmUhL6vmpof9lQ1STC+b+z74BQn5iH
         83aqfE6gXny18Ao1Ug+9x6Z5GimCfRRFyEyVh7IfaxysbOixeJj2b2QVn0GZjfZqosik
         dsWWAkKSBknK5lEmCsnIGThRgtMoWxpogjtIP11nEt2vU7lGlrBVI4ZfAqrwE4O/+4y4
         qQqxHi6ANknoBipYPCYClzhKiPrFWWZb9AT4lSv2/MASMJOREsl/JWwcf9yf863iJSuK
         Y1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=FooQIYNRpaG7p/4mjdUizDlxlIhcISAOHW7u6JUqYUI=;
        b=OsGAXoZzKlLJLYAOzCaZpkztPyh/06ers8CeybYYLmYXYMBLOwOYC9tyByO1KNpOsC
         TIwzc+BCa/u9ppqpVWGGtc7SbdHnJwYYSPAGMQW4f8azgHLUwdQ8mKRNroqk//QH8WUY
         TVWHjOO5PSd/Nt6AUpPF6CsTZw4JZp8m3xahwfdvwWfP+aOf1E6gUtCxzkMBnyvSH3m1
         hQOt5P3tFZypLCMgJJoVHmwoKdOFK+PdO29R5ReEfIR7W/PFytWpA3ujBfQaZBBl4zyQ
         PN/YyM80AsGO39xk49k8+Vbe9nYhKssPweWxLX8Wj/2MMHrPf4WwXwGpS2StjGEagK3w
         Iwrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qo9SmwXJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=h7H9DFby;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id j12-20020a170906104c00b008af39315aeesi15992659ejj.72.2023.02.13.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:39 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=qo9SmwXJ;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=h7H9DFby;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2607422348;
	Mon, 13 Feb 2023 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FooQIYNRpaG7p/4mjdUizDlxlIhcISAOHW7u6JUqYUI=;
	b=qo9SmwXJadDYB8WBLqy3E4zb4S0AHGshRsQP/q8LFWZJYZUALXyu2fEODuY1MnSNaJwMG7
	yBBq4B2TqNeKFDQzgiuJmDdkNIrKpD6EUvsS984XDQvlH2WiHkDzLxr4ZeFCne5tCWNWEw
	NE23MGXwtiD6xcgQjEz4GFXoaer0c+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FooQIYNRpaG7p/4mjdUizDlxlIhcISAOHW7u6JUqYUI=;
	b=h7H9DFbyZ3jfx2YiFnHIr8RoHgE5phvUWxFd/RPH/SM3uoEP1IQx8j3/Iay8BITHqICeT3
	HTK31t+pUTavHGCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 61C061391B;
	Mon, 13 Feb 2023 20:32:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wF8XCmOe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:35 +0000
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
Subject: [PATCH RESEND v5 18/28] tests/avocado: Skip tests that require a missing accelerator
Date: Mon, 13 Feb 2023 17:29:17 -0300
Message-Id: <20230213202927.28992-19-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ru7TL1CWIGJb

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
