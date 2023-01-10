Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317048ejc;
        Tue, 10 Jan 2023 08:44:59 -0800 (PST)
X-Received: by 2002:a05:6000:50d:b0:2bc:fdb0:717f with SMTP id a13-20020a056000050d00b002bcfdb0717fmr1891353wrf.41.1673369099884;
        Tue, 10 Jan 2023 08:44:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369099; cv=none;
        d=google.com; s=arc-20160816;
        b=XIjPWpcRmsHZMDRU4neTB+UZoIU1Ko0LpFQ3oCb3sGI1jVLTpL6Le4UxLWn/CEuQcs
         yNXYfGE60UN4kpL1GY2U55YK6tzhruhmGEEfl80jA5lVcLn+M6kNqpcli0JnYHtxxiLn
         UlNvKZrEI8YWmvAOvHUo4HXJjaOLcB39h0ulyVzCZW2JM1/ePZcE/22nrFWQQMA268e4
         deVq1UwDeXQP6En7ItuRVbTI3JDNtyMEI4zFStIEO5mrnlW2soJOZmQmDh+fwMbvkUSp
         cKvkIv8NtYgiJxtjCfk//7RQ1Nmr18+ujvdFCUZWXPXlWzcRlaRXYfKczA9cahcxInXD
         YfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z+m8L9ejC6qlw4tOENu9F3qOBbscmRJfWRVLTYz7u+s=;
        b=ajNKx2QYUZ+8DWQjlzobAglxwE/1+vEW7FUidBRE8qbytuyMqQRLfxA9aUL2c7FfEt
         SPQG3n1dVHuqZCqzMgyxlddguJSM4mc0GC4015EXYXMCnRa3iJtvHDjoB3niQWxZ64O5
         zWD0vZX9Oq5rVXerYqbyIhK7GGFYi/Wx2TxT7vsBXcJz/JpOoOPc4xmws9ErMiV/qE8B
         MJrm9TXyN8j4OTMTnImNUNVh8kjlRXcZAmmIHZGRo/HPLlMVeBkxyUusYTmv7bY7I+cQ
         RIsZbuVaRoqzCKaV2wbtsaqFryyZlwlB6svaj3Z7WV2PH+udSQOg86eVT77nk0KKbCXM
         m+Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G1yQhukD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d21-20020adfa355000000b00298bd4a55e1sor4705812wrb.25.2023.01.10.08.44.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:44:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G1yQhukD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+m8L9ejC6qlw4tOENu9F3qOBbscmRJfWRVLTYz7u+s=;
        b=G1yQhukDyIZYsrGkdRZQifpF9SUe82x8HpGVCgxxC+ASBvF3AWC5fphfWGs6UZwvJU
         fLKm3wKqZ5Whd8ZG6Gj0uGg8wjg2JznC4rfyphJc1wm7FuBjVRHGm8+i4V4tfb5xsDhI
         GleHthtwu1Xcg4Y97HxGg2noxeXowlO4d4FMpC3xnrvXQ2cZXbq6Jriv5/E7ueQGJtPW
         JZanF8pQGweYyXbbZTUjEhaMvwuQur/sWAyY+JL4YQiGOwCsh+Vr42HMju9CSX8b72P7
         RmG/BxEEpvGwLQvKEMEnVRnvtYAhLaANArcdgWhwNAvx8ntMEgsaUwq7H9vbTobxwNGb
         ObJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+m8L9ejC6qlw4tOENu9F3qOBbscmRJfWRVLTYz7u+s=;
        b=rM7EdFebZkGcbKPohwi8g70bhYdCjKZ4pIjgKydqk5G5+0G3K3IyAuRhjJdcp/Zzmy
         fbyk+gSzDum1n9xkfeHZUGDQ0ag+owPgMIFO/O3h3HkrinhwfjtT9Sojdosjrmw36bTo
         yvq0P7vaNKpjildcqGo4bFglq7TFW51pwzJAd/p1X1vs9bTyC1js3jL6pLgjErBBzl7O
         SkbZOjalvnWph813pej6m6AcjpxYqToh9/LZMJZKaUM+0r1k0zgjuL698/0/IV6gqZff
         P9SQDdgTHiT/qBttUw33SyVDpZ1pNMkC1CL3lmssC6gzk3+6dKXZh+mUPPe85iA4xNDP
         aNXw==
X-Gm-Message-State: AFqh2kqi38BCFAQxgfY2HaEe7hGmcsKpMvCl0s9PvMwxe3UcrLN6c5v4
	gDWz6trTv0oZowAR+BrjROD06eqO
X-Google-Smtp-Source: AMrXdXvdHLq02aFDDjjNwacJgOJtrAIzO6LSW9DAZ3o8HKl2zCSx2PRCqYlCRbwNMarM8Ir/Y2Ri6Q==
X-Received: by 2002:a05:6000:12c6:b0:2bc:6f72:93cf with SMTP id l6-20020a05600012c600b002bc6f7293cfmr4784588wrx.64.1673369099664;
        Tue, 10 Jan 2023 08:44:59 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n6-20020adfe786000000b002bdbde1d3absm1333824wrm.78.2023.01.10.08.44.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:44:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 09/18] hw/arm/armv7m: Remove 'target/arm/cpu.h' from NVIC header
Date: Tue, 10 Jan 2023 17:43:57 +0100
Message-Id: <20230110164406.94366-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WC50zcaPb8wc

"hw/intc/armv7m_nvic.h" only requires the HW definitions exposed
by the "hw/arm/cpu.h" header.

Move the "target/arm/cpu.h" header inclusion to armv7m.c which
is the single unit requiring it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c               | 2 ++
 include/hw/intc/armv7m_nvic.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 50a9507c0b..1e9ed1e7af 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/arm/cpu.h"
 #include "hw/arm/armv7m.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
@@ -20,6 +21,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
+#include "target/arm/cpu.h"
 #include "target/arm/idau.h"
 #include "migration/vmstate.h"
 
diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 0180c7b0ca..c0c514af63 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -10,7 +10,7 @@
 #ifndef HW_ARM_ARMV7M_NVIC_H
 #define HW_ARM_ARMV7M_NVIC_H
 
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "hw/sysbus.h"
 #include "hw/timer/armv7m_systick.h"
 #include "qom/object.h"
-- 
2.38.1
