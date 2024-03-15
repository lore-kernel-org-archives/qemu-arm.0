Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989764eju;
        Fri, 15 Mar 2024 06:10:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbe2GQ8qpObbeCfkDfep2ciNZtia7Z7r/VzDKzzq4BkmtzDVyNQRKRyakLMv7p2Q2zywyDea35WqG6un15yuD6Q/rdtUXj
X-Received: by 2002:a17:906:7181:b0:a45:6b66:92ab with SMTP id h1-20020a170906718100b00a456b6692abmr3255023ejk.51.1710508235490;
        Fri, 15 Mar 2024 06:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508235; cv=none;
        d=google.com; s=arc-20160816;
        b=D/grZs953TUPYS1rzoVpqHwZFbJv7HSFEGmVmtoDKff3OzGzChp3f+/F7aQgu65FBD
         Suau5r19yIE1cLi1zGt9KR9AbOCdoKDfbWSDYEfHc78lYpqq6+7Aw8R737znGq/gp/4+
         hIkDiiPbELZ7lzCAkOQq3lI/uyBf44EIebKa/jlZmr9RcYRzywnB0a/xsfflG5mAZjZh
         yH0/uWLxjELEMFKZO0UC9UmU+n+XwDWOsguVLlMsrI2J8PHmMyNuebRVi1IjHvDPwkv0
         wn2KlAEJUq2YBMq1wdmHCtOjD1qbFVAABNmSJJN0k9Bq8MsCLRXjwttd6KWeDiNmqHVu
         jUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ziq2wowWWC1u1AFoZqkoU9Vq9nlm9ySbjwCpiWVML/s=;
        fh=odq/f1P8WzgFbcvth1l/AII3RIXaBrnqRrB3S4Xqe5M=;
        b=nQy5p4JwG8lUCxOEFvzwLPoaVrjp8RKBjN8oQ4o0lBpwclnW7qXbdV27CT/MFa9kB1
         B7CZjCKoHptbBodM9z/rtznKYbzalhi6nnclUHSe+RDPGye9Af32nr6CEPuX3NtW8Zr7
         O/0VLI10OXK0NTjIaO7zpq8zem3cOzFOzPpkHLPzi29GYMVWVF2c2FE7rg/K5nr0xNp7
         dFzmwFUb8qnDobfgKKorEvHBY3lIzWBVPTpfcOqCzuP5g/EPRh2/BgB/JauOYoFHnyOX
         9D5T8vXdFKkpwra04OkcRf1w26XH7EL4Uk8i5w+dQCAcSeBWXGAF3dawcHAURVeb7UbS
         w2LQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5AWLOgo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ku14-20020a170907788e00b00a4677787b97sor1116096ejc.2.2024.03.15.06.10.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5AWLOgo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508235; x=1711113035; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ziq2wowWWC1u1AFoZqkoU9Vq9nlm9ySbjwCpiWVML/s=;
        b=h5AWLOgoVVSzbCumZHsFuYa8eD3EdKSBgEa2Xn+NMRQbFcdPDdshuADaw7+po663BT
         yJjEV75+TJJ6fj8xBb2vcNATHJ1iVRC7sBYYZk3BgLyqC1nqxSdWNORR07HbpmZ3xJno
         8TstRBcZb08YYmBcLSOmRt7mQ2HWZHnkZeXkTPKReQv0MgOU9mz7/khGoG9nUHV8eaOi
         kLZaiaRVA6YRm23QxmWvTdW57VB5dM5FnxPoFjskrele8Sl5+6odtsfIhQFlNTZI5wu+
         0q2wHiIQSduDL/9kI3/9XXs/ex6ovdXC/P/aqsNOUIhAAxM/DSWi0w01Z+yBu+SeRzH+
         HqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508235; x=1711113035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ziq2wowWWC1u1AFoZqkoU9Vq9nlm9ySbjwCpiWVML/s=;
        b=Ecmwjx6pqU1zYaOKetT6OGXGkcvjvzob4w3cP9Hoq9NhAkqo61ami5Q1WeLr5ai2IW
         pZ5ZV7+A+qZTcc71wsU4bB+YE4DeTq+dgKpYftNVEESujmrG4uwkTJvQ9T79eaCS78+0
         5H5RkThghnScBNrk/uMc9N5A6kEvbD8+gV60s8C3ufQGp8dNqUH980OZvLtBK46zp+rX
         FHy1Q+wx+qnSPfIfGpaAyW5hx8+0E5ujGiCpoRJnbW1JsXGduwJabJNLufBQ3AQvOoWM
         HB7xbmoN8Q4O2xCfl9NAsxTVMhY9uKjRREXr9vNx7mEDgmHXzGmy7ivada0mHOOtrukL
         rNCg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ397gsFr3OSlhGtKltYELSFDiNuYabgcevP38ko/6FV7C9gdXXMcNtmk3VAcae28gS133E/mBIXhUN20lhnu1cmgmrXWd
