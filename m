Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp485215njk;
        Thu, 23 Jan 2025 15:45:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWdPTAGke4oOP3s5WD7qDIClqSJCY92ksWaHoZgQ+LKvt527cIHKWdx93K1r4mV8LNSIhMq1gU/mYZzNw==@linaro.org
X-Received: by 2002:a05:600c:1c0f:b0:431:44f6:566f with SMTP id 5b1f17b1804b1-438913deb12mr235271145e9.13.1737675908261;
        Thu, 23 Jan 2025 15:45:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737675908; cv=none;
        d=google.com; s=arc-20240605;
        b=KenCyjWfgzONMLM5tjLY3g81rDxY86QbClq3T8zizuZEykQj6CV0j885NLNfGBaYQq
         sowh7NLvOQnIZpF4La9y86Utx82w2DFIQvl1drA+6NgJQLIb7TQL4WB4cS23AvrnMD9Z
         mpzFS+LLl2HdxNSG02lvvZT1uh+XzpIvBTx7081pjB2AVyzCopeSixp/w82kFVD+XTwD
         n5rtNhEMNTg0zdg03VcQUBdMnvIu0dee0Pu0FiPtQX4kBWprBum24tkXm8r+cjioGU4j
         TnPX73TQ5Lq/ADJtl85r0SmhhN8PBsp0jNYDFlrFUjyY47Z/AqOiZLlyNt4W2SGh3Wok
         dA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yDFP15LbfYjBwdgoNtB1SUTPS+QYiGObjjbLDQKpiPc=;
        fh=Z2zBbizLFUGk7Nr2IdTErcJEiH07OZVbuj07zKe+zCU=;
        b=FLzH/aStyX/yZa9qT8HHdeUJnUb8dQroR6Y8gYEI1gard6+ghjRhLraRDoAzOQXQYG
         mGcpaNQhp3UJJNpYDwm1PnbG5ZpLIPSsjTmkgR/4tpgOf1za1mwQMtPiIrQRGsQFoujD
         keUh5J+awvxcXozsQDmFReVHP0adKgZg0XDVLNjRw7n4uChck+pcLYFb2SSrnd0U45tO
         85OuGdi1pDmLj4IncbdMSBbMIpuBk3X5F+F3q7/DXBeSca6ha17d+xDy8riN/02qZEAs
         XxGAZkWsXwrLi5yhjI7aJLCMjMfww8EbDDyqi1AHzW9DIEJ7G5teBPSnwQYDonl1/qRd
         4E8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jp9WxAYQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd6c56edsor1974785e9.10.2025.01.23.15.45.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Jan 2025 15:45:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jp9WxAYQ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675908; x=1738280708; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDFP15LbfYjBwdgoNtB1SUTPS+QYiGObjjbLDQKpiPc=;
        b=jp9WxAYQ78KNyGI+MtDvIdFpDeb1D3+6jN6v4LdUC4A46k1pFfHHnL7gGdndJFa3xZ
         7qzMXHp1Xm5ngdEYoOxVZDtYeoghtmHBvZMZUiadM39vPb84qFk9y73HINY3S2TXRXww
         yo4ueJccUad+wu4jk1uMDURwxSQmLNrXFASS9HYrJOP1leEv6MGGceeruCAp24eR7iXu
         7By2tulk15a48USlNNCJR742OSC+eqcx1vBwjnSlA6SqPBbtlzKMUbjH/aYSkEAR1Qm8
         PMzfo/MttOZK9GhB13MZvkZZ9CQQOCOizehkeUzy67kvuVqmOc7iiOijowOIx2CUeE7b
         VvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675908; x=1738280708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDFP15LbfYjBwdgoNtB1SUTPS+QYiGObjjbLDQKpiPc=;
        b=CAypDIeChx/WFYBuWFcZqQUwZhRtWKgHR2pq79oPlClef5sKCk2rH4DH97QD41wo8c
         2yzR1i1WXaquF4Ob6g7DOfYmOOf3wzs5VatDaPfWvzxQ5uQ2gQmE891A3llX3so9uHam
         FdIo0+XGQXppllwxFgiOCyESB0jNqPKwqOGQwhcR9hTXm3oIORCShOTzbMU4AknQxGhS
         jfnCN0P7ogOcILJGHFE2KarujExbQ/JngraFDeSNr6BseBhiPrHJiJ1hEf1R0xn+7ta0
         mEw/mcKwQsREG4Cl1Sq0Nr8ryP2ujUOcUW+XioA+wJAgBiMH/URGMnj1+C7TZI4jMMc9
         amBA==
