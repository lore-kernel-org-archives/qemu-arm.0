Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1562165lfc;
        Tue, 3 Dec 2019 06:16:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyhfxcoXzFuq795N4c3yenqEE9E2+u0JK5aisu6VkIfxLXO2WPJfAku+csIhukSN7fWiOoa
X-Received: by 2002:a17:906:f47:: with SMTP id h7mr6349243ejj.254.1575382570778;
        Tue, 03 Dec 2019 06:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575382570; cv=none;
        d=google.com; s=arc-20160816;
        b=WqRwSnWk3Y3kQttuOrCLr2XEKFUW6n4XKW2WCN1J2H1Y9DY+deAdWIORVrtrfKW9Kw
         ShtNLAW4AZbxN6p8IN4E4VYvUBf1Cma3sP/w6vzOH7pRt7qYZ1bQP6u1cqiC26YHmieu
         47CnaJMJhpZCh7X1OxLkG0EtzPHYURw7yRyje5hMhpt6ClOHNI2f7JR1tZrY6qsV1eaU
         Q2hRc7DdqWSRIxLxzCt1KQ04PbBkTsQeka7uygyEX33wVcxQ7Dd+bFkBuKyGrm3CSQcl
         +LqN6YAPxt686mnIpYv3HYNo+glgOKLhrMt3DP3FRfHx3sjly/ONLByqc7y9Zqg+SlDa
         gb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/CnwmbUFWRsqWL2N14UyvLbg9Cdi2y+1OqJISDKJtjw=;
        b=r/XeYNsyUSXuo01z+XBWkUSQ39vccKkkfMWdwygMEBuPmR37yefrZJ6LpWF6TVrB+G
         KfO8xPFK8d3LsdriiwvKNoIGKzBJwYGd9EsfRq2HjNsA66LhM9NXUUMffDcsopt1Zma8
         SYn8RUVBSISYdEa+pSmdZH8/IEnLwa0rNFbr/JONMPLWbl/Lpvkt1FtGaosanKNFRZOD
         8foZ2JmVnWylf6HjmH/TTgquM2geEBKI6YKQ95qCH4UoVXAux93x+iGT/8zf3tODX/ZO
         SO8YYykVjeufNazBPXvyktqNt84hrNk5Qnh77uVa4sj7VJYHU42BhhhcYkaejmohkiAX
         ptIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BlJfO5T6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si2379203edx.47.2019.12.03.06.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 06:16:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BlJfO5T6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic8yG-0005is-M0
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 09:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ic8qT-0002F3-6L
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 09:08:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ic8qN-0001ea-U8
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 09:08:00 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42070)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ic8qN-0001Nk-Op
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 09:07:59 -0500
Received: by mail-oi1-x241.google.com with SMTP id j22so3345048oij.9
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2019 06:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/CnwmbUFWRsqWL2N14UyvLbg9Cdi2y+1OqJISDKJtjw=;
 b=BlJfO5T6fkfYo1fKkjLYeImj5Q96TDjDI6FnqyphfcPqiN4MNwsZ2tbxNd8rOfEHys
 FyVbL8XqQ4NXLyKFt1f9Rjl/BAJ3fUJrCXJnVZylGOzLOPMOM8q4YstgwXFcyR/Etx9w
 6HWNyJqkQB40DhSlxb/12LkgHuoY5H/hf+4I3ERP/pz+sTNEJli7I7rOdY/m5gB2ikyl
 Eb6SEfRBl1aqKDkbp77oZtLFtSnfpULHMx/WSIQOPaaEhRI+gYxvsT81SSkOuWJbGxRt
 edQFqqZejHYb8vuVOWg61B9mh1M+bzaphg1Sq6RBUFfg6cxdpLoIWOSO9zE60p3yuTVK
 hFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/CnwmbUFWRsqWL2N14UyvLbg9Cdi2y+1OqJISDKJtjw=;
 b=oiySnEqevOKv/33Tn/pmVlPIGr58j8kVyuttaKUd0DmDr89PqbiskvTk42fy+t5x46
 Q46E2+nOevBJNOTr/4zpXiZbk48+18cqa5FhsLDoD+Gt7wOyRBFt+I3R+x9k9jVOTCXv
 0Fsk8g5cL0V0doKkEDW/6J41Nr4Mp4JgUl6BDBz6SWGNu/OApB4udbY/HIP8r9Z1id0F
 VuWFhPpSl1HoPOFQOp6IbWRT+OMqE6N/TTOKGo89ApmsGBTyGGq1eUuBTYlXyk3MQTPd
 9creg9ObyADUy7pU5uDgtCL2htEdFcrcRPj2O30kpP6sjdjUJPZtu5Pg8L2VXTCLFoRr
 4AKA==
X-Gm-Message-State: APjAAAVRhsdjRQOCjzxvc7AusJ4qZF0+a2/sOJOC6Fmpk69qNW4ShX6n
 km5UNRCd2ODLoUwBRR2aUvtmV721dUwJft7ghUdwjA==
X-Received: by 2002:aca:edd5:: with SMTP id l204mr3760486oih.98.1575382075765; 
 Tue, 03 Dec 2019 06:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-6-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2019 14:07:44 +0000
Message-ID: <CAFEAcA9ps2JZHi2nTUrog7rgRc5gL8QbqYhSgFCS_-ARe_0T1Q@mail.gmail.com>
Subject: Re: [PATCH v5 05/22] target/arm: Suppress tag check for sp+offset
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: ghPgkJ3A2rna

On Fri, 11 Oct 2019 at 14:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> R0078 specifies that base register, or base register plus immediate
> offset, is unchecked when the base register is SP.

It looks like rule-numbers didn't make it into the final Arm ARM,
so I guess the reference here would just be to section D6.8.1 ?

Also, this phrasing is slightly ambiguous about whether the
"when base is SP" condition applies to both "base register"
and "base register + immediate", or just to the last of the two;
the correct reading is the latter of these (and the D6.8.1
Arm ARM text is in error; trust the pseudocode here).

We could perhaps say something like:

D6.8.1 specifies that accesses are tag-unchecked for loads and
stores (including exclusives, compare-and-swap, etc) whose addresses are:
 * base-register only, where the base register is SP
 * base-register plus immediate, where the base register is SP
   (not including reg+imm with writeback addressing forms)
and also that literal (pc-relative) loads are tag-unchecked.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Include writeback addresses as checked.

The load-literal case is implicitly tag-unchecked because
the address calculation doesn't go via clean_data_tbi(), right?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
