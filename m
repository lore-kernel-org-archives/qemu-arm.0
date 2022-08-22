Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979480ejc;
        Mon, 22 Aug 2022 08:27:53 -0700 (PDT)
X-Received: by 2002:a63:fb56:0:b0:429:983f:b91e with SMTP id w22-20020a63fb56000000b00429983fb91emr17595790pgj.399.1661182073501;
        Mon, 22 Aug 2022 08:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182073; cv=none;
        d=google.com; s=arc-20160816;
        b=DrW19rCVhY5hq7fNeZuI8IA5qrT2zEOdHLJ9zvGFGNZK+2EiVxRPNaI5Pm/b82LlYz
         RyeAfxMjKS4F830I3jRxJdPYRidjsmRvGf/DOfI+AtqnrZD24S8YTAz/pLDXJdHvBRA1
         2XR0rr5kwEB9NdFf5xyjLhUA7skMWXTyD2PJndk6haaIxdX3Zk1nVEwX0+BwCeDIS1d/
         SNN43aB+/+Mb6SvKMQUpM7h0Tqo4JiNy/PlRWdHfHbfEsgSuWDoFfXprkYVEUwb4K0nM
         gV4tYIch7MrPNRfLW9qfyhs4rHUH1laOjtXmiEHicG3jFlvAfWLdwCLsZ4iiTcUq9qBz
         YMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1eh9DETdW0GbelT1RBsxHXY98fMacnuqD6EL7eauGgo=;
        b=kNSOuqqbOjXkknIbCj7RcwY81Ph60/nVbtR/bN4x/tIUim56LlVdjMxVK7lcGGOfSX
         ycupiuHnR0NC9+CUGPQ6aiHeCCdzHioGEsG5ZV359yXM621Nawb+1IHbc9lFWHusFIJL
         4TcJuy7Dt62xjTIslBqWN3KXK/ik28foy6bRY3aeTNk6hu4vZOTE1dHyN8FHP49JGv2p
         abRmo0lBXUaTnpE42vZY47nK09SNbOhr+lNh2Jp0Os0DVYGqJlX0CJ8c0XHEmLCTjqtB
         IFzPMb5Odi1ZES33i1C5P9L5d1YDbUIrAvmvXf6ifRhpORKhNsmcSZzXB4io09u5o4aF
         mu5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uh4Mnjf1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f13-20020a170902ce8d00b0016bd6549c15sor5113624plg.163.2022.08.22.08.27.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uh4Mnjf1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1eh9DETdW0GbelT1RBsxHXY98fMacnuqD6EL7eauGgo=;
        b=uh4Mnjf1Tj+JoUM49nZJOdbZYwEzSE4XOAJOFM41uoIBywpVKK/exeLo8jOe6skHvu
         i36lc9g8D4KhQzmo/1ZNbDL+brtcxOig2A2vi3SsEiHiiB6snnwaMQyrfE1b0CcW+ID7
         GcY9pN+vFTSXBYe8AVfvtXlGFFh0k5zPplAsCuMQttK+ZluAFA8dyRY1skHe4Ns5r8c6
         PzHsVi6Ss+IxbVMSAJAfaxvymEmjzi9YHby5ioPYPSFkGDrUZcJDf9s26WPch5pPz8A+
         TBMZnSZsyh198fapgEb1yEE2cwL6NoqRAoSqdHfr3F1MqBwCYbUqSM6aG3HXEQrsYKxt
         QtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1eh9DETdW0GbelT1RBsxHXY98fMacnuqD6EL7eauGgo=;
        b=DHXybrp/XhYxB/oKEYkRvjTWjAkiLlSoGaFDEyYnxaEm3bopIdsni32OjSrMPkuMSb
         DiB8kHfzMrprwI8Ah8Rl38KWJO0P9/q+gQTAVHjorMcW7ziytcQjczmsdHF1kTOA9Kpd
         szLHHRSn4qgqA4iZmVUJQnZWDJyolFxZ3/fOU5V6NZu37R/pemKEvX0biVN8eOOY7lpZ
         ipG6x5XOLDjIkMiwSE86lJUhQwMz3/9CpuHghC7Num8J0LfU1TG4T1F9OuyhohWKWqA4
         Xtme5WE3zvsLBZoaRbkndsoGrnoHMKvw2+yYp8YzBt+IJzd9M/Fs/pSYdiMA0o5uu+pl
         IGiw==
X-Gm-Message-State: ACgBeo0oqyAp5ZC4OmSrvZoNf1nEvlpZhNyGf07FhBpJyn9FIiImcsQw
	sRqvk2nSkonwqY6BsBhgFiuavTVJd1Y7Qtbk
X-Google-Smtp-Source: AA6agR7AVDO+glixXjDV2C+oRmQe/mMbmMIZpxCh5XFb5Rf85NI1VvTYUITWJfUlXZ+XoOiWBCq8Ug==
X-Received: by 2002:a17:902:d48f:b0:16f:a73:bf04 with SMTP id c15-20020a170902d48f00b0016f0a73bf04mr20911488plg.43.1661182073118;
        Mon, 22 Aug 2022 08:27:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 13/66] target/arm: Add is_secure parameter to get_phys_addr_v5
Date: Mon, 22 Aug 2022 08:26:48 -0700
Message-Id: <20220822152741.1617527-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: efPO8xCzofbG

Remove the use of regime_is_secure from get_phys_addr_v5,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5628581ddc..4609278b42 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -414,7 +414,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -433,8 +434,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -472,8 +472,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2512,7 +2511,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                result, fi);
+                                is_secure, result, fi);
     }
 }
 
-- 
2.34.1
