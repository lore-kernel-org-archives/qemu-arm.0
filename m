Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004299njm;
        Sun, 30 Jun 2024 12:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx8W8zloBZFt01a0hwmVb4L8v6/Jj24IT+bxUKAOyOqSIm71NN3JOP4dFYxk7I2DimCXjxZqf0Cb1NQfKMx8o/tb3a29xw
X-Received: by 2002:a05:6808:1910:b0:3d2:1a29:c77f with SMTP id 5614622812f47-3d6b4de2f53mr4643239b6e.43.1719774059850;
        Sun, 30 Jun 2024 12:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774059; cv=none;
        d=google.com; s=arc-20160816;
        b=vO1BKVvb00dbOstsv9p30Q/lAL2MiJ52r1CNs8ZbJsGF7cj/Frpyam5Oy5s2ANaSBw
         0dYxAxB5bb7bTXPv4EBPdnawO4TbkNLf9JWTEyroLgm46wTignhlRM4arJngRzc+XuWm
         2oD5H1EBqYSGtejl4AdVFHNz6ePl5kv4QDK5Ww02JBCKO/36KKnd8d2KVI1jGt6MTABr
         WUbf9HjB36U6BzGZP1w+TyqDQ28m3V/EiV8rq2lYL4bRwWrEeJfI3IZbgZ29IkR8ci0E
         5UZDXN6MjXjPFhrxJATj0HNgHS81GE8nvOQBOh0hsRMQ3PTRde3NSbosZOHsQ8NdB20c
         qnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=psgLRimYc7hhYHP+Xsf4Ia/WwSlMX4jHMC7bGhjvWQ4=;
        fh=oOxng/UB+HeCuNQRSgTVXv4G+QH8NEss0kQ8Wfz2DnE=;
        b=WRklB5BjqeCNyMrIuFJO2OoHYTwhLzOj+gGkq7FkvyVfRLxkMR9mwkv6KCkDYSskGg
         FBOlAn5QEYzedzeU2Ct14+c2g+lLggV9u/xZKwzIyPiea3HFTUgIl1+gWS2xiqiwtigM
         iYklw9neZMIy1fTSRnN+z6grROOS9d782dMN6uA1sTbHRG3ufhfn1wQaA2ZTJRvdlvYa
         XMhyJD9+gPLLJognMTziE9rOObHkJrx8w36wWMaRAXIxHrZhU2QuB7gNUVIb52txpow3
         rogJA71Sq8j0bCwVFYIdWx6dOqPH2kx3Z3rjVj4d7YJMT/ygjsL6scLxdL2PW6kSEl39
         KKxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nLqglqzJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3d78c9d0422sor1529110b6e.10.2024.06.30.12.00.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nLqglqzJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774059; x=1720378859; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psgLRimYc7hhYHP+Xsf4Ia/WwSlMX4jHMC7bGhjvWQ4=;
        b=nLqglqzJL0SLO+l0NDajsAn8w9TCzdQZ2ROEv6q+PcFUpbGbDUSrD6/m9xdVMcdglO
         oAZjAA/ClnoSV2W81/flkeO3cUnI/hM0dpNws9n00JrRmOhUoeGgO3cuUcZtF5m4xv8N
         XaEHg6BX73+wfqSiQ19ykhrs/YRfmU4/N5l3DWFF3lYBeh6oCEyutrbpOY372ZD3nFTx
         I2TCBFdkjkU0Qv/Zf1yQsCB4h0Iqi7KsBRQSZa9QzZdMKYhal5XQJHolQql6spnCetzS
         VAE/K6man1TuBof8L+eHMJpx3TTmALxkdm027V8Pu9SjfYZTteE7juTYaQC/4Jhl9gI3
         5ZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774059; x=1720378859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psgLRimYc7hhYHP+Xsf4Ia/WwSlMX4jHMC7bGhjvWQ4=;
        b=lBNjxTL7RnBgvFshXNlUPJS1B4i/RjLkJm4RISBP5sO235BpLM0rkHk229iu0S0cRD
         NtfcCmediuakLlzIxfxE5IqZH3V3sTOkvGgW7GCZh3COAKQztt+Tr+Djl+m+6te1K7Oe
         SGlIGn7lNw7eA9SiHpq1CVQBjSWrtNYiwr0NWBUn1bklmjtsA5NVGIgEOL94fIV1jzDd
         94eAuDZPTE7icsVzCZRt8aQQB2zdF8Tm/OGVpeP5G5AKH42t3CAKcm6bCp2btHnDG6/I
         //GeVCn/rwmR+MlljRNzW+6c0R35e1gs4n1da6QwnBRfcg4rhaOR2MzTfNnp+ua5iNNp
         Gp7g==
X-Forwarded-Encrypted: i=1; AJvYcCUb6MZTPG6+wYjLLiLIc55Wi/ig630d+Gf+bD9syPL0YWENmNsDOrCPEE38Uvs5hR/Br+d81jenZXxRGkJxkxSQcCqOcRKr
X-Gm-Message-State: AOJu0Yz1SKCyiB3zAOCp766u+OvOcOnPy7qvC0Itmab78TONT7I+Bql/
	bAOCgdr7DmTS3MmS5uPhlSL1Xt+6UAqSlMn5uxDswZIJWNfJK7ZLStPxwsvb2iwGvg==
X-Google-Smtp-Source: AGHT+IH4dgpzgllKHMLgp4z0Nw27eBMZnLXBtnArC+sq0P24gu3dvDxgCcrOX8QnvBGGG2N5iPVVUA==
X-Received: by 2002:a05:6358:783:b0:1a5:f95:328f with SMTP id e5c5f4694b2df-1a6acc6ed86mr334101555d.13.1719774059140;
        Sun, 30 Jun 2024 12:00:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:00:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 07/14] tests/tcg/aarch64: Add -fno-integrated-as for sme
Date: Sun, 30 Jun 2024 12:00:43 -0700
Message-Id: <20240630190050.160642-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NMGmfSeucUeC

The only use of SME is inline assembly.  Both gcc and clang only
support SME with very recent releases; by deferring detection to
the assembler we get better test coverage.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index e6d5e008a8..8817ac262f 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -20,6 +20,7 @@ run-fcvt: fcvt
 
 config-cc.mak: Makefile
 	$(quiet-@)( \
+	    fnia=`$(call cc-test,-fno-integrated-as) && echo -fno-integrated-as`; \
 	    $(call cc-option,-march=armv8.1-a+sve,          CROSS_CC_HAS_SVE); \
 	    $(call cc-option,-march=armv8.1-a+sve2,         CROSS_CC_HAS_SVE2); \
 	    $(call cc-option,-march=armv8.2-a,              CROSS_CC_HAS_ARMV8_2); \
@@ -27,7 +28,7 @@ config-cc.mak: Makefile
 	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
 	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
 	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
-	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
+	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme $$fnia, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
 -include config-cc.mak
 
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
-- 
2.34.1
