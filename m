Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id r10-20020adfda4a000000b0029a06f11022sm11796931wrl.112.2023.01.10.09.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 09:39:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5EBC61FFBB;
	Tue, 10 Jan 2023 17:39:25 +0000 (GMT)
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
	John G Johnson <john.g.johnson@oracle.com>,
	Emilio Cota <cota@braap.org>
Subject: [PATCH 19/26] util/qht: add missing atomic_set(hashes[i])
Date: Tue, 10 Jan 2023 17:39:15 +0000
Message-Id: <20230110173922.265055-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 91k2bWDqwsAC

From: Emilio Cota <cota@braap.org>

We forgot to add this one in "a890643958 util/qht: atomically set b->hashes".

Detected with tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230109224954.161672-3-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 util/qht.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qht.c b/util/qht.c
index 065fc501f4..15866299e6 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -688,7 +688,7 @@ static inline void qht_bucket_remove_entry(struct qht_bucket *orig, int pos)
     int i;
 
     if (qht_entry_is_last(orig, pos)) {
-        orig->hashes[pos] = 0;
+        qatomic_set(&orig->hashes[pos], 0);
         qatomic_set(&orig->pointers[pos], NULL);
         return;
     }
-- 
2.34.1
