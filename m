Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1885105ocs;
        Fri, 30 Sep 2022 10:50:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jZI6HaeRSj0Lgi1VzCfz+79IOC2ialeDd76btOsBarWKZ1YlHUZ7rOSC95/AkTsCozQ1i
X-Received: by 2002:a05:6214:2022:b0:4ac:b001:2c75 with SMTP id 2-20020a056214202200b004acb0012c75mr7774076qvf.83.1664560221430;
        Fri, 30 Sep 2022 10:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664560221; cv=none;
        d=google.com; s=arc-20160816;
        b=EhGZSoyZmYctPzZDjAL5oRgsC9gSYOWdHA5ewkueI8u2YG2LtBDlkP7sf1kzrNmh6l
         x6Yr/mq9GqoLeRQKrTvJbdpT3dZE0AkHxv+VK5rH9J+2kRVE2nD6yGlQ1eRzJotr5NS4
         bsJRx6o0dh3gzHutPKVR0YRmBs9WYdMwuibuafYwTGdtA/t3EcSB3JQf0eTWNeEdm+IR
         cOfattLeuwYUe68G9GUl57J6X8YcVQ7dN+ds5Yj3jDEmD03tN22K1jkRYfw27R/FRz90
         Jg5+Vfrffk9ngJK09Rr8iSRM5UL/sgVniUpWLTbGPrBeMCnjsC8tv1nqXTix6v1M3VMJ
         77NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JteizUGVldF/G//thhaFP2LIcXVYHyYcFpQ3HMFZOSY=;
        b=c4kPl8A/n/Hp5H8Tf3oI3lSGm45Oq1P+mkSzHJs0F8Lllrqr3nGj75LmmptBwZAjGy
         4ZTyVf3y1xS+FDkLlzEiv68/4fh/oSfXl+043RmEKo0j7RGNdZcUBTSqCsMuNXP0F2cg
         ktgiAlwHwwlFIxhpu1va+kw70eyYytE88U3IFvNUFoybIP6sFivPjYD54n+va2/COoQp
         auUUNwPs+baMJ1cO7PBdIbZICwIJNAkmL+cEqwCDoXOUS6glVRmLG68qPxR/7U7e4c2+
         0PF0ccLHsHZhY5P77Yd/UXlO/GP9b/cBWNzfJKuQ4KoOX/SICtq1CRMozlA/swTHZv4j
         aVrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQEFHskv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf13-20020a05622a400d00b0035bbbc9c620si1365666qtb.231.2022.09.30.10.50.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 10:50:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQEFHskv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeK9U-0002AH-Vn
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 13:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeK8G-00029c-TT
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 13:49:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeK8E-0006ns-T8
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 13:49:04 -0400
Received: by mail-wr1-x436.google.com with SMTP id h7so7908202wru.10
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=JteizUGVldF/G//thhaFP2LIcXVYHyYcFpQ3HMFZOSY=;
 b=fQEFHskvXR11wtJg1+e5Fj4oSzdcMRnLyn+HS9G6QstFOFCstQXcPcxo3SwoO6d0nG
 qB/6sHV8hrW12o8PkXKoBKmQEgcGEC3d+of1kQaXR92GH4yMM1EjRtzGUzaP2x3SlE8y
 8oxgSOjhyQLfPsehHcDIzZD9kBEwyu1lX7Q6prwurps8DnrGfHTwHABiC9chWHuZaE+A
 wc/4vOuplrBbor6ubePxYx11VG/X2o2yLROlETsf8aMhcMrVqv7oOOaEksqEzk4UG88T
 5cmKx2srHCHhLPaIXd7Wi0U+tyLG4B51BhIsMCmh+C7HjLKMOXj6Zb15UxEdIOig8nZ7
 yJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JteizUGVldF/G//thhaFP2LIcXVYHyYcFpQ3HMFZOSY=;
 b=YLJIhHt2BYBvyXr5v4bMoQ1HZGQqPS/QPh4H9eMILVeihtY6CZCZH2JhRH2gkvzRvW
 TywIahp0oEckdQIiLC7IX1K/SXZ1nB5XAWsrGd7O6HfrVtC2HLh8g6cnXU+7rZBZuV+k
 3Qb3zJL8exwTNu4cMqwQkHteIkD/iCD1kO7wM29Um8gQ97qHsDlA0Gq16WpynOcnt72F
 o4d53f/vL/H6Lc0zV7GJgg8dUA2Ha6UZPR5cy0JgRCaUQqzQNLlIeWf5xKmuvjt7H2Qu
 i67NhxGOarM54kHXss6wTmMt+xE8vZ75VAkqBQ38J4Cyzrzwvpl0H173O4dph+dcZCf3
 BZUA==
X-Gm-Message-State: ACrzQf1T+jF+ZHt54iWsOo4Q1dvUWzxXNOecxegf5dlYb//D1XDR0Vhh
 hpmoXStRtOjZe/Di7WM6Yd/Xjz42lEcEZA==
X-Received: by 2002:adf:ecc1:0:b0:22c:f296:1114 with SMTP id
 s1-20020adfecc1000000b0022cf2961114mr2938358wro.462.1664560141553; 
 Fri, 30 Sep 2022 10:49:01 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b003b47e8a5d22sm7703541wmh.23.2022.09.30.10.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 10:49:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] docs/system/arm/emulation.rst: Report FEAT_GTG support
Date: Fri, 30 Sep 2022 18:48:53 +0100
Message-Id: <20220930174853.2233633-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930174853.2233633-1-peter.maydell@linaro.org>
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MqWBthI8kBSX

FEAT_GTG is a change tho the ID register ID_AA64MMFR0_EL1 so that it
can report a different set of supported granule (page) sizes for
stage 1 and stage 2 translation tables.  As of commit c20281b2a5048
we already report the granule sizes that way for '-cpu max', and now
we also correctly make attempts to use unimplemented granule sizes
fail, so we can report the support of the feature in the
documentation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index be7bbffe595..cfb4b0768b0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -31,6 +31,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_GTG (Guest translation granule size)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
-- 
2.25.1

