Received: by 10.223.197.9 with SMTP id q9csp1033340wrf;
        Fri, 29 Sep 2017 14:03:20 -0700 (PDT)
X-Received: by 10.55.221.149 with SMTP id u21mr4747428qku.278.1506719000007;
        Fri, 29 Sep 2017 14:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506719000; cv=none;
        d=google.com; s=arc-20160816;
        b=GS8MiBMnGWgsb1RTJuhRR7QtdMm2F+qKven37EHTw87guN3by4kqfGrvkZLzRSx1X9
         8kDa/U1liKyj2rcx/0HXd5LnZ7HnKOab9Twc0ATEFoOX1GlcKnBpQhDkcKzo1XZf/JSW
         BrepyuoeMGPALkcpfftaYpmY+BY/PaTQ0O79p85uHiuzX+KcOhUZHVvlCsAFvIKVy32j
         T2SmdNgnHhJq4ylngQam5t3ykG7BFCru+LO72zZATdmCbtb9DKEvSKofiqcoPb7HOHFS
         GB4pKiB9BlRCUc7tXYowzdC42RP1LuEC9pGHUvCOwd6j3chv8HuBqvJyd1GLJivHN1Eu
         qFXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=g3mFaWUD1zynZdurCpQM4b54TuLFN2IM2w1uKoMCzIw=;
        b=Gb+qrVvuafrEp/olMMUag1wyrA7Tii3qrorvgQ9hrw2lusd+yyqxh3aoR+X5+PgiDt
         xwYZu2wvaz3I9qhv7g8oQWYq9L8/ARses/PJA94CvlfbGb1WR/v7saPy0buY6CPF8/Kk
         AxKp4YKvV+gzaW4SdR1A3m5+2lsE5T5gRIb2IhyP9+rezt5zg/Y8QREUp/QR32T1J5IR
         W97/Srn2Kgb+/zWtp2YcTkkqV+JdBcYxJXK1h9VepZxJlgyihH6sUOZH/mWr9iC6sM7u
         Gz2r/drcT67B04oEdF+OStJ7CFfb6Y/MFsNIuvSXHFaca3/+tdk/4Aute25/7n+XtVre
         iIhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dUeM+TVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si1365735qtc.148.2017.09.29.14.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 14:03:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dUeM+TVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy2RJ-0002Nc-Or
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 17:03:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2R9-0002Mp-Ox
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 17:03:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2R8-00087S-Pq
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 17:03:07 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34243)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dy2R4-0007xt-Dk; Fri, 29 Sep 2017 17:03:02 -0400
Received: by mail-pf0-x243.google.com with SMTP id g65so468386pfe.1;
	Fri, 29 Sep 2017 14:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=g3mFaWUD1zynZdurCpQM4b54TuLFN2IM2w1uKoMCzIw=;
	b=dUeM+TVCB1mJg12yFEZ+7qY17C22wCzm1chfzIJY+7oRB15ARgOTCFAbAVA7hbyk7m
	lj56JNZUxP7W11g9TN5V9pARwv1o530nkl9h+3VoAtvi/R570SgJ6NPSleu2w0wL63uW
	V3uDgZg9+AzaJSAW3iYidVcXHG5QV2L9FvGnr/+sUFDskAo4xypFraEju6N4WQDEu3Vk
	ejjsnXCL+CJOWeWDYyseyW/pjSyZWAk9Yv/ONtx6So81YmGKWIzE1Wgv+JzcPMXYCyST
	j4dxuCTAnnQEFMs4aDrXwI8NL9+A8q4LZiFjDzBajeqTdyyaFC4hn/o5G5044un1Re83
	KXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=g3mFaWUD1zynZdurCpQM4b54TuLFN2IM2w1uKoMCzIw=;
	b=XRqQ6ikkbmG7sqa3zc+JityyOiaupU+hTVkZYn7ij4lQFnTqXzyX8cfXa8emQfNo0+
	GtRAxQaz22wX2gneNqHAQ844VRusQl58HXBlo6VIqKixazJXxw7wMXGTNZwDgz36+H9k
	lmCk0x0Qv4yjaTpBVbhmQQ/OJ3R4vRcz3w0c+T/ORlUsHBzjHTvsaYVCKfxMdC610Mvn
	TUM6kRHlD0eK+iVDB4+VWOUtg4mjer8Hch5M/Vai3v3vEvTxsZ10LRdNK2m/k4vl9Gr2
	/l3cForaShz04xAbmoK2T4cwuixULiHPCq3oDkrVh876rQC6dUmg4n+MJT/tWwUlnnr0
	mx5g==
X-Gm-Message-State: AHPjjUhJNcCVWBk+sOqwK+mxBErs3r3N16c+8LLcEdNT97RXsmdAIhAs
	rtL9MWidhehCm/5wFh4cEl0=
X-Google-Smtp-Source: AOwi7QCmjudhgDXsapxEr8NtzwoANiBoC6kOGidFrukEdYVdrKNdTpy6TYSW6KjgLq2ttelh8ykZcw==
X-Received: by 10.159.249.69 with SMTP id h5mr8294846pls.208.1506718981302;
	Fri, 29 Sep 2017 14:03:01 -0700 (PDT)
Received: from [172.31.205.142] ([216.9.110.11])
	by smtp.gmail.com with ESMTPSA id
	p12sm7133043pgn.90.2017.09.29.14.03.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Sep 2017 14:03:00 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3e678775-89b9-979c-5f5d-cde777adcc3b@amsat.org>
Date: Fri, 29 Sep 2017 18:03:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [PATCH 01/20] nvic: Clear the vector arrays and
 prigroup on reset
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: yM/UolfxffoC

On 09/22/2017 11:59 AM, Peter Maydell wrote:
> Reset for devices does not include an automatic clear of the
> device state (unlike CPU state, where most of the state
> structure is cleared to zero). Add some missing initialization
> of NVIC state that meant that the device was left in the wrong
> state if the guest did a warm reset.
> 
> (In particular, since we were resetting the computed state like
> s->exception_prio but not all the state it was computed
> from like s->vectors[x].active, the NVIC wound up in an
> inconsistent state that could later trigger assertion failures.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/intc/armv7m_nvic.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index d90d8d0..bc7b66d 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1782,6 +1782,11 @@ static void armv7m_nvic_reset(DeviceState *dev)
>       int resetprio;
>       NVICState *s = NVIC(dev);
>   
> +    memset(s->vectors, 0, sizeof(s->vectors));
> +    memset(s->sec_vectors, 0, sizeof(s->sec_vectors));
> +    s->prigroup[M_REG_NS] = 0;
> +    s->prigroup[M_REG_S] = 0;
> +
>       s->vectors[ARMV7M_EXCP_NMI].enabled = 1;
>       /* MEM, BUS, and USAGE are enabled through
>        * the System Handler Control register
> 
