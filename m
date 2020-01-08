Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp471300lff;
        Wed, 8 Jan 2020 00:56:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4iyRocbWlbVmq8ZV4tqSOFVnR7scDXdjuE8uYCRry4El/8tdRWq9N1tBGi55hfkdpwqFD
X-Received: by 2002:a17:906:c4d:: with SMTP id t13mr3730285ejf.198.1578473761666;
        Wed, 08 Jan 2020 00:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578473761; cv=none;
        d=google.com; s=arc-20160816;
        b=L+rNK6hQSeQBdWGoSoLHQ1z2SBN5QeJGYnDz2fdJ2cGOb3Ud7XwOfSX1HMMy88Io8a
         ZP6lKAuwO7JEOcvD7Uw/pqCW866DxuViATZgvXc3lpcdcH1984DAiPQCc7kLBgs8uhi/
         eL0o56CMTup8F6wQmeg0wp/cl1llD6cjMrLduXPPO6sx+Id8CK3UvuwysQM7CENBmt1K
         hTBdiYDERYsXiu+X1mX3stTwdn+os3F1GVG3Wqh2baenq24by+5MRjp49SMsxil2vZQC
         /PMxcb26pKAvUpX9Jgah/mcrNrHIz5pm4CoUCKucpc89bKEgSV5cxu7egsmny8qDRgB3
         cvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=9BCeEsjfwo8y/xoGCMEDicL2iH2qX9gd0S2SN/klbDU=;
        b=Oz+bsf+5c4FWSfLitOIMGKUiIdUmuhnFW4R7bxFMgtD0gXHnK1Ktk5OfRN7BdnEexM
         UgM/L/q/tjH/YmE2ygvvzTX7zgOQwpLJeBHAYzFVIE13x+yCPLgB6OaCQ7P/5+rAdnSb
         /JThlTp48vLvZeCIq4/G2VXAyohrcPUDT1kf2bzez5HE4hocD8hk1cZsm0EU4cfu0L0X
         xVfU6KteDJ80LT3oKSYOgyuY6vS44xdXKPV63WuGvqG7XbWeMlXz3EQWEVG2zjC1JLy6
         ryBMAj3pJQThVME4eBuklNlcF8xtC8Ul8bn5tOtcfJ1CA4rvcfgECnvl2m8qke89jzyp
         K4UA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si1635993eds.8.2020.01.08.00.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 00:56:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ip78C-0008C1-JF
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 03:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <postmaster@kaiser.cx>) id 1ip785-0008BW-LA
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 03:55:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <postmaster@kaiser.cx>) id 1ip784-0001Aa-Pd
 for qemu-arm@nongnu.org; Wed, 08 Jan 2020 03:55:53 -0500
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f]:35644)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <postmaster@kaiser.cx>)
 id 1ip784-00016u-Jj; Wed, 08 Jan 2020 03:55:52 -0500
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
 (envelope-from <martin@viti.kaiser.cx>)
 id 1ip77y-00083A-10; Wed, 08 Jan 2020 09:55:46 +0100
Date: Wed, 8 Jan 2020 09:55:46 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] i.MX: add an emulation for RNGC
Message-ID: <20200108085545.7jnhxvcxwh6ycqej@viti.kaiser.cx>
References: <20191226175132.28116-1-martin@kaiser.cx>
 <CAFEAcA-JTxqGid8EW=Vu=xePrEVgxD9pZRNAg0BehFVhYKfebw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-JTxqGid8EW=Vu=xePrEVgxD9pZRNAg0BehFVhYKfebw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a88rfLsMFiLN

Hi Peter,

thanks for reviewing my patch. I just sent a v2 where I fixed the issues
that you found. 

Thus wrote Peter Maydell (peter.maydell@linaro.org):

> > +#include "qemu/main-loop.h"

> Do you really need main-loop.h ?

Without main-loop.h, I get compiler errors about missing prototypes for
qemu_bh_schedule and qemu_bh_new. Other emulators that call qemu_bh_...
functions include main-loop.h as well.

Best regards,
Martin
