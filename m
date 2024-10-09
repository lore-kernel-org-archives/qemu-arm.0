Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532028njl;
        Tue, 8 Oct 2024 17:05:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUzChLHhtADP7qCoU5nbgLn1C329MLUyGHPFnWD40Oo1J9Mv/6FPZZDxEzQTht79PxtAfgKxRizQPaWBA==@linaro.org
X-Received: by 2002:a17:90a:3f87:b0:2d9:dd4a:6a95 with SMTP id 98e67ed59e1d1-2e2a2525ff5mr793691a91.25.1728432304856;
        Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432304; cv=none;
        d=google.com; s=arc-20240605;
        b=SUN8cnCC9KGuYV8yflcKn/E2Iq5yqVGZeH1U8KeWVrP11aZCliZIOaWvKo/84nRv5v
         aNKT6zEGeEZ0qC5eyte0LbOx2GB9ZLB1lWhUdTHW1DThN9ezdXPt8JRylIfLYttQ8I4N
         nZEZChUAT6Jj+TY5aq2FzEsd/p3NK2sCjVFtrqMe88a38/S5i6Q1PrR8DmuaIPLkhrp9
         PnH3+D7DFobpfoHaLRav9sJM9PoOTLQsgyGzLAbopTFhVE/SoNXvUD67hJDO3j9WMAkt
         WJGkh1dTjpAuhqWbVhZx/4BoKSEwHzS7jWQF6SL1KNYBm1R0a9uF9b4jr6AwfY7z7ef4
         yTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8E2Z9ZSy95UZsg9Y2N2fIiaRxpU5aj12TR1V9ijHxjM=;
        fh=+IROt+xhjYabiVCVeeedPiFjQowCjpMm47xkgg6nCVA=;
        b=JbcPyHlax5nSNoHw6XL5Qjmo7sLy0wiNs+j9Ty9SVil1rf3U3gmWByRpnt7IBT7zg3
         3dOWNJV3GxTR6VFWinSGVdraiqkts7+PVKhRRn7vtgrmt7+M6dOYF8/f9K3uqkU8z7b5
         zr0WvsNbAkxc6ez/oJOC/MefmT4HhRgKyL/ntqDxmxWAs3QpTBpumMPSTj6p5VPO4OFd
         OMdqVrF8On5OBDvo7lXUV00oMYJCUomHXbEFYHF1q+4koCHS/0cZ/gvK/i4C4M6TQRbC
         0uf2uEtW0xdH/Ey6gSBHZ5T3xDehjPznwg/cGC2ri0CyrBFtqgawK0/fCkvwT2IPaSim
         GKZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uJl7bDPM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138a7463sor2916125ad.4.2024.10.08.17.05.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uJl7bDPM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432304; x=1729037104; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8E2Z9ZSy95UZsg9Y2N2fIiaRxpU5aj12TR1V9ijHxjM=;
        b=uJl7bDPMIKbsfykfu1hXq09WjeKWh0CZ3dTSC2nvZCl2bI/J5r5/1kwniIYUkZNsbD
         x3dvR8RWqNGpsKuVD/HbbVL5LEZnrLCGS/1Tg0bUwlR0sW8Tm7VM9l6Vk9zTJX4DTJ+Y
         qLE5SYkcG1gT+SLUNrhwXdPd8b/k6BAH8nED7bdskxVr+E3kan+x5WXqDhSZPSIBacX/
         nIySYhHerROnoNH17+sBHHraIVq5Iwc/YhrFntwOATmGqnEXWlcV4jMIud5sCeXZyvsa
         8KTRkUPd89ABuAmiHjWjMF01Gdk1Pz433LKd+avnVzEp8e+Ua+4J/h2LmbgCjFs8n9Oo
         ds9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432304; x=1729037104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8E2Z9ZSy95UZsg9Y2N2fIiaRxpU5aj12TR1V9ijHxjM=;
        b=pz5kJZBz0g6LS0otTIFw5bqr/OM9oWbEjn7v1IQn1CRi0hUtUNRZAdCVPxs7UYYkOT
         Gd4r0Bp5xBZrSsn5d+rWJcNE3UMCuYuVOnP2b4HjDmCTzXklwwyFiRzGpUvV3KqLh0+O
         HCgiB0m0vGDWoJ7rWDl6jMsSBLDGKZ0kke+w2/OcfNpfBxi7jWQGxJ8Tt26fPR10cw+3
         wHqufQe8wsV4MMZEdnR9jCTfnipxVoZWp9fdJQskjdWhyqFDSLYIshCjK/w8k4qhdJbe
         oznWoxjnhCAWrsfl4GZ3iS2uRsBgE2LNtozMvdHgKx/E9zWit3tkoHDnmwQ0i8Bcprzw
         h6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU75Q+wPOthSIqb1NOiBk8Oqbkj/ScXxG+pymewBqvhM7uVObHaVrPIC1/BvYuFYe/28a8DB45t1nzhqg==@linaro.org
X-Gm-Message-State: AOJu0YxXFvD549RuNytAcTwvTVKcuNPsZxwbo3BRr5exILEd0rX3WLc3
	m6ScAfb1Qe4GlX7F1GS6agXh1wZOJ7wFj3fwdKIb6g0I6jtHYiHeAUYUOguG94eNiw==
X-Google-Smtp-Source: AGHT+IF0ZLww/QirXn6eqf2utM1nSiZwyzsJ3soHtkS1Z0DxnmXSBaV1UhTlgasVQznyDC1QSh7zOg==
X-Received: by 2002:a17:902:dac7:b0:206:fd9d:b88d with SMTP id d9443c01a7336-20c637986d4mr11253965ad.61.1728432304454;
        Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/20] target/hppa: Fix priority of T, D, and B page faults
Date: Tue,  8 Oct 2024 17:04:42 -0700
Message-ID: <20241009000453.315652-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bQtZeM9VJ+l5

Drop the 'else' so that ret is overridden with the
highest priority fault.

Fixes: d8bc1381250 ("target/hppa: Implement PSW_X")
Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index f027c494e2..f71cedd7a9 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -288,7 +288,7 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
     }
 
     /*
-     * In priority order, check for conditions which raise faults.
+     * In reverse priority order, check for conditions which raise faults.
      * Remove PROT bits that cover the condition we want to check,
      * so that the resulting PROT will force a re-check of the
      * architectural TLB entry for the next access.
@@ -299,13 +299,15 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
             /* The T bit is set -- Page Reference Fault.  */
             ret = EXCP_PAGE_REF;
         }
-    } else if (!ent->d) {
+    }
+    if (unlikely(!ent->d)) {
         prot &= PAGE_READ | PAGE_EXEC;
         if (type & PAGE_WRITE) {
             /* The D bit is not set -- TLB Dirty Bit Fault.  */
             ret = EXCP_TLB_DIRTY;
         }
-    } else if (unlikely(ent->b)) {
+    }
+    if (unlikely(ent->b)) {
         prot &= PAGE_READ | PAGE_EXEC;
         if (type & PAGE_WRITE) {
             /*
-- 
2.43.0
