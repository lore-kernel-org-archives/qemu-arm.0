Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25816njc;
        Wed, 13 Nov 2024 17:14:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJxPuWjDG5mSR+YB9YHzWkWEr68YNJgabQFc5dUmpqrZ7JTNUqjd0DwzomcwgqrWHEGlIgvvVqoxsgJQ==@linaro.org
X-Received: by 2002:a05:6000:18a7:b0:37d:52d0:a59d with SMTP id ffacd0b85a97d-381f18672fdmr17894673f8f.10.1731546845081;
        Wed, 13 Nov 2024 17:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546845; cv=none;
        d=google.com; s=arc-20240605;
        b=RqNL9DYH0iIi49Qu47KMnMLRnbMIm7D5H7BRlpqTBhdkU96IIWf7ReCcEiaCTN32zC
         cM0BSy+KQltTejV+bMFT+EhrMdfocdhWoxmA/K7prjIRdGU/En7ur5sQESoyudWH2Apf
         uCxGI/xwiD6Pmi7OGCHDmujaqsppJ2lqHOvyJwycXgr10LgFkdSZlAq8Z4FhFa4TATS5
         95ljZxxBVkBhRuxhB2W2Gqhxs/EBNUQPywUdrWT+BiTsPQUwd2tXU8dOp+6XevQjrdVj
         cR8LPUwGqYQl8icbB7TRVgPbp2aiLMDQ2syjpS12Y8h2Ajijsgbh6IFQ0VbyCfeGRlhg
         CEXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hctc3S/tg6amAjvlXZaTioZ5Yr338cGDDSPzRbh8Ywo=;
        fh=tBdEn1jC1Z/XDrnhlcd6EvFTtt4AqVRfi8jzcgFPjsA=;
        b=Y0VFUp9ZC/sCOTrko4r0M4t//1gQ/iSUcEhtaYMfRKOG7pjIZ6RFWKEkroUiNJFnk3
         2Zhtxdd83ochTdWqOgpDTq2BKy6sVNqzCR///4zunrfZLx8Lchw69C/n+S2875fDq46Z
         1cZJoG+0vwkvPpLwfJn7RaZdurNk+ZrStIbFy1mtg1U9IAbfUMtig/xvTJhtgQlWj0s2
         A46Txx2EZPezKfz7kxzN8lDlJVQTmM/ghwM9oe4JTMiF1WxIQmX5yITCLXPP9vD2qOWY
         fVoe+bDavEBd+FLWnfLOuI4XKJleu1eTcLcmc0dVte20CnRX8CIP2f9vK2REJ0yumZ3t
         RP2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ptKPBV14;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381ed97502asor5305728f8f.2.2024.11.13.17.14.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ptKPBV14;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546844; x=1732151644; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hctc3S/tg6amAjvlXZaTioZ5Yr338cGDDSPzRbh8Ywo=;
        b=ptKPBV14VIvr62xdTX6c1N9ybxS/39P9znCMF1p+mXw6eBuOC+6CETZ7K4+oaaNKlE
         6q5ZX01byxIRtaeCOS3UuXWetTaz19bCJBkdcOuzoR9chJO6ynvbAwiWKprz8ScmSE1t
         OXdVg/AUgEzmQSd0U/w5XM4Vco9nhaXVrhbf1ErZ/CmXlEgH1/IP11pOd2gpzFZ7WTfV
         mMnGp/3Qsk5vzvDdra+f5+G6zW855+/yXM7+3a0REwv8GTaUNqchRgWFbGCWIIPtE/qa
         U3g9BLl70SKqEiK5t5C4ZG85TrH9uIlnBWNt5IfHxBuUk0uimi2jnc0fqdw2TUbfGJlZ
         fKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546844; x=1732151644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hctc3S/tg6amAjvlXZaTioZ5Yr338cGDDSPzRbh8Ywo=;
        b=n+qtE6tJUAlYbKWx7bt0k0xxSeH0vnJ68jF+ExBrOJzfxOWv7OpVBUvHjA5txZxKC3
         mglvcR69BikFGyh6qRMe7KQwX7nyTUi2UwZrfR+DvHFqmSTXB7TvdFSAGAJ/OzWUW55k
         p8k9KyUZObjeSeg8bKWZRYeA8ZWmsLYBfUB/3AwirAFe7TEH6G5KbjurPpPml95HZ7Ni
         EbHmDbKw0TbC8ErnBAlrfO55GorIYjSCswiPofl1WyrGlNMRzazr0jU6e8241377PdMp
         6lOSYLTXR4FlG8cBqTl1D7wXkSCAL3iP0I55fB+HGI2bbIoXYiTclxoqmroqQBN8EalY
         NmmA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Xw84ODYdplGdX/8FbXclySvIdbEdIOHcyQVHcz/1aURBRwFANaJmojr65HAGlR0EKDaMmjwucnvcTA==@linaro.org
X-Gm-Message-State: AOJu0YyMUj54lCCZOKilWlT76vqRVyZh02kabpmI6N+Vc+Hx/9uD9WXZ
	/u48D75kihec8bMJod/aVwrxi34EkPUSV9t/q2LICeHIYIu6sOgsJiWz/tDKZzAPbg==
X-Google-Smtp-Source: AGHT+IEn2so/ixH18AvrpdZMy3nJh7glbi+y5QwToKvNKI1CwZqSHbNiU7EXqtTNTTpXjuGdZdx7cQ==
X-Received: by 2002:a5d:648b:0:b0:37d:47ee:10d9 with SMTP id ffacd0b85a97d-381f1873485mr19654057f8f.34.1731546844586;
        Wed, 13 Nov 2024 17:14:04 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97e46bsm19427592f8f.30.2024.11.13.17.14.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:14:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/24] target/i386/helper: Include missing 'exec/translation-block.h' header
Date: Thu, 14 Nov 2024 02:12:50 +0100
Message-ID: <20241114011310.3615-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: F4/CSD8wHv4P

TB compile flags are defined in "exec/translation-block.h".
Include it in order to avoid when refactoring:

  target/i386/helper.c:536:28: error: use of undeclared identifier 'CF_PCREL'
    536 |     if (tcg_cflags_has(cs, CF_PCREL)) {
        |                            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/helper.c b/target/i386/helper.c
index 01a268a30b..75c52e2143 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -21,6 +21,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translation-block.h"
 #include "sysemu/runstate.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/hw_accel.h"
-- 
2.45.2
