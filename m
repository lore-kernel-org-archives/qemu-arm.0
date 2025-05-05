Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178919njj;
        Sun, 4 May 2025 18:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXLGvSzqyCwFnikKi6el5qwBmlxoCIC1zEN9tRv9fCNPkTs8EmvZWC68AjJXyPU5nxcOkdRlENOKfv2A==@linaro.org
X-Received: by 2002:a05:6a00:aa8d:b0:732:a24:7354 with SMTP id d2e1a72fcca58-7406f094a99mr8328651b3a.4.1746409983204;
        Sun, 04 May 2025 18:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409983; cv=none;
        d=google.com; s=arc-20240605;
        b=NqrnBo5GpvBAwdTtdRCyJtEWqSpyL8dAzesOx+iKDQxplZLfJuEyPnskE/l1DfKBFQ
         61as6cycnaesuIk6fDaxwhYQ8fuz8gJZpJ8DTVnJu2J8nPhHfDbwqxqRul7SszSjVbVC
         5AA+/NfdSjjMHTF/3EewL+6QMsCeyPG8jusg0UN+CXp+5xdcODS2taMwR7haeunep693
         RThuNMYWovZ2UVUlCqS076gQvip/8z6XlGEivJhXm+Z2mKiK0TQXrRuaLKWyJt6dw/w8
         8NQ3r6qQHuCZzlWTiPTt+luZrJif7uaUPMVlbw13N7nn2CK+odPcOua27aIWFpH2e+U3
         fuOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        fh=k4nLJUkSYJ4K6oIBCX/fQhswLW7wHirZtaor2/6diIQ=;
        b=aUA+PKgsmJ2Ftpo1GPXwtOOdgccwG1Et1ffACQo8hQM9GEvp5Sn9CTL799qV6dgxye
         0USQLCCfZfl8RO+yjW1ZM/00pGGJvb+4NFWdjYA/EqFjxllnAw3z+2y0/aKWUyDr6Vwf
         XquPliG2P37RjQmdpF/MV8uZzjo6HoTgYQ2wgectGBgRVVSaIL0JGjfbEZXjrWgJ9tdZ
         9E//mvSkg6PgegyMSFOXJy53PtK42710FHlX59XgB7GNLCQS29rf9g1dZ0LUFbaMvgxq
         4376kn3t73NhljiA1EZE2Z38/13BfEXWyEZuv6v2MWEMixGMtGhn0KdAKzrkHyZjkIUk
         Ru7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvWaotWa;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eea306csor4079674b3a.2.2025.05.04.18.53.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:53:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvWaotWa;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409983; x=1747014783; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        b=mvWaotWawTPSCB7PZH/gIa7+2gfUqslQ8A2Hcev1EWuxbEnLSw//BYR92pDHWB0NCh
         EelkQDLCtLd4U8gzMWxnuWhDWvCfCm9HDQemoieP1e+JXMincOoRUZrIqBidjW6IDqAr
         +zaYndUUDj6DEVtnggGJ0s0VG7dTeMzGlhTRyDpiMibsz5mDAaTGCdihB9fEyciBidpo
         k9/NAhDvmtvJkWm5iBqkxmSJx3Cc/W8fs5i0bHzzB8zdGm/zevRWRnyQ5f/u8bKI8vXc
         z5idJx/KhSbfWp2kK4+u4MC8XoqRj4aYOikisnK8bm3eHzhYevFuLvjb51JxAuem5WJd
         ag5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409983; x=1747014783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyeC1dYqzIyRbq0U6QJpnfGNVlqEyh7oNHL1QwbMptA=;
        b=fdnS8bMlzmyGtTgio15n8HICGSynIDxlMe5P4oIKePgWywHqW/5p4dzK0F/+w7AQZe
         eY/UGWUFWSs7qvPxqMbQPQBeOqrfi1PjgPWc/dz31H37+dvwj5iNHj2CQ39UVxojQPam
         i2ckiTBVKe3xElVPMHBDOuQsfSQUWvhKiCCuH5/aYOOhEYTAnTdFOY7bDWwaj5F0OspX
         IKovcaJ/fyOXIhLKds7zctov1/FZ9Vwy2hTVP80Pgs04F06Ijx/0tOcldDzHq1T+qXK9
         2I6b3yuwc+IIC+NTDZlX3qxU2AZkAMq+ACDiGsEYAY+vlR0d41wlqKunDBpiotZixnQN
         4G8w==
X-Forwarded-Encrypted: i=1; AJvYcCXMroBIHr4zQpwEm7QfWCg1tQS7XKlfh0fkOWfRdhcPpvVOyf3lq8XMwrUwXCGeRw8EINBdcNW+7lbN8Q==@linaro.org
X-Gm-Message-State: AOJu0YxEQ3qouLwG67nueoLdprkshDWE42pLUKpBpTtzrI0ELGC4TnAA
	N66ii24y97GYJpQcVZ8/VWR2eNKFkzCQRg/ZDIaaed+AmDnP4XtB1jfKdYuHph9jyg==
X-Gm-Gg: ASbGncsiosQL0ObJ4JoXKQTmRmH8xW3TNKFk57y+UUWo0yE/EiJ9wt6YkQL5ueSTNtr
	TCnW5n8NPAxzH5gqng0/N8vNq3JfR3KDgo/vEUKsUsnyGLT6dquCzK86BVjgfbdcJ5k/iBootzE
	0eiSazVqUBUODYAUzC8zc7GvBAOdK1o2oUz1XL8ItXESUiERHEstIwo6gITk0CLHm58mbSo3SYP
	IRmt8z9Ogcopmabsi1UZsC2e7AcIzzJ9A8lfiCtVzNgI4onjBxtu3jG8hy0sRYJdSNpN+LJOIqI
	1WjKB97Nqvi+JwsQtGyzijk8osR0mzK8HTMGdzUo
X-Google-Smtp-Source: AGHT+IEGCmE06PM830ZmSDQRZ5/eVfg6TQfwRHwBXfC+nvoumfTt9BR5P8zxI964fF7NFvhtkt5Slw==
X-Received: by 2002:a05:6a20:c995:b0:1f5:8153:9407 with SMTP id adf61e73a8af0-20e96ae202cmr7538720637.20.1746409982788;
        Sun, 04 May 2025 18:53:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:53:02 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 37/48] target/arm/machine: remove TARGET_AARCH64 from migration state
Date: Sun,  4 May 2025 18:52:12 -0700
Message-ID: <20250505015223.3895275-38-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: M7OoGa6mQUpY

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
