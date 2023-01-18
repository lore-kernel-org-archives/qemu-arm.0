Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787875ejc;
        Wed, 18 Jan 2023 11:38:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZWMGlWaym8M0WmwRpiamll2gYMFbXjolVNMayYLbjZ8EhvX5ijsJEfSYouiQED9rqRdEN
X-Received: by 2002:a5d:6849:0:b0:24a:9a21:c9e with SMTP id o9-20020a5d6849000000b0024a9a210c9emr7045097wrw.59.1674070709085;
        Wed, 18 Jan 2023 11:38:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070709; cv=none;
        d=google.com; s=arc-20160816;
        b=B0u4OH8rX78pnDlZ8SK0/DfFi3VM2Der0mb8HebkVwDWWH9m8mTQILB/jO5d67UdpZ
         lOSTYB2Bdd9jz4+x/c70Zl1xW95jILRUBd5UIpGg3Ul0svgzH6PjhtE6+mW2KVZZj9UN
         nR8L/4wxPKGhevM4JqCS4E1kU2vpczFO8ihSFa7GRwWaVV2Dq6gvGZTCrModAztFbsGV
         GP3H/17O5+0tohyK7gUJgg/IiL0gXy4JHGtjUWrP/kr+/2hkQTjDvzt4IB7RsXGYXxQt
         /ia25FEhVr3SB3It3OzV02VaY0JuHpbODg0oky2qZefImjb7B+63/hrOrSIjKceybhwi
         F22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=BtHJBVBQ6X4CRCaUHJwzKOFSedyFeFXp3iolnOpnd60=;
        b=Xh9wPV8rWlNnQtBH8tyDDvm4l2tMjDiqUPy2pyQWN335YtT4D1BIb0BFk+s89OXSi9
         ARvq86glB38GDk4ZWOT79e+hSp8NmrjOuREqMd83SEDZdUNz/waAgOIaOsG0UxeHMw0K
         ji/RlNsoi1WcF2gB3boH9y5TuVd7VlfohxZAmOu7idkQOiYpsQhHHh+ViP0uCxsdogE2
         zBQD/RxEKDwYEwALNUxOes/e8uv1oz6PiYG4sp/3tYV9xXy1rzQzwor3E8teOujyPGQK
         HZry8+PK2wn9NJrI5BP8qdrD6TgQT/2lOcWyH0MnuyIJYeTUgJdib3xUBtI7EsZHdYp7
         PSpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Hec4l3aw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id r2-20020adff102000000b002bdda195faesi17008999wro.118.2023.01.18.11.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:38:29 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Hec4l3aw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B50F138D49;
	Wed, 18 Jan 2023 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtHJBVBQ6X4CRCaUHJwzKOFSedyFeFXp3iolnOpnd60=;
	b=Hec4l3awmcYTgZgi1NK1ERC2WhOIEhgKcK6ffUY5Ni02b4qR/nUdmzrNcfRzlp6l+9Rcun
	P4iFveqCQOkZ4zm8RN0ZQdxpNF21TizYwAQn1VXsHLHnxzYKdS6968/8G/Y4Opp4nXr/Ot
	pbet+0vhFqfo0WKEVck7cWxkmN4HNK8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtHJBVBQ6X4CRCaUHJwzKOFSedyFeFXp3iolnOpnd60=;
	b=+xyZgMPaLEM2+08HnSuWb5yvkzhkx5n46gyAS96XfMge5hRaA5n8vXslW7XWzoiOjO2Auw
	aR2FNjBK1MrHzkDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 396A3139D2;
	Wed, 18 Jan 2023 19:38:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iLEzAbFKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:38:25 +0000
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
Subject: [PATCH 20/20] tests/avocado: Tag TCG tests with accel:tcg
Date: Wed, 18 Jan 2023 16:35:18 -0300
Message-Id: <20230118193518.26433-21-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IAHa/riw79KV

This allows the test to be skipped when TCG is not present in the QEMU
binary.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/avocado/boot_linux_console.py | 1 +
 tests/avocado/reverse_debugging.py  | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8c1d981586..980a14991a 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -990,6 +990,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
 
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
