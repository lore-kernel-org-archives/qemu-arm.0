Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1112754wro;
        Thu, 14 Mar 2019 10:35:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYZiSrktPe6ZkHxZAzT8QcvP6gMFWgvwLLhmAvJBS91kGRxiC/baYrVndrYGfWUohZYt9C
X-Received: by 2002:a25:e751:: with SMTP id e78mr42207826ybh.28.1552584923451;
        Thu, 14 Mar 2019 10:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552584923; cv=none;
        d=google.com; s=arc-20160816;
        b=ILZHZt97Jm2uWqYIdaoAgvUxUv0DQPOD0r/kMS6GIq1rImJ+FpBmQseq9r09iRcovs
         jBCq15k55EStgoyrDn/TwT2R/+QO8LFsvAzyWWhPY//ljInQh7b9pQXeIuXsQfwZupPu
         F2+yTVOS622zEavxyxWETUeeDRwcwXggywfNb2cOZufQmeqrDLAOoAbEvc+wmKSe9nqp
         qWjsYsJKdQe/63vfoBnQLoKta2IxE/Pnulsyp89/vLxRvQOfI22mR4gRH00PHVmmRkeS
         ddLRNGmoOCy370Dnrr0dBYjDH/j9ClvcAHMUc0QI2UkhajiS4qVJGEv6y8CVM1oo4JGa
         i8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=X87aT48a8x8PkcLyxHQB7JlKocYRm0eVewa5359CJ7A=;
        b=Ow/8m8JPWSvjhdViAuUuS2YwZrjTCZi6W8dD9SPV5lPZ3y3UHplizUBFiqUT19fgY3
         +lJm4NFMgBwiG8SOlzkxuYenA8SQhN8MRb9AdZBg14+HWS8dvaohv2U1M9GgGI5AJZQx
         WLDDsmW8LJ25U8Qe9BaWn2Qmq3PaEh0txvaHhPm5xAGdo7lII30rKw5Ut1xByJa2JAIa
         G59rpYtzV/WC3kxUX2cKG1C0CSmG83wdB74gXBkYYyKpGPthlsUVazwsJY2wJE2Dcg9a
         e34vSOJDDbyp1Qq3j96q2J17t/2y6ISyJqDiGxFLfYI11tKMp+XjNn/jQvy2KP2SFvzR
         1GGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NZrmLtId;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si9467758ybk.264.2019.03.14.10.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 10:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NZrmLtId;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4UGI-0006vM-U6
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 13:35:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4UFp-0006tr-UW
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h4UFo-0004sI-3Y
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:34:52 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h4UFn-0004qY-G8
	for qemu-devel@nongnu.org; Thu, 14 Mar 2019 13:34:51 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 125so4435687pgc.12
	for <qemu-devel@nongnu.org>; Thu, 14 Mar 2019 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=X87aT48a8x8PkcLyxHQB7JlKocYRm0eVewa5359CJ7A=;
	b=NZrmLtIda4VkKY5OcrQb0dEKOQcdReXk4w2hDN03f7qiJnHIt696ar56wKRDKrvW/0
	OfTEqn0COuneUPfmAIIoTZdHYMkTMBkWZsIYNNBi4TKnmuhMIc9pFOBOvLLWolNzitH8
	e6jSIcUBV++GckPFb4jH1V46G+NsQpLIQMMjB1Mp2L5FG4T5Czaiji2oUpHdTX+lFKjK
	DVQsw4ffCbfC5hiR/MUk9dpDZy35ZR1262EimNfwUbYnagK9YahQyl90c6PCSekf8/sz
	Jundo1+EzfvRdJAzvCTTIfqn3OeYQEM9h7qoPO5X/59sJ4CsOcZWv1Qllh1RWB81GQgS
	PLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=X87aT48a8x8PkcLyxHQB7JlKocYRm0eVewa5359CJ7A=;
	b=QJ9ola4ex+DA3M0ZH5TwBj88ZFVoYiVoQEuAulci79irYmLlBG4OyFg9Qy4H0DjmiS
	Nx++AlgNuNXzplGeWh/p1hq/AqQiLly/FjUfciTFsXefwIDYFNTshz9buMr3QGn86auE
	k8XAIGYGzFPuAgoaKq/9pMY/kqDz5ZL5NRrlRAyNyO1LYkF3XpfU9QA/F+8AaOnlloJZ
	NZCe9CH2LZlH2AeNqVg1UeXZ4XAMA2bUAOm8vUGmi+rnXtTtUBo/VBChb6gjKbQvi/ZG
	F1rGsJ/b/MDwtEjFhzYbuXDa5vGR5ujf8c+3HtQrRwB17y8P3mWYbe6Ui/ETN1ZaWGVH
	u0Yw==
X-Gm-Message-State: APjAAAUtW702KnbkYWc+9nNp1iF51Eyd4AF1K+XoW3YYsF3ryW5Fnkev
	KD0ErOO67spt/WDGOYGJIKMiDA==
X-Received: by 2002:aa7:8750:: with SMTP id g16mr24225386pfo.123.1552584887985;
	Thu, 14 Mar 2019 10:34:47 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	d16sm23831368pfo.112.2019.03.14.10.34.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 10:34:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Amir Charif <amir.charif@cea.fr>
References: <1552579248-31025-1-git-send-email-amir.charif@cea.fr>
	<CAFEAcA8dGr6gPGUcLhMqWKoC7aS40A4NssqFzHiKu0XhRKyE_Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4daad4a8-93bc-05bc-1dfc-5652da3168bd@linaro.org>
Date: Thu, 14 Mar 2019 10:34:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8dGr6gPGUcLhMqWKoC7aS40A4NssqFzHiKu0XhRKyE_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] Check access permission to
 ADDVL/ADDPL/RDVL
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1tWESACghdWP

On 3/14/19 10:21 AM, Peter Maydell wrote:
> Richard, Amir -- it looks like you both sent exactly the
> same patch at pretty much exactly the same time. Any
> preferences for whose version I apply ? :-)
> 
> thanks
> -- PMM

Hah.  Bit of miscommunication there.  Might as well apply Amir's and have my
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
