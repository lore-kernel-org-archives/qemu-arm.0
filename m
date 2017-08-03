Received: by 10.25.221.202 with SMTP id w71csp1232291lfi;
        Thu, 3 Aug 2017 15:19:24 -0700 (PDT)
X-Received: by 10.200.54.200 with SMTP id b8mr422729qtc.307.1501798764805;
        Thu, 03 Aug 2017 15:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501798764; cv=none;
        d=google.com; s=arc-20160816;
        b=DSMXBTNQmf6sLnIFTGHXiBnx/S46fLuQL+nLtPNXNow0nSwzt58kzB9kXEpkRoPzkw
         yqxUnZdmHoEjQVf6s7CDRyKxnDvyvoSrMfthGWRiHKBsaM+jDSLFLYDzdE+DlMJrQ16k
         n5aTKjClFuCiRLO29F2Um0artM/wQcMLYRrV8WMb4QkPoDXI8OYoGN/v8QemTtWO2HsE
         qzEd1F/MLSSLBvXlKslF3iGU8ns2qLJKqzQapHsVdCT2zfO3cMn+hpRAMNNBpH/dSO3s
         rQOvNdl/2UQQpadfLHAVB5BH1oULKLd5orRdJTOobBSmT+5dsNaiaORDMi7fXP2EB78C
         mFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=LyXqi9LTozfyW2U7LHP51RJiIJyUMv991pwF5h5q2cM=;
        b=BaT/z2P8z3XEOtQ5NUFA1dvbcJhTvjRqKXa4cos6OVwI9gFifR8aZGrR+mV2FjLJxB
         pRuZQRpxEU77Wz0g0BtaRVjpKQzGjqrR6qcqjOA0AT+WSFbwXjNYXiG2r7snThisamxM
         Rwoh1NmnU4aEycHUrc+FLWoJfBIlrUlRd2NWSALMPcGEtq6MhODRTRzRVB+9BBgitmyP
         TJDhi0wDF4b9H8nSYPnRb/8lpIn2ncV9SFL7YayhWCD9iWhs6a2mvO3Z0w3f/bezjAiq
         XGCveWkdLiIlyjPY1On5PzkE58EFy6u/qPJhnKiLVxhJehGiB124u66WxD13zwrwgfpL
         259g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Zi++Opg3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id z184si40944qkd.260.2017.08.03.15.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Zi++Opg3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddOSg-0001Sf-0S
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:19:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOPi-0007Oz-6k
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:16:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOPf-00012V-6S
	for qemu-devel@nongnu.org; Thu, 03 Aug 2017 18:16:18 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34524)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddOPe-00010h-P9; Thu, 03 Aug 2017 18:16:15 -0400
Received: by mail-pg0-x244.google.com with SMTP id y192so20733pgd.1;
	Thu, 03 Aug 2017 15:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=LyXqi9LTozfyW2U7LHP51RJiIJyUMv991pwF5h5q2cM=;
	b=Zi++Opg38Jpp20wILvytL24I2I8fomEt77DelFf/vKjiWoqHnZnIjBZye3kBM44VO+
	qPc050OKRJol7AQUHO96MhKWrWXrxGicW82Jb8/W5IvIe6ns+8Eq7YtPV9xN5T6QDbCK
	wDJo1Ru8huifeQQmksa3+NX/87B/cd5jKuEOsSxnhjw/Hu4IYsqXu+IeLWub96dvoFpe
	comZ7/4nxH6WLLUXVWtXATgKAjRErEE4oq/yC6QEPVKILOBqCyS3a7HD/7mLJeUjGHpZ
	0lKLrmx6lm74A59A+OeNydlixXyKaS1YmBHpxyFREZDP1MOqB/cZ9LfCT2FQNh2/Icvw
	Y+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LyXqi9LTozfyW2U7LHP51RJiIJyUMv991pwF5h5q2cM=;
	b=seYwLn1mdgoG4ZsnEVdmskQjeU5uPweQy2BxXdqEsLIppijaPGOgX0BhgKR79qnRAt
	/oI3pISZefuR0oaMYDiC8AFnCDtlxd2mwMOeHSlT58CS8psB0kKgMKCDaPTr2glkhVvF
	Y9QsHv51xUUT3/z9EFnR6bzGTKteHFF4ZIsHU4iPImNDY4xrO/l+gKzv1jvWcD3+eHY7
	weasBCfSnQCy2IJfk/ZmC1Wl71VkZIqOqDzQoT1vwzQaGrzmG3Xd2W45PGlsLZeLUD/H
	ldupDeLlxFclIsaFpU/GQAuxuJ8NDCof2Ur9BFXNfQ897blcLzKJeFkNrGFDbiLS5XHP
	gMSw==
X-Gm-Message-State: AIVw1124lAxAluDKihH+1mRdalG0b9mJJEImjNUYIgG9G8Z5/G0PGY8R
	Ao9nwdh6QPFKV/aeMD0=
X-Received: by 10.98.7.204 with SMTP id 73mr328448pfh.110.1501798573940;
	Thu, 03 Aug 2017 15:16:13 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	v9sm20772pgo.39.2017.08.03.15.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:16:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-13-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <2266f042-5c2c-301e-f5e1-9e19c7879e37@twiddle.net>
Date: Thu, 3 Aug 2017 15:16:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-13-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: Re: [Qemu-devel] [PATCH 12/15] target/arm: Don't calculate lr in
 arm_v7m_cpu_do_interrupt() until needed
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
X-TUID: T5qao9R1dxTC

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> Move the code in arm_v7m_cpu_do_interrupt() that calculates the
> magic LR value down to when we're actually going to use it.
> Having the calculation and use so far apart makes the code
> a little harder to understand than it needs to be.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

