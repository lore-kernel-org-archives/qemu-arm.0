Received: by 10.223.172.38 with SMTP id v35csp217953wrc;
        Wed, 13 Sep 2017 16:25:42 -0700 (PDT)
X-Received: by 10.200.22.201 with SMTP id y9mr27497903qtk.115.1505345142682;
        Wed, 13 Sep 2017 16:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505345142; cv=none;
        d=google.com; s=arc-20160816;
        b=LjvI26zDpFwZdBSiKex+21gpnANDGwtAgN8SMUPmDQtvYLKLL6hn9+Cr7jw3WmaHeF
         IT7wWJW6BEK6xbnV67aD3m2TvVzn1xoAn8msFZc8gSjQWXneHczmESZZ4CA6Fx4cRINK
         TReBXHK3XnT8tnU27+ZfDNq4RsSm996D4RoZC5J/QfLfuFOuyi62MAa6z7gNkH3M6VWP
         UM9GsiQZQgbWqoXeYyN8lj0D7WPZUlZ9OOzPOEFu1+3BAHGo6ECNxmXJfYzKLLLqkdcf
         phJaRJ6DV9wungmXYi9zrwOmBd7lnvEak8MiNFgJVc6HNwIRuTQiM+YOr+NMchry6Srr
         uwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=ywPa2/mB6yartzmn8yx69ptHBofuI0WGo3kdMiZOJU4=;
        b=mOAd14WNxxPPTrkC4pK8tU/gaDnAt6Tx6dHLIZO05URdLknDX8k3Cb9fKOFQq3fwlP
         +RPliutOOOI9LdAGVSXT8WGLRPv3w30agc7zrVtIf4S+Hc7d0zD5D7UJktC7Oj8qtMzb
         vagGpyonoNdDqrIUMAlR1v/rvlIzrWi72xfF2+Ztpw+PqczIXK0ozKKuwLKlMS56KbM8
         btah+vyVRrpLMYuXrGCx5tWv3+lN7eLu2yFE86uxYyHBQFDeC0dZPAm91Zj7N4xhehNP
         xLfIOibRsS18W1P09Iw+qOHfql7nL0sgbbowL+TPPPvuZucfR5sq4y5hDIN+8W9DsEWw
         npkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DBupNe3s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z25si16509385qth.253.2017.09.13.16.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 16:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DBupNe3s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsH2K-00058v-FN
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 19:25:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsH2D-00058i-Gt
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 19:25:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsH2A-0002Uj-Dq
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 19:25:33 -0400
Received: from mail-pg0-x22b.google.com ([2607:f8b0:400e:c05::22b]:48350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsH2A-0002U4-5u
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 19:25:30 -0400
Received: by mail-pg0-x22b.google.com with SMTP id v66so3115495pgb.5
	for <qemu-arm@nongnu.org>; Wed, 13 Sep 2017 16:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ywPa2/mB6yartzmn8yx69ptHBofuI0WGo3kdMiZOJU4=;
	b=DBupNe3siQRrIZDtK7CxCw6PZr4VFkJYUtPONhJMioHmdsJIgbLTdlHs2SGGWYgQfr
	ev1pcqE+HQEmgr8hlov7ORtH52WyFNzf7xi18DNJuEqXPKZqtfBJ2cZs3HslADu3PqoZ
	sCbGbrWPVMnu/qbofBT9NbnH3RU5K9iUuxVCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ywPa2/mB6yartzmn8yx69ptHBofuI0WGo3kdMiZOJU4=;
	b=DTtJbYA3SB3gqqYIog+Ws0HKeSVYh2H1NF0RNpGIX0RX8Ar97m9rkazJOE6K4tdrHt
	7/JoTIVLiizJGnSryptqrOXWNJK4/DFZTvDIl95nVI7X6Jj4EkXUjvjooBfInp8qkPGv
	N1SV8gMbWXMLh7sBkABcG25YnpHqnrm5XUuJA82emoJKTmJFzpYPhxJfktnZrtkXXfZC
	YRCkqb4N1/K+P6vxCbXAq2bFyJieG0Z936kZr3Ty9MPLGqG0rzBX4niNop/L6YmON0jQ
	vO1ddxKQbm75yKl5c0eHKhfNfFJ/A8vvxcejN9di4h3yJmFpRdYcDj98GelCBQISYaqa
	j9og==
X-Gm-Message-State: AHPjjUgLETImq+tgbltHOAd7GI9uwJeKvHD743eA9FiSPyJZhISRQ/Bd
	3wMvDlDuXSr6ZKEi
X-Google-Smtp-Source: ADKCNb5FX+aHH4tSze+B5OVIs/MAu7fQjCGd1dppaQZWdHmlTdUxa88wsBn6vzaT2+oznyHU2/FLRg==
X-Received: by 10.99.96.140 with SMTP id u134mr18054892pgb.264.1505345129049; 
	Wed, 13 Sep 2017 16:25:29 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	l15sm24328122pfk.44.2017.09.13.16.25.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 16:25:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
	<1505240046-11454-5-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cf54de7-a40d-dbed-b491-7cdf7f3b67ff@linaro.org>
Date: Wed, 13 Sep 2017 16:25:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505240046-11454-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/19] nvic: Add cached
 vectpending_prio state
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
X-TUID: YacWyI/UzEyX

On 09/12/2017 11:13 AM, Peter Maydell wrote:
> Instead of looking up the pending priority
> in nvic_pending_prio(), cache it in a new state struct
> field. The calculation of the pending priority given
> the interrupt number is more complicated in v8M with
> the security extension, so the caching will be worthwhile.
> 
> This changes nvic_pending_prio() from returning a full
> (group + subpriority) priority value to returning a group
> priority. This doesn't require changes to its callsites
> because we use it only in comparisons of the form
>   execution_prio > nvic_pending_prio()
> and execution priority is always a group priority, so
> a test (exec prio > full prio) is true if and only if
> (execprio > group_prio).
> 
> (Architecturally the expected comparison is with the
> group priority for this sort of "would we preempt" test;
> we were only doing a test with a full priority as an
> optimisation to avoid the mask, which is possible
> precisely because the two comparisons always give the
> same answer.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/intc/armv7m_nvic.h |  2 ++
>  hw/intc/armv7m_nvic.c         | 23 +++++++++++++----------
>  hw/intc/trace-events          |  2 +-
>  3 files changed, 16 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