X-Forwarded-Encrypted: i=1; AJvYcCXJalOoLSOrdyj3/KSlle6VMmpo3dnmyESyiHhgac/6m5AeCfLGLRXa/QKz35U8JQo/uC6rQh5KHALtXQ==@linaro.org
X-Gm-Message-State: AOJu0YzNUINHtRVN9zmOJPfZkz88ihTYWGfgv/xWe7d0QIKR3wcPpACK
	VN+iLZ/sM/uti0oZk4K6CrdtasfG/t3DT3F3hq34evV0q1Mbv7mhuOpiEu1QQHTRcw==
X-Gm-Gg: ASbGnctoYURM0evTy61NR7DZZF14IANfsg09DEdI3FN/R5o1N522CJx/VL6fF6wX3Ge
	USh+nAzJ8KhcO47DLNc2C407vEVf8moR0/zmpAqdpXxkUlNIJ5BweHwvoDQQiawg+YQct5WACBa
	4uGmuvSXricFOQVKz+ZBD76dB/VpuLMnj8BkLfYWzdAr+lfNCt55eFvBx8Xbwz87q0U7MWpDyUW
	Lfx/+CgM0FKtddmdDJYTFU0niwhJIuvWxc3j/bCGVmEWjfD3lUfPgT/p9NPwneKPSzmLG6VWw9M
	WSzl4UAqshKEbJFehd4oHaq/my2J/Auwz3NQmiHecAkkiJTq8dqGd4c=
X-Google-Smtp-Source: AGHT+IF/y2rn8++eRXtfGXVV9eCNnufdJ4OAKshcVAU/XMr+be4nBaPjnThGR5Wf47h3eLbBgCoQsA==
X-Received: by 2002:a05:6000:401f:b0:38c:2677:9bee with SMTP id ffacd0b85a97d-38c26779db8mr3711264f8f.15.1737675907708;
        Thu, 23 Jan 2025 15:45:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17630asm997952f8f.6.2025.01.23.15.45.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 15:45:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/20] accel/tcg: Restrict 'icount_align_option' global to TCG
Date: Fri, 24 Jan 2025 00:44:03 +0100
Message-ID: <20250123234415.59850-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: y73rrse2CTNU

Since commit 740b1759734 ("cpu-timers, icount: new modules")
we don't need to expose icount_align_option to all the
system code, we can restrict it to TCG. Since it is used as
a boolean, declare it as 'bool' type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/internal-common.h | 2 ++
 include/system/cpus.h       | 2 --
 accel/tcg/icount-common.c   | 2 ++
 system/globals.c            | 1 -
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/internal-common.h b/accel/tcg/internal-common.h
index d3186721839..7ef620d9631 100644
--- a/accel/tcg/internal-common.h
+++ b/accel/tcg/internal-common.h
@@ -17,6 +17,8 @@ extern int64_t max_advance;
 
 extern bool one_insn_per_tb;
 
+extern bool icount_align_option;
+
 /*
  * Return true if CS is not running in parallel with other cpus, either
  * because there are no other cpus or we are within an exclusive context.
diff --git a/include/system/cpus.h b/include/system/cpus.h
index 3d8fd368f32..1cffeaaf5c4 100644
--- a/include/system/cpus.h
+++ b/include/system/cpus.h
@@ -38,8 +38,6 @@ void resume_all_vcpus(void);
 void pause_all_vcpus(void);
 void cpu_stop_current(void);
 
-extern int icount_align_option;
-
 /* Unblock cpu */
 void qemu_cpu_kick_self(void);
 
diff --git a/accel/tcg/icount-common.c b/accel/tcg/icount-common.c
index b178dccec45..402d3e3f4e8 100644
--- a/accel/tcg/icount-common.c
+++ b/accel/tcg/icount-common.c
@@ -48,6 +48,8 @@ static bool icount_sleep = true;
 /* Arbitrarily pick 1MIPS as the minimum allowable speed.  */
 #define MAX_ICOUNT_SHIFT 10
 
+bool icount_align_option;
+
 /* Do not count executed instructions */
 ICountMode use_icount = ICOUNT_DISABLED;
 
diff --git a/system/globals.c b/system/globals.c
index 4867c93ca6b..b968e552452 100644
--- a/system/globals.c
+++ b/system/globals.c
@@ -48,7 +48,6 @@ unsigned int nb_prom_envs;
 const char *prom_envs[MAX_PROM_ENVS];
 uint8_t *boot_splash_filedata;
 int only_migratable; /* turn it off unless user states otherwise */
-int icount_align_option;
 
 /* The bytes in qemu_uuid are in the order specified by RFC4122, _not_ in the
  * little-endian "wire format" described in the SMBIOS 2.6 specification.
-- 
2.47.1
