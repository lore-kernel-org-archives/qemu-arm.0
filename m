Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94426njb;
        Wed, 7 May 2025 16:43:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXv283hOIYeIpRQI4Oc4bMtQJcP6PowT7Ey+E10y8Ced3zJfkZ595Xg4VCFlmL+mZijECEobNKuaEIjvw==@linaro.org
X-Received: by 2002:a05:6a20:c886:b0:1f5:6c94:2cd7 with SMTP id adf61e73a8af0-2148d63cee4mr7866905637.42.1746661389679;
        Wed, 07 May 2025 16:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661389; cv=none;
        d=google.com; s=arc-20240605;
        b=dhnYAw1SVbNpv9QaMr/pObqpYyplBpS3HMcAKmon0mvgUeA08ceTxcubvqOXjhG184
         otucMcKZCqgC7Kbp3NJlzjcukzBTD5YcWSAAuC6Gqj7IEQn3V/jU3c6fsCKt2EqORN6h
         JEoQX7NEtVRCCBll5FZpWVXDfajMlv0e/4/BnbD3exD91mxVE4+N4vo5vMNvTvAJK64l
         vlbih8OzxtGGQYwbmhs68X9XGH3D5iNZ+CsVu/KQGAiDMnYasV3TeXQLELF3fMy+lh+D
         7ZNXBLyrRHxhD3wtxmOGi+CLc2aJKt4rkif5Hq7/VGFaVb1uyYvR8g/pIKOUYmL9jw2i
         8O5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3AGfH/it6XrbUjxeSHUy0wlg4nMt2R7aYVYgAEJcCXI=;
        fh=PbnAiZCxGaNpSX6VViWeTRg+Zeq7dptONtPl7PVqgUc=;
        b=f+ITrAo0Br+a86CYjnk3BL6u8JiZQBcNQcXteibN3YKJ05ODOUPvSqyizJUQBEKGG5
         IMImJL3bL10dgjpj25z+Yn/tF46v4FO7bjZMnu3HNDWtaYK7Fw7hQrrdYtls9Z/BqQak
         QwRVqmBdV9hHkTlcJ9ptYOXNkYjRBneESMvcImM+URuz3Il1JHN8xA/9gm508vnflS2x
         cfRKVMlrEgf/rS9tpNawC+6pXcaP95jbfLeaFg7NzuVGsYFSVdDoiRj5osxscOVOH6mG
         AzYrkK0HwYHGd9kcYnL9QHF1fkH2HDzE5F+J8DlAsjvnj24ZN+7m2waBaPDS/C/DDZZC
         7Ivg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S2Z/7Z5T";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d480c90sor7957839a12.2.2025.05.07.16.43.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="S2Z/7Z5T";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661389; x=1747266189; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AGfH/it6XrbUjxeSHUy0wlg4nMt2R7aYVYgAEJcCXI=;
        b=S2Z/7Z5Tqt8NeeHr1Z7G/yxGvGE+sYJOxJuN20NqPd0RKv6Q6S0fHK8l7jJLSu2VFi
         4RgMJjx9PCfZAS5thRJHS3dfNTINIKiw6X0PMBwkTfpSMZAxm54vwLb97O1s8PQzc0ds
         tAZYEOIu1BMLwiCJWCko1dL3tipjLmxEVDB5gYpmTT9ljKZJyjvyh+To8bsY4NRbgmlL
         N1rVTItecLNaS6ppasmTUA544eQy4jATeR/A+As0deKtCdNthi87MdMxquBJHArpckvz
         owGI/XEoZoAFFmvdVCLTkKV02r+LPHnwZ3iI3uh0IOhaGTa0yECuPL4rmlV9xrp87Law
         TUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661389; x=1747266189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AGfH/it6XrbUjxeSHUy0wlg4nMt2R7aYVYgAEJcCXI=;
        b=ZA8hdKIMXOGxo+vXjrPV+PoHPdp0WOUwDh7xyyRyYTHstx4wyRtL+wi1IYa4S3VVVU
         cC61ky/rKFJ7MIVd5nUTZQnAkOVXRJ5v+5YTHVHgBWW+Vn33lEQ8CoiNEsCFC4QyBwYm
         YGu3yVjfbpxCC2Kr85nKeI2oWB/uKkHnBYZAbP+fk0WbZ6k8ZRzjnYvMOjKPKJGALqgC
         dHsYJj34hWHkJPXCMhdjnlTVPIjcR7meg8oJDVhYMQ5T+WJ5QQ0B0ZKt0q7DjYnS+hej
         C6PHTN0wRAI0FnKBwoEzikL4SldL415nesCWopKKkgl3eLTqoLfwrn4WpVEyxaIOWagZ
         yqwg==
X-Forwarded-Encrypted: i=1; AJvYcCWy2GnvstgtJWtvCRQ1F6+iDNk6AZ7ylWCthdPnmNU1IErGpeW8F/bSe0BnhHO/6r2uiQYYiZknVsDDrA==@linaro.org
X-Gm-Message-State: AOJu0Yx+Y9uxzFgYeoAQKU59jyb6zs0lv48V3pm2bXzfYG0SX3kVRE4J
	Gvbz5Eg8xizMjF2ZwFg+dzu948bIm17ZqRBKelCKJ08TnzXpzBUUbMOkQzYwHUdNnw==
X-Gm-Gg: ASbGncsz+tjHxZ3vXbRYknQKpkPa6mFfHAj/Jv2B9suhMDWmlE4RW3cPcqp9/KLMDpy
	d1aIIq2pFoFM+HtnoFQeLlfdjZqSb+wlnUo+6TZRSlJCQnGX1uF4J2pgmwp0Fz3NeShZkq7FTu/
	yEFmdnf1TIZ5gFyeKeXVPr/lfv3MiK1S989z+KSSfb2anqppOBp6zKRLIf9lRVe4WMooKTBTe1T
	dJrIqXeV4GjJm8uD3voC3/uIpVkylragx72O8rnE1eI9d0RvvzYd7wOeI4DSke9k6h6ruIV683o
	viWXdpnHPphIb1x37sXOlwynpzHlC27XgOFZH3p4tMLFpT2GC4Q=
X-Google-Smtp-Source: AGHT+IHfVFswkH2ailGEzkC8ZP8p7efGOpbhAQWb2RgZin6ra0kY9zWRj1hd1EERwyLNkO1zECZsoQ==
X-Received: by 2002:a17:90b:1d92:b0:305:2d68:8d39 with SMTP id 98e67ed59e1d1-30aac19d869mr9690107a91.12.1746661389236;
        Wed, 07 May 2025 16:43:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:08 -0700 (PDT)
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
Subject: [PATCH v7 30/49] target/arm/ptw: replace target_ulong with int64_t
Date: Wed,  7 May 2025 16:42:21 -0700
Message-ID: <20250507234241.957746-31-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kCC/VGjaf5cR

sextract64 returns a signed value.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 89979c07e5a..68ec3f5e755 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t ttbr;
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
-    target_ulong page_size;
+    uint64_t page_size;
     uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
@@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        target_ulong top_bits = sextract64(address, inputsize,
+        uint64_t top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-- 
2.47.2