X-Gm-Message-State: AOJu0YzE+zvJzNmAipHHSugqs/hwtqZwFvLohV6+1ipK2RVMU/euhWFl
	n6Y/wTHpcrqIGaKIsWZU27Ohi2Zduldoobje4WyNOVmVCMLeqRzy4uztXr3Q3RWDcg==
X-Google-Smtp-Source: AGHT+IGM9lKIGYFKaZaCihcgLpVmcmySzlNiRx+Vc9T9AfUSHHHR2fR0Hvp2VtpFFpo3dT3QgLPrVA==
X-Received: by 2002:a17:906:40ca:b0:a45:2e21:c776 with SMTP id a10-20020a17090640ca00b00a452e21c776mr3334104ejk.3.1710508235156;
        Fri, 15 Mar 2024 06:10:35 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id c19-20020a170906341300b00a462736feedsm1691257ejb.62.2024.03.15.06.10.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 12/21] system: Introduce QemuArchBit enum
Date: Fri, 15 Mar 2024 14:09:00 +0100
Message-ID: <20240315130910.15750-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mFy8s7coptE2

Current QEMU_ARCH_foo definitions are used as masks.
Extract the bit values, so we can easily iterate over.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/arch_init.h | 69 ++++++++++++++++++++++++++------------
 1 file changed, 47 insertions(+), 22 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 8850cb1a14..cf597c40a3 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -1,30 +1,55 @@
 #ifndef QEMU_ARCH_INIT_H
 #define QEMU_ARCH_INIT_H
 
