Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4189023ejb;
        Tue, 13 Dec 2022 04:52:31 -0800 (PST)
X-Received: by 2002:a05:600c:4f85:b0:3cf:93de:14e8 with SMTP id n5-20020a05600c4f8500b003cf93de14e8mr15293214wmq.39.1670935951492;
        Tue, 13 Dec 2022 04:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670935951; cv=none;
        d=google.com; s=arc-20160816;
        b=wcBYyECzLEfvcsZE5A6UAmbSDESB9cUwQJVjK81LEakcZBTkCYxlVEUCbVn8mViF5w
         vqdtc7FxnCLHLSCJPgcKy9qfsQvZTn/7hmFRqqSbLcaV91odLNz/EpQxR6uHRPHAWo7y
         fWcoU/0qVmFKv5G5LD7Ig4VLExK3eKLbj4qcGio4wxds+Zk4AwVEZpOXk5L60LU1hp1Z
         pemS8ZHbcNasv9UiCmZpYvRn6UsvibrMm4ko3Nn3P/c9LhqQn1xawoQbLG7lAonNDosa
         euKa1YBJxbjdbFX7rY3ErBeYg/faxCl22YBR20oTX6C2acYQz7IkV62yVYrMa3ZpvNuF
         9bcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9K2qPGrTReTYlsl4YSIfP//FNBSyIjWF7QnWmXpGYsA=;
        b=F600WhWwfBMPsFSr3v/7Q5J/QMkSzklp/rqE1Dn5FtkLh4oOT/wF7jFAFaepduNF0A
         JSddiAnDiQJERQMsy3zPyDBRfIdyGMhUmz5Wba9mmShXw1eOafSppLohJhNB68zaTPgw
         g0jiDtY+gDtZuGzgTFiNzkpZy7j0ZZ+qI9f0x2IG/Gr4VO5x9xdSVoOcFqfZq8l5g7dt
         dECyzY6Ail2lb/oeeUxvFjEoKN7OS9kI5j+T9WvpR4Vy3BdaWN2SKj3rpcfXwLk0SJa8
         9f9LK/mCv5yFdwxZtE0/F/g1F6BfhTxfNp/FXKyNvhrz1XA5MJ/7tnBRO4XjRHFJj6hc
         LXuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yl5BCsoE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b25-20020a05600c4a9900b003d0047d1b63sor3116221wmp.42.2022.12.13.04.52.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 04:52:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yl5BCsoE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9K2qPGrTReTYlsl4YSIfP//FNBSyIjWF7QnWmXpGYsA=;
        b=yl5BCsoEDuxmjJkMLGADIVk+7r8BSL7oepnDFby7GNPpQfmQ5Bn+smmkNWKP7MY7nj
         CiCsBjoLiYR2B5BR/DQ2D2ziVZtoDFyQDJw5CcT9HrbV3cVjwevAC9DQYJtNxpBJWmDW
         qgw/WVDJhEt7ZK3FKPs6rJfcBSJbjP6N01bCBm56P3ru704eGUG02glHV194chqOhpoQ
         gtTSzLFX+XRxlAnO25y+QbyX/hw6j4SFRiQowJug01p5XQkGSuFCWlrRYfJ/cRy8saYc
         H3dTMZMz38AM4xGAXMO+0EGrukQLrdKiDssA0IIA02sd3JUpknCLHzUzpDcBe/ivAt3v
         vJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9K2qPGrTReTYlsl4YSIfP//FNBSyIjWF7QnWmXpGYsA=;
        b=DkWqqMrQ1EID1GqcEZqDQQaHiDmQ5IK+ua0TPhw5cbLi5E7ZwnEZqtmmzeInujkt5v
         dOi0RdpOnJ93+YzFEw/mn+CoZzqVx18KMG/jKl2ZaVjF117/LOyw01zqXblK1hjwIsEH
         Z4ZF/slntNtz5+vZ2sEvlhk/xAdiam/iZzPYohmEdQPFOPX2g3rZRNAhBi7lGjnouWAo
         OtrjFFqz0/Iii4AU8AOXxakNgBACQFRU2uUe7989q3yxY86YH1IgA3//t/FuJ7gfgDli
         5szox5OuU1ZVK60uITRlq9VtIlpUeIkEOC4sEbcabW2tY19hlndSfuWiM43KiKQ4Iqf+
         jyTQ==
X-Gm-Message-State: ANoB5pll5uKIDIRHq9hs5UQ9iRCYuSRq9ryErrJeDEdZISVULFMLOFw1
	urdVzyk5GIneg3BVdOwy1zeOIY9U
X-Google-Smtp-Source: AA0mqf5i7uzOLLsF0oM44lU5HBiiTzazh0C7ReGXX9LYbBi9XR+7AIoiqtUfeiCSfZTn0pRfqmQj/Q==
X-Received: by 2002:a05:600c:1e25:b0:3cf:9ac8:c4eb with SMTP id ay37-20020a05600c1e2500b003cf9ac8c4ebmr14901967wmb.24.1670935951219;
        Tue, 13 Dec 2022 04:52:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003c71358a42dsm17603605wmq.18.2022.12.13.04.52.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Dec 2022 04:52:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
Date: Tue, 13 Dec 2022 13:52:17 +0100
Message-Id: <20221213125218.39868-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213125218.39868-1-philmd@linaro.org>
References: <20221213125218.39868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tcrLW6SH+pIb

The tswap64() calls introduced in commit 4be21d561d ("pseries:
savevm support for pseries machine") are used to store the HTAB
in the migration stream (see savevm_htab_handlers) and are in
big-endian format.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 66b414d2e9..8b1d5689d2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -39,6 +39,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "qemu/log.h"
+#include "qemu/bswap.h"
 #include "hw/fw-path-provider.h"
 #include "elf.h"
 #include "net/net.h"
@@ -1357,10 +1358,10 @@ static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
 }
 
 #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) * 2))
-#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_VALID)
-#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_V_HPTE_DIRTY)
-#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &= tswap64(~HPTE64_V_HPTE_DIRTY))
-#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= tswap64(HPTE64_V_HPTE_DIRTY))
+#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64_V_VALID)
+#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPTE64_V_HPTE_DIRTY)
+#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &= cpu_to_be64(~HPTE64_V_HPTE_DIRTY))
+#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |= cpu_to_be64(HPTE64_V_HPTE_DIRTY))
 
 /*
  * Get the fd to access the kernel htab, re-opening it if necessary
-- 
2.38.1
