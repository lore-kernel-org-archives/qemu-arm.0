Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5086958njd;
        Fri, 4 Apr 2025 15:35:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhm5IVqs6jM02wRsRStnCElf6hn2MvHc0+QEcdR2882DCVIMOiI21MwsmCCUkQgKXCMhhTTC2ZgTn/tw==@linaro.org
X-Received: by 2002:a05:6000:250c:b0:38d:e3da:8b4f with SMTP id ffacd0b85a97d-39cadc737c5mr4356004f8f.0.1743806154076;
        Fri, 04 Apr 2025 15:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806154; cv=none;
        d=google.com; s=arc-20240605;
        b=F5B8Zlpc5eSURC7tHC7+11sVEZBwu/2DGWdPTviqSMxlO4C03bNUzzTngr/DwMmWOx
         fh9zqSqb5MupdL9J5e3Va2lEiiYW38dHH6PCSnDPmgxKzrFUsTLtRifP9EEhlmnpu8gI
         ByqjxhvR8PsijEEcQD2E1H6myIm439rQ9urX16+h8soRMsOWEsL77RNxrEDXOIjT9khG
         GIAEoGQ7BySqqyNFScGnJuBZZ4aYBk5trewFGq7g5Trl6HucVKR6xcXJURqK1SIPd2TJ
         Lc844QMNd843T26QFQgHQlpDGL/Qukt3dO+SkJbV6kVoXRNDStrTVLkgmmRtOo1vjqL5
         zysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0jtO3IMgAIsSiYXYuW6r2DQvOHBc5NKddZ/ZsUiqplI=;
        fh=C3H8CnOMNO4Ad03erA0TEJp6TY28dy/HzMMVxhd8i+8=;
        b=cyyn2Rdlmqutlj6eF8hEQy3Hl7tE0oQ+OHrlLghnnt0GajP6jUmrSP3FzzAbhXsf+q
         FNnjs9VzuyQt2bQNoIdYb3X9KqEnZJOHNIoWicsPDvenEczVNx0rgX3+vC8xCUzarXmf
         lAqryxLIBmeuO0QQI4Pvr0w8hhZLYlH4gNJQbkDafxqssCNkT6kFVUirVws7ZMhrLWg1
         RfOJYh2IAytyib1oTsOmQe7vZ7Sdtx8b6eVFrLtBtM9qE48YQLwL1WFXM9nxhkLdl3Q4
         pAlRC7yEGkFMCW+WGn9Q1jgW3ounoEcsDJQQML+M/NIZ4ALsdb3IsWywBEmbPYx5gRpT
         abTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zmzu2RpZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c2fb84d9fsor1532555f8f.1.2025.04.04.15.35.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zmzu2RpZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806153; x=1744410953; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jtO3IMgAIsSiYXYuW6r2DQvOHBc5NKddZ/ZsUiqplI=;
        b=zmzu2RpZGdxGejUARJBFebp6gCetJc8rCQVbWyobUFEH36fUnm0iQBbCMgOpaPABQk
         DeM3ONmhxvUfm6ksLNKuOFE4uw0hxyWDd/1fAoupzr/xV4DK731Va7/A3F8iozDxpETX
         S663Pkc0VbFMBK/8z/8zNQuOaIcudvLmOsjFDJnvK77mannJZhxpftr0y5Rk3GKu4YD7
         LjtKlsUQkOZqT56jqSawzP0HUJLkP/jSPwiI2wCch+S7Ae5Qj0X96nAcJRWXla7UpaE3
         7reNa3rPGKgQEHnylAITBRER9bRWucUE8k/4pM09ZeFWn8EqK+/iTXcTozPNSYLUWvBj
         /Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806153; x=1744410953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jtO3IMgAIsSiYXYuW6r2DQvOHBc5NKddZ/ZsUiqplI=;
        b=BbDk7s2n0lS2L6QDSqvgb64YNKfkS4dgMWB3ZqXWYmkWMkAYBh4rj4hNv/UruXRL3j
         RZ/uDMTiXOyTcbIukE7DdpLBNvCJgzevvM/4On7xCcFYkgiipHdHuTHzd2MHNVJi4RQh
         c39U8v3idoePACrNO9bTkHd/k2C3heQBOJFkPjPp8PP6rLZeFk/FILt7PMjtU4V1NOMq
         Jt2R6AyI9x4FUohdcKf4UldoOd1XGgRUWH6igRYC5meRNlnGKisAA/jw6xZYIaObY5GI
         2iAARVrgJ8Da1+m7bdmp7v1xnWHRuKql0VDC45XA9JyCWqM3Tc8GbZ7tkdiua35VydUl
         m+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAOx9Lee6mP6pDSF04AtKbs7rbhyY0i1Cm1fM8IIWmtXNwGdGvVBK7+PyOnjjrq9Ks95X6D8NDEoZtIg==@linaro.org
