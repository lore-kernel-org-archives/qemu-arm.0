Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced20csm510791366b.172.2024.09.10.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:39:01 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B33C05F86D;
	Tue, 10 Sep 2024 18:39:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 03/10] tests/docker: use debian-all-test-cross for mips64el tests
Date: Tue, 10 Sep 2024 18:38:53 +0100
Message-Id: <20240910173900.4154726-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910173900.4154726-1-alex.bennee@linaro.org>
References: <20240910173900.4154726-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hcbdzWD8yQvc

While the mips64el cross compilation environment is busted in Debian
we can use the debian-all-test-cross image for building TCG tests like
we do in the CI.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index d08b71f14b..39a284ddfe 100755
--- a/configure
+++ b/configure
@@ -1328,7 +1328,7 @@ probe_target_compiler() {
         container_cross_prefix=microblaze-linux-musl-
         ;;
       mips64el)
-        container_image=debian-mips64el-cross
+        container_image=debian-all-test-cross
         container_cross_prefix=mips64el-linux-gnuabi64-
         ;;
       tricore)
-- 
2.39.2
