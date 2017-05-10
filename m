Received: by 10.25.0.6 with SMTP id 6csp476153lfa;
        Wed, 10 May 2017 13:32:50 -0700 (PDT)
X-Received: by 10.55.180.197 with SMTP id d188mr7778643qkf.318.1494448370133;
        Wed, 10 May 2017 13:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494448370; cv=none;
        d=google.com; s=arc-20160816;
        b=y8LyMhgXAJcEqYpHPjI5l6gtHcvVI6iI8mpdrIduUj0pLXH3qXGVwNBQEsKWTHhG0/
         tCEyjOVg+C4dbuQfSKhTJNK3kAIWBor6gR1Nz8I4zr5iBCOn/JvJlFrYNbFecBLxFchJ
         qqs2JjaaCL+iNBpJbqhaHpd1wNopePbwbZYRRVeNQ/zsnrK7jHGxpajWZRMDv3RUByJn
         5tYD3CfYwg+ST7eVrpAzTbgt2ULi4Ym04tICUmkR03fgOdcc98nvkQm9GD/QDX0NX2O8
         PHSjMmj3dGJ2Z0dihqTkqGjLxNkHBWLdJP0HaTVqo5ZqozyFjO6cAeoNZfWco6vpL9sv
         uUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=VuRVKHLKE9qDo0KnFxw1+Sl5Kh1BPj1yH38eHWYVlkY=;
        b=SAqB7xLnbCWAaKYLlvQkhixoL+nDl33gZo0eGvqJTf6ChzB3/KhhHRJc3x6NKG8lxp
         t5TQtv+JQqE5hS+PsyPnkU8HrnTB90mEQ4y28/6+kK1Kt3myHGZOVyeRSTCx2Wu3AdL1
         sg5Youdd/t2n97z9yWsNrmeLmeOiP1BeMB9UV5eJ5CQJAin2nU84CNd9GdYuYoCUGNWc
         0urOqc09jeflCGSN74b58i12mvoYNH6N/6/CoHKjdFSuF4ybWmdHcRnzGj5qIrtS90B0
         7t7CWnILYcIkwr+EIv8fOjpr1T5bT1kMGRIVBMfmyrvPn3bn6a6ooXD+iKYWVkrxmCml
         D7yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j30si61328qtf.36.2017.05.10.13.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 13:32:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8YHx-0004Kk-I9
	for alex.bennee@linaro.org; Wed, 10 May 2017 16:32:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8YHr-0004Kc-CC
	for qemu-arm@nongnu.org; Wed, 10 May 2017 16:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8YHm-0001C6-Gp
	for qemu-arm@nongnu.org; Wed, 10 May 2017 16:32:43 -0400
Received: from mail-qk0-x22a.google.com ([2607:f8b0:400d:c09::22a]:34270)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8YHm-0001Bq-BR; Wed, 10 May 2017 16:32:38 -0400
Received: by mail-qk0-x22a.google.com with SMTP id k74so6652195qke.1;
	Wed, 10 May 2017 13:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=VuRVKHLKE9qDo0KnFxw1+Sl5Kh1BPj1yH38eHWYVlkY=;
	b=hZ61HAl4P9MH9rbyw4oBUJ9jwGPwrt6weYh1FugQwrtrzqJeRwd4T7rHOI3/2QCJyl
	/B1UKbr936Cg4OZ0/B371RygzNWsqYDYT0tcVpKuPXWvQYUifLnsRrbsKyf33KhHhcHZ
	Rz0KY5O9tlAhTzcpfZY3avMEFc7T+2DIfv9m31WWXyTNBIWRlhwLa6i08GwugwEtiDvz
	+gWx2oka+Z8fd7QvbonZTZuaQuUB559ff5Zdwo6YQyLql7Ouiesxj4LOprhFAinTVoX+
	lWLqsy+1On1SBZ+kglSyFpE55p/O9uavGOhfqBUdZrCoB5E5UegetFG6HEVLzKYU+oUp
	NuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=VuRVKHLKE9qDo0KnFxw1+Sl5Kh1BPj1yH38eHWYVlkY=;
	b=rDsalOAmkJG4Cwz14mvPdGP8JCmXmX8BZ+CNLEkQYhBkOqSgrlY4EYCvbD1TLamQ9h
	NA7kMFHhUITwWx2TAKc+RDWPq3iXaqfyXw8k2G8XK6prpJSF+S7/AL9sLRYW1zYOM16h
	oghW8usU+TIw6Ta0AF26UaoziLuy/PD9JsL58G+/6Y94vKHL7WNBq/aW0RZnMSKjUCrV
	MaoI6vU+nPC019rPWcrzY3sAi0P+HdI2dQ16P5CJ9fs/ABK1s2N69CSiSMEWYreelq0y
	5Vf3o1r/eebkUX4JCbGUsC2zFdrseROPDwY+T/GfO0ZghMUjch+ldD9nBswJmgFTtTM2
	mMhA==
X-Gm-Message-State: AODbwcCTFY3DeXCZBHyLCgCLGCdhKUxo6myW9vlXYrKXnLuaXpE5SHkP
	8IYR/IWI9xzytw==
X-Received: by 10.55.168.86 with SMTP id r83mr6949072qke.97.1494448357827;
	Wed, 10 May 2017 13:32:37 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id k36sm42535qtc.10.2017.05.10.13.32.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 13:32:37 -0700 (PDT)
To: Richard Henderson <rth@twiddle.net>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
References: <20170510200535.13268-1-f4bug@amsat.org>
	<20170510200535.13268-3-f4bug@amsat.org>
	<b258b01d-74f9-e412-5367-d8e1d72eb159@twiddle.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c58cdae9-5043-2506-9a91-f35f2da51e20@amsat.org>
Date: Wed, 10 May 2017 17:32:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b258b01d-74f9-e412-5367-d8e1d72eb159@twiddle.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22a
Subject: Re: [Qemu-arm] [PATCH 2/8] target/arm: optimize smul_dual() and
 neon_trn_u8() using extract op
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fV2fMionQFS9

On 05/10/2017 05:20 PM, Richard Henderson wrote:
> On 05/10/2017 01:05 PM, Philippe Mathieu-Daudé wrote:
>> -    tcg_gen_shri_i32(t1, t1, 8);
>> -    tcg_gen_andi_i32(t1, t1, 0x00ff00ff);
>> +    tcg_gen_extract_i32(t1, t1, 8, 0x00ff00ff);
>
> This is very wrong.  See my previous comment.

Arghhh I see, I checked manually and though I had it...

I'll first check with the cocci script if it can handles this better 
then review the serie manually before bother you again.

Thinking about it, this should be quite easy unit-testable somehow ... 
Not sure if I want to start this path although.

Sorry for the noise and thank a lot for the review!

Phil.
