Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008814ejf;
        Tue, 16 Aug 2022 13:34:09 -0700 (PDT)
X-Received: by 2002:a9d:73cf:0:b0:638:a617:98ed with SMTP id m15-20020a9d73cf000000b00638a61798edmr4120316otk.198.1660682049065;
        Tue, 16 Aug 2022 13:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682049; cv=none;
        d=google.com; s=arc-20160816;
        b=clQsyIYh4p+qFEEGRsB5S4wCK/CXlyRZp4k2pwONzSEaPeSiIua5HYF1Kyd4JRMWA7
         LMCiObbrO4GKt2eN+0q39hndwvofh/3lLhOSlR8cblYEeFfAqIb998IpMMh8BZ4MY5ZS
         hWMHCiXgg7rUpOwAvMRZyl6Up/HiClU6ZAqXMB1uOExheBdBQLG/+qUpo4laixEg/VFn
         dfAZg8Axxyd88T7Srf6TVMI+Q0QUgPu3tJfEuOBBDt2fvUMBSBGSOYWiE6E9tkrvxnsS
         +zDygrzDpnkyzhvJIB2uMuQqKx6ibPz/hZ//t6U5KlHWf9MXIQACESWPrb0ZXphSHPSq
         dT0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
        b=uVIOqK0o/zb3tAfVpA/+x7tPhnktxzJquGmFPAsPaSkdesHAHioV6QmUtYm2/8Aqpx
         Tsgk5JwZ4NpX7923otJIZSxdIJ9g2bPzZ/g0Quv8ZoJuBD5qY96eR0Z30xUNetaFAWvE
         shmWTinEaWZDPMdxWEVWWr3ai+1t8K0iqWXpvnTeCd9CzVcLZ+89iFTozgXrKdBWPwjl
         80n57axJB2a2hTC968iaL4LYf2cZrFaWJF68D66pGau5p9NaM/BjPSX/cFHqu6gi3DDw
         5giB5eHxlF9I3UlPkwAJ/lPPM8gNVn5LhFOcHUqDLEYl9ly3LWqdt/91tAJAzT2c1+bv
         P6uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k/ox2S1M";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v2-20020a056830140200b0063726dbd6b2sor1653141otp.9.2022.08.16.13.34.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="k/ox2S1M";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
        b=k/ox2S1M/Ib8Keo8gFKZVVAxPG0DOokverOMlR4uf+xFdItR/ln1QeR1QKAiHQfMkq
         aEm1lyanUkxj0tSBn2yDG0VFmqV+CRjeA6a7p37g3Ledt48kwt6pzE3PgjXnkNQob2uW
         DB3zp1W3hIEUN+zV1Z25vD09cP+4D/Cpis5QUPTkbqtH1OIeFk/kGHOTu4pnURLu7xhU
         lDiatEZlUXu89iEDSZzOF/Pf0fyK/eEld8Bl8YzHf0xk57GII8Cf2w57pBtxczDxkhbP
         56fGoRCja8hNPGN9+p5JkvbVeETCZHnPWfMpfgIYA+ZMavhQJWAcS9DpMouu2+lfm5Up
         c2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ztH2KdOZugDOiuPkZQawXgA4F56Gwh34Y3mDIuElS7Y=;
        b=r5FOJULUBaH+S1PeBpc4EmbweOHDI8Hn+qhIRUF5mavnUUfCg/F0Zz5NsKR3Eg5zq3
         hAVgkK2YK8ijIa2L6xBffe20pryPm5mbWrP0o1xmVjkr4q+U8MjH4jF/2IRiwLOJ6xOl
         1snYo/eQReXD9aOip8h8cQiH7vuVS9O1ghOMpGngOBJsLG3Wiq3Q731wq2nRoGopr5Mh
         OO1nrLoZTjVSHnSgZHEARvBfA72Utu3fHVtOXbyyrvGbG0d8yZfA1DJQ8HnBex/YKHia
         ID+UquMms0YhuxMZIBA+7PSM7DIIsFRVoCtMnfjXZPqYxFrGViv/Hgk6yW1PFNxFYVJa
         eumQ==
X-Gm-Message-State: ACgBeo1P2f70cf2SVNL53SPFF87CrSUZdkU/g13Rct79eStHScZ1ZGa3
	BY5wsPvMXl0V+8DjqPoMcjiBIcY5xvC54nDZ
X-Google-Smtp-Source: AA6agR5V9GoITawW1PJBmFeyfKc9ymSCLbIO8RBBz5Xs6LZ4Xvy4xoUW3j9Udb56NgpU4HBaCYluMg==
X-Received: by 2002:a9d:7d15:0:b0:636:de31:4cb4 with SMTP id v21-20020a9d7d15000000b00636de314cb4mr7960300otn.261.1660682048582;
        Tue, 16 Aug 2022 13:34:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 01/33] linux-user/arm: Mark the commpage executable
Date: Tue, 16 Aug 2022 15:33:28 -0500
Message-Id: <20220816203400.161187-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VE9vUt6pEbGU

We're about to start validating PAGE_EXEC, which means
that we've got to mark the commpage executable.  We had
been placing the commpage outside of reserved_va, which
was incorrect and lead to an abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_cpu.h | 4 ++--
 linux-user/elfload.c        | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/linux-user/arm/target_cpu.h b/linux-user/arm/target_cpu.h
index 709d19bc9e..89ba274cfc 100644
--- a/linux-user/arm/target_cpu.h
+++ b/linux-user/arm/target_cpu.h
@@ -34,9 +34,9 @@ static inline unsigned long arm_max_reserved_va(CPUState *cs)
     } else {
         /*
          * We need to be able to map the commpage.
-         * See validate_guest_space in linux-user/elfload.c.
+         * See init_guest_commpage in linux-user/elfload.c.
          */
-        return 0xffff0000ul;
+        return 0xfffffffful;
     }
 }
 #define MAX_RESERVED_VA  arm_max_reserved_va
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ce902dbd56..3e3dc02499 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -398,7 +398,8 @@ enum {
 
 static bool init_guest_commpage(void)
 {
-    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
+    abi_ptr commpage = HI_COMMPAGE & -qemu_host_page_size;
+    void *want = g2h_untagged(commpage);
     void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
@@ -417,6 +418,9 @@ static bool init_guest_commpage(void)
         perror("Protecting guest commpage");
         exit(EXIT_FAILURE);
     }
+
+    page_set_flags(commpage, commpage + qemu_host_page_size,
+                   PAGE_READ | PAGE_EXEC | PAGE_VALID);
     return true;
 }
 
-- 
2.34.1
