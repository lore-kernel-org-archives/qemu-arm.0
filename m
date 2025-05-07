Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94344njb;
        Wed, 7 May 2025 16:43:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUD3nxdMK/MA/gCFQpAu1JOEUu1BwkS1T77JZYQu4biQm2sMGCY4vEfskrRdTiYyjUF8Im6kENDNNAGZQ==@linaro.org
X-Received: by 2002:a17:903:32ce:b0:224:f12:3735 with SMTP id d9443c01a7336-22e5ecc6604mr82323835ad.31.1746661381402;
        Wed, 07 May 2025 16:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661381; cv=none;
        d=google.com; s=arc-20240605;
        b=FdShvPIP/C8Rpqy4pBB2K8HLjRzEu6b5yRHpAjDtWQuCmgArx6e/AWQ3WMIP62DFhO
         BJD2curKYHWU+qpKLD+QtvA860R9TbnPVb7Wxph6HGe5RKjQzB37VJK3flFmtp4De300
         K9g+59HSzQ7SSfUhhrr5CMSKiCztM0iv/piLwud0m9WiuUmicGltLiRxT1lNyY4WdZbi
         fhEhSSECHrLub6ms45SzGLBsOThAXPjK3Fy/GjnaBeYyFvchgTMuhxRmwhx1810rLf/J
         rrNxD5AUFqfiv7zArqerKoBumEqENiYSnjt7LPpeJDQWem69zjTupbj+FnLfIrtvhqR6
         Jz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qKk8/QkUIjT9lIUpEMWVh2Ot+bgJ9+GR50UCxP/rL4M=;
        fh=YLuFHSlWoEqiFqBb2UCeljD6IWhwLHxCSHmCqE7pjak=;
        b=RPhO6G6jRFr9bjJVUNnhp9ZRUybb/nImvCj8e4rC5WNCzetWnzvB3vRVOpQogtt2CK
         dMx9wKWivq+UuJk372m2UX1CYVsGILr17WyvpJeT4pbprrRBxHmpSmsw/mWw0EsClxG4
         nSaCZYfGFjZSDZzb+cEZVm7w3ba5pGTAKNGjGFsggQX5v88fJeQjnTrE0FLz1O1QdRaZ
         7KtuTaopHPWlQbOW8HFA10HmtwbNgzJwiBrZkXyBgX9x+Xy9WL16eRnSv91E4uJMqVoX
         tNKgRYRWVM+vB+8h4SKjQxtFhdOPJ8KBpzxvgx/OPBk9IzzNRQ4tdOFsxwRoHxPW29x8
         s+VA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uZRGFVDK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb21c86sor92825925ad.9.2025.05.07.16.43.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uZRGFVDK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661381; x=1747266181; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKk8/QkUIjT9lIUpEMWVh2Ot+bgJ9+GR50UCxP/rL4M=;
        b=uZRGFVDKh2ky9xoHWu9JQ541xp9DALomfdxpR6U/L2/JppsH70nFTME01iOYMLv5ND
         OTGaoMew+IzH0RNTP+EdfvZLnMdpgu4/b8HE9cjXtgmLruyGobOa0H9UMDyrFe6L4LnX
         jrylRpY9LIxkCY/xKsJz4x0VOxnRLKcVefeGNkLn+tIaMq8wQsI8KDmusnFhmn4/jMgp
         zg1Yp+O0Le0KgTkovhdfsceqGRIrr1LJVJBNZ5KPHDscsh59CPbO8zXMRuxERczTNWLL
         bk47kr7PEQi54b1rlsngak65upmly2SAuYiXa1T/JpsyeZy2DoK+n4VeD3GhW87Hs9x9
         FfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661381; x=1747266181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKk8/QkUIjT9lIUpEMWVh2Ot+bgJ9+GR50UCxP/rL4M=;
        b=WoC5wO+Wx8RC72kJXB67AKN1cv0F45fTNzqizlzNz24Gn6+OSl1waxIVZchdSdgsxB
         1xxiZj/nvd8vxGgXlSLmRvt+9f/03r5lvgXuFdTC5sWPNxZDep4mVQjc36xUAfX11HaO
         qtbvn2s/ZJq9nUyT8EMg9bHm8UpreiPRH6H33MRYHorfYSwiwW5z0Qa+c4+zSf6sfGnY
         uw0/NrTSyF0tshlgDxbl8aqhAIhZOMcUDJtAJem7acHxXKxa+a50KeOaCAmYI0H/eXd5
         +TgDmdqymjDO9D/F5FrxOeAAe+H/5De+YF6WuSFR0jQY6CS2EjXukMoB1lo10d+Qj9vB
         zdYw==
X-Forwarded-Encrypted: i=1; AJvYcCVcHqiPk9F2YF7vCzLSrklu+G75SaXLHuXEi3tasvWALW2H3T1f/lkiJA4hXckSwZPF/Uhrdo/Q+FCCnw==@linaro.org
X-Gm-Message-State: AOJu0Yyml9zvpVKMMmiHYD3PWR35ynZNRP64D/kCK68WHbKb8DXFX0Y9
	ZH2PoNRFamtcM/mV6lOXxsK7WB2zmC7Dqh69luwq8W2txOyBAWhjNDFR94clmo1NcuZMKupay9k
	hbGgaptih
X-Gm-Gg: ASbGncuxQluDxLVSL5mv/oXvDd5HBFCvrrlKI2jADAse/++Px9Kco/zc7xW9EvkL81Y
	TqX6GccC8tKEnJ6AgQOSuTaLpvRGFJd0FxNT9PGtNC2Y5pTsA0OcpiQ1NPDuGMPz+ft5AfpQNrS
	9tfm9wu5eWRDHrAEXzZrQvx5HPOYqD7u6CbHeVghcgjS4dmomxz2zgONb6JncwaBMYynB4tUcIw
	b6Jez6boK44i0eoPm/xy+82SgZVeOBwrgtFUpXkR23o4zfhPSkkgaEL3eR0Y3xM58bwe9ybWvgh
	l2o3/bz6opIy5xWRTWCzEuDX7w2qCn33ZVq9VIR6Nyiluadldtw=
X-Google-Smtp-Source: AGHT+IEtrmABkvFcC0wwODWJ4uGeFDWgLJSjaesR2JBWITN0CKAaHlEB2/gwVjupmJwkGzAEZulBew==
X-Received: by 2002:a17:903:2352:b0:224:93e:b5d7 with SMTP id d9443c01a7336-22e5eded337mr89643515ad.34.1746661380896;
        Wed, 07 May 2025 16:43:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:00 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 20/49] target/arm/helper: restrict include to common helpers
Date: Wed,  7 May 2025 16:42:11 -0700
Message-ID: <20250507234241.957746-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UhIaS9YZ8Ghi

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 360e6ac0f59..941fc35d24d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "exec/helper-proto.h"
 #include "exec/page-protection.h"
 #include "exec/mmap-lock.h"
 #include "qemu/main-loop.h"
@@ -35,6 +34,9 @@
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
 static void switch_mode(CPUARMState *env, int mode);
-- 
2.47.2
