Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047863njb;
        Sat, 5 Oct 2024 08:26:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURieGpwO9PQz2RcQaOlAMdt2nSqnrxP3kknf9vk/nUaLQBfXc6c6EpXtkvqIWGaGP9wqRQB8ikCU8MMw==@linaro.org
X-Received: by 2002:a17:902:da8c:b0:20a:fd4e:fef6 with SMTP id d9443c01a7336-20be18989e6mr169368195ad.8.1728141966860;
        Sat, 05 Oct 2024 08:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141966; cv=none;
        d=google.com; s=arc-20240605;
        b=HbJcTOEsIOZmsJBqz9JzyrOUPhR7E8qCS/jHqlzirKeLfdpxjuYPWK+GPmgCjYvNAW
         frITFrXg7GFj3CCVSHcm3fr5BBXfwhfROo0c71VWU6UCSHaKKZGusynl/z8HBDNkiTIh
         UGfab0jV6oUJnc/nKDait41Z2Lp+P7Ttl9TbmjC2XwXoBQV1tH3kyX1R9oGpkkNEVxYl
         7zOAdURzfJJfT+6mRbaFKFg0eMIfKjZ8f49tbTqimkLdoSBFtRwvkzlUrLfq3HNHzNQw
         HhDIwR1iskJ/ffeAbvXKfEE5LlK5W69Mq8g8JXJLskLnRGlTSr7Qr9qbNEj8CRqEuYv+
         faXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        fh=HhDJiYfIvtTCKLYhTNZxuV1FYw4aERR21SpWq8mwDQA=;
        b=WS2T0LH1SV8DNrvCICLjDl6kz+rIr3oI8l0lbPTCS1Vc3h6YtX2FukFZld9oXuBpJj
         myz7tG8dGO7J/Ih1PoMFYHNtwIF2/N1foEZv6xSMj2jkkwSi2rOAmSJQAHxNG1ZcJ5Bm
         DKZozOxvVW67k6nqsumI41eRQ75ChSKUI1KH7m40iyIyHz/aQ6/M2oQiAHU6IlfxjGq1
         lMZYQg5kqBmDEQ7NI7W5zkgguaDJknC/4/rHm8gezUY2FmPh8VCxh/jUVpG5F4q87349
         tRp2pHdAMFA+uXnRgwebNxe0qYvpc3z4IUQOp8dQIbcLr13S+0bR1tnymcji6Cc+0rIp
         TDQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYUEOaV4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1370dba8sor7193145ad.8.2024.10.05.08.26.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYUEOaV4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141966; x=1728746766; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        b=yYUEOaV4ZQ4s75oZr1nl5t+EvJx17VNjK5bwo9Oyrk3n4A6GCkjdh8KrUVD91zMnSI
         9UEgRDeenwrlqoA0VVZitRGPiYKUtpvQuTDZ2KsahzJK6okjlrDQrcebWY2xuE5B7vUI
         8LnGVQmEfHK3warRmMxPx3/3XamG/28ai5TgYWnh15P+xzVYO7t1lJJJQdCO1lPjM2jC
         Hd4bsWPQsz/R2HnkOfGPQRIstIvbEAW58gaZpfiEdsqZG0D/dn7JZbg1rAwEkbfBCq3J
         P6zub5O77CSKroN8KBig0Ng8IQc8AfHeigowedyrnQTAUhQQmDE94Px+8dl/AkJLv4O3
         txCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141966; x=1728746766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=or+46uGq1e2/GbDMKkBXfTr+x8kd8hih+f1GC2rPQFE=;
        b=Oavn0nhsacFwcev+3F3eEV3klDTMefhOhIWhFSwM9FEdE8TsuSfggckSsP4l8CHsIJ
         wWgRHUEqhKanAeToduHFebiexqsqQJHZjxDd7UnKqa0Ru8YlU0bbsBMMdThCjWlqGLSs
         2Y3SkUUxSsuNnphYn/Cikg+cRxIeRcpRIblIALFUW6cnMtJUC1MnaX9ZWYaiU0OfKVAI
         Ms/ILXouswIUessTH2fWcyE3Uh/4ro7C2fslT6w0/asAUJojz1ACNxZrjFfVlrNaLz1+
         FquIuYcsYBB58ir1xWcri3/Aza9ImdyG6w3ZSKYW0k45N1a1CFEzEhbKTXudiqzqHAoR
         0HUw==
X-Forwarded-Encrypted: i=1; AJvYcCW5lH0KIN27uL8lbqLvE03MvCno3xZFt2rL33Q8mQo/VUB/qdqgTHbzy27738Kla80SIsw+JY9TF5LybQ==@linaro.org
X-Gm-Message-State: AOJu0YzkEDtqfrilbWtEZ7twGSN6Aaml9Wj98jw7ghXD6x/uAPiGS+4F
	ucFRDjKjlOLbrXgdrRrwXfgUtgPeI322t+oFb/nk4LHgRWo4fHzyV4irpbheofzAWA==
X-Google-Smtp-Source: AGHT+IEdkuFzCvH96y6A82QUTiEIn2YBst+4kAUKQBDmS2IlhhIPoF71jwAfADtzZPGVJyjEo7r1sw==
X-Received: by 2002:a17:902:e887:b0:20b:9365:e6ea with SMTP id d9443c01a7336-20bff393be4mr111588295ad.10.1728141966447;
        Sat, 05 Oct 2024 08:26:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 14/20] target/arm: Pass MemOp to get_phys_addr_with_space_nogpc
Date: Sat,  5 Oct 2024 08:25:45 -0700
Message-ID: <20241005152551.307923-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T/UF2iklVFVX

Zero is the safe do-nothing value for callers to use.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 3 ++-
 target/arm/helper.c    | 4 ++--
 target/arm/ptw.c       | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b16579fa5..a6088d551c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1461,6 +1461,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * @env: CPUARMState
  * @address: virtual address to get physical address for
  * @access_type: 0 for read, 1 for write, 2 for execute
+ * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @space: security space for the access
  * @result: set on translation success.
@@ -1470,7 +1471,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
  * a Granule Protection Check on the resulting address.
  */
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f77b40734..f2f329e00a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3602,8 +3602,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
      * I_MXTJT: Granule protection checks are not performed on the final address
      * of a successful translation.
      */
-    ret = get_phys_addr_with_space_nogpc(env, value, access_type, mmu_idx, ss,
-                                         &res, &fi);
+    ret = get_phys_addr_with_space_nogpc(env, value, access_type, 0,
+                                         mmu_idx, ss, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 373095a339..9af86da597 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3559,7 +3559,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
 }
 
 bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
-                                    MMUAccessType access_type,
+                                    MMUAccessType access_type, MemOp memop,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
                                     ARMMMUFaultInfo *fi)
-- 
2.43.0
