Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2906926wrg;
        Mon, 17 Jun 2019 13:05:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxG6taNWOZRKxdEqMhjIponCivsQbwnDbt72zkXgA4VCNCjbYS2GQT0j3F1rc1RJIgSzmnB
X-Received: by 2002:a50:bdc2:: with SMTP id z2mr120843430edh.245.1560801959613;
        Mon, 17 Jun 2019 13:05:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560801959; cv=none;
        d=google.com; s=arc-20160816;
        b=WYFLNtSbiT4RqZyPO12GWDiIWTEgkKgcykGlmmzZyRLHIYdojpY7+H+SUDw/ljjYwQ
         hj4wASi/OnJb8xyqyxUeUMp3KfmRdSYZTNeSbNYJcsNYewwxHoh0mADQTfPzT+cbizKd
         5vN6Ez0Hu2WDvZpMT+2ibSfeIIWkwt8wFkecwbmRWJ9IQwj0gIxUuL2h2emtyZ8JApil
         3gPVveJnGhVWucvY4V0ZEfHkY5B2rPcbsJ5OYxVLW62hxM9Rahn1IN7Ds7sQGE0n7Fxx
         9KMsA0iTyICpn5EbrFANbMraZJL/TrSv/BfDy4z4PeZ+DwkOg8obXsC9DU2s/g7iiqaS
         6slw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=bb0b5b5JuBcsrlcLhxC7EfAEH5f5CLzmFNTVbFtfcYs=;
        b=xdIMJdGD19sS3/E8JJw5GjsiZ9kdTguPjSV6SIwv1nlkiZGX9VanvHHPG3Do2F7xzU
         Usj15cWLl/33WXFCnmcNIMr+6sJNa7EjNdDtfKMTqSgzbAcZBri584wiqettMyx3dkaJ
         CE9O6DNYr4zszNeJyeXIlcGyf1UJGgF21Yzj3Lr997OrWvrHZwjr4/dRz06LonD5r+kr
         Q/j3eetkYWf/dCXFWXFXyYoG99H3GOHmkkhS65Rd1egbuUvmY9q2e9dYv++/K4YlDoZh
         VfO3yC2lxerTf5/Z9NlxanROk025K+LGiNuwsQ6sVAhlIS/kDpTWjgj9Iku341JB6a9O
         e+og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D3pxrOke;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si7899430ejb.18.2019.06.17.13.05.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 13:05:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D3pxrOke;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcxt8-0006Mr-NL
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 16:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxsS-0005rf-Dr
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxsQ-0004SZ-Iw
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:05:16 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33716)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcxsQ-0004JB-75
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:05:14 -0400
Received: by mail-pl1-x644.google.com with SMTP id c14so4594834plo.0
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 13:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bb0b5b5JuBcsrlcLhxC7EfAEH5f5CLzmFNTVbFtfcYs=;
 b=D3pxrOkeqD+RZMvXg2k/sB6qCEpi6fLDSQ0W36u7eCAJNvQv/WaVNnyTbSLG5UufyN
 T0lFl4yXbmQZvytAbNOGJgVal30JRrk6DKzsL0kJuMBl9pU3LQeKPZQpXZzTWuCFoIK8
 Yw4tcsQ/29vDT+yH9N2JZCLLwsfnI8gnwVezqh/rxg19XwOTyo5PropNaB32Q0+MmkdM
 /mW3zibi9VesJUR9CVPkUzSzPwtoGdcUMH0ueSsyGsp+fxhaWivyYsqou/N1uKnl0ri9
 62dgXSxAaO9i9XswmiN1G6XTwtEpUFDhhvgzbUXF3qPT1VLdZkxysbSpm/dHT8LuO/LH
 VbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bb0b5b5JuBcsrlcLhxC7EfAEH5f5CLzmFNTVbFtfcYs=;
 b=bZndWnl0UycvucjyRZe8TPa3jn6bLArpy/JdChwggAjSuRMrZGivi4Dxx7ubxvpp3N
 3mhZrjoLc0J809bOh8tYzkE6KmT1mYF/wpPFQMFMuQq2UfnLDJK+PK98f7544vpX/YFG
 udBczq50RnLH7IfoozIfjJtT01ErfKX9liyWHyqZUy4FWg6rcKitlL9YlkNrU/Sf+D+G
 kGsaql25BuVN4vhhc1d37L2bvLCPRKrE8bYeO1t3Bf4npHXQOnDeOLTge5wzLagjQG/O
 o/TSTS5Iyqvd56Q111+BcR7lZAc14cMvbrMKV92sWc+RKPfShp1Ao5PJ5Hmk4jvbV/OQ
 izUQ==
X-Gm-Message-State: APjAAAUgBiKNjcilI5PyLxxwH8IuOQXaP2Q0oFj74xzyXKviUd4oH4NO
 PbImr0VvSuilDZtQIz/gHqxJLY5bzjI=
X-Received: by 2002:a17:902:2ae8:: with SMTP id
 j95mr69679979plb.276.1560801901035; 
 Mon, 17 Jun 2019 13:05:01 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id l1sm11896451pgi.91.2019.06.17.13.04.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 13:05:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617175317.27557-1-peter.maydell@linaro.org>
 <20190617175317.27557-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0e1ea74f-a99e-eef6-aa12-2248ce056eb1@linaro.org>
Date: Mon, 17 Jun 2019 13:04:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617175317.27557-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH 6/6] target/arm: Execute Thumb instructions
 when their condbits are 0xf
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iun8YgGsMJjH

On 6/17/19 10:53 AM, Peter Maydell wrote:
> Thumb instructions in an IT block are set up to be conditionally
> executed depending on a set of condition bits encoded into the IT
> bits of the CPSR/XPSR.  The architecture specifies that if the
> condition bits are 0b1111 this means "always execute" (like 0b1110),
> not "never execute"; we were treating it as "never execute".  (See
> the ConditionHolds() pseudocode in both the A-profile and M-profile
> Arm ARM.)
> 
> This is a bit of an obscure corner case, because the only legal
> way to get to an 0b1111 set of condbits is to do an exception
> return which sets the XPSR/CPSR up that way. An IT instruction
> which encodes a condition sequence that would include an 0b1111 is
> UNPREDICTABLE, and for v8A the CONSTRAINED UNPREDICTABLE choices
> for such an IT insn are to NOP, UNDEF, or treat 0b1111 like 0b1110.
> Add a comment noting that we take the latter option.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
