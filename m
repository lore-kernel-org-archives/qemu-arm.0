Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2954012wru;
        Fri, 20 Jul 2018 09:21:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfYYk3TQ+P/wQwRzg0EndgzifwqZWbMYrfJ3CzDERAQ3WUy1WfpdiwdhIbYp6rkAxtfcEMc
X-Received: by 2002:a0c:a991:: with SMTP id a17-v6mr2370328qvb.83.1532103687175;
        Fri, 20 Jul 2018 09:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532103687; cv=none;
        d=google.com; s=arc-20160816;
        b=r6Txetm7M8ah5nUK9xjhlnYvPQfjErtrtarP4z9/iIClW7eObRilwidA8RzQwPpBan
         19rpf5Xb073pSejyA2sTnp2Vuq7db7GjmMtS4+WXIvQ2ErsSjiMtdjhO3MuDgYpUXqwp
         MUHLYdRZEzKdxiJZT9YpM7DjeV/C5dMvH8QTi1FwqtYt2cyKCmY8acWei7B78Bap+9D2
         s1/sRCHkn1F6217H/WRis1DBJne3387jlSP6nWwa7vyagiAy1hsqYRKJ/l3VRkDS/pBV
         nLGTuXfT3T5FrZuvRs2g9rSrQO9k9xslniduVak2+14LiYyu7NALuqa9etK9KtStNSfc
         S03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=7jtjAvoSsyxXKVswe3ypLQlbEdx+yjW8+PbjU3XMqoo=;
        b=alt0gMYdPQOdx+0CawE8OKGWnkl2M5M0bbv7eWZ4Xi+MpdTypniB+3gmHlAOfQ8HWA
         pvZnZVwDJO9t4GpfmSZO/OZB47ES2lSP+aY2uZMawKaS2dSWNZjoLziLIZxixVeH4+N0
         WPX5/ODQeTpv/KWJF+0LJEeC2jHmN0q+oR58L6jZIe31j6anwOHs6fHURFguns+95nS9
         7KQqPSvRciCS7jvAgLvw2f0s/wC1vMl8IBaEN4loNkwUjArR7Eggz0g+WKTWAZ6+H2/U
         /sILxloe3qDXf+abxu4V/k5NwNzxhhN3QO+nbQSVl9HFshSv9FAPqRttJdq7gtPKv/1Z
         7jnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZI/BzMKN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 40-v6si2305475qku.277.2018.07.20.09.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 09:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZI/BzMKN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgY9m-0004Ei-Mf
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 12:21:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fgY7k-0002vs-UR
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 12:19:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fgY7h-0002Ju-QJ
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 12:19:20 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fgY7h-0002JU-Ib
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 12:19:17 -0400
Received: by mail-pf1-x444.google.com with SMTP id f9-v6so88849pfn.5
	for <qemu-arm@nongnu.org>; Fri, 20 Jul 2018 09:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7jtjAvoSsyxXKVswe3ypLQlbEdx+yjW8+PbjU3XMqoo=;
	b=ZI/BzMKNkzJ0mEsCCzKHs80ZVi99/Zu5cl7KlvG08+VrJJRKzd86vkTRt1bafuxtNj
	79i+pOzD9sMHsQG+QrZBA2s+QJRQab0iY01Bw9aKrxlAqsdRdwniYgbdMODWfue1KK8T
	2S5pSeYFye9s5uHNXrA1QkU8/WX2fDmyG9PF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7jtjAvoSsyxXKVswe3ypLQlbEdx+yjW8+PbjU3XMqoo=;
	b=t0eGdR8QDn/g0VWePomAWG4lacKvmNey5hwvZnxOcVXcJCORKqGPG3Ub7yWaYTbiBI
	aqRAFDBA5UZx+iLVxe8zuJTJCG89ssJbQvyex4qDtUkriE1qeSt8UHaqZ+YsgUSlyhlS
	kEjHDZAMvAVxbqPu6PN6x8qdYI/GlfgiU0xbpEFQEWlbO1ekM3mketRmBSDp/0OUt8cd
	CaHP4VC5ZE0tT9pS9Uj68wDpTnCQ6cIxyFLTc8i0RZlqgMOAzZVXnNUIyYxJezR0jHDF
	2fIrPqlvAtdAEDTgcJppjJwRVXU1SlRtVRHUcXEJcCGlY1FzMWEVx3VV7IrrLa0jmVh4
	dwkw==
X-Gm-Message-State: AOUpUlEv7TJpkLR7vQjf5jqzx3w6ouWl8NiyiFgq08C8AFhraad5PLg2
	H6RKKnvXjcII9kAZ2OafEoCc5Q==
X-Received: by 2002:a63:1f20:: with SMTP id
	f32-v6mr2607562pgf.84.1532103556715; 
	Fri, 20 Jul 2018 09:19:16 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	q28-v6sm4434480pfg.144.2018.07.20.09.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jul 2018 09:19:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180720145647.8810-1-peter.maydell@linaro.org>
	<20180720145647.8810-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9c56c0d5-3b29-7d3c-607c-f1cecd2077ca@linaro.org>
Date: Fri, 20 Jul 2018 09:19:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180720145647.8810-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/4] target/arm: Restore
 M-profile CONTROL.SPSEL before any tailchaining
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HPW1WrXq1Wle

On 07/20/2018 07:56 AM, Peter Maydell wrote:
> On exception return for M-profile, we must restore the CONTROL.SPSEL
> bit from the EXCRET value before we do any kind of tailchaining,
> including for the derived exceptions on integrity check failures.
> Otherwise we will give the guest an incorrect EXCRET.SPSEL value on
> exception entry for the tailchained exception.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

