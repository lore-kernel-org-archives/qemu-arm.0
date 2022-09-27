Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p2-20020adfce02000000b00226dba960b4sm1983711wrn.3.2022.09.27.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:15:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9F8E71FFBB;
	Tue, 27 Sep 2022 15:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	Mads Ynddal <mads@ynddal.dk>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 03/15] target/arm: ensure HVF traps set appropriate MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:52 +0100
Message-Id: <20220927141504.3886314-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OqL/aOgaZKeL

As most HVF devices are done purely in software we need to make sure
we properly encode the source CPU in MemTxAttrs. This will allow the
device emulations to use those attributes rather than relying on
current_cpu (although current_cpu will still be correct in this case).

Acked-by: Alexander Graf <agraf@csgraf.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mads Ynddal <mads@ynddal.dk>

---
v2
  - update MEMTXATTRS macro
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..d81fbbb2df 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
             val = hvf_get_reg(cpu, srt);
             address_space_write(&address_space_memory,
                                 hvf_exit->exception.physical_address,
-                                MEMTXATTRS_UNSPECIFIED, &val, len);
+                                MEMTXATTRS_CPU(cpu), &val, len);
         } else {
             address_space_read(&address_space_memory,
                                hvf_exit->exception.physical_address,
-                               MEMTXATTRS_UNSPECIFIED, &val, len);
+                               MEMTXATTRS_CPU(cpu), &val, len);
             hvf_set_reg(cpu, srt, val);
         }
 
-- 
2.34.1
