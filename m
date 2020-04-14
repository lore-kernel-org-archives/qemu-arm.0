Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q17sm11836553wmj.45.2020.04.14.13.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:06:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 87CFB1FF9B;
	Tue, 14 Apr 2020 21:06:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 12/17] gdbstub: Do not use memset() on GByteArray
Date: Tue, 14 Apr 2020 21:06:26 +0100
Message-Id: <20200414200631.12799-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414200631.12799-1-alex.bennee@linaro.org>
References: <20200414200631.12799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aDJHXkHrArCr

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Introduce gdb_get_zeroes() to fill a GByteArray with zeroes.

Fixes: a010bdbe719 ("extend GByteArray to read register helpers")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200414102427.7459-1-philmd@redhat.com>
[AJB: used slightly more gliby set_size approach]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h  | 9 +++++++++
 target/arm/gdbstub.c    | 3 +--
 target/xtensa/gdbstub.c | 6 ++----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 30b909ebd27..3c452fc50c0 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -125,6 +125,15 @@ static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
     return 16;
 }
 
+static inline int gdb_get_zeroes(GByteArray *array, size_t len)
+{
+    guint oldlen = array->len;
+    g_byte_array_set_size(array, oldlen + len);
+    memset(array->data + oldlen, 0, len);
+
+    return len;
+}
+
 /**
  * gdb_get_reg_ptr: get pointer to start of last element
  * @len: length of element
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 8efc535f2a0..063551df234 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -47,8 +47,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         if (gdb_has_xml) {
             return 0;
         }
-        memset(mem_buf, 0, 12);
-        return 12;
+        return gdb_get_zeroes(mem_buf, 12);
     }
     switch (n) {
     case 24:
diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
index 0ee3feabe54..4d43f1340ae 100644
--- a/target/xtensa/gdbstub.c
+++ b/target/xtensa/gdbstub.c
@@ -105,8 +105,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         default:
             qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported size %d\n",
                           __func__, n, reg->size);
-            memset(mem_buf, 0, reg->size);
-            return reg->size;
+            return gdb_get_zeroes(mem_buf, reg->size);
         }
 
     case xtRegisterTypeWindow: /*a*/
@@ -115,8 +114,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     default:
         qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported type %d\n",
                       __func__, n, reg->type);
-        memset(mem_buf, 0, reg->size);
-        return reg->size;
+        return gdb_get_zeroes(mem_buf, reg->size);
     }
 }
 
-- 
2.20.1
