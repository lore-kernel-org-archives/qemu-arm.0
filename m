Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492115ejo;
        Mon, 11 Dec 2023 13:20:54 -0800 (PST)
X-Received: by 2002:a17:906:1783:b0:a19:329c:55d5 with SMTP id t3-20020a170906178300b00a19329c55d5mr2437811eje.64.1702329654111;
        Mon, 11 Dec 2023 13:20:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329654; cv=none;
        d=google.com; s=arc-20160816;
        b=U8wjdQw1khnI81+9ElPMGZrwXcnBGwo7AjYI14ywKgNApFOc29KGx55oDya4SXCAE0
         YUWW6r32AhSoEKVXbLghpn93qcrA1MHd7gRhXjlIhf7gHiaAJyyLi/3AS9Jva34sZzur
         1oOJXqWUJh0tZGjmhUYp4OQs41OuXkaFLZbeNEiUK4p6GcZNmcNUiR7A/+h1pImGCcSR
         b0EZmR6iOHVKmzYN2Bk9b4MLiDhMQUKBL/bs9HY4G8oPyCr/cYr1GuvGvvBGzAZSPGiy
         Ol1gvrUK7FFMOcgrPWYFYoW8SX4fATIXdl5FWWqVRTqQN8eSklH95KZPjpo4nTAptlCm
         b36g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Hdtduscqdl7lWoQvL5DT94RvR1c94dCnz5Zm14mzbGM=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=E15FSrZINDj3VwBIYc9MqWGMaua7CXbjLNu+ZA4vKP87bx6MoyFIag2SlmUl/IvPxn
         knOZyF00MdwMEmNial3PjJh9mQtMsDYJIUS8IT+6dFqKVd9coJjek0Wt5up3TcR1ccvj
         WpUM7neLqnw0nN1qaNitLJTqsWe2e/yrlrMyRmoi8B9CNh4rH61Fgbta4spFUDZJhAW0
         WL3GPWsbyXqImDX6vcKE46QSaFN1ssKBrmZBu7YM+nMt1c/pcDvFwLHjqa7yVxMbrTAL
         tU4UGbGFZeOwcBmzrX6iKplvKZgBo0atPWJg6vCqZITj6uYKRxPJ9E0+zhma2AvZMyWk
         Z0mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRoTXTPx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mm11-20020a170906cc4b00b00a1dec186adfsor1119945ejb.7.2023.12.11.13.20.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:20:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRoTXTPx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329654; x=1702934454; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hdtduscqdl7lWoQvL5DT94RvR1c94dCnz5Zm14mzbGM=;
        b=HRoTXTPxJGinBZlAvK+qc7PSACHB7U/6FQF8A3RHNZ5WFNgkm/lZY0CAdZ6oDQ3qY4
         LMQPknRDDpzoX3ErYIl2DZB/0+Dx0ZZ9lsTySRKKV7yex0oLiUJsA1yIiSvOwG/ylbEq
         vGjY6X8OTDmiAolvrjkTsqIWnmmlbYvqJIQy22WGOJ6oOBKEH0u2Ny0tTjtXbZamrqJR
         2EOoIPH2zm7seUzQGPYjCrA6U7ou6nrAGWYOYx11C24CFG6ua4p9vtQxCHx1tr/lSKM1
         D/h46zjPE6VfCuAvsS1M1UIcldrrcVFO0jm4cCe/Sd9lMI49LHEhhPW0hrez9XfNry/V
         zKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329654; x=1702934454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hdtduscqdl7lWoQvL5DT94RvR1c94dCnz5Zm14mzbGM=;
        b=F6tFrwS1a2SLHC0VrIWi+F6HioQr95l9rbvdhQ4bOX+zMgtrW5Jl7h7185u6IkNlsz
         +1WqNTNhfHtp9JcNw48urKjlsx07luYG+XG7OatDVqQMMSdSfzhCSDlT6ZW+vNp2Elbm
         rilW2pzdSTZcUQIYZqsNm1CG3tz48k3Lc8CjFihmrfmwDr6Ve4WvuzM7Hm2/X5lPYhUL
         iulMUmPZy55IuHBsPscH9waYaDLRmJlAoiQ7FUPiz8HwP/ckciNMY3C8gxZOL+3gmA2l
         +Gggg6rd0xJ4xTJC0xB+2HuTczvcPtmTXMQO/znNl4auOaFvCXb85ULsOdXzlYLLMXXz
         3IBQ==
X-Gm-Message-State: AOJu0YwqEWnBZ7FpVj/h3X2pzpBHxWl/ysFhwEjLz/otQJqwwvKlt67s
	6daSyXZEV5NALyNQ8ae6esCW/E0h
X-Google-Smtp-Source: AGHT+IGSU6orrfEyQw8281nABb2ziCc9amYnSK9sAmfW+hjeDzK/Oj1EjnbDpucqQCNSeee/4ucj7Q==
X-Received: by 2002:a17:906:2207:b0:a1f:9f16:2cfd with SMTP id s7-20020a170906220700b00a1f9f162cfdmr1332861ejs.63.1702329653881;
        Mon, 11 Dec 2023 13:20:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm5304903ejc.73.2023.12.11.13.20.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:20:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/24] semihosting/uaccess: Avoid including 'cpu.h'
Date: Mon, 11 Dec 2023 22:19:42 +0100
Message-ID: <20231211212003.21686-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xyjV+2e8oMBF

"semihosting/uaccess.h" only requires declarations
from "exec/cpu-defs.h". Avoid including the huge "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/semihosting/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/semihosting/uaccess.h b/include/semihosting/uaccess.h
index 3963eafc3e..6c8835fbcb 100644
--- a/include/semihosting/uaccess.h
+++ b/include/semihosting/uaccess.h
@@ -14,7 +14,7 @@
 #error Cannot include semihosting/uaccess.h from user emulation
 #endif
 
-#include "cpu.h"
+#include "exec/cpu-defs.h"
 
 #define get_user_u64(val, addr)                                         \
     ({ uint64_t val_ = 0;                                               \
-- 
2.41.0
