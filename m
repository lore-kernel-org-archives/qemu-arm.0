Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp858503lfg;
        Fri, 28 Feb 2020 08:28:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdN2GrSZC9NmtNRB3AWWyZgh+4DA9rHmFBflI1baACoaiZYkfChA+fZ+1zMh2mU3f+UwNs
X-Received: by 2002:aed:2ae7:: with SMTP id t94mr4896109qtd.130.1582907318074;
        Fri, 28 Feb 2020 08:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582907318; cv=none;
        d=google.com; s=arc-20160816;
        b=gYVV7iWvNP+pKHhl3fonkPZM5DoWNHnm60VECtm1X8uDnUUfd+2MIZ28EfjYMYqOqR
         HK7LCoFUNVQd72lssMW/rTgik+Umj5Mir+QnOBC7bTKTAess1Y1A8JxV9qtjPZNk7dSq
         +tcDgQ5PcgGCTgSkt+i2TJMqn2mkiV0Q5BkB1ozo3s/yX9Gy0QOe82aGWXn7v2BctW+E
         3FvqFZHJapNqpUMO6Dxaueru98rAXvuKjlqR9Yd8UtDqRgrFFQ8AWO8eT4b6CC+ypbev
         ph26lOUm8wPBs/SGeWp783pBs50TvaCa7y88Pgvoi0zrIRb0pHz1AMF6y+XfU4I8UpR+
         o13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i52BYjf5GlldymvoEHLvVf5pSSNmC4+GPc5TMQ0kTF0=;
        b=YrJ+WLuC9NyQBh+LLQrLde6K4t5PlmeJb6lSGa0Ms5zv8YVaKRkEAqMYy9Z3OhHSs3
         moZab6jw/UXJEZuLGdtkNzjNQaKtKDorz6KZc11UHwcws+Kyzwp331poHpPf3urwp2X0
         zPvYuLfdpy7febpThQJan4DszU44mxfA2uGzboRZP0BosIl55I6uS/062t504kEtLs+i
         EO6pcJioKMhFq7ZgytUq8FtjxCYVzsw9yi8Ad7w0mqUfiKYbCkfz9K/0YedQCvgl7eKI
         UaO5PRlwYioIpBUNjDdWBDsINhCEalTrZGLHzCGz3jtqO3JhQ8Bp0kBwnhLd0D2Ng3VT
         R23A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=maVLaVcV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s58si1723226qtk.46.2020.02.28.08.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:28:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=maVLaVcV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7iVB-0002UJ-Gv
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 11:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iV0-0002Tx-VQ
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:28:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iUz-0001OB-Vv
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:28:26 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34612)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7iUz-0001NI-QI
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:28:25 -0500
Received: by mail-ot1-x342.google.com with SMTP id j16so3146729otl.1
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 08:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i52BYjf5GlldymvoEHLvVf5pSSNmC4+GPc5TMQ0kTF0=;
 b=maVLaVcVBM2WU26/rxdU3rVt/RIjTNpN2osy8uXf+vDwaoVkali8rQIFCqhMXnxoIf
 rkF0snCut5ppfTO0kFnqUdNw8aypyNmzO0TnARklQ/TP3YrYpFsW93aLnYmmvHPO1J5x
 NUf0kqCZabZIAgLRmegFCD6Reic+pZOPk3AAIxeSljrqCYko6b32gKGYwBwK5BdFkg/g
 sPPTju4YeyWm0z79hiTrZ+IdlVoh1+ODsHFkIT6sTaXiOjRCSqcg1eUFi7O+tGH6myO/
 iKoa9QbHGgFDCf4jTLBhZEkami5P2o72qxYvA1uuSI2xBd3erb6aQAhRrtaVp+WqZDIT
 FUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i52BYjf5GlldymvoEHLvVf5pSSNmC4+GPc5TMQ0kTF0=;
 b=sZ4nOqAtZfAE981O3TIIwEE4il+z9pIum0bICA0NwveYFgf7BRH+cJwoAiL/+g7bGC
 U+Y1+YvgOxxGJUcqod6WxUygEiPCQsNLaNj5LbHBBNcENCNjYAxHPSHUjxIwyD0OBY8K
 b05tyLoxwIHT/BksJu97fJ8zKKh2IoSgW+AYKJY7lg49ryM4y/s3GXGJ2OuFqVbdIMPF
 Iem1mS3xg7XsoRNC0u/Klx+OMit9I71O8nOM9M0te/VdLy7AhCoi8ShxjTQ3FkqxffCl
 IKBet7axeg000PusbPBJ/i+aq5ISQSYJIrh3BE1YeY/bu1XaQT1mbjVdrfzFNY3kY1DU
 dW+w==
X-Gm-Message-State: APjAAAU7Ja/M8k9ccYfw6ESvwo6RVZpHGb5H35ICYi023zyl3dNMVjzV
 385v86a5BL7sjOKAV07mH7ik/kqIC0Vvh31pUblWfjxm
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr3790059otq.221.1582907304786; 
 Fri, 28 Feb 2020 08:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-8-richard.henderson@linaro.org>
In-Reply-To: <20200225180831.26078-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 16:28:13 +0000
Message-ID: <CAFEAcA_pc7c9ZkpYQ3nL2fTk5wtZM_Z7ggj=_Pt-ABZVv5Ga9g@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] target/arm: Honor the HCR_EL2.TTLB bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
X-TUID: ikXS/6uBwSUB

On Tue, 25 Feb 2020 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This bit traps EL1 access to tlb maintenance insns.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
