Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id f6-20020adffcc6000000b002bbdcd15e44sm8082510wrs.37.2023.01.10.09.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:39:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 98B631FFC0;
	Tue, 10 Jan 2023 17:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Ed Maste <emaste@freebsd.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 08/26] meson: replace Perl usage with Python
Date: Tue, 10 Jan 2023 17:39:04 +0000
Message-Id: <20230110173922.265055-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wPK9H9Cq5NPl

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's try to remove Perl usage during build time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230110132700.833690-5-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qapi-schema/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 9dfe98bc9a..d85b14f28c 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -259,22 +259,23 @@ if build_docs
   # Fix possible inconsistency in line endings in generated output and
   # in the golden reference (which could otherwise cause test failures
   # on Windows hosts). Unfortunately diff --strip-trailing-cr
-  # is GNU-diff only. The odd-looking perl is because we must avoid
+  # is GNU-diff only. The odd-looking python is because we must avoid
   # using an explicit '\' character in the command arguments to
   # a custom_target(), as Meson will unhelpfully replace it with a '/'
   # (https://github.com/mesonbuild/meson/issues/1564)
+  remove_cr = [python, '-c', 'import sys;[sys.stdout.write(line.replace(chr(13), "")) for line in sys.stdin]']
   qapi_doc_out_nocr = custom_target('QAPI rST doc newline-sanitized',
                                     output: ['doc-good.txt.nocr'],
                                     input: qapi_doc_out[0],
                                     build_by_default: true,
-                                    command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                    command: [remove_cr, '@INPUT@'],
                                     capture: true)
 
   qapi_doc_ref_nocr = custom_target('QAPI rST doc reference newline-sanitized',
                                     output: ['doc-good.ref.nocr'],
                                     input: files('doc-good.txt'),
                                     build_by_default: true,
-                                    command: ['perl', '-pe', '$x = chr 13; s/$x$//', '@INPUT@'],
+                                    command: [remove_cr, '@INPUT@'],
                                     capture: true)
 
   test('QAPI rST doc', diff, args: ['-u', qapi_doc_ref_nocr[0], qapi_doc_out_nocr[0]],
-- 
2.34.1
