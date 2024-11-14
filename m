Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25871njc;
        Wed, 13 Nov 2024 17:14:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVX5jmnchI4okOwOKvUPfdLuB+ly/kvGqP9djHx253PUT3HOMipGSwyCqJ7ADZQn/6lCAYBN9JArk7QFA==@linaro.org
X-Received: by 2002:a05:600c:3ba3:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-432b7481bdbmr205634405e9.0.1731546852843;
        Wed, 13 Nov 2024 17:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546852; cv=none;
        d=google.com; s=arc-20240605;
        b=Nf64F2Pkd/Orwe4k0dl1x3UQlxn97wlMLMHKh0TmyvuZmwc4zZj6oeuNP9eDYx6ePw
         +/Ye/k5biurN97sUOKa7wcxUEXD5FZE8N3vZmAzxMTWYzlTBw0dB91WVOtdjDz80Glw8
         KL9EcsATeefKLahGyxvHKFVu1vuyt+xjKopqMOVVmADyCXfCtaXBzQoLgtzNUddZGK7x
         PH/Czy5BWaLJznfk2fdfMHUEiAEgB7YrYHyjJ8ESYanVKLGM5mQMDOjuSCu2CoFYVrcy
         IaQjNENPup2dXFaFnNgQ8/ptLdtJr644lKO9DhfLnWpzWWmSoXqweEK7SFLKbgRjuqBa
         LAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YzuvHkgFNpoK/g6N/GhAbq9D9bCDxAJSB1ivyjDA1qE=;
        fh=cjU2Ds1NKnJmjEFW2cf/t9glkB+uBQFEnx/5UlBfTp4=;
        b=edsvNo81RJYJ561q2b4g/WBUclv92JwT9wJpV1vcM+a908B/95GF5mAP2UdHMF3wpG
         NjQv/mBag/RRRuxh+zHQccD4+UZ8p7L1gQvR86G/i+4/acO1IXj4k69ABNc5EpW5XwE7
         4p8/KdcTu9LXyEUBhRElg2rZ+7Ryba29doZu9Ucq612YwwJCAYrDZ6wJljeQLgKCtwwz
         bAUU9Y1LknmW/hYxcSamr0SvpS7VdYjT0MRxSz1fOra9V8HSqO8OB1F0SBB4SAda8nSw
         ECE1fkEXMJZtQ6806zx3EupgI/+zTe4xwL0EZ+ddPNhbmdZMLOAkmKpV109AQZK8sDIy
         2S/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bI97IafP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0b14a69sor61744165e9.2.2024.11.13.17.14.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:14:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bI97IafP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546852; x=1732151652; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzuvHkgFNpoK/g6N/GhAbq9D9bCDxAJSB1ivyjDA1qE=;
        b=bI97IafPev16UDsEjRWvbYaBMhYDAxu5k0oNlX8g60gAgzxyqVl716AjTgfwr+sb9m
         8zJp8pM6MdD3ocOnhGENe3LZI/xkGLNBGlj+Y4wfcpzsVoh+RTvztXO2kCuuuPDqaRe7
         7UB9pYBaSZN0bIryN3Fzlgd6tlbP1q3jqsuG474pRFfpABaSyiDuGzxRDjmbtf6U6E0I
         ZrNlXNFWY6ofzcCFbGD0qIa9bW6CdbfIs4KJRjwpyl/6lAsmRdtEQiEUv5K3qpRhCkk1
         aOz0cq8ZQ9CSjUJqHLbgFaXEe9zE/GgOZOcBk7+R20uulCtOU6qgPLhga7mJJduMXPEE
         Z2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546852; x=1732151652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzuvHkgFNpoK/g6N/GhAbq9D9bCDxAJSB1ivyjDA1qE=;
        b=favOAcaCR0LtTsGF4aDWo2Asx5lvjGXxwhF8lhDlwIfSPUTd82+m6bOhJyHC8mlxdB
         peRuiPwrXfVJ9HPPJ84956QBK1OokCWC6MVjEma43YcEP9ZFGp7SFSPGqN1n9N/j6Qqe
         XokkEgaYo/UW9yqBAOU8h9yF454LS8G0WmfBFoeKA+gbiXXEagux4CP6/tq5RgI+nyE2
         WApLLMMXAPqmhMyqvY7rGr+zGBisNzbMfCDfB/t9JtRgEAweYN+0d77Rzi0ojtn0ms2j
         GdsvbBhWNMeUWx8xMF/Thy/NPP5ZlrZx/q1DOf+9126diCc0dxWLm9+nDptpEfK24KOT
         u3Kg==
X-Forwarded-Encrypted: i=1; AJvYcCW5NxhMvlgVcvclhWVtx+LR2nBxt4b5YXgQO2Qi1rMF3ogJVZWBNwxgXOAKeiT4AcAUhTkCm4FZKJGrNg==@linaro.org
X-Gm-Message-State: AOJu0Yz9RiXxNiSg2lmmeQnnnML04QxGwJnGPXzQuT+rPBc3Jp8ueUHo
	FWM/2AANOMlZlzzY0gpENvDg46RFTnNGUMWJst/2+oRMSBCFdji3yQYrLhrX9E8Aow==
X-Google-Smtp-Source: AGHT+IGEpPcB2Ra92T20v+BX6rXD4nwtmCydz5vInWSdcDRLMyfilK5Pfw6s6wv0d0N8yzY4Z7WyWA==
X-Received: by 2002:a05:600c:19c8:b0:42f:7ed4:4c26 with SMTP id 5b1f17b1804b1-432b75002b7mr202791785e9.12.1731546852174;
        Wed, 13 Nov 2024 17:14:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab78881sm1520105e9.13.2024.11.13.17.14.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:14:10 -0800 (PST)
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
Subject: [PATCH 06/24] target/rx/cpu: Include missing 'exec/translation-block.h' header
Date: Thu, 14 Nov 2024 02:12:51 +0100
Message-ID: <20241114011310.3615-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EnphgkWlE8Q1

The TranslationBlock structure is declared in
"exec/translation-block.h", along with the TB
compile flag definitions. Include the header
in order to avoid when refactoring:

  target/rx/cpu.c:50:42: error: use of undeclared identifier 'CF_PCREL'
     50 |     tcg_debug_assert(!tcg_cflags_has(cs, CF_PCREL));
        |                                          ^
  target/rx/cpu.c:51:21: error: incomplete definition of type 'struct TranslationBlock'
     51 |     cpu->env.pc = tb->pc;
        |                   ~~^
  include/qemu/typedefs.h:116:16: note: forward declaration of 'struct TranslationBlock'
    116 | typedef struct TranslationBlock TranslationBlock;
        |                ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/rx/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 65a74ce720..945ae6e9e5 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -23,6 +23,7 @@
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
+#include "exec/translation-block.h"
 #include "hw/loader.h"
 #include "fpu/softfloat.h"
 #include "tcg/debug-assert.h"
-- 
2.45.2
