Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77dade9b61sm3514866b.160.2024.07.05.01.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:47:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 8B2346211E;
	Fri,  5 Jul 2024 09:40:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 19/40] linux-user/main: Suppress out-of-range comparison warning for clang
Date: Fri,  5 Jul 2024 09:40:26 +0100
Message-Id: <20240705084047.857176-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YssD+5gwhf9w

From: Richard Henderson <richard.henderson@linaro.org>

For arm32 host and arm64 guest we get

.../main.c:851:32: error: result of comparison of constant 70368744177664 with expression of type 'unsigned long' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (TASK_UNMAPPED_BASE < reserved_va) {
            ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~

We already disable -Wtype-limits here, for this exact comparison, but
that is not enough for clang.  Disable -Wtautological-compare as well,
which is a superset.  GCC ignores the unknown warning flag.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240630190050.160642-15-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 94c99a1366..7d3cf45fa9 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -843,6 +843,7 @@ int main(int argc, char **argv, char **envp)
      */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wtype-limits"
+#pragma GCC diagnostic ignored "-Wtautological-compare"
 
     /*
      * Select an initial value for task_unmapped_base that is in range.
-- 
2.39.2
