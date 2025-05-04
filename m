Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756133njj;
        Sat, 3 May 2025 22:29:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdQitLya8FMbuYhXvxMdtVR5SL0ThfZWiDo5/BjrPfVKi1ktlKX8JRXS2H8H1uko7Bb8DN49sqOizUhQ==@linaro.org
X-Received: by 2002:a05:6a00:4c0e:b0:736:a82a:58ad with SMTP id d2e1a72fcca58-74058ae6a03mr11778523b3a.15.1746336574732;
        Sat, 03 May 2025 22:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336574; cv=none;
        d=google.com; s=arc-20240605;
        b=UvESuUJVApasDrOABykKINakm9Bjj9Pk3G8QflkYuT+jMDpbOma27MITHyh7q6hr9E
         mXD/U9wIonbT4eRF4cCugF0azawnHcUd4z9/ELfGdQPR9J0eoQmI8QOs3p4Iji4j3RcY
         1DGe0rxm0LEl3xBvSSy54sWkmBVwC3OvDT2P78VmmyAY+5Iy121/oS8b53ePt/KeWFyC
         +gITW/B1qcIhJhloN1I4soRzMSlFMNUKN7aRImcjXYpNDr4sJw8Zr4aQiACAG8v7Lji4
         2HpR8AsdK0JBaVXie23poRgUSYZnlag9N/ZGaBtK0ZGq/r0mi40xWCozI4AoIEtFAr7H
         BPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aLs0hyci0rcituyWdBDtdIR1bhX23Pfro+/0t+Mt9oA=;
        fh=yxC6K5Rla9odHkZRCeb7+OUXwBYECNMCZnJ5gv1nC/A=;
        b=EBcoZHLSzYls/AjOehwx4TlWximePC2t3f1nzOwr193lZ40lpWnsiAomuC5inj+NeB
         q9NseIuxusB1VELI8Q82LC0m/1Ute93iG9kDFIksa3oopdBL0co5nOnyYGGTQTJTeqlU
         rM2erQZ3fybD5zdI4A1WjLSnxHxC+IKN0j90mIjNnFVu4Yvdht6XjuOifvpdYTIv80q9
         EtBURDiA8hTU2ShraW2pLUoL3jYkI4GcHfhrSVDERoP0aAP+8Ip4iQ0C7hYz7zRScz5B
         G+jNlmJhGRdyOQhkpILNrIaq2OFrZ8xh1gGN00iYPxQh3n+FfASit432VpuwqhJfV7C8
         hB0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNu3PEqV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e9312sor3352188b3a.8.2025.05.03.22.29.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QNu3PEqV;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336574; x=1746941374; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLs0hyci0rcituyWdBDtdIR1bhX23Pfro+/0t+Mt9oA=;
        b=QNu3PEqVh5K74mHV4jp1LfIpYHeBPm8PS2V8HZXgdQ9PAscLyijqr5aReqCgl39Z5N
         +w7XnTqSPQcL9JMt53n/yKVYkz3ekW5hnlyzSZzEXlw191pyMgx1cENyxpziqQl26RAV
         Je2oMurEsEYnWLxERcG8gZQ5QqGAm2sNxIKeVLkbzuJyrLVKSWX5sqZnb3z1sKhDV3n0
         PNjAhm3sMbTyejUSWtqGEqy4fAqIdeR1YIiZGfVbFgE7Nxi92tiCG0j070brA7AVn6/o
         8AXvhi2hGJLHsGVyK9JUNUVzczcLhq+BlLQg38LtktKXX5HLK2EUDZoLXIv72btesZ49
         utAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336574; x=1746941374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLs0hyci0rcituyWdBDtdIR1bhX23Pfro+/0t+Mt9oA=;
        b=MaC++4k1AoXrRIZbrQVyWtn8BWvBLqkzEZrzDJhaEUcmfE/1uPa4+A8ks1OmC4qQPj
         ujoVXW92eb9n/OItMbadJaQRH6gHk8ao7xtm4uobHx8Qkua/E2sW02abCDTFZpqlUQPJ
         H6cbJ9n2Jxt7Q6aj6oaEBgn7y411ukD+2xAIqPtAZgHSSnenv8xmgqf0hqmZoJssQe52
         eA9CGkfO6FWKtPwpW+VyKjbL4rxqOFPjumbH6b0z9jKg2q/WnCDc82kizT1ozi/kXd8v
         U/wEJ1fpHDySMNcsd5+NQU6UrMUM+4zsdaBs74dtGIZR5Vn+GGvsLZjAWE1ppZZ7YZtf
         shzA==
X-Forwarded-Encrypted: i=1; AJvYcCVLEdzulYq277kmIWGQNfnZXx4EYX06F3K19ZYgo67BoCr6pRzx/jjM6YpVlc2g1DSzKm2aGhbCczLYWg==@linaro.org
X-Gm-Message-State: AOJu0Yw+37ti8nV0VpE1d0vqNlgubu1c2GaFaFyS5G4a//aixo2hQsj6
	ZbYYrEOoJ0r/MHVWkLa5AuaoJx/mIFlEJBFIlwR8gaaCu59MrhKNvmNNqxqbYFURsA==
X-Gm-Gg: ASbGncslQdiWakZ3LWGxry58ePBJF0I++QyNWTVRiShVW/xgYorcUU8AceuMbRiHUhX
	57v/pRFfelAExYWOkqzoeu9uRyhQIrpMcG4yTN/Z8V6fj46nFtPlZS7Cz5i0F1cPh0qfMg4D0tX
	n/S/LG7whElK9HxkJbLEgcjuMCixBq3J1BA6bS+NWE8ZtEN84VgjrwS1Kaymh+Zsxg0ZShgNCxQ
	Tr8jE69n+vk8hbNy5sGgbSlPUgNAlvZ6YIP/CMoDFTaGJ3L1DmYtJa4gxUFff5yb1BfweHE8vAD
	MWWxqtQJ8fhOwFMljavd4MGG3+rPNt50xGUuzrp5
X-Google-Smtp-Source: AGHT+IHqt8muxwIyNcbzrNrYudGYr25CIu8flyOznvSVMBbSVnp0yO/7Jx9BB+A2NmmCNDeJqM3yPw==
X-Received: by 2002:a05:6a00:9089:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-7405890a880mr10396879b3a.1.1746336574322;
        Sat, 03 May 2025 22:29:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 16/40] target/arm/helper: use vaddr instead of target_ulong for probe_access
Date: Sat,  3 May 2025 22:28:50 -0700
Message-ID: <20250504052914.3525365-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qOwDYnihaQ9H

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.h            | 2 +-
 target/arm/tcg/op_helper.c     | 2 +-
 target/arm/tcg/translate-a64.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4f94fe179b0..395c0f5c18e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -258,7 +258,7 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
 static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
                              MMUAccessType acc, int log2_size)
 {
-    gen_helper_probe_access(tcg_env, ptr,
+    gen_helper_probe_access(tcg_env, (TCGv_vaddr) ptr,
                             tcg_constant_i32(acc),
                             tcg_constant_i32(get_mem_index(s)),
                             tcg_constant_i32(1 << log2_size));
-- 
2.47.2
