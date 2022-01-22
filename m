Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732386qvl;
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
X-Received: by 2002:a05:6000:1acc:: with SMTP id i12mr8782819wry.256.1642875890127;
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875890; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAhA73pi//eM+XpzzjBI5L85lq42VJtt0IhJtdJFRNo0lv0K8oFDSzb8H3RrSB1P6A
         AXfNXRsjQQSRzW0BvXax44OK1VaGgoA51emG+VO/NyrGj0fjkqNx4PvF9aQ2U4OO/Ynj
         JidKbIfBiSJMqJ1ddohho0a1OZOaZbWXqrKEed2G6+Q+v0lsloAdVo8EDZQHc3qst4IO
         lJtP7iwgYC11M0C19RfJQmCYkHDHl57fchthTLjdNFyFaUovnjvO0MenGcTwWdwEqTHV
         5Er/S88wkz8TMuIPfPrFhkeiLyu9duSVZsPE39PG52eXZ8BJnwccgFPeWHNuYqFtZ7Vm
         hs2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TWOwtfSkXv+Z1HhHrk1F8pisir4TdF801Jm4JXQ/boc=;
        b=uvbMD8SFX4EW7oSVUplQB5gU81wpp32gTpsDyFjpGplpf1iRHgHMVTuJULEZMHkOqS
         dmxCcC/ZEvU4ry7cr06R2of4hdgVXmafy1dZmFSBE+d++4LjxtXDW8ISKKpMCGzh+e4A
         EF2d7KyC1fsmyj9/I/pbFbrxRHZd7IqouF0/cK/FBxqzACQl/ctxivTmibbSaj3ZtVCa
         p2QAcbP86f57TXqViGNobgkNCjapywe7JEGDQCRfZQ717RMtW1RXAZhY9tXwOdbKP6fF
         Yq6z5ufY5zWbWXi8Bct/U8QYpxK2W3MkB/nsVVjfGsDUSWBFWDKUTH8c22wDG0EfvPMW
         zStA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cRHKJGXD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n32sor6357241wmr.17.2022.01.22.10.24.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cRHKJGXD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TWOwtfSkXv+Z1HhHrk1F8pisir4TdF801Jm4JXQ/boc=;
        b=cRHKJGXD4fHJzlCpIfCtSr96Me07yuTweLrRuVelmSCXVT8bHgR5tkGHmjUPyXV2Eu
         uFFfUC8T7z21/56+NKW/MSno1/Qq/IXpw+Q/QKdhuhN6zs0Hs+a3sA3NsRMPo7Cpt8qN
         LnyNPjWOKG0xLW524dRfFimLOms1FzHJjWfYqdqk9BadRgTw8pFNmG+iTrbw9k6n6jbV
         FmW4h5Us6l5tCr2zlkduLrZSrytGdhN7loh7+VDwcO1i5Kp/PO5M0udoDbnqpXa17ilc
         PHb8JYOHDP54tGB96p5uosrk1fMbdQL8MrfWLSaZxnpYr/IRqiq6UsDANzTOXMyt9lMk
         FACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWOwtfSkXv+Z1HhHrk1F8pisir4TdF801Jm4JXQ/boc=;
        b=Bv/EIfmQ/0dUcvK8MbWBGb4GOLkjUuN5RvrHdpSnV+zw/Nu4L0kGmXOReTsINtCRU7
         i2QVq9MYeqnucehEOK3D59zfmZOKMrkJR/z1JGq9HhI9UX5Td7jBAH4U+nRoZxbgXlHL
         GRCziSandwDne1aPpoQRgubRP0ppvbxDFGVbPkSS1S8DmEtBrcvNLdCjQerauFQ71Kie
         a0o2KNnTHwUsUDQp0DA1DTpdTkMaw1zH+HX1BzSCXkxO2OnYkDVsBStw6lHp35QxPRgM
         uArYrzIXXElBlBapYfY9AwxysiOJs15f05WHkr+giGoWgOZGuZrsOyv/KSlXErzJQUCg
         NJFA==
X-Gm-Message-State: AOAM532T77owbOWDZDQNxTSqQeFyofVT3GYqocLcvObyYLPriFSmS3OM
	wYwtx3kxwwRHi/uUOXAl+F5SEZDe
X-Google-Smtp-Source: ABdhPJyepEexigSfnvjBCQfTS59a6SSj6pU5p7L7YpiVOralDKBcgfkGbvM/cdph0n4K660Ol6peJQ==
X-Received: by 2002:a05:600c:1e2a:: with SMTP id ay42mr2469743wmb.131.1642875889860;
        Sat, 22 Jan 2022 10:24:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 05/14] hw/intc/arm_gicv3_its: Don't clear GITS_CWRITER on writes to GITS_CBASER
Date: Sat, 22 Jan 2022 18:24:35 +0000
Message-Id: <20220122182444.724087-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BF9Es4ZZhV7z

The ITS specification says that when the guest writes to GITS_CBASER
this causes GITS_CREADR to be cleared.  However it does not have an
equivalent clause for GITS_CWRITER.  (This is because GITS_CREADR is
read-only, but GITS_CWRITER is writable and the guest can initialize
it.) Remove the code that clears GITS_CWRITER on GITS_CBASER writes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 1763ba4a671..d9ff7b88492 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -866,7 +866,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 0, 32, value);
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CBASER + 4:
@@ -877,7 +876,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = deposit64(s->cbaser, 32, 32, value);
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CWRITER:
@@ -1027,7 +1025,6 @@ static bool its_writell(GICv3ITSState *s, hwaddr offset,
         if (!(s->ctlr & R_GITS_CTLR_ENABLED_MASK)) {
             s->cbaser = value;
             s->creadr = 0;
-            s->cwriter = s->creadr;
         }
         break;
     case GITS_CWRITER:
-- 
2.25.1
