Received: by 10.223.197.9 with SMTP id q9csp164412wrf;
        Tue, 10 Oct 2017 19:58:58 -0700 (PDT)
X-Received: by 10.200.15.118 with SMTP id l51mr10640992qtk.181.1507690737963;
        Tue, 10 Oct 2017 19:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507690737; cv=none;
        d=google.com; s=arc-20160816;
        b=LLL/HGqK7x0MkURV/H2/OyPCSzCGUsCWhXuTlARrkkhGENSjulRcmGxDIcc1wORnQ9
         jBECl5zugcvvEVw0wDCproYP+YkACx60I9vlo9NMsAvEsRC/2qjxGzXzWfbIQvWZqbTC
         /rBQuAdx92NqILalNn3RYMbq/UciKt8R/EuDzmlAJ1r4P3jzj88dzwoa9EeP1G9ssgPN
         Fx2aaNstgRqQr9gXh/1xd3AOblnFdUNhUcFbRIflmQCqPbfdylPPlQEA1ZkbQRwXNMQG
         gZgpMncr2/WuCtrXU7ESZ0/Ibac4o2uygJAs4orQwVl9wBUIogwieXZvQ58TvV0TOyEy
         4abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=sMMQFKkLHerYymwkVW2zZSPu2fhFFUZQcNvnszW4CIM=;
        b=K9yxE3Mr9dba4HyuDmTUphlqbEAPmQP3EcDbFJzhTtwGdbIFqTccKidECrnDS74MMx
         L7y+pR9ohNowP5c0S7lzZ3EVg4jlT9W6hS+hfn1Jj2WGs2pEY/gbLJ/Hqu/MGuBYeOBY
         6Kqmh6LuZSUSmJJV2o8rvliIQOocQmkry9WXikZRcE9yItF//r+FKT4+5rt9A4ysajnF
         lWwUWsLB8rF6OrwjI9W4P3MMvGU3RwKUIKYz5SV3FM7iv6RwprIB9K/1RZZ9vaBG8y+7
         H1ELh7mM7yKVNYQ9sZreqwbe1GSwYUYkcPHTsKFTVvgPQM20Mly5mQ8yjZU/QFGpbGUD
         WoBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pjyod+MQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si298354qkb.89.2017.10.10.19.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 19:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Pjyod+MQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e27EV-0005HC-Pp
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 22:58:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e27Db-0004yq-Rq
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 22:58:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e27DY-0007un-Mg
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 22:57:59 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:45549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e27DY-0007u9-Fr
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 22:57:56 -0400
Received: by mail-pg0-x232.google.com with SMTP id b192so248294pga.2
	for <qemu-devel@nongnu.org>; Tue, 10 Oct 2017 19:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=sMMQFKkLHerYymwkVW2zZSPu2fhFFUZQcNvnszW4CIM=;
	b=Pjyod+MQQyreOn+ESY1R9amt6+P/mZnZEL439LROnv+P0ycSiALYcM0N4I26ry8kED
	ya1T9IvY+sr0DCfO7gNs8h/PoOiFAKapROpJhhfq/2v4GjAIoAUvBSPF2RV+SsNDqbUF
	iXWPOarGFT0odImOH3HSCRHUpc5upA5w8TmLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sMMQFKkLHerYymwkVW2zZSPu2fhFFUZQcNvnszW4CIM=;
	b=JYVcIqTikZcvcqTzp5jJmxpbEnOBnj8SXt2PusaDKicIvqHec/ruppDg2dLIk4CjuA
	Yec2Ur7UAbeSPowD5k1NSo9T4MgouhSpnHbuKiDgIChmIDIlosiXNjG6OYRhldKS03+t
	J0s7ySyKd3ymPnRkGopuLcEU4oUh1z2YR89eQpg8KeyNSUhd/USOioxSncPe5OlRmeJd
	Q3Q2OjNPf+gKOOlhXVahCi1UFJoEZlTOF/ZCKgLJrxxq9lXQV11fcDTEJ4PFXHMlNxHh
	RsgCPE1MUSFPEyJltyEIUTC/QQfYJckZwFEbQ7XSvb4cYAp3CXiMtpi/0NZgYhRcjsub
	JWdA==
X-Gm-Message-State: AMCzsaUe5KtbO0xR2CDJeCWazG8RhQJwEadqnFATipW1+mzxJs8nTkBv
	nTBN48JoUTHNIzpKUwTFocifZw==
X-Google-Smtp-Source: AOwi7QCZ9UMnDJfVi+uyS/vhW+IOJrVE8/Gn22JZdvcBpPz5Y4oAa7LVau1XhUB+cagHzVI0xvu0Ww==
X-Received: by 10.98.16.211 with SMTP id 80mr7299252pfq.72.1507690675425;
	Tue, 10 Oct 2017 19:57:55 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-104-76.tukw.qwest.net.
	[97.126.104.76]) by smtp.gmail.com with ESMTPSA id
	n19sm21730501pfj.52.2017.10.10.19.57.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 19:57:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1507556919-24992-1-git-send-email-peter.maydell@linaro.org>
	<1507556919-24992-10-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e5be0991-9dbf-4b84-f7ea-ce257197e9f2@linaro.org>
Date: Tue, 10 Oct 2017 19:57:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507556919-24992-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: Re: [Qemu-devel] [PATCH 9/9] target/arm: Implement SG instruction
 corner cases
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cV3Wn70i42SH

On 10/09/2017 06:48 AM, Peter Maydell wrote:
> The common situation of the SG instruction is that it is
> executed from S&NSC memory by a CPU in NS state. That case
> is handled by v7m_handle_execute_nsc(). However the instruction
> also has defined behaviour in a couple of other cases:
>  * SG instruction in NS memory (behaves as a NOP)
>  * SG in S memory but CPU already secure (clears IT bits and
>    does nothing else)
>  * SG instruction in v8M without Security Extension (NOP)
> 
> These can be implemented in translate.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

