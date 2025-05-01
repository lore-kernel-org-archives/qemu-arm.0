Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19686njj;
        Wed, 30 Apr 2025 23:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcbvo3yNW96MP7RlavaMAlcUipUKDzBuK6VaXmJTEh6545Lr0RzfVSx75/RKmnU07D7O5N+0OphyQcAg==@linaro.org
X-Received: by 2002:a05:6a00:4b42:b0:73e:970:731 with SMTP id d2e1a72fcca58-7404924eed2mr2178676b3a.16.1746080655953;
        Wed, 30 Apr 2025 23:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080655; cv=none;
        d=google.com; s=arc-20240605;
        b=SRmTldzDGJd7i6KSj9va0uEcmo7gOWZMwm7dk+OIYfqETi+Y/Ei1WkgkoCNkKp9KDI
         sv7j/Pan9z+3b4naqxNodoerQOpw8kWplf8ffDf9+reLVazc2Jq8PGXCMazjfiSDZZ0w
         b/R6ZwVoUKuBgd5AKiBJk0PVAcy3U3fMqhPZeTlJ37bnJVHcDLBuYC5RhvgjoGxlYiSz
         eoX0bq/Ynyab59amnFY066OLqPoSE4OBp7cGXO6SeB3jD5luemQZi8jSdbX7ycqqI9pb
         Zc8L4GP6jgdYGXNb9aNmbN578UB1FZ5Ujepj98P9rR3nggOWs8KHyQFeZoz6RfXl91lu
         eYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=C6DezxTsq/qsXh84VFmp7K8Dht2SMC+Ysjj9VaUYBm4=;
        fh=yTOU8F4A2wwcY3VJ94lqpv2q4ElmApScPEc2G+kCBWQ=;
        b=UpZg361PhxUEwoFHE3Z+8rUNQoXFTIV3QvAhxcZOd4JbGPwkHcSk+mNEerqOuWeK+z
         XC5haGtO/9SthOXkz1gRYPfsn9ALaBxzCbw3LCMqlmOGTq1M5fCN2oC38wjlT8Ys4AMc
         sUNjqPn0/HkTqbP+2gwUELV78cgx6rfOj9LRwfaYBTl+heO79iPaI4CFE6DHS5TstaIa
         JbFiW4Y5jdYmam26kDRUS/DBWDYZTadSbTz9VNdW7YPRJbZKtUo1EvOkw+6/kD+T8Blg
         QeWlCFT6Tmhub5iimSo9Evn3KPfiiuDw4essslK6JncyAyySWkBAEj3gbgEGu+6uMpXy
         NTHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L5WC63jH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9dc959sor108682b3a.7.2025.04.30.23.24.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L5WC63jH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080655; x=1746685455; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6DezxTsq/qsXh84VFmp7K8Dht2SMC+Ysjj9VaUYBm4=;
        b=L5WC63jHja3U1Z00LCPRK4n7AVOog8OA5dDPUz2HJVxTt4804M2pGZlgzRA122XKDF
         RB+eTVf1cGm2pBWIuBzgEn3OTlxrrTmF2XLKZ0j082UqM3Px+H9Nc4okmf6V3M36CLYi
         KaJl7FYmb7YkOh7NDCXmgWPgE0Vbn8QSRiWJWX4+nwXlscJTvI7Q7kWROO0+5PzYCWpx
         /ByWfLEUNFkLkDUJM2lBY4uj1fEQWlYt6XpjxZsZ+reKwNSs4X7wZiKMpJb6+GFL7Xa7
         qMxJuDueMMYKrZcBlF9lvzcJb+eGioRdZk1sWUPAe8XukftEpfdsingGvLU6sTM5F8FA
         9BDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080655; x=1746685455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6DezxTsq/qsXh84VFmp7K8Dht2SMC+Ysjj9VaUYBm4=;
        b=i5bcuV5D8/p0bod83RtCEeEoUZSxBWJxEx8QBiyfxmGvlIYsFSzuehcSIj0SRDCLIY
         vyl181ywVemLR1Tm/cP9LfBFcz4mqyDFBWcRTwSO/GslVQZ2XcrzTJxJDP7OKhslqfP2
         UmPD6kTLIE+vuYo6G7EcNhYa9aI5UTfWCLdweSozDCE9BXKmv7BQRIvxIH4AEAcwehZi
         cUe80E326ALQs5epvt9rftN0sXtS8VSO3a4VOCEc36HqiXf+ZcOJOpdB8qhtwKj0L+Md
         W7MnIOZkA35FREpyEFh9qmQV0899/5H389MwvBLhkFMkRoy76JwYm31trVpz7FtNnK5h
         ZQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCVEb/023u3xFPGCgnlB52eZ43U1XBZ8sZ/gfqKP/wpbvelRQ1z5zw7hOpqx+FNoeZP8Xfv4nX7oGd9/Qw==@linaro.org
X-Gm-Message-State: AOJu0Yy2HO34v6gPwBPRki4bOhLE2X+Q1ASBSRmDC6swmvXMWBNkgS9B
	eQld29Z3QXqv7MpOS2atclwxGg6FelL8O7R3AHyRxKhgd4owNDffLz7MMB3ZSo7t3jYXx8PSPJH
	1bkE=
X-Gm-Gg: ASbGncvU2mRdrLcKvy6hVmAHvMB+WSP1I/wI+50z8aFh4H3HRdWomw2Eqlubd5s0jHO
	n6yh2AqgiLlczmfMwvqbchof9oReUeavICLdQTQ55aS7XA8ujYkqw2FYwfnCjJyeGtuynMGtJ/U
	gX8/ifHrpOlYmaMlXe9IzwvxojXugdXjzL/1vXIq4aSj95L7h4Sycu+rlRK0gMc3pJEMIHBVE7H
	3dFu0EV20dtgbNEX3KZC1aNPE8ODKGFTSThVq2pMz7/c80CtBMhEE6865+4VkHQbAhfUJaosKVz
	RiaEjgUy9fazia+h4eCUoC8O488vSRzcgbN/68bD
X-Google-Smtp-Source: AGHT+IEmLnzJSDHKNiPbTs6xdmLnJGuNIaAbjxHyHGNgoSlitEKO8yt6BGj1kETTeGFLW9EC424X6w==
X-Received: by 2002:a05:6a00:21c6:b0:73e:23bd:fb9c with SMTP id d2e1a72fcca58-7404926c836mr2286289b3a.23.1746080655598;
        Wed, 30 Apr 2025 23:24:15 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:15 -0700 (PDT)
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
Subject: [PATCH v3 27/33] target/arm/arm-powerctl: compile file once (system)
Date: Wed, 30 Apr 2025 23:23:38 -0700
Message-ID: <20250501062344.2526061-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: AUTrzjh88+Bb

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 95a2b077dd6..7db573f4a97 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
   'machine.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'arch_dump.c',
+  'arm-powerctl.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
