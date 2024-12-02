Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802587njk;
        Mon, 2 Dec 2024 05:14:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUF1bL9cZsAOB0WAZh+FeBmYi8YRHESXiChDquGFJLj12L8hH1e9hP0twr9/VkExWRwBINe/abCIh+Vbw==@linaro.org
X-Received: by 2002:a5d:5f8d:0:b0:385:f38e:c0d3 with SMTP id ffacd0b85a97d-385f38ec2efmr2933386f8f.58.1733145293302;
        Mon, 02 Dec 2024 05:14:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145293; cv=none;
        d=google.com; s=arc-20240605;
        b=MaICHksAS7mOi7phJnjrsHIAsBcujHFsImFo9vIa6Sim+JkBIJsiKLQGhmt5sdTGPl
         noa6ZqFs0Il/nh3HtsUbMVSt3pX+nqMSzKqDIvKHj7lMRAGYR3XEqNC/QJXQkIheI2b/
         gU7yEAlF3FQQUg6lxAU2Halg/Th55Yns5mRKNsBsLEO8ONsDmW6qMmn9NXyWwsbWic8q
         j/BhFRytpB5mPB0E3H3F/gd9uuGPkI+3KPZUUHfP+WR2X7y1PDj3+6dp8juZv5lqpV2D
         6bRFf/bnpIn+FsfJFjuo4O5cxH51GJF1iMVwoA1wSQ8g5I49BGQWsF2Ypb4d2stNqBmr
         QKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Iti77Qpa/qys0505SaJu0EETHGjGdf7P6zBWbzXMDlw=;
        fh=Ze8FD/9Zu1hPyAIPL+Gm72MA7vWHQ96FBiMqDI59Svk=;
        b=FkdGcEo5a+ZzJjcGQweDXsk+GFs967hCiZVhjxqFJTG0wk4tNjwcLDjNfRMd1aFdRT
         MrNYjrtOvjVPG6wD7X/0P9KnUdiHJ08zYo5RJybqBX2WfSAo9WL6iCSJy941imXzzRSN
         wcPHChJ5ba39DfQz/+HdhMJHU6QNW19SXdD+VjmmXyq+k6ZbenFQYreEmIYCQTNgwlzc
         It4FXCprJ07EOcSrHXkcsSjsKaew1JIAMiNK4Hn7gt3KomQUI9dHhAZamBasILysvt2L
         QlzCdFOXR0v35/yjYtVEStte2PhsBSSv68TczCt83c2cDywyKtl22Z9jfPhx9mgqEddZ
         tydQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcOvV96U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e37364f9sor979414f8f.4.2024.12.02.05.14.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcOvV96U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145293; x=1733750093; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iti77Qpa/qys0505SaJu0EETHGjGdf7P6zBWbzXMDlw=;
        b=XcOvV96Ua/7JX0qMQTyQb9LQNY6J6YMUBmGZk+J13Yr6GqxQtw9Cx5OdT4YXqzQmnw
         QJhu2AsTTwt1AUG4FfCL6XooS/0Ps9S95AqFDQoz6I2H+HD6Z2cRhZGPp6ha3YH4yHMC
         T5eFz9xrbAKXbudOyPxQBqfz/VcN+ffxTHAkcQCzXIRCY+i45SwuVUfT0ASz+fq161C6
         hsGUrHqhmqQEBNqcc1L2HNckrzu6NXxaXAvqp0sWSmrqgQjQvcclQGbGeUXTAKGuDclr
         oZv3XcrU1d8JOWLxxhJhvPRyNEmzFRgoLD0g0C5ynMMPYjRFOf0yYdTbjJSQ/QHlLlwS
         ajPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145293; x=1733750093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iti77Qpa/qys0505SaJu0EETHGjGdf7P6zBWbzXMDlw=;
        b=Iz46rZdADDupiPW+onnoxP4FwdEn2ff9tibd6QN4WtMcaPX9CqueVEyI0n8gWcWmqx
         8aieFMVNsksiQblnGJvHcmKP3C/AilA5mSN9ff2EtjjXa+F6Ppq8HrMOKyzB+apy0IDC
         7aME0qGfTeaePomN/lBEMJaXAJHHnQFSmMvr2QkiDwuBVHrmIM3AJb8o8N6QNArfsM1f
         9GZJSr7+n/Uv+NE0e7WWbqCiZEnWkw/LMnDWltqJ6dZFnutd0E9PGUJdV9fYbWleBonM
         IVp22MsvNjBqO5Ib8+kqj+csaF+z6Vw2eQCI7vDBDWGP4LfM2I5zvp2kcTdR4PUNZIz2
         QIEg==
X-Forwarded-Encrypted: i=1; AJvYcCX+kJdUN5A3grhZ9iq6CX3AC7RYTLSnSas7gSaev5HXhQCQtopvVSbeuwfIjHdMTYqItnQhrK8NGScXYw==@linaro.org
X-Gm-Message-State: AOJu0YxbhN5xd7vzzZ1PfMa+5V5/0MtGqE+7jC5wNyrB046FhyJIkQVo
	0/Ay/FEtUtRbrpaN77Dt/AgJ4ob1Wl7/LGJDrrfg8DReEbJu4EcQp7wAMjX3vF3tTg==
X-Gm-Gg: ASbGnctdKM94/9ys2KTCOmECqyYyy4o9wlL0u+3ppkN/v+fxP+pmcLfwtDNfsSsHYJx
	ATCzeOLxyRv1FN5drRKIjL0Waxi8N++bJ/yJx/sFbT9lfjoucyj3Ke8j2itESUsAaQquTAvywbg
	rWE9IoNE3NCFpPaQlVFBwjbrinXxLdTslUTXtMCAYhkzdlviKFLrJA2FAvg5gG+TUpOw8oXlc4P
	+Nu7LhCo26UweDq2DlO9+mCLo+xA9ZBnB1d8I5kNwLQwMY98cAzQQU=
X-Google-Smtp-Source: AGHT+IE7hvtFuGrEg0mz+bBatZd0DfKZl20t+3wAaC7jG2Nq+5wvLqiyfB/3feAoQtSqJOeAf6PZeA==
X-Received: by 2002:a5d:59ab:0:b0:385:f560:7911 with SMTP id ffacd0b85a97d-385f5607b0cmr2206242f8f.10.1733145292619;
        Mon, 02 Dec 2024 05:14:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 46/54] target/sh4: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:39 +0000
Message-Id: <20241202131347.498124-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: P7QsAJmptWZF

Set the default NaN pattern explicitly for sh4. Note that sh4
is one of the only three targets (the others being HPPA and
sometimes MIPS) that has snan_bit_is_one set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sh4/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 8f07261dcfd..d5008859b8e 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -127,6 +127,8 @@ static void superh_cpu_reset_hold(Object *obj, ResetType type)
     set_flush_to_zero(1, &env->fp_status);
 #endif
     set_default_nan_mode(1, &env->fp_status);
+    /* sign bit clear, set all frac bits other than msb */
+    set_float_default_nan_pattern(0b00111111, &env->fp_status);
 }
 
 static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
-- 
2.34.1
