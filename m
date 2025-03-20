Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279154njc;
        Thu, 20 Mar 2025 15:30:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgYEbaTehAvOlUN1nJ3dvBLsS9asO0rJl/G62LtNv9iESpgt8Jl59UKjsr7pEl+NCLaNC1xwawihMZbA==@linaro.org
X-Received: by 2002:a17:902:d4c7:b0:221:7b4a:476c with SMTP id d9443c01a7336-22780d80176mr12024315ad.18.1742509840192;
        Thu, 20 Mar 2025 15:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509840; cv=none;
        d=google.com; s=arc-20240605;
        b=PkRAK7X9xHZpTJzMbKBDZ0tvEOsZNugAAx6ctrYEHAVlvqqZmafAejzyy+GybLaXJ2
         rx4Ujossq4ZHDH465G0YdThPfa/3aDf9S2Bo2b5/Xs8itgy3DN62Dd+yNGHA04Bg0a5t
         o8uwBBmfrDAktF9h0KgaFeZyYEyiCS50EdaMB5/3QacOPInR6kqEmvu7cZVCVgWVTL9X
         1lAglzz6jLW0RxeNR4l9kG4Ay7XUFNIc7alObZHWEr7SCalK1qP0t472gwqx8xkECB36
         m1heifkjWkgz52NCK5OGY2xpzaaO+amJUJbNd48BNBLxcEWYhPrERe0iZ5/P7thIxdln
         ATwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jHEF58QYUX/sH/f2D4AiJ/KV1+OKbOaRN8ddf0N58IU=;
        fh=LsEVfPoC5iGKV/YFKcbT/vJ6WYnx5/2rxJ3XKka/RGk=;
        b=Zw/eQzEsRKuuL1y7LpcSatB5lsYWNn5bI2JEYaD2W3m5Bji53/kbS3SF9YiQCvMf7Q
         KRbw4OjcP/0k2lx19SMoagmqFXKd7V6PvO1g/u6GJgQ5hOHSo4e2iLqJnOg/EzEuuwXl
         vzIxHdNZ291mU/cwt/MNUx0Mi5agsxqTFlGUbb9YuKNRyDckPfSPqpUF+5lR7E2tClxK
         1wd7F74mSJEW/rH0NXPVN8hcJwlTgrNKSd3etTyY0GCctSUN2tzrAfu9GaIszT9oK2a6
         1pdg8JoCvZEBej4gTCiIBxsOctzvF9os6Pmas3fy1ioqpMpKrvrlRUhGooVQ7ma7fYk0
         vVxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FJRMbWnm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f75b7fsor3428865ad.13.2025.03.20.15.30.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FJRMbWnm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509840; x=1743114640; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHEF58QYUX/sH/f2D4AiJ/KV1+OKbOaRN8ddf0N58IU=;
        b=FJRMbWnme6BXUa6mHPwqZ3b5AUlY+6CPNYuB+pkNWKUI8cHS0mq2c54jaxUmkTE836
         zReqobzOc/cUpKzOrcFrRN17JHfJp0xjU98BK/PRZ7UQKwmsUXZzcK9rmW1cdhQREOcH
         GeA+7vnh6tNglkeHnec/vTeeWTXLvUtJTOvfec4FK5O8xBcChWFmwtJxLmRfoPKgUQuT
         v1bMr3NwaeD/rzCu5Xb0UxbFPq0pMAcTlOJnZ5lgonwix4besEMQl4Q+NJr/C8Im81ld
         QuyuDzblK3287/klfOjlKGL7+BzZZ1s3D2p/49vBPH2gw0m4+LQRD461gTVKqUlWD94K
         ZAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509840; x=1743114640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHEF58QYUX/sH/f2D4AiJ/KV1+OKbOaRN8ddf0N58IU=;
        b=XJCNTxwX1cvfgRjSIPeJ+9v0qwdH5ZXdv6/6sg2Rli5GjtMu0WqJ0jnXJfEQOsLA8j
         n7v113xB/SscWZZwp9LV3nlVbvZuqfsKOuxz77W31lyzQiVpEdUro+/rj0MZd6a1PyuM
         W8q9CnFgoYp6d96bOOyDtacfV1eHaOQUimKvPjAV2zaxwr7bTOd+yX3EJRFE8zwD5GTf
         XC1sDi/e61k6TmUEhWcQFNHG92c3oAz0n7rxDZDCEcdtEyWAz7TIczqDFNKSEK9gev8/
         r0lq+arv7AKHsU6iW+EZM2OMVfGkdis506KkD94AlMJeqLZn7Dc4iRGpGwyrWKaMFXqH
         GR3g==
X-Forwarded-Encrypted: i=1; AJvYcCXqhjYD01oqNadYjMjmtHR7Lv29+6WAn98UaXWq+LgVpSX86XOZ9b+nfp5yp5zRGddDVhEvvDLNlt2D4g==@linaro.org
X-Gm-Message-State: AOJu0Yzaay1RirhoGNboHTbNAciWutf3GOiJBHwGorGZkisAA4ED0Kx3
	Q9RA5c+rbdQqJE3HymC9k9foy4tXqsf4Li8E5UtdjgmcBUl6PUuLzb3VfY1Bl0n0dg==
X-Gm-Gg: ASbGncsfLZf+unrkWfd2BKY0+XbgU9CM9j7FdihnV0BpjFOcKl44vMbMX3ZWXL8cX+h
	P6dkoGxjY9vuxHbElSgXd+ScCe3vxwa4mlnCfUK/cL+aT/uXBxli4rsiTj6z4275ini+T8v75nq
	Mw2XCcp46/OE94W+hRX7NylXQrFNrOvRr9RC+P4GNOwCETljiP+lV+DBGZjBcrQoi1VxfnIQIKF
	PkDeLHUlgrece+WZSBfMXDXitDbQmnpJV79f5shxhlJw9+R1X33r6YOHo/wTt7Fk4eFWRDF0oOR
	rw0BMtGmNMImg7Bsi3FcYfSbL516FOvr+gAGt4I1GYA9
X-Google-Smtp-Source: AGHT+IGSwMvnVIjoOPD494sxH4RGx3NXLi4VEGe0c2kLzhohOrnkSN5SNch8m4i9VjXaZXHDGWWEXQ==
X-Received: by 2002:a17:902:cec4:b0:219:e4b0:4286 with SMTP id d9443c01a7336-22780db462fmr15563735ad.29.1742509839708;
        Thu, 20 Mar 2025 15:30:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:39 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 29/30] hw/arm/xlnx-versal: prepare compilation unit to be common
Date: Thu, 20 Mar 2025 15:30:01 -0700
Message-Id: <20250320223002.2915728-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nALHspcGsn3t

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/xlnx-versal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 278545a3f7b..f0b383b29ee 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -17,9 +17,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "system/system.h"
-#include "system/kvm.h"
 #include "hw/arm/boot.h"
-#include "kvm_arm.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/xlnx-versal.h"
 #include "qemu/log.h"
-- 
2.39.5
