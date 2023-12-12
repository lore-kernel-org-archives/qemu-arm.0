Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864728ejo;
        Tue, 12 Dec 2023 04:34:49 -0800 (PST)
X-Received: by 2002:a17:906:4696:b0:a1e:2e2b:1b7 with SMTP id a22-20020a170906469600b00a1e2e2b01b7mr2896416ejr.132.1702384489032;
        Tue, 12 Dec 2023 04:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384489; cv=none;
        d=google.com; s=arc-20160816;
        b=qhvVCS/sVGRlNeAdyHJN+8vYACO2sG2AtdSqFhr2BcWrMMhsVB3qCGqyu0dmnh3D2i
         YyWrLbgFttSLtSpjMuKmMB+hLxkzScXwSJXgOCve8rN1Opk6DaUm/YJu7TzoPWlOS7Y2
         9IjYNkir4sfomD3xeRLe80DoE2a0MMPvkyDfm3U1VCC+FuWVhEp6G81kdtYPw5FZMD69
         gaCbpPkb4TYre7TsM8tCdXc5g/qzXRt1PMxWzDHxEDvKbPoFxXBezvtwbc+ROtJCKYZs
         jVcY7oIjEp1MXaaZbcN2g2uQOLrC+GHBlvPVTA/CfBw1EuUUo0bBnjTFTN9AqSN98uhh
         FFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=81Lrxkba5TiSEWNy5rmSbN+DrKv9XHIGlVRArHRoC/Y=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=pZQ/i5+cwFAVHjiS04cwxsYtiaxgTZZ7erCaUpDW03x+qEKx83ABeLwrB64gt8T/YX
         cSQ95R4dl4dxWnBtdQC9uYD2We9KuWXCElrH52QaQDMf0xTWyhg5yxXXIxtBH1wh+z/x
         U8PsOieGoKoB+b+mZIiC4HCOGfxKNoejIRlrkwbRH1gqBi6h1PEG0IKYS+KbaASoRrxd
         xyHAkvzlIMIMVjMeS7vUh56cwCbx91Qs4UkF9NAyQT5Xk+9jXYN58DLwfw7tn3A7EXs5
         nW4KKrmcSW2EMT7uZBgtjfIob9tATkFsJQS2sMDYP/dPywH0RapGsHwFJ1qxXIano/HZ
         jp0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=weH8xVF5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jy12-20020a170907762c00b00a1bd0c3c767sor2298048ejc.19.2023.12.12.04.34.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=weH8xVF5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384488; x=1702989288; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81Lrxkba5TiSEWNy5rmSbN+DrKv9XHIGlVRArHRoC/Y=;
        b=weH8xVF57EOIqD55Ri/P5t5af/U4l52of+xqxu/IJff9Y7K6rxIc78PZSMI3LRzROz
         l6CwS61Vsx+yZtVz0IjFT2GjJixTG9e31K6pEYNxev09oHb7TC4X9fiEWr1yiOoRoBG7
         UL6Hlv/Ie1Ol62Z/ZYGIXl/ohRK+hEb6RVCY17RLhDgt6iqAinBMFkW97BURbqEXkDOb
         JcDp+pwjs8JIGTAXSvzhkpEMLT2KX7Sw+4nuI0P+RdolmNQ9yueCJTBqUIpmewfB7vYI
         tslzlOKxNwy/S00RnwjelxKNG9QgkQB71t4MRJd7/I+GPUzN9TMBF17H/tWDV6Wm8nQh
         Jg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384488; x=1702989288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81Lrxkba5TiSEWNy5rmSbN+DrKv9XHIGlVRArHRoC/Y=;
        b=tnbtEXDseqWDRfN7ifo+uDCtakqIpiCVh/Uq/rb2NdnrCoC+I4whbJFUIFlVmPJ/Ra
         6cU6NesUhknjzlFCZm2WC3JgPqCI2QVMhzCzY/haH+/D8GN5x8xM1WWQCoM8YSYdKsDg
         ccC2wv4w8liXdfpvp5XuX/A4Gu3rArFygbDnmK0u6pjpYRCPGJ67L6PbkZ24DU3KaCuM
         UiiAI8srinaCDbNJ8FkYlUhBXVCZrxSp0GlaepIFpUNQadELxZzxCUr/LfA/mTWJYeEq
         ej0FWSds1ZivVmSmYv5Ot7WVTg3iGa5e+4BHTr9qsteqEH2tlXnhEjTdDIOkeuslIVSr
         GqIA==
X-Gm-Message-State: AOJu0Yy9xZClxBhZzgqNAUPasZkrXqvBRGVhjHCVho4ZzdMerDDv5+4C
	bXeGBJ0rgbG5jDWzPImCJxHnMrt5
X-Google-Smtp-Source: AGHT+IEXHKedmksOi5i+8cNWCq3xdc8whFnCDprHwI4ClL0JkDpXjFEvA15M4aXrvMqloFi9T4RFjQ==
X-Received: by 2002:a17:906:5a49:b0:9e0:4910:166a with SMTP id my9-20020a1709065a4900b009e04910166amr3516231ejc.32.1702384488777;
        Tue, 12 Dec 2023 04:34:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id re14-20020a170907a2ce00b00a1f751d2ba4sm5517119ejc.99.2023.12.12.04.34.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:34:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/23] semihosting/uaccess: Avoid including 'cpu.h'
Date: Tue, 12 Dec 2023 13:33:42 +0100
Message-ID: <20231212123401.37493-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: l3Ny1vey5VHN

"semihosting/uaccess.h" only requires declarations
from "exec/cpu-defs.h". Avoid including the huge "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
