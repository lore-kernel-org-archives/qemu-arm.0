Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp522033wrg;
        Fri, 7 Jun 2019 11:54:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvHHYlthIvXEAVjOrkEfBwJMg+tPfFV7yoYhLcG5Gr0DS4+l30k0ArNcjEfR7tOCSJjzjF
X-Received: by 2002:ae9:edce:: with SMTP id c197mr43605114qkg.78.1559933662127;
        Fri, 07 Jun 2019 11:54:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559933662; cv=none;
        d=google.com; s=arc-20160816;
        b=QnQ01h9zjbG6Zsj98O9IGIbbDmMbMgHY4HqudVADO7uigyKCAriH5mzKbRAQA1rega
         P0jxeo9zfKf8x3bz2m2uZ6d932pRLVnGBKcQNIaRuGnq+XHrv+BaZuviODyW6FmK6s2J
         gME5CaXUpHSebmd37EttYAgkh6venwXo6Zv/fyFvAVxAcxsGMR/PDMenZUO3gViZuEhb
         wlsaQ1nXp6Rl1/T8Cg2kIMqTyUtkbtVnw8Eyiei4bVX3/w6mmXVtLw3Q8x2FA0bwy67E
         QLyUn0GWSphvbt8r1ZKbJM4QfCT6x0+VNAwmwHJ4rU6p3RAdLaIs5xncNRO2iS9zM63N
         dbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FcPMB1Arg6zfPt0d37PTD3eMaTlMz5e1OvwO5yTXkwk=;
        b=gzsnJRYr3W8OgTdTwf8lzjabOYED/OoxwpucCB9+Xx62wMk0YqCe/i6GVcRzkPPf4i
         boRdjWswZ06YP1NLPPbSGVBd6vAN1+4fAgptgZRuWufo9h1Uw4lmTFaM0KiqYxXEvJH8
         eKb41TlYgfMGyhzVsxBHD01HCxyRQ3RxtUD93kk2igm4ynfLOy4RI852JjK/E96GoyMy
         zXP9uw+zd/kWw7KNBnECLYbihnHNTtg0M/PKQPTLm5sh3SNBpgFBe3e1jDxHV3Y/Kptv
         5QY9D2Hyxex8J9Lvzb8oLcDqjUd/7q/VOyPg5xoZ7H5IC66CACKVbUUTsgRrQnnYaxQ5
         JjBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hec9sf6J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r139si1797877qke.88.2019.06.07.11.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 11:54:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hec9sf6J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZK0L-0006Xn-GV
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 14:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33164)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZIet-0002Ta-CN
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 13:28:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZIer-0006In-O0
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 13:28:07 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44168)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZIer-00066L-F4
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 13:28:05 -0400
Received: by mail-oi1-x243.google.com with SMTP id e189so1957888oib.11
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 10:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FcPMB1Arg6zfPt0d37PTD3eMaTlMz5e1OvwO5yTXkwk=;
 b=Hec9sf6J5rc1X5o1gl8UvVRMb+GBUFRNwPdrOMxzukIUi3KRYwPPHJQp+hqXtsjNV3
 JUTJgc+jhdqf5104zdbni2HhOJkU63WxcFPSvdCF8mzzE6iTBbZWYtXE0o23+thEM6wj
 8v07TEmqBlJ8LQM6cyLRKXrtVlfmJcW2KsXuvTM3jZM9R5SdsecVWHhKebqjMqNjbsXX
 Uey/PKfmsz7ngNOJLW49VSXPPxsFrF7gsI23MrX+SL5hTXSwD3Nd25RTY56EEctF0eRM
 naM8+lIB/rm8gCe0VMSAkr5na1IpPt5AaB8vsWUwaoGE1pfb4r8uzBUWOmbdBqtwja4D
 LWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FcPMB1Arg6zfPt0d37PTD3eMaTlMz5e1OvwO5yTXkwk=;
 b=pkQpDO3mVoakocIVMDXIqlXETK5lWzMALqG3oi2jHau7Dpd96+i5emfdmBfojNSO+A
 e5g6MNOuUstGTOu0EPQfdaamooFpq/zRhI+o+Tuafd3Rrh5zlLTSuIdpkY47v3Dmc0BS
 IVMQ7MtGyax0VHfB2j/REzi1NkCUdT6bzrbHYZmWmUhP70O9BHwg5lpgaN72cSyL/WsF
 E9sdxpu2ydiiMW8zF+39CMpV+Ucpq+3ahgvnkPuZuPgpRXgQLD1XpFaXfXvEIOZxzvaG
 g8xrhemcT1jW9IMUvt7/JaYMwWHa9KQCxGiUZXPUeo9tvLVfeg/akbDSZt4q9aOI4Q5k
 CnEg==
X-Gm-Message-State: APjAAAUYon/orMOW4CN/02XgtOdVkN+FkLfzAQ1ceuRh7G35rIEc712K
 RB+XTd2jrsmrb79vP0XzEU5tSA==
X-Received: by 2002:aca:1817:: with SMTP id h23mr4415858oih.84.1559928483887; 
 Fri, 07 Jun 2019 10:28:03 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id z16sm922000ote.50.2019.06.07.10.28.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 10:28:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <47d526bc-7b7f-b2ae-2f6f-1e8fdde7e2e7@linaro.org>
Date: Fri, 7 Jun 2019 12:27:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 12/42] target/arm: Convert "double-precision"
 register moves to decodetree
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
X-TUID: BV9EEX2Mib9t

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the "double-precision" register moves to decodetree:
> this covers VMOV scalar-to-gpreg, VMOV gpreg-to-scalar and VDUP.
> 
> Note that the conversion process has tightened up a few of the
> UNDEF encoding checks: we now correctly forbid:
>  * VMOV-to-gpr with U:opc1:opc2 == 10x00 or x0x10
>  * VMOV-from-gpr with opc1:opc2 == 0x10
>  * VDUP with B:E == 11
>  * VDUP with Q == 1 and Vn<0> == 1
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The accesses of elements < 32 bits could be improved by doing
> direct ld/st of the right size rather than 32-bit read-and-shift
> or read-modify-write, but we leave this for later cleanup,
> since this series is generally trying to stick to fixing
> the decode.
> --
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
