Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2281601wrv;
        Sat, 3 Aug 2019 14:08:12 -0700 (PDT)
X-Received: by 2002:a17:90a:b883:: with SMTP id o3mr10752439pjr.50.1564866492413;
        Sat, 03 Aug 2019 14:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564866492; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNN2SmvGxfkrsFDiKvpqtfvK/fnNgKwT4DSUAaMDXHJJhDHbYF2elx/X6J1TXKWKIG
         QMR4n3iVXUURHimSgCaijwMFeFvUGMHzmNMYURhWyZble7LXxwWund0x9Z+V1uiE3alF
         rBYtWhhjKDzlElR42AcSzjtyOTTTC7ILpbMDIGIjBiVCbHlyhn+Ffw9QFaLnGOhLHXT5
         e6QF64FInP/OinP5vtns6sBu85J/lu3jHWcmAIY41c43R0u6EIG7tr1cdKlB2UOTZUyw
         45bEpNzRExeFNncQSqTmcthWHVs9bd2Ppf4o/Yzfi6v3bYh7wgnRPuaZiZ0wBdGg4gtq
         4A6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=bmpQuQaLO45/V21gwxDx+DwJ2G3aSCxmFjq9t4PMMQo=;
        b=sC5v+/JTdrPyLxxpjGVBVWopuTh26pK3rfUC3KMLoZIBjCcDh3O8K5wK5atc4kv9PK
         bjU68MVqYOTPsZbFJjIL1tuMw/cseaQZjtBsSMtsNOX01/cRCe+zxXDQ8unK9kMXIy/E
         8GwgagNz2ZN1alwjtXYLIhABRZmo9Z2T0ESl0PSLVbODxCA5LTdxOxaC68SZ9w3fgJHY
         DjKJPDIdg2WAnBgtQ7imo9ggVFJBd2qDJDWKu0RIO5VNegrrYtivoYu9HkJY0x17kPgA
         Pm5k/BHssexGa+1ubkvfp7SUFUjTegJtzl1Lo9IodTK9M1YOQ7eA0iwjRgFR7EbIhYhB
         7dng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TbDJ/7Un";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f16sor53749421pgn.77.2019.08.03.14.08.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 14:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TbDJ/7Un";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bmpQuQaLO45/V21gwxDx+DwJ2G3aSCxmFjq9t4PMMQo=;
        b=TbDJ/7UnbJ5tKa+3jraWvw1FWaKuke5i8tZyS9pWJDDeQtApkyFVJM+SU6NDcd0JDS
         r702rKwzJRI0CPJ1dBDY8ZQaPev/ARW0VKWwSKRkxcXtz9kpTR1JwV2ms145AAcGqcBG
         fWymPRWy6iHEmfj3IK9leFrMGixXIx4peU61F0MUjJpO8ULjZUSQp8o1DXLEwHLivYOd
         h2QUK6aPr5w06YfjxkZokkRIljBuczwD3O/RaiaBPMbxOKjdJpzpHk1RAGsRlpIuwbat
         kuY+TzlwhC1H9k00Oqw2mF5Y5urGPdilkgtwrI7SobGrg7Ft0kP9YUlgg16XxY9tgA7H
         w1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bmpQuQaLO45/V21gwxDx+DwJ2G3aSCxmFjq9t4PMMQo=;
        b=l8wiUikkv4DMGqMvmNGRdFFGASaOm6qGUVM4X2Hr+0eN8BuLc0vmtghYTJhUp4BmGW
         YfOywYWMBY2TzPfnTYEEERdwPCqVyj1IXJBZkZgaOLuOSAZdruUwCJIADNhZDnXAV45C
         jUG1dk+iSbcEskmxFqql5S/PP7bKK/HVUCCx+2CHgHFp1fj5yiDZkx5wFKjWhlCgB+IH
         mpMLx9bBEBJdmFWaViMguakyMtJcrcPnvkyPlvwV5QBleIGZuU6Zfr3gDeWZ0W+ctjA8
         xSXE++C4WYUwBlOZaIhDW+zCoplEYLOKzZFoUtp7LT0Qti6hPScgZJh7xpFz8kqWF3EE
         HIWg==
X-Gm-Message-State: APjAAAUWMBLFFlSFmD1VSHvQHP2B7LgipuSE/jWlQ5nZqKlfLOrRhw2z
	xvjhAyxiKnjARCD9iW1PFVJ9WtzN
X-Google-Smtp-Source: APXvYqwrSbtV283JX55qzojT9ktHXZ98fzkzKQWggzPk4Ci6ekdt41cXHVTIQmb7Ix5SYA9RQ/bv5A==
X-Received: by 2002:a63:6947:: with SMTP id e68mr94509807pgc.60.1564866491659;
        Sat, 03 Aug 2019 14:08:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id x25sm110129644pfa.90.2019.08.03.14.08.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 14:08:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	Dave.Martin@arm.com
Subject: [PATCH v7 4/6] include/elf: Add defines related to GNU property notes for AArch64
Date: Sat,  3 Aug 2019 14:08:01 -0700
Message-Id: <20190803210803.5701-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803210803.5701-1-richard.henderson@linaro.org>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
X-TUID: Tupo0rPi9zGY

These are all of the defines required to parse
GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
Other missing defines related to other GNU program headers
and notes are elided for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 3501e0c8d0..7c4dc4b2cc 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -26,9 +26,13 @@ typedef int64_t  Elf64_Sxword;
 #define PT_NOTE    4
 #define PT_SHLIB   5
 #define PT_PHDR    6
+#define PT_LOOS    0x60000000
+#define PT_HIOS    0x6fffffff
 #define PT_LOPROC  0x70000000
 #define PT_HIPROC  0x7fffffff
 
+#define PT_GNU_PROPERTY   (PT_LOOS + 0x474e553)
+
 #define PT_MIPS_REGINFO   0x70000000
 #define PT_MIPS_RTPROC    0x70000001
 #define PT_MIPS_OPTIONS   0x70000002
@@ -1651,6 +1655,24 @@ typedef struct elf64_shdr {
 #define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint registers */
 #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
 
+/* Defined note types for GNU systems.  */
+
+#define NT_GNU_PROPERTY_TYPE_0  5       /* Program property */
+
+/* Values used in GNU .note.gnu.property notes (NT_GNU_PROPERTY_TYPE_0).  */
+
+#define GNU_PROPERTY_STACK_SIZE                 1
+#define GNU_PROPERTY_NO_COPY_ON_PROTECTED       2
+
+#define GNU_PROPERTY_LOPROC                     0xc0000000
+#define GNU_PROPERTY_HIPROC                     0xdfffffff
+#define GNU_PROPERTY_LOUSER                     0xe0000000
+#define GNU_PROPERTY_HIUSER                     0xffffffff
+
+#define GNU_PROPERTY_AARCH64_FEATURE_1_AND      0xc0000000
+#define GNU_PROPERTY_AARCH64_FEATURE_1_BTI      (1u << 0)
+#define GNU_PROPERTY_AARCH64_FEATURE_1_PAC      (1u << 1)
+
 /*
  * Physical entry point into the kernel.
  *
-- 
2.17.1
