Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004575njm;
        Wed, 30 Apr 2025 07:58:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFo1Z1ngvMlPh118u3BbhM6NQ8hKyNFCIhin+Q3DmBbzVmpmPdKKUPJ50YQtt+suhHzHed6/lXns0PIQ==@linaro.org
X-Received: by 2002:a17:90b:3d09:b0:309:be48:a77c with SMTP id 98e67ed59e1d1-30a333020a7mr5882993a91.18.1746025138197;
        Wed, 30 Apr 2025 07:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025138; cv=none;
        d=google.com; s=arc-20240605;
        b=TWs5yLwPfA8pMbO0AxjA9GW1DYShYcarvDaUFjSuSsUgrkmtq9sSn44T4rIk60y5N4
         3dQehDDXv0QIDCX3k56MZYrkXn34kxIiu/FEit925xa6EWQ3NNmK80tLHsDSASzy2Wk4
         2pgHIie80NsSeAEJG1664G4JeWomvtQzBVOaij94gMsCJA34ziV+T+QQZ6hVnG+6zl+U
         GeBFJKN2oMehNL2/2htszBSBHmTKzobBNTTOdumdzp6M3W6N4VHe/WOE64t6PrO6XT54
         cn5XELkvDN6lef8jGqrOe1tUUJIsfPjJhBPKoESV+HRE/wfRL3kFvZZ83dYL0TE8erk+
         ExXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=79feuVbSA3OZXSuVa7NrT3EuBCFmbt5HBuWm1ioEXwU=;
        fh=GqVaIlS6XpilPORLxwsuMUY/DTfJTm0wmMTmAJ3faXc=;
        b=X3WENapuXcGnRgMSNiGvd1jz6qa6hpRVd97tNCPZvBQUfRMB0v2yNhSUGcJ0nAwwYL
         bUcS/YhHxLFrkq66C/auHE/m189NChHZfJYiK4drvuFjHN6KxbV4oV5W/zEMbNhbHL23
         uI66FjfuhihkctXbf4XjUtHW2no8k7dsiRCemfl2sDpRYyBNNYz0hJ4KEnt3YSKSn7OZ
         ALcN6qjEOFMnnUNMFIyVXX7Ig8JGz2NfvGtvcS8l+Uu7MUjk4mngRVyn/cAL+tYUSyCn
         HZqqhP9yphhRcN1QND5tYmVu921rfh4yMdeqfTTIGFK8r0/wGqoErekvkIxtWPNedBTp
         wxNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HaGSYhyn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a3d3aa5b4sor349533a91.2.2025.04.30.07.58.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HaGSYhyn;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025138; x=1746629938; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79feuVbSA3OZXSuVa7NrT3EuBCFmbt5HBuWm1ioEXwU=;
        b=HaGSYhyn39GZ2BnBuEGRJ6gdCncnJgwRwUKUgwuGIxCitZLPbx45SpZGAzEWf3sD6f
         VZ9GsbR/vyuEPj3mJs9wwgggfjXtuYWFYjSJq/WEzh7AAhkg5nQpPSf/87f/ZgUfJ4Gh
         Wj+LhI4ftNGnrFm2x4DWvoDJI/idcFNqdOuvGMcNv6LoN3DXueOeT9kON6RppXWLNov8
         nf44C3hpNv6l6Rx3CGLYbymxUQtCx0a7P2kEAOGj3xkC5XFP4plKmEWw/8G9DOgoOe3m
         VD9PLVWd08AkqiK9Gid5vv2c2ftoxxYsXi+HPv/QlsmAXvzZufNSw/NEMF6daE1YPeuK
         lPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025138; x=1746629938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79feuVbSA3OZXSuVa7NrT3EuBCFmbt5HBuWm1ioEXwU=;
        b=CuN9WN9T0syCqH5V+JXvDWuds4F50oH58dZ77EnxFJq8KC1LY4ouGPQQEDS4piN02w
         nVpdZbv2Mh/deleyStNbm2WjL/WSRAyyjlMIlFFt9GH7ZZkkwauXnQo3FkXoGS88YkfK
         wQTCzIemK8M2SvovsppcJLy0vydKdHgr0qVyu8rbN3DsMKsKaXlml6B9yXfjbubTHcew
         RxH6JGxkq4VJ3bgAqFnCbLOL6bXlHfc5z8wUnJGrDH0GAzrxtA4cKwRVGcxpiIbdJoBR
         R0tar+n2gOs/Zbu6/fgbfaX/7OeprPzPG1e4VMPUWwmAYZ4auJSn1CfmwLf7eneAiGPM
         KeIA==
X-Forwarded-Encrypted: i=1; AJvYcCUs0t5LoJkW+k4RcNcVXz7vBGzWCO71qNJUehL96Qmk0Rrm5tLvIuHNi3zvNpgpMCyxUiNHSALnPtxYuQ==@linaro.org
X-Gm-Message-State: AOJu0Yz7ir39qgCy0zOn2Skyx3Rk+GDemywcfhoYmTaYrpp4s5oC1vxJ
	Xe5N7cbTx7+tWH28x8I1aoD1+ritS3ayDY3kCclE4NWHmWrWhyOkqbUsUg6MyFgKUg==
X-Gm-Gg: ASbGncsbVzBUBLlPGZ+3FNsjAotqf99RYixxjRWxi7VCIWVX5WgubTCgkV8QEr1kHNf
	FkGLN2rot3BmjGlyk2uCQDUQ2T5uEcjzxnwQ2HSd0NgKG/5CI9FLXcKlWhUWdheiTjMksR+1FeD
	hJuvc3+9WlgjA4YIM5GfoDrAmozRKXKrin8yl1ZJ8luRIG3heGfgclk5xaB2ITSnPyJJvRRHtra
	l9bh3dN/m2VkNgfpFbZZY9ypOxOYd3mTO3pM6qAIFAcm2eTP9uHsqFP0UGd+pHLwL5K3UchNHi1
	Neor/tFyPvsHONZ3yK3UrXNmVeri3TXGqDGKtVME
X-Google-Smtp-Source: AGHT+IFcPSYMEawhY5AFhMcqnmC1qmJS+McSdrxVpFL+4NerpRE7eHPdIhkyAZPWxp5bRrr56/ggDw==
X-Received: by 2002:a17:90b:3c0b:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-30a332e99e7mr5932263a91.11.1746025137624;
        Wed, 30 Apr 2025 07:58:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 08/12] target/arm/cpu: remove TARGET_BIG_ENDIAN dependency
Date: Wed, 30 Apr 2025 07:58:33 -0700
Message-ID: <20250430145838.1790471-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZE7I1Qp1cinP

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07f279fec8c..37b11e8866f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "exec/page-vary.h"
+#include "exec/tswap.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
@@ -1172,7 +1173,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     info->endian = BFD_ENDIAN_LITTLE;
     if (bswap_code(sctlr_b)) {
-        info->endian = TARGET_BIG_ENDIAN ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
+        info->endian = target_big_endian() ? BFD_ENDIAN_LITTLE : BFD_ENDIAN_BIG;
     }
     info->flags &= ~INSN_ARM_BE32;
 #ifndef CONFIG_USER_ONLY
-- 
2.47.2
