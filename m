Received: by 10.223.197.9 with SMTP id q9csp744774wrf;
        Thu, 5 Oct 2017 09:47:42 -0700 (PDT)
X-Received: by 10.55.144.69 with SMTP id s66mr31693098qkd.111.1507222062177;
        Thu, 05 Oct 2017 09:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507222062; cv=none;
        d=google.com; s=arc-20160816;
        b=EAhFt6ktWxtDWIHn3iiNQwgu5fRkBxsAVNGs1nrpxE4b90ZXdSnT50FEHR1NvR1cG2
         dTHjUhF7hJtxd50IyK6QhLctzb0gQ8Nf0i9cDD7OIhW1w22IQyKWLROpbX7XPAmTLvMf
         y+e8KNVEEk4+Dh/YKQ2hEgEb4aoHvqtPNLMaBz7N5B1PR5rpl4c77QhGoW759Qz1c7zl
         Tm0rGAvYJDMAsRb3qMYUnVp6nPFYbcJnP8CTQ6g/es/wUJTxjog9e+p3Y8woAzF3wJi9
         rkFGXO3qrjmdz0LVNglSCTfNAlmxaGZbRLc5k2RGmLoilrUfA1ZRxvjm0Fq/95T9q5Ml
         eSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=d+Mrh6lDG0sMM0BrAULdE+H0Yn2hapTvR3zDqOXsNB0=;
        b=jssOkGCuyxwONW6yvxxtOLAg/EwQU3+Qi9bhH6K47Lz7oPR5vTtYVksyh0FUyN3Jz5
         oNSpiVMGknQeOuKau2bgTeyJElviU8WQar8xcoV4ZtBdvb7QRIrAy18fTr+sGHmIsE5w
         pr2t6VyMg5lwejVTHfV0poA/KBswWgylE7q94yekWl4u4jGOQgn2rNYnaFW5eMtxTMW8
         rKMd6/LCYsrstVD7GDf4IHdsQhRp90xGQnu2wvpZs67QAFUPXwJe2GLB1Q44Zulh4jsH
         jhniYSkCd+sKgMA7wQuaC99qtp5aNVgHMTqrKz+WNekdS5ARmswzVMN7DRv7obDHCnhm
         Bo7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G34mMNU0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l68si4459603qkc.382.2017.10.05.09.47.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 09:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G34mMNU0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e09JF-0005C0-LF
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 12:47:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e090T-0005lB-G1
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 12:28:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1e090S-0006JV-Lo
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 12:28:17 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:48426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1e090S-0006J8-GZ
	for qemu-devel@nongnu.org; Thu, 05 Oct 2017 12:28:16 -0400
Received: by mail-qt0-x231.google.com with SMTP id d13so25757735qta.5
	for <qemu-devel@nongnu.org>; Thu, 05 Oct 2017 09:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=d+Mrh6lDG0sMM0BrAULdE+H0Yn2hapTvR3zDqOXsNB0=;
	b=G34mMNU0MIkUT0kpmlEmI2HqTiwT+rlWCbqvZ/cTAH/7eC0FdJ6uftP+ajD40AJtK4
	LpFBEvhs8q7szRZsLzi8F+3wfga9XWNzagCrqfTbensjth5Av4k0xKcF1lr812gPeUjI
	0dEi98z9tgrmzQ4waEJTFoQFtzwZ6PxGlbAuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=d+Mrh6lDG0sMM0BrAULdE+H0Yn2hapTvR3zDqOXsNB0=;
	b=qQ1ZIFrT0Lpu1QkO8kyUJ+Qw7K+xWGLLxzEYFnc65pAJdmVUwQojN2p/SayW1W+Cgt
	2Nk2QBUZAwooKwKaPJJu9tByk4BPmElaXi3HNEpdDkewqaozsIo0pTW6v95qzIyunMQq
	8UiEho+f71i8wLYIYRUSsN6aBicWCfWW6LRkoiFqsVByb0oa0q46B3WtY7whtzoTYhRU
	TnG84jeiPr32RKbpRR9rbRbdrJRNYWnJAz0nZjj+WvyGGircmEtfPhedeazj1NywbH52
	9cvm47qhPIkf0l6pANM8vIr0ee8i++oyyvv3JHFTTj31a5DV1TIWEDaBQlCRYcLVIUoB
	LAHA==
X-Gm-Message-State: AHPjjUi4NYSWh263cgzS4efePN4e1Q4fE7hha+Hs80EwG/k0V3PJT4zN
	o3W8OgiVclSx1nYUTkpUrvS77w==
X-Google-Smtp-Source: AOwi7QCYSu4jnBZVPob8Gib4RoSi4znXaHdGA3SzqxXpWYyXSRXER58oQyM0tdYxZza0TGZQYOmGUg==
X-Received: by 10.129.173.99 with SMTP id l35mr20648198ywk.322.1507220895880; 
	Thu, 05 Oct 2017 09:28:15 -0700 (PDT)
Received: from bigtime.twiddle.net ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	s38sm4341633ywa.92.2017.10.05.09.28.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:28:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <021427db-f8cb-9416-31bb-85f0bbb80e2d@linaro.org>
Date: Thu, 5 Oct 2017 12:28:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-devel] [PATCH 07/20] target/arm: Warn about restoring to
 unaligned stack
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: meaMjxWfuzpc

On 09/22/2017 10:59 AM, Peter Maydell wrote:
> Attempting to do an exception return with an exception frame that
> is not 8-aligned is UNPREDICTABLE in v8M; warn about this.
> (It is not UNPREDICTABLE in v7M, and our implementation can
> handle the merely-4-aligned case fine, so we don't need to
> do anything except warn.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

