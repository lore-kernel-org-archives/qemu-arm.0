Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756143njj;
        Sat, 3 May 2025 22:29:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMUog+cJf66FrBrQofcwcPghAHeBJk4m9IeiPuqOTppe7WvI8jmdEYMkmNlNYEYQ2b4DiGkxPHdPHZRQ==@linaro.org
X-Received: by 2002:a05:6a00:ab0d:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-7406f1ac42amr4283432b3a.20.1746336576547;
        Sat, 03 May 2025 22:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336576; cv=none;
        d=google.com; s=arc-20240605;
        b=EfxcWv3fJP8jJASd0d33VBQcZt7b1JiaZ+ryvcRoC/7RevXBj8OyVG4tdSaUf25O5c
         rK3lJTI0EhBNDSnOyKtIkTiWfA/OGioh/4Tp9lTf46sKBkrQWSS34fZmgNLU2Lrz8MiO
         TkxzJXfMfJywbMXECXRUV7UcPtqFEdvfwqQ5je0fI3VNZMv9eo51jArFcxnXi4rYBHxC
         d+g5rbi8iSZWGW2aef4LW9uq0BtRsK0wOYgBM2NNvHvXmuAe9Nf0y26x0CnfiXw0Cng3
         OXyjKFr+u/zx55IMyToCoaxGwVuCPoVhAmyqucKa/hJM4i71ir7J5rIKChlotAMUBfXP
         DUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        fh=Aw1v0M7EkspbSaMwVMUutft+btVHCOdo5L/Zgd5QsrU=;
        b=Fl9jUxPV3zxuG7jYQM/EMZHv+dorSMnsoUDpqjyPLO2WJfg2an1F5vq2HlxobxeFvR
         q8HHepYAv6P2ZaQBqBsHoqGT4KzTOXD+lpd2/UhBha5aUnNCUISkUuZvswpLkSfAA8DP
         NfMvAJX32dKu4VyrY1Fdh9tWzXcoVlPrpanTKVMK+EBlm444N6GCmKpMoZ91pUGETC+2
         uw6aQ6fHHaT+wpB0hFW7qPRyWmgdT1DWhkwIQDlYSA2cf3dJW8UjI+KOyTQtdH3x0NDo
         jbAGaaGdqv1tU8clXVg7NY6EExgMUbbGTGdblvAgiwAM/EXSTIPyDAYk54L387cw397t
         qrYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ybiN7lNX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9dc855sor3070215b3a.8.2025.05.03.22.29.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ybiN7lNX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336576; x=1746941376; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        b=ybiN7lNX6kWGMBky62s/QrnlfIJ+2i/GYFWnlme41cF5aiumfdGioUlR4N6YlQC9aB
         6oF8c38ydjgE/7b0lpIJ+0BpAfolh/vhhcklW7rBH3aghwnj200r0etubwK7skameN5K
         uVLYS6GnYQR+/YU04tdJMtC5bMFVGLc1FvydF1kckvIkr4V9xXjrqaRpIEm63i1jkc8s
         cAtBnNoRy46+O/2b2rjhYOhBmtC78GBCgVXnZYleqErra2IHSeq6IcwyDQfXvy+u6AOs
         xCA5aeLrb9tGeEx3hrl8xZ67bZTbxwQ5Ni16ojyaLDo/kp4r7XPeZ5sqii0D+DmqCq6r
         oz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336576; x=1746941376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        b=VXGcS6bDJ2OtIOsIIkeV5xmmx3+R60iXW+gahkCbXGYideYHhXWqU+9yR37oQIXNFW
         KtEf7lygs5zxXiyzVPRaMmdeIiCi+UkNzQHAOCS+8LHBpiYURgfo9ffrxqz0BrT7l6pM
         SZTPCzz7ogoS9hb7ktQpobTLMvhY2WM0OoOA8iksHGF0XKP/4gnHP5u7kYYZQVhhkAVa
         tqiGz87L7GTWvsAnMo3y7F5Hywix2iwKuI/QVriUnbSAhnCPkrWnT8OEZ6LUzPzCdIVh
         iyQzfW4sCTdkBkm75RZMjkzlCmvQdTf0c5xSESqTh0zlUlmTWr8mb2khoNxgEhXvaudI
         /NFw==
X-Forwarded-Encrypted: i=1; AJvYcCVxyxJ1ZOzNmKXuiTx6nw4a+t36YC4cPH4aZpgEYb9YrWmstoIYOOmfz79o9EDidlPZlxjsksooworuKw==@linaro.org
X-Gm-Message-State: AOJu0YxdA93wTXH1Efn4mVHm1fI085FO+qDJ5ej7wC7ByXhvbIXENAvt
	dbUPkEUncTcA3iigM0HIMm0E75GA3yXJK0OEx2T47hRKEarXUXhOw9deNEIBpUzgpEAJ894tZd/
	mxUip/Q==
X-Gm-Gg: ASbGnctLowg0ouWU4JdWIXdgNvtWOWE/dGLgi6Ww80guyPQC93JlNXsvCpbA2/zZSkn
	aluDpaHd/WO0AbntsjtUN1t3oEJlVcoVKEvxOlMUxCYgTanuVkKZkZtj3RD5Kjb1UaTmoFJp4Nl
	97p+Kkf+CXrF1RN6IoELv9uAhrm84DUoSO/At5zXuNea882FxdAos1ZJ0Rrn8QFhrI77awYZ7O7
	c66d+pENh5JIvPHNz2rFLRNfCXVJ4azilLH1Bbwj9F2MiXv+H2Z8LUwOUE1WlHJJdrISOFMZadK
	8oqV6xxkBD39t2STCSbeVvMo0iuWHTiRiPjtIDLx
X-Google-Smtp-Source: AGHT+IHt0nxDsMjHoseXmw2UOIivIDWLffGkOy9QVpGII4Ziv7ZjjANeetTaX9aqaJQD3dqm3X0F7A==
X-Received: by 2002:a05:6a00:279e:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-7406f0ace76mr4520291b3a.7.1746336576180;
        Sat, 03 May 2025 22:29:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 18/40] target/arm/debug_helper: only include common helpers
Date: Sat,  3 May 2025 22:28:52 -0700
Message-ID: <20250504052914.3525365-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: hJN5aBfpIrNq

Avoid pulling helper.h which contains TARGET_AARCH64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 473ee2af38e..357bc2141ae 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,10 +12,12 @@
 #include "cpu-features.h"
 #include "cpregs.h"
 #include "exec/exec-all.h"
-#include "exec/helper-proto.h"
 #include "exec/watchpoint.h"
 #include "system/tcg.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #ifdef CONFIG_TCG
 /* Return the Exception Level targeted by debug exceptions. */
 static int arm_debug_target_el(CPUARMState *env)
-- 
2.47.2
