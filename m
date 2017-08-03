Received: by 10.25.221.202 with SMTP id w71csp1234160lfi;
        Thu, 3 Aug 2017 15:21:17 -0700 (PDT)
X-Received: by 10.55.100.206 with SMTP id y197mr546410qkb.56.1501798877121;
        Thu, 03 Aug 2017 15:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501798877; cv=none;
        d=google.com; s=arc-20160816;
        b=ezSf4S7hRITS74xumPC8p0PHfNnvrKrS+PO3iB71FT93B41OIZoz6Pbs23hqAIHuo3
         dwsFme1tDNgbqlzarV1yw70E/HTNSzXHpVZkkyFSR40NaBt+D5HlNykXaoAzxNUDRGOO
         Q5gVR+MGl4rFtyVgBeJ+DlDTwUocdLB5NDANSMjGYWK+S0+F8niw/vS+A2nGDhKV84xj
         5M0KkjVENvzh16KrqRN82Cq2fvJnl5I2e9VZwmjJ791FuG7tDtl4VMKtrgIHLBslgICr
         pi04KeDPdKpVlLgIhbbPmES1E7nrSfD0Nx1Qvzn/5wVawUYc3rDaDj35WpN0xRSQGbdJ
         ubBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=fgkSuR3ww96p2eGv1P24d61/i3E9vtu2KLwmVgtulsM=;
        b=b/e7ZBv+99ZYTqgBmIf0OCVEgRCsBuZbFt07hLuQ4mFdiGFAD5qUrkTxEuuY2C9pym
         BuYG+EFBze/f4+kkOgOYLFx15AQN1au/d2w3o/6oM89JribBcFK4i/3Hy0jqCOPYhqOi
         WCgs2cQuCLqQS6bk5RZmOaoexWHFZjzlVNeE5dmkv1J2EJqtxwHzgSS9q6CciSvIhLtw
         LzYSkhBGpg5N+caZfdmTUJf5/OJVM2MQnHVgUUaI5fls1D/ecddYocoXYOgcP0BPyizW
         bK4kLkL59qsJWy1EGxhr8yFi/MdaVAeyE12sjcYhxQV+O/XbKa2Pcuu4Y+IZoOqWGpqd
         oufw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=HMAu+YgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x28si66381qta.44.2017.08.03.15.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=HMAu+YgE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddOUU-0002oH-D5
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:21:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOT9-00023q-Jd
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:19:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOT6-0004Ec-J1
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:19:51 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:34748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddOT6-0004Dl-Ca; Thu, 03 Aug 2017 18:19:48 -0400
Received: by mail-pg0-x242.google.com with SMTP id y192so26976pgd.1;
	Thu, 03 Aug 2017 15:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fgkSuR3ww96p2eGv1P24d61/i3E9vtu2KLwmVgtulsM=;
	b=HMAu+YgE0PonZbWSvz2V0+l+matewYZWL70d9TK+vSGN2pqni7dCgCd8HKI/TCcq2b
	56XYTfUKF4FE4a/96J2i+1oAILh6LJg5PS8DihVKtgTSqLBoQldbzs2LpNvrJMkFYBjf
	5/eXAOU4JK8PXIQmxaY4gShxqsw2RlyGxBaEFy9hc04VlfX++RoQNmkFn9q5OsLObRhG
	8ABXPyuBjt88UXREnCqJ6NHu93RnIJJ1iqQXHaRjiOEjRziXBRr4A+7sJ+EvWsimslnG
	Hl/1dXORL6gbGRd37Q7H1pGja8I+TwdsrU6VvrZoguf1/bxxWuLoUssBEC8PKOgl4Z85
	6LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fgkSuR3ww96p2eGv1P24d61/i3E9vtu2KLwmVgtulsM=;
	b=L1ChaR2BO+/IEQwvB9+4Ku4idoMDuSqxIW+FLoVcMczOw3V7IvYxp51StPjGFBRM15
	qSeXB40+uX9zFBB7LFO5I7yvkC3VHODfwbNz8k1uDESMCtxgIsl/lxUUm61cdB5OH/9U
	YQOi+5p3xuXnppB4s9hDyMDnJIMg34VbuSsrd+yDyoRhlpFbyyiaow52dSGrwr4qDWad
	q1lEgcRWFi71otA0wF1+KYWKWXkA6QYuXYEQgNp1NFYd9rL6p4+HNKd90Udwe2RVd/sm
	UFcvcfPnD2ovXTlUJ3r9lDcfWCvEmgxp0HFiOjSgCPczr/EmRUAAnmDFmCzDKNLkgRYx
	rcTw==
X-Gm-Message-State: AIVw112swvDK1wl+kbhbRwHgwQh7A75oVT/nnEyi/bfF0pnL8xIZmQyQ
	VJNnsHNoI15g6g==
X-Received: by 10.84.212.1 with SMTP id d1mr339576pli.17.1501798787636;
	Thu, 03 Aug 2017 15:19:47 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	x29sm40141pff.2.2017.08.03.15.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:19:47 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-15-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9ebbff0f-4aef-3032-7691-15ccf34a660d@twiddle.net>
Date: Thu, 3 Aug 2017 15:19:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-15-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-devel] [PATCH 14/15] armv7m_nvic.h: Move from
 include/hw/arm to include/hw/intc
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
X-TUID: NxBv0lv0o7hj

On 08/02/2017 09:44 AM, Peter Maydell wrote:
> The armv7m_nvic.h header file was accidentally placed in
> include/hw/arm; move it to include/hw/intc to match where
> its corresponding .c file lives.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c                  | 2 +-
>  include/hw/arm/armv7m.h                | 2 +-
>  include/hw/{arm => intc}/armv7m_nvic.h | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename include/hw/{arm => intc}/armv7m_nvic.h (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

