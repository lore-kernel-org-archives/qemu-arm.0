Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp852883wrt;
        Fri, 25 Jan 2019 15:29:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5MOT6zNhvxkWdf1xgZzjojn8Dopm/wAGecem83PMmOOgNo2qjzQuGPXrvRnThudijc1Y2i
X-Received: by 2002:a1c:2944:: with SMTP id p65mr8366668wmp.20.1548458998754;
        Fri, 25 Jan 2019 15:29:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548458998; cv=none;
        d=google.com; s=arc-20160816;
        b=NO//+A59zK2mSsw1r+3cQhjSPs9T4LDQGrvf2H638qkBFGU7yrKvBSxH/v/ulbtvC2
         9o3ZjDT5hY4tA9NM6PDwwiANCq6P86+BK3fiypGyOqfXQJMcX6D9OYqa9mQYdi1pCNHd
         9SAr+KiiaT/ghW6E4penakB2Kyb57A5fWXwI0EMpxMOEbJtrlP6P37HCcs8KiMT2ThBX
         LHwDUtWttYmhuP5GjO9uOGDYzBBQGCCuKFvkLvLvPjLlIhntwXKOnf0Zn21/KaxN7O3K
         xTFqRVdSFs2HPftjRk9ZFx2we/5LHf1LT9c7P6wkfdfnT1MCY2Ul8PP0qMuPmM07xUwO
         5bOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=aOc7DfEIKh2wYmdL6ZoQlVlKPnwQjGAq+R90wu3CqFU=;
        b=jIYcNfnf4c3LRdasDA/SHZSg+eszpY5dXZFCIfB9PN/MriNuOeqbLuHJccZ3AkJLPu
         YlV4/2m/cxIEhUxThITHWHZrmN4Pg5x6rbak1IEyeMs6BBY5pPbp2afMnskqtJ/He3y8
         yblcffJ5mj+7JykdYZRVOfdqUQsnIy3K/G+M+Vk1b95qm6Vm9v0jepkw9PGHFlxTVT8D
         n1CDr77nvc5on2x2A0vXC6N6NRsjHrjLMfxNEtOyAXRXwxsG+K9JvhARZ8Nlc18mhGso
         mtweMc/oY9bmNe/XisxLjBR1gpQtyucwPa7RFdHLwLOVv9qK8/aPPI0HuoQhWpGB8Fze
         7XTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ML01i50e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si40249807wmc.149.2019.01.25.15.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:29:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ML01i50e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnAv7-0004SV-SC
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:29:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnAuy-0004RM-4j
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:29:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnAuv-0002us-PK
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:29:47 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnAuu-0002lr-St
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:29:45 -0500
Received: by mail-pl1-x644.google.com with SMTP id y1so5227614plp.9
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 15:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aOc7DfEIKh2wYmdL6ZoQlVlKPnwQjGAq+R90wu3CqFU=;
	b=ML01i50eoVkJR+eCv+28dBvpI68KF6g7Bq//gIlZm7qM+wJmsdqgSOBOMvBszcGb4T
	XGfOI5GAnoDlZnqHbBz7TMLo4KDdAkla7syEQ75Ia4QnhARYEVmCdtrOiq28bz/KrCgF
	kKkxKjPgYBQqlKZtcWXbP8ZxT4W4mt73QMlwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aOc7DfEIKh2wYmdL6ZoQlVlKPnwQjGAq+R90wu3CqFU=;
	b=aq3MbYI6JAJUZgh6N3Ou8sJ2UwL4lwDgqiPFs9yqh8wdY8xretbHKCr/IQJ5mFj4Xn
	TmJx0A6BG7y8o3rumdP8JXku7iCXbYJGf3Hz1Uh8w0eJB+z6vBgp1Q8gBy5OKHoVo3kv
	gA40D77nN8g24y1mhHZIIbph3KJzh2u2OYmFShLSOTTPo0QYQ4hzKARvRjpK8rPoVE3I
	AUFNq6tEAnUr6c371sqXOXdLmAj9HNUCUKUxwt4Q0BEVJ9U9XHRBtv3TYWPn++KKBiX5
	K7+Lt4tfxj2cNGjE8NF+TLv3TzwABxWgRFppO0rIFcvS9F17ILX5hdOO9GDCZeDvIII1
	68lg==
X-Gm-Message-State: AJcUukfvSsvQ2WP08u0KJwvma1btK+Nc28aN/8odn07NFgIHgOB4/HU5
	ZcSbl+6l8JS2fpA7BlCuDywfYK3KRT8=
X-Received: by 2002:a17:902:292b:: with SMTP id
	g40mr13124977plb.82.1548458970450; 
	Fri, 25 Jan 2019 15:29:30 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	l185sm36453095pfl.54.2019.01.25.15.29.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 15:29:29 -0800 (PST)
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<20190125214926.3204-1-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <02a680e1-c20c-2ecb-2926-6250fddf9e76@linaro.org>
Date: Fri, 25 Jan 2019 15:29:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125214926.3204-1-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] target/arm: fix AArch64
 virtual address space size
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
X-TUID: UZEAr04VRqte

On 1/25/19 1:49 PM, Rémi Denis-Courmont wrote:
> From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Since QEMU does not support the ARMv8.2-LVA, Large Virtual Address,
> extension (yet), the VA address space is signed 48-bits. User mode can
> only handle the positive half of the address space, so that makes a
> limit of 47 bits.
> 
> (With LVA, it would be 52 and 51 bits respectively.)
> 
> The incorrectly large address space conflicts with PAuth instructions,
> which bits 48-54 and 56-63 for the pointer authentication code. This
> also conflicts with (as yet unsupported by QEMU) data tagging and with
> the ARMv8.5-MTE extension.
> 
> Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ff81db420d..2ccd04b8f7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2503,7 +2503,7 @@ bool write_cpustate_to_list(ARMCPU *cpu);
>  
>  #if defined(TARGET_AARCH64)
>  #  define TARGET_PHYS_ADDR_SPACE_BITS 48
> -#  define TARGET_VIRT_ADDR_SPACE_BITS 64
> +#  define TARGET_VIRT_ADDR_SPACE_BITS 47
>  #else
>  #  define TARGET_PHYS_ADDR_SPACE_BITS 40
>  #  define TARGET_VIRT_ADDR_SPACE_BITS 32
> 


This doesn't really conflict, as this doesn't affect much besides the sizing of
the PageDesc for page_find.

It's true adjusting this is worthwhile.  The current setting requires 7 levels
(6 * 10 bits + 1 * 4 bits), whereas a 48-bit address space only requires 5
levels (4 * 10 bits + 8 bits).  Even for LVA it will be (4 * 10 + 1 * 12 bits).

This will both save memory and reduce the time required for TranlationBlock
maintenance.

Your choice of 47 is wrong.  This value is also used for system mode, and the
kernel does use the negative half of the address space, so we need to have all
48 bits here.


r~
