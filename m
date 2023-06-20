Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp243761ejt;
        Tue, 20 Jun 2023 05:45:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4X7Q7apl1Mr/3UjhDNKQAHjfxT34Ir+QUegjNxCKfGFBHxLUBVl5HL9UHRdMGOJPtsoHwo
X-Received: by 2002:a05:6214:e8b:b0:62b:5081:46bd with SMTP id hf11-20020a0562140e8b00b0062b508146bdmr4832345qvb.17.1687265104671;
        Tue, 20 Jun 2023 05:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687265104; cv=none;
        d=google.com; s=arc-20160816;
        b=XQJc0g+fzOcgXsc3pj89DjamiL7a7fmt0n9twUMZrUneNw7do9uMXtt2AIB1shZpO5
         gfRlX5DxfgMAgcICqW6PZ0EWvSrJqCoLI3h+YzjnKFoMhM/HjqFnFlze3LkSvRT1DrAf
         /uhQqV2Y6i++Q9CM9wugqA9xKF2NDi8TyZmmwTfkMwUwwfCGDwBuMZp1JqLSBE1HG3Lz
         P+zjtxywMygVVnQdY65I3mhiLW9wQiXp8whGAxTNQRfQvMHSViJN0lZ+yygGTc6dJcC6
         yoj98P+IUi5CVtc4oHxmFRp55xNdjEuGPJWVJqRY4CAJFLkU6KNQy+p8NF60GMfomm17
         d+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
        b=X7nP/pNNEUTxUC5ggQlOl4E/Goq42eH7l+0Hbb13NU3/efJbfPTjOHT2Oo7gTNYbG/
         84/8JgMaLXEPwDfd6ozdCRMw0s7izIxfKAI0+Z0bctUuDH9u8s3HPEC6kdTMeIQ6mNpq
         KZcfvsfq+lVkULT2WWrCCf61/hCVPVBlAFay5EruiAynoso2og+4xbF7loYhlrvplv8l
         C0Ei4bE6DGaQO12HFuURLX2VzkWGC9unyodLm+Acyre/HyWy6phNLFisLdWULWV1XzF1
         nawAosaD9kt33be22Y8en0WYvcBTRBisCiFo0KR2No6x+sTPUZByBZMeQgX89rkLgDoE
         sTxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s8gCJp92;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs3-20020a056214226300b0062fe3ca10b5si813108qvb.186.2023.06.20.05.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 05:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s8gCJp92;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBaim-0001UR-Vh; Tue, 20 Jun 2023 08:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBail-0001SH-Ad
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 08:44:31 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBaii-0001uI-Cx
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 08:44:30 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51a426e4f4bso5547955a12.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 05:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687265066; x=1689857066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=s8gCJp921WXRNPAyCTF+FWN5A4gYJBUlq0brZTVZXS6YYJ+RsCLjWfk7Axrtp9yjFg
 7Ws7c4w2/5+6d9zMm8qUO7dufshEV4xS8yWT5t/A46AULdA1a76s2HoYLOoOW9935M55
 MtvlP6DJxHI/LHPiLrS3n4vJBQeaxG29mZfSHV3Ckxiz24/3080OPhhbkpUWRkJwNNwW
 UsmLYEOeSOhucTyjtlkIqffNH1ThdkEIF/PKOeTiQi3L/DyIWULL9jlvZQ8ueWIHSL1r
 FHYLkzEIFkLrJnkoPIouPAHCM+E7JaBKsaz5srxsEcQxfHOeOrZPXv2kfAZqKdwP+vLB
 GCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687265066; x=1689857066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=YP+G0K9wTtD+AbETuJwUKpwKP4ShLasUEpS9tglY5vi8nw6M5R+8ZzSgeM84/v0/Pd
 plFNMEhnGBie9aF4i478Hfap6mrw6+s6vrBimdd6kbzfJbQFiiByvxCATMx4BEZbmPWd
 hgf74D+ojuBXabGA14bf6jk+VoYrBfwhrCwEN5XqlUxkfc3tloaCfJ8+J+HcS67BtdcQ
 xLKWVHHFdB3eOuZL0c+LxVM6/6D740VyKndK9Xnr3+f2rSOBSiwZc+wwePjPAZaBEsWB
 02g0fXi7V4ciqbdL8MXDwuVpb+z8/6lImGeS8p21dgU3PdnQYsOYyjm04HBOfXajau64
 4Y1w==
X-Gm-Message-State: AC+VfDxK8WsotlGzHfpfIhueWxwdMSAGtvkFCUjoL0mR8UrDcyZXUbOA
 c1P2npKVSDcvCwRTM8DPirpsZVSfnzGXFwfQHCRwV0Nz
X-Received: by 2002:a50:fb0e:0:b0:51a:47d4:f515 with SMTP id
 d14-20020a50fb0e000000b0051a47d4f515mr5954252edq.27.1687265066036; 
 Tue, 20 Jun 2023 05:44:26 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 w9-20020aa7dcc9000000b0051a313a66e8sm1142541edu.45.2023.06.20.05.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 05:44:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 06/20] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Date: Tue, 20 Jun 2023 14:44:04 +0200
Message-Id: <20230620124418.805717-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620124418.805717-1-richard.henderson@linaro.org>
References: <20230620124418.805717-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9MteyCDqXs6r

We will need 2 bits to represent ARMSecurityState.

Do not attempt to replace or widen secure, even though it
logically overlaps the new field -- there are uses within
e.g. hw/block/pflash_cfi01.c, which don't know anything
specific about ARM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..d04170aa27 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
      * "didn't specify" if necessary.
      */
     unsigned int unspecified:1;
-    /* ARM/AMBA: TrustZone Secure access
+    /*
+     * ARM/AMBA: TrustZone Secure access
      * x86: System Management Mode access
      */
     unsigned int secure:1;
+    /*
+     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
+     * easier to have both fields to assist code that does not understand
+     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
+     */
+    unsigned int space:2;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
     /*
-- 
2.34.1

