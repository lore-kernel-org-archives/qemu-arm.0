Received: by 10.28.173.206 with SMTP id w197csp2196113wme;
        Fri, 12 Jan 2018 11:00:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBosyUo7ZQ8KKc+NyJaUXWPe8I2s1BpAGUVM5lH707N1qaEVwgUbrBGdGO6jXEZhJT30SMSLk
X-Received: by 10.13.238.198 with SMTP id x189mr24769295ywe.293.1515783613551;
        Fri, 12 Jan 2018 11:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515783613; cv=none;
        d=google.com; s=arc-20160816;
        b=luB9k6vJukdVcRp76ogxf5DBB5Cv8f9GU2kmPUSKO2kkS8mPGhpJPrjU40ObocIraM
         rAgCk0pcS7n5xP1oQIDwGVMtJWmILb0iBg9g+waOCcrttmacMWykiY6GaiunTt4ESyhI
         DieMUi6mMIV4WH1f4adsxb+UQ16RwsYEraGEhlgeJldyW+VOpV7VzLEvl0m+QKPdTaWD
         i3bYZe9RF+GIQH38Kax7J/+wSPXTiYyjis3bI3eiwDuwIGAa1S94mp/E5tbCt9iP1+b1
         17syr9BhXQR3Oz1T1+XcyrmJrKFsvTD0OHTPJ8mlpgXR1BBJaaT8L3SnJA7tGX7sGrEU
         mqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=pLCKOcLRLdZA7bVbcqcC8uOHkiIUjJeItiLPDrF4xyk=;
        b=ZwwrwSHkebsyVxyFXZJdni2OBPBomx2lR/TgDDPlqsPVYLi7ZfbPGSi+iHKpZY6Ieh
         d1+fiRJ9A1RT2cYyuoX4ouLsw6typwHJ/ufsQiPUl3csvZCoqfU8Pj/5BpFZnKgqu5OW
         hkxtP1EJaqIpRdgJXQfL0RMVj+Vf+LHtcopvAZAqfrLqte7prkrT9ayEtZJCTTTxY5pa
         iwJbacipZIEke4p2/daD8I7g6aFn8a/tQyxM3yrHEkiKZz85LZXea30XbJ7bVi7M9rV8
         gTzv2uLejDqdUt+QNeUKGij6RcCjckESDrHtuIRr/+xjz/TGQbJAiPyIeluXqsxCPvFC
         dyfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0NdHpyT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d74si3156000ybh.694.2018.01.12.11.00.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 11:00:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0NdHpyT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea4Yn-0008TY-1H
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 14:00:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea4YM-0008S6-B0
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 13:59:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ea4YI-000731-OB
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 13:59:46 -0500
Received: from mail-pg0-x22f.google.com ([2607:f8b0:400e:c05::22f]:35382)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ea4YI-00071p-JI
	for qemu-devel@nongnu.org; Fri, 12 Jan 2018 13:59:42 -0500
Received: by mail-pg0-x22f.google.com with SMTP id d6so5146052pgv.2
	for <qemu-devel@nongnu.org>; Fri, 12 Jan 2018 10:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pLCKOcLRLdZA7bVbcqcC8uOHkiIUjJeItiLPDrF4xyk=;
	b=b0NdHpyTmBRXF6GRqIDKGcyA0rtOKCh1A/Dmaf4YzMA1kHe+seiMFqPrgAlr/4sP7k
	4jQ7fH+tuYGEX7dwnRb1bpuH+dUNUXYMBjWXysFKv721YT6arKDXYJ1WfLkrXfKzYrpr
	1mtLLbtyhUEdqbYy34aB9SlzThiqmntyMymIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pLCKOcLRLdZA7bVbcqcC8uOHkiIUjJeItiLPDrF4xyk=;
	b=jELK59aDdF2GGAkR4gL4baQE4bEnWUaWAwMWZ2cwNCsCewPI9ngl6Z69JKN70oiwzn
	Gev50EGytNIY84P/yij8Jp3jRSIMC7UBznpFdX5igAWuZM6oFbtiBNSY/PV9jW+pGw8o
	sKWUv7X9HosE5il5zPV0QP0E/3QCM8EWxt4NvCkq47IOOUu6YKqIqGL6VJWtocsecrcs
	708+mMuFe7QKtFO7Zs3u3F+z8WcMo4tDbyF3ucngiLjWJj4rIXyrdMmi/BwlqnwySYsZ
	kFz4kN+PJ3TgNTgHS8cOlxgj7xtgWTgR6YKKvGvkqhNxQYfbxcO+Lc8NZjkm80nbxYke
	CXbA==
X-Gm-Message-State: AKwxytd6YFkzUviqCQpsnzLnuy7Dj3zT9NZJnN49m4aNzXfpQ/z/oWmD
	oklf3TxzGkBMlmgW3bJNjrNB2hPN+ik=
X-Received: by 10.99.180.5 with SMTP id s5mr12427527pgf.5.1515783581247;
	Fri, 12 Jan 2018 10:59:41 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-78-183-178-static.hfc.comcastbusiness.net. [50.78.183.178])
	by smtp.gmail.com with ESMTPSA id
	m69sm33100784pfc.36.2018.01.12.10.59.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jan 2018 10:59:40 -0800 (PST)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-3-richard.henderson@linaro.org>
	<CAFEAcA9igMy9u0WdTBvJWms1G4Cd2m0QXUucJeXCJ1Uo=7OAMw@mail.gmail.com>
	<300b87dc-7a0c-dda9-058d-674b115d06a1@linaro.org>
	<7bec8c5f-3454-374f-b2e9-f01890e1996b@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c5dec84d-9b22-7f26-49e6-8453ad613f31@linaro.org>
Date: Fri, 12 Jan 2018 10:59:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <7bec8c5f-3454-374f-b2e9-f01890e1996b@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22f
Subject: Re: [Qemu-devel] [PATCH 02/23] target/arm: Add SVE decode skeleton
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
X-TUID: 47D9cRcAfNpQ

On 01/12/2018 08:12 AM, Bastian Koppelmann wrote:
> On 01/11/2018 08:12 PM, Richard Henderson wrote:
>> On 01/11/2018 10:20 AM, Peter Maydell wrote:
>>> On 18 December 2017 at 17:45, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>
>> I didn't want to attempt to generalize this until we have two users.
>> Particularly if we wind up with extra options to the script to change other
>> behavior.
> 
> I might be exactly the second user. I think there is little sense having
> two generator scripts (one for ARM, and one for RISCV). Unfortunately I
> missed the original mail of Richard and can't find it anywhere in my
> mailbox. What is the best way to leave some review comment's for
> Richards patch containing scripts/decodetree.py, since I cannot inline
> it in a mail?

I've halfway done with a conversion of target/hppa/translate.c to decodetree as
well.  PA-RISC decoding is particularly ugly, and I did it with tables the
first time around.

Just send mail with "decodetree.py" in the subject somewhere and remember to CC
me.  FWIW, the original mail is http://patchwork.ozlabs.org/patch/850325/.


r~