X-Gm-Message-State: AOJu0YylbSLvjh/59i82ZPLRpICQYoT2G158/kn7T9XrFED7regJJnwX
	PXmSkhYoRl6kOiodnfcOSVQ6NzT5xaDAXzzIP4LR1rDHgDd55EMnCq0eVB3M1Pp80Q==
X-Gm-Gg: ASbGncsqwSSFJ3RXx7pZFrkIOVfGcP3vZRybdNIQDmz+4MQplglDNNAdNCNBlmaJnBA
	kj2QquxwCu0DSiYZZv46Z2OX8GaTqUQeh7DWIJApF9bXtQWK9sPeIim+esXRfbbyIekdnWA9LHG
	ZeIAw2u1IsncHymrOTv6zZJ5OALi+c/WNKx1wdK/AddMyY88x4ulO13sA8t4H+k3Meu+YQusAJ5
	py46ldYsbcCHIK2wc/oHrr5NbsYORaDE4dYQ7r32DvAqw3MFRaJkKLKeF0j02VulEusR2KK8mFR
	QgzTlcfunzZssYP4EyIZBhEBUvbVktRo7+QFBzqdRjyA0pMR72KXNB2w/zEpzFAxf5Lv3tw7rtC
	tHugJLfmuiKM4FOsyOdfLPFtc
X-Google-Smtp-Source: AGHT+IFtP3Q8VM0usKUJUl+GjkENTtSEBAqcsIQRlmQpArlfcsMsPs1GBIB7BAFhIb039iAa6teSdA==
X-Received: by 2002:a05:6000:400e:b0:39c:30d8:3265 with SMTP id ffacd0b85a97d-39cb35b8c47mr4130816f8f.15.1743806153554;
        Fri, 04 Apr 2025 15:35:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7064sm5495689f8f.34.2025.04.04.15.35.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:35:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 6/9] target/arm/mte: Rename 'mte_helper.h' as generic 'mte.h'
Date: Sat,  5 Apr 2025 00:35:18 +0200
Message-ID: <20250404223521.38781-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lgKN97oymVtJ

"tcg/mte_helper.h" header name is a bit misleading, since it
isn't restricted to TCG helpers. Rename it as "tcg/mte.h"
which is a bit more generic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/{mte_helper.h => mte.h} | 0
 target/arm/gdbstub64.c                 | 2 +-
 target/arm/tcg/mte_helper.c            | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename target/arm/tcg/{mte_helper.h => mte.h} (100%)

diff --git a/target/arm/tcg/mte_helper.h b/target/arm/tcg/mte.h
similarity index 100%
rename from target/arm/tcg/mte_helper.h
rename to target/arm/tcg/mte.h
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 64ee9b3b567..65540cffd2c 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -22,7 +22,6 @@
 #include "internals.h"
 #include "gdbstub/helpers.h"
 #include "gdbstub/commands.h"
-#include "tcg/mte_helper.h"
 #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
 #include <sys/prctl.h>
 #include "mte_user_helper.h"
@@ -30,6 +29,7 @@
 #ifdef CONFIG_TCG
 #include "accel/tcg/cpu-mmu-index.h"
 #include "exec/target_page.h"
+#include "tcg/mte.h"
 #endif
 
 int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 8a6e6e4719d..b70f23e2047 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -36,7 +36,7 @@
 #include "accel/tcg/getpc.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
-#include "mte_helper.h"
+#include "mte.h"
 
 
 static int choose_nonexcluded_tag(int tag, int offset, uint16_t exclude)
-- 
2.47.1
