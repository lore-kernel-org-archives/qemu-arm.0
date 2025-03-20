Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279143njc;
        Thu, 20 Mar 2025 15:30:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVszec2Z0DB5vbp5timEoZWqwomZgEhOf+IgmvgHWC+qe+dHT9sy4GrsOE1u8sZOGCZwlyOKBCCq9iIwg==@linaro.org
X-Received: by 2002:a17:903:2f47:b0:224:376:7a21 with SMTP id d9443c01a7336-22780e0969cmr15331075ad.42.1742509839317;
        Thu, 20 Mar 2025 15:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509839; cv=none;
        d=google.com; s=arc-20240605;
        b=JDIQu4Jtl2BD3xWQBeKJfyprCMeMAEM3Q0XVFxMgAFuCBjQ8Gf2Xw9WIgii6QPeFvF
         k+mXfErxkUGyJXSifl3LK768SaOWPrnpWcVFTbAvxkgZVNcYmMsCCx9w0Jp6M/K2RCOO
         R+SD7txhMq3jZDrd7+PdRsIxuCgzZZk9drQXgE66SAC5znvoBx71ssb+FBoZP0+IT1Wq
         gNOaLuT9DlURFGsn9AKVlFPkRUbTGueA4t1TS3hYutePXjVtH+kPHI2iHQAfqPhojRL9
         JmYR0ZbXeetSW9Ok+DdHbx7Y36PpQg3FZKivHkMkd7DvRCLBJGVp3t/rN8K0SGzFP4tb
         +u+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BPkLAbYv8e88J6hBjHHNYCWMiXvm0PwVbqQ15vaNtOE=;
        fh=2xz2MUy2FXh42EApr/tFUDK0pH62vIC1wEMcdyflpvI=;
        b=NiqRyTqmLLbLOXYrg+r8ylMEsvyJg/tp/U4LMC0cFySi9AXgy0ZQAE+JtbGeYfMf0B
         PDzbM0VOFQxRpSbKmYXImaZm2V2GF+ckbJlzMqPJ2r6Bqt26z7iUB6x2S7VSyHDD7Qt/
         QUl9sC+FvceD0rOyOL+KpQxFcDTzFhrEesH7VrftefyPFeOheIqE1EESjMU19EEJJUBf
         VKRBKYsnzoc8dPQlXGFPzBtdGJ5ePu/kqq2elYPkehFbQJ9azOua+bUuKJOArI9BP+6m
         m8hj/lC9iTTHl0gkzOzwmEfkVJgCpwO/v7lIzCBC9YQK8q29Dx2XEIvaoA289JUSlOTE
         pTZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mVqFDk8X;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811add57sor4214085ad.13.2025.03.20.15.30.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mVqFDk8X;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509839; x=1743114639; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPkLAbYv8e88J6hBjHHNYCWMiXvm0PwVbqQ15vaNtOE=;
        b=mVqFDk8X4nfqJKqzYryDVazgERiJ5wde+nwuMse0SYBSlM4vf2idhUNw/s9wFU9W9T
         /U7/inG7RGO9JFhSiP/bFBqY6YqQG+Fbr80kZ+3NQwETBT9sKe/kd5/diyt+1LBazMQ2
         C7/EBhCAZ39UAon+ynBLnWPUVjk7su4DmFG3knDMVZLfRg6bk3Yf3gq3TWAY0fGmiYrX
         onTq1zSVAC2cAY+fP9uQuVc1H0hjiJwc6+PUG343U08AQWg8GTI/yqd2CzpH2uxgbwVc
         bH7r3RFEzKHlCwntPee6sQmWHUEs4P/zWdXm9HX5apUQpMEsvr/vU2XpAwOBply+1z3Z
         ak3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509839; x=1743114639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPkLAbYv8e88J6hBjHHNYCWMiXvm0PwVbqQ15vaNtOE=;
        b=kWB6Qn6YUA8bSnQwZBHSxNy98lH4ZkAeysGKGuHL/9hCA16Rm+HH2rTUNKHMUuofmC
         n8urLc3L5L3TWZouygab9YVhXkI+BriIx7LPrt8Lj9god5yv1UNGoyD4wTW4AMvamS0Q
         7QRgE/d7p6nyz+SbMcHr3PLdiJuOrI70ZL4kOLCyzHli2D+YebDZIShaoOZk0pz7Rb1N
         nFgM3n3Mk1crxga3VoNAej2/v4hnYrir4Uk3sCERs8ekDBmlm1Tgo7c9YdvlyiP+CSD7
         1SIPPoAnkfM9noxZiu9k3PgHvU+ApU1AwRBGAlswR0y43pAMwyjM8oAcYCCDR0oASGeY
         yt3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUD4aTaelqCaIp6lF/+20wDr/v3Xz6Lkni3U7JM5hCDodofwUR7k7SPxPOYIXeBaGSjhpCXcMApUx7VSQ==@linaro.org
X-Gm-Message-State: AOJu0YyaisVdFhGwvE2TiXk336mVcoT3w9SrDwk4cv+SuyucWAcYS9M6
	ZQoytSZKww8kiIuC1i4YtJe5glGNzDHL1hbkrwA7tV4eWrTee+4Yv30QgnGMoyMOpg==
X-Gm-Gg: ASbGncufOv/BdGyzk0YWajFGeEqk2Qofi+9aQPzjACZGJWhBD4CUMyCh6f3vziuZaBw
	Hpf8c8OhdTf+8sYLG0799rjRpWMLxy7snhPV1sIOfmX47Nz6x2OW/cFvKGejv/kPurVD33woQWF
	6qVfqo0gOelZmNxyTC6Ut85X8JJDx2BEtNctT8yFGox/TKeoJl3hMMz2jHRgR6GJ9jjbYzyiIc0
	yGiTJHt0pl1zi0/g0NCY1h1grKoPy8B7tg0gI3WjEzMNWku8WXZX7lNif/v5yN/TQE9tYeLM0tk
	ad9KxXr4S4LiWcEbogpS1VGKONacJbY0Z9i5zOasSnsO
X-Google-Smtp-Source: AGHT+IH1IZNZsqPktc71rFpZr7RFxZkc9846438DqvW/sf3mREIxsV0YuauOBbHxE1Q8R7m7oGcTUw==
X-Received: by 2002:a17:902:f709:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22780e09686mr19861315ad.39.1742509838882;
        Thu, 20 Mar 2025 15:30:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 28/30] hw/arm/xlnx-zynqmp: prepare compilation unit to be common
Date: Thu, 20 Mar 2025 15:30:00 -0700
Message-Id: <20250320223002.2915728-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xaWmMoQCK/hE

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/xlnx-zynqmp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index d6022ff2d3d..ec2b3a41eda 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -22,9 +22,7 @@
 #include "hw/intc/arm_gic_common.h"
 #include "hw/misc/unimp.h"
 #include "hw/boards.h"
-#include "system/kvm.h"
 #include "system/system.h"
-#include "kvm_arm.h"
 #include "target/arm/cpu-qom.h"
 #include "target/arm/gtimer.h"
 
-- 
2.39.5
