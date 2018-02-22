Received: by 10.28.71.27 with SMTP id u27csp2342147wma;
        Thu, 22 Feb 2018 11:37:54 -0800 (PST)
X-Google-Smtp-Source: AG47ELtDoPou42Sq1vJBftdN21WmY/jQfgM9PpG58vooi1FvOx6ZIgxZJiZyAsidWtjewTLNLZq5
X-Received: by 2002:a25:3542:: with SMTP id c63-v6mr476912yba.282.1519328274380;
        Thu, 22 Feb 2018 11:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519328274; cv=none;
        d=google.com; s=arc-20160816;
        b=vYfzhyaPJuUd1XgqITzF2eHo/RDNYiTHum18EsKu5QebdLOuH0HtWg9FYIC5TEUtvB
         kySnXuh2Uf16eCm0YRa/djNqE5DjZZteW68nVXFcXyPpvsp0/P2qa6EQKekb322YdHm0
         sho2WZiE4EmKPXmwg0zfzlbDRVrawa0eTDDlgToD/TRVUGqNhlpMTCEcTjVLPfs1lyMl
         fUhHW/bvCm8PJFNkv1CnaPGbnYNU/y0cj5JHiwJFIPJAmjFqT3f1k9xEWLwgYgd5DaEb
         imGG71cydTcy+km/ftgrA49gFBYfjA8fA0czfND1dS3Q1aqcSpDNebQw5kQlmTgPkZCG
         7SNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=S+/4GU1+MTMFIyPosuPS1qg8MYfMvV3DYGGHpKyupq4=;
        b=mERetMcd8DyQ5KKY0WX7UqAuyKXa+MyLwa62kxSaCJLNzCsawAltyxZqHCBpSMJdOH
         kzDYLKuIt6jCqM6AghdzeWp6rXvLNitAIlqIjGECVHBDnc1V8/8VqYy2B93IwL3PNiiO
         +isbOTkpD178jW1Lx7Z5/dphxoWfxU206p+wB//LbHSnT4X/qnj9n6RcNflaNmAe7veG
         Cm+/4q5zWw2jUUBaBHyWEvAn6QnxxLLKW+P4OnaKSaMqLZ3ORAW85FMnMLOLxFlaqAi5
         lIWR/VtIFT1F9vDAZOcvaD2JowIE0pBk9+RHWAOV1PGdOoRUJYX4yl1JujoDk5tYm/Df
         3/Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kudzAQXW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65-v6si122226yba.532.2018.02.22.11.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 11:37:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kudzAQXW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eowgj-0001Lc-T8
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 14:37:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eowgS-0001LB-IG
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 14:37:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eowgO-0004u1-KG
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 14:37:36 -0500
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:40454)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eowgO-0004te-Do
	for qemu-devel@nongnu.org; Thu, 22 Feb 2018 14:37:32 -0500
Received: by mail-pf0-x22b.google.com with SMTP id m5so2489257pff.7
	for <qemu-devel@nongnu.org>; Thu, 22 Feb 2018 11:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=S+/4GU1+MTMFIyPosuPS1qg8MYfMvV3DYGGHpKyupq4=;
	b=kudzAQXWy1Av08AkxB4X/5r3Qc57eSf8jIWpwnF6SIIXjDRJeKFmxGQIBcifmU9CFi
	3cbCMX2xO04ZYaPt7qlEZYV0PVGkvuL3592gMUmp+sUrDO1jJBoT0C/0HBtq6iqVepvj
	RztxU1UAV+jHC4e7DhjLWayGMgf9r1laLwgHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=S+/4GU1+MTMFIyPosuPS1qg8MYfMvV3DYGGHpKyupq4=;
	b=eS3Kty9kJNwZP0iJP+VQsYxrk+s1DCktblkd4+vdjtBf83fAw5qGIyrSiiR+ZgSoqW
	cVdN7PAcgbzRTqFmZi+tO7WFMOnUWEFu86etQgaLeXKT3IH2T+Y7tKCHdLi+u9hycehz
	Wcf/MswV3lMfJymvnUaeHTmvuYNCRnx3OjPs9fINkyNeP0GBnoXSabevMAj+khp20ut4
	V+pEY/KEMkZz7ypVx4DGERCzpeOnKe6QIEQGFQbiEMHQSqH29koq311zomjMt4xsTrwI
	US6+A+5HMQlPkNc8xaKMM4ZwuUiw1UqA82NAB37VGl9NQFQovAJGIe1w5NiRIB6s3zNb
	/dEA==
X-Gm-Message-State: APf1xPA2sdbETTgp9Rz765PawEnF2ZSAAzLiccqiOf6PRGJZ+WPqYyIR
	tk2PBOxXFLyBpHsb2HOX70p2Yg==
X-Received: by 10.99.183.5 with SMTP id t5mr6649603pgf.416.1519328251001;
	Thu, 22 Feb 2018 11:37:31 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	d77sm1627424pfe.20.2018.02.22.11.37.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 11:37:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-8-richard.henderson@linaro.org>
	<CAFEAcA-PzKt-gZe2FjvqZuJqFmgoziNKaDLyen9o+hToMboQWw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <739b0a8d-eea3-c934-8f38-6fe609056c07@linaro.org>
Date: Thu, 22 Feb 2018 11:37:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-PzKt-gZe2FjvqZuJqFmgoziNKaDLyen9o+hToMboQWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22b
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v2 07/67] target/arm: Implement
 SVE Predicate Logical Operations Group
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
X-TUID: Cf61vtSOfJHI

On 02/22/2018 10:55 AM, Peter Maydell wrote:
>> +# Three prediate operand, with governing predicate, flag setting
> 
> Three what?

Feh, typo for predicate.  But more verbosely,

Three operands that are predicates, plus another predicate operand which
"governs" the operation (I believe that's the language from the ARM), plus an
"s" bit that controls whether the flags are set.


r~
