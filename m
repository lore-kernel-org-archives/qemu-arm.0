Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1128371wrp;
        Wed, 4 Sep 2019 12:48:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlenAbFi9D/PJl4Kkyy/4IVn8X4NUEpCwlmIzGr94i9NUGG6U+iUKTb6RTyTfd4fN91n7e
X-Received: by 2002:ac8:7543:: with SMTP id b3mr41554263qtr.13.1567626525333;
        Wed, 04 Sep 2019 12:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567626525; cv=none;
        d=google.com; s=arc-20160816;
        b=ae0P7Md8DpMDNtQjLZdo8kH3sAGPVPSXBdtic76I8KN7DtFrui67DuBygicN9pLo/e
         sCv6QUxu3LBN37W1kYICPOstis8qcPLE7t+HfwUao1FWLsOWXn0l6Gifd47kumn/IR7L
         ElaQHdCnNdIazFKKbmCJAB1PWlDR35XK7RPjw1zD1/3TL/FGBsNXd/pclizFZfpKBTve
         jZ4P5jInRyJHPEZxIFl+6x/hnA7ZigyoYUEAx8/uVHP69a0/ky4azaUyl7U2eu6Y+Jj+
         DV8Q1BMA7L73ImvWj7AC5+Z9GIo5hshDrGJtLrTu0B9XKNtVx5YqJcgigDwSXe8LV5F8
         73fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=aH/3YEr2M2jm0vMpMPf4pJC6xbTf5AjfAwZZFhTAH2w=;
        b=xxupc77YNVcFsCAwGAnP8zsHhq1uc8NCoy6m+sNWpLMelxTmlXL5FurvQWSSKHiJTI
         ZvEOMM2ogcpy4ix2YxjbsnOsXIjGjZjM6NHWRDTkEIkqMtO6dx6XqWNFfKnxyltHAbjD
         7rG0pAn8DVI+C1U2YgqhAQsQCtpdA6KkVadhja/AmLDiAL9/0AT4/YsaoP6M8M+behPW
         GKevRYCMlDTmIoZrJ2WEcj8+/JtugepQmhu//VOlcr3xXDmIbkuLRkJN74zP8Pz8OQ3z
         7tx5VyXcfkirL1aJ6Wl03gSUoT192tYYK0FBgctAo38oyllEG7c3eHqWKIszq38FAY1J
         aWpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e63ejY72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si15472601qtm.38.2019.09.04.12.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 12:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e63ejY72;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bGl-0005Si-UB
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 15:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0H-0004qG-GW
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0F-0002Yt-Py
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:41 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0F-0002YA-IV
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:39 -0400
Received: by mail-pf1-x441.google.com with SMTP id q10so8853873pfl.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aH/3YEr2M2jm0vMpMPf4pJC6xbTf5AjfAwZZFhTAH2w=;
 b=e63ejY72sEioWyaiQCpLM3xEYOOAhhtw0DG4+SExnKUVjm9aNEKrL5btXq6wusbXSr
 sS5pXwwUvKG7CnaJ+j0TkkVMql1OXsUFn++2Fgx4nkd7cUt8RBrtIxF/CDBLifWEqRFV
 pSbry/0Y6PduCsEzuD/nlGtmRJxDykFisKGaE+HfeP6Hdr8NYK+MTHqrLH97k+ogZ0c3
 Wb3zHxSNq2Baw2Zsb4yCLJeNrDM39lTmIfFRSznj6BUEHFnoSkdquRZuyGLK5jUTCULq
 0oF3x8N61lU51LFDOBPEfxXB9W8/nXPkcUDx0snA+SVjnENxfg8c+8lfh3rU8yySqv5b
 lY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aH/3YEr2M2jm0vMpMPf4pJC6xbTf5AjfAwZZFhTAH2w=;
 b=I5gdr16FP5XYzqf6etdwYgAlvM1Wx/wmXv0ia/czxV3vM2lqC1sdmdfjQKpEMFYn7T
 iFOwNhvtXxCxbgKaJOkNNKDIYxs1mgk7Oa2FCZWUTxCRbLALKCYH1EUBubpjb/I0sHb1
 i7dzDpv/7SvgtPYNBBhlepJmtynR3eFMYEqadPdpSElvGp5tJKVAYHBNTpY1sCNc2I5f
 WMQ/g4DHVqddvFmirfPvyQ5X0oyniSIHuwhXB3sHXQ5NJCcUncV24mMzNm+NSSnKZOTg
 oj7J0rGke0MsaORSq5dc5m5uFehT6B7NNFP+p39E4jHPfK+us5Hs9BZWGdBnrW9E7qBk
 +83Q==
X-Gm-Message-State: APjAAAW4TQ5c1qI6JiRuXnVIPnfdyoxw4slvcpxUkGetWKALZQKilvCW
 rTlYkJr3xoT7GsjaTPdAmxiGfA==
X-Received: by 2002:aa7:9117:: with SMTP id 23mr24816920pfh.94.1567625498662; 
 Wed, 04 Sep 2019 12:31:38 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:19 -0700
Message-Id: <20190904193059.26202-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v4 29/69] target/arm: Diagnose writeback register
 in list for LDM for v7
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EkZA8B+ZhUgk

Prior to v7, for the A32 encoding, this operation wrote an UNKNOWN
value back to the base register.  Starting in v7 this is UNPREDICTABLE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1f3c7bbd54..b67e7389d3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9997,6 +9997,15 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a)
 
 static bool trans_LDM_a32(DisasContext *s, arg_ldst_block *a)
 {
+    /*
+     * Writeback register in register list is UNPREDICTABLE
+     * for ArchVersion() >= 7.  Prior to v7, A32 would write
+     * an UNKNOWN value to the base register.
+     */
+    if (ENABLE_ARCH_7 && a->w && (a->list & (1 << a->rn))) {
+        unallocated_encoding(s);
+        return true;
+    }
     return do_ldm(s, a);
 }
 
-- 
2.17.1

