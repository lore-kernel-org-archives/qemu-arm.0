Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19721njj;
        Wed, 30 Apr 2025 23:24:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUa8s3Udfk1ESuuvWQS6xVanx5Xi5B5f3X6SChtXRKSilLxSDlSAw371lMWfAJfb3ZTNMQ0On7tLrWKKA==@linaro.org
X-Received: by 2002:a05:6a00:3a0b:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-740491afb06mr1775674b3a.10.1746080660384;
        Wed, 30 Apr 2025 23:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080660; cv=none;
        d=google.com; s=arc-20240605;
        b=S+6lSN85JKV2kxn+/lSbdiTXXI0nvatlMIEFrZppydY9Oi/7huFCAmyTDM+RPVLl0t
         nxZZbi9/2CaOhZEsgojHhQrbWj5ZZnyhkSCHz/Od/EpQfVEjAluZdcqmVDZLSrUWSKj/
         scz+1fbp8V/3QUnqdAEbiGYjABwNBPdkiDSe+WeZdI0IHajjbE4UCx+uaZI8Tm3NU16N
         YBkeZqxgzZJv7C/6HgqEVanv6D/6N5DOVpPu/GHx8SBMzyGh8huViu4fcCz2KNbHHAVw
         9b/rdUVnt64L1wKF4tQbS6LYYcNhpQx8zyi4++zmpJJhsgEu9kh1IQDpElwDfUp5k8zY
         22eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kyqibr5WTwLzvCspC/7bIausnrARYT0xJa7lj0PHF3Y=;
        fh=3+Bs9AyvXClCsFy6WXgJb8Gcre8c4hiHMe8LwaSvnLY=;
        b=hdD31+QHequSUbGz+YWR/XN+TqA8P7i937qGDZfVJnfq2BJ9oeYDtJc8B5TUzqsvm2
         fTGVCBSMiCY5od5nL7D7ryI9J5/OBkJLwbAXaQVX2rs/irehaAOwb8cyJQG9wWWNHeRh
         mzJwo5PrTOB9uya5D3R0+RKnP2pzbx/tS/lVD3fLJ1FmeRFlDaXF45k5Cwm3mcWQGqaO
         /Mc2L+U6n+R0SsIHS7CmL8WfYBb00+gcMaL589Ju5IOq9VIp7QeMxpd/EJux82ir6bTj
         1ye1Di59DS833G11nA+G00XZrHXUPZtKDno5ly7zT5hmPw89V3H+BwWQnvRcOpXY9qRe
         5zgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EIat1xQr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e870csor60105b3a.7.2025.04.30.23.24.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EIat1xQr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080660; x=1746685460; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyqibr5WTwLzvCspC/7bIausnrARYT0xJa7lj0PHF3Y=;
        b=EIat1xQrT/c0Ju/ZdPSUmmvCU7Ize4saiZa479CFQhNzbnsA34U9HyOouBcmf3qIff
         heTuPc+iJAcUaoiwtYGiLAm8opvPMWdIexmUShRIr1gU+jGByBhkYjHmM1R0CBM558GP
         GSp+u7sSpDi9QJDQbVuK9gYSTgCpywtqaBibF49/Qkyu8IoTHtFdwCA9MD8GHU2TAct/
         mnrVQxSHFwoAA8xka4GI9Cgx7rio2i6Uh696V3nkmUJezAicetbJNr3DJwqWyYnInyFa
         6bTZx7e4jw0tcwwq3Z+BTWBfxY1y5C4OUkEayK2Q5sB4x9QODRYrF1qC/T8CtScQjzHS
         euDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080660; x=1746685460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyqibr5WTwLzvCspC/7bIausnrARYT0xJa7lj0PHF3Y=;
        b=vJZtzF/f38TMd7wA6g2bJBZupjcnOla8DKlNtDDvPXoV8FTX1asCewDEHxbFYylslI
         Nw+/tGD4YNYkpD31hMMY41M2Ae/CEKf/4ZBxxSW3O5Hrt8Dit4lzleEf/3eN2xGwxSHo
         nja02Nas1Op7/gIdwSiRGyNx3Y/d2NGGuaBBNb64bFVaWcmmFUgu+BVbK0IXmIFuj2JS
         y54qNpssSLj0p665mr4IlFDpOIbgk3Yo+3UqTSpqvm68rf84ErMG9qjMHHvt1cdvUFWu
         XfbcfiERFJFAVThWt3VrKawOFcfXzDo0vqK4BtH7nHCI0gTkmauzKj3YiZ1UuGGvT+8t
         npEg==
X-Forwarded-Encrypted: i=1; AJvYcCUXK1Ne3eCCs309B+S3GlvPEkGgdylqGSXdfPEQnY4pTpPN8aLmKUeDULQ5P+GfQ9KWU4zn/+TvWOtOSg==@linaro.org
X-Gm-Message-State: AOJu0Yzz/LTiclfiCB1AeRQ/72dabOZbIDbyhNFO6MsRT8lBOq45fPEj
	DurCc7c3Cvfc7CVxU1Rs1cpVK2Z8NZfn75meErSv9j7a3/PmEbHVR08wOvdgRPyyJQ==
X-Gm-Gg: ASbGnctZQnOAPUBpXSFKUlUzpWUEzjylI64+hA3udreLjqV7TIBqc7St7lTPHkIuSzK
	UfLisRUxw9ZAs/qYym9Uhh430LR8kUWQaR4xn+RNrESGzuGpSZGMnXsf8c9mLn69UJLCu8JtfL1
	YhU8vDbcMk9MrW7l0KWgllBXdRWNs4Tfyi6hae4N5sgdR7Yn1cXhrfl2U6RAHnIHD+2eNAiR1Fo
	CzfLTjAh5nY227pdpGIxh8Rv/xHSrWc+26hu0oolYzfObtVJsi/VoqnBV7ZVP1zI9+nmX8cQVIb
	GmU0TIxrCjOg1Sq0/Mv+k6flGrHNohO5DJ2ONzSA
X-Google-Smtp-Source: AGHT+IGOIfzA8NxqRXdsP35Dd5N84asOZwmvhx3Jb02bYWpAaIstZgl+JozJSaaWgqMUtX5FhbNeUA==
X-Received: by 2002:a05:6a21:a4ca:b0:1fe:9537:84a0 with SMTP id adf61e73a8af0-20bd6d3c490mr1900241637.15.1746080659993;
        Wed, 30 Apr 2025 23:24:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:19 -0700 (PDT)
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
Subject: [PATCH v3 32/33] target/arm/meson: accelerator files are not needed in user mode
Date: Wed, 30 Apr 2025 23:23:43 -0700
Message-ID: <20250501062344.2526061-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Fbwrhc/5D9OQ

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 151184da71c..29a36fb3c5e 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -5,9 +5,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
-arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c'))
@@ -18,6 +15,8 @@ arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
 ))
+arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
+arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
-- 
2.47.2
