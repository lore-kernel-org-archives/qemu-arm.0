Received: by 10.28.71.27 with SMTP id u27csp2331879wma;
        Thu, 22 Feb 2018 11:27:24 -0800 (PST)
X-Google-Smtp-Source: AH8x226rkypO7D/sffSdM8y65hIrgKU8w62wo9ygF1GvFnijXjII95bgDIjVNWvUWh/67OOu+1DI
X-Received: by 10.13.255.66 with SMTP id p63mr5816043ywf.482.1519327644241;
        Thu, 22 Feb 2018 11:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519327644; cv=none;
        d=google.com; s=arc-20160816;
        b=c0oBbbyeKlG2TO3SGEApM79aybec3027P+XMz661FwhT56+dpw4TaOsF4ebwUP01Qi
         CZP60jVZcAZyTe8/Zzg37TMHX9/6wn6rMXza0REMRcn8LiesKxZfgdjixJRkRFb0oEnX
         +e2kHp70LpGPJPTK0HZqwktoyT4LN3O+NsnpyFaJemF8VyzSqpBktQ43Rdapp4VREG+m
         eZmSdwc3B2sbz4OcwoMFL6zl/qLrRYGC5+Uwt2kjCv6Ul+2H7EZc6gAXDENwmS22DOWK
         Yigo0fe7XehuLCLmpr5Vi+ExT6NiVAHQoTF8px+0mOV0Qlw4HOQAY/4Rh4WE544E2ONu
         IudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=MdowjSqhH7kznaZKr/U2WbthbJZDivKGDdws//yHYUM=;
        b=ZZK+S/U7kCVpwEOWHxRQtEBj6VIhm4q0GL7IH8BnjoioenOu04X1mZEJkdvqUCUh9p
         gsFNCzJkrFn23s1lQGr+zDpkTnoLxEuLqOCBz47IT/bg/Ht6F8Anvbm3gOrpJ1HbrFvx
         1Kkw1zWN5uJJBwvOgH/xKv7Y5PAMEmOOEJfBJAeWV4LAKFptWVmdqABwpdWeQzzlyh5g
         abnZivYZ8gf0dNdNzImBZTZafcV+wEzYVu2f47czhm9t8qs3pfhl4LEQZFYk7v+47mO4
         zGiqkPizgNxSwKpsxpKsU0vnnklyd29spSpYgkbG7KfZEiCRt6EWd/SyHzm4esvfhPpG
         /pSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S/zlQkpm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q74-v6si119530ybq.239.2018.02.22.11.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 11:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S/zlQkpm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40606 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eowWZ-0004Vq-Ox
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 14:27:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eowWT-0004VS-EA
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:27:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eowWP-0007a3-Fq
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:27:17 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:41221)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eowWP-0007Yu-AI
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:27:13 -0500
Received: by mail-pg0-x242.google.com with SMTP id q27so785978pgn.8
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 11:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MdowjSqhH7kznaZKr/U2WbthbJZDivKGDdws//yHYUM=;
	b=S/zlQkpmP3J8BOJtLZy3MCKSplG7hpaX8LwPAQL7iPP4yLbWYIzyBKbeW3oRAqAVfD
	JcMjINr2bWZKq+BstPLs46CMTe5sne8ozoqrMKeN2J3+ajMMT2qvWNQT5vEbVrLPsOUx
	BQrnFStSZng9P2+fT/H2FXc3cdNfVg9dCyxi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MdowjSqhH7kznaZKr/U2WbthbJZDivKGDdws//yHYUM=;
	b=iN917CmzmqgWQ91PG02ADLWeVtm7FBbc0gk2hzoG4/znmAG/xg+gjXdYj6vggsEZj1
	4vVEvfXUiHRIK+pd3gn+bMoJgTnLk/h0+/j3UV6iTjt8dgAfuwebbzMjZVDQB2/6iyot
	K1FCVrZiuJ2c1/PVSUydIhKPEN9SaBpl7w8vDsO4BEmuAPiShrdPd+clPkfzVuJ5fz8v
	wEIxnDWK2HEa+WoaDLYaNbSbxK5KB5a4dxzy+YH8g6C7Pdqp8xO3m9+LSwPzxudfGF7l
	NU1T5BsXx7N8sXkE0ISzpwQSuvflphLeiYgqUOZjCiF1zq+C/wOHgagtm6anPgmGM+56
	Tw+g==
X-Gm-Message-State: APf1xPASJHRUQUDSbs5rnCfAwrzgdYchWRDFhVE60G+BlNbsa82Qaf1T
	TEGo+a+ebXMYr1krzwN4wC9ghcJDZHM=
X-Received: by 10.99.126.84 with SMTP id o20mr6424236pgn.188.1519327631732;
	Thu, 22 Feb 2018 11:27:11 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id z4sm1275169pgb.4.2018.02.22.11.27.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 11:27:10 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-2-richard.henderson@linaro.org>
	<CAFEAcA-00jCXJzwSgGmC0gg=vWpmVFs0qUbrzEQ_THSzw74O9g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5915514-fcb9-3545-f79a-b83303a31ae2@linaro.org>
Date: Thu, 22 Feb 2018 11:27:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-00jCXJzwSgGmC0gg=vWpmVFs0qUbrzEQ_THSzw74O9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-arm] [PATCH v2 01/67] target/arm: Enable SVE for
 aarch64-linux-user
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mm6bczSh2L86

On 02/22/2018 09:28 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> Enable ARM_FEATURE_SVE for the generic "any" cpu.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/cpu.c   | 7 +++++++
>>  target/arm/cpu64.c | 1 +
>>  2 files changed, 8 insertions(+)
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> though this should probably go at the end of the patchseries rather
> than the beginning?

Yes, but of course I need it at the beginning for testing.
I'll sort it to the end for the final version.


r~
