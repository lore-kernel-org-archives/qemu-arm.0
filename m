Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547314ejb;
        Mon, 13 Feb 2023 12:32:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/aaJvaPzTm62yoF07U1W65l/OqAcpJ8NfjB9HebNeQmMVi+5aPYewF0M8akvgzhDePvyWy
X-Received: by 2002:adf:fdc7:0:b0:2c5:5836:4e1b with SMTP id i7-20020adffdc7000000b002c558364e1bmr4707412wrs.60.1676320363981;
        Mon, 13 Feb 2023 12:32:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320363; cv=none;
        d=google.com; s=arc-20160816;
        b=QQ8e/IUrGRraywkGpfmQTyBLH3DzhXNyRjU0q5PUBq2gUFoKdHkn6ovfwauMMbbUIL
         axgFm3at/sLJVbouINfj7AyuKorURueNiVoclAY+04ssCO6rkh/zQQ3X8qHDBaFtn2M2
         +e6eCPr6K5hItlEkfox+/EyJYLt5EViuixO9Tkhwo8NyYSqATX83jH1S6eL+oVsgFnkx
         kOgonax/cGmfMcM4FIP+uSGxhYVQWQSMWbgaQNuMzYufy22GCWOgDJuN8QNikfbK4i/x
         4slYXRG1SFOLtDykRn0cq91FLsP8/EkHeLJwYNisVlkHE9I3rIxa5JEmLX/IUWs0nF9K
         BghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=AF04fVqxeBqrjxfeAQ86Zm+EldW7YHMchEZIVkDriu0=;
        b=SaivBoFebWyBFQp0WOvoP4qlgeX1bC+m/VON3L5RnQ3UwFH5rmcl4aYKH0qcvT3wfo
         rg/iwUmb03tYSK5BLazMDnMJm/UL9LH6H9WARQF1CBPj4tzK1Lsbh38x9L91sxhXnDpT
         oq6ZPuQAZY+AAFMIo0O0moI2rtRkfTQj2E40mV6q/RRIxsIfi05bsYgyYwc6+e+R63n2
         Xz0B0+qZR0FbIAzNUwJtr/MiDa60qxlBuEIrp6Eu1Do0s2MjU0Kh3y9/d/VkHMOWEWu1
         Zz5R/6DTSnZSozYAXVdxU1cZJqn54WNvmq80tsJKb5pLThxqcf7QLBdselPFNbZitSSw
         P5GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=j50RzuuV;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id u3-20020adfdd43000000b002c55351c984si4987197wrm.866.2023.02.13.12.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:43 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=j50RzuuV;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 961B420193;
	Mon, 13 Feb 2023 20:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AF04fVqxeBqrjxfeAQ86Zm+EldW7YHMchEZIVkDriu0=;
	b=j50RzuuVhDH1Q19Hx8Sjv8F39j/E8hyoZSUWNcQfU2CG4VSFYMeN4LmQn0siu4t0j8VgmG
	e0CmSsfu0pLkSzh/4yqZx9h1RCUzwRXT9ujjH7v5z+lV+gTMum3GB/8LjOMqw4qPGoAxpD
	jvlnKsLMTjI63QKWuYOma8jfgxjpA5w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AF04fVqxeBqrjxfeAQ86Zm+EldW7YHMchEZIVkDriu0=;
	b=bvnygomJlhcl4CCGcYoOt0fnhJ6KUzf1l4SJ+EnMGZSzbBinKDJ404Q0cOAUOL0SX3T2dU
	pKQqP9aNs/mtMBCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9B9381391B;
	Mon, 13 Feb 2023 20:32:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GGUaGGee6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:39 +0000
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
Subject: [PATCH RESEND v5 19/28] tests/avocado: Tag TCG tests with accel:tcg
Date: Mon, 13 Feb 2023 17:29:18 -0300
Message-Id: <20230213202927.28992-20-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xq/d6wIw/hSc

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
