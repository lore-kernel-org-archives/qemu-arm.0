Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24499njc;
        Tue, 21 Jan 2025 03:41:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXGznpHAsYE8JHjUbAqa1BgqtcGGebTooR+s38ix2CEtqZgBJuYjvtKOXdWacoWg+gGZSIFA0h6Irargg==@linaro.org
X-Received: by 2002:a05:600c:1da1:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-4389141c4ebmr132387575e9.20.1737459695370;
        Tue, 21 Jan 2025 03:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459695; cv=none;
        d=google.com; s=arc-20240605;
        b=QuJyqJyiJEsgpUcZReh0rAJN0V4+IyAUJXIHE6/im/2/QPGaDlGsEWXmsLP8Y1eelT
         NpCnexo/gFN3Mf8AK1wWhIyneSSn7kA7oLNqdLFO4M9VIvuf+8/frZ7PizBSI84rOzOw
         UA2HHQVqSS52AcFXZrFsDyFh3emB70MS0ABcLnKU4HhOrliRFgyLtk8pi3KhoDydRxa4
         V/8RVpVS09MtZDjgygbCi0L0XokbRubFk7GYIMUH13SHSMDh2StHp5/qK5NvgDnz0UMf
         G+yFYkZGV7qzy9oKcoGJbjHxINAT85dujPk7lHZPtBP/hGwkjpS8FCEkRtJLoMzL/QAa
         kNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8EBvExqekhvI6jcPU9fttVcHOfFc5T0tfJ+EZdg5nMg=;
        fh=PV2HzhsF2FlvAxq2y8Y2qx8uCDBI1pPF2B/9V2upRdU=;
        b=bX6lsj0n7hmI881fOAp9Dxp6aYeFXCoiRIJ3D5mCv6+hrtQ4KGgkf7iNhlvGUec2YP
         oqjse9ex6Pehcb8CakJkNgY+De2EmlS+RKcUo8hWKG4WtxmDIBPMQUpDK4pwyI1w31Sy
         Lkn+wlcfh0+YTg3+4lYh+JH+ep7QM8Uvl1xajT6MNalNdejQUXbKFbeddK45EZoeCthX
         kWLW1yBMEAv6KpDlY9oGWPhRPd9G4AIMjIMYCMnKow9hxYBqF8us/0ahE+Og1t2VjI0u
         J8tnJyR3Wi8FvkPDqxSHohtDGztrXszichqastZprbSJ/8CvPJQrNTPLkQrwpki5lGHr
         LK9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jb10WmGM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43890467da5sor43369825e9.7.2025.01.21.03.41.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jb10WmGM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459695; x=1738064495; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EBvExqekhvI6jcPU9fttVcHOfFc5T0tfJ+EZdg5nMg=;
        b=Jb10WmGMvyRlZLtsYuVqJ4ltxa7gO1WkWravQm4Mu6NH3vMWrLVuiCrEzc1c1WdKpJ
         nT/IBDtUwlvnuKOus9Q5aLMaVBwNBRsJC8oaIQnsbuO0aqMDXf3JAhNuqbrbkXf2XAfW
         AhkD6Btx+wNvscSuRJNYXiW1JAr7/mmM4lpqa86MRomvYFF2A7hSkGqvd/2YjrHQrZHF
         7EdsNjxuAFhPTpBFLbdhONlvaG1hgIKkjpGwigO8OgQcCxgEbr1nrm+rAhqMbn565DGM
         cUtOEh8EeTAykQJRylYbKPqAENBCfVx261rhXAvROtY/CPncZ/Z11H85Y0ZKAXa2uic0
         TTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459695; x=1738064495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EBvExqekhvI6jcPU9fttVcHOfFc5T0tfJ+EZdg5nMg=;
        b=eLh4aRWvZ9EQpB9k76ku0yw1wNWfH4+vw8cP2Qew9GGs3t7q9XJPNWlVyaZE5vLwkN
         dQO/63oGbDpuUSlFJm00lUe5GdOYqxs6dH1sAuJuyXPtzL89690ZVgM9DHeGpHrFtidL
         A1cBnL0DXiGMS29/Vbu4rNICaD6O40ll1gMYUO9doZuURyR3+sS4OOSO+jV9EHx7t7SF
         XDwDeiZTNh1QEy+Dr3VWxYf81NYfUDRxPW22AC8jGRGIEF/YX/XHJeLTs1W8/ffPzOrJ
         /OB3Uj2yiwRqX/ETgxhSK1z95r9M33FUe1/x3OBsdSzz5g8m5NPSJfVnknFR+MI7Djyw
         6WEA==
X-Forwarded-Encrypted: i=1; AJvYcCUimajKtfRNrMcYgMJe3tRDb5cCvN8qS9/YmOPmpxxnCRBEC06RxrpYs0qhppBbrxKHuwMZ8KbczBj2lQ==@linaro.org
X-Gm-Message-State: AOJu0YzxCxWN0nEWtF0Lq3ZlcH8fBAT3MCbaEd4zUkv5BlodLL3q6/Df
	lTH282D42PmIYFi070YtqcDXWUhpufAYU/izitxv1EKvLWC390sVAE22VDlZuNoA0g==
X-Gm-Gg: ASbGncvaP6JhyrBYoh+ef7m6BruJraR4k25B/Kf3LHJ64yRUphxAILbneH6o3Yk6lrb
	TpLU0ZbrTowC4poZv7xI9GkU9gdx7+67FSvSswo+9uimLYFpnUFW7twlF7MndgVvhDWf68JVVgQ
	g0+/UsCO0GiM551W1Dv/o7QvJP/txUAq8nzbdKUHrtWpF1m7TAr5Lk7vE7ZmJxgjgp91jU2zRKh
	Z3yHkYnimNWCcQQ3Iu/pL2yzHoaxWMRRnLmCm6ir5qYAtcLDbrIcJkJ8xQrlTulrn4rqd1b3E15
	0F6STA99wR325jL8mWqrW4CLfXmYro7fsV63PsW3PTW8
X-Google-Smtp-Source: AGHT+IE+K5MC6VWNvBNlmvep3x60OHi1bN+kYIodq+lGzOgTwLM8ACjm1FxvjtkMJ+iiA85448mYhg==
X-Received: by 2002:a05:600c:511b:b0:435:14d:f61a with SMTP id 5b1f17b1804b1-438914304a8mr123262745e9.25.1737459694869;
        Tue, 21 Jan 2025 03:41:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438a46b0497sm109750045e9.28.2025.01.21.03.41.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 08/11] hw/core/generic-loader: Prefer cached CpuClass over CPU_GET_CLASS macro
Date: Tue, 21 Jan 2025 12:40:53 +0100
Message-ID: <20250121114056.53949-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZEyhHKTGkvpX

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/generic-loader.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index fb354693aff..0ddb3a359a2 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -48,11 +48,8 @@ static void generic_loader_reset(void *opaque)
     GenericLoaderState *s = GENERIC_LOADER(opaque);
 
     if (s->set_pc) {
-        CPUClass *cc = CPU_GET_CLASS(s->cpu);
         cpu_reset(s->cpu);
-        if (cc) {
-            cc->set_pc(s->cpu, s->addr);
-        }
+        s->cpu->cc->set_pc(s->cpu, s->addr);
     }
 
     if (s->data_len) {
-- 
2.47.1
