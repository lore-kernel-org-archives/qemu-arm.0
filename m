Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42972njb;
        Mon, 12 May 2025 11:05:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1MytamTs2sbtCIo/mePDUSDMO1siWIjMwMLAL0zp33RzhfcTHiKcQEhZgXjVwRQeWmOl0D43VIeiP/w==@linaro.org
X-Received: by 2002:a17:902:d4d2:b0:223:f408:c3cf with SMTP id d9443c01a7336-22fc8b6b97fmr199248685ad.21.1747073143435;
        Mon, 12 May 2025 11:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073143; cv=none;
        d=google.com; s=arc-20240605;
        b=F7moro+3ozcLqCeLzXvff4yiZsH3DQJoi3QkwKZKvIA3p7zAl2XeE18/2b1tAJ2K0I
         +0x9OUxx6fu+u8JNH7YGLiRuBa+j0/IQDZy7dlI0tQFDJSaWdxw12jOKWw/uC7ZYuWkz
         h8VD8e0mcfjeCCYc093VIGUdwmhNgWEN9nhGpLjdHpJ9ZTtRvm+tmiHOf4MioT+DP+G9
         DPm3A8CxduvIavYorZNM+ZVDP+7foZbeLNeW07K5Zi6kfbkFwxHsxaiW7ATrswHiuHho
         dlRjYAAdCWRqpfqMyoe1/zBsdcGzQ+gDXRFeCHmy3BLRGgKK81qthCyEw6v0kvg0iEkA
         fUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        fh=/bigqgaAhC5TDDnk3i0to9tBo9C00MpdgGaaP40zblE=;
        b=TzbQrwrDUO7IsGpoGhwZAFoLizcYTiWT/N8ojWZ0oSHL2O/BjfEKhAZw396vuMeyk+
         vIMkjCbtJ0e4D3eQDNt9KRgWaSSDxcB4s7OUH8gDm+RFUWOpUqzdcsaQXzUtguypw6HD
         dfseAv38OX6U3RbP2fD/6BCIopDnZfYBcGlsRQtszDRsgDh33coAFcj3fHq06MLXVjpf
         AqOxP+VQbERe7xXUSK6htcsJmlWId6ai/EnKBqZVwCH92OTHtYmYgSjkP5gfrBFSa6GH
         mo1P1v1osY+00nbGqc+LhQBsY3fq09PJ2rDirSIPaFs/nykAuKsYeDl0BdurEOgRpQ99
         gjzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mtKbOH3y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5a48cbdsor51949515ad.9.2025.05.12.11.05.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mtKbOH3y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073143; x=1747677943; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        b=mtKbOH3y6NGNWVdoBdEiTopjyrAKizK28zdYIetc91y5JfGNBZNv08b7wDeKcUPi2Z
         L0OO32oGtS7yZcBvIint3LN35niwgXLqPpAGtQQPrrvR6f8O0zJ1B6F2UgRO91puXva4
         5TUZ5EbKqbX9eQLRxG3FQqPnjjAHT1asnSbmHIfXdL4OKdvlvR/XidG5TCDGVpTYg7Ah
         Z5vH1P5mRi36/LbyaGyVnBlNnWTqvSM87Xz4KNUH7bAgrgrZlcEoGZ5dkT1ClgUS4kd9
         Onm1Is7sBVc1R4uEDY8aAteP1AdDlEhhaB7pDUGCuQjVfQCDWfNWNOTHwPu7zkoPgy5W
         A9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073143; x=1747677943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        b=jx0TTd9O4hoY15J0VISSYGeGY6T0P6BO+1ycXVSc8+ez/f8KuNjsLGnhSbss13OpyS
         WboXhq7BtIj5eGVU3CCj+oeXxOR0VOr4mDUoN1cCSbCZqELPiEGHZavE+6dIRznFQ7pm
         Kenj5tSYnGaF9VHkWrJO+l2pZUfmwKmeolWjqwQ+BW2G0TBRhK61L+VSSBN47qo1Vveo
         gnEBZq0agIi2QvzKQ+WfoGe8clgRuLGWUrNH0UB4LodAtuyTcZtGfXx/05wDOZtOb0rZ
         ZQ+eQnHDAYEq/tMxOUVrx9Up3wsNrc9WH6n1r1rvR20S0tFmoWqkGe81sqxJ9gofc1HS
         emQw==
