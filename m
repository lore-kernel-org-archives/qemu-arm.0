Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1879197lfm;
        Thu, 16 Apr 2020 07:28:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypKvYMTZa+/oPSA50zFkJ+3viq7MMlkLLvTSqGjAuou8878UdKYXB6qQIwDR+gqOR2Qnz9ZL
X-Received: by 2002:a37:6296:: with SMTP id w144mr9510827qkb.310.1587047283061;
        Thu, 16 Apr 2020 07:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587047283; cv=none;
        d=google.com; s=arc-20160816;
        b=qmbb3L0cYWNVBVdOKMAfAB5InTYNeGoqr2/mksbqtYk+McDxa3rPp+RG73oev/WYW/
         VBVJRZr/GZIyALJ0KtExi81lleruBZyP37Ey0k40t2fkzHnHXwZPSV7sprvAlyT0QdaV
         fuOdxBNJvmmSfaeSrstRioCduM7kv0WY0YNkuiHA3cl4tErWL9G6byfmwDnu3JmRNL/z
         RO2tnf2y25NaTo3nKSNURDDR7ujofXEDmGLXQBweuyitdF0bOXtUjWnWt5e2JkBKPbwZ
         HByxqTg9fjeOV1/IEBAr0VFeBk5m9ZQX7qd0k2fNpS+GQBI5qgrn84zlSu1UkWWGy8+P
         0K9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=imUwsrg4zm7K3dVi3ANN1ml3OhfIyAqYieMkMrLSbc8=;
        b=z/cYdZqC3APsr6c24IFZjE3Y8kFKDfGOf4BaD12UWDnJWwW8stbuemFX6ukTp0179M
         Fp8Dcp86FVp4hLsN7FThL3Gzj6Y4OBmJqXloLd6rrlifgV8D/m359e2qgDk5TenAFt/L
         OPnfakR6pEe2s87k82redAyhEOOHr8xUGHxiJ650LUwNNBymS7WHHi8/eHAVdIp2x6hW
         T6sdloPRthc+J08dVFMInTMHyNeM4jLeWD6AFK5429fmhoTvQiVZkyZmeoBaJnjNgcV9
         Y1nbqyEhS8ZeNqt2oj696HEuq3gw9CwtK+VB0XRAQApTuWacSzAyW71ShBd0SH2XdZkn
         LGrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iwtguvsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si762381qke.79.2020.04.16.07.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Iwtguvsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP5Un-0002ap-H5
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Ub-0002X5-OO
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:27:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5Ua-0002D7-Os
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:27:49 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41382)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5Ua-0002Cl-KJ
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:27:48 -0400
Received: by mail-ot1-x344.google.com with SMTP id f52so3193201otf.8
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=imUwsrg4zm7K3dVi3ANN1ml3OhfIyAqYieMkMrLSbc8=;
 b=IwtguvsmsVuf5tBB627e317tnkz+hrzt6aX3VxeYCu24a11DNTEomGVTVafdaU4Vro
 iOuyQwA/z7ETTGLJIR5NRMwLsw08qCnmEJdtQqRHdoqDUqcnzkppS1uqAsMinbgD7Yw7
 Ku/wCgFRQEbFQJJ4YV/YhGgEo6FHbepFMCRgF855CGnoBnCKEtDz+7Q3zbQ1rdscjnUw
 nCmIjAY3fCAuIAxq4/Pg4NtfqF5dxYCXFFaRc7AsawflHAvKxy3kGxxU7EHD2z/9dOBh
 ZXgFqL507p2se0pk7pPQib6fT1+Qv0cV2YIg4qn8zWlbYYb+DfdCmi2185JNRmZ/N3ah
 nnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=imUwsrg4zm7K3dVi3ANN1ml3OhfIyAqYieMkMrLSbc8=;
 b=G2DQqJeSpkStd/6/mdXm3JleBLR4k1ipYFY4lMWpDjumvcHVM6gfi1GlFTHobDmQhU
 l+CKxaOxvP6SHfNiyNh2YluYha8i6WV8IcnV3EgTESfy4bKthCAJ0gUpzI2+0GXYXQ+o
 eOR1zhrioCpLY5wDLl2X6/zBCOq70DfOyoNwOupJUk04zuCJRK+88v2w2Durlmwl4U6V
 8SQ56ZK4oV87uiXVUoRbV4XCu0ibRTCgvOodrWwGRUgUpAYavQzK2pCbJieUg3sqjC0C
 XMPx1ors8zKsleDJdQpkuVDAIlR9A1OLsNtFSAq+ovkId7gGuU4CFyWlxcteX7D8S9gS
 dx9A==
X-Gm-Message-State: AGi0PuYTfYlfdBhJ/aE9/dJEqHAui3ErqCOYfgR/OSwR68MdaqXudEmV
 Az4hdIQ8td0oGfHSxD4rIPK9Q2jMLcbnYoSHGkQY8w==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr5449274otc.221.1587047267227; 
 Thu, 16 Apr 2020 07:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-17-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:27:35 +0100
Message-ID: <CAFEAcA8nSANczC5SE1gnnWXCLiB-svziV+14oKSUyj2T7s=1rQ@mail.gmail.com>
Subject: Re: [PATCH 16/16] target/arm: Remove sve_memopidx
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YBf97Hqi4Gsm

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> None of the sve helpers use TCGMemOpIdx any longer, so we can
> stop passing it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
