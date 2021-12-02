Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f15sm2448078wmg.30.2021.12.02.03.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:53:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9C93D1FF99;
	Thu,  2 Dec 2021 11:53:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com,
	drjones@redhat.com,
	thuth@redhat.com
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v9 2/9] arm/flat.lds: don't drop debug during link
Date: Thu,  2 Dec 2021 11:53:45 +0000
Message-Id: <20211202115352.951548-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211202115352.951548-1-alex.bennee@linaro.org>
References: <20211202115352.951548-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YrCsbiOJS4Yh

It is useful to keep the debug in the .elf file so we can debug and it
doesn't get copied across to the final .flat file. Of course we still
need to ensure we apply the offset when we load the symbols based on
where QEMU decided to load the kernel.

  (gdb) symbol-file ./builds/arm64/arm/tlbflush-data.elf -o 0x40080000

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211118184650.661575-3-alex.bennee@linaro.org>
---
 arm/flat.lds | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arm/flat.lds b/arm/flat.lds
index 6fb459ef..47fcb649 100644
--- a/arm/flat.lds
+++ b/arm/flat.lds
@@ -62,7 +62,6 @@ SECTIONS
     /DISCARD/ : {
         *(.note*)
         *(.interp)
-        *(.debug*)
         *(.comment)
         *(.dynamic)
     }
-- 
2.30.2
