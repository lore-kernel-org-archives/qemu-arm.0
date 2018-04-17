Received: by 10.28.4.212 with SMTP id 203csp4692wme;
        Tue, 17 Apr 2018 14:58:25 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49SY2jMSe81dD8d8JgawepsBQce5TKBSSG0V7dHPlmamzV2zMvP1MgRBfhgqf1/P5wfakrw
X-Received: by 10.200.36.92 with SMTP id d28mr100502qtd.86.1524002305099;
        Tue, 17 Apr 2018 14:58:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524002305; cv=none;
        d=google.com; s=arc-20160816;
        b=RRmuiAATC1tuoFFuIDGZUf9AT8tzqL7TGuHSLlHXb2EDbc7s90z7VofKjmhk/9M911
         tPPIzwrrlJfPKyHz6bfgJsPxYQ+ksKVwv90l6EUtJnixQLQC9SqmyguszMLBz+uWw71u
         GG2Z+Zd3P7o1SelCWwejkUOdufSXFhDf291U9gZqCzBkLWIju/Jx4KMi7eKbyEn04rHP
         OFiJI68TRkw/ueSXWX8cncgC13Xppa41gU8QBVgEQJqHcBA0kL1j0p+tbRksQILgsAIh
         K84ofw1d/odBDE4/myptqs7KIPXPmFB2jx7WnUExn134QXWsqep0LPxrEtAPqWAqHlhL
         Zm+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=J91gH5aQw4+Eld3wssk1MTw6IZU1AloMaDa7sGEwIUI=;
        b=079Tht7F+yks+4dgYytFFCrGm/2ZjatimLmbRrCEfeFY3Y4hl7jBUyNidXJWE+xtLJ
         AC6z1OIbfg87jw6SQmjJWnK7EExANHtOVtONyFOqdFcdsLEM5PJBdtqhM5ONxi0wfLQ+
         yw+d4YUSQ/CqB2GI54gZDz8fLwcm0T2/bGSAZWTNxAfsDXcxxePApDy7FaegJrKRYRxz
         ZZTRYVvTEmm11Gs0YQewcMIrD4y46j9v+bhSIPu7A8JexC554WQDlfs0um9+Uv/P86FH
         I8/q+iXGUTZhrpNGup5OcaBH07+sxf4bw48cr0hTHB/54wERnuq0bU66rQ70o7Gg63vG
         Bipg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kM3QmwEY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7si1618912qkb.395.2018.04.17.14.58.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 14:58:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kM3QmwEY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8YcK-00049a-Ll
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 17:58:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f8YcB-00049H-L8
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:58:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1f8Yc8-0007Zj-Fi
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:58:15 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:37798)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1f8Yc8-0007Ut-9e
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:58:12 -0400
Received: by mail-pf0-x242.google.com with SMTP id p6so12794052pfn.4
	for <qemu-arm@nongnu.org>; Tue, 17 Apr 2018 14:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=J91gH5aQw4+Eld3wssk1MTw6IZU1AloMaDa7sGEwIUI=;
	b=kM3QmwEYaSnANLBn1WQHh070fOZM3vjKWvd+kuf6xU8V9PKJW3rTBA/n8jEO/iE43A
	cQxbuoh2obESPWUjvr/TjAgFOcxtbqGAJICAIEmgFpgSTIRhhTTUqTMvqaGfn+rNZKvZ
	KxpYumTW0LDYszrkAEiY7bB0X0V2ZAPCmogHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J91gH5aQw4+Eld3wssk1MTw6IZU1AloMaDa7sGEwIUI=;
	b=kGE8QTMiYE9dJ46tyxk45qCuKD1HT54hUHjqm3VkWhLaMHFfKJ0nMcV2+/T7cVr0M7
	OxnvDEMq1UyLGSLiitPOw3tTl2LBiBGm3v1WRGYzdLGIK3xN0jZdvdtp/NDDHgqQ0Ud8
	bhgvuxzNzXegivPWI/dAg0a1rIqbxd9e1jF3tigbzP0LD1AdRJMpbbY5lLw1JJLJcpM5
	EfLnmrYY88u52lztaQZ66dpWYfUA5tUUfcAmSGrdF7U9e2MWainWh1kqziBAAo1aQubM
	2VoFGbAv3i7/XoqoAXhxPWjgyvatwp8sN+qeDFUDd+9RSn7LQ0zVeWejUZn8LAFja663
	406A==
X-Gm-Message-State: ALQs6tB4WcDF3bH4C9GbxoEWNA5O3pjDrw+SP0rjLWZFLLNcE7C/xCbX
	stZLcdrvkakJGX5X4YTGwyzk5Q==
X-Received: by 10.98.23.134 with SMTP id 128mr3456071pfx.120.1524002290445;
	Tue, 17 Apr 2018 14:58:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (cpe-66-75-76-48.hawaii.res.rr.com.
	[66.75.76.48])
	by smtp.gmail.com with ESMTPSA id p5sm4337630pgv.58.2018.04.17.14.58.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 14:58:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Henry Wertz <hwertz10@gmail.com>
References: <CAOuPqTFJABMcDHmQcNoNZioBBJ8RcreeevsRfh5b46ZgKZLetw@mail.gmail.com>
	<CAFEAcA8cWYPjN8sxCwzCXhNBucXyhCBMFDA-AJ2zUCr-FKLT1A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2a15b7bf-1502-6f95-6b7e-12a2990f5a05@linaro.org>
Date: Tue, 17 Apr 2018 11:58:06 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8cWYPjN8sxCwzCXhNBucXyhCBMFDA-AJ2zUCr-FKLT1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: Re: [Qemu-arm] [Qemu-devel]  ARM memory barrier patch
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vZPKIo60NGx9

On 04/17/2018 11:51 AM, Peter Maydell wrote:
> On 17 April 2018 at 22:32, Henry Wertz <hwertz10@gmail.com> wrote:
>> Please find submitted a patch for ARM memory barriers.  This patch is
>> against qemu-2.12-rc2 but I do believe it should apply for anything from
>> 2.11.x to current. (the code being patched was added in for 2.11 series.)
>>
>>
>> I found with qemu 2.11.x or newer that I would get an illegal instruction
>> error running some Intel binaries on my ARM chromebook.  On investigation,
>> I found it was quitting on memory barriers.
>> qemu instruction:
>> mb $0x31
>> was translating as:
>> 0x604050cc:  5bf07ff5  blpl     #0x600250a8
>>
>> After patch it gives:
>> 0x604050cc:  f57ff05b  dmb      ish
>>
>> In short, I found INSN_DMB_ISH (memory barrier for ARMv7) appeared to be
>> correct based on online docs, but due to some endian-related shenanigans it
>> had to be byte-swapped to suit qemu; it appears INSN_DMB_MCR (memory barrier
>> for ARMv6) also should be byte swapped  (and this patch does so).
>> I have not checked for correctness of aarch64's barrier instruction.
>>
>> Signed-off-by: Henry Wertz <hwertz10@gmail.com>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Richard, did you want to take this via the tcg tree?

Yes, I can do that.


r~

