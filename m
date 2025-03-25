Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397087njc;
        Mon, 24 Mar 2025 21:59:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXE7CaL5fC8BRE+xqXnjH2cVbrJUC1U+9J8S4sbS/F5s17hwRYhep7JnrpdCOTQFp3uN4VbEFNuGj2RQ==@linaro.org
X-Received: by 2002:a05:6a20:d497:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-1fe43477bdcmr26960521637.40.1742878780096;
        Mon, 24 Mar 2025 21:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878780; cv=none;
        d=google.com; s=arc-20240605;
        b=HPjyesMDyMVOFNmCnVH0mnX6CjHstlJGgRNTw0APr9kGfibLzs7KN2/JllWhcoHSq/
         ayli7WHCuMM8DCJpwbd/EWvDAchUAmTfxXRj7s3zo0o3R3phpHe6BNuddvuOB8XtmZfd
         uf+UkzRnqwQ9rIspwV6NS3NPoN3F26/bGSr35fcvDRTPHSuP+3DE9JTbbKPlrBuYK6xN
         rJLvBNWqaqsth9XLaEFUHGj0M78RNxs6NhuyLw9ZX+tsiINVenBLmPCwf7zKpqUKonig
         v5I87zl3SKwr3oh26Jdoqo5n8eZdS85qCO1esBTHmEx0Y44qzl9l77uaBPv9n+ylea31
         MSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4+5iQ3rOTBSPEFMTgcjt+dky/l4beaGAM9ptuF8lc/c=;
        fh=o/bV6FA52K/gXhHzF1x037KyREl6Eyfwk7ol/+MzPQs=;
        b=X8aE/1eHptc1v14VT4+AuMDG25jROi+jCmVJ4mnx7+Lx5+MLaysrmOxWaMdwgSmhYJ
         A5MQoj8svOVOpfWoAq5xxTYjg2IB4cTT+n+hVwC0fTqVuDGqrgYJT6vAZ9hYC7iTYy6z
         7ynb4dGvNUEFEwUQ1UqIPefqWxMF7q7FBgVWcxIiw9Cmr66uiN2W71wxq9AhcS9fgRnr
         XA2BkP69s0vVPOz2/j1aJdzqGOe1x5alGdyYtwuJKq5fCh8ejLHVzy3BzQbInqS0GIn9
         nluykrXUxv1q+Vjb5Jm0tc+5mcMSVvBRnLq1cy7Lfa/Tgefhn8JLbw2Wh0SUEe7jKXL+
         HSUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mB10jd7/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-af8a2a4e77esor4920627a12.7.2025.03.24.21.59.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mB10jd7/";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878780; x=1743483580; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+5iQ3rOTBSPEFMTgcjt+dky/l4beaGAM9ptuF8lc/c=;
        b=mB10jd7/Rzj3Qlhk7cjkG0mbH1SlYGxnbMatsZNgKojZVrtk1qa9XHqmzhYGU7N35d
         BmoDSLnA6+cZYm2+mNi/mRcCc53ETXxTHdApYZhxsGm4zx40XcesB0aSzoXIXSIpvYBf
         mhqJWsrJdk++UmJEm/6HAOjvnCbv86bFbVBHBfMoljJPrHnjIQSb+OA0ICBaHO93Xldm
         O7+QEoxM9rj11flVKRqrVdUaIq7hPybDThprYTt7v96BgQZAkyDtMIZ/bfrPiRjQZQFo
         qwYtxsCdKr2HdArGRj6bFjemAyt943vAzvhGTYUhLtFq9lz+zVnJeyBi1TFmYHf/GU0/
         WpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878780; x=1743483580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+5iQ3rOTBSPEFMTgcjt+dky/l4beaGAM9ptuF8lc/c=;
        b=NjHDRboSItT8dZ0T3TfMyP/Bku4WQUoJ/DvLMDkoNNGh/qIBiEcFojlRgJ/MYvKic1
         Ka3HkucaqgCx7RHi1evEojx7y/wQ0Xyx7iv5Qp7iVg8NyvRAJOOGDvIC3anZfbYObSmz
         GCeNqJIbZ23h0Y3uEmhDRLBlij57RSIx6MF+VzqND/Azvzou37xZ2GPlrlesEPzy/yZ+
         Bz4mcXgEFA2iHZ2Ax5Dv6Vut7yJJJmtZLIocxmpk18DQBM8/iC+JjddYES/xjopN0PT8
         pttEOAkxXKBHciJnOaksgXfWcqfjsTjgD228agyjyHsm2YnlvcprYKzFoozKe1aCk34x
         CBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwg1AtLnxkxMPPFIS4WIxBG0NTy/F24uAJ6X4jRi5KKnO0j+onAUf9wuVgII7VknGU1RkQ2EM2e9yTqA==@linaro.org
X-Gm-Message-State: AOJu0YwWwc0iFXuF1H2QfLlyLVhQQ3jCLmR7cJN86SW1WE59gQqGP9PY
	9IIpM9GLjs82zT7SsJ98cGL7iaBeYNz+LQvbEgxE99yMUUbiEgGvFMia+yEyalhbpQ==
X-Gm-Gg: ASbGncsuAAsLDhfYMQkVICZBqKsJ1zjo0/PJz+VHnRvSYOCqmzwj8+jzY7gvo9QG0st
	ar6Uk2QtZjEx0RgnkXkCBp2kZez/hEoXTRe3lGdD5ssqSnrgxUhF3vSZH5wSeE9qDmYBZYRAr/s
	nWZILZAlCU8N3FVBsr1Ptv3vDWptIJ571WKw3Mn/ubukFzq6V1DfRRbKmnMG8Q09nzRcO+fWJ9N
	WICCAqgNcAPZxuO2x64MwzdZ+k+wPnCvtycAvUkm4PMYaWHBjIcF/q7mvctydJIf8owH82ppTBd
	dQsnEOyg8P4iEk/0OntoRfOsAsQf9QcMDYF90WrG7g6/0GZ6cTpoM+8=
X-Google-Smtp-Source: AGHT+IF9WVopZDKCf5Wmew5zTPELxpFqytptelvRItKxrWFJ/xOYMD7CXHGJsHww4nAXXVInApX4MA==
X-Received: by 2002:a17:90b:2647:b0:301:c5cb:7b13 with SMTP id 98e67ed59e1d1-3030fe552f1mr22108739a91.3.1742878779554;
        Mon, 24 Mar 2025 21:59:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:39 -0700 (PDT)
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
Subject: [PATCH v3 19/29] target/arm/cpu: always define kvm related registers
Date: Mon, 24 Mar 2025 21:59:04 -0700
Message-Id: <20250325045915.994760-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uHcysnKnS1u7

This does not hurt, even if they are not used.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8a1a8faf6b..ab7412772bc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -971,7 +971,6 @@ struct ArchCPU {
      */
     uint32_t kvm_target;
 
-#ifdef CONFIG_KVM
     /* KVM init features for this CPU */
     uint32_t kvm_init_features[7];
 
@@ -984,7 +983,6 @@ struct ArchCPU {
 
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
-#endif /* CONFIG_KVM */
 
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
-- 
2.39.5
