Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c7255esm3123937a12.80.2024.10.22.03.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:56:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id ADE0A5FABE;
	Tue, 22 Oct 2024 11:56:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	devel@lists.libvirt.org,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 12/20] config/targets: update aarch64_be-linux-user gdb XML list
Date: Tue, 22 Oct 2024 11:56:06 +0100
Message-Id: <20241022105614.839199-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022105614.839199-1-alex.bennee@linaro.org>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oruZ27xe8EDt

Attempting to run the binary asserts when it can't find the XML entry.
We can fix it so we don't although I suspect other stuff is broken.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/2580
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configs/targets/aarch64_be-linux-user.mak | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
index 778d22b2a9..dcef597a80 100644
--- a/configs/targets/aarch64_be-linux-user.mak
+++ b/configs/targets/aarch64_be-linux-user.mak
@@ -1,7 +1,7 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
 TARGET_BIG_ENDIAN=y
-TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/aarch64-pauth.xml
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/aarch64-pauth.xml gdb-xml/aarch64-mte.xml
 TARGET_HAS_BFLT=y
 CONFIG_SEMIHOSTING=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
-- 
2.39.5
