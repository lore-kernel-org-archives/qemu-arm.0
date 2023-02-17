Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128391ejb;
        Fri, 17 Feb 2023 12:14:58 -0800 (PST)
X-Google-Smtp-Source: AK7set88vxF9QDTwmk6nQlD1fOCYQ7dQdmTPEUSZKjHVDQ+vdGrFEPU/HF5vIt6HE/hZ3Od9oBiF
X-Received: by 2002:a05:600c:994:b0:3e1:fff7:e970 with SMTP id w20-20020a05600c099400b003e1fff7e970mr1755936wmp.30.1676664897947;
        Fri, 17 Feb 2023 12:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664897; cv=none;
        d=google.com; s=arc-20160816;
        b=FyRqKZy6sWGUt6oI5/GTh3jHd7AF6IAOrblQ1UNsrJ6RnsfumC4I+rYN+LsJH/pYdH
         J1E/Pto0hHrEaTPOTEI9+XzbxjTKi3WIjHjEIJbfv+msPKKZwcNtjG2icDH5fVWOP/qN
         +Ezf9xB7GKEStkL1vdTceowUcwFUfzXqh0IBmcx3F903YF5JsH2J60Q7InD/RszXeDFH
         AMqHGPOYGBPuWHEAqi+qLLBMX/zkv03AxB4rq9UFjAcSHxY0JokEcoSdpV2bTJtHLZWl
         34fo7TduI1puqjbFs0fN8lPDH3qhKq3IE8LkPYWm33dkDXekwJdugCISSnXSllDIZ1yT
         sfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=AF04fVqxeBqrjxfeAQ86Zm+EldW7YHMchEZIVkDriu0=;
        b=o4yNDe7HaXIJ7yE6ZNxnj2grwNTB43dSXS65qi7uGKbmRzBOfRXMUv5JbUA/J+RpFU
         ToJgxENjNHTwnVKoHzcxHaX6P9zNuvCE7R8CvN60V0VgkDw2zGk/tB7NraeHJDkzRGN1
         CM5ees+kNYTLNTlptCtAL6i2Xf8ZO+KBKJ9Ub1J7OAMwR8HRkJ/Nxkq47JNaacLY2cHT
         7DQ4qnNZ7it7uc1bAxs3MKDFZvgCGAQedTVVk+t4jRIVOcCUG+Uxu2GinMrZuQjoEFvG
         FolrfSG0Ntp6TkyuGPbB4Nx3X2M4DXq2EarLzsKa2wQXW9bLpCg+DSd8jC1AGbexKe5a
         /U3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zqLo9e6W;
       dkim=neutral (no key) header.i=@suse.de header.b=pIPGeTNo;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id v14-20020a05600c214e00b003e20a5fcdabsi5637724wml.57.2023.02.17.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:57 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zqLo9e6W;
       dkim=neutral (no key) header.i=@suse.de header.b=pIPGeTNo;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8986E20FB9;
	Fri, 17 Feb 2023 20:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AF04fVqxeBqrjxfeAQ86Zm+EldW7YHMchEZIVkDriu0=;
	b=zqLo9e6WILRfj+9utaJcrMSy499seJ4NG3M7qDkPr7TeemD45kuHBKjBJHfVAHXb4IMSd3
	byEmlt2qca/iIlUcSq0EtHADW8WCdjGH49aJ9hxOQcDOBDsNH5RuaLWRQyjSRST2RZcoTy
	vyqaTIQOXZ8jcpfd29pw8Mc60N34O8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664897;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AF04fVqxeBqrjxfeAQ86Zm+EldW7YHMchEZIVkDriu0=;
	b=pIPGeTNoNIIlMgIGjFr+ajEtmhcvP9reNyGq0QGeAPAHVnLIS5SL6ASmr7ImjnlhdVuXRw
	rtCywyWd6C3eN9AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C60D8138E3;
	Fri, 17 Feb 2023 20:14:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SF1VIz3g72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:53 +0000
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
	Beraldo Leal <bleal@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH v6 18/29] tests/avocado: Tag TCG tests with accel:tcg
Date: Fri, 17 Feb 2023 17:11:39 -0300
Message-Id: <20230217201150.22032-19-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zWBsiSgYeHH/

This allows the test to be skipped when TCG is not present in the QEMU
binary.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux_console.py | 1 +
 tests/avocado/reverse_debugging.py  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index be60f8cda9..574609bf43 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -997,6 +997,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
 
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
