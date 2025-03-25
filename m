Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397046njc;
        Mon, 24 Mar 2025 21:59:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWREqoXpy1eA3LjoIoSFiGY2l4g3DbuXq4ncmcdCd7vyVEGeL7n9hOzj9FlboxoYYaNMdrm8OvA8FGjbg==@linaro.org
X-Received: by 2002:a05:6a21:4c85:b0:1f5:9069:e563 with SMTP id adf61e73a8af0-1fe42f55966mr27702116637.21.1742878774676;
        Mon, 24 Mar 2025 21:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878774; cv=none;
        d=google.com; s=arc-20240605;
        b=LQRRsqpbCrqQOf7IBzyHHAmiAURL2LyFIwdKNNS0NAOowgmpFiRolWeAmCSmVCdpZX
         wYalCSUhivNyo6gOOUJrweQjRpozdmPR0Rj3wndDNFcI6AXDsUUg62lrEEY8N6axjdmO
         8YKcR5+nm3K+ZziDUpn08dHffCOfxMSY+px+GfxZ6QFOHQFZlQL8b23Cnaaxjk0jlZ/9
         cm8q5H8u2EjkrNK9LP38ipEA806nbXoFiCpDtCGvaHuNKT6XYTtLik+MxoS+Tm173STN
         VLaMpzEoysm1/sRZoZiU4VGx0XsgeJB3uL05TeLYgkkPhyRKmGZjw3x2f95G7iDr24Rt
         7qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=suKjzNx+ro19ZSxlCmxY92LJNBi/ThyI6kfAqCnEFLE=;
        fh=bf4TOXu025e1eTP/lftaNK+5SBuxNve7rcKYhK41tRw=;
        b=N5V2vt9SQGh9MSg5AUHkIRV/ygtytcWmZ+eBNTmD06pEJMcXeQYOrgtosWy9810Cqd
         nlfrlCwvtfmVU9S7iNSdKzZH1smlcem3zTpvp5uqsS7TnU0nlSDGeObapjmt8bc2rDk9
         NRnULA0HAO+g9UoOl0bxV8Tlqn6621iaS7gHwc5ZRqRG38zY5V/wIb38m9EM0KynG7ob
         yUD4k9l+yC/9bTO8Pyh1f+gcGC8pydONgoavf7EvzeiXnZP0Pdhi6uyFs+v3n2h+hAJO
         k9+Tzk5KehHFexOOGBumfk2Zifd4GF5IbILaYmLTKtoTDYCAmR/EUlPZ81g2R2k6rsUd
         xcHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JNShFAf/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a291374asor5182310a12.3.2025.03.24.21.59.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JNShFAf/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878774; x=1743483574; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suKjzNx+ro19ZSxlCmxY92LJNBi/ThyI6kfAqCnEFLE=;
        b=JNShFAf/DAbs0fo68i+i7AN9A+LsdHhb3FC4MMTA/YlhXL0ZIU+Ib9I3RFBs5izaN9
         GlGXPMG4KnSiqKb+WKSYER1V+SNIq7dxJfGbp7+pILk9LzspQJGjEDKPkRQXlUZPOGAq
         cliKQAnBst55OheD6ZL/kfpo4iCiwHiQLmvvi1SAwqHlm0PcGc8YP7xq7Q6mh75z/Cs1
         qp9P+bLYl7Ig09EG7Y2cmc/ybC71ToyLKSB9tZJvmDO3tct/R2OMNcCn81oBO8JZv/xV
         h9aX2U2AAVrGiW/2SP0AN/WQcvei+6YsFwOXi2+2TVRcT/nFHRhu9yxRgssGXuEtdJ9i
         tFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878774; x=1743483574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suKjzNx+ro19ZSxlCmxY92LJNBi/ThyI6kfAqCnEFLE=;
        b=PVF0uMKxjBW29yDuKzNa+2CC3lKbPCjMeh+0e4sZzKolgDX3Et+z7gsuBHs+fILtht
         z4opkrUrfGLoi2OYOcIOAbO3aqQ1l1oNs1HNFx3CknJ7tkadRGU6h4Vdb03U5u/4AzSI
         14nHaSzyXRz8yX7+gKODpRDcSqOpNTaUGnZZunakoD2C3NgCk+4pyhpXQPzxE3mFQOg5
         Js26auhW+SAMFhOricx9BZwsUG70ht8fNvBSJeHUDPALo9A8yKkHB/JbCIZY/jjPe/xx
         KyAeNhbm3bavI1K04zlvV8BjV1Cq1fuqhotsa4xDg+gqJfRtCAy8Y78vI2OtOT/h9/kg
         uTfw==
X-Forwarded-Encrypted: i=1; AJvYcCXID7I9awCTEHDz9Lf9IZbJmNFNK6sng2KQss8UcKphUTxDysxjc7hYb504orEAcEgaGsLjWG7OMpOlRA==@linaro.org
X-Gm-Message-State: AOJu0YyiPgRdKp+cFnsVmAGdpmX/WQT6CUsc948Q0AKYSRh10NylWr3G
	U5unHJO7YFofVwNkOrYssFC5Xue4Vzxxgn11CIyWxYTo/WZAxFJ9HeFP0ZIs3B/SlA==
X-Gm-Gg: ASbGncsFMvsNTGg44a/1Pz3iK5SNqnjcD/AAt+eOMpw0kcoDi9g0HZgedIt8wZ/IRTc
	7O6q8L+B0KeHuJhLotKIbHGTR4wGdfmbeu6zGHGP8mB7H4HySyKjx/3vovASyz3hn7ziTAJqYmK
	MNmSszKKEgp7rgTiwR2Ksj7VBki4596bkcowo8lLgILaeZubQXZsatKHUdVh6zfh9RqiWXVaKq5
	8qnEDzhoNZAXyEU0m46sPil8/Mrx2YGLNZfsngGHAw47uzJcrDcpiKX8nEA1VqUbEI3Eh2mAZU3
	mjULSADSht9oSYKMK4xGykDZKH25kLu81vjB+yQFQ7EkfvhkMug2ZKo=
X-Google-Smtp-Source: AGHT+IHPU4uchBIGiRjkJmhVeK2EhQ4Ui7xYBT+ie5zJXI7wvII1DZ8qGB//kHUIjROeSaKjFRMo2A==
X-Received: by 2002:a17:90b:3e47:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-3030fec4e66mr25832284a91.20.1742878774134;
        Mon, 24 Mar 2025 21:59:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 13/29] exec/cpu-all: remove cpu include
Date: Mon, 24 Mar 2025 21:58:58 -0700
Message-Id: <20250325045915.994760-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: lz9QoRFpzaqB

Now we made sure important defines are included using their direct
path, we can remove cpu.h from cpu-all.h.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 accel/tcg/cpu-exec.c   | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d4d05d82315..da8f5dd10c5 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -21,6 +21,4 @@
 
 #include "exec/cpu-common.h"
 
-#include "cpu.h"
-
 #endif /* CPU_ALL_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 207416e0212..813113c51ea 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -36,6 +36,7 @@
 #include "exec/log.h"
 #include "qemu/main-loop.h"
 #include "exec/cpu-all.h"
+#include "cpu.h"
 #include "exec/icount.h"
 #include "exec/replay-core.h"
 #include "system/tcg.h"
-- 
2.39.5
