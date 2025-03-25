Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397081njc;
        Mon, 24 Mar 2025 21:59:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUWSXiBWUYDbY3u/t9pU45nN5PJ1Q2ZJ2OiUXOybeI/Ll1Ly0qJhNqqR8pwsm7FMH+1sqOJ9/wWNrt2Ig==@linaro.org
X-Received: by 2002:a17:902:f605:b0:220:c911:3f60 with SMTP id d9443c01a7336-22780e262c6mr247424205ad.47.1742878779216;
        Mon, 24 Mar 2025 21:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878779; cv=none;
        d=google.com; s=arc-20240605;
        b=YfvWBsHC/9MSnPHoDJgIcpKmRrL3XXdGtfU5U2r2nzUShogk+0oS4kGx2FPFs9sFB/
         s2FQ6Zl/pjXbLwsOXAr4FFOve+jE9QeyHlSw1+t2a/9hMAuKycYFPiz2mIWjaDe23dIe
         0gtrlfKg5Opi5o0zU4f9z/NjOFuJolgO8VbVowPHtY75cI/e9aNBMOGpxU3T+aXWxEKJ
         Obiv3r9YPmAp+vPU4f8hauiE3oHD76vO1fLGcpzFdIVEIe1S8x7/rAqnvv8YNSU4dcN6
         NYPjpffKRPPJMKShQlWf8eHftAi8bs/jZzcPAq1u9JdObGukcb7sjf5zWRNjxERXwZnX
         aOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wVYa7fx+hqBI4AoRMYooEEzjwHkUuA977fGAq/tYFYA=;
        fh=nmQm+zNmZrMAcN1mqaLAXzZfcWiMhuUNiYHS/hUz8zU=;
        b=PDO8zzWAPoxIGz01nCTaPnoCyg1iAg8xn9fmlM8lsXk2DkNfo9mVQHHyNrYYbbgAng
         0mmkjAJJPO1UfFkMP5FCCRPLXwIDjgfiPw2jtErXtSS8zK0PQeUNpPT9nk+fO5ztUKJr
         MnDRJAxJ4KRIfqcTWZRF7DkMicWuAd3zSLeWPUhglgZyVm4027a3znv020pq6YTkDjsD
         5fLj1eMaqLpo9GUi6veyiAvWG6XtpeTO2cdbei6YMKl6NWxsbNjgSGmE/Z+iqXo2dEcl
         NmwcUcahfulve+v3YsrS7Hishd6fKc/r3Cp0cU0JA6JYsBs7kHxoR8k3SxPyKooa9UHC
         kCGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qp2JdRT6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f03230sor60483525ad.5.2025.03.24.21.59.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qp2JdRT6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878779; x=1743483579; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVYa7fx+hqBI4AoRMYooEEzjwHkUuA977fGAq/tYFYA=;
        b=Qp2JdRT6ZprhcBw2tlsu6ZTnk5dZG0osKUTzguQIQntRNnyu3WKgw/9dUvHjyL1UxA
         aasKFER7B5VqcQjR+zRnK15nGWJb7Z2pARCCbxrPvNT7ZGP9tHp4KxIUmGZPZGGMQBcf
         Eswxm82M7uiewlY0iKIIKMgs2T5A6P4RafLjxzTNVo8lmzzy5Rzc1yJXPoVPkoOCgtnW
         xF+vnsA7skUa5tgTcKMOqOpSDe9ZDcARXxs6Y9XagA1q8CCtVyvwhGJ0BEqy6XYHskT5
         R5KXMQQHylkFC5XoERpEaPQghalVGyxv9rtS+GnWheSNlcTJXPDYYLzrMnjri/PZmIp4
         Apwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878779; x=1743483579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVYa7fx+hqBI4AoRMYooEEzjwHkUuA977fGAq/tYFYA=;
        b=ZyI/r3hMP5963piEMQp4daR5wuTWyadSJMKDLYuMxvMDiuZs9qDlyVw71SNNi43O6J
         Smujgn1G+EBffKp/B2wtWbbD85zZIhwSPffTrVyx6ztqcUy5l4xh3W5cKwvP0tlqP/eA
         4DgAVVP/CF9040wJanUKdvcaLgFZmhdN0tRAXDENrhoBo1dNOubMbMjlAWTYZExYm2wD
         XyJyBmW5va9e2YTaGDkolM5EPdqIPW3l/i+Xw0sqQ/lW5gCiKWWN2xhwqmaC5UHLd5hD
         zCg3ZFGZXOSlVjAFDEno8kTXuFxl44w/2DY/k2RDvSUeMV4obkLo6+CF2yVidLVbV5kv
         vCIw==
X-Forwarded-Encrypted: i=1; AJvYcCXI3A5Dj21xjD7zsWtYZ+tXWm760zQFD7cPKRxfi2uKuXZZYEiB4av6uNw77iQZ7outEZgi8btrurNcVw==@linaro.org
X-Gm-Message-State: AOJu0Yx2eJdbRifI1IIkSisiVjW3LrSlZfPhE0WT1AZtdsrgwohVITyz
	BBPy0mQw1UWXYAlmn01fwmRj2SHTtjtp6xhFHO3Q2StxJwHLnIKpu9he2zv1bykAiQ==
X-Gm-Gg: ASbGnct8691VrZvi8EOGq1dwomCIwuLWDaUYayd4FfcuvIQ5r8ZXGQE44sR7r2MXuG5
	IRoe0zaAVs+1UxDhFPvudyl/4dqqFlC2BJBebyey1hq0p/BH95BO9+m1ukT5kES/ytG9ru0rRdG
	Udx263rUVnajWfCpwhtb8W8J99XHAwzPKBWzV4cgOm+PYU/hfnzIb8U7XV+QVvRwwUs1VV/nj0Z
	3Cuj8QrAi6Ej0QyZYTAHnivh31y1buhHvTxKGADK1P3d1Lr4rq2DWHsNgqh/y9c0DVaLO18nQh9
	HDk/f4fnHWH4TYKxlTpzmCEUORBFhcBuhZcOc9BSoz5Z
X-Google-Smtp-Source: AGHT+IFQAPoKluqA11lspPIcUM+K4oeubg7R44UKiLeIG8htmcgA7CTFmMh6CBhixpXbl9nw4lJFrA==
X-Received: by 2002:a17:90b:35c7:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-3030fea53b6mr23779109a91.20.1742878778703;
        Mon, 24 Mar 2025 21:59:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:38 -0700 (PDT)
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
Subject: [PATCH v3 18/29] exec/poison: KVM_HAVE_MCE_INJECTION can now be poisoned
Date: Mon, 24 Mar 2025 21:59:03 -0700
Message-Id: <20250325045915.994760-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qxzwAHJH8iQR

We prevent common code to use this define by mistake.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/poison.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index f267da60838..a09e0c12631 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -73,4 +73,6 @@
 #pragma GCC poison CONFIG_SOFTMMU
 #endif
 
+#pragma GCC poison KVM_HAVE_MCE_INJECTION
+
 #endif
-- 
2.39.5
