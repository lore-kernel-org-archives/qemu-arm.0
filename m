Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42657njb;
        Mon, 12 May 2025 11:05:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXqk/FbUTp4/0cFD0sbvB/IyN78ZmpxMhjloltGzb0IDGyFDLbQ2JmS2RY/mvBtmToLqFzBGlx/pxrtkw==@linaro.org
X-Received: by 2002:a17:903:2f92:b0:22d:c846:3e32 with SMTP id d9443c01a7336-2317cb65e55mr5387225ad.25.1747073124801;
        Mon, 12 May 2025 11:05:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073124; cv=none;
        d=google.com; s=arc-20240605;
        b=NgLSBrxMYC0VUdZIYq69Sv3dFlFfa3qfkylVMHEGJgVtwkHbx/GCF6hwb00Hzpr8uV
         EfNkk2g3d4xnIzN2NPMUBZdGTWRfSs6MMNIGJMl86yAaksUcpItRJdP2gHkoOA1TJyFe
         J33DcOKGBekVV5IMF27sRzVKyTxqfnz3NJjyNQQ8FWSQD3lqNk8qh2QT3fSRntYyG6qu
         ASwuBVqqN3lWF1lT0Y1R9C54Mo6MfL3Jo4jWDH3gTvTnr8LMTW/c/FNRGLlO2PsdaRLq
         ttjOyTgl8vQVoYGd2S6rq+B8bI7wsutRwWtcb5PcOcOYuagQgZ9NZ30dmOOkKAwkfrjj
         6Czw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ylmW/mRzMuupLX6PASMDyZOaBb+Dv5gnstRJQXcdzYM=;
        fh=JkDFkyivb0QJlKNEi2D1o2696EumXGLMLA9vvF/dkkQ=;
        b=WTiyw/VBOT3LOv6e4DuLRjWIppJRvHX7RF1F1SwC5mkR1/BVplAcYs30l1FVGJNeuc
         4YpRbK11gII9WOG977/JDIhuSqcg00QXzjYIt0pVdUUfxkN2Pn+cD8gCbdjXMICxyR+a
         /dPaEVpyARrT62MegBK3pi0xfDkSEXOkQQUVM3SCzYW4rQuZJyfqXOCiZn/lC+dRzlZL
         tN0ANDoPJ504uEf/JEzqwU0VZe882rQN96vuvQ8zcpqGviRXoWLigaQu/ZW+O0fPKXet
         uMAxzzCawF6Fu8u/QoQ9d1pQaB8EZrWg3Q2zfv9Cij55YuGOXdBR/a9bjIOVTrQUlSQ9
         k4YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=viPOrTlo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7f0d0be1sor55934535ad.0.2025.05.12.11.05.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=viPOrTlo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073124; x=1747677924; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylmW/mRzMuupLX6PASMDyZOaBb+Dv5gnstRJQXcdzYM=;
        b=viPOrTlo/bODn4MqXbcl2B68/IAhNLy6+fLsONDdpjc1phK+S4MrTw0R0gK1jZ6PMp
         b+w5EPuFMlJE3xwAUotRQMpe7tQ+auhwnqjsU36wA7x1lSgBI5PIjqVeXmQ8sONx/l4w
         JKm9Rfj4X/F7lWPH2gFOvPrTxwO6m1w/+PczBq7Y1DidhfPiSbXXuIIy/QUlKcssBW6B
         Lg5ja0yMfCx5RDUcJcYL8fCxBiqEWFziAaOinqTfUpbIRjEysqC3R11TW5GwMiA1qbY+
         nuykl5X2Ia9S36LE1EkYfq/deZ24mcDF6PafUsZfJa175aiFfXl72B4N/2EBDkrJKcc5
         0S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073124; x=1747677924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylmW/mRzMuupLX6PASMDyZOaBb+Dv5gnstRJQXcdzYM=;
        b=wZJvxBoBLQfEqfK/NGCKO2dP2To90q0oPQ5OeF9xhWNiGRwPq/dYalAT6zgcFgXruT
         6AO/a9HvOTIYSqJqGCFA0j1pA7jvyAsFFSshc24CSaC0t7tod51DXVvhtsWQ1/JiKM4y
         CA7gZQtk9dDx9KH02XjaLXx0rSpa8PobduURErV1SYpDqjEMYkAw2SJ671W+37TLKZVg
         WvhRtVnn1SXBwr6F8gtCdJuyd6AX37urpYbRp5OMayoQacLHM3BIwaH8a8UNo1Wy09bS
         X9TcaSkU/oa/F3bbot7VLOv7KeNj4LErCGbjUhdiWvftsxd9Oiq1yPeaLDUVTWC+U2C9
         RiSg==
X-Forwarded-Encrypted: i=1; AJvYcCXL+r1WKs/IjdMDXsQ9RbrLHzZVgB+b3U0+9fH25xK8x5bh2U8d16zNqxePI8+sYKKFFDwI4/HG/Iiq7g==@linaro.org
X-Gm-Message-State: AOJu0Yyr3xY4WzG3i1azXik7LtW9mSgsuEHmoAbEYnl+HRiTV9gVWxHY
	1rDCprbGAQ4I5OCJX7oczCboFBq6yiW0CQ6Ff5aqYZmsEu7t3U4pFbqOZmYZ4bgF1FFBzj7gBIY
	kraY=
X-Gm-Gg: ASbGnct3ir4R2tUxt31NZi2URkoBlvs44gzPNftpVzWxSRbB74AlmCFxGb1pcaYYU5W
	+El736pAylHjhPNMia6qUaxVFnsqFHBS4o1AH/myhNiTY9DqYLlgVbtxsCecBvmNlx0YLh1/uZy
	wHtnf5EgMJOc8btLN0sUpQgOI0MpvJ/Oq8KxUET4v1nG/a6jnlXZ3v3v1wkRZj6P/cA/l9BlLGy
	7xHYBz1afrsp6SnBYSY7FMDHHl1wT0x+v3JcT4qggv2nj/UQSwCCfOCsTmCfgalzTY4azwlKn2Y
	Z0ftpfo27c9BO1/wmt0z72qf/bdbtXJ49l2aGG/BR/7q1SY9DTA=
X-Google-Smtp-Source: AGHT+IFnCAwgn7a7X5kZmBX+jZkAWwfoFbz5Gf/9MOjs3udFDxQLRtalnYZlQkwiO8PcKgx9CaND1w==
X-Received: by 2002:a17:903:1b0c:b0:22e:491b:20d5 with SMTP id d9443c01a7336-2317cb4d743mr5608975ad.26.1747073124392;
        Mon, 12 May 2025 11:05:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:24 -0700 (PDT)
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
Subject: [PATCH v8 14/48] target/arm/helper: use vaddr instead of target_ulong for probe_access
Date: Mon, 12 May 2025 11:04:28 -0700
Message-ID: <20250512180502.2395029-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kYMzKZkG2Pse

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
