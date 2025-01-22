Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654667njc;
        Wed, 22 Jan 2025 01:30:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoL/hUzQ4qme/GcBS5sUgmpXwcrlkE/j0SZMicTGUwIhENvFzOHGiiQG6KLSMnMLa57iriG8XIi5U/Yg==@linaro.org
X-Received: by 2002:a05:600c:4e89:b0:434:f739:7ce3 with SMTP id 5b1f17b1804b1-438913cb518mr189078635e9.8.1737538235767;
        Wed, 22 Jan 2025 01:30:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538235; cv=none;
        d=google.com; s=arc-20240605;
        b=UnT0wBkJiR3JSAZpvJ5sDj5sHKPeWuRpFM98jUzEVx3H/h+kvwxZBwZn/wf3j25Jqn
         B3LdKIhleN9QKnUtR6mbLC2ryEPFdjdq+Vy6TRXtm6ns8zBJwiGLXnahOndoqwm1WgH6
         mUpDM4Cd3x3hehNau+shWxEUDoNvb0qf8Bm1KFXIo2E1Km+iw68ocRWd8wW/KgRZaXmI
         Lllx1/yrNKIgTOO8k+/WVTDDh1x4gPr3WEvrqgKDxq13Fq/769koeaaRSskCyPtLGYM2
         3NgG6bGLFi+1CiDBA26Qb+x7CNXRuo7ckXkgS90S8Y2/6V/rvbFFuCwbmM7JZYSzQDJR
         3rfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X8ArVsKGybNKtSkR5dolq6Oiydwa+G4DFnUDdzS7HsU=;
        fh=hVz7Wu5ahA2dbP2JdwcJNo9pcAmal2jmaof6gRHpZRw=;
        b=SDIBD4xBJvyiuZ0yV7Y7XZhLqIjmoZwjp8rUHWGXjZUwmzAKFJViDpixZhH1yvK435
         2jsmNKANbn0XERimyUeELLThjV8k8WQl51QUWyOm+hJgY+juh5Kpsk7vpNGD7bNB4Rx4
         jnsE/LT3zIlkNiI8GiXLqmGLVcb+MZVuGrlaoORToCn0Bo1JkjIU3M0RVVRbdB4PrnMq
         YQ2pXqnCD65MHwj1gUrUjIdR6an5Dr0j/nEFHrpHN0npOVxQP1UefQ5LijL0NrCiTFRU
         XDq5kRQCmiei6lUkaYVOnrcpcr4gwP2UeLo/XXPPM4aM2kz97PxasfTi4pQe8HYTPBgx
         JZ2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vZzKk4iS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389040adbfsor42749835e9.1.2025.01.22.01.30.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:30:35 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vZzKk4iS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538235; x=1738143035; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8ArVsKGybNKtSkR5dolq6Oiydwa+G4DFnUDdzS7HsU=;
        b=vZzKk4iSYShJVs0R6qXyiJN4uPy3+thXcDjKYDBv9vGEl7drSwd+Hs/si6QJxrhUWx
         3piz0o4Su2tVgFxz4MIjbnQuRbTB6zTVNU2n7BJqwx06s2WypE5mVYMqcdFv6oyVao+a
         /RrnqhEZbeoHrYQ2pYdWuzUEfUYqdOd67qPwtudHL1rnhTtaDw9pjzLfKFoApKiU+UrF
         gRG7DdUhFebAjyHqUlYfTWo9GkBF1loxcPibynbedPChaVb2D32tKJkSGZFvJmpFn4Sb
         +6XoJHIFOFT7dMEYL+7w/ZDgMjf7UTnQtqoS4NrUrp/dUW3dkJ+Ftj1yPv5UX6P5rZ1T
         YXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538235; x=1738143035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8ArVsKGybNKtSkR5dolq6Oiydwa+G4DFnUDdzS7HsU=;
        b=EwLU2kzJUH1aJ8dDYS/5BP+iJHSvwnORdrqw/9dfFNpszslOy0hfH0zsAcHozxT+9q
         SfMtErJdsuYN6IcHo4eGqIiL9YmSDIB6oq6A3V49mv7TfFK+fVnYX8EINaByNfIWisDP
         r7PzIPDYpCe32aub+aEe3ntj7bDC/lBb0mWJfGwNugT9gqlP9F3m2c2jZMpQOah8Hycq
         gk0ZUzskhHIj4/l48PLKb/CbOH97hWhIK7vWaern8ils9InLwK2DpFB/8NSlN475IzoC
         yXWiXb6oCs5rBGzIvGHCEmAxHjC4UwbXZs++RTKbGCwrlClI9gpxIg57RB+M5xK8LBE9
         DdLg==
X-Forwarded-Encrypted: i=1; AJvYcCV9vtvQq9XJoXZRHZRT7xW6imn4dm9PR6wgxHil2zJ5tlaRCexLtFvR08ZeKMBNpVhhw3vsX8Sbz4OBdw==@linaro.org
X-Gm-Message-State: AOJu0Yy5qoOKhrT4zhzq3f64tTr5jhotwm1WGIHslOghxu8A/VR3ZvN/
	9buWVwlhLhSqMElgFziWwFXRxT+LDoSeWwFobEhcg1pUw+h0KOMBPSfsb56DCESh/g==
X-Gm-Gg: ASbGncsYkFTDvb3USfZkU0yYg6xUwdpwaA7CLuXZHvdCgeVy62pgtYND8xBqxb4XzhV
	3CoS97k85cjmTL56avJNb9376MTtfJ5XqMoJpMi5/J5wdjyL1lYAngSfpZMyEP6lnMci/bMKXY5
	Xnf21GvNMr4873bOJK2RqcDh6DcNC1z1uIIO46Ypt9IChcxQqWLy2PR5wHoTKuKyoDn2Cim3KEh
	Tze+XPDTUdDbiiKX6Rlknm8t8PdMBiVXoaCoqApWwioeiDC9b8RIph5QNiTv+/GOHZsxRqanPKg
	Q8qTYyuOa+ju4pujwR6xROSXVMJfTSTXc531uBiKPMGU
X-Google-Smtp-Source: AGHT+IHks2jHi8AyiUO0a8BgVEjQWxhPXHsTRUiMOuiSFnHUZ3kH69HzTsmHxw9Sivrz+GFXR/bERQ==
X-Received: by 2002:a05:600c:b8a:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-438913cae53mr199214635e9.7.1737538235272;
        Wed, 22 Jan 2025 01:30:35 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31b718fsm17282655e9.28.2025.01.22.01.30.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:30:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/10] hw/core/generic-loader: Do not open-code cpu_set_pc()
Date: Wed, 22 Jan 2025 10:30:19 +0100
Message-ID: <20250122093028.52416-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ldb4rQ4lC1eU

Directly call cpu_set_pc() instead of open-coding it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/generic-loader.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index fb354693aff..1b9ab600c9c 100644
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
+        cpu_set_pc(s->cpu, s->addr);
     }
 
     if (s->data_len) {
-- 
2.47.1
