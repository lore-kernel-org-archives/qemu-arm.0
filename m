Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp95646njb;
        Wed, 7 May 2025 16:46:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/jaQpG6qvyjx6nzEZwviYOw/IKPzBD0WdN6W1QvFU8onQGUv/6tsaZ90VRQCWoBxnq5+E7SOns5Xpjw==@linaro.org
X-Received: by 2002:a17:902:d50d:b0:224:584:6eef with SMTP id d9443c01a7336-22e5edf9e67mr84500945ad.41.1746661612294;
        Wed, 07 May 2025 16:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661612; cv=none;
        d=google.com; s=arc-20240605;
        b=BakdYaWhG0LZ+IwTuKGWrH96BU0Ab5ou7oXa1pkY9txXm5q94019+Db9BN4t/LRmZj
         48+WstWv0KtUeQYbylwQxnIGjIhctk3QUNbewYh3o6mMEmIIsnuHgHiWzEuLyi1G8C9E
         0h3OmPddk+DDNzA8wLqFlvjtq2RdD1d2gu8bwMaHxaywwyEGnk1JPRSnESUcXmAUOvGk
         OSK+Y3CuvkGMswOMB9Ik3xEVwI3tTCSOJ7ihNjvkD//9u+xJ8wlpHQotYuowYj951Dzj
         YmbhGEhcb4lpIcexzgLzSrHoQyqzZQwKqiigCdELDQWSlWJJc6RHqVM51TeMTMT4Rf5Z
         6umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IO5E5SNmIeDx8PW0b+RfMLgVUuAcPfL8utSgWSmdyqA=;
        fh=1j11hxE0Wrx6fK1iSmoV/zDRBvgx4ZuHpGAuC6C4iSE=;
        b=b7Q769XyeoGkGIqlZEGhtl7wH5e0aQJaRbT09JH3Toazz85szwkGZdVsLybt5T++rw
         VUanTxHXhjECfEDOdjjMQ+fcHLKpirsE76DodbqFXJCY5o0CEzNmppNeAeIfBJSSCJxZ
         ebHtUrUlbxW/HxmuI6Nr+lOqvCb55sCImf083+hsuKsD2ufmqOQ4S9rVR9yLvQyH85sB
         5gmuQPwqb3xfGIFDnqTBkIQDEPxMV6EUOS8OHptOJVZu3+SdwkvqvvS9bZ7+ukXhQUJm
         ClLGOFuk8jTOtDA6e8efF7n31GpfLJt0stPmIQO6aROHuHWlEj+4UYiHGqrXmgP3BE1u
         A2vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZetGvfhs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7288fa8dsor14627885ad.7.2025.05.07.16.46.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZetGvfhs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661612; x=1747266412; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO5E5SNmIeDx8PW0b+RfMLgVUuAcPfL8utSgWSmdyqA=;
        b=ZetGvfhsvWk3mrGHflAh5iTzVhW0DIO0rtjLoINxZmYqjC4O5Cj2x2/Q7+HNRg4vro
         CH+XwN0pNJh4tjw/TGa+z24WMiJdjdeCxSj7y0Hoc9vBQ8dtdOBBWXT2NsTK4v0Vd959
         q8bvAO57SDWWRwaYou0ER1PhO1ITEPwI0cfZZ80KqqByZR/EeW3W3rSEDkr1lZ6QCC7E
         fzYY3JmmtoYK9rl0DyLyu+YXFC073T2DLbw8Bm2QdMd7KXkjVyM2FZrk1S0YAjA0YOIP
         2Gi1PskRMUhnzn8DJsI/wB+JDlha1QBXKgmXFtgIBCK3SZNiZPObwtpydPatVETRCkdo
         j1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661612; x=1747266412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IO5E5SNmIeDx8PW0b+RfMLgVUuAcPfL8utSgWSmdyqA=;
        b=L2tgdj7/WVpK18TDcTyQoyN74jVyfKwXCKKEe7yNgtrHfk5M5gXO3FrKPG5MRq16Dk
         p5XK6ydqkdEiGT1OsSYOSarIQNW8sEQbSqmQT+rpw8fRn50ZfNsGS9+hE27dzVxgkse9
         E2H0p+unTjr6L0DLl89pwORT4KaenZDcT/M9PSO9gby/Tfc3j4UnqjTbmdCEMq5qrWUz
         rOjMklLjWFANRgeY4DY4j/qopYkP1XgjH0G9zP6yzfD1xNwgdqSImyNBbN85byKR8S7E
         LmOzy87qZ6JWlwvzFExpSHZVhK+C6VbZilUQOcKj1XhcomFUlKtOni3u9WcFXvhqFytQ
         ePIg==
X-Forwarded-Encrypted: i=1; AJvYcCUeIG5QDk6IaJG+GoDqw0ddvxlbaweMEHXarC/ZYEHQf6obb3iPKfU+kULgf61pRVTWnYev+vkirajDtQ==@linaro.org
X-Gm-Message-State: AOJu0YwIm18eqVwLZTyFtgiFBn2LarBGW5iYSpfL7/to9y1RbNMWlTHB
	5KU8xt/U1dhM+zYvyZigNzYNyj9rPnYxfT9LAoxV1l2+zIDlBv8gfG9bIQClRAm2+A==
X-Gm-Gg: ASbGncvI7aIH0J8yDh/MlJAxVuyGUwB9i7N8MHfW50FejfPmMdlo0Pl2MRQf15MfUJs
	7hEXVnI3StW1D8OUqEIZOH+uNt6+e4rxMBGP6TrXhfT8wN/+hmLr8N5ATA2FddAAd+d+p0UaOjJ
	AaG8Ta++au5a7xT6/eqQ7R6rAB2RtIAZOqdAK/W9USZ7C0BstL3Wefaduvbss/HfES3NkCBlm+S
	3FLVvff58YPp+QYQeYVbsvSNKmNcilm9jAatYFgRMIjN4cGlzLbSbUcFmBpp3ZSoQkwiPQP46nE
	kw/YeoXMSj0VK9erKqUbFJffriARahDYJrPHYpks
X-Google-Smtp-Source: AGHT+IEHYf5gn4Kms+01AVGqYQpj4Yv7nVnKVCgM8oiazO1HdzL36aOMXIYItrwG0ce1halY5iExPQ==
X-Received: by 2002:a17:902:e78c:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-22e5ee1cc15mr64885385ad.50.1746661611918;
        Wed, 07 May 2025 16:46:51 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e97absm100792435ad.62.2025.05.07.16.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:46:51 -0700 (PDT)
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
Subject: [PATCH v7 40/49] target/arm/tcg/vec_internal: use forward declaration for CPUARMState
Date: Wed,  7 May 2025 16:42:31 -0700
Message-ID: <20250507234241.957746-41-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tsPreYYBFUd5

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
