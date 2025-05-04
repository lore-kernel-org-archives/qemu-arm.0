Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756729njj;
        Sat, 3 May 2025 22:31:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXitauUaikiDfDw0klRKaEKsZ0n5MifJvYT0bfBid/GYgp2VNULlpVZat+wETcitcfCRwptDWJhbUDz4Q==@linaro.org
X-Received: by 2002:a05:6a00:301f:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-74058b25ab3mr12422556b3a.23.1746336594550;
        Sat, 03 May 2025 22:29:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336594; cv=none;
        d=google.com; s=arc-20240605;
        b=ffGY0D+7dVTJ51FeeGoMqx9afsh46ggE6l6lSGnpocvfMWS6LK5XznkS7dT5oG6Nwt
         5R0EQnjbz6R+XnoXj6oqETA9QuL38SQqLQc/3X/S0aPGSLz6HqaZU3jMX7ckn5O++2lr
         Zgh6Rz27QYhIsm97e2Jxy1B1qYa++uXb98KaqeVyaL+f64xdX8bKdEgkkAVtRbSeVEc2
         M1RBmv1hDqW8Z/1jr3lHeWCYQaJglRqjUnil6aoHZCl3hwq0UAz7/jGztE6dLrYcmEUi
         fvdiEvweCl/mStsnYk1U3IzP3yyJuVKHSWNP+SzJxcaLXp9us5VAYNSglw+18wKG816i
         xvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=L0iUuajRF9Ju9HAVblTOBk8R4VBHR5p055b5FK0U9oc=;
        fh=OWAhbtWp+iD27HTbA5b51wa2IgqRh7JeWbp2Bi5dqeg=;
        b=NJG0GistO88kNOF92cDwQy1lgVpeVyv2C8tW1xWkorxhnUzmuZrOY8udosh4ATnrYJ
         nkdpDubWIq3UWn8SXS3egcxKaMa2BZs/Hz9PSz9S7UP0HfSKQv6VJN6GEYhyn0Mi4aKb
         670/cv9dfam1/4CjgHqe8ZypYoWLSFnsq686N0Qfx/x5gvDyon8rXLKbwU05aPbGYidv
         /h+XIb9h+uYIBD0S2tEPqoRzKR/jde9j64zrZEDF0ZSH5A3xC+9Zlb+fGavhn4GnTC2X
         ABQ1O8GB0O8oZSzWA8IG+T9LRNodq+QLu0Sz36/86b7aIFb9KZ5RvpKBz6Ls3OTuSe0d
         5zNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbq5tama;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e870csor3170377b3a.7.2025.05.03.22.29.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qbq5tama;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336594; x=1746941394; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0iUuajRF9Ju9HAVblTOBk8R4VBHR5p055b5FK0U9oc=;
        b=qbq5tamalNwyVSHxxC8aTxlFB5yddvX0X1U1NXqm6l+MZJmFGlgadfm3BmfELqTCWD
         kIiKmvNkRevMimem3LtvIz+5et+RiwLWW89qym2OO9eLyc0CTBBxDrgOMqST0OHM/PJj
         CG6oDXFkT1FvQySbVOJvQpRf1A4RcvWTSqNVsW81n5GSYWJH7OGBxZitcff8aME4EYlu
         IG+0xg7rkDTJb0Ta8SavGBoy3EOEP0Via60hP9oRhLMdbHEFmy8hmROkKT7iv1PSkHAQ
         UuGVyEvsjQFTuwcdo+wYQb2/prBF8QtCD4QSm4tO7n+X3hV/AWVK0P8BAXvDVTk0QArP
         Ax8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336594; x=1746941394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0iUuajRF9Ju9HAVblTOBk8R4VBHR5p055b5FK0U9oc=;
        b=mpa+iO13VmRzTtFllDMJ3Zcttlg7YPEltdiRcJUh7uEDuTgMCredQwfql89rbHZEpl
         FIj7PuoVt3rUjDNGh1bjFlv3nLkuCWpUDbNcq87TZsDM6BVswzh5hhmsxn5/Y1khDXOQ
         qd9r2u4MOJ27SB7alwFNghONQECXg4KACbi1EYG+n9dTVtBcWwQZQzsueiC5bY0tsHfH
         x32PSdIj8NK5YxhHbHVBVz4usS5i9BAYMHvBspGvGly3tXZjRQFX0RWAWqV8iF5H6tXo
         oXuCp8eUfOoyrjpuwDGMeD3Lq+diQbYYAUtAPyDjyx+stDiDBu/51Wob45VtZQW1pQqH
         1MfA==
X-Forwarded-Encrypted: i=1; AJvYcCUaf/e8C/bqkOwM2bTn4l60X8KShF2mEpIw3/CbkTBGF2t6o4KtEMwmD8/M8B18E/3sru24RY9ofeb7hw==@linaro.org
X-Gm-Message-State: AOJu0YzrTiBqMsZsIZ7Pj0Hzki1qgyyDTNwJwGiQhPp8tMzI6iHQj8gW
	/955ANl8BrmSQ0mrzP06+BzYtTX2p87n5eoRA6XkQQBXF8oTFPWaJMlUW4qTSb6ftQ==
X-Gm-Gg: ASbGnctSCXYg6Af7sKjuyxUUXEPmCFuu/2MoGeJEdg67V+aJfM0zVdix6Bti0qAlHT7
	kPx1HYH6bxD/qQtAukQGL/HS3zeQtLywz4Aj5wTWehRBaNnTTrb+eov7qYnb2IkkGBCon8+BOE0
	Tlrn31WEsG3jWQUBk+kD4TmePceauS41rQvx9nUY7SX2TOZbe6BNpeFiDELkgLcXUxkeaOThJpg
	q/KwASOf1JyNFmsCerfwkfkEGuU49vYcrgJvGYPHOyvWv5cS8JgjX2cvF+0/nRhIgRAdWs7unb9
	L7Dpk9Z0HzRRN3D4HqckgjFxlv/jxaDPdqyi/Bvllj7ntjTrBfw=
X-Google-Smtp-Source: AGHT+IF+EPugBKZQllOB6ZlaN9XF/AgCeG8gT7XrYMYc5dzrkZ7ZMMR4F0EEYWmv2FreUz8tb1cCXA==
X-Received: by 2002:a05:6a00:410e:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-74058a568d4mr11150341b3a.14.1746336594179;
        Sat, 03 May 2025 22:29:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:53 -0700 (PDT)
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
Subject: [PATCH v4 39/40] target/arm/kvm-stub: add missing stubs
Date: Sat,  3 May 2025 22:29:13 -0700
Message-ID: <20250504052914.3525365-40-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: e5l0QXYLgQNa

Those become needed once kvm_enabled can't be known at compile time.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 4806365cdc5..34e57fab011 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -109,3 +109,13 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_cpu_pre_save(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+bool kvm_arm_cpu_post_load(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
