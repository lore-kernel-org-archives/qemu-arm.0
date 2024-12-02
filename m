Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802659njk;
        Mon, 2 Dec 2024 05:14:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXnAUVhBzK8rkii+XxkYdge5YCsE2WiWHkuo+RoyXelSSUh3ucJNVkiXAI/Cvo1igKP1KH2UaP6RXTTTw==@linaro.org
X-Received: by 2002:a05:600c:5489:b0:434:a1d3:a306 with SMTP id 5b1f17b1804b1-434a9dbbd25mr200654305e9.5.1733145297042;
        Mon, 02 Dec 2024 05:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145297; cv=none;
        d=google.com; s=arc-20240605;
        b=EJ7Tu20WaGdz6XGI7zorMKM3OKUuf3vF/XSzki7MeeYgvukUHN1k8iYSunIvT0vura
         Hw1T+kk6mPvYLaMKK1djrGBrSNW5+1kAx2PPUC4N8ZeRoDUNPnJWB1SmY4KKY+roUXxk
         NYYB25VALM4yWuutPxfzwXwHDnwLAaUD3OPJFu84GBjtioNHlZiTjT6iESGW4oBKfP6U
         MmcfCyip1FjZzGU+6z5XpgDZVFhD20sAZ8a3ZIkgEvEYX3Z78fvlhacvLJWQkMYQMhpe
         K1Q5z0PSNcg7lCATzshmt12oOFKoagv7p1tGFngOYqDYPTDB4ALYofqAVOA5j0zHSEiw
         WBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xP+uJ24vDri92uzeME3QktEyDQnUmbcE3e8V9D9jklU=;
        fh=lUtq7zWhgHlAzJXCKWAa9iQ/Qvw47tISPD2l6hZTyQg=;
        b=Fq2o/XNX0dcDDcS8rrnKddWNycWhj2I3C+JndoLuIMPMum7U2UasXV5IPJpQMB7H9p
         IdsleqNbw9LbQm/42xYrYzMM9l79UU4fE4bIa4c24FqofLfYW4gvESxNM5Xr6MTUsgU1
         tKySQ5Zvu/oxDkCAv35o9Wa7uHgCbkd4ZH8AmA4xZKYhLTJof/161ttx3WhhWdiGKMwQ
         /FtzYel2DUs3dnkjaiC90vLoD2eWu56K/8gtovitreB5dC8Wv6TTdnGNHpyEQzL0VQZq
         VR7IY/fTcDloZDot0pcwL72TOi1ti1q7d6XhIyIrxI8RjcNLg7XZ5UJ5HPUZR3dQYTf9
         UYDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aYvESL8X;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b104fd07sor22454645e9.2.2024.12.02.05.14.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aYvESL8X;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145296; x=1733750096; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP+uJ24vDri92uzeME3QktEyDQnUmbcE3e8V9D9jklU=;
        b=aYvESL8X5i/IDaeFaQ/sSxN4KKOPanOjNQXkErLtkJSF5tCnjcafcG4P/vRs7ISVls
         Si4KltRlbf+oB5EWvCRvhlk2sVWoIDOH/HbMWpEkTVeeR7N7lfqWrMUJcBcP3C0YdvDi
         rUUhMs3fFnOLj4voZX3msv4xHNqyfWbiQ5x01ePRLGUTyRvqJneSTn/fvqsxXX6xpMfe
         l0vJbLWB5CUc++k6NpBAxYpyGoT78bxfFK9rI7wE8BJRq4MVmoxR2dseuzMbKCs8fOHm
         0p+DlF9OBCLjQ38BYo96fruW5mDIGBuf/tW0bwbqP3Q0UXNlZVU8QQnm9j5gboFBa7FQ
         Sl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145296; x=1733750096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xP+uJ24vDri92uzeME3QktEyDQnUmbcE3e8V9D9jklU=;
        b=KCf2KAEZrWnp0LcL1Z0z8ZbfDUvDwP6P/+4IjZG0BGW5Xid+eSEAiXYqSSKfIVugQh
         F3ifXJzK8VgRLsoVBbEQ7WFvNMzGfh90Q1rjWEL6CKdQ8mYBpJyzIPrKfXqFktcWeCZF
         5fx4fnlNIs1DHhwG0usxu5OOtgqKSfaLyU948YzTazwnB/5PW7U9136+kSRn2pSjxryv
         ls9x2oFtFXy0SNAusMVARdPoTA8+qlFKSBCCS7XV/Mw8pSI7EJ/CCI+6amC/qg/ErCOe
         mV7fKb32l75CSYJLjGMTcp6ipWAyRz5KCwlE3NmKvvX+aFjkMBYDLlM+raTC8Z90Ovny
         P/Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXkB7VKdMHhabgvz4Arzo49bd5wPPw6Y7BfIkzPLpdstoa6Fvdr22WTc0Jiazb2Pryw6hlaitSCSUeI8g==@linaro.org
X-Gm-Message-State: AOJu0YzxY01yFebdDBhptRrtOKOTxxTukFaaKNxVlp6b0RHpC2yUqn1P
	S/MZGjLASfV68ZfYNRphzs3f/8U19b06c4ucteptoNmksEZU+HrmY0JPkACqwQ6T6Q==
X-Gm-Gg: ASbGncuJvtom59FLeYzQ1kqchjJ9n/WM8QZEyrLdRUCJUN+8gJAu4th60NoCFJu2gc8
	ncSu2ymkgPFcC2VaAcl7ulU9FjHdxSSKxylba0SS/Pxe9yMSLW6rELszG3jPlfa8pEbL/pLoqU+
	dI+dLq6rmtqsfrwrNOMLZufSnqxnpIArNYoWLjmPLmiwYGM46hZS6KIMDuSFZObmAXbf4xGe1l6
	gE01SrffCF22qVl3RI+gzwjxXX3UqfKBpUJdNnFzwzf2ETn50+OzrM=
X-Google-Smtp-Source: AGHT+IEbVKa+1D0aSwF3c5B4FQEXLP0C054fxwlcC+LFvDe+s/IEpdCVQQDQPOKB40nkSfuA52KqeA==
X-Received: by 2002:a05:6000:154e:b0:385:f44a:a3b with SMTP id ffacd0b85a97d-385f44a0eefmr2327929f8f.41.1733145296363;
        Mon, 02 Dec 2024 05:14:56 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:56 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 50/54] target/xtensa: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:43 +0000
Message-Id: <20241202131347.498124-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UF3oWBrnXvEx

Set the default NaN pattern explicitly for xtensa.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 3163b758235..0d4d79b58b4 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -136,6 +136,8 @@ static void xtensa_cpu_reset_hold(Object *obj, ResetType type)
     /* For inf * 0 + NaN, return the input NaN */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
     set_no_signaling_nans(!dfpu, &env->fp_status);
+    /* Default NaN value: sign bit clear, set frac msb */
+    set_float_default_nan_pattern(0b01000000, &env->fp_status);
     xtensa_use_first_nan(env, !dfpu);
 }
 
-- 
2.34.1
