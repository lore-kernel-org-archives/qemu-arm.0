Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp415094ejc;
        Fri, 13 Jan 2023 06:07:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu0PlnMgs4WKDuVMJVl5b6okc0ayh4NkbagOIpmvomkijpGRILHFc9W7jzd1VCqV9bFVFsa
X-Received: by 2002:a05:600c:5126:b0:3d9:fb8a:b2c5 with SMTP id o38-20020a05600c512600b003d9fb8ab2c5mr9871484wms.16.1673618866253;
        Fri, 13 Jan 2023 06:07:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618866; cv=none;
        d=google.com; s=arc-20160816;
        b=nLYpw+jjgsfqHzYDpo1dHOOymcIPGb1qVbSCtCYvxE1IXbUiziXzKGJQsCsoWvp0IL
         dB99/zSDqSojXqinsXm1qY5aLOANkesrFfJahXWJ7q96a1ET50aLpYXgwC3BUpoZiv8b
         iEGqfF43jfIqBI0ySut3tHHUS3cNx2mLPbIgtfqrNOdrTKqw5zxmM9irF9fctneTcrTZ
         UwLeNJvCVsAESy7gi9adu1WlaO+RMimhl587Ff49EVEYKOHPNtv9CuUeYQEa/OpsDBO8
         hTdx+nVkwrujSgH8Hiut4lV4UpGtjjtxnPnhcI5DY+2xLuzuL7XmIX5rTES7TMtEHs/0
         8d0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=E/DK5cdoFpTVGoVOHrqT15SvL8V/5fD9lKPaGlTggnk=;
        b=rRJPPHAb9/khLT6qzq8W+aPQrCkcddT8U/GCtRPOkbJid+ydnBHzXtXiPj9kItfUKY
         2bNIEl+8YcHqWYMgYPvUbvlUTqSIfg6D6hGBum6J8/nBVNU8kvOR2Hwoole077qPf7HM
         5JOUqG/9TKlPASbgbhFzw25BPLCXWZ0bZ55LHsDOUNLrYzPwWc+fEpKO9RBN9kwLhfkV
         VJoo6ABv5t9drdD3GpPZpfLegdYOyEMNPGyctzh0RiXT+K2SHlxM+Usgj7TQNQchVDJi
         WKI5dU6TAQxxUSJ2TOFM2oTy5iGSh1bWZw+BIBI3u5ZEtfB/SnxPAF79DsPfFU/56LeL
         muEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XV+MxJe5;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=lGkfCbjX;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id w12-20020adff9cc000000b002bbedd54efdsi11127193wrr.728.2023.01.13.06.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:46 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=XV+MxJe5;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=lGkfCbjX;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF25F5C832;
	Fri, 13 Jan 2023 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/DK5cdoFpTVGoVOHrqT15SvL8V/5fD9lKPaGlTggnk=;
	b=XV+MxJe5En1LF/LqG0MHxo47mFVnUqnA7tyi7KkGl/BGdqatrAIjKuGsjbOGDgrZcgplsP
	0hVi2w5m0l6gR+u21M9fT8od5sYTT0bE3iNvhtPhu0b7rsmfjHEVHIIDRC+0C6oKkWaZDg
	ZJn86ipIRK9Ft9bRQ86w2ckUxiyn+bQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E/DK5cdoFpTVGoVOHrqT15SvL8V/5fD9lKPaGlTggnk=;
	b=lGkfCbjXKGlgX5xqnhJxyiqjQXu3Vu5DqLpNMDwfL284kAqCf10KacAsfKQFmLZV6IE3C+
	y2FkW5OERjbXaWBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48C351358A;
	Fri, 13 Jan 2023 14:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gIXrBK5lwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:42 +0000
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
	Beraldo Leal <bleal@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [RFC PATCH v3 25/28] tests/avocado: Tag TCG tests with accel:tcg
Date: Fri, 13 Jan 2023 11:04:16 -0300
Message-Id: <20230113140419.4013-26-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: up0oBlXtnyHf

This allows the test to be skipped when TCG is not present in the QEMU
binary.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/avocado/boot_linux_console.py | 1 +
 tests/avocado/reverse_debugging.py  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index ec07c64291..c339e4d3bb 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -943,6 +943,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
 
     def test_aarch64_raspi3_atf(self):
         """
+        :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:raspi3b
         :avocado: tags=cpu:cortex-a53
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index d2921e70c3..680c314cfc 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -173,6 +173,10 @@ def reverse_debugging(self, shift=7, args=None):
         vm.shutdown()
 
 class ReverseDebugging_X86_64(ReverseDebugging):
+    """
+    :avocado: tags=accel:tcg
+    """
+
     REG_PC = 0x10
     REG_CS = 0x12
     def get_pc(self, g):
@@ -190,6 +194,10 @@ def test_x86_64_pc(self):
         self.reverse_debugging()
 
 class ReverseDebugging_AArch64(ReverseDebugging):
+    """
+    :avocado: tags=accel:tcg
+    """
+
     REG_PC = 32
 
     # unidentified gitlab timeout problem
-- 
2.35.3
