Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397142njc;
        Mon, 24 Mar 2025 21:59:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEWS7zlpDQkfapHqwUjmdMFXlg/jH4NHsuVlNwIb3ZYNFj7B1g5EYqS6a91ZZOPKrXc23oxUqR9KSopQ==@linaro.org
X-Received: by 2002:a17:90b:5105:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-3030fea47e8mr26725123a91.10.1742878785196;
        Mon, 24 Mar 2025 21:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878785; cv=none;
        d=google.com; s=arc-20240605;
        b=aGzSEvYCuqDJT1TxnBhwGhuDZjglUk5cMVTRIz3RSaVX2eBmkH+WNJQR/KvhCd2q4J
         pTVXalK+aA91555I2odRRHqyqVTCT6ZLh8Ggv0Ma31Fx6ipNzVpV6m6bIyWz2lSFH0sJ
         ICqAw38JdD2+eRytiPym4qCqeulNG5IEDnc0SyIb6BS61p8a8Gzr3tZ7xj77B4uvptrQ
         jpVWuRLnwl8HfgLANkyv6h7+o1NxCfeQLZPu/hbV2/O0GLhlDQy8KDnw2JelTO0Y5jqD
         hINsu4dHt0Q9l2/QGJ1cl/tVI9kK9ODID7ke3xGX4zhMEgYXveNBiWNzIm6G5gNS/C4Z
         u5JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZFUKmZL89sYZSB0AC07VWMO1RZJQlXSAYHwQi6w+77U=;
        fh=EzO3kSfDsul20e0nU1tzx1YM6WzEBNC+Bg1pifaN9NY=;
        b=j+YmO2C+2ebaPLHNGnvsqyDJtmqi7qJAjjrr3a21jcIiBc8lZyn/sLIFfHO8m0yMVo
         Kmo/RQtp8vxpSYYUo0/pGjUX2MtRWQLAFL9VPbnDX3c4Np4ujWz/r3NVWcV/HIY3qhXX
         elgC7XaTivYM37rWT8nOJNiKDUEb8fC3sgD8AoWyLFsAm84tHZlfPUQ1pXJ8aX2Aqmjh
         F8bRoH9BXIC5y/rZUEWE+4whZO+X9LZkRpKpp2rrI0Ml3xIor0mXFjKgLg8cuu9py38c
         lTe1HKaEhXwm5lrM1tBiyh4hym3wb2Ua1irwdt76gSXqEdhCbiOplutuJ1aR+O1Soh50
         0ocA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rXjw7gk5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3030f659779sor6435159a91.3.2025.03.24.21.59.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rXjw7gk5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878785; x=1743483585; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFUKmZL89sYZSB0AC07VWMO1RZJQlXSAYHwQi6w+77U=;
        b=rXjw7gk5n2UGfIkk9cSSC0vNlynxFo4TUKR6r/02/4HU/t+9/Tz4m9HDKM3fnq3A9s
         Tbpno1jurE9QYw2GiFk7RFv8HHo4g7nsGExrZ7BuChJtF1rUSrGKE37DRogp7Snrylvr
         18WsElaCFhyqXteWOSnU8cOqmhWMyoxMUynGmwPzHsjD3czmiskyrGYCdVet06WPDWkV
         dhXfVYta/EtEjjCC0dyZO23uR+moGea3gPLNtKQdkoFmsIczKmGv9TeW6ogXMIzpxBxA
         fRqOZFoNKXf9LQqHnF+J25z06prBQZtCZTDVkDHtvAp2oiw7tmdu7HxdqqQYKXFrC8oY
         Fbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878785; x=1743483585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFUKmZL89sYZSB0AC07VWMO1RZJQlXSAYHwQi6w+77U=;
        b=J2ko0LcFDUOYJEgjzdJbGtFmwqnTR6g/D4nNzB2Mze4j/I74xG9Q9+KuGskMcD73bM
         CKOcU148Y7EnOQ4H2o3tHzfgcqjL8msHF7N0ihMWMQFHJ1RmbPMgtuXY4BQA3zSx5YSO
         pQrJYGELWQeh5vhGxdFB42wflN0uFfDgQDXjA/2WUcpZQvgs7sITae9ONaWGNiL0rAen
         6sv90Qv9ru6XeYCTNKn/7fRQwCuuPoPjxFfpyMTapzkDyx1Vo9QfNq/NY2uTJfBkRw8F
         mnjgCTQh0NAcP2eUBc84/UeNZaE457PTuTqnqg87TyEw2CH5Q9bjuXTzlQD1nFTlILCI
         Yzrw==
X-Forwarded-Encrypted: i=1; AJvYcCVsRnU/hPa2jtsB9/u5QJPpjeHdNyU4G7ZD2kr5RA3aQzQOlvFi0rituP8FgLkhvGBcP7gU64YXT007PA==@linaro.org
X-Gm-Message-State: AOJu0YyTrC0RRYAZBzfNZ429u7oJ4jrGooIlNs/qhkOCtfmQ4YSNHKBQ
	E/gPaA8A6nHQ10PCD5Zvmk35U+uaqr/33Ak6Mv8m4dRKWJgQeyC05/H9Bpl4VJ3unQ==
X-Gm-Gg: ASbGncuJX536sX9rU7CwzhJC2OcQqKPHwMv9Ip/Ryure2r+oUtjlvYTWWKZeRMyuaBr
	OTSqWensm9maeRAyfvPMVjFkqIIN5xBvIFV7WsQuinZ0LatbAthGQ9XKDBySgmME+mQQSN/VqPL
	CMEgIJZ80Cp26AeLvv7WRD5VIgCyGkGUvCmau9aKvJndaOadYiZBKgq9VkBA3f08SpdidtVRBLt
	o5eSyrALhuxUEUovZT2aswK2IahnieRbETgvyazxL6/on+S1vgJWcGhxS5YTukFz24QNfjOUteP
	v5TcjUxO4IE5YBOtJqK2lnN6M1C+5PbHfSp9968hGuUo
X-Google-Smtp-Source: AGHT+IGzn0ZGA2yyhJM9CpgiHL9SBWuGcmvmqiHcbR5yuPfCRFgOow8H3weAwCmoy8McjCHWxqFWgA==
X-Received: by 2002:a17:90b:2747:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-3030ff10879mr26301744a91.24.1742878784581;
        Mon, 24 Mar 2025 21:59:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:44 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 24/29] hw/arm/boot: make compilation unit hw common
Date: Mon, 24 Mar 2025 21:59:09 -0700
Message-Id: <20250325045915.994760-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fTTdyWORXj0K

Now we eliminated poisoned identifiers from headers, this file can now
be compiled once for all arm targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/boot.c      | 1 +
 hw/arm/meson.build | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d3811b896fd..f94b940bc31 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -14,6 +14,7 @@
 #include <libfdt.h>
 #include "hw/arm/boot.h"
 #include "hw/arm/linux-boot-if.h"
+#include "cpu.h"
 #include "exec/target_page.h"
 #include "system/kvm.h"
 #include "system/tcg.h"
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index ac473ce7cda..9e8c96059eb 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,5 +1,5 @@
 arm_ss = ss.source_set()
-arm_ss.add(files('boot.c'))
+arm_common_ss = ss.source_set()
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
@@ -75,4 +75,7 @@ system_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 system_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 system_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 
+arm_common_ss.add(fdt, files('boot.c'))
+
 hw_arch += {'arm': arm_ss}
+hw_common_arch += {'arm': arm_common_ss}
-- 
2.39.5