X-Forwarded-Encrypted: i=1; AJvYcCVjYAyi028mQq43qQi+OMiniL4KRaHH2xfwun4VsvYZS8wfPTfjjvWdZ2cln+LYlBkXJkFQGy4L8wqXSw==@linaro.org
X-Gm-Message-State: AOJu0Yw56xXOKWHHw5tLIL5ExarF0WkQUgGAdGOrPkzYYx1xt7CdU/va
	S7Y0jUosIdfEhaDQiOAj8g80oC+ptE/l23Zna/Oq42tyIih9I0AcG3mN19pxE6Z2ag==
X-Gm-Gg: ASbGnctyrryeQNzSFSs4JQD473/mW8LdYJy1qrqnzMcO4p/IwbLns4Nvkep/PEwgLca
	r6hIBq4LFwvRwFq1lM9vM53BwRzZG6YOp/EJrxps/aQqmYbEp4SpU0oqKJEbLDnuOyDaQK0zWCj
	6bAyN5s9oPGgLsfSJ5pRb8XDAsxCzFfwxGfJWXZ3dNUAgAsjYKkNsZN4cY8lErCnBkR+owewypI
	2vCMItikwH8mnHk0i05OzDyehkZh1nLJepxjSWxNIKDDGv0W/OVZ0Lzj1Ldwo/ug2RqPpAlaCLu
	XtEGjqcoWtlQV4x7LSUpQOCSJXwxNjCKBIIVzgQp1ktYCe8RsSToXP6R995iFg==
X-Google-Smtp-Source: AGHT+IFT4upvCT13/RFGLduTc6Ungq+/RISUi+LE8T4VFVW3aX9/HV2z1HHE/PfvAyjp7XZNfam/PA==
X-Received: by 2002:a17:902:d48c:b0:220:ea90:191e with SMTP id d9443c01a7336-22fc8b1b1b5mr213956255ad.4.1747073143030;
        Mon, 12 May 2025 11:05:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:42 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 35/48] target/arm/machine: remove TARGET_AARCH64 from migration state
Date: Mon, 12 May 2025 11:04:49 -0700
Message-ID: <20250512180502.2395029-36-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JeB95w2yhknx

This exposes two new subsections for arm: vmstate_sve and vmstate_za.
Those sections have a ".needed" callback, which already allow to skip
them when not needed.

vmstate_sve .needed is checking cpu_isar_feature(aa64_sve, cpu).
vmstate_za .needed is checking ZA flag in cpu->env.svcr.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/machine.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index f7956898fa1..868246a98c0 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -241,7 +241,6 @@ static const VMStateDescription vmstate_iwmmxt = {
     }
 };
 
-#ifdef TARGET_AARCH64
 /* The expression ARM_MAX_VQ - 2 is 0 for pure AArch32 build,
  * and ARMPredicateReg is actively empty.  This triggers errors
  * in the expansion of the VMSTATE macros.
@@ -321,7 +320,6 @@ static const VMStateDescription vmstate_za = {
         VMSTATE_END_OF_LIST()
     }
 };
-#endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
 {
@@ -1102,10 +1100,8 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_pmsav7,
         &vmstate_pmsav8,
         &vmstate_m_security,
-#ifdef TARGET_AARCH64
         &vmstate_sve,
         &vmstate_za,
-#endif
         &vmstate_serror,
         &vmstate_irq_line_state,
         &vmstate_wfxt_timer,
-- 
2.47.2
