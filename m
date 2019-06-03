Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p2sm5412769wrx.90.2019.06.03.08.01.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 03 Jun 2019 08:01:25 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5EEDC1FF87;
	Mon,  3 Jun 2019 16:01:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	1830872@bugs.launchpad.net,
	randrianasulu@gmail.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH] cputlb: use uint64_t for interim values for unaligned load
Date: Mon,  3 Jun 2019 16:01:20 +0100
Message-Id: <20190603150120.29255-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wF4VV2HAca6k

When running on 32 bit TCG backends a wide unaligned load ends up
truncating data before returning to the guest. We specifically have
the return type as uint64_t to avoid any premature truncation so we
should use the same for the interim types.

Hopefully fixes #1830872

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index cdcc3771020..b796ab1cbea 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1303,7 +1303,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
         && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
                     >= TARGET_PAGE_SIZE)) {
         target_ulong addr1, addr2;
-        tcg_target_ulong r1, r2;
+        uint64_t r1, r2;
         unsigned shift;
     do_unaligned_access:
         addr1 = addr & ~(size - 1);
-- 
2.20.1
