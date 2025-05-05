Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778242njj;
        Mon, 5 May 2025 16:20:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+8R5rRXnMj6aRQULVbJVi9rXBIpgV3Uu+c570FUFriLF68nAlyAcMXC1UQENgC3sLOF2IMhkTh8j0FA==@linaro.org
X-Received: by 2002:a17:902:c406:b0:224:c47:b6c3 with SMTP id d9443c01a7336-22e1e8c88ecmr107495325ad.6.1746487235251;
        Mon, 05 May 2025 16:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487235; cv=none;
        d=google.com; s=arc-20240605;
        b=bVCgv2RlcByAi+B0hvb2JZ52S/m2xVhdq+5iIkQ785m40z0nQwAsfULoOmRWK42Epb
         1S+sNCN4AKTjyEmM0dv2zVQq//yKeLmyMIdEg70N0PSjzVcjbBFiYT8Z6BgxuIs5PNCt
         Gvnggwtv+m5r6QlV6DsJ9cZ3XiwkCqSvYLDl3HJrwOmGDG5RyvdAoXCblgAGr6c9PS5r
         mXBxi1O5OsRVMaTi30ORttsSCf7oo5NA9kcUp+BZe5kJhwRsaJdXzZUXpq/m0tHgtVWe
         Ku38ssAYk5HiCuhNM6UJwwWR613e5Dgr9HDD7fZn488VvgtQZniS26RhjLYFEWhxp57j
         TcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nYwtbXWo/TvD/k3nLDnPjIkSoANte4qu/UhShUcHmQ4=;
        fh=t6outDe7fjia83cSIUJiquiUT5LdfPgDJ8QN/vM2+g8=;
        b=IzGOfu/Nf/HZKKX5KqpR+2eDJN15innx079rEYNOH2b0s2L0OpdIiVEp5qtStNP8fw
         xBEHapqmM37Kefc66G/gCMntCexAqq3O56XFZ+VzZgg7VesyBtVzAnTO+Gmv+7kVC2/1
         DjANf1I6bMbH2khm6Q3HU++n0CmoiYS9pfPZ3zofdQ61WzykuKrby1YXKBo4CCd+jh9/
         kh4HohcRSLetruzqKnmlf8asvKHk1sLKVz62mqq/F9W5o1g0bMcxqECuQz2s3DOGiOXP
         rUWtHFPCBNVMOo/004c6KBHx/g1+oPcVFpJANf6fclh70kFanGcLxAggOUWmo3DfFUEX
         R7XA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFbhQJwN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc86e21sor65006905ad.12.2025.05.05.16.20.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFbhQJwN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487235; x=1747092035; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYwtbXWo/TvD/k3nLDnPjIkSoANte4qu/UhShUcHmQ4=;
        b=wFbhQJwNThZwUTKyF7aGvZtFoQ1EibxpLkE+6SeRVFn3N4tSfxHilXxGjp5jyDnpJB
         Q8Sq/rkA4c0jKDpZa5ldbGtmzjkNE1ZOqAu62zoBGWf43fIqOzWGhgQdBDWZkeudes2K
         oaVErBOF0GwOD+C6HrrOsKbo5j1f8iBV+mrs1LW2kB/Shxj+tCaJCN7QMg1UPPi49mJc
         iAHvlGXOYdpzaQvFLQ/JYk9IFfRol5GUS8HlHniZwepmQyLz57x/UuimVfeeYZ4aeeEy
         8YZyLWDMOgY6JUMucXrRoRfJQkwQ/Rmqep+kvbi5qK7oLnvrHrEX+baP7VF6N9uFaWfZ
         WyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487235; x=1747092035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYwtbXWo/TvD/k3nLDnPjIkSoANte4qu/UhShUcHmQ4=;
        b=Go2bTTHE/L1UqSwh9ZRi/02YvliOIzSv7dI2hlAKpVe9RUspuNTEopKYnIzB8nYOjH
         pCR6GAi0XfFgvhO60fnUTRjacXl62nxj/KFLTyZZdLDyK3A4zCf14w1GGuBOdosOvk94
         KU7Tq82HnHRqWFQXvdyfHj4yS3K30cYpwq6M0pi6lIBRY1Lz9GI0U5btPqreSpG5ye9Z
         NZMUvqSa7SqWfC/ibFcdop2eSmwZMwgapisOjQBTQeI2Zf+poi8Kz6vzZXHo4rkJkRqc
         0w7EFjtYIElR1Z63gTdj0CkIRL39WhuvtuSzgAZcV8XDW0XUpLzcN/+pxWOfPawquHzE
         m/Og==
X-Forwarded-Encrypted: i=1; AJvYcCVkG7UZDwTM2vNAmIZZkEGnVG9bfVsW93uqbfCWBXYYAaoQ5o0f533z6UH1JLvhGctL5GkfyFLgXSVn8Q==@linaro.org
X-Gm-Message-State: AOJu0YwQElqVLI3dV718VRqXcTf35utqrnMqQtTXHxrhuzh5vOU0Hk/8
	04MEyYa78TC2e7g6blAxS1xJSh1tnxvxmvORbITQwPcTKp8KMyYdBZbW+RQQb8OrsA==
X-Gm-Gg: ASbGnctch4ivxc9lkcKI/QUUL/y2h9RmrrwSQQkTT0nC/4sqZ+F0YJs634OZl0q82bl
	uAxpoxpr03SrFB7PoIS17sV55InDEKCncACtuYKNk7KQFqqLyj0PMG8El+43ozxGXtEc70I1VLj
	EWRqDOQ9PDTEnYbbDn7MskmAEQtg2geJa6qu8boChxHaD1gZDD4LyXaxuYU45mUafTKwVH+wy6n
	+26U8J0R1qRS5PfohRnJeoUmi3x+FsTprBzkhjHCrfR6Qc3+pjlycb9zWOOZBELdvNkmWAP0vsi
	B0tPim88J35puE+NlnZo3QKtbcA8Dstmg78ZDjkw
X-Google-Smtp-Source: AGHT+IEZ6VqsUNG24iDMT3idG7vLgb1bzL1cG05Jn05ziI2xH8ByDBSw6lb+7MbuYw17U4nXGnFALw==
X-Received: by 2002:a17:903:d5:b0:22e:4203:9f33 with SMTP id d9443c01a7336-22e42041dd8mr586475ad.33.1746487234785;
        Mon, 05 May 2025 16:20:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 16/50] target/arm/helper: use vaddr instead of target_ulong for probe_access
Date: Mon,  5 May 2025 16:19:41 -0700
Message-ID: <20250505232015.130990-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: w0fkhO4N3Aa8

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.h        | 2 +-
 target/arm/tcg/op_helper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 95b9211c6f4..0a4fc90fa8b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -104,7 +104,7 @@ DEF_HELPER_FLAGS_1(rebuild_hflags_a32_newel, TCG_CALL_NO_RWG, void, env)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
 DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
 
-DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, tl, i32, i32, i32)
+DEF_HELPER_FLAGS_5(probe_access, TCG_CALL_NO_WG, void, env, vaddr, i32, i32, i32)
 
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 38d49cbb9d8..33bc595c992 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1222,7 +1222,7 @@ uint32_t HELPER(ror_cc)(CPUARMState *env, uint32_t x, uint32_t i)
     }
 }
 
-void HELPER(probe_access)(CPUARMState *env, target_ulong ptr,
+void HELPER(probe_access)(CPUARMState *env, vaddr ptr,
                           uint32_t access_type, uint32_t mmu_idx,
                           uint32_t size)
 {
-- 
2.47.2
