Received: by 10.223.172.38 with SMTP id v35csp1632313wrc;
        Tue, 5 Sep 2017 09:43:09 -0700 (PDT)
X-Received: by 10.200.13.8 with SMTP id q8mr5783264qti.99.1504629789439;
        Tue, 05 Sep 2017 09:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504629789; cv=none;
        d=google.com; s=arc-20160816;
        b=KPeIsDsVwiL+PNPm7Y07xvcxNy4Xgj5+a7sulbk1x9EqeN2QhoUCq0z2Zyq2jWbGjw
         MewgxQgdJNQPwx4bbH4UqH3RibYQQz/Nuj6svsiaMg7hKh2pTYZxOCVDBH2QgUmd3WcV
         6//dxmY6xLSXHBOBGMwanJUw4gWB+kZLIYeST8kQvxwzR2yhB/9TZN+2zl8MesshjoQx
         4izNv1Q8fH2KgoNM7NVo09VcJCynuP5eqdZEPGtijE5FYrPFA4YHLJnk7AxWqWH3yDMf
         08wCu7YW8XfVlcXfoDYI/DEFvjQjbcmV3pQfuJqUASgjXKsVofBwjVT3fX5ri3rex+nY
         4k3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=rqhWBFhJRcFmXqtZwB1DRV7LNmMlGlpsf3z87ha8X8c=;
        b=ITc9htG6pfETUyCRoCjmTwQmMwyKN32QUP5OQ6PiHLZbEttTTsFyMHHza3tjQHE0Hr
         jP7ahvSikyT5tR/CRZukqfUVyiYgxoxwGSrzzG9InznPzMqZCFdP7hUcTu1EWdCN++Td
         vzg2k15PW7NTPYBBkvvhome6oSGBs9dfZh4vON5uOjG3/P+Xq7ZPzqBF1GZkUtnVj6P6
         cuPaO2Fm1V8wVr8tcgQx/IP5rEwKg85PnQs+NQYELITiMAbdcHHOwGqp/clBNPRJUgpe
         IWgbiIRn4ijJxiajPSQ/dMDjanzIohQKfsK7Y8NZnZh0AFQfGSvcYjD9XEOEFq2m8tmk
         uMzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXIjj7zH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si617219qtl.107.2017.09.05.09.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 09:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXIjj7zH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpGwN-0001g5-69
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 12:43:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpGv9-0001G1-LA
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 12:41:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpGv5-0000ae-4M
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 12:41:51 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:36200)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpGv4-0000aK-U3
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 12:41:47 -0400
Received: by mail-wr0-x22e.google.com with SMTP id p14so7953300wrg.3
	for <qemu-devel@nongnu.org>; Tue, 05 Sep 2017 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rqhWBFhJRcFmXqtZwB1DRV7LNmMlGlpsf3z87ha8X8c=;
	b=TXIjj7zHoyPfR2S4HBFdLyTYC53jUv6bf+mTqtNmwffT0BtMvfj9EatUfcYzix51rb
	3umpkvHrQ6iGHSqJcYpPkGahSqCEucw5TQWtE8Nv+FoKaApusTXAS1Yb9GxWQkJDJTtQ
	BXdOdzfHLu78nIlkyZHgTpY5nWdzZFqeM9jS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rqhWBFhJRcFmXqtZwB1DRV7LNmMlGlpsf3z87ha8X8c=;
	b=OjymKObJBDv6pWonaygCgA1gybzw58RpLd39aoFwXyWXz/aztixEXMAcmtYx42d0W7
	HtDg1w30M2acfDSY+bhfCwlPkA0JoQZ1TmIdnBJcshTetwgm8ZVti/wd/sPe2MZzKz8d
	5NyhV/GRGN3Mbds/5I+pdwAU30OBapdJBrTzjyO6waBSN+/Bbr0qzeY7fXwdW/WQ9nkX
	CItrkrje3hu35cWfP0hOdnAEnuww1RLhB81PnRW+6odt483PN0BldLnK0bdklmzuec8C
	Em33rhdiEHH7FseeD3u50MX1lx3RvT4gEVLvVAbSPl4/pfnFMBYKcFxcKve+ic6Mj8vI
	CR3w==
X-Gm-Message-State: AHPjjUjkl5UbYge0/s6WaubWCI7Jh3I7HxrcrJp63AHD2xuCkBT6Wc3w
	wzSRNBGhMHOpTtgkR9GvPuBq8Ll+Z1bI2cc=
X-Google-Smtp-Source: ADKCNb55ahftyBJnO5Xj2JdlcAHnHex9adoWMuye1pBaOAMKDcYuXwHWjiifgwaHtMEPheqFBnXxgk2tHUyFCG7Rq6g=
X-Received: by 10.223.130.21 with SMTP id 21mr2679448wrb.196.1504629705840;
	Tue, 05 Sep 2017 09:41:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 09:41:25 -0700 (PDT)
In-Reply-To: <efef0f71-7ae0-ff62-3b3c-8dabf3007d75@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-15-git-send-email-peter.maydell@linaro.org>
	<f7e28796-d080-f7bb-b283-6f78f404a36e@linaro.org>
	<CAFEAcA9eV2Fq3iAd=rc52UkzCfp7BamJut0AqAbrwBf4-0qOQA@mail.gmail.com>
	<efef0f71-7ae0-ff62-3b3c-8dabf3007d75@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 17:41:25 +0100
Message-ID: <CAFEAcA9R=V+cOwQtQupRr5y77uGsfns4DeTQy5rhcfc=J3g4xg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-devel] [PATCH 14/20] target/arm: Make MPU_RNR register
 banked for v8M
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N/kNOL0D1D3Z

On 29 August 2017 at 17:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/29/2017 09:06 AM, Peter Maydell wrote:
>> On 29 August 2017 at 17:05, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>>>> +        env->pmsav7.rnr[M_REG_NS] = 0;
>>>> +        env->pmsav7.rnr[M_REG_S] = 0;
>>>>          memset(env->pmsav8.mair0, 0, sizeof(env->pmsav8.mair0));
>>>>          memset(env->pmsav8.mair1, 0, sizeof(env->pmsav8.mair1));
>>>
>>> Why some memset and some by-element?
>>
>> Roughly, memset where I would otherwise have to write a
>> for loop (ie where there's more than 2 elements).
>
> There's only 2 elements of mair0 and mair1...

So there are. Let's go with assignments for mair0/mair1 then.

thanks
-- PMM
