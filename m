Received: by 10.223.197.9 with SMTP id q9csp9085612wrf;
        Sat, 21 Oct 2017 11:56:21 -0700 (PDT)
X-Received: by 10.55.159.88 with SMTP id i85mr12474274qke.350.1508612181465;
        Sat, 21 Oct 2017 11:56:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508612181; cv=none;
        d=google.com; s=arc-20160816;
        b=p7p/kaSPpBOeSTIDdQvz1HklhsqEku8vr+LjPGdEJVUVbP2eEO1wD6fKNbod793R3N
         mrNUpsewTshBwJR/8uV0B5BEl/+6ohAVv+BjyQd/O6OnsNgijC5ng7wcIEmGk0zEMAmc
         Xk/qvRutTC3R7IVV70H+L+5WQgKgEWP+gD7EoRzQfQW+OgfBXIk7nD9dumjMOzQL1QZ4
         aPE83Z3AT9TnN8/Ee0Oqx2IYhWgc7VJBYFS2IXBDmDEbLLm2OpIeePwLzeKJCtMjg2tK
         TUJRmiL3kxITEQ2z0HvY+SryD2gwtmgCnfa59+8DZaCyDOUk2tFG3emGX6IjdT5NzwQt
         1j9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=2zhGCx73sXnetEwTir2KhEXnxy/yPgTOAqgSw2Y1FD0=;
        b=cqJfzyi7jKVoNwNjLYKEP7J+5gTL/8+3E4k1bV6ny4ssumWd02iQeUgiBX8aHNkzIQ
         S8GOzDCOmJbMgdBMMiaf51QLojzUBJF2r918cYJYKFLTE2v5/dxEhw6Ma5rcfZEqdgKm
         t6RZsIIm5/pv2giIuIs7X0wenq8kxhCNE2QDfBreZJmB1TMT5V479r6XR107o6MwYtle
         ojYxRk9bBw1t+JUTbtWy3IRQYQbOuQMyKYW1f8o1N3A70ETv0nbHwKHQpjXCiQSkdaG+
         RfFr3Pbbbuopo0kCnbwH4v9Go/0+MK0fARoGazev+Q72YmO8oFQTHj0G2ezFJTsCx6bF
         lAoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMm5Ws9c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o63si1120855qkf.399.2017.10.21.11.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Oct 2017 11:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JMm5Ws9c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5ywV-0008QT-At
	for alex.bennee@linaro.org; Sat, 21 Oct 2017 14:56:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e5ywM-0008QJ-CE
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 14:56:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e5ywI-0001WR-GE
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 14:56:10 -0400
Received: from mail-pg0-x22f.google.com ([2607:f8b0:400e:c05::22f]:45703)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e5ywI-0001Uy-9c
	for qemu-arm@nongnu.org; Sat, 21 Oct 2017 14:56:06 -0400
Received: by mail-pg0-x22f.google.com with SMTP id b192so8935920pga.2
	for <qemu-arm@nongnu.org>; Sat, 21 Oct 2017 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2zhGCx73sXnetEwTir2KhEXnxy/yPgTOAqgSw2Y1FD0=;
	b=JMm5Ws9cqz0D1Ns3ipjKUeqZ8rARI9Lp6L129ltD9KsTI5t2KtvPtf67B4fr52ulNu
	s7eZAFD152wg74Nlzir8sKWr0PjYe+Bah7AFQAzFknKADV0RmvtZjpUMKWQvlMwb6jlS
	nSXHoOrEdSiWXOIXsUdx/pJ1/vWerxK7/xFBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2zhGCx73sXnetEwTir2KhEXnxy/yPgTOAqgSw2Y1FD0=;
	b=F5FjoSTmgRGYBIjdPmhsCxhndYgNTLdkKeQNwFX+EJCrwWzDewJchSR56KGcqo3uAH
	ScwRhpdMliQkZ7DJA1lxetPjAP5Igg9i9wiXQjYwRhKyhuDOipTZkKHq/XPIRvE8Ww5s
	7R507phZmA56IqRYsydOyUV9WSYW7n6Qa65er1WEIAyi6YlNh85ZAzwJTCoRwsHwbVHJ
	+x0yJxF97dt2eO4HXUdJxwvAz13OARK8if7Vz01glNvGd2kSCDvYEBvBq/3vFMuviM5f
	R3N8ji0nr3RsI5FhhZUAeeEtSot2pNGjIXaAUVwRRT9+Xunz/xlsJG7auXTjCJ58dFhE
	cqjA==
X-Gm-Message-State: AMCzsaVu66FZYLmC8dkKqTLLENc1El/t9d7VJaxSYmgpS57KObWw6RO8
	zqNrHOejmzOdxH6aHm8KLEhKqQ==
X-Google-Smtp-Source: ABhQp+TquJrMDKGd6FSZ1zTzuroGehPTYMkIb0WtxxHe87MqVo269dwGTW2KSyndaFd750NDndJoGQ==
X-Received: by 10.159.242.137 with SMTP id u9mr6831737plr.243.1508612164718;
	Sat, 21 Oct 2017 11:56:04 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-158.tukw.qwest.net.
	[174.21.9.158])
	by smtp.gmail.com with ESMTPSA id 24sm7062702pfk.9.2017.10.21.11.56.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Oct 2017 11:56:03 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>
References: <1508522170-22539-1-git-send-email-peter.maydell@linaro.org>
	<19d12a08-9ecd-8c91-4652-28773ca35d8e@twiddle.net>
	<CAFEAcA_HWF_TD190CSVNbgeu-NGrzWsJmFN_u97CRNA8y-yW0w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b96c8607-8c7e-a403-d4e7-9e864dd4c6b7@linaro.org>
Date: Sat, 21 Oct 2017 11:56:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_HWF_TD190CSVNbgeu-NGrzWsJmFN_u97CRNA8y-yW0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22f
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] translate.c: Fix usermode
 big-endian AArch32 LDREXD and STREXD
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U81Z1uSGLyWY

On 10/21/2017 03:17 AM, Peter Maydell wrote:
>>> -        gen_aa32_frob64(s, o64);
>>> +        if (s->be_data) {
>>> +            tcg_gen_rotri_i64(o64, o64, 32);
>>> +        }
>>>          tcg_gen_setcond_i64(TCG_COND_NE, o64, o64, cpu_exclusive_val);
>>
>> We're not splitting o64 to parts.  Are you sure it shouldn't stay as frob?
> 
> This is confusing, but I don't think frob is right. We want to
> be matching either (a) the transformation we just did to produce
> the 64 bit data we're storing, or (b) the transformation we
> do on the ldrexd, don't we? Neither of those is frob.
> 
> I think I need to think through a bit more carefully about
> what's actually going on here, since we seem to have the
> value in two places (actual memory, and the cpu_exclusive_val
> TCGv.)

We should match what we do in ldrexd, I think.  Which is just a straight BE
load.  So I guess the frob64 should be dropped and nothing should replace it.


r~

