Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3254556lff;
        Tue, 15 Jun 2021 12:30:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcImvZMU8zBBcDiS6BZe9UxRQbmpFqCC/J2WISiaDqmNu8ERAJTcDuSlWaltt1fiIICUTz
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr836998wru.242.1623785454081;
        Tue, 15 Jun 2021 12:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623785454; cv=none;
        d=google.com; s=arc-20160816;
        b=PkcfnKBpW2RUKbJfW2FmK/Qrpn8uyCCaygYjnbeXOtStdc/SBPUE0Er+E3ySqJ822v
         7sZGVLqtSwMB+A4FaV5B5+LMKO2nY+nL5OQCA73AtXx9iu+X/vjiz60y4HAh72xr5dMK
         53eeKDS17zHON2bEDYCLCdqC5ZJ7zQWiOonJehqNFq1KNPHAekkD0kNHd9C3ZY4Tx2Mz
         v2TOYg4ZCMd8XAnitMG3cwBY5GzKEtjCgkhPBji1mrudrf6Ca3wuYEA/A2ZSvSnK+7df
         CgL8dV4nY/j8WRmYw0rUSbDypjBnhjBYtMb0GZ4j4rFYniHGov/yyHkzW5/QwTmrRjlK
         4YzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=jvJ1zmax6UoNYSGCjdqDE/V2WMvx/8URVYLNZNLwIJs=;
        b=B3vQYjbpOZyIU4s8OAvbQQT+4oMnkLFSLZgD+oiewuwoM7/626ClAN127wj6bgfbnu
         C4RZX0i3WuFVNW0ojy45ryRWvHY0MucqoyOgBLtWTHG+TGuTjusjjuKyrXFn9HyGQ5Cn
         76SIZ7yb5u2LXsrWJMKXtv85nJHmAZDEKLbEbNuh/wIa2cz4onNNAgniETBAQL4QJYTt
         jtZn9MwAfxpKcWnkcxDcjVvG8iNiPaxoM6tS2PyHhwM+Hh/I5Aq02ySZxA4z0B6+Qjev
         glxIMfzP+vUr/2o4zZUG1peC8EfgEXspAqNLsHtr1lQIBntxEWKJS+bq94FvLQxgYCx1
         03GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="hKM/JzoC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si3805856wri.488.2021.06.15.12.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 12:30:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="hKM/JzoC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltElx-0005dA-8L
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 15:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3f__IYAcKCK4jSbhifSUccUZS.QcaeSai-OfabcbUbi.cfU@flex--venture.bounces.google.com>)
 id 1ltEkE-000383-B0
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 15:29:06 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:45039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3f__IYAcKCK4jSbhifSUccUZS.QcaeSai-OfabcbUbi.cfU@flex--venture.bounces.google.com>)
 id 1ltEkC-0003N8-Mo
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 15:29:06 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 w14-20020a056902100eb029054d7f164a2fso10292328ybt.11
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 12:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=jvJ1zmax6UoNYSGCjdqDE/V2WMvx/8URVYLNZNLwIJs=;
 b=hKM/JzoCGUYVUzLCCQnZ87uVknQenRkounJ40+q3+zusq8ke85HLUqI+Sv+7bzLiI0
 K/GPBNrVTwPaOrsu6RilfZlniHz6IgJp2yUL1R/vKg8bLQ8Q7ekLrNpYdhm9w690RrQi
 WIue5iibvwPeEO+/esgxVjM+Yrhzjk24FNgfljl7gHW9MRXJYUATqHXpqEBdqStQqpus
 5UqV0UHsCJ9Afv1XDn2aTErvVaQNC8tAd0c0vPCww00F7nTZ2BWrBcR+JMtYhuDnHXLf
 yh0tFh/irSeXUr2vVDfiD7ajMBRcNQBI03FdKk5yvoXMh0xOorlq7H+ri9I8Y4vCaKYl
 gxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jvJ1zmax6UoNYSGCjdqDE/V2WMvx/8URVYLNZNLwIJs=;
 b=XUWAGOM+bn6daNIA3KbDB4AgWqMxcO7UyXXo4kLNGNkqszMyPkHJJJ9y6DwT8p1Brj
 eYJMZUOuPyMExSOGZ/xMQaalY2K1Ru1vLuF2s5AKVeOp/nSuNk5NiWdfB0oAUYPOP2w9
 5mT7s5t45hOawCTD/Dv0NwWeGQkeEwoDgxjhBWWGBWO5VlCQ6EvoRjstFrrkFQJZjYyj
 8fQKKFeRDfvohDcBsoaanE/bAhHsrQSOlwh/SLuIg5VJOtQ0tmGPDXtiT9QjvKyyA6mb
 hEzkzwr9vWTT7sTs2AMIqINX5oEL/nS38+0k3xK3DgjS7ZzrO1IBanyjnGRr2mQhbO6V
 1vqg==
X-Gm-Message-State: AOAM533TDCmrwn2NyTbOU61NA5aNw5LWMBHF70bC3oBqSSit15d4g+/W
 WSSMOokyK6ZZ3zqWd7sdCOdfOFsg3Qxk
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:abe8:110a:b827:ef39])
 (user=venture job=sendgmr) by 2002:a25:b199:: with SMTP id
 h25mr1162383ybj.58.1623785343325; Tue, 15 Jun 2021 12:29:03 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:28:48 -0700
In-Reply-To: <20210615192848.1065297-1-venture@google.com>
Message-Id: <20210615192848.1065297-3-venture@google.com>
Mime-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH 2/2] docs/system/arm: Add quanta-gbs-bmc reference
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org, 
 clg@kaod.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3f__IYAcKCK4jSbhifSUccUZS.QcaeSai-OfabcbUbi.cfU@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1coAI7mOwSRR

Add line item reference to quanta-gbs-bmc machine.

Signed-off-by: Patrick Venture <venture@google.com>
---
 docs/system/arm/nuvoton.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index ca011bd479..197d149f66 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,4 +1,4 @@
-Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
+Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
 =====================================================
 
 The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
@@ -18,6 +18,7 @@ segment. The following machines are based on this chip :
 The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
 Hyperscale applications. The following machines are based on this chip :
 
+- ``quanta-gbs-bmc``    Quanta GBS server BMC
 - ``quanta-gsj``        Quanta GSJ server BMC
 
 There are also two more SoCs, NPCM710 and NPCM705, which are single-core
-- 
2.32.0.272.g935e593368-goog

