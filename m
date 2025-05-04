Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756734njj;
        Sat, 3 May 2025 22:31:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxcJ+/Dhf9nPrl2JpHHPHMdK5BXuXwGLK/k2VhpD+khWpwei1MhBxvfOA6QjaRxsJvkjxp/z2Dzr445w==@linaro.org
X-Received: by 2002:a05:6a00:8d8d:b0:736:51ab:7ae1 with SMTP id d2e1a72fcca58-74058ae6607mr11490159b3a.16.1746336585112;
        Sat, 03 May 2025 22:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336585; cv=none;
        d=google.com; s=arc-20240605;
        b=AYlt+DY4lhf6cWJ05tfkwZb9Q1avWld3UNme5TchmTY3jWm85Z7LNGHjY43WS2lgHp
         8+ELj6+xG6i7X1YpwNCkogDtZsT3ShW02G8IsVXjH4m0yfeqzXyKSfmSwrTLqr1nB6DC
         ViAK16nfBbNCpe/LZTWaWuJdyAn9hwvZa+lNTf53vLWNJO71burYIl9MIJKTHFwehABm
         /tOFUl5EqwfpOgJfc19DtXrdi9BYaJwhrbSPlbwPP2G6ozV+ZDWD5KVTPn7KZ3I+udD1
         cBgNo35a0Lgp9lopr8l/zKu4sVUCpCzbO24JrcUMiE/O8xX4shc50mfKa40ZWm7fdm7E
         2YlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        fh=ho518vxYKkXTkIUYNNkOlBsUWyj1g2MTweH6dDhhbz0=;
        b=aIfKr2ZzXkhIWqeKM6pkz+AZnI2syDIMk67tcznnM3gdeTyEcImEN9zmJm42hXhyc4
         jZXuPYfAZLJfyOJJk6lP0ODk4MqS3+ILP7etTDJOcAaF9KAGFiu3q4KEENUaq0H/PEbj
         wQ64dw1+Ewv+Hi++gd+xY/okjXALhgRnibjWFz1+d7ACnB/YuBe3Dmdrpl7KGTRufVW3
         7XcUUlDI5adqLlScp4JEoNyR+GtI1vDZi1wFqtbCtbrdtQGhB1ZkHpYb8F5xb8iFeOYC
         OonMfT8BMSmwQAN6W3yvHsNKjNis+NN6QpSbSCacLCq7S3Trv4nh6/QOE7+0PZNJgjxI
         0kSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bo6Z1Bcf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e870csor3170294b3a.7.2025.05.03.22.29.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bo6Z1Bcf;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336585; x=1746941385; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=bo6Z1BcfvfLa7/dtBAqGC5Z8xQYQaID+GWhGtp2EUfbqfbvHJrWHndzU2C3z2SpN2z
         fsim30+/H6THQK8/0TFziSLZzKYX4GXqBbJrUbFqVJSsmM/+r913AZqR0QRf3EENq11z
         MHIPR1pAtDvS4O9ghboqAXt8GQPG4JjUpQHkBejVbv7SIyie4HDq2eLxD6FXnVDR96yH
         lFrh3jUA33z9YyObyOcZDBJJIrRBqyySgU02/ZJQ1/OMqZAfcFoTxYRxkGJNMbz6YwGG
         OQmpQxVkilGfuQLJl9hRvpyvQJFVQLOEU1ISX+Kf9ZbUGujVGFQybHpiucN5LULQbJMY
         fo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336585; x=1746941385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=aogUkxpItF+Z8M9J/KM9T5Ok6cvRkhdzlu6ER4KY3lT5ko2AiILapu2fFx24ZgvTNb
         +LTtUZ3b8agy82XzAfS30FDRBfk78eL0Azr6N7ziXDR/CKMEco0vN1wrWWLF1krjnTKZ
         hLC1WNGUcsMuLlkVrF1eAA3GbZ4NK6cPqOZBwLJTpNVY0fTuYPjg+AgMjxb2H5SiWEBG
         yRCqrAAM4FSUNy9f63XPLySjpAI4lcqTkVYfRlfpeb/Y+5AB+CA0DCJq0EouDcJ3eeLM
         a6PU1l9pwWV7z97KD6Z5sCh+7BznSqg+Pdm0IFx+1zhxQxG9JKg8axxuxHLTo787N960
         semQ==
X-Forwarded-Encrypted: i=1; AJvYcCXltAA5bbYHPG9cLxxMjFoYHMDpMHN99dJ1mJFwPwzW+/s6F8rq4KMSNkaVpCBEth5d0cZggNDM4M0yZQ==@linaro.org
X-Gm-Message-State: AOJu0YwxZrVSfSpwYD+ypXrfQoyMPLm4svJtT2n6MoM2or+xJytSqH0T
	OXuJvA2xaGglmWQG1uetpr9xhrGMsFzUwoI3Xns5BkVapg7kS48T0Na0bfMqxikrSg==
X-Gm-Gg: ASbGncuIJc0zBeMzUNJZX9OkyvM0cqiZM1h1kmTsJA06jAhHedaofzLAQf4h4mE+OxJ
	ul5sxPDByTi7S50zBYVHodLnOwhfc4dsSujVY68J36rFYULfOYSIBwkDl1fBcAgcfNy2c78Fl8y
	3aexgAYcQLMfbwL/OAbcZVXQoid/tV+gJ6ESRF83iYx6UbzzHyA36LKVGCxRChfp/SDHPFuMX5H
	3DBmZHvWGElH5DSm9emhomHWhzY/GxzqVPPIGx89t/21SiwTsx33lnNa1ug0nv4WvHoDH+Ek+N4
	6KzhBb5wCJYJ8mxYJKNcmEDpdHWOjfVUy/a5kaMi
X-Google-Smtp-Source: AGHT+IF9bJqlPmghjDpbd8Zl1EC77NJasNz3fJ6npNVxR0Z+1P+76zRrAVulXFYymz8tcW1RA4zs4g==
X-Received: by 2002:a05:6a20:3d85:b0:1f5:77bd:ecbc with SMTP id adf61e73a8af0-20cde951f95mr12471654637.16.1746336584651;
        Sat, 03 May 2025 22:29:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:44 -0700 (PDT)
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
Subject: [PATCH v4 28/40] target/arm/arch_dump: compile file once (system)
Date: Sat,  3 May 2025 22:29:02 -0700
Message-ID: <20250504052914.3525365-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WsROLp00zPrL

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 06d479570e2..95a2b077dd6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arch_dump.c',
   'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
+  'arch_dump.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
