Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532036njl;
        Tue, 8 Oct 2024 17:05:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMUIwvuqu2kp8gndy2xNd/KKW4DxCcQ3Tjy6eBv+QZEnlwhbJOaky+8wSIxonZi7UMpV0hWw86h7EIHQ==@linaro.org
X-Received: by 2002:a17:902:f541:b0:20b:49c3:7856 with SMTP id d9443c01a7336-20c637112bbmr11636855ad.17.1728432305707;
        Tue, 08 Oct 2024 17:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432305; cv=none;
        d=google.com; s=arc-20240605;
        b=MICvELB90cvigBAj6UOtvYyAo5Y4atT2fGccNh9DYU6poJt1EetFT3Nss1XzYw9oOc
         2uIFXitrwTamt1fQ4tvljIrAk7keRm/rK/0Ou09I9yLqs0DXBCd2/SEinEb9MFNRef9o
         UJRK4e17dUph+YrhYj4Aedvz7yz4VCZTZT6/IDT2KUqRst0jyM9Ub49626T7yEiaGD7T
         llran8otEMllBB/commdcNX4n1c+wlp8ks0cHXWH29qy/RC+DMSpCuYK2hvBFZXnbTe4
         1j6u8iWj6/pK6AV1NSnu5XTllueG/4VhLSqnBwz0cm883CuMolgKsoEK8q+ElCSW0t2i
         0l/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xQhK8NjjgW/kNvx5X1m22TpA6VVxTZtyOqTVcWaZJho=;
        fh=RW1CnHu1d++NGXddHX+DAJwJ/Ef/fgwtp3KQKtU92ls=;
        b=WO91Bt8ASnY5K/exzZYz/BqlP5ALgNEXrEpasQV+51famMcshs1xtwDdzNsIXYoxgn
         SJdetc4EgK8ffBtKiJ7homt7+2kaBJgrXYkeJYRvCmRU3TqcASWE0BvnOzGaykTw7/kX
         1xp7fqVGSOcyMluCn/SNcthw54hHwIJ6Hc0tu8ddeHMVfgtVwiZ5cHQgFyEwURQHcQeV
         syNWNZdD83I7/V+hrqxOPwITC+k5SFpsGOotKKOowQ2pRywPpWfIAi3YO6dqZX/93Ttn
         86swLwWZ2L/nFBAEu6uoIbg+Dk7yaZa5RCWVsL90DTiiShwXM8OvDM9h/f4bE3recPHt
         IVCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DKGoLRPF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138fd17esor48332915ad.11.2024.10.08.17.05.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DKGoLRPF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432305; x=1729037105; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQhK8NjjgW/kNvx5X1m22TpA6VVxTZtyOqTVcWaZJho=;
        b=DKGoLRPFSjDbxueqRLXYes4pBGopTBl5bm/xCghWu35qNzi8f68MpgwuTyTOznSa/4
         gKZ6numLPT0PR5xkFBRr3OEwMRKURr+aV1b8Gqb0uvBsU8LHhhhx9fWSpfV+RiSFCTWn
         ZsGwzfcOAdj7qP1U026lC2UBmAaVl4JzEcJOjwbQN8+lLfmZZNEQDos4w7N0It/SZPwm
         Bd9A4SIcKlkyFsT8iiT5n1CJZTlVxdMrgB/qGc95GP53OTe4/+WQP9XHscQh51C0Zv6v
         PwGx8KDXGnK0V/p9H6o+pW/+6N9b4KsdJg8gfuFLCzl9FaAk/UnRokNv5do512YYuCZm
         tsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432305; x=1729037105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQhK8NjjgW/kNvx5X1m22TpA6VVxTZtyOqTVcWaZJho=;
        b=hVIZYf5Xh6LMA/yDNAwfkZghJH+6m9K3FEthzoYwXLxtFkobJ2I+RR3asvxTVfxk8f
         +jQyClpRsRYlGudkE/wSt1mdm9SDG+jG5mVElwSfWULH0sDa/roUe0VPgjJvoK8RO+8b
         Vf/6/zv5Mv6b3QsYF18nNagZe29jUbGNQw1VI6NEHYcCZ0hlg15XITkSloyhk0tbUOBD
         OmLzaAr1iEjURfF3g6w41y/+RJ2UKTP2CqD3jnJ6T7vjsFeAHhgWi0YX6GS+jrf5sHrz
         616yVpedujv75qGL52lsqBn1Zvhbx0Hd+HBv38/OD5x6/PkQ3stIRmA+0qFI+lx9bExA
         m2Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUXK+vg9KMgRemtssDYmw9S5xriZs94iUhnPmem/RPTe7Az8qA7SfYqlQf9f3QP4CqVM7DP+EsXMfBVqw==@linaro.org
X-Gm-Message-State: AOJu0Yx9r1Qoou1ySnwE2NhjSyH4Q6B0AL9Tv6g9VWN4g8Wc53L3C2k3
	6QK6ILhgpMmXKKRRqkEUNTPajNPduopytaq78eeidjiw5pqj1vrbxCo8k60+5Fh1SA==
X-Google-Smtp-Source: AGHT+IGk0V3WqNWZpuoKiyjHCbvkavwK7mPvzoRJ0f7iYAkKJh77UVywliO2AjnwG+Rua0FM3sG5Mg==
X-Received: by 2002:a17:903:2309:b0:20b:51c2:d789 with SMTP id d9443c01a7336-20c63711761mr12234395ad.16.1728432305301;
        Tue, 08 Oct 2024 17:05:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 10/20] target/hppa: Handle alignment faults in hppa_get_physical_address
Date: Tue,  8 Oct 2024 17:04:43 -0700
Message-ID: <20241009000453.315652-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DBkD6/5cwK7X

In Chapter 5, Interruptions, the group 3 exceptions lists
"Unaligned data reference trap" has higher priority than
"Data memory break trap".

Reviewed-by: Helge Deller <deller@gmx.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index f71cedd7a9..d38054da8a 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -221,7 +221,7 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
             g_assert_not_reached();
         }
         prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        goto egress;
+        goto egress_align;
     }
 
     /* Find a valid tlb entry that matches the virtual address.  */
@@ -323,6 +323,11 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         }
     }
 
+ egress_align:
+    if (addr & ((1u << memop_alignment_bits(mop)) - 1)) {
+        ret = EXCP_UNALIGN;
+    }
+
  egress:
     *pphys = phys;
     *pprot = prot;
-- 
2.43.0
