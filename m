Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509419dyb;
        Mon, 23 Jun 2025 05:19:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXh8yyVjqy1sqDyvwzpizE4sK9c22wGMxu11CwrflUfk9AeVSuVnzrN5gVwZgGPk0Ulf5VgH0kHpagcIw==@linaro.org
X-Received: by 2002:a05:600c:b86:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-453659c0bb9mr135631945e9.14.1750681154035;
        Mon, 23 Jun 2025 05:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681154; cv=none;
        d=google.com; s=arc-20240605;
        b=fOYg46t0keLbiR6a9/SvWm6IdK0TOHu+xWDVENf1+cxEJOhWXub+chzz/ns/m54fua
         +px6qkx5tME2SO9tNtI51gxGCrefTz0YOhyZQB2QYKxuHukspFHDGSg0C7XD3XgE7KNf
         yXT6NvAKqH65lLyxdzyD8NNWrh02dXmuDfKSd47Y2RCeT25wQJ2ymKSVuJWP4AERZUq2
         lP1YjmhVhIVuo69bHj96cEUMvq9boEEWPDKGQupgY1AqVTv2Zfl/4mIEI7l77Y+N5B/Y
         wV6EH0JlSYAiDpFpxAJnWXBlErMbB1l9aXKNDQ7Z/q5RsL4G6Sl6+9My14v6pcpPRx2L
         BuKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iPGemtR2ZdzEfUCvxZ4Y78uZrjiue5vwaeOrBHsS2Jw=;
        fh=8gc93t4ZJS4VONfX9KU8QB+fKLz9dkWVGhMokV7ZQZA=;
        b=BrEqqydViK/BJVaiKI1ZzOhwJSb/6EzDq90jmzj+6/ydWbQjHoAfLjsyM7bl71bU9l
         Wz+s7xmgEFnpXWfEcgm7vo7AHwJAEn8fnpDz5fWRwFs0zTQ8WMBX3SAEQ7OtgzQ9Mzch
         HxWrNYmojzs4WmdoId+y6HB3SOXMDkjVa7tBPcXsoVdHDR6fnDzUUVfL/VwMFQNo0w6P
         xqZqxuWPhj5BsuoC9TNC4wy45CiShwLfE1DfMhIiRIZCdLJz81tYbnTX37I8TIRPfJ07
         KUcR6w0/Kvz92chH2PU+V3ERhzQty5k6kRBa8QINopT1WlH3yKtBFNcgrliDuxJpzvWg
         BjYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+wyVjRu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646d9639sor26480705e9.1.2025.06.23.05.19.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+wyVjRu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681153; x=1751285953; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPGemtR2ZdzEfUCvxZ4Y78uZrjiue5vwaeOrBHsS2Jw=;
        b=u+wyVjRuutRkgipAlw53UE6DnY8ZaCJRcswSpOiKpVYpHABC98jDGC7agx1zMN0V9x
         7yWuKdUmSwi9VUHYC4fzFnHQn7K0Hj08P/1NeWdU8tHw4E3gHJTKWarP8EcKeZPzSl8L
         PSqvgwFToVbVhivU+yTaz3M2VYfNlaxYO4YIT9T99L0qTCOEiyEOFAfCaIIiaJCy8YjK
         mN0zZkQYeLU6Ywt0NEVUBlgT2JvWBOssFB811/zttg+QDDduGId7TDHX5zqHrZBVbr0h
         1vPvUPkL8KJA+Dqn3/Ggakm9j/FO0wy0zBpTRrD7oHwmFyMhHAAepqpq7fnF0JvvxBlC
         d7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681153; x=1751285953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPGemtR2ZdzEfUCvxZ4Y78uZrjiue5vwaeOrBHsS2Jw=;
        b=C6c2T9XWg7BuQat/JUljm4c5oiausnySa3xcD1tAPHpbDApR12ISPwC/jfrXnebrO/
         pL9cDxL+AnswVInMnh6CV2C6q4FYq2LZ+TniQjiRMVqeIy7Yz+95fhxHQXS1xZw5tBjb
         O+QgFVZOHuRvh2sjkLOmsJRACAnPq3srfdjjyJi9rqOoL9HzTqiieIjRHtlo5RkrfCUK
         E1OfAHNh3KWx6l9wqFJkaHPQRJe5l1I5DvfY0w9dYyeq1uWRrDSeo1jnTZ/DlUG64aR8
         QIQk0JWEK06qn1S2uIzPBaRY7O+TeTDE3cGA3g3sHgP9lj0doFwYgVrmZEXiMDGYEzZJ
         zOFA==
