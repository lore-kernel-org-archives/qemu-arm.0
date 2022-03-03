Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp647246lfo;
        Thu, 3 Mar 2022 03:38:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYBzFFBBl/OSRlKVbk7a0GWspW+k4gbaSI91EM7ETs7QhqSn/e34ZxQt/sahoSjklIqvQd
X-Received: by 2002:a25:d04:0:b0:628:9da7:f01e with SMTP id 4-20020a250d04000000b006289da7f01emr7332187ybn.307.1646307526084;
        Thu, 03 Mar 2022 03:38:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646307526; cv=none;
        d=google.com; s=arc-20160816;
        b=o+7Qb8btglbmV7PY7GHSHXHFaXbifG8/oG2ZPZBPUI+xteI27hChr3/YqHxs9dt9gi
         5dWyxYxc5gQQZ33/QnZ8k0KLDENDjXPRR/MJt7C2RI95BaHZwMoy7iTIZ7htj0u9j08c
         N6xLjJLF/u057uJ9qvDh/SvTH7hvOPKFxOODxEZIiE7ZfM6SzFtzLsv6TfCF9S3PhgpE
         P8/cOvJXNUQiZngezR5Rv/36HHnajGETYGeq0kICHxPgOTZ6PMpL0eqB1FowuLbVJ1OE
         jCICRULeNqR8ZMdM6T5vhY/xpN4kJFQi/LaGPIdOtsmvDqIBZHvfQqrGJoiiaTGbeXaI
         0MzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4mO1Zd1MidHNDt81S1MFFJvdc/ZgF3DzmlxETtyHGXY=;
        b=QQ2flmUby211cC7NoJdrXIgiTEBROF3H24vInU2V5AJcqqT1CqMzankPgD4iv0H5+C
         11GrRSVm/e4eMvsVX34j4QoM9XCQAVtWWAtFCA2yFult79uwo/MsWhM8Xf5+JQWKeC+e
         u1GSf1kHrySJOojJg8NexL0unsaCsWK6m0ob06cPnIA9AkWNCxdgP1W/4GegXP00eyPf
         fX2efk+HfnXWv3IDdqzYuMc5v67zdK3ZTay+p4QQCzRUOWKAXbcSlqStAnIxp1xgpKx5
         UdnfmcWCXYNfMH5UzXbX/lqlQDJuPu9apeg/S5+jaIFRc3zLmzj7VT/HkcK8h4SFVnND
         2aRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ij0o33Cb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e124-20020a255082000000b00628726495b1si1447965ybb.104.2022.03.03.03.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 03:38:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ij0o33Cb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPjnB-00046i-GK
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 06:38:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmG-0002K5-4w
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: from [2a00:1450:4864:20::32e] (port=51019
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmD-0006V2-PP
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 06:37:47 -0500
Received: by mail-wm1-x32e.google.com with SMTP id y5so3000898wmi.0
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 03:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4mO1Zd1MidHNDt81S1MFFJvdc/ZgF3DzmlxETtyHGXY=;
 b=Ij0o33Cb9pDrd7faqK7mi+TeyTniZ9FoEkQeo85fC2xlrjBKb4tEqTFQ1WUDl33a/B
 1mv6qSBaB2lyvSGbweOxKx0+4+PiMJZXcCYZlQx01nJaXKfKE+rziGBhoEZWpRh1jHlG
 tRGiPXbUjphpCFP9120UHSSmcKh7z9zGCkvJCFAz3Q2XBImxMEk4KFAjk/sY8heWCXFZ
 kcP5Sqbx0got/6BvYiRLUyXXGB8U9rhvByWEerOflkHkf18vNeTez05+gGsf3LeOgWpB
 IqONMUaVyBW84OnKTrRq5+cSl9k5TS25PqtZ9r+EIcLNEYgROT+iaqzGzMUeV9nQCX2Z
 GlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4mO1Zd1MidHNDt81S1MFFJvdc/ZgF3DzmlxETtyHGXY=;
 b=1EGb6/f+JYaYYXiXJgwNLYjtZDtdOv75jkkCF9wj+IX6U9V8o+ub+w8mkX0vRbDrdy
 Yem2Q8e6YNWb3zniW16fXZ2i5O8/DYsn8vxeUGzb3gPpS2pdp1CFrtkDfnHpjk/sYzs7
 tdXvGpt4byQw72JKl98Xz24bB4VEEDlONdrH5zdOhmbKCMlGcqkBoHSXFFlpvoV/rzqn
 AHVFv/gW60ssg+eWEYUcrMqOxpd40nbtlsHpeq7zeNeGPL7pXHvXwgzs3T7cXk6vGSAu
 qs/82E1dTo3WPowPrsnFPtTpwrLgtFsL70i+trlMyFfvI0RHQEye1cWocQamQUcDpkMo
 zAwg==
X-Gm-Message-State: AOAM530kVC8FNJjWrLNQ2f1QFgSQJpXpun+cFgdSlvJ1CqMx28YpjXGa
 dBbc+Kmda4XRB4LodFWSQK8nfuk6VAcFdg==
X-Received: by 2002:a1c:ed0e:0:b0:380:fa8c:da99 with SMTP id
 l14-20020a1ced0e000000b00380fa8cda99mr3431422wmh.135.1646307464011; 
 Thu, 03 Mar 2022 03:37:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm10240093wmb.48.2022.03.03.03.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 03:37:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Check Neon VLD1/VST1 stride bits are zero
Date: Thu,  3 Mar 2022 11:37:39 +0000
Message-Id: <20220303113741.2156877-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NkrKp9wNTBbC

In the Neon VLD*/VST* "load/store single N-element structure to/from
one lane" instructions the encodings include bits to specify a
"stride" value, which specifies the separation between the Neon
registers which hold the different elements of the structure.  For
VLD1/VST1 there is only a single element and thus only one Neon
register is involved.  This means "stride" is not meaningful, and the
architecture requires that the bits that would encode it must be zero
(which is to say, must encode a stride value of 1).  We weren't
making this encoding check, so would incorrectly treat some
instruction patterns as being a VLD1/VST1 when they should UNDEF. 
(https://gitlab.com/qemu-project/qemu/-/issues/890)

Patch 1 fixes that bug.  Patch 2 is a minor cleanup of the align bits
check for VLD3/VST3 -- we had this logically correct (all the align
bits must be zero) but wrote it in a confusing way.

Richard: I tested this against your simple test case in the bug
report; if you could run it through your risu tests as well that
would be great.

thanks
-- PMM

Peter Maydell (2):
  target/arm/translate-neon: UNDEF if VLD1/VST1 stride bits are non-zero
  target/arm/translate-neon: Simplify align field check for VLD3

 target/arm/translate-neon.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.25.1

