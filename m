Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94329njb;
        Wed, 7 May 2025 16:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVv+swmkM6kNCxgfmg4XEGIkv8KpcinfCkxpd/l//fVyJRQ0GxZl5TH/zk4YkHzttnS+JBoAXydriPNVA==@linaro.org
X-Received: by 2002:a17:90a:dfd0:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-30b3a6e77c0mr1346572a91.30.1746661379461;
        Wed, 07 May 2025 16:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661379; cv=none;
        d=google.com; s=arc-20240605;
        b=BZ3lKXMxnpcEbMRXbs30G16TM7V2lv6aVOAthF6dyyMHHuOweTbaKoVzN1vUAKIdup
         uWiVCbjk/8W3NQvJlCUfcAkefVfpW3Nm0LoMh/zn/OFkZqBpAerSLSq3m+kXCqoMopkx
         Vk2mSFlgrzDRb0wE1hMKXqRsPJC5FdSG5wHuYj7LFEMtt144ca6oAOKm/1JFhaVS87Yx
         TTpYVt82QOscKIpoLcZ+QuFu/GJQfGtQofKv//NKbkj42ORwR1AbLmJkmGpwn3JWJlUV
         aP6VuG7JZ5pQgB5qMHqSInp3dPp5hFdkeNo6Aiq7FbuSuLk4ZBAL9Qjo1PTUar2dH5SU
         Eybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fgtSyivanfJoltGbQqPmVVFicsFn6el5hIn8rUX6RjU=;
        fh=FnN+i1cqQljdaCxbOFbhloRWl77rIhgYlBhUUfuNR+k=;
        b=QJ/ghUosduwlTn3dHM6nbU2i3So4m0UTs7l2985RAFIM3rpA+R/0gNx1ANgKDCDCgO
         PjK4b8L51QUU8DTRREaEcw7yxIcF7wfA6DPiCRzuRV7XDAyKcG395NAKd2SUjqH9BT61
         TxyYRH9K5S7c/zWAEPgfiW5GTRA65wKauAAdj5WMVosXgf45diuoZc0X0saLfjyU+iov
         QkP/o+8F0tIDKz3voO0yBs4WXtkltMSnWSlxRkBVfL86eCf/VwYt/TCcP/NJxxPrSXUa
         td56fiizqsSopuADfD+/JA2StRx2hOpMAr2Yl27hghP3WWZLLOur69oPKlS2yQsc3fpk
         +etA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqyvQAdJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb19476sor89430945ad.1.2025.05.07.16.42.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FqyvQAdJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661379; x=1747266179; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgtSyivanfJoltGbQqPmVVFicsFn6el5hIn8rUX6RjU=;
        b=FqyvQAdJqLJyeaXeQ3WxfT5zDDe8jACdCwss+YlxaLN6cdZQc+ktd/0jqT0nAVLiS9
         iPrYOriatneMJYInSwMnLJ72crnupfF1BQPiFMTt5Kb4cfvYHyGyHeciYkz4HOq9fNLK
         OM4zTDsYJfqyz6tpEkNhYuaIrFmZSsJFBmB7IVGdHsNWJqRqdotjLPlSv/Q/1GUv9Pvj
         DhIAggs4AhOToQtDI6CJkdS6FbuEbSq40polzXlDTVL7RUg6gcVHVaHySukpzbEq5a4n
         00f19FKuGREoBcy+qyi+U6OK3puLrnwLGtf36nPqg+KHbfEnxTT8a9hQnUL3kYYQ/65C
         XZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661379; x=1747266179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgtSyivanfJoltGbQqPmVVFicsFn6el5hIn8rUX6RjU=;
        b=SPuNg4oR0LY+zZCfXfT6oHzMpRt6Nzb7cFUGW/QMuSaTnfzFRmseniRqk7DtmoB37E
         Ss9/tUXbUFn2u3l5/MyIaoYH91lugFOw/ln2RQi8xeXeALD6ztkTQIguAxvbuawJxmBP
         CHaU9bOXHTht4bUzYUt5518sHqC1+PXkcawGbkSqdr6FbZquMKNZ9FLAF9yPiJZa04+N
         +XBNl5OfOTPvK6d3vcPYA9lQ8LTvPqNjFlx6OU6ucJSQLn0faIa0yRhxH1P0Wwozogna
         wrt8m4IHib6VR0RtqK43mDuQA80Vr10ftn/cVQ+r5/y9TZnwz6YXcy8zYYccROMyGLXF
         7HTw==
X-Forwarded-Encrypted: i=1; AJvYcCUE9hkpYgQJ8ekoX1HzCKv90L7qhS9EzLbxvcDbHeZmoC6bcPPT2oivJcRU69zS8tz3RsksIYZeZDPbBw==@linaro.org
X-Gm-Message-State: AOJu0YzllSeNeDRnOgse/ol2u7XxENGG8Sjatq3fQeG+5sUA2GTN2WqU
	V34sf49HQJsUcjdjHMUlnE+7MG51GgdFq02EH+YhdYFIG0VLBxwfJCfsZVaTbhDajw==
X-Gm-Gg: ASbGncuvXWbO9Et72tuR0wY5GMssJCJ3dKklP9M30UzQvDUMVdZIzb6pi5ZKCzPSUm4
	5Pxw+4u7q1wjUwGWNCzNKCqAPGp4on5Qwe4hxKBnGv9UzswtXSgIIh9pRT15udOTgSW8yZImSDr
	7QvodNQU2r5eXg3l5w/cCuwnA77oZ+Bxo5KoiLLaHshrel3UnCUmTmhuGixDn91Q2krCPsxdeHe
	zPfMTkwwxvjm3NgCnOT18mrWNOnnu/v9073lyDUO8c7RuPoBsCPnLP77V7H7M2G0iUerLDHAOdJ
	X9n/iYRQ/t9ylcQfkrRgBH6eXiwYTkrDsQPkhKvZ
X-Google-Smtp-Source: AGHT+IFZtlB2FlSxHJFsDXQB3WyDA4iBd5Ccf1T5vX11nbBzlbCtPEp6lNvox6Ap3RnU2n0tDbAJyA==
X-Received: by 2002:a17:902:d4cc:b0:223:325c:89de with SMTP id d9443c01a7336-22e856138c1mr20153195ad.1.1746661379102;
        Wed, 07 May 2025 16:42:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:58 -0700 (PDT)
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
Subject: [PATCH v7 18/49] target/arm/debug_helper: remove target_ulong
Date: Wed,  7 May 2025 16:42:09 -0700
Message-ID: <20250507234241.957746-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cnuqJ7CPpBwJ

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index cad0a5db707..69fb1d0d9ff 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -380,7 +380,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    target_ulong pc;
+    vaddr pc;
     int n;
 
     /*
-- 
2.47.2
