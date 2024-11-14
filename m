Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25665njc;
        Wed, 13 Nov 2024 17:13:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGPL0AC7blg0yNEHkN0a4X5KkVB5KIKY/1MFNCMeXLGD8dzsmc2fK7fnCgJ5tdDpAKC8TPhy5OzdZAew==@linaro.org
X-Received: by 2002:a05:6000:20ca:b0:381:f5a7:3e85 with SMTP id ffacd0b85a97d-381f5a73e92mr13355360f8f.26.1731546824655;
        Wed, 13 Nov 2024 17:13:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546824; cv=none;
        d=google.com; s=arc-20240605;
        b=GpCjaNZqI9LP31Y/xX/JcFaUpPbTof6sfy70HQjSfFne1hQSGAbXBJQEv7Y3Zq1g8B
         dLnmOhi6ExANsLFz2MxLiKYI/N5BszT7SsyhjsVlbAeI50qR/yDulTpMsnHbvtLf1IxV
         3pcdxLE4UGv8sWhO+Ow2UWe7W3AQ3TnpWnA1p7IEhRHtNQ5VYqe+eYKuA1+Ezwt/W5Zg
         y9/pE/R2fjbv+JDSBcRnMf1i+JE4K65MSrOvRJChE43U46WMMrpQYdDOkpsz+scxPnul
         JFcRzUH9DTNm+CY3tkRSbusUS4Z79xV4XrmI9GQVd+N1hIeZHbZgRP2R2yPqSjU3NCDF
         NfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=n4W2o+WVI2EW3XsW3lSsIks/9d2PO57Qya5v8Q7poU8=;
        fh=N8ojap5WMJh1kcE7IAYnrHxhvmJ3w2QQM2YRNVRW3TA=;
        b=Uo3/x8dITktDkdvCijrzzVoVXCFOHZTmbGkTWwt8PvhuOyq2yge+W8ChvfOKmmE3Zu
         qOOpw0O/pGFn1cV6QEa1J42nPcb6AQO7aW9rMR7L6P9g3qA2Sa22sef3PgV18nps7PWa
         wceUnsJOmO7rI+fFDsDC+6Zz35wMqwnWXz+xFIKUOsZ/FUx91r242GxvL/cAUna6k8RS
         iI00k+qjTblZx7SJslkxIg4kqVHRK8ePkiaQETWdvOM1znZoDAsPlNwamJ1Qsa308fqk
         JGoF8ANoulcgWAqgz6/xTmdfOGBP5Zdg0dGlpNkRpGHBkYqudFC5y1AqLa9wbl5kYKZn
         Lmhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpD5s+WD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0b75c49sor59913765e9.7.2024.11.13.17.13.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:13:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lpD5s+WD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546824; x=1732151624; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4W2o+WVI2EW3XsW3lSsIks/9d2PO57Qya5v8Q7poU8=;
        b=lpD5s+WD7gJ+B+rIS7MgMKpmmExvQtiwE44dEKZMRt9VzIym/C3Qkvw6qpOUEVh/Zi
         wjRJigXQEHdCi7n7euYf17/Mv/eHiuMnqQ2w/62wdjIGBeN+yf4NAeNlWKBfv5I/ZHRt
         Qe6O3jdeDqJOUAMmX0MX92JBpLpG7Nlx0mTqHjJFglXeddEigwNwqQB+ro3ttVm24S+g
         CI46RzfWscQRfbfQnn81uRaoPm98zpykudC+HxhLTZWW3yULa7AQspOAy6ZhD24Wp1ls
         xTcy03P+K7LbVM8dq0pngou9wsoH3bHn9c4le22SMP7eQCFDsDdB3zmyiI5fbS/h4Gai
         Im6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546824; x=1732151624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4W2o+WVI2EW3XsW3lSsIks/9d2PO57Qya5v8Q7poU8=;
        b=eE4lZSveWpsO8p3HwTI5DwHzX/DZZWA3NObqlLhQ6o8VvOdWjzt4+xtZjIQffqz/A4
         IM3PHVMtAE4xtwBrLelvKFadhRiMnthEHnBYIQndRv2uCnwuJkme5C2Umy4r9LX26YWs
         zM+2UjAm4hGiNtLn0UhK4xiqHEQ4MpAkAZbX/1BgIBoYWO5DrU/jNOMzoyofOtv/uQxf
         4VD54RZgGReZPkw/MtKsnvtNZgEfhYsQxn0ss1JYDtE0dX1wnJb3iw66DhdzdVY5lEKs
         fzj4XXTiZO4j3iqwUWfbbHgWdxc6gFrzBsN6KAmSPVp7C2ZKXbS/Pxjo4bRzkk6nWUii
         n/uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbdmOUVpfrzmQOTzmGpd6Mgc7eW+7TWOtSCZyYELj3erFJc7gu+KYZcMSGJHVak1SazCfTMJiZp64+Ig==@linaro.org
X-Gm-Message-State: AOJu0YxrFlZXCFo7TXo7qDp74SpWwP3P/g2VDPd9pHRxs3dKx9fdMRRz
	4EB210CMvF2lqCbMvkYZARv4aMlxDIv3LOjDE1bkSBOqfcVOzQPLRvE+dt5SRwUmqQ==
X-Google-Smtp-Source: AGHT+IEicPSPnx9VguO/9hRNFn0r+OGPnyAza34mmQJUkip7pZQ0zwk7xapErhg7/qyCllNdtkSLxg==
X-Received: by 2002:a05:600c:3582:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-432b75035camr195067265e9.10.1731546824041;
        Wed, 13 Nov 2024 17:13:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab721d7sm1548395e9.9.2024.11.13.17.13.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:13:43 -0800 (PST)
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
Subject: [PATCH 02/24] exec/cpu-defs: Remove unnecessary headers
Date: Thu, 14 Nov 2024 02:12:47 +0100
Message-ID: <20241114011310.3615-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NirJDPd1VN5k

"exec/cpu-defs.h" should be kept as minimal as possible;
besides these includes don't seem necessay. Remove them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-defs.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 0dbef3010c..ae18398fa9 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -23,14 +23,6 @@
 #error cpu.h included from common code
 #endif
 
-#include "qemu/host-utils.h"
-#include "qemu/thread.h"
-#ifndef CONFIG_USER_ONLY
-#include "exec/hwaddr.h"
-#endif
-#include "exec/memattrs.h"
-#include "hw/core/cpu.h"
-
 #include "cpu-param.h"
 
 #ifndef TARGET_LONG_BITS
-- 
2.45.2
