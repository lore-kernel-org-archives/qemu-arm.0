Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1631134wru;
        Mon, 16 Jul 2018 08:29:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdd/38vx3eEkHZIACQeMi/2TD2lZDXx2nXFa5+hs47Uc5fupplP40cJay6heyrFIsxkF+r0
X-Received: by 2002:ac8:1a46:: with SMTP id q6-v6mr15758227qtk.5.1531754980285;
        Mon, 16 Jul 2018 08:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531754980; cv=none;
        d=google.com; s=arc-20160816;
        b=gPyGJC7sK8Rw5CLyuMed/rnjrat+1K/LayGfxbS1ByTYw5FLI0C+onhRhx7eeQ3cLn
         EcJhf3yOEb7feXnX35FpRirY3GBTBHB+7f9WJeXMBRuQ+TwLmY5SdGUmWoBvgL1ty7YF
         yVlXh7NbRlnL7dbNSTl1G0dbwDA32GjeXMYSghQkQZeH81CYrEwKsH4X6MxelWo69LLl
         /JyZH99GDXeMo7Pt4DKS6ERZh+2yk856kbpsFNfFqV/Frb5kf4dRBeTREqaqTdWZ1ER4
         nscKMMPjY8G/pm5BQedsKzjN/2tFlqeH/AGB0ib8i+0Lhq5WFm6OTgWv6WkdfyoUzjXI
         J0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=pGQt10xcQOVvvzX+DVP2zw0P6HkMdnH0WcNnqER28Y4=;
        b=dT/WBqd9KJIAoXh5Mls4YUe0S+PLJ3tPAkM2jpBZ5ZpfNC/df2tJsbhuaSvUbn8oT7
         ofggG4UgFklAP2U+DLqoqpW3q3uBH3t49IBTjI5DNW9yZ9NQXQriz0bYjH1h3HyY5ofb
         VPkfb3WdvFYHF0l1fbD5dzsUA7W5R6WPT+lMWuGQxiXOOuhtU1Z7UgtfQ+ro5jig6FMV
         wrEwkshfDemWpkLEcq2+1WoaoCiBlQGd6vQtJaeChPlp0k31eR2R+wZn5wjgcGOqkAqH
         MpUBeonYRP3+JxcaWMhYS2a0CuhgZu3O3q/FGbwmIC94r/olbPrAHa5bor59zkPSzOLP
         teIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fOQGYrT1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1-v6si4645727qvg.201.2018.07.16.08.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 08:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fOQGYrT1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff5RT-0002Dh-OP
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 11:29:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ff5RI-0002Cq-8r
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 11:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ff5RF-0006rW-6J
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 11:29:28 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:42635)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ff5RE-0006rM-Sy
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 11:29:25 -0400
Received: by mail-pl0-x243.google.com with SMTP id f4-v6so11213269plb.9
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pGQt10xcQOVvvzX+DVP2zw0P6HkMdnH0WcNnqER28Y4=;
	b=fOQGYrT191johBBWYWEHRTlgtVnncswnEhMtMWeyS7PHjCIopQ2PgswnUfaxCLiVEa
	I74V9Yl/wy3NihDfsY/lZkPOmBeC95DD1SATisPoVOeX8Ftx7p0gG6SK/CXtO7idKbBC
	3SxNjPO8p4vSgHga2XNEN505t6hj6vQiuf5+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pGQt10xcQOVvvzX+DVP2zw0P6HkMdnH0WcNnqER28Y4=;
	b=KAoXcZFT+Zw+kn3EkB8eA/xE7r8ztlbxdSbc+QkkTCH73hLuda3ac7NnCsiLujWOAw
	NuoPfFbrDm37X1mOwRqLQhmZbn5LraLvHzskzR0us6VmlqDu2rEFXyChPKn5CqwBOenw
	nTpsNWLN8xhaJBx/jqjNG41V5sbm5nzqIx4nBp5ZsxqU0+woThv9dO5HBrXHMNlZH8df
	ov6+sMH4dzPSU7ibwrvyAtl9v0PQsLnbRh8h04yqKbCJJ1IA+lOqmzgthqIf+8YZVIKo
	eW/iRkwsZs7AQnZtHF50b+nfqnTEZ2FldFeitzbDyigFuJ0hWCjS0UJ3h4ZaOctqxjaD
	s0YA==
X-Gm-Message-State: AOUpUlEiOkCa4+SXcQ5gJyLoFGDnP3xH26Dx3/TALjVmsxljMdfcn6TV
	KJunYsOjLtY+P+tdZb4Hs6Bbdw==
X-Received: by 2002:a17:902:22:: with SMTP id
	31-v6mr17249439pla.332.1531754964015; 
	Mon, 16 Jul 2018 08:29:24 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	k10-v6sm73284756pfj.29.2018.07.16.08.29.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 08:29:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180713141636.18665-1-peter.maydell@linaro.org>
	<20180713141636.18665-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e5e32655-f383-2f0a-6cb1-7a7228c7e697@linaro.org>
Date: Mon, 16 Jul 2018 08:29:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180713141636.18665-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.0 2/2] accel/tcg: Assert
 that tlb fill gave us a valid TLB entry
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: koTnqLRzeQGu

On 07/13/2018 07:16 AM, Peter Maydell wrote:
> In commit 4b1a3e1e34ad97 we added a check for whether the TLB entry
> we had following a tlb_fill had the INVALID bit set.  This could
> happen in some circumstances because a stale or wrong TLB entry was
> pulled out of the victim cache.  However, after commit
> 68fea038553039e (which prevents stale entries being in the victim
> cache) and the previous commit (which ensures we don't incorrectly
> hit in the victim cache)) this should never be possible.
> 
> Drop the check on TLB_INVALID_MASK from the "is this a TLB_RECHECK?"
> condition, and instead assert that the tlb fill procedure has given
> us a valid TLB entry (or longjumped out with a guest exception).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/cputlb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

