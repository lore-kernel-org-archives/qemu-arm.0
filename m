Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944670lfq;
        Fri, 2 Oct 2020 15:00:04 -0700 (PDT)
X-Received: by 2002:a54:4619:: with SMTP id p25mr2457597oip.18.1601676004450;
        Fri, 02 Oct 2020 15:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601676004; cv=none;
        d=google.com; s=arc-20160816;
        b=kxnEQ0snOSK72RPIb62NaMDQQQgVG3CiTp80/+kCSWuV6ZBUzHBLjdJX10pbPv2EEI
         TWMuzD/iKJgMuECkeVDQLssTuiefB7AKg1rOHRV8fGUOAlSRkmzqGxcfjQaC97qbe5qB
         e1TEJA/OPftnq55kHxE2/8F2d+VFsgqT/cTkIiC9YN4qNDCxoUeoZYlGGhNqZ/PKBvJS
         H5o/iy/HRpZzkf9E/+wScKi6gV9ZjCwFnkYE5qUB1l5/oivqMGsC6NlbuDPevRiAAuVl
         bkIbO0kLuFmoUGpJrkmIjyz+ozuygJl0/MBqaLlukYYj/UnfULpKSGRAh2hOsEDbhTjq
         XNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qqi4bkkjlO0OmQq7eFe7VQbO2qUT9g9kE2iVHKsaR1Y=;
        b=zDpShuvVmq4pNJ9yhqzahOWv0ezRYbhg726l1YNezHRaUkEhPvp0ukLxanxaWd1Df1
         mPwqKtRTNwI/v/OvskZRu0RW3kW/kjxJ3r+DC5Rr7uyL6ONWzi+nvobji1/UOemHIeIu
         j271poVl6sKevFjt163zxWsMW8R7wSsm8YwekY/hbcRw7xLs1KHU3JXZnLxBUPbCPHyO
         BndSnEzMA/6y8v5+8WtaMRDXWqsJULMrXWeDr6wfYxm8Tw0BDHtFRZ05gWYdTn+HXiug
         TS93I2nvxqbvnjNijZzsGNWAsOqGo4BlFOb53JQrsDqqoje9rbywegF4Gnr6y3NU9UDe
         weqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D/tYdAfS";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z67sor612040otb.16.2020.10.02.15.00.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 15:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="D/tYdAfS";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qqi4bkkjlO0OmQq7eFe7VQbO2qUT9g9kE2iVHKsaR1Y=;
        b=D/tYdAfSWu0ZA5cfpaVheM9LeiEXdHESrKwiijJO4u4y4Hzr7YKDhdI6POpbmRmMDT
         HYJ+tI9rpda5rPj6D+yfeQAcIc4GawSxyqowSJmLtGFLMMiCjCGpuPQXsGYSyx9y2od+
         sTkbuVKwsBtlUkgL0tSE/zdtYlTqC9a6cFgnft1PcNoHUkMrE7PpmcpzyBHW2WhicfsR
         V/ucHr8VACjlh46A+RsaH7BGekU8rE1V96T+HF9grOOwVNyC7BI1VhlmZA7940RHRTY4
         JnP8fzh6SCp8HMLP8Wozvu7MLeObRKKRX6Ex0EPFA8uShLnuise4tc7NbXS1OhzG0X5x
         aXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qqi4bkkjlO0OmQq7eFe7VQbO2qUT9g9kE2iVHKsaR1Y=;
        b=NcSpzkSdbodpoBw4qdqmm+BeKRRSPIo2dAlEzEaScSEjwBcwoQ8HUpOLLukrJX8s4M
         WVIKNcBrIqVenWDxqcMnQl255cLTPMdE5k+ocybO3Vo5dmYsTqfpSTJ+2i28w7IUQ0zo
         SyJOefMetXHbVBZLsWRBD9goOAnPvwuR/UHerW21c4ZR5AIjdmDBHOgiSfQ5n8ZmGJUC
         gX6xP3KF5fT4kzgqK72bxhCd9SH2YuqFs35Up0rreVKu6P/ZtJHskwnrAi/+6Jnqo/Ov
         moGE8QiaWJeUvidPWThppvpKLUCdo3FRyY0l3Vw9p4YqVPsHZft4Y3drldySvWHYFq3i
         ELLQ==
X-Gm-Message-State: AOAM532pkmBDK1hN2jnoSeplohmXPv7u+Ppk+XwwPLJSQn75XdnakmLy
	Z8CvqOn+2A0AcWNzUuisKC9yEX0h
X-Google-Smtp-Source: ABdhPJwOMMrY2zqmaVeVWtgvqkV+NEiKiqKLMo/z8+xqSqfWlq9BoXCLN0wwVWtoAfApe2gWmoCnnA==
X-Received: by 2002:a9d:4c0a:: with SMTP id l10mr3189312otf.166.1601676004063;
        Fri, 02 Oct 2020 15:00:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.15.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:00:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 4/8] linux-user/elfload: Fix coding style in load_elf_image
Date: Fri,  2 Oct 2020 16:59:51 -0500
Message-Id: <20201002215955.254866-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1lPyod0ip16P

Fixing this now will clarify following patches.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f6022fd704..7572a32a30 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2531,9 +2531,15 @@ static void load_elf_image(const char *image_name, int image_fd,
             abi_ulong vaddr, vaddr_po, vaddr_ps, vaddr_ef, vaddr_em, vaddr_len;
             int elf_prot = 0;
 
-            if (eppnt->p_flags & PF_R) elf_prot =  PROT_READ;
-            if (eppnt->p_flags & PF_W) elf_prot |= PROT_WRITE;
-            if (eppnt->p_flags & PF_X) elf_prot |= PROT_EXEC;
+            if (eppnt->p_flags & PF_R) {
+                elf_prot |= PROT_READ;
+            }
+            if (eppnt->p_flags & PF_W) {
+                elf_prot |= PROT_WRITE;
+            }
+            if (eppnt->p_flags & PF_X) {
+                elf_prot |= PROT_EXEC;
+            }
 
             vaddr = load_bias + eppnt->p_vaddr;
             vaddr_po = TARGET_ELF_PAGEOFFSET(vaddr);
-- 
2.25.1
