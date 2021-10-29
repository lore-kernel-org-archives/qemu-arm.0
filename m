Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp3291364lfn;
        Fri, 29 Oct 2021 16:19:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTJXfOmqBGNkKK9yEf6Lf5+duyCc5YQeHSYrG7NL4wZGaYQg+1moaqtT1djrxAVjvA+uTd
X-Received: by 2002:a9d:19e8:: with SMTP id k95mr10790602otk.284.1635549542686;
        Fri, 29 Oct 2021 16:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635549542; cv=none;
        d=google.com; s=arc-20160816;
        b=b9SagUR//Fmf47Fqd9RcuB//RVppoc8Ll3QweBOfayECBfNiBbCHca/546LXFbgyp1
         CrNxRLgnQf1e8VWeiskkgsf+Bn8HKcXgcV5ebq04wQXQ1gAQkVKZfiFjQmbOM9ugzCvQ
         ddP/9YQU2Sg2MgQfBlB5SBq3OpcbcwmGCo0Y+nnX7lL1p4duXTa4A9Ojx3u6L573tqcx
         CtjDkbniJm1n1JeJs7CEMKtKoAZ0/VTsbcyPJo3gxTgqBF+LC1GLXMEmVbMBu54JzeeX
         UITf+uK6xmvlbZp6Yit5/dNmxO3Qlq7/HzIIcg8DM1j7FMRaI+H91pLEN4t3C0b4vhlu
         uZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yBX1gK9Ib7TP71rIWn58yOnd8WSXgds+4F/GL+Z/sBk=;
        b=U7+jHi5lLBrkVO9gPNcr+a1GnZ5TePOj5+9Owg/S5MzBKyIBec6HcRn4jfP8nBPsip
         bmyIdh5JnFpoxQU5+X1VaWRGCmrdZPkLlFpGEsDJ1oWPy13SbZvqI2RCPYyw9wn2Yq3m
         lgHlhzMoP8T42b3531A9K2avoaZ2FbzEy/9ztqqkGSwW94UH8jRAX2ITjYD60i3Vdl82
         ec5bRedDlDGurUF/PrpSuX87kULn/w3bVKjYxLlfseRp6ipX8ayC0vHjQlnsKPFM64KZ
         SWbKiVwk7dT3LQ4TbsLuO4+sWVmlKWVpbJt619KIicN9fBdZ8LIM8rzkIjUPek/wQpeG
         xesw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=K4IGQvUO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk40si2487580oib.163.2021.10.29.16.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Oct 2021 16:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=K4IGQvUO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mgb9J-0001E4-TC
	for alex.bennee@linaro.org; Fri, 29 Oct 2021 19:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb8y-0001DD-T9; Fri, 29 Oct 2021 19:18:40 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgb8x-0006ga-Gj; Fri, 29 Oct 2021 19:18:40 -0400
Received: by mail-wr1-x431.google.com with SMTP id u18so19168761wrg.5;
 Fri, 29 Oct 2021 16:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yBX1gK9Ib7TP71rIWn58yOnd8WSXgds+4F/GL+Z/sBk=;
 b=K4IGQvUOrjG1QG7TktvHtPsFvbb1ubOIRy1e7Nbw5mJkJB9WoY0TR7/njgOLduOya/
 d6P80RIWxD18nyCfOdQmVYA7EujXSWdYhvQJVifEav7XLUqYeCPSYkaHQsoFG88Qhbp/
 gEdM/xEXTPmcAYHYwnTIRnGq/IwVpJ/ZwcI5Ec0lMTQ2bvR6E+A1BitQb7UPkrH2NRmV
 1/wR5TVf4zBFGKkSHEDNI6VWTfIywy0p50n04igGJu5J0mrFBJPsV20+sdJVqzH4NXvu
 oInTJ2VrYAAbbX5IneWpzQnwd5eqEStO3g/dFQM5ssd/L6EwgfZLgA11XTYc+F3SohPU
 M4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yBX1gK9Ib7TP71rIWn58yOnd8WSXgds+4F/GL+Z/sBk=;
 b=lZCvp0HfPNtmuhflTkfuy5CYeG3Gy4kK+qd895BNVSEBomvCvzzMOYeI1n6SyGVk2b
 44kNRTCpQfJKWyjzM/CSPd3ChSOdo9vXkDzo5mMMQ4kt63dLYFH/WDomIDmIiV/EH2Sl
 vxVLSqInNzTJkgw7uQQANSZ0T52anD1Lmi3BYiN+FdxD5LaW42k/I1hjSMdaPkUcZnnz
 l2dBrSMHt67Aaeza/iDP2lHAkxpOcJD+8looPEWZiGq2s9liuQJ6p01dcMnT+yUdjrjw
 f+D6UOP5y6akXQ+s6GRlNwLDSMTo5DMn4PzC8pUmuuCrQkaen46Jzl1O+XGskof94HSj
 HI1w==
X-Gm-Message-State: AOAM530JJ74DI4jdgYQ7C3Gtk1olSCoyXBCWIIb4i1V2/1K+qg4rL2AM
 2yDCPtMJfLtwWjgGrnu3pZBw2RaG5lg=
X-Received: by 2002:a5d:6d51:: with SMTP id k17mr17742345wri.233.1635549517102; 
 Fri, 29 Oct 2021 16:18:37 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j16sm6975122wms.16.2021.10.29.16.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:18:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] target/arm: Use tcg_constant_*
Date: Sat, 30 Oct 2021 01:18:29 +0200
Message-Id: <20211029231834.2476117-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3PqItq0gU5bz

Missing review: patches #2 & #5 (new)=0D
=0D
Introduce store_cpu_field_constant() helper to avoid using temporary=0D
when the value is constant (and read-only).=0D
=0D
Since v2:=0D
- Simplify store_cpu_field_constant(), do not modify store_cpu_field()=0D
- Added another use in gen_rev16()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/arm: Use tcg_constant_i32() in op_smlad()=0D
  target/arm: Introduce store_cpu_field_constant() helper=0D
  target/arm: Use the constant variant of store_cpu_field() when=0D
    possible=0D
  target/arm: Use tcg_constant_i64() in do_sat_addsub_64()=0D
  target/arm: Use tcg_constant_i32() in gen_rev16()=0D
=0D
 target/arm/translate-a32.h |  3 +++=0D
 target/arm/translate-sve.c | 17 ++++++++---------=0D
 target/arm/translate.c     | 27 ++++++++-------------------=0D
 3 files changed, 19 insertions(+), 28 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
