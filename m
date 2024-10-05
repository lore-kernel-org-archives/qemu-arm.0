Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147591njb;
        Sat, 5 Oct 2024 13:06:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3+kxc6mi/5A19+5jKr+HajE+9+2sx3jYCz9ZizXnk2nje4AA+g7yzYpp8wclGuzAcjEXIzt2e4Hj4eA==@linaro.org
X-Received: by 2002:a17:903:185:b0:205:841d:122d with SMTP id d9443c01a7336-20bfe193471mr95838795ad.26.1728158763110;
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158763; cv=none;
        d=google.com; s=arc-20240605;
        b=JQC8gFCZ/hWOcleeBtuUG+EE2000G64nHpN3C6HkmCbElVdOA7HtNhDGFi2rEQp69j
         HD/DhW9p/hVDErm0CqbC2++U5FM/FVrGkrERaBM30LDhYXjXNurbY6Cqty4TkP+fvWZd
         BsMLrwr6SdRZyMGPvBt9rY2oqRqXFmuLi7UMc9XF6JOqKsQg/3t1cHzlOxLJkobYaOUa
         GxMcNmvyW9v/0H1j2Zsyg8kNUaWb3zFGobtYbYNAZx1c5PdlhxDOo/kWlgQsSfD1486U
         /eTp6msG21Ao5Vr/p0SeD9rT2Qn3fdEe0giflWFpKJEomio7W1WvTDp4+m8U8oPzZo7u
         XuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        fh=RtkT1/VCU0uQU4RhXzJpHZIElb023/F9ImfxILBE7a4=;
        b=aCKezDK6FmmQ68eVu/+Ssh3Vjz8vCBAe1INnuM+mExeR2Ak0V0Y5G6UrUwGG2simmG
         rrqb36uNWGnvNaYfZD8xggc9FHwW97kxqHPaybGDCuBtR03CXqf5z7HRROTN9RqEhu/J
         IAGCuSBS1jMA2fBJ2Xs0w/zKT1H5hQbh8B1nuzrMIMcSyv8gJmsvSAKJbqWk5yUPs/0d
         VJJaUqRgYkLNb1/3Z7rKaa1W5nVywUNnf5Rlg4avIE0pFEtqjFmXVsZ8WFYEKpm84XBI
         AG1MYAdLEhmDptXMt112O9aaGpreBy3MU7YbOy5T/k86n3ppdpvLGxagroVsI2bUfcQ+
         E3sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xt8f8mKm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1377efc4sor11397195ad.0.2024.10.05.13.06.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xt8f8mKm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158763; x=1728763563; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        b=Xt8f8mKmrV6CwKyRTxaiFt8Ipq/ZKj50/pAEYd5ij5CIxqNbn2ed5VVj5oXGqqfTFO
         5Tj7keDnTt2BOjQDcCU5JHJX0sLv6AJSHQKGxAonF8up+vYXdKofAi3va1+gWU06RFhV
         CNqEFejLJ3UHhT74DPTHgvJIgc7ORwrik5Rr0UsgZ6qw6DBgPNsdLtGlCGNc7Y6k62MR
         sADm/H0GjvbaVjvRBB3PQ9umY79VZLg+5ugOSiwsDVWa7D8jxPcPLe+UTE5z/ohuu4v0
         hr2bsU82xmw1M3pzrGnqPNy3nJrEtKzFdBlBzbcPWrqIR25qTGgLAtvBHAQH+CX/snxl
         X6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158763; x=1728763563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        b=NBbTlqcooPNYPCxuoWxF6gjb3XRcDt64EYA6LEf5VimgW13cLo2wmn61Ndcenr/yhh
         2R96oXpcqtNhWFgET8SvTvoJufZliOBelcjWZTfVg+TSGYxmJRosSGmBNQV2j/C5bIe+
         U7QHJvYZfvEUViMEQrKD0lCdDFV+guHwjCspRiWQlAH4iRNlMeU6hAo7BDZOeAOFXida
         8K5AnOKoTcbuvzkzhR0jK3adcAAzvifrAK3vVnARjATFW93IY81VTKHqa2C5+4whHyj6
         LXIedbeRlk/2TyNQR+bzMzV79m7WjLF85407GIQAUmEXdzMl52qEFGQcO6FfYgu/8cM4
         Cocw==
X-Forwarded-Encrypted: i=1; AJvYcCXQLhlntg5e1IekEEH1Bv2rd59GKEMiBiswEZd6mxhtiU2SiZ8KUdT/JzUNLYok9uPHQAn1eNtP8iT3sQ==@linaro.org
X-Gm-Message-State: AOJu0Ywjr9gPo7sjcTU/LeXZ1HjX5EPUWmXU97abK+6TMGCcaebRyguB
	zxfxseHM2ukjd6JIF2rXl4zvb2U4ZrSmclq/c3mmuGv1R/ZAL6TDfKNqI+FT9DZq9Q==
X-Google-Smtp-Source: AGHT+IFmM8Oxp421B76h4UpAzO5VbLx+wqOrR4XfQnLhl5uTco5sEvRm26Oyl1URtBb3k58uPkW8Hg==
X-Received: by 2002:a17:902:f545:b0:20b:a576:1896 with SMTP id d9443c01a7336-20bff190668mr89398765ad.43.1728158762695;
        Sat, 05 Oct 2024 13:06:02 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 01/21] accel/tcg: Assert noreturn from write-only page for atomics
Date: Sat,  5 Oct 2024 13:05:40 -0700
Message-ID: <20241005200600.493604-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: W5aEukKblket

There should be no "just in case"; the page is already
in the tlb, and known to be not readable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 117b516739..fd6459b695 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1852,10 +1852,9 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
-         * write, this shouldn't ever return.  But just in case,
-         * handle via stop-the-world.
+         * write, this shouldn't ever return.
          */
-        goto stop_the_world;
+        g_assert_not_reached();
     }
     /* Collect tlb flags for read. */
     tlb_addr |= tlbe->addr_read;
-- 
2.43.0
