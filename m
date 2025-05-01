Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19507njj;
        Wed, 30 Apr 2025 23:23:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWty/xHhY1Dcbl+xVTdFa1GYntkBoedePazHCZ6cOiuxFbgMLQur1uqlatYZCYFGpIdr7T8HIJWSOjGAw==@linaro.org
X-Received: by 2002:a05:6a00:2e0e:b0:73e:2dcf:e44a with SMTP id d2e1a72fcca58-7404925a85fmr1883532b3a.16.1746080636325;
        Wed, 30 Apr 2025 23:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080636; cv=none;
        d=google.com; s=arc-20240605;
        b=HeHcxUctAWECOvPVG66CTwmpXkSm1TplbozEbYhPjuG4Ut1/KTOtVR0b9hFePcgVWD
         VG084l5rWlgENMrAEvQPo4EyxXxLZxWXc6Hn71irTiP+twvAPjbATlRbtXOtzWsuX04g
         KZu2CY54kL6FKo7Xl4GEF9d3ApQ0MDl2CVGS76ppDRP5wubvHS1/XB7HhQs+W43xFaXO
         6DoXGRhKhjfuQKORY0hJUvcmtwT5IQ3GuZYH4TplFGp6cv/pMIJEwWXzUXbM6NCbz6I8
         /etFkJuM8awp2AAaCwDmcdvaLxIVdgjRSFl/qFqQOlR/zFMyomYxhqSUuz4+w1s+nkKb
         YJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        fh=jJX7SGH1PZEIrCm9hRtvdo/ff2Uin02x18FKfpveWHA=;
        b=N6WfvPsTol8Z5A2rLiX/WfOpDRrwuzgJ2/3otUK2cSXLg3nw3xauV+8AYbbsCUJgn4
         5SumIlPd7idiWORoFqv+f203mZKqJqmyIXjd88Oha0oPpie0H8amseTLDWuYkUngza/j
         GUZBJR+hYLBB8qwMXkVsDDCaxr2APXudx+adX50XnGGS+HdbEAOV7875eBYcSo0JxmiT
         p0pyKpFJoBsur8l5A9v+W5RnnM+tv5TfMt7DMHiQJEIsY0wclHupSBaQr5hBckM+7XLo
         B1I4TIINFrczAELlzFVwP5srimGYcyrrnhBktAClNgRzP4IKTuucwWeCDc6yCoj1+mmQ
         AhVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SMJS/tyy";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9dc912sor65434b3a.7.2025.04.30.23.23.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SMJS/tyy";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080636; x=1746685436; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=SMJS/tyyZjX9igSPQYqLRXTih9vnc90UVrQQSXYWtHE28kCd0frFSeeYeEUb/uaikN
         CWcRmXhf+C/hD/qXeO1Or5ItSbDwZF/lXAzC+Vw5wMige/4DYTGQLT0j5Ek2+dUpUOVa
         ksL1ALQqTiMdgPTUDWYIgXpm1udlLlXu3gH8RaIqBIaVFWs6M7F8/chpIY9JjbH0I/aV
         gzvrUy7HgwcoVeLXAVcTAPMXzqTyWVA9a6FipllJSpPthIKsFD7mhaCk8nsakWUqqe2v
         Kw9w/vv8jnhH5scRuVSOxDaIyZocw1YmyQiHqtU3/l5WK6QJqA0l95JGoeS2qNEhY/sb
         9PEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080636; x=1746685436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=W1IDZGUncRdUZVjvs3MAYlZ13nUnyVaztoiEO/+tMNUsvpdSW476hQ8/o0/p9VRN9A
         tuCaHh7EuNkthoMjzF/TEC0S4qOG9fCJ7NNDzTUNGyopZZ6swaUUWpEOLgDll+4tEVht
         r9s9LKsLE92HrRMiXJEjpHk0slk+2NXpJug1IeeQ4Pq3JSL+iNrTfUdZcKc+ktUIY0Lo
         C3o63ndzjZ7FwrL566kigKIcBC3Hz36J4kHVRvzwb6jHbdmZxryuap+NQUOwwW0Yri29
         tSTkmwxTxPVVEG6tom+K6criliyspC/1Yu7/Zec4QbdaHWJcHm4grtsjlxtyknKKdUUB
         ri2w==
X-Forwarded-Encrypted: i=1; AJvYcCVPTRhCGFIVoGLoIBAtKjCxR+SLI+G4rOQY+MkkqGdftX7HBIsflHXbUI4Gg/Z43ga0V3PBU7E+nD4T2w==@linaro.org
X-Gm-Message-State: AOJu0YyxqaZGB7zulL5BvMYpP4/LJu0KQZTAlYRl33hHt5ravH75F9qQ
	rsVQcV+B1pb6V29qyaLULFddKVElAHhsk4U2GPQ48RsdGAt1/Y+sXEzJmxJnYNliNA==
X-Gm-Gg: ASbGncs3v4Ix1PepbvqXNWgPwGvJv+p1VMjfvSeAcg69lU0OqumoMpk+R8BALUbfMxR
	tt0PIy0yiQZDPPmg0vKss5IJrLjtiDx1JeKstk3Y1+3dVHVthLEhDqYjqZg2wtvXS2rerc3cWTu
	0u1+odI482QBJzVIDcSOFVhTEfuxX5056VQ/8R8GCHOVTAqJfHztbzrXHDVrWuerWeQql5xlcw6
	O11rC3AyQyo9sQj948FtRNArT/Kt7oKFzYKvVPgT2vRvbbu6FnPjeCVvV3dGweK1TERB6wGYMGz
	adFhgBDi2GCqA/Sw2YO7C7fecGIVLWDzBOTvklCA
X-Google-Smtp-Source: AGHT+IG+S56+ZntAoiv1rm9bGFR6phj1Ukrtx0wPUeRdiOa/xEyLOl/9EMgghyX64DBYfvIhG6E49w==
X-Received: by 2002:a05:6a20:d046:b0:1f5:80a3:b003 with SMTP id adf61e73a8af0-20bd864a95cmr2230421637.37.1746080635889;
        Wed, 30 Apr 2025 23:23:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:55 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 05/33] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
Date: Wed, 30 Apr 2025 23:23:16 -0700
Message-ID: <20250501062344.2526061-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +ZhkXeYqwrcl

Needed in target/arm/cpu.c once kvm is possible.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 2b73d0598c1..e34d3f5e6b4 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -99,3 +99,8 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_reset_vcpu(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
