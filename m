Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086089njx;
        Fri, 25 Oct 2024 07:13:05 -0700 (PDT)
X-Received: by 2002:a05:600c:1c18:b0:431:43c6:e868 with SMTP id 5b1f17b1804b1-4318c73a43fmr44435925e9.23.1729865585543;
        Fri, 25 Oct 2024 07:13:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865585; cv=none;
        d=google.com; s=arc-20240605;
        b=I7Z5E4WOJHxCZcw/Npjrrc2xEHB5AcT5zMwefeb83qzbHNXgf8Qt1TK6UWMSdrsFMG
         ylVlz1tcBh7focm4f/aP++BMmoiTeir90TmCmuMXgzKhs96VBsAVlj9nSo3sfiiMTfpa
         kB1f+Q0aS5yZ3gHsAZqqa0mxHQWY0eM52HsBsuQNp3WXIoijuyo4QT7AK1Cckf276btk
         MT/OoZM14h55n+7nrt6rx3YDNQLApcysTG/IC9icgAlPP0b/sUySR5qD3Ls7MXqKXuii
         hUjl84ltRKa6vK1kRSXYttyWVQ3nfy1Ef0YztvSgQOJeUMW5H8oU+SJhwGPLpvjD521y
         qF8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LWQTkVIYoMx387TeXW3tDVaYyEBBg7QXyfQFYBePRB4=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=ggs9yCx7diNy9OgqXEI8nut4vK1QiOZwUzngqaif6bwQhHpn8nhLjxpkH9i/rkMyZB
         mfAWOB5IyXNz/s7dlI7QyUQOvofJZHY/NDd4fS0SnWakG+CyvGp4b9bjUCS21LkLwm/X
         dx1iykzziGX4qESZZG9QREALaIzJXwLWAzuG/DGnY9zWVtXzWiy5AoLZ2/3WEfynsvew
         n1ktWwbVg6G+i/kZk5hQufcCt720hSOSc3N4wQJRN/12H91qDRD9OxK0BEqF7YYstlIA
         QNN6Pvl17f8UM7GIEHlwmZkypmoALNQmdLQzM/64eyOZeYoz1HBq4iMutUh84ac8g6qp
         F3Mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SdE6J42m;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319397d1fasor4708275e9.11.2024.10.25.07.13.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SdE6J42m;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865585; x=1730470385; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWQTkVIYoMx387TeXW3tDVaYyEBBg7QXyfQFYBePRB4=;
        b=SdE6J42mj2y+5cmmBX0+krHH1e4FJmPM2vutyLN4zdpqYl48k+MuTHTVvfwUxI8pGr
         hf5i5YIyiKmUTaXFz+/doPFUKP6psEXngI4wJfl/nFI6WqL9kB4vDBoxBRNR/hUCaiw1
         r3QFSsQbeUHkPiAZg2EPqyS403RESU518qKXSlwbd619TfJ5gec85AwFuf7WLU/BXZ2/
         GhHA4N4O6W325kAow0U89DK7RYAgyR3Xs2BWI4alHcKiA87ENN9yliqKyFnDYTvIHhl1
         qpRjaoDJEx7pX9ufc0xQ35JuNpxdiQSG90tw82P6Wuw/6UTZosrqSu0Vd9JdDqyaXnTH
         GH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865585; x=1730470385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWQTkVIYoMx387TeXW3tDVaYyEBBg7QXyfQFYBePRB4=;
        b=k6470pDAj202DKUeAXqdDVVTi961fqcCAXNmW6YPAUhcs7I7cGs9114+KpOkt4rM69
         9jEqR66kDl75xu/1v/kUOkeEhfcKKNovwxaFZOMHhC1WJ30Ut/ONISG42UjjoqOondH4
         /Rml9V6zyfB4k112LDfIQoN+ryo6OwqNW/QmHIKbVIzsn1P0F54zpbIsBxcmbz9ff85A
         YbiXCdn8KFfkl9E+0kT9oMghtUw+xe745eQq532ygh3IkqByqnV0pCeURn4Y5KbyoFeL
         hV0YfftMmMmkNOIGJfY5jlCdK6Kj7MDTv4EWykBQyYJNOMR6JtNROHSRognSg5YCMI35
         MOrw==
X-Gm-Message-State: AOJu0YzdtUfFyFZB8Y/1BICQUyTXqGpalq4QAIkdzAdxhhYm1LKx0SKy
	TjRyD736R7JHecYm9oyerrf+0CH5HOdZVrei4RHF1jA+MZMyG3B6sBW2sccm/kdzSQ==
X-Google-Smtp-Source: AGHT+IHSPtYopQuk24YCPV4j/3lLijdSJYW/1g+JfHiVm9QFLT6tmDk6VCMAGDw3f+ncfW6XOWoYQw==
X-Received: by 2002:a05:600c:6d19:b0:425:7bbf:fd07 with SMTP id 5b1f17b1804b1-4318c8cd0bamr52618515e9.5.1729865585055;
        Fri, 25 Oct 2024 07:13:05 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 10/21] target/m68k: Initialize float_status fields in gdb set/get functions
Date: Fri, 25 Oct 2024 15:12:43 +0100
Message-Id: <20241025141254.2141506-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Z2K5eQGFe3vv

In cf_fpu_gdb_get_reg() and cf_fpu_gdb_set_reg() we use a temporary
float_status variable to pass to floatx80_to_float64() and
float64_to_floatx80(), but we don't initialize it, meaning that those
functions could access uninitialized data.  Zero-init the structs.

(We don't need to set a NaN-propagation rule here because we
don't use these with a 2-argument fpu operation.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Spotted by code-inspection while I was doing the 2-NaN propagation
patches.
---
 target/m68k/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 9d3db8419de..9bfc6ae97c0 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -36,7 +36,7 @@ static int cf_fpu_gdb_get_reg(CPUState *cs, GByteArray *mem_buf, int n)
     CPUM68KState *env = &cpu->env;
 
     if (n < 8) {
-        float_status s;
+        float_status s = {};
         return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].d, &s));
     }
     switch (n) {
@@ -56,7 +56,7 @@ static int cf_fpu_gdb_set_reg(CPUState *cs, uint8_t *mem_buf, int n)
     CPUM68KState *env = &cpu->env;
 
     if (n < 8) {
-        float_status s;
+        float_status s = {};
         env->fregs[n].d = float64_to_floatx80(ldq_be_p(mem_buf), &s);
         return 8;
     }
-- 
2.34.1
