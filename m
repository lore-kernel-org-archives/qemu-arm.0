Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802570njk;
        Mon, 2 Dec 2024 05:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXy26dCf3AGvGKR/nm0yblCnZec5Cs0GeUQmv9LShrMA/KnyE1VNTfU2S436BZMYuaD4ZH9U9zrvbuY5w==@linaro.org
X-Received: by 2002:a05:6000:1788:b0:385:f2d2:2ef0 with SMTP id ffacd0b85a97d-385f2d232b9mr2634135f8f.41.1733145292395;
        Mon, 02 Dec 2024 05:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145292; cv=none;
        d=google.com; s=arc-20240605;
        b=FGr0FxPq3UFyzCZTa2jykxBXLsqFU69dFNU1FzVUQCOklSmAm87wvi0jJtSwYTbwi5
         QvgrqBbSwyTGhHUL8kMzj6jLGmZgWlvO4Zgdynzk2oZF8/aGzOvjZyrzOrZ+7lcXib7c
         q+yScmlAmkTTpvAMNNkugNdK9KKHsgqEmDVMhq9reM8NpP2qNod9lTp91+h/IouaOs61
         mkVdpmitGHqFvHm7q7u5PgSqGCPt7hPguNTWS1K3fBVU47iDMGkWzBX4PwxlIzEBVB47
         vlAGryBsFF5ETvEuJgEfhe/AhTEZkz0jQtdowgzYiXyS8mvErHNhdZez0+qP8LvNhrqN
         YWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KxLOQbRoeGb10eLB+8NmOgmz26mWmDSAJp80nLJIeco=;
        fh=Ues3VGvZgZ39MWeau3sTwggryF7tm7n57mIevG5dcp0=;
        b=bFODTOLUmnLgKyBGNMIzKUEcs2JanAvcist48eixsyxPZqIxl/T3FuXIqhQ2BoD+TC
         Cj029Hz83DO9y3sWUuwFQHU94Hdb5dtz/uz0gq2KB2WpYytFhTiBzqW7mlNdkF25RPKN
         NnbKeXEbsEtD6uings7AQUrJSA7iUQKLUpOUOE0RHNKxavRxFDg9xoRYs3HBhnJaimPb
         1WKdjxEx1AR9OPtQniwZ1/P7kQHWy6mRmaQSYyxl+oUJzQrfSjuWUz270wT5EZpT+PI5
         WtZxBg3oqAq+nulH+8ORwqdtxCEdYevqGspVPMKCV5MsZF3cZSxbnieI06SWyGO6sx+e
         euGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/g5Iccj";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e95c5e5asor858592f8f.2.2024.12.02.05.14.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q/g5Iccj";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145292; x=1733750092; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxLOQbRoeGb10eLB+8NmOgmz26mWmDSAJp80nLJIeco=;
        b=q/g5IccjBoUrIjzHTY+WPpfhOV/h2MfZMXoBAQf1JHspo+pbtAxqodf4oXlAvVFq0O
         g+YofzE6WCttL5ni3kOuctC+UNtkFhyK/FkrsgT4AOdUPmsnk6VtwbgqQ7rFJyTsSUxK
         WNhNVTKe7YnwTZiwc3ZyXyQp0dRRpqyNyCf3m5WSw4bPLnBKwXXunCpXJKBLRIrx5jUY
         9CElA6GJ+IZgv4Gi1qI+Q/s9zroagxqGa5FcJwvrAl0Tp5zg4H2xDqWBkOf8AE+UNMeD
         WZxJUPDbqkabpBVCRPGfz6Vl0csPfX+0IPeX1tX94Cw/WM2RiavJM66f9I0/4hAEA/Ro
         VD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145292; x=1733750092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxLOQbRoeGb10eLB+8NmOgmz26mWmDSAJp80nLJIeco=;
        b=EFmWpL7ex6Io53kqxjzvDsNIBbNhrWs8lOaxdbsPTHNPz6S5Wbpy3iam/mWabsc8Z0
         pZMSNk3ceM1NmlNXu6igNLfG/zrXiKY76XqFMHSPPknQpF9KOHYSoQ8LiWr9TqaVRkVh
         5rwKrAvJHWjSSejO+WNbdQqmpcKuQvWbj6ohfhOeFh8VzZQ3HYV2M1DtRDmM9J5Qg5Iu
         OahKXvM3X1inDV4BLM7cO5ZXjuctx6NmAyrrozin9RJSSU++Lxr7OcSrJpK+PY5UxjfY
         NUL5Ov21JbmlN0ZGpArHe+n4Rms3Ox89d7iy/D2xuJpMp4qPsd8HkAQs4upE7UzovRbQ
         01Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUMbWRAixIHpoiHt2xKNZ5X/FBktpZop8n6hG+Pp1SNeZ33cWBardMdyOV7y0iMd91ryYYQCrNE40shkQ==@linaro.org
X-Gm-Message-State: AOJu0Yxx+9WLcJf1JiE+Hu0XjJQpg04TOpJvdj3BVQK7UGAanJSSPSNt
	jau9sG9QsCx07SPF3oPHd4JaIjCC/8uYOkb3oZ9QZdKxmg+9hVgS9iEjSTsGOehw0g==
X-Gm-Gg: ASbGncvX9wW+cIQi4JsnI0X0AOJKFryvuxng9wOdsTozklJ4RPBY5g+d3WRPJR9muA2
	EIwrj189jaD//rVeeyb5jWi67yjAsBCeDGeAilrvXcqUG1XRZOBw+k4rG4GiJRY4JjcS2YPLOmA
	ryhqezFcf7PTsmbbm9foacdMbuIqhDoc8KP1nhNLy0gqLP43eBHc4p6/76d/TaIdY7e+hTEFlnx
	wyJ2Y7/65R97rVirxLB5zZe54723TrhEq1VaO8C33OEbNZ+XqtJ4RE=
X-Google-Smtp-Source: AGHT+IFqGyUblDWhtWty5ZHlDTNTNN7T512u2FwInp5HYuDUlb8l4DtOyrrXP9g08yiDPar3bIjIAw==
X-Received: by 2002:a05:6000:154c:b0:382:5aae:87c7 with SMTP id ffacd0b85a97d-385c6ec0b2emr18715172f8f.31.1733145291760;
        Mon, 02 Dec 2024 05:14:51 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:51 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 45/54] target/ppc: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:38 +0000
Message-Id: <20241202131347.498124-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gWfVIFc07QlO

Set the default NaN pattern explicitly for ppc.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/ppc/cpu_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index eb9d7b13701..1253dbf622c 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7286,6 +7286,10 @@ static void ppc_cpu_reset_hold(Object *obj, ResetType type)
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->vec_status);
 
+    /* Default NaN: sign bit clear, set frac msb */
+    set_float_default_nan_pattern(0b01000000, &env->fp_status);
+    set_float_default_nan_pattern(0b01000000, &env->vec_status);
+
     for (i = 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr = &env->spr_cb[i];
 
-- 
2.34.1
