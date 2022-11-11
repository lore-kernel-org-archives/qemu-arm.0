Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id t67-20020a1c4646000000b003cfa622a18asm9443469wma.3.2022.11.11.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E4CFE1FFBB;
	Fri, 11 Nov 2022 18:25:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Mads Ynddal <mads@ynddal.dk>,
	Alexander Graf <agraf@csgraf.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v5 03/20] target/arm: ensure HVF traps set appropriate MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:18 +0000
Message-Id: <20221111182535.64844-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: w60tT17/uHLI

As most HVF devices are done purely in software we need to make sure
we properly encode the source CPU in MemTxAttrs. This will allow the
device emulations to use those attributes rather than relying on
current_cpu (although current_cpu will still be correct in this case).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
Acked-by: Alexander Graf <agraf@csgraf.de>

---
v2
  - update MEMTXATTRS macro
v5
  - more tags
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
