Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3074648ejb;
        Sun, 5 Feb 2023 01:46:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9ve0WcFSI6UTPkUn9VlLJ91f1N35cC0Nqr04JgAFWd5LLiLfZK2vju/PZYwOPYz9AJQZXD
X-Received: by 2002:a05:622a:4a:b0:3b8:6b41:104f with SMTP id y10-20020a05622a004a00b003b86b41104fmr30910374qtw.40.1675590412681;
        Sun, 05 Feb 2023 01:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675590412; cv=none;
        d=google.com; s=arc-20160816;
        b=qGzfRMEkaHTlf+sUBuTyX68/mNMrd4HQDrbqwVD+dbe/iqTVgeabU8y5CBpI7WAw7Q
         DpFId4s9Endj5K3F66dS+sPDEqTDEp4lIOFJ6xjnHIarJd2ieYRhyXxALIhhGRxur5Cu
         u/lWFDKyv2ufeykuTEF3aG6uh2G2gOnvE4GJ4n+n8/Z29Odx1JRFF4gAQ5PqK6PnQx92
         /MlImaQx9Abu0TwwFuM6UHUKLClKzfyPSTLyUYEL8+YH0+sftK3cc3hfuJhFTWQ3y124
         jnbYJHsGqVkGFwirgiy09McrSbTRGiAwu6rmXlsRHiu/uZC0l5CECA19cN0sPpVP3eGR
         37XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=ZRFJww90BUb3SebItMFe77THxpL0L81NBuaMTBOPsY4=;
        b=mLdEUHMpPUyqy0GzVKmZ04RP6YCc+Rr4/Aunyqe9i/LeqF/q7fnyQyAJhLu7SA1imH
         X5MvkwchfP1KcGyv2ver7tpcRHbaJeiA/Or+iRU2UVaYpWtZlc6aO+0NG+d+AIgT5LwQ
         005rBCn9ec9OMcsopdlKlgwTEcsiMaWfjf+Hn5hTuzn+qIeWpQqNFX85I4WFVUqyhzvf
         flfQ2pQA3viFW5mVXyUASuwCcEA4fPkuafLwnAlTA585/bUDyPV7mnmvBuWkcCKfg62c
         9NzkvJKXdTxmp6cLJPz1+IY1PH3nXhAdjRstwK71zqeXkwYpdHmhTiJIE8u7M3zkBPs+
         K60A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=cvO7KQT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020ac85cc6000000b003b9a61a45a9si5403412qta.470.2023.02.05.01.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 01:46:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=cvO7KQT9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pObah-0004dy-Ps; Sun, 05 Feb 2023 04:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sHrfYwgKCEk3xz34lqlrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--smostafa.bounces.google.com>)
 id 1pObaP-0004On-K2
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:45:25 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sHrfYwgKCEk3xz34lqlrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--smostafa.bounces.google.com>)
 id 1pObaN-0001Pe-4q
 for qemu-arm@nongnu.org; Sun, 05 Feb 2023 04:45:24 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 200-20020a2505d1000000b0088347752c5fso2399417ybf.18
 for <qemu-arm@nongnu.org>; Sun, 05 Feb 2023 01:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRFJww90BUb3SebItMFe77THxpL0L81NBuaMTBOPsY4=;
 b=cvO7KQT9EzRiO+XZsgehiFqfQNp06s7ci+periLusBSsgi3odxxwJgz/zLGOqItUvg
 pCfKJy5esNngHLGSOPI/7tFtRS0SxAhLOmu8PgpXPvfXeqalf4u8sqRFDLtoUtXUTVUt
 Tv+FDaNp9HMg3ZDsuLIKY5ZvnoO9/P9NiVKoyR1pMA6WUaq+ILCj54S5GqX6ZNj4nOCw
 4iI2plJ2hKNfrbEV1kPnJ7TzxfbnJ+JXig/f6e9su6mBR15ohVwLuIW00UWcDIDxmIXa
 Zur5Elh0aWjCl9+0xkZK0WnvHzNM6LWLjzvfq1Sw3D/PIgSzAdoNV7FW1nTWm+SuXP+l
 L1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRFJww90BUb3SebItMFe77THxpL0L81NBuaMTBOPsY4=;
 b=GYqqp9XAWO09zFeGM5ZBDFvTc2CbNoK5LRFcDK3Ab/qvwGdHFgkvkv6JwgpmT41VSx
 ntVEI1i4yTg9aqJfMCdpOTfGfV78aPxsksTmLLVwrW7EIEjk4BHZf5G9zba9TiU29BOR
 17vaET5RcHcE4kYk7nM16wSXn6fxY4vaQzPsJ5PTMYsdV8iQGqsx93/p15wa+VJ0ZnaG
 5C/ytB9wTeNm5OQ87QU95HO932sKxFCVG2CfRzZxRywg2SAnp2BqKZyu5bvPKjyoHw5a
 tXygj8oRV2PV4FRdNO4I8AcZGmYrnh4Q8hr3iZgSIKPEayz17wY/UaIE894ePztX2ZNj
 Spzw==
X-Gm-Message-State: AO0yUKVFYW/1jqI6XuIdRlxnCpxFWWHXP8WBmj6IjgSA4ng374sNqSL2
 bkwb/VBedUyj+CdnwcHKrv/T/hCp5R9iow==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a81:6d84:0:b0:527:ac61:1f19 with SMTP id
 i126-20020a816d84000000b00527ac611f19mr378941ywc.410.1675590320419; Sun, 05
 Feb 2023 01:45:20 -0800 (PST)
Date: Sun,  5 Feb 2023 09:44:04 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-10-smostafa@google.com>
Subject: [RFC PATCH 09/16] hw/arm/smmuv3: Don't touch CD if stage-1 is not
 supported.
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3sHrfYwgKCEk3xz34lqlrzzrwp.nzx1px5-l2xyzyry5.z2r@flex--smostafa.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YqNHnj9LlH+v

If stage-1 is not supported, SW will not configure it, so don't try to
access it as it might have faulty addresses.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 7884401475..c18460a4ff 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -653,7 +653,7 @@ static int smmuv3_decode_config(IOMMUMemoryRegion *mr, SMMUTransCfg *cfg,
         return ret;
     }
 
-    if (cfg->aborted || cfg->bypassed) {
+    if (cfg->aborted || cfg->bypassed || !STAGE1_SUPPORTED(s->features)) {
         return 0;
     }
 
-- 
2.39.1.519.gcb327c4b5f-goog

