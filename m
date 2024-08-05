Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986406njb;
        Mon, 5 Aug 2024 13:17:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU80u0LH4HB8wkewRXiN9oq/vStdxPppnHSKxUaDUgbmNPGSEi+1lZa2IuYQgMRiuDQm1MddfAkKD9ZvPOJtxIGEwEFuaBA
X-Received: by 2002:a05:6902:c0c:b0:e08:6ac2:21f6 with SMTP id 3f1490d57ef6-e0bde50c57fmr15823821276.49.1722889055362;
        Mon, 05 Aug 2024 13:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889055; cv=none;
        d=google.com; s=arc-20160816;
        b=YQEc00zjaC2bx8Bhr0Hj/2pz9kRCT+qu5C2BJaWF5Y1ebLLyO6DqLV/jqOPJbpLai5
         gJbMoQtAD1B2MKOwzv0z9PGYyd+Le5G/sIl2IouIfwh3drAEbmqLMQ2aptEWNRQh19hO
         pNyk+y8oQKf/ztBvfutcaO5PUeDK7ANJJBNp+PMYZt2Xg1/SkP9XMLqr8W5CDcQ6Sg8k
         pG5em+C5JfsQZ8khu84MRoppkeSU1P86es/n8qqEQKq0xv+YxG+MFrTny2PLDwVfxAF0
         aTtaXhwsRBPiH/r57R9/U7IYuu8/Fl543bQAuJdv75EPpKjUfNtiaTVn6x8tVXSTJLvx
         SaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=nk3wy3iOlV41EdYWg2ADHBcnClsgP1AAs+CwqJBw/xU=;
        fh=zFJnihbieFrMciEIzA6GTFLQwTAK4d8YjROUKr3ZuZw=;
        b=ulUcd3/yz/K41PRFcDQF3Ma4AlqGyYr8fkFpqgOYROJNN9AW9WSZbcZpe/lVh2JEAq
         K9gES8OqTl1HyjMJbbech4x+8/rr0TfZJ22Hy8Mmed7UGcqwN14RpqL3qshFC4mLAg5k
         zjizwPiU+nte4Nc+SrEASIIE3SF9vwwyk+6pb3A3YHpMQr4UNcOeZty6MMHOtym4dlAX
         KTLwUcm2yuyKrru8CJ5k8ne+VqbTyQNIrlYDbFTjLKA49zOJc4N/xDg/DDH13JJBueWY
         qvMMCz6QxkFT/Akp6FG1uXrifE0a9L3VrjA8UsLYilGI8WZjaFSB9WAr6hcLgBbM5uzN
         oQRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=t5oxsPkl;
       spf=pass (google.com: domain of 3xjoxzgukc8u4l6t0rzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3XjOxZgUKC8U4l6t0rzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3XjOxZgUKC8U4l6t0rzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 3f1490d57ef6-e0be547cfa7sor3571445276.11.2024.08.05.13.17.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3xjoxzgukc8u4l6t0rzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=t5oxsPkl;
       spf=pass (google.com: domain of 3xjoxzgukc8u4l6t0rzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3XjOxZgUKC8U4l6t0rzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889055; x=1723493855; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nk3wy3iOlV41EdYWg2ADHBcnClsgP1AAs+CwqJBw/xU=;
        b=t5oxsPkl9gwwOIAC0AxkilT9czheSqO5ZovYEiMTdlxXEJu2DndWjAKsO9B7moDwbk
         j5Xp+57gbWD2dTwoD80hksy++mJ23NEZGxi0mab83awirGxg7nz/XZDENzrsvIdbJs9s
         eAqcGKzjZSe66qGedbwO1nn6mbAUhFSwZYMpGZFhQqD23ddKZoJIQnCeXLG0zVZtI5n7
         F46vAVBmCT+77/sXxmJDzi1yiOzvAIm5oZEiN7qGGWkM3/BPXrw5VXGUjWxzKWwYqRXj
         WvK0R4o7NURc9Hm1BWM0YtjR/44+i+oD6Xv9t5o4vgEFtsj5E0iZZuWuYBrY67nD0J3/
         bYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889055; x=1723493855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nk3wy3iOlV41EdYWg2ADHBcnClsgP1AAs+CwqJBw/xU=;
        b=YZI2olrGREivGSDHJliiP0CK8YtyKdFIC4a1VaSYq7jYXuur+4rF8/4fickZpure9B
         /zu+wbOfLatujiARFB2MmA9iRnlE8Pwgocziq4Pt82ADqqikhHls15ucnAI0bbWPuwk0
         2dtZ32T0PGY6wL6ZQjkNCz+urS2AX9P2etxsdDk3xYr8YKIisgaCKb7S4I9MCzdbQQvJ
         7S8hvdD85nkpzLV4L8lpRpLDxmv2qdj5vLRoimoeOwoLRcXIP0CR4fF7Xlc8Q0zBRQjD
         HQ+Rd8XsgwFdAWCL1sn4CiSgxVBZH1aBgOGTfRbQ+GfzUNiajdijGdQKjCZsvrwOEuiy
         jNjA==
X-Forwarded-Encrypted: i=1; AJvYcCVSwbdtC7qXNgV1dIZMnhlgSSdbc/Nibhv9bAAcNDAjrzwUZBRzoRSiix7RQpv40fsiQSiQj42arvJWFiWCIW+MvdzyGnvB
X-Gm-Message-State: AOJu0YySFG4U5Af6OJgCtCzL/FpgHPNNsQgxsRs8YsqQWqeuzDXRro7m
	SZFiCkm5gOzossLbEYS9RLnhZyHnt9MOxsECJkJBSyOfUlfDM4XCHOMPqgJo9bkvgQaliRxVhQ=
	=
X-Google-Smtp-Source: AGHT+IEii4/yzMfSp7LOsX7bSvtcsSwu3YPG0OH9OJP+3Z7rDF983ZAsDWCas7p00n2RRZm2FOn48nbu7Q==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a5b:404:0:b0:e0b:eb06:58b2 with SMTP id
 3f1490d57ef6-e0beb068624mr15190276.8.1722889054883; Mon, 05 Aug 2024 13:17:34
 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:03 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-9-tavip@google.com>
Subject: [RFC PATCH 08/23] test/unit: add register access macros and functions
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: BZSolH6SI7Rs

Add register access macros for devices models that use SVD generated
registers. This allows accessing register or register bit fields in
unit tests, e.g.:

  REG32_WRITE(f->dev, FLEXCOMM, PSELID, persel);
  g_assert(REG32_READ_FIELD(f->dev, FLEXCOMM, PSELID, PERSEL) == persel);

Also add support for accessing 32bit registers with memory transaction
state, e.g.:

  /* no register access until a function is selected  */
  g_assert(reg32_addr_read_raw(f->dev, FLEXCOMM_BASE, &tmp, 4) == MEMTX_ERROR);

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/regs.h      |   2 +-
 tests/unit/reg-utils.h | 103 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 tests/unit/reg-utils.h

diff --git a/include/hw/regs.h b/include/hw/regs.h
index 8d0da0629d..fd6576ba2b 100644
--- a/include/hw/regs.h
+++ b/include/hw/regs.h
@@ -59,7 +59,7 @@ static inline bool reg32_aligned_access(hwaddr addr, unsigned size)
  * // backstore is updated to 0x78
  * reg32_write(&backstore, REG2_ADDR, 0x12345678, wr_bits_array);
  */
-static inline uint32_t reg32_write(void *base, uint32_t off, uint32_t val,
+static inline uint32_t reg32_write(void *base, uint32_t addr, uint32_t val,
                                    const uint32_t *rw_bits_array)
 {
     uint32_t *ptr = base + addr;
diff --git a/tests/unit/reg-utils.h b/tests/unit/reg-utils.h
new file mode 100644
index 0000000000..f18ee07d20
--- /dev/null
+++ b/tests/unit/reg-utils.h
@@ -0,0 +1,103 @@
+/*
+ * Register access utilities for peripheral device tests.
+ *
+ * Copyright (C) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef _REG_UTILS_H
+#define _REG_UTILS_H
+
+#ifdef DEBUG_REG
+#define debug(fmt, args...) fprintf(stderr, fmt, ## args)
+#else
+#define debug(fmt, args...)
+#endif
+
+#define _REG_OFF(mod, field) (offsetof(mod##_Type, field))
+
+#define REG32_READ(dev, mod, reg)                                       \
+    ({                                                                  \
+        uint32_t value;                                                 \
+        value = sysbus_mmio_read_addr(dev, mod##_BASE + _REG_OFF(mod, reg), \
+                                      sizeof(uint32_t));                \
+        debug("[%s] -> %08x\n", #reg, value);                           \
+        value;                                                          \
+    })
+
+#define REG32_WRITE(dev, mod, reg, value)                               \
+    do {                                                                \
+        debug("[%s] <- %08x\n", #reg, value);                           \
+        sysbus_mmio_write_addr(dev, mod##_BASE + _REG_OFF(mod, reg), value, \
+                               sizeof(uint32_t));                       \
+    } while (0)
+
+#define REG_FIELD_VAL(v, mod, reg, field)                               \
+    ((v & mod##_##reg##_##field##_Msk) >> mod##_##reg##_##field##_Pos)
+
+#define REG32_READ_FIELD(dev, mod, reg, field)                  \
+    REG_FIELD_VAL(REG32_READ(dev, mod, reg), mod, reg, field)
+
+#define REG32_WRITE_FIELD(dev, mod, reg, field, val)                    \
+    do {                                                                \
+        uint32_t _tmp = REG32_READ(dev, mod, reg);                      \
+                                                                        \
+        _tmp &= ~mod##_##reg##_##field##_Msk;                           \
+        _tmp |= (val << mod##_##reg##_##field##_Pos) &                  \
+            mod##_##reg##_##field##_Msk;                                \
+        REG32_WRITE(dev, mod, reg, _tmp);                               \
+    } while (0)
+
+#define REG32_WRITE_FIELD_NOUPDATE(dev, mod, reg, field, val)           \
+    do {                                                                \
+        uint32_t _tmp;                                                  \
+                                                                        \
+        _tmp = (val << mod##_##reg##_##field##_Pos) &                   \
+            mod##_##reg##_##field##_Msk;                                \
+        REG32_WRITE(dev, mod, reg, _tmp);                               \
+    } while (0)
+
+#define WAIT_REG32_FIELD(ms, dev, mod, reg, field, val)         \
+    {                                                           \
+        int remaining = ms;                                     \
+                                                                \
+        while (remaining) {                                     \
+            if (REG32_READ_FIELD(dev, mod, reg, field) == val) {    \
+                break;                                          \
+            }                                                   \
+            main_loop_wait(false);                              \
+            usleep(1000);                                       \
+            remaining--;                                        \
+        }                                                       \
+                                                                \
+        g_assert(remaining);                                    \
+    }
+
+static inline MemTxResult reg32_addr_read_raw(DeviceState *dev, uint32_t addr,
+                                              uint32_t *value, uint32_t size)
+{
+    MemTxResult res;
+    uint64_t tmp;
+
+    res = sysbus_mmio_read_addr_raw(dev, addr, &tmp, size);
+    if (res == MEMTX_OK) {
+        *value = tmp;
+    }
+    debug("%d: [%x] -[%d]-> %08x\n", res, addr, size, *value);
+    return res;
+}
+
+static inline MemTxResult reg32_addr_write_raw(DeviceState *dev, uint32_t addr,
+                                               uint32_t value, uint32_t size)
+{
+    MemTxResult res;
+
+    res = sysbus_mmio_write_addr_raw(dev, addr, value, size);
+    debug("%d: [%x] <-[%d]- %08x\n", res, addr, size, value);
+    return res;
+}
+
+#endif /* _REG_UTILS_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog
