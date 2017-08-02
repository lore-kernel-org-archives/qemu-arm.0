Received: by 10.25.44.15 with SMTP id s15csp55381lfs;
        Wed, 2 Aug 2017 14:47:09 -0700 (PDT)
X-Received: by 10.55.20.25 with SMTP id e25mr33470235qkh.75.1501710429156;
        Wed, 02 Aug 2017 14:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501710429; cv=none;
        d=google.com; s=arc-20160816;
        b=EHxHWgMhq8Nav57p9muOp34VStFwehevNYqKNNZbGpQ14tXF51a5yi24QwymDMxRoh
         +ddBgzcY/BqYf4B/4IT60144+UGGnxAgKLcKDaxi3OE5i4Iq0dTklMxYrTqTwXOl/KOh
         iJI/KLEhi01yEp+RhTrZjz9z+k5j1J+quZgJ5pgit07uzVdu6IAx52Sed3kwg+jJXDxj
         ToJ/NWsRVyOZNtPZ27AjsbsJh5PZfR1+xhZ+GSwBTfbimArwibJ16bvSUf33FTFdW+um
         qxMLd9m+SkXHkBLmWAMwt6ay/Xx4Q/yiuPvc/VmFp2/yux7GRKUj+ClAIklTW+a9a2Xn
         SErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=7tBCZotMyWhoESq+y/Pz7d6XX6qBqxx3uGqdNrm1l60=;
        b=j1ZYDD4EvcJunexJrIE9j+WQDLARMAS96sbUBK5aA1BqxjlHH4nbYNbak4gWXio/dl
         tix9Tcw/0PXtF5HPEJe/l0ZKIGXlDtL2oCp/Dhz7rG+GzAj5cHWQwlui0IHetD5oJjZD
         Fu1oRbKRVrJDw64iq6XWz2byPpGYb1W43FafkxKBKXAJ6ZF5YBHgp/OQZPpKIwNiKJqL
         1nB0Ne5374/5w9QBkMmxN0yasN1WKGY5MWgLKBTEn+nROpYU2ScORq0/1AXJkLaHIAsx
         A7AoNJy2+Ut8yI2gmZQRnNIZrWJcoVDQkjbKZLxebEmsoAuJGGtYD2qA3vcs0dkbbEyy
         bDeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=hmPTnJXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e16si29649132qkj.311.2017.08.02.14.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 14:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=hmPTnJXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dd1Tu-0007l8-EI
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 17:47:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Tr-0007kR-0G
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 17:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Tq-0008H1-51
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 17:47:03 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:38273)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dd1Tl-0008FH-08; Wed, 02 Aug 2017 17:46:57 -0400
Received: by mail-vk0-x244.google.com with SMTP id i133so2797777vka.5;
	Wed, 02 Aug 2017 14:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7tBCZotMyWhoESq+y/Pz7d6XX6qBqxx3uGqdNrm1l60=;
	b=hmPTnJXtuXgPdt7ObXyzCTLI5pvm+0FnTmGfS0h/DZG2sjTuefnNmjvkrG/T7qwM4p
	rVPhnVTeZqEZleF4V2kc53SvW9ptsL9ttOxIRMcPdpDqSUlw7vzWTbPzc6pf0w2eCEfn
	TktFRHNd3CppreumNf33qzNd21xHrcSivN5h4hUZsoioJAbpo2XvybgZNko+A2aEgXij
	Yijo3QCJmnna1VvmrRjcHjbwX4ECcxfkOx+JJ3RvUp5Nxa29nZ1AjFDuhhOmO4Uci/+p
	LgCtG4urxtYizF/1Oyt77bHOUATeyIJfbSVTAg31w3zc9eP9ZcHfoJXCZQlqZj3ZjNGj
	kLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7tBCZotMyWhoESq+y/Pz7d6XX6qBqxx3uGqdNrm1l60=;
	b=Ns8hgdC4RH/9P3CET2NXz5GnZJzquYtaBmz22lDSsbVbWM0JtomUWW1IZ8sgjydVFu
	MW5jnleSW0Bqxxj5ClwuPD5SJjTsuauaqTZe9Fsc8KCX72p/00rkgc+blNkHq5U1dX2B
	m+jyieTgyvDBfTqYu3oBqscGvjXoAC3k33gyPaupN/bT4ZlNgHK7vGdinTNJohRnFxVW
	E+Vcm9ZJ9d3jQ21TsFckBuIItUjOB1twiYt+cUONzK8h9mcDcNqGaEpFBRJOeznWjPEn
	CKD9ZhC9OtYg0G13LnDB1ghqag4KavTBaZPQTzargnTthDy7KiQWRKx3xbQ4CiaBDaX/
	qCXw==
X-Gm-Message-State: AIVw1110eutkc6h/2fcRk5iEV9QF56wKjbV01QqnkEbbLrLyT8K07Eap
	bTOvHTX7vYJVnA==
X-Received: by 10.31.33.80 with SMTP id h77mr13002756vkh.11.1501710416341;
	Wed, 02 Aug 2017 14:46:56 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h97sm8056969uah.56.2017.08.02.14.46.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 14:46:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-13-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c3b0faa1-f05d-7240-c5e7-02e143758a9e@amsat.org>
Date: Wed, 2 Aug 2017 18:46:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-13-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::244
Subject: Re: [Qemu-arm] [PATCH 12/15] target/arm: Don't calculate lr in
 arm_v7m_cpu_do_interrupt() until needed
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
X-TUID: LTZZPj1pqOJ5

On 08/02/2017 01:43 PM, Peter Maydell wrote:
> Move the code in arm_v7m_cpu_do_interrupt() that calculates the
> magic LR value down to when we're actually going to use it.
> Having the calculation and use so far apart makes the code
> a little harder to understand than it needs to be.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   target/arm/helper.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b64ddb1..0ecc8f1 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6311,13 +6311,6 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>   
>       arm_log_exception(cs->exception_index);
>   
> -    lr = 0xfffffff1;
> -    if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
> -        lr |= 4;
> -    }
> -    if (env->v7m.exception == 0)
> -        lr |= 8;
> -
>       /* For exceptions we just mark as pending on the NVIC, and let that
>          handle it.  */
>       switch (cs->exception_index) {
> @@ -6408,6 +6401,14 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>           return; /* Never happens.  Keep compiler happy.  */
>       }
>   
> +    lr = 0xfffffff1;
> +    if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
> +        lr |= 4;
> +    }
> +    if (env->v7m.exception == 0) {
> +        lr |= 8;
> +    }
> +
>       v7m_push_stack(cpu);
>       v7m_exception_taken(cpu, lr);
>       qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
> 
