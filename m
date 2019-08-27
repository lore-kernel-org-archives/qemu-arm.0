Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5161619wrs;
        Tue, 27 Aug 2019 05:20:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvqKeKIg41Fidc3tR1kJ5cUSj2MszUKwEmQ4rsXH+QG7SDSCaMZXs6N/ry4//ZKoRktdW0
X-Received: by 2002:a17:906:3604:: with SMTP id q4mr21534447ejb.102.1566908411475;
        Tue, 27 Aug 2019 05:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566908411; cv=none;
        d=google.com; s=arc-20160816;
        b=Yf9MtTULpsQ7G3FKbjVSq2+Pi4tsHvdcBtQ63KOo6Rsb/wBwtKaPTu9vu7U5JPAEU0
         5pj3UxfYw0F103UhzvJD5lEMCgOYcmFb7TEK5GEAXEwpezokz9JNw3jRUlJnkDCsU3iD
         +AgTU29f98bhuPK4b7bToyREqqzFTlVjIIbQatP6U+Q1HTizBYg7tWXWLlWHA83cWGP5
         3BB3i87IrWTqGghwILC3aqqziVAF7WHsomsQxBEI7XpzTX2yRWbsVFcFGaKrwEdWzVzW
         /RCcifQTw90wvMMfCbhh5/13OkZiz/O4xxN6m8UXqoPJQRlXBs79Z/6q9Xz9k2CHKtJE
         KZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=LSr8udusvAKQfLLyJhhl5YxHdfLCgd98fSLGhAWYlM8=;
        b=xdulfssBgqhLwPfn/atK8WNPNV4WhdxOZFe74O3p78TNJRdG0A4XgM2rfCMrNRZhrj
         61UrPD1l3lfDkWc6cFT/bKVoFbljDQa/QVOjHmYsvLMoOPMv1lR/HjLC0GJSL+rdbpCv
         1eYME+45I8IFp+DGf+m6MI024JbmA+6FOKV77YEPXmi4fvOkwE3d7NiShu5zLl1eCkJV
         BjrFw0k2NySZAZBMi4zBvPLd2wlaC10OPd0Qx0BjDFoMTh2c6cJZvGTx/DTD0lwo/BuV
         FqDy3wVC/szPqh5iPeQKDEsuT7XAbjkUxIKKur6gfnwBfuCBo8ExL944fS+2MO+T2tbF
         eTMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c7GhC9rA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si7097194ejk.345.2019.08.27.05.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 05:20:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c7GhC9rA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2aSI-0004VJ-Dm
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 08:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2aRr-0004V0-Oz
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 08:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2aRm-00011d-CB
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 08:19:43 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34211)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2aRk-0000zm-I9
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 08:19:38 -0400
Received: by mail-wr1-x442.google.com with SMTP id s18so18603041wrn.1
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LSr8udusvAKQfLLyJhhl5YxHdfLCgd98fSLGhAWYlM8=;
 b=c7GhC9rAOOWRSGiwDyr1nbxkIxrTJtyYpIq9ppC1pscvJaELKtD1ZXGPWS8O3xQJX1
 1OVIBbqis9Yolb9WrW4pNEvh7CcY6sd3EALoSp698TJK9d5o92w6SzLMvdRDCq9RLREs
 trH1CysrJ50Y8VuAMRb5FyhDEnt6xp6e+Ec5Y+7VFxmKq89uhc/s08q1kPjIn/2KbKMi
 NEHrvB0HzVay3rm34chUXDhxrlk3IrPbLIkdBzX5a/Z2UGGdYdqJup7/p0GegFNrX1bV
 OgBVx+vpHReaMnlfAB6p77GwiZRodtekgA4y5bLBCGdEqdcDkbQCvFv4AsJhmvSkOXR3
 QwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LSr8udusvAKQfLLyJhhl5YxHdfLCgd98fSLGhAWYlM8=;
 b=BKSgNBMlTaGmsHt4uMOlmEPO99tWPRrQgH4lFfA6jSOQY0EY57Oe1eeWL5BVCeGc1H
 jvTTXT739EGfqlK8UMC+JHa5TBC2tM3EygbqtBKuepsWRvfppZxofGkVCPsg2oS2mPKE
 +KikfXBbtngSFdryk3uMNQzR7puuzqhLIzdsHEeSDdR3no1NBth6r8iEztvP9AUAoNk2
 g75jrR+EtEWfDB2u7HRUWD3n8JrSV3pptdyauT1h1s+4npGxYg9vOCdKt2+1QMlBwQJq
 i1WraxACTyjEBoBFi0no5ikuNYe2Fv1g8rmxifmCjNCjZC1h+ZbyDgM9sg8PnaDE/YtD
 J+dg==
X-Gm-Message-State: APjAAAXS4aMtnaiAzQXu8gQJV6JMts3HpDHAQQD2t4R9tkBhNJ78zsxc
 0fa4fCp3n8igKdEDjS1O/7l7wQNoP92PfQ==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr27642954wru.27.1566908373729; 
 Tue, 27 Aug 2019 05:19:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b136sm7142435wme.18.2019.08.27.05.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 05:19:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 13:19:31 +0100
Message-Id: <20190827121931.26836-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH] target/arm: Free TCG temps in trans_VMOV_64_sp()
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LovapE+sYd2z

The function neon_store_reg32() doesn't free the TCG temp that it
is passed, so the caller must do that. We got this right in most
places but forgot to free the TCG temps in trans_VMOV_64_sp().

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 3e8ea80493b..9ae980bef63 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -880,8 +880,10 @@ static bool trans_VMOV_64_sp(DisasContext *s, arg_VMOV_64_sp *a)
         /* gpreg to fpreg */
         tmp = load_reg(s, a->rt);
         neon_store_reg32(tmp, a->vm);
+        tcg_temp_free_i32(tmp);
         tmp = load_reg(s, a->rt2);
         neon_store_reg32(tmp, a->vm + 1);
+        tcg_temp_free_i32(tmp);
     }
 
     return true;
-- 
2.20.1

