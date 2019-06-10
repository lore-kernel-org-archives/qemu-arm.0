Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3481822wrg;
        Mon, 10 Jun 2019 11:43:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyP2IJpa6YLaxtLpCNIAkOIbBoR8s/v6bjvq0SOgi+VOqXjnXGyubZURcru3BlmRWTP2xCB
X-Received: by 2002:a67:6b43:: with SMTP id g64mr27574170vsc.183.1560192187922;
        Mon, 10 Jun 2019 11:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560192187; cv=none;
        d=google.com; s=arc-20160816;
        b=ntf6hS03uw9K+liHyID1CrpZw91dHIunGOe7rAhkigMsV+NsZWVwDAb1pQhOflA3EZ
         cbq159eCVOu2NAlQ58ncpRq1qSDBRx4HYyoPKks87guoAYIb+YytZrNAJSF3z57Ky6uN
         TXwM5/2hXUO4lqitvtEeq0+vaqp2BCnCfeWJnsVYY2ivUCRUxPABFz5J6poLtNVBx4ST
         Bct1BIlKZSw0A+dqzMpyqO+nmlVZ34X1QFT4GmmR1/NR7peXVktAahljUwa4cix57Fbp
         xfaLxdfO4Ha92Qi57lxlFEhBbgizPv52CQTDFNZ6VD3Ospf+tojhNDwnYl12rUUsuf4O
         gg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=x302XDK82B+4hwZDzLu0wtz7XgG5rL/XX5wh3BskLBE=;
        b=UlwFmDNy3RITOxDfegKk37KJ4m94c0VT1SpwC6okSorUcMeLooyLr24IgrmVrjCES4
         B38qr6ORYT/VUSVoQTtdti1CjVC8TUl8MZemy8udyiI/nqFiVtOfwlnhMJk/YEH0/O4C
         P3TUts9Y7Tam9vf72+XJ6DwxCWYyNIO1ZwdzNx+RpGAbkH52k4PowFk/BE0PUdqQwd/N
         XoOl8YT9FlzEgwqZxYFgkTtD3fttjC39b/Xei+ZQofM6V4pKGjMekXEx7fsOSel6EkJc
         aQtTvMacxoqsiuHPlQkN0+ISAIDxNqPQTJSIQ7Jv6qO/GEiCXQ2PO/4ayLjMVSvD2WWS
         7zgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N0jJM/Zh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si2435126uae.80.2019.06.10.11.43.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 11:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="N0jJM/Zh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haPG7-00062d-Cl
	for alex.bennee@linaro.org; Mon, 10 Jun 2019 14:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43658)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1haPFy-0005zs-Lv
 for qemu-arm@nongnu.org; Mon, 10 Jun 2019 14:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1haPDF-0007QK-7P
 for qemu-arm@nongnu.org; Mon, 10 Jun 2019 14:40:10 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:44969)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1haPDE-0007O4-WC
 for qemu-arm@nongnu.org; Mon, 10 Jun 2019 14:40:09 -0400
Received: by mail-pf1-x442.google.com with SMTP id t16so5788482pfe.11
 for <qemu-arm@nongnu.org>; Mon, 10 Jun 2019 11:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x302XDK82B+4hwZDzLu0wtz7XgG5rL/XX5wh3BskLBE=;
 b=N0jJM/ZhJa1HfvzKP7dCdi0dvU2KpfHPznfVGt1L3AViJCOLtbUkFTHhTo78o51JQ/
 0C3W+J4mha+2EGJUNdwyfZvC98C2yE7et/lYMh9NLEqys9iziSdrbzhkmlpsxvfPetSd
 vIiC3i8WwomthpIElvBQymEDiJxmoZndAdcDeEUGCU1KsyX/lwA5dceDPgUUX46j7yY3
 mhdKFK4P9r0LOfVRj9sFLcGVhab0lClhRozjQYHK8B2TpsMcbNK69LSvzuKZ1WthO1sK
 2Rpp0mIQigQx6Lj8d7O+cN4JTh/UnaI0NwHkp3qgiwNUDGfel2fT2lMvRBIclQY4ea/5
 xELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x302XDK82B+4hwZDzLu0wtz7XgG5rL/XX5wh3BskLBE=;
 b=knJEnIEVlS1wqRfTapI++yhwzROhmCHPcpn1Fzq72XM/ggT2AQCaHOPREyJSDWMbKX
 L+mvs0hbV+e44MRmxjRF1XqXOr8vTbqT2L1cTdXyJi8COJ+KqhZesaY+16IZ6Da9yBqg
 BRkmurrJJB1go0cUThrqJGiPufoZscrYLgbEZTbQimS+rDoUd0NB2SJQF0FMn+MRlsxS
 ZeTYmNDtAF4cZhEfAle+536jHNBulBL1hrpXz2BW0zkFZq7WJHPIpd8WWIl84fcJrwsu
 aWxqFmMHbpR+vClwfpww31mSoLvz4i5oxtm2U3gtvU7uYqWJHXue9nwrK2ndM98gUoKj
 3CcQ==
X-Gm-Message-State: APjAAAUTI58WFTC3PtIHi4IawVAHz74DMfO3XoEbWXMoZecqee67P/v6
 MdubW+7JE5H/R8al0vowodAFAw==
X-Received: by 2002:a17:90a:8c82:: with SMTP id
 b2mr22249152pjo.97.1560192006378; 
 Mon, 10 Jun 2019 11:40:06 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id
 a192sm665715pfa.84.2019.06.10.11.40.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 11:40:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-29-peter.maydell@linaro.org>
 <da80c3ea-5a33-e7e0-209e-89a8413c8f06@linaro.org>
 <CAFEAcA8etr7_rmQsQcUY+cPHZEZna-An+r5TPJtMb4OQO-6Dsg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b9ac8354-6bb2-0080-f597-706b4b94009d@linaro.org>
Date: Mon, 10 Jun 2019 11:40:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8etr7_rmQsQcUY+cPHZEZna-An+r5TPJtMb4OQO-6Dsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [PATCH 28/42] target/arm: Convert VMOV (imm) to
 decodetree
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
X-TUID: vSEWNxOqcV83

On 6/10/19 10:12 AM, Peter Maydell wrote:
> On Sat, 8 Jun 2019 at 20:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/6/19 12:45 PM, Peter Maydell wrote:
>>> +    n = (a->imm4h << 28) & 0x80000000;
>>> +    i = ((a->imm4h << 4) & 0x70) | a->imm4l;
>>> +    if (i & 0x40) {
>>> +        i |= 0x780;
>>> +    } else {
>>> +        i |= 0x800;
>>> +    }
>>> +    n |= i << 19;
>>
>> Can we reuse vfp_expand_imm here?  Given that you don't have pure code motion
>> from the old code (due to field extraction) it doesn't feel wrong to go ahead
>> and fix this wart now.
> 
> I dunno, I'd kind of prefer to do it later. We're already
> drifting away from the old code as you say, and going
> straight to vfp_expand_imm() makes it even less clear that
> we're doing the same thing the old code was...

Fair enough.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
