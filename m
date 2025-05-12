Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42567njb;
        Mon, 12 May 2025 11:05:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4EJXpdvo+IcQDSTAlZKLO8xCcl3K6ju483zwXev0Y/uf3gO5q6ajDY3x3zNxFFIdhvV61RZ4G+oLC4Q==@linaro.org
X-Received: by 2002:a17:903:32d1:b0:224:e0f:4b5 with SMTP id d9443c01a7336-22fc8aff09dmr203568405ad.7.1747073116878;
        Mon, 12 May 2025 11:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073116; cv=none;
        d=google.com; s=arc-20240605;
        b=YntudoxVMjkc7p92x61o6k2Jwt9+S8TcedV8sndJCfueZpHznuBg/Ih/6h6rqHt3eC
         NcWp34AH/UyJWhr0JFsis8eO8SLxfKw9swKvuMfciht7zvob+QhYoCy3J/hSsvAT2Gx/
         8DXIemNBDRD/2QOg1mZhyyIT+tLPiXBYNB2++jOwnoLtOcTOEb26BkVkwDfY9802KPJb
         6mmiPpBXDJd8B81NHiDw9g3hFoysfKivdr9+Za78k19QvXT4VLakZjEZS5SBcz/B/VZ0
         Xdawjuj1PhNApJBRMZy5OVoZHHukIR7sU4WdxjdyuJOEadl1r4FWkfVOorWerpSt6Vgb
         mVdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        fh=GWvfsGuM9PeUmcGR1f8F+RayZQydubRbe89qmBcsTJM=;
        b=BvH72ZBWxB97d+yOad1beAVKxXitOikz/XUpq00XuscdYrJOhCXiWuDus6CBjnV7Zm
         rZZ0ME7bPGa79vr90gc+DEuvaTqhuEKrvO42cZYKy/1ah2Q2BZXhcRm0tXvfWar21iTl
         YbBtaQgLaji0s/BBa/ditPeOZBu23EvsLZXbsqiHecY3Cd52MuLSWJC1haOUEKG/GnOm
         apiUmQqNvLb4fLELRuiLOxLNMe8hn2Oj/FPiuB4EITEIDcBDUAiVOPRBeS7RqeVpPKKS
         T+eidDrgPrVSYeQ9ywnS9PPqt3SyDa+r0i0N7AoLivlcxXO7P0szUCJCyXkOA+IIZgG4
         SRvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fzo3G842;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5730f2dsor56080775ad.0.2025.05.12.11.05.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fzo3G842;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073116; x=1747677916; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=Fzo3G842VhLZLGNc5ntRjVMQSX7uHIyKtWcdh5hx6XmmV8omnfYs9vWT0mLYr0MXnt
         LJCrbMdCmCDWqf2uSIzDVxUMVGxqwVrultONaCpaOK6NWbc4hdHj9keBDIEzWIwotMRu
         HMDgMeAPuCAesW6lIhLRYVBNuP3V6R+VWCPXaBKVB9ktAE6Z1OGweEV8btZfO9qWwZsY
         jGjD/1Y2XkreQL0gKAXBT1XGGG+tWwdn8JZ0b6SrH84M2Wbd2wiHj5q6Pz7Gp8rtcIAi
         gBddxLmJLkgvbYqZdqr/lCeCDVQd36r8Z9mlRvpxO3PrsM2K9JV9PSXxwr7uDDun08UE
         GoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073116; x=1747677916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=sxk4n9LyzMDG6sx8KJpj52tPnoMEctYUaMzVtEpWHdheUFiQvRBidmUIwrQ0+Ck7/j
         Ht3S2sG6FUXhwSzCekhSn4JT1qJUL+p+tgb9Mo+icNM7otEHLvVhxuBdP/EdEVgzoVoP
         Rh0hKbzGtFZtZ4NqUl0oaWCqCP9dl8+mvrXZ4KW2zeYvew+Luve1EWyojfi/91yTPhX1
         59zNCb3wh3YlsvNvXO4ufA26kNYbjT5rP5/xr7n4/pSBC1FHqprtnb163X5ntfs1YSzF
         SGnTh/D0s0ZRv298vxcPPqmH0Xjiy2bQBKews3NXIj276wX408E+oxOwDEmTk13THy89
         ZtmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXAVWTjhNbXUmuzuCxVBa3PgFiKWc1xLhIeDb5aFTESnlfivZDe2VY7AffeRookQ54XQlFGmCDWHkF1A==@linaro.org
X-Gm-Message-State: AOJu0Yy6Gs1SMyYzVrcA5Cw3c2hr4vVJAbU3YUhPSqs+TrWT4MBsLQjF
	LbUDt4Ws7h/UpywBBpSFJMUtWE2iSWDuqdPeZuIYqpWMjD2fWffXx9mZK+VFbmjGDg==
X-Gm-Gg: ASbGncvF2ibxk+2tSE4UfG1rRCdORmxr3kGXAMUDZIy0czXbyaQPclip4eQV8tpf0pA
	gj1B+OEZitFJvcAeJ8ea05gUSnAZnsFB0pTvZLyuxV7SOBibvKogD7fJvhtPqcQnlTZtM9ZwxQR
	/H0jtgPDqnzXO4JzF6OrQj3Zu3WK4TCY56xguE5vXljo4l+dRgGMnxaKkj2262i9BOHNsgjRbtO
	af8ISVtzCmZFlncpIcKfEmCddfD/vdVUBJlOw8aeqzLBBmVFg5fBIAuCh9lCG7KKkDwm+0h8a1l
	t1w+hQhFhwJU7Of7z624a68TaH3ZaezijHp6ikZyTeBqXBxya18=
X-Google-Smtp-Source: AGHT+IHV34nofPlHI7j/tovgmgz66yejcHSaMZaqrSu57vJ9NQ3EVTbiO5LssTGmikR7Zmo7cr5jug==
X-Received: by 2002:a17:903:187:b0:224:194c:694c with SMTP id d9443c01a7336-22fc8b592c5mr225744135ad.28.1747073116233;
        Mon, 12 May 2025 11:05:16 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:15 -0700 (PDT)
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
Subject: [PATCH v8 05/48] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
Date: Mon, 12 May 2025 11:04:19 -0700
Message-ID: <20250512180502.2395029-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cKZbOWf7AWSS

Needed in target/arm/cpu.c once kvm is possible.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 2b73d0598c1..e34d3f5e6b4 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -99,3 +99,8 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_reset_vcpu(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