+typedef enum QemuArchBit {
+    QEMU_ARCH_BIT_ALPHA         = 0,
+    QEMU_ARCH_BIT_ARM           = 1,
+    QEMU_ARCH_BIT_CRIS          = 2,
+    QEMU_ARCH_BIT_I386          = 3,
+    QEMU_ARCH_BIT_M68K          = 4,
+    QEMU_ARCH_BIT_MICROBLAZE    = 6,
+    QEMU_ARCH_BIT_MIPS          = 7,
+    QEMU_ARCH_BIT_PPC           = 8,
+    QEMU_ARCH_BIT_S390X         = 9,
+    QEMU_ARCH_BIT_SH4           = 10,
+    QEMU_ARCH_BIT_SPARC         = 11,
+    QEMU_ARCH_BIT_XTENSA        = 12,
+    QEMU_ARCH_BIT_OPENRISC      = 13,
+    QEMU_ARCH_BIT_TRICORE       = 16,
+    QEMU_ARCH_BIT_NIOS2         = 17,
+    QEMU_ARCH_BIT_HPPA          = 18,
+    QEMU_ARCH_BIT_RISCV         = 19,
+    QEMU_ARCH_BIT_RX            = 20,
+    QEMU_ARCH_BIT_AVR           = 21,
+    QEMU_ARCH_BIT_HEXAGON       = 22,
+    QEMU_ARCH_BIT_LOONGARCH     = 23,
 
-enum {
+    QEMU_ARCH_BIT_LAST          = QEMU_ARCH_BIT_LOONGARCH
+} QemuArchBit;
+
+enum QemuArchMask {
     QEMU_ARCH_ALL = -1,
-    QEMU_ARCH_ALPHA = (1 << 0),
-    QEMU_ARCH_ARM = (1 << 1),
-    QEMU_ARCH_CRIS = (1 << 2),
-    QEMU_ARCH_I386 = (1 << 3),
-    QEMU_ARCH_M68K = (1 << 4),
-    QEMU_ARCH_MICROBLAZE = (1 << 6),
-    QEMU_ARCH_MIPS = (1 << 7),
-    QEMU_ARCH_PPC = (1 << 8),
-    QEMU_ARCH_S390X = (1 << 9),
-    QEMU_ARCH_SH4 = (1 << 10),
-    QEMU_ARCH_SPARC = (1 << 11),
-    QEMU_ARCH_XTENSA = (1 << 12),
-    QEMU_ARCH_OPENRISC = (1 << 13),
-    QEMU_ARCH_TRICORE = (1 << 16),
-    QEMU_ARCH_NIOS2 = (1 << 17),
-    QEMU_ARCH_HPPA = (1 << 18),
-    QEMU_ARCH_RISCV = (1 << 19),
-    QEMU_ARCH_RX = (1 << 20),
-    QEMU_ARCH_AVR = (1 << 21),
-    QEMU_ARCH_HEXAGON = (1 << 22),
-    QEMU_ARCH_LOONGARCH = (1 << 23),
+    QEMU_ARCH_ALPHA             = (1 << QEMU_ARCH_BIT_ALPHA),
+    QEMU_ARCH_ARM               = (1 << QEMU_ARCH_BIT_ARM),
+    QEMU_ARCH_CRIS              = (1 << QEMU_ARCH_BIT_CRIS),
+    QEMU_ARCH_I386              = (1 << QEMU_ARCH_BIT_I386),
+    QEMU_ARCH_M68K              = (1 << QEMU_ARCH_BIT_M68K),
+    QEMU_ARCH_MICROBLAZE        = (1 << QEMU_ARCH_BIT_MICROBLAZE),
+    QEMU_ARCH_MIPS              = (1 << QEMU_ARCH_BIT_MIPS),
+    QEMU_ARCH_PPC               = (1 << QEMU_ARCH_BIT_PPC),
+    QEMU_ARCH_S390X             = (1 << QEMU_ARCH_BIT_S390X),
+    QEMU_ARCH_SH4               = (1 << QEMU_ARCH_BIT_SH4),
+    QEMU_ARCH_SPARC             = (1 << QEMU_ARCH_BIT_SPARC),
+    QEMU_ARCH_XTENSA            = (1 << QEMU_ARCH_BIT_XTENSA),
+    QEMU_ARCH_OPENRISC          = (1 << QEMU_ARCH_BIT_OPENRISC),
+    QEMU_ARCH_TRICORE           = (1 << QEMU_ARCH_BIT_TRICORE),
+    QEMU_ARCH_NIOS2             = (1 << QEMU_ARCH_BIT_NIOS2),
+    QEMU_ARCH_HPPA              = (1 << QEMU_ARCH_BIT_HPPA),
+    QEMU_ARCH_RISCV             = (1 << QEMU_ARCH_BIT_RISCV),
+    QEMU_ARCH_RX                = (1 << QEMU_ARCH_BIT_RX),
+    QEMU_ARCH_AVR               = (1 << QEMU_ARCH_BIT_AVR),
+    QEMU_ARCH_HEXAGON           = (1 << QEMU_ARCH_BIT_HEXAGON),
+    QEMU_ARCH_LOONGARCH         = (1 << QEMU_ARCH_BIT_LOONGARCH),
 };
 
 extern const uint32_t arch_type;
-- 
2.41.0
