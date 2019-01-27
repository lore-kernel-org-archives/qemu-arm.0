Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2530367wrt;
        Sun, 27 Jan 2019 11:06:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6/9V8hM61HwiL8AY9mYSW/OZgt5ytMF421QHfRBLOk/3BROzUeYBwFAf+KSV4PegUbLLB4
X-Received: by 2002:a1c:f207:: with SMTP id s7mr13949425wmc.87.1548616012634;
        Sun, 27 Jan 2019 11:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548616012; cv=none;
        d=google.com; s=arc-20160816;
        b=K4nb2BcIO/CYRY22UIwmM7oppm62e2jeiVMnD1wqSSUje3V+wd5RIlImSw+zfNjoRN
         115qpHMm8/zB7ccLK4cYNPZZb6KAfhtx3j7qQiVqgn9GRZ30esdECe6R6fSuKhe7pBTs
         4NE9hkgnVTZH1Az3objljtUfiwuCsEkzmaI2pehRUb3qM35WBQPwjbdETYbx6DUoReWd
         byzoUtI9wFNjjRlJt3GhAqWx3Romk57IVdR1CrgpbJRaVEboqg2ZYnEzP37lXo4pJkT3
         5BCcWnbMtWgaXwnLTDzyKGIWvfTWbI3Ha5C2YNSvy/K7e4QJr/P1i+15Y6OH1tIsFi97
         DhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=V+jp1NnBqTli7MuiD1RPiUu9MW1rUBXJF5rDJHKfSNE=;
        b=ZSWoEWiptqRJpWERNKGdP/Bz4pwVV0k8bAH5tPUm5eRyK3KxIq5zoeDxlRKt2jZtsv
         uKScYcQSfeCpTvQn5gmWDvY3lA2ljrWtc8l2Mb1gLXPw8EdUtmIFORNUnVoEBO54/b+G
         vylfVJ43PACGG1NUFMQolGFgvM55j3a6XH/ivKVAO5MhNJ3uGhOyRBpgem/X4/nbTFNj
         tAtRbX+JiecFEcEOCTZ2cmrfGzBIMJUI1uXXgx1fCHIg33tbZSlQGZBz29aD9+WjYDiN
         MTHxGIxt3LbkZrMo39NXt9aIP/ekpJB8wber+Tcyp+zk5k1yPTptBgqq/ck5PImnEdmS
         PEKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JVPiq8+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k124si38322577wme.117.2019.01.27.11.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Jan 2019 11:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JVPiq8+6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnplb-0002Hp-Mw
	for alex.bennee@linaro.org; Sun, 27 Jan 2019 14:06:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnplR-0002HK-DB
	for qemu-arm@nongnu.org; Sun, 27 Jan 2019 14:06:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnplP-0001w1-1w
	for qemu-arm@nongnu.org; Sun, 27 Jan 2019 14:06:41 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40961)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnplI-0001t8-0N
	for qemu-arm@nongnu.org; Sun, 27 Jan 2019 14:06:34 -0500
Received: by mail-pl1-x644.google.com with SMTP id u6so6758297plm.8
	for <qemu-arm@nongnu.org>; Sun, 27 Jan 2019 11:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=V+jp1NnBqTli7MuiD1RPiUu9MW1rUBXJF5rDJHKfSNE=;
	b=JVPiq8+6HQYcEwKi5WBM/kZ4lavtUzqeELI3ytoNX9gvyLGYrYFn99YGCj6mYrixvN
	GDUHZgk9Qwx/F0SjCle6MP++fF+oHARMGm7J+vcPzpGFhs+rvsLhnNETRVKjPEozbJlJ
	CIvHAYAlNWtRAdKra75JL0VovYt3Xyd/zcwls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=V+jp1NnBqTli7MuiD1RPiUu9MW1rUBXJF5rDJHKfSNE=;
	b=Lh1obHA9jBuB8XbOsioJEi4Wl65xZPatfQmtIBoZ3SYwbdSeZDtxM7rSut2rbepsD7
	uFOwi4bf9D8gVzhSeYgPW+sGd7YHdC1EoAFaWFVJeYC4iALFfEzYob+vREA7xpMZHG6m
	3esMIsA+x9/7zX1koZYez3uSxywEwU/iyhPq9P+WK4QUeXEvMk5b6Vz+mAGqGmcCIKs1
	QbNBvi4jbuWtLdFkUq1AGThM0EzlxNJH6zlY1nCHu4dIuvQwuQFVA19VJbefRslHRXQU
	aw3btpazrWumLWu4YHyEL+X8j78vcJEixaLiKp14mPteKJRDcldeI5bD9F1p22R0JxF7
	P3xg==
X-Gm-Message-State: AJcUukf7mXd7+zyFRx3WdlE0AaTBChEczIUU5iMmiRlwx2UeKcT9ItpM
	sUCVfH3ED5AJtoupWouErWsgPA==
X-Received: by 2002:a17:902:4124:: with SMTP id
	e33mr18981185pld.236.1548615987215; 
	Sun, 27 Jan 2019 11:06:27 -0800 (PST)
Received: from cloudburst.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	d3sm35566638pgl.64.2019.01.27.11.06.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 11:06:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<20190125214926.3204-3-remi@remlab.net>
	<50b6d384-b152-ce9d-f7f5-273691c9359a@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4efa119f-2911-f1b9-3d5d-345ffcd922a5@linaro.org>
Date: Sun, 27 Jan 2019 11:06:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <50b6d384-b152-ce9d-f7f5-273691c9359a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] target/arm: fix decoding of
 B{, L}RA{A, B}
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ocABYqf9aKIh

On 1/25/19 3:40 PM, Richard Henderson wrote:
> On 1/25/19 1:49 PM, Rémi Denis-Courmont wrote:
>> From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
>>
>> A flawed test lead to the instructions always being treated as
>> unallocated encodings.
>>
>> Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
>> ---
>>  target/arm/translate-a64.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Fixes: https://bugs.launchpad.net/bugs/1813460


r~

