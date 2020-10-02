Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944654lfq;
        Fri, 2 Oct 2020 15:00:02 -0700 (PDT)
X-Received: by 2002:aca:ad08:: with SMTP id w8mr2407189oie.148.1601676002533;
        Fri, 02 Oct 2020 15:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601676002; cv=none;
        d=google.com; s=arc-20160816;
        b=Ce8ZzSsCJ6hP4jAZjCmcDlXt5MQ67epNVvZQerPJQw7jX0TlKpiDYL2mpP89QcUSYp
         h0hThCKP4Qk5r9PxQPDnUWEh3nuUiZ8Mgs24t3D46d+nVhPnTgAofeZCLWBqjAMvVEL8
         4WGH/bMp6heWl5ovd7dBk5LTtecodl7eor7wOC6MggRX19i+2BUmnmBinFya6pc0zpGo
         YtAu5gEoBWJSmH7VY/e6w97UuhBbyYznv207bVEErV3U9lW3Sh7PhUi3BWbfrI0HvACX
         k0diTTC6mQcVUf0lcUSsSGrIXa5GjrFuyQnDwneHaQl4PS3aisRZGloIelQRv4MekjuB
         AjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8JkogZW08o4QbERarC4qat0jsqD9fmDjl7gKGBrUP6I=;
        b=iuVSE5gJ8feF0Bv9qP0RE8IjTjjDUZQmHYyBZUjuvqEAT3DKcpWDKBzmvNcVKqX1Io
         Puh0IThkH0HdXnTPgNO1u/8AZcxu7qbembcqVLrQmuGSwbtfzAp2pNXflubkO0YuWTyp
         1SeCl67noJQvv2t4LOLozfCH3DsrPqpMriAWLjHXv1KjYGdbYvuOiOkLhsRp4spwWNiH
         m9kbMMZei4oFOnE1THE3Ena09ksck14KO5ghbqy7Dp0I55Tm4ASKpw/Yqjm7uFObmRIp
         NUq8egONrMAAJ2XjD7kI1u1zxK4l/R0MXqGVzVuNaB1MuemAK6Fj08GFX02UGjTqDO//
         GvQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c3RN+aji;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a15sor612067otf.107.2020.10.02.15.00.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 15:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c3RN+aji;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8JkogZW08o4QbERarC4qat0jsqD9fmDjl7gKGBrUP6I=;
        b=c3RN+aji6elqAzxQuRf0rQc9a0thf5PgQZjIrZc/eCTeEInfcnBayDCUPLQdNLtcR1
         6GS+qYB4TQU2KQ5QtrmvAGS/witbEbPSItSYWJwL9W5g9NYEbG3PrhB/80XN9msaE8UI
         LHvkKV3KoWXYHgrzoateQGCnURj4VBRz1izfuNx6AKYcZOGI2ta8749jvX9mFgvv3rhM
         7vfZipBVPVe7MZHEPvQgPofnUuVdCnnwdZAmp8XAH9FAig0lVO9VDz6Qn6yy44mBdLQ6
         TVLNluaFsaDjmbFNatPCApTYCmcf9/kLvjQi1/jQ3T+FQqsGa8wNcfLgZgMwIDtmOAJf
         Oe9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8JkogZW08o4QbERarC4qat0jsqD9fmDjl7gKGBrUP6I=;
        b=X3MKod7pjyHOfOj1jB+7AdA8Ja7hTutD35efo49SglOlL2Y8gpSdeb1mrDT8XXHjnU
         gFROYSBinsxLkLbH4dPi8t/NYGNAY6PYvlU1Kd4VNnLmlw8X17WBDg/hGKEwGq47nopw
         LNjDdNrQMCBMyVNMb1zYcRDyZln8Qdr2UKHH4ZZNVQ8Qsq8sBVBV7sbWN7FRTfCyX5mm
         JSnQCM62rIYFPOyzMq+M9zTzN+JjIPxG642mar4aQcMKeA47hmbHi3AuscTlQLTQWVgX
         d11eLALw7/EHwvMvftwcmdDoJQpqGoIc8EXi9l++oJTvdH3+PLTZQds/ENFwSBD3Iapc
         XJow==
X-Gm-Message-State: AOAM530ZT1eyYkBfaeGPjD6bkMHX7voRgpR0AGi3o8POsTHwhoJyWtce
	zRejkXym8duHFZPbThfR9vgMmtMejcoL2TwfmSc=
X-Google-Smtp-Source: ABdhPJwP9J3brY/GoD1M9WbIcvO7jrfA7Gsjh4ejWLvR0DZsLiV8lIDKBxcu9oEVC8I/GFI0WBQaqg==
X-Received: by 2002:a9d:1442:: with SMTP id h60mr3387353oth.35.1601676002120;
        Fri, 02 Oct 2020 15:00:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.15.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:00:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 3/8] include/elf: Add defines related to GNU property notes for AArch64
Date: Fri,  2 Oct 2020 16:59:50 -0500
Message-Id: <20201002215955.254866-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: b7sHreBqSj0W

These are all of the defines required to parse
GNU_PROPERTY_AARCH64_FEATURE_1_AND, copied from binutils.
Other missing defines related to other GNU program headers
and notes are elided for now.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/elf.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index c117a4d1ab..10126ff809 100644
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
@@ -1657,6 +1661,24 @@ typedef struct elf64_shdr {
 #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
 #define NT_ARM_SVE      0x405           /* ARM Scalable Vector Extension regs */
 
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
2.25.1
