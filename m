Received: by 10.28.71.27 with SMTP id u27csp1056999wma;
        Fri, 23 Feb 2018 13:07:11 -0800 (PST)
X-Google-Smtp-Source: AG47ELsBomY0R7tIF883ZQ5/JZTg/PTbOD4hp3W0LTUkLkpMefGeSNSu1ZrRX82XOL+hfqD2Fpjq
X-Received: by 10.129.89.68 with SMTP id n65mr2081073ywb.424.1519420031665;
        Fri, 23 Feb 2018 13:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519420031; cv=none;
        d=google.com; s=arc-20160816;
        b=FrBO7mOHDtJuroZDX5OGYrFE8jzknb7FJH/LD7N623clUn6tNC/IuOzTTYY+j9bO05
         SxFyiMtBrAGMCttLf8ZIqQBhOIc0/Og6toDA6SFiJRou7ItsWnnfeRNiXS0npp7FgsoY
         B7WZnJKp9JGjKGVPiJW7gc6/1u7/BZ47YB0MFqQHwrNexGR69yKyUI6wTnu5i99SJGca
         Fa/SsvH0at1gB9MeO9q//vJU6oLHpK5dSPM0yGD3qfVJUnk1QvAtbxmtIGR+nWalwrV6
         lBlBv/6agPGkH+IwbLL5PhAnWxgyQKKELEnOd/DayQDi+U9rK08MCG2zCUYA0rAgLIPS
         +Nrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=oF0WXuq6ZdyQ3L0ZNfw9Ua5fFWmwwbziftmrOumTlfc=;
        b=VdlfpPV0PQD4VZTJ7zN4dxYSx5WL4UgfcFvCcvmQt5zQsn0MFKLgyji42lAS+kkNga
         QTYMiBapFgdwIhh+E1zaVvzbs2ZI9rx/UPlvQUD1mXltLufrGeKiafP2xHHSJ1U1HDXU
         S1KvsNfcAhrJV82i0q32XAAU+yz7u3yFFGZ87mtYrKW18kkpdlRDm3V7UOkstCnAHh+b
         O/CGv6jpZhQOgFXBdWFXjKGpfDNTBjfAfmPVMJLS5fpZBnoa/VDaNPsBBwX6KAvPjRSM
         +yFjvfPzsdD9JJM6FDhXGN3ntjZxh9uo/o4Cn3RtT51VhH1whn1vGZmvrTamCwo5lCFZ
         P1Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DRhXEJVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10-v6si553298ybc.216.2018.02.23.13.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 13:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DRhXEJVA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47162 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epKYf-0004pV-9r
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 16:07:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epKYS-0004ks-7F
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 16:07:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epKYP-0005nh-6P
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 16:06:56 -0500
Received: from mail-pf0-x235.google.com ([2607:f8b0:400e:c00::235]:47013)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epKYP-0005n8-09
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 16:06:53 -0500
Received: by mail-pf0-x235.google.com with SMTP id z24so4001468pfh.13
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 13:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oF0WXuq6ZdyQ3L0ZNfw9Ua5fFWmwwbziftmrOumTlfc=;
	b=DRhXEJVAEiFv+YrR8+tTA2vOqwoKx7PTxxaIf5/uGnPWWgSti45q1U9XQuWkrsWZJM
	x8nR4yrvNkDUL3s2fC7FwehMDhdLJy+7MkwiccXp3I4POb4E7q4/eOGzHdYnPf20mr0e
	ckTGy75qtOeJnti1Zcuc0rQXOdgR3Lf8MBdjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oF0WXuq6ZdyQ3L0ZNfw9Ua5fFWmwwbziftmrOumTlfc=;
	b=rtAK68YfoNSpsKIyLcx9wYeMkunO0kW9xH8YDxCiHBzkfSXJp+iPr5DGcH1P2SmBMg
	g2WPXoMePeHifmXkdqSZeeH4F9pujLYDpPUNFHeOReDL482yXxoXHw2WHh6rzagExt/7
	xkd2aJ3hMFmjYbRMhpXOqxMQN2hmpcWzInyqNlwPnmTp+wVTFU7VDgXkxgNeuq9JrCSG
	T9Kt1zgk7ZCrEiJmZfIOZyViG+t++xwjTo56NtGYYgoB15z7j10VZXshDWhC5NmoN+Ls
	rrBzoiRWZpwAmUgeDAsZ7GpQcIeclO6F0HXJOI4VSbqIpBBDpzuCpz5HLHQuhN6ZhzK7
	mUtA==
X-Gm-Message-State: APf1xPCrzgpJBpAxwYLgW6PvIbIT4KI7XIBHHINdNKjfwj0YoNSJ6F76
	p/DpmMKe5RKlUsnpUJYpR+JBl0TfbGo=
X-Received: by 10.101.69.13 with SMTP id n13mr2441245pgq.62.1519420011710;
	Fri, 23 Feb 2018 13:06:51 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	i11sm5182120pgq.34.2018.02.23.13.06.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 13:06:50 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-41-richard.henderson@linaro.org>
	<CAFEAcA8vFOjA8OST2237SybD-187Bhke3DmBPLUy7ZLCcXSEhw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f314cd23-8dd6-94fb-7eef-4f41a4809506@linaro.org>
Date: Fri, 23 Feb 2018 13:06:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8vFOjA8OST2237SybD-187Bhke3DmBPLUy7ZLCcXSEhw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 40/67] target/arm: Implement
 SVE Integer Compare - Scalars Group
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
X-TUID: VKlf1HN0Mn0i

On 02/23/2018 09:00 AM, Peter Maydell wrote:
>> +
>> +uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
> 
> This could really use a comment about what part of the overall
> instruction it's doing.

Ok.

>> +
>> +    /* For the helper, compress the different conditions into a computation
>> +     * of how many iterations for which the condition is true.
>> +     *
>> +     * This is slightly complicated by 0 <= UINT64_MAX, which is nominally
>> +     * 2**64 iterations, overflowing to 0.  Of course, predicate registers
>> +     * aren't that large, so any value >= predicate size is sufficient.
>> +     */
...

> I got confused by this -- it is too far different from what the
> pseudocode is doing. Could we have more explanatory comments, please?

Ok.  I guess the comment above wasn't as helpful as I imagined.  I'll come up
with something for the next round.


r~
