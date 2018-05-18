Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp507012wme;
        Fri, 18 May 2018 08:58:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpcFF0IXZGU/RalrNLW3F6U81UpaErMEusly8A3hzHT1EIJJrPQ05pBTsAmePB+YKfOwVpB
X-Received: by 2002:ac8:73cc:: with SMTP id v12-v6mr9949981qtp.208.1526659120954;
        Fri, 18 May 2018 08:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526659120; cv=none;
        d=google.com; s=arc-20160816;
        b=p7/4aLXehPN/5buDKiskFMKBH6ZzFiyL83xM/vNgonp/VWt4GPJfIQg5J9aUSCfFsj
         0Om6X4PRUy1/jHbzdIuLiu51mIQVjB7WBO5ByBj3wj6ZauwwEXOaHvE1r8aLQVf2RQaI
         9D+VWk6lB+nW2RLP1hnak5gc/cl7kkZI6qrQR3RZnxpP0g9Cm4223zt+8mPePeOdQXOu
         aTx/vkj2CarSNSGnBMqYffwllCwXoah1HDRC3NqEYGO4+idPRaK5TwNQiHE2Qf3Y/8Ow
         00YVy3qxb2TfQZ2wlnv36wwX7KQ+qPSdvlWVGHuxHBDuHb29z1Y9mZWNvW9Q/ZW8juiO
         qzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=3GdGHB3zqtNCnJ5APdUZVoVeZDu1QqYnX602Ml0xPoM=;
        b=Pog6g91cgHDilPgIf7T8IB8BrbMQCyJL607f6r2D8YuJR4zdwaQ/ufCkkr3umMOFLg
         VpbqljdwMg34y6RPdmqYa9lao6gaUxwfifEkQ/cH4tpZCCEKxhERFLadU+t88AsHLkSv
         ln9rT/eaa/CdUEeL56JicU5urjlvefozU/0z7jL98CJIk/AHG4llQ7bD8J3Tc3/8MuEF
         XquAdn5SBvyt5nCWZPw8S8f3h5/hgPRkv3Qut3BukYR5W+YkRPzIkWovDkBHeaEa7sV3
         L/GhGENWnBIw/LFuU1EKFosVOPmwySmRqqwiRmX4kpcQHNxtQSIg+BBeNQrp1qktDVgR
         HjTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frsuvOVY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h20-v6si7356011qvb.51.2018.05.18.08.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 May 2018 08:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frsuvOVY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJhmC-00015s-HZ
	for alex.bennee@linaro.org; Fri, 18 May 2018 11:58:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJhl8-0000l5-VG
	for qemu-devel@nongnu.org; Fri, 18 May 2018 11:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJhl5-0000I4-TB
	for qemu-devel@nongnu.org; Fri, 18 May 2018 11:57:35 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:43880)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJhl5-0000Hc-Nj
	for qemu-devel@nongnu.org; Fri, 18 May 2018 11:57:31 -0400
Received: by mail-pl0-x242.google.com with SMTP id c41-v6so4815187plj.10
	for <qemu-devel@nongnu.org>; Fri, 18 May 2018 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3GdGHB3zqtNCnJ5APdUZVoVeZDu1QqYnX602Ml0xPoM=;
	b=frsuvOVYIvVuTDumpTSSGHMmuY6Y4iNLKX4OX7hfrVzO5RBRMPlucTh2PdhNjP7LfS
	f544qarOQt+aIa5XCWMpy6xftNgVcd71f4Mv71/axGjm7jEk9yph/5w4xvGrs7S0JFd2
	4SxRb01zxx/YAaJjBtx5XrzoA5xMsduKjmUDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3GdGHB3zqtNCnJ5APdUZVoVeZDu1QqYnX602Ml0xPoM=;
	b=NEHgdKLeWnMBgeloEpwh6xIJ9nGnhf0cX5+rlLDuLRvk1+n6ow02lDuEYvb+BswOeB
	IbYZVl5T33yIm4/ru3mW1zjMY5aXqtDE5u6uX7oWqN05rek5XetEMYjfTjjRC7BhHufL
	0mVgF7EtxbY0GjZnYMzg+PWisLP+tL+w6wlWd0UdxmqaKejx1KDrqG30N+BNSHiKxkVV
	X5HFAh/V25zkOc71S58CIimzCXmLxjf2P4hP2Q20+lHsjLz1sJYeIwoDGPHB+pS4haDx
	+zcI+R0yzvZbY6WXyP2XaUXW6Yewpkq6P+PC+EwrcmZl0dF0AAkvM6yvaRQcWX3xSk7S
	pFJg==
X-Gm-Message-State: ALKqPwdDx5gdQ+h/I7NQUQroMVMpctOJVsaHVcClhf/xY9Hx0+R38zxt
	yIhsWkJgyOXFPxAmNHyOkSJg7Kx4rm8=
X-Received: by 2002:a17:902:164:: with SMTP id
	91-v6mr10203680plb.134.1526659050198; 
	Fri, 18 May 2018 08:57:30 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	v23-v6sm12627399pfe.166.2018.05.18.08.57.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 May 2018 08:57:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
	<CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
	<99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
	<CAFEAcA81y1r5N2zi5fPoV5iZ9dd0YBeThcX=qXdJXdNSNO8nsA@mail.gmail.com>
	<291b8b6f-1692-a5ee-f44c-4f8c4dd614fa@twiddle.net>
	<CAFEAcA_REPB2kdppWCo+YbBekLp+FfPVr_rvWVQU2F=H1EsOCA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3e9041c0-b482-84e2-5a4d-b86e12b04a44@linaro.org>
Date: Fri, 18 May 2018 08:57:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_REPB2kdppWCo+YbBekLp+FfPVr_rvWVQU2F=H1EsOCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-devel] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 82kbR/ocyeku

On 05/18/2018 03:34 AM, Peter Maydell wrote:
> On 15 May 2018 at 15:46, Richard Henderson <rth@twiddle.net> wrote:
>> On 05/15/2018 06:25 AM, Peter Maydell wrote:
>>> That said, I think we're planning to deprecate vixl now we have the
>>> capstone support. Richard, what's the status here? Could we just remove
>>> the vixl code now?
>>
>> We could just remove vixl, yes.  I'd like to see updates to capstone to support
>> instructions post v8.0, but it's not like we have those with vixl either...
> 
> Just to check my understanding: with QEMU at the moment, you
> always get the capstone disassembler unless you specifically
> turn it off by passing --disable-capstone to configure, right
> (since we provide it as a submodule)?

Correct.

> We put that in in September last year, and we haven't had a
> pile of complaints about the disassembly (or indeed any
> complaints that I can recall), so I think we can consider it
> a success, and remove both vixl and the ancient binutils arm
> disassembler.

Yep.

> It would also be interesting to try interacting with capstone
> upstream about adding support for newer instructions (for
> instance they don't do the v8M insns). Do you know if capstone
> deals with new insns via resync from LLVM or if they've
> entirely forked and just make changes locally by hand?

They seem to have entirely forked, but I'm not completely sure.


r~
