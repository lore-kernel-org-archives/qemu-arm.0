Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25615njc;
        Wed, 13 Nov 2024 17:13:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUSbmKzJGZvOZTfU385PEHnI+3TltznLuA/aHyjYNZW3oB21TNXn5/E4999dxo1enwznQDyjEFK+myNcQ==@linaro.org
X-Received: by 2002:a05:600c:3c8f:b0:431:4e25:fe42 with SMTP id 5b1f17b1804b1-432b751e28fmr172762535e9.32.1731546817837;
        Wed, 13 Nov 2024 17:13:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546817; cv=none;
        d=google.com; s=arc-20240605;
        b=QfYg4vfjda4eIBby1XFAEYd/XTMvnumX2SHF3gypZKbglr4SvDwPAAy1CJiZVXosV4
         NAwuagUibcZwY4ImR8usj7bqDvg8e6w3JRAZS8mgk0N8GZNtM3gw3+XNY3emBze24FrV
         DYpkQs6psLQfSmbJLW4+0ok8ahxVh7m+Nu32oljHbPI1FxMD6ZQCCnhhdAgsAuoVTdSz
         Ifz+YWSyYODnT8iYWRB/TEQp5GqSel6EXNOwAPyLF88TsljLGpohO1l5jeQSkwPVQg5+
         AphkmEz8WONwnZ0weWjAkioVNz3B0QkGIjTQRerNnK5Qpb0cbI9z+a9ECuGdiHU0sIg/
         seGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JNM7lQQia63slkmiUAhjBzskGFuKTSllmSkbwj/sT+I=;
        fh=iBDtFNBNfWqgLqUbSiilQFQfCKaBU5uMClmYKMQUtkk=;
        b=P7lryDAZ0l0YG+0l5aY1f2RSAs9rJbfzbfSLbcpz0ovbvroc5VsN+mjOoloRLnSsaK
         vkoHiozzEgzQoaJApjrQ6+38nxicPFrTKUftud8L0MsQS4uHkm2ssE+9jNMOHztRPdQC
         SKljY1MmHq/ft6QRsn+m8yT1/Esf6LEouVLIldDiyes1+mnSJZRN42PqoiKliTEej8lr
         w2DmR84kZ4la0sjXA52vLfSExS3/dQtLWgnxdBsyD9h7IbMB3wO7dryoZBiTA2v8ofxO
         UZZUquyzBZ2aDBpG6vE1AEKoOxC4F2+qVIangbU9XvwbwNqb5Zr8CJp1hrdDiFTUj/AJ
         dZ3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ssc7tfGB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0ba21edsor59903665e9.11.2024.11.13.17.13.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:13:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ssc7tfGB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546817; x=1732151617; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNM7lQQia63slkmiUAhjBzskGFuKTSllmSkbwj/sT+I=;
        b=Ssc7tfGBL7NxOKPgW6uiw2ppGh02iLSrPHP7XX4leSEJY1Dlq9g+8pP/Znu21n9801
         S/fufmYAVCmv9xAbj4HoarsdIPpFDFuZ84QddJHuyBqkKCNjvIw5rSIGwbzDHr3B0/GC
         zsKwud6Kq5JnnLc7Ymupi99R6IAnyKVV0x025Wm0P4/2lLhfk+BUKYk+29xs7RI17OlQ
         zSxFy+AFIVamvvLLaPhi/ATRYEuHplwCTGKTdWHVI2KLWDgNDoH2YM6rKQmNsDsdy83h
         +pn/cuDZSAJv7xj5PEnXGAjSflFHNELrbE2SBgqmP6C5GFW90xeVyySRzeOR7RhgMlMU
         UXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546817; x=1732151617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNM7lQQia63slkmiUAhjBzskGFuKTSllmSkbwj/sT+I=;
        b=EZmMCzbuLxojq5oYASr8awt/ulN8L5Ib5Eb3RYOzRqKYL/uqm0f+Sc9j00rsL0LuDs
         RybXo3VQZcrG8UOy8jdQKZ6K/+zFtWIFgUPqlGh0ieho0OupIK05OPW8qNaSJogM+yBs
         G0zm0ZILy0xekNWuFK97pX0E1GsF2fYz7hxYhn681UuZQt+sE+wIRGqdukkoofg281eC
         5c2WEG4r7Ngc9c1MN6cWjjOYeXas+82mZ0d0lJXWFE8+jBDNufcxmXjeJr7ZQ1iHkUZg
         4Pn9+4V4IkTcVJVISg+J9lxu/AIORFL/Z4YS4aUtRhIw3Wg//0dm5BXhDCbTG/udi+Lf
         goXw==
X-Forwarded-Encrypted: i=1; AJvYcCXyU5p8BUa1cCI9YyPpYbZVDVCLYdCg114GjbfC9QZykIRwuwiKhOZRb7aGQogPNIrNwxWZ3nGMF0sxcw==@linaro.org
X-Gm-Message-State: AOJu0Yy9DgmQllp34KGp8AifHmFUd4QxR7nA0iFdOeOLd8c1ZOQNby5v
	8gmKvHbDT8YiMADjZJ9MLMPWopf1pI8H+xjgVzfd8+CGGeuejDQihYiAbjWmoz9Ndyx/86Ak7Eg
	jHv0=
X-Google-Smtp-Source: AGHT+IGHZCPTq1Ky+i+zPEHV6OGPnrLZhJwIFC/QHlQ6UaCQcD+MtO44ZWUI0dTARLdzbNxkS3YCfA==
X-Received: by 2002:a05:6000:1f8c:b0:37d:4a80:c395 with SMTP id ffacd0b85a97d-381f186b313mr17332647f8f.21.1731546817266;
        Wed, 13 Nov 2024 17:13:37 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda05f89sm19611165f8f.98.2024.11.13.17.13.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:13:35 -0800 (PST)
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
Subject: [PATCH 01/24] exec/cpu-all: Include missing 'exec/cpu-defs.h' header
Date: Thu, 14 Nov 2024 02:12:46 +0100
Message-ID: <20241114011310.3615-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dWzbnzjpdHo+

TARGET_PAGE_BITS is defined in "exec/cpu-defs.h".
Include it in order to avoid when refactoring:

  In file included from ../../system/watchpoint.c:23:
  include/exec/cpu-all.h:356:19: error: use of undeclared identifier 'TARGET_PAGE_BITS'
    356 | QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
        |                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 45e6676938..1c40e27672 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -136,7 +136,7 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
 #endif
 
 /* page related stuff */
-
+#include "exec/cpu-defs.h"
 #ifdef TARGET_PAGE_BITS_VARY
 # include "exec/page-vary.h"
 extern const TargetPageBits target_page;
-- 
2.45.2
