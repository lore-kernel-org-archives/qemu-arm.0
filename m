Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 21sm2655615ejz.24.2022.01.10.09.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 09:51:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C80101FFBE;
	Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH  6/6] docs/devel: add some clarifying text for aliases
Date: Mon, 10 Jan 2022 17:51:04 +0000
Message-Id: <20220110175104.2908956-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4RntfzVH2qUT

We do mention the limitation of single parenthood for
memory_region_add_subregion but lets also make it clear how aliases
help solve that conundrum.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/memory.rst | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
index 5dc8a12682..69c5e3f914 100644
--- a/docs/devel/memory.rst
+++ b/docs/devel/memory.rst
@@ -67,11 +67,15 @@ MemoryRegion):
 
   You initialize a pure container with memory_region_init().
 
-- alias: a subsection of another region.  Aliases allow a region to be
-  split apart into discontiguous regions.  Examples of uses are memory banks
-  used when the guest address space is smaller than the amount of RAM
-  addressed, or a memory controller that splits main memory to expose a "PCI
-  hole".  Aliases may point to any type of region, including other aliases,
+- alias: a subsection of another region. Aliases allow a region to be
+  split apart into discontiguous regions. Examples of uses are memory
+  banks used when the guest address space is smaller than the amount
+  of RAM addressed, or a memory controller that splits main memory to
+  expose a "PCI hole". You can also create aliases to avoid trying to
+  add the original region to multiple parents via
+  `memory_region_add_subregion`.
+
+  Aliases may point to any type of region, including other aliases,
   but an alias may not point back to itself, directly or indirectly.
   You initialize these with memory_region_init_alias().
 
-- 
2.30.2
