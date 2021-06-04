Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1396136lfa;
        Fri, 4 Jun 2021 11:37:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX5XYZgMhXsBcFp/nrqNjfYUHhrvn3CJ9yp/OIwqvcRwqC93Is7+hcPUH/+7vu7A6Sv0d0
X-Received: by 2002:a6b:fe09:: with SMTP id x9mr1830447ioh.111.1622831833491;
        Fri, 04 Jun 2021 11:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622831833; cv=none;
        d=google.com; s=arc-20160816;
        b=dNo/4O7X0/X44zdoso5sGkq6bBlIIHKbKM0SwLresBcWBHwOJ4OiBPwY/9ao+CGLtr
         uUHQIpDkSwaUzdiPH057F0iMF5+jfvIuF8q5q6Zc5aN70X7M5VpO6SSXb+t235M9P8gw
         OD4vPXxtteRuVQn3XpCVAdpbLS3EWS/q1tiju3UMm8NTTEe+mlyHVlnp3ZQ1DRgAyfyC
         0AWUM0/EFHQkZTYiq7zJVCJ9TKcXXC6jVOSPsckkInyIWOrlctiTTALutpdtVngsi5Sl
         t4eQT1UELokokuwOl64PPYWR5SaaTi6cMi6GzvFFU3XKZ1AgBTawctJGECFRTj7DypqA
         zkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QLc0ibqXN0LsdCPbRj7kblYbUvkDoeUfRl2nIztTPew=;
        b=doKTcJ4ICIzWm89fkECJb1dK5lgbVIIth1I26Coqi/68cDBvrnBB7atraTfUjLwi14
         3ZcwYtrux1W9s0kj1+SwyM9F5sM+++n6old1+9fevuTg6hpli45giJXiv39QpX5XKPla
         X3xUMo/Biw5Xq44hF/+Y/bUWWP8StBkNUOHD7V1TjvVi22YpDZQgcRTQ1mi8VQ2ww9Zg
         E+RPcjckF43i8QP7V/I1j/pVox516QskzJHhwo1xgZ9mDnb940a8DswGcbBImu++YoDV
         8S1yceLgaQJMeo47JRJDeQPHznpnO4OakXSqkiYWf54CE2xXCCY3ZavzPLSxB9LPWm2P
         LBVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tap0pKtw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6si6860472iln.106.2021.06.04.11.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jun 2021 11:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tap0pKtw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lpEgy-0001Vi-Pg
	for alex.bennee@linaro.org; Fri, 04 Jun 2021 14:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEfA-0007BY-D8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:35:20 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEf4-0000xi-18
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:35:18 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v12so5090968plo.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QLc0ibqXN0LsdCPbRj7kblYbUvkDoeUfRl2nIztTPew=;
 b=tap0pKtwYnKNNycmOrq1kWU1WWmrontTibMChJbFOTQSQJQbQQ92xIqtdiwo6LW4AV
 fVaekZ+iMy78ODlbYhKne8Uw/ij3wFTDzuebhjAtDuUI1T+ns6MtFcBmGP/9Gnes/vYI
 hloE9CY5ES09BHHDdtrkZHDsB6AsNSHS6J30p5qQ+8haKua89unIlQGIXaHs5gFs0XUP
 Yhad2brdmHmQnMoMb7lYsuA3Z9c7ohO31tTZj7OLxDkE4IpWeDojK00uAGm0EsPoRwSq
 xgqrk8rzNDUfDLwi/x80HjUncNg9kgIRqpA6tA/Z5NN//jHrqv6ymRzwKj6DvuueOelr
 0Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QLc0ibqXN0LsdCPbRj7kblYbUvkDoeUfRl2nIztTPew=;
 b=oUgYOl/oBF2vytY8+eAUACnBd0TTfD8Y62lcBxqdcvRBGqHOsS3aCYNpfd/5NuT4VV
 zpQg/rMMbncLgO8zKsrtBmvragMrIkRX0EitIKUbCYe65nk6W2RCNh8QPdqbmOU4iS3c
 XoJrab5TDUz698fiGSmOA2ar8uIL/pKY6jO9H9ppzqz7KVZssDQw6Md+nqPJH9+Wd6O6
 3tmjDPEErE2HEKdXoXjAUs+UtQfRCdedbVVa+PmkmcDriFIAIlcOuiJB2fBclpRyT0U9
 7merNzL84bxPi8mlv6/R7lzIDv5TFY0OHfHjMCHj/9FO8S7yTMDjR6RrwIF+pit3DxbU
 7SsQ==
X-Gm-Message-State: AOAM532nhDjl+rul78iWQ++9OGXuZ83n6IvCY8AxhPXAV5S3GtG8RVK1
 5sTX1bRO6OvCsaeaU2/oC0sVUbfqMqUwjA==
X-Received: by 2002:a17:90b:3851:: with SMTP id
 nl17mr18154978pjb.40.1622831707714; 
 Fri, 04 Jun 2021 11:35:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m2sm2620578pgu.85.2021.06.04.11.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:35:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Diagnose UNALLOCATED in
 disas_simd_two_reg_misc_fp16
Date: Fri,  4 Jun 2021 11:35:04 -0700
Message-Id: <20210604183506.916654-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604183506.916654-1-richard.henderson@linaro.org>
References: <20210604183506.916654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sAoFusKirla6

This fprintf+assert has been in place since the beginning.
It is prior to the fp_access_check, so we're still good to
raise sigill here.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/381
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 8713dfec17..2477b55c53 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13234,8 +13234,8 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x7f: /* FSQRT (vector) */
         break;
     default:
-        fprintf(stderr, "%s: insn 0x%04x fpop 0x%2x\n", __func__, insn, fpop);
-        g_assert_not_reached();
+        unallocated_encoding(s);
+        return;
     }
 
 
-- 
2.25.1

