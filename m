Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp43031njb;
        Mon, 12 May 2025 11:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1fomxRXbLnLbzgPFZKhQLdkIfnCpIm5z+PH8Q9Wj7+7iiPF6RSIRp9YoYYWqt/OmX2agU13rVP1hlQw==@linaro.org
X-Received: by 2002:a17:903:3bc7:b0:22f:a5ff:ec67 with SMTP id d9443c01a7336-22fc8b3399cmr187332385ad.17.1747073147058;
        Mon, 12 May 2025 11:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073147; cv=none;
        d=google.com; s=arc-20240605;
        b=lnnGyYIdBY/bclTmaulgPkbxgERJUaRjZerDLPZUU6bPCwGrvUjnbrT+lZRdxMnuEQ
         DahN9Xg8oYjtFm0YWt1cxjdkRUYT0suh6y/aFwPBGrSCRY4PO3hxP2STNO59TrxRxaAn
         CIfAFoOA60Bgz692fELSmKCrWqJzAkD1uyBfdWk1m+gwSFw4iZ1oDDX11BITVU3J4sgS
         M4ClepvS66JIB41ApVYZT6OrUo3R+h3JVaIZmizSNCNpAXFSM+6+yAeFSUPTFBJUgTfz
         iKprCEhnEfxxYQ7SugnngMNrCLgWKK6gO/wfPGhDmv7D8CqGrUR+lU5Kb9I56xpK8uq3
         URkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IO5E5SNmIeDx8PW0b+RfMLgVUuAcPfL8utSgWSmdyqA=;
        fh=2j7re5O3GCIrPBkdVLgAHL7S/c0qG86Ueues+T8W2BU=;
        b=TR0dpZFbsrRiNH/E+BF5byz9m2eXhb0ox1JWUxlAsDBkLzjhUflpv1cqve8hx3Y91K
         afD6cn2RSzsimvBFSBaQE/gZbCsl6D4jp+FXImGt3+FKUhpXdeYhU1dw3vGFSyacB59V
         /JSZEC+atr+8HH6BExwk4FXFUjEHq1s8Uo1mlYc7RkUtvaH/SOum6TEp4XuAv5zilp88
         MpxvIqnT+bq8YdZKzA/3oAr3ByouKxDHkugICjy1kAtaQDnGg4JaPF8IvYqquAuVboa5
         tOuDC8c2BdRxwZC9vJCrQswAIBoBV9ObRiKSRk56G1UAxR/Ikhw6B0+n+spgtqXOdaRw
         EpiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VgrxKSra;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5827f75sor55003305ad.1.2025.05.12.11.05.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VgrxKSra;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073146; x=1747677946; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO5E5SNmIeDx8PW0b+RfMLgVUuAcPfL8utSgWSmdyqA=;
        b=VgrxKSra4vpCAePliCizDa+6OQ0PmPQ/frsrir0QQdEPZrPKKlyYgS+u4lZwlZGeT9
         8d4zxbsC8+edkcJRbkG8GXym7t7rqCKZYr7cZ8+NycA6CLvv4wGF895bCJ7/SL30u/rk
         uddVLB254eQHkqYJGEwdqJyW1yHGAV+R9EvvJSb6pE9sjhuGKwwby15JwsiDBId8QuTe
         TbZjgi8UKfhpJuTIo7Yip5BwwlXuLd5v80H7M9Cla5fqZqcgkzbgKq+cQUHoo0Tyy1Cf
         oAlb2BYQwYyyr4ihaE8nyVOGQPCHGyOyI0NqBG+K7HUq06JrzspQuYb6sV69aZStDvm2
         genQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073146; x=1747677946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IO5E5SNmIeDx8PW0b+RfMLgVUuAcPfL8utSgWSmdyqA=;
        b=FCY50wVaf7LzEuGqEp1KvnQnhhePWQtXCWu7AAXEVrDox5ZxoiCqXJQP7zWEWDdXy2
         Jv8pXfAZENlJ5XT/LBFF7wbwrM4R6RxA6wdOB7WJTnBL53tp2xBfPbRhDM6BlMCpzRgQ
         HtkbGMH2+R8Qs8yUhrJXpMLYnUttfIHzZV+H1j5ISijWzXrXDP0VLaSURc0SeQ94x/R+
         mdkw9uMWLFDjby666BocQcOpl1cJLcb6ig+q/hUrBgWBLG4RS5cRY/UqHvDfVb2QMMwu
         50SMaKAVJcKA7irrho9V1lv9NG4nUmPac0L4XFbomapTynUgDFjsvwFJS8cs/uUyOfxM
         AC0A==
X-Forwarded-Encrypted: i=1; AJvYcCWuBhwk6FYKgneRsWaX3HIhW+39cd1HF4tNHm0PkCimgjBQWcrq0I7f8qIKRwoGaujsx8Yj+vZ8bj4ZrA==@linaro.org
X-Gm-Message-State: AOJu0YzxqObUYSAFWY4cYKKJjDVQsdxsevEj00XSzJhQy1Do4ynqKxjH
	d/JJ9FuXVLPQ+yI+6gSwAm2KfoFKjR9gaZNPjkqTYyaRiWP62WNls+ASXfG2U7QXpw==
X-Gm-Gg: ASbGncusnVqx/CePEKNYn2o2llx2NSZfs2CdvEthfNXkGl6HzFu1BbFQdS1B1TmF625
	OY4TS1XclcSqqdL2Yx76La8/vmNGLVMkOxHc8Ft3OqyOweG70Js8BcbGl/+y7K6j9VGwA6b+DKM
	sKZnB+gTrqO9v3/uSSPMJSKiAhyRFsw8ukuNM7htoeYF0zQZj6tmE0oypFWLFQvGpLGZ1K10gKD
	+Tv1XaZbmTWoG3EDjDGREe7qOd8Lbgo0iCpnc2UbR3KWF7rEoMw+LK8isdiRU7E4p7NVTHZajgJ
	P8zCtTSawGTAGjJVmX5P/Jr7z0KVXeuPYxC3IUHZihUCIw5+mTA=
X-Google-Smtp-Source: AGHT+IHj+ksKGYhPnHifXirA+gi4i431YFqKs1JUn41Q6PWik4/CLP03qf1Wl3GK9Z24iyTARgkJLg==
X-Received: by 2002:a17:903:2443:b0:22f:b6cc:421e with SMTP id d9443c01a7336-22fc8b592bamr200772745ad.26.1747073146460;
        Mon, 12 May 2025 11:05:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:46 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 39/48] target/arm/tcg/vec_internal: use forward declaration for CPUARMState
Date: Mon, 12 May 2025 11:04:53 -0700
Message-ID: <20250512180502.2395029-40-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XHzp0KrrsIPD

Needed so this header can be included without requiring cpu.h.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/vec_internal.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 6b93b5aeb94..c02f9c37f83 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -22,6 +22,8 @@
 
 #include "fpu/softfloat.h"
 
+typedef struct CPUArchState CPUARMState;
+
 /*
  * Note that vector data is stored in host-endian 64-bit chunks,
  * so addressing units smaller than that needs a host-endian fixup.
-- 
2.47.2
