Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94312njb;
        Wed, 7 May 2025 16:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdsRgSJBLk70BVtqjjGrEnSNU4ruFC49VX6VKRhLmYojhwie6/d0hF4OCo+1JBn80h59sh5Tle5AO4OQ==@linaro.org
X-Received: by 2002:a17:903:987:b0:21f:6bda:e492 with SMTP id d9443c01a7336-22e8dc8f49bmr17367065ad.35.1746661376836;
        Wed, 07 May 2025 16:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661376; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbN7JykCGKF8THvdfl2ewXCVAV+aQrcyNY+R2LCXnd/6zTMFr/41PyYHsUqXxZsdjA
         ZaGi+UWZkSfO8qW/+pqpFI35U0c0cGR4HveKt7eOdIjLLERuLfXzkcZEk1G5PtUyVF/l
         IhohGyCHz3HbQjC/SNIUNGx6z/8CvDDS00qylEVfqOg2rzxKha9g4JFlqTV6dUF40wED
         EY0hGJusTvGvQF7macCZpI1ib+B72tVf8yq8ab6s4PgBA6f+V6qhC/pzuDYoFQJ9+ne7
         JYetdGQu5hZVlAqZk1bzvZaQ31o3pZSTdQM79v1Ih5zn5NfJfY1ET9xQYiosEZom1UZ5
         KTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ylmW/mRzMuupLX6PASMDyZOaBb+Dv5gnstRJQXcdzYM=;
        fh=c0O/X34lHTH0NtiP+wQUCaM4v98MEW59HSwSFaiGr7M=;
        b=PFN04mkHMtkxE/ArzgLFIJ2DB0SW0OQGRQIcqmYmN3nxDL+HGQcmEGWbFd5wS+baqR
         /VRbCm3jm7UtmM+2lnaDz2+8SUBz0ngQkS0nu78voqH2HMQHtJvCnB1Kq4KTRw6cSs60
         AggS1cYebT6LAuH4169OaaMOOak4yPMLYMuufFE55B9QGWuluxyn2n3YDWA5H7wiuLsx
         YiBydoRCLOvPKDL78XVw2z5amABrLX0Rg+8FQTJT4oZPGh2kLI4BmBXFVPdBkSelhrn7
         TMwgONv6x+YwO3GrM6O84cdIPZ+P/e5fcw2g4C0+pa94QG9+HP4ZoEgZLZHHIcGZWw+s
         rlWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQKWzh1D;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7c3fesor132501145ad.14.2025.05.07.16.42.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQKWzh1D;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661376; x=1747266176; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylmW/mRzMuupLX6PASMDyZOaBb+Dv5gnstRJQXcdzYM=;
        b=qQKWzh1DkknQAQOwG+2lXnu01zyw5ZZh+YAC/5+4GkV8AWpFrmzMic5HOVrF12eyzI
         SDl7tSThlnTF+xHifR8WYxa+xI7yU1dzNzqJm5FTmbRjJoHj6NehcM2ig6GqJNaHO5Tv
         rXWuwUT0G8PUHF1pr8l8hTu8yLphFJ1od6ubl7WGVLAFUPhqEDatq3AUX+dFMQqeq0AS
         uPw5DccNmMbDNQYdVeBxkbWsLwfCgPa9nHGOsElHQfVNSMXz8lCqkxCjVbhvZkousQBk
         Hhya1x2HoCJlcxyW+L4i8PiCWdFeare5M6ZTFVkefb4cI0svXdMog3fyWj/XGDhXcqCK
         CG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661376; x=1747266176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylmW/mRzMuupLX6PASMDyZOaBb+Dv5gnstRJQXcdzYM=;
        b=t/ghY/RDmB7Y1Pi7wRp99EMMcjSNSsKoaYBbXkl0MOMLSu27cwHJmlfz4NQiJSyf1J
         bxxf4EC2Hy9TF124Hni0M46RnnVDtAsdaSZlCz0YmUHIFk0Z4WaDWFi/7vJbUfDqD+Nv
         gx9XzfoA81EO10hpsl6BzNaZJUEd86T3en8egaCXEOtPxB2R/jEV8rr9lt09pGKRb9Sl
         NF5pWezX/WA6rxLyAR/niG6hWsK1rBRuJ7r2UDq2MDFAvf+4zXSfF326/xooBpozq0zx
         dDIFH82ql7edgPMKO/SfOyFiDsNBiFD9sy1vnDepymlreBQgl1doKARKmFpJZb5iDwn4
         DY5w==
X-Forwarded-Encrypted: i=1; AJvYcCU+Czg2Ertry6FJvKQdE3G+xKePMLF/VJeBCBBngq36ZtC7Yf+zun4pvr+zz2TVzLYUSmXDo+DXfWXjSQ==@linaro.org
X-Gm-Message-State: AOJu0YzZuIA/8JAZbO2EDni1Xag7mOy6ffVGZRstz0eKmPS/dTAawN9H
	Ck9TGOXQaVV0Re5mBTC7Tb4ZsnrEc2HyTnnyOBGFBo9XT6oeXJl9+n35ilzqLAMcfMq8bLwQGmq
	Qvu04mcX8
X-Gm-Gg: ASbGncuNlRZ/1g7bxB4BibOLy0KGrZAvRLCnMMM+Je2w0usaQ0ewYXakMvkbQhmj2mK
	KXEd71HraPU+gTZyB12TeT8iB1gq9Hr5d/k+RJIRqoLBAnQbkjyd+jOz2hNy+Nt6PU6JgisGsCP
	ZbydUizsDK99WuWXRChyPkaAe7BXlTYfW0q0bApGKbs22qJxSWRa3G9cHGwq24X1VQuUW7M09A/
	wY5aS9aKpoDgY60orgwYXUHl14JfdvdzTBuXIw/BEO5z4wdkFDtP6Za7LrW3uhNH/cfTQsSQKtn
	Ze7o5T3OKZB5gru7Efc4FPFz5D9mvMBiZL4g3CU1
X-Google-Smtp-Source: AGHT+IEpWx9aGe5EwvwUP443E+5HNMG+cmlLCI/w0wtSLqbMMqVFdYEOw13y2ya2bBtZ4ZjIU1REbw==
X-Received: by 2002:a17:902:d487:b0:220:c813:dfcc with SMTP id d9443c01a7336-22e8e24a912mr20255915ad.40.1746661376490;
        Wed, 07 May 2025 16:42:56 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:56 -0700 (PDT)
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
Subject: [PATCH v7 15/49] target/arm/helper: use vaddr instead of target_ulong for probe_access
Date: Wed,  7 May 2025 16:42:06 -0700
Message-ID: <20250507234241.957746-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cEiWCvnYyLcD

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
index dc3f83c37dc..575e566280b 100644
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