X-Forwarded-Encrypted: i=1; AJvYcCVwxpIAUrS4TEB6QpjRiDh2ToB9roZarQMeed/yGXZzV23kchMbI1qQQ4f6MPkmGVIRqjAZ6yUjHXkpAQ==@linaro.org
X-Gm-Message-State: AOJu0YwPcug2J0AYYtJONkihbIP8edjMk81ZtLphOf0dSYKdplG9nzIo
	1KyXO4jUzrbqQfv7SdBg83rg3BLFAORkvBtASB2iNqO6xK1s42pPzziPQZu68ymAJTkYfA==
X-Gm-Gg: ASbGncu/F5HK926hZqzdoINx4KJA2KCi4O5xCeXdvrbMRZcOmjTX2wbIhi5aZDVXjPB
	N2ZhXo6wrKzSoXSGpsoawvRxGuqHC1/MFf3w/M/S+v9olhM7yR8itlSV/i+TVjkASyjI0kIQRDG
	otLo1wJdkH5MQMsnaZxq8r9K0RmZlADtV6aUGw0jrP8F3SBx1OWJ8E7hRizhzcPVB8ZPK544s2J
	ZL/KYJGpG5/28lzLbF4Uu4PKlfBWjK7mcRLtngYEE5BZXMpLML9uDuRxj/oy9MnLk6ELZI4ly2i
	XN8Q0JtLcK6IwO3ZOzfXdk2esp1YCphc5yi1rJhawh+WZjDrZMNO1f7vr5hd91Bt6IH0WTw65+d
	zTfwR4at22MrsEW2fBnH0Xo9gTHsMRgfoM76b
X-Google-Smtp-Source: AGHT+IFc5MQF2NU8xSghyO4Yhud3yuPLg4Ae8wD9rvl4pDNx1QI2WiEDWAGMHEB+0CpNqwj6XAaSXQ==
X-Received: by 2002:a05:600c:34c4:b0:450:30e4:bdf6 with SMTP id 5b1f17b1804b1-453659dccb8mr105349215e9.19.1750681153473;
        Mon, 23 Jun 2025 05:19:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d87fsm9323283f8f.45.2025.06.23.05.19.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:19:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 05/26] target/arm/hvf: Directly re-lock BQL after hv_vcpu_run()
Date: Mon, 23 Jun 2025 14:18:24 +0200
Message-ID: <20250623121845.7214-6-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ueqGGIcYZUZ6

Keep bql_unlock() / bql_lock() close.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index c1ed8b510db..ef76dcd28de 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1914,7 +1914,9 @@ int hvf_vcpu_exec(CPUState *cpu)
     flush_cpu_state(cpu);
 
     bql_unlock();
-    assert_hvf_ok(hv_vcpu_run(cpu->accel->fd));
+    r = hv_vcpu_run(cpu->accel->fd);
+    bql_lock();
+    assert_hvf_ok(r);
 
     /* handle VMEXIT */
     uint64_t exit_reason = hvf_exit->reason;
@@ -1922,7 +1924,6 @@ int hvf_vcpu_exec(CPUState *cpu)
     uint32_t ec = syn_get_ec(syndrome);
 
     ret = 0;
-    bql_lock();
     switch (exit_reason) {
     case HV_EXIT_REASON_EXCEPTION:
         /* This is the main one, handle below. */
-- 
2.49.0
