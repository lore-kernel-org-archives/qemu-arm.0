Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp518421lfi;
        Mon, 18 Nov 2019 12:05:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7oOSrjCOPLDoHqaLg664b5nuKESF/MpebnXBX7X0blrqUIeQGnNEIjbTiC8QCbduxAdYG
X-Received: by 2002:a0c:ff0b:: with SMTP id w11mr26797282qvt.77.1574107521414;
        Mon, 18 Nov 2019 12:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574107521; cv=none;
        d=google.com; s=arc-20160816;
        b=sMBHeeIdrpBVBJyvRmJPw73NeLH/nMDoZHgVA/ZM/oR8GidFBsF+KFKVH9h0rQiTZs
         JddPjl2V/M5a3c+FoQFgtTRp1bPRZfFtX5BRDeNkUpAA/Ap2o4eNkCXttG3d/PKC7sai
         /NkFGC/I2w2QG+N8LzUejJonxUma3oCBfg2ba8B7X8E5ATmiT/9Hh5ENzt0osBz5SceI
         VjQCq5wSP3R5Ut5v0jxVSVxxMs5Qd4bXlWCV03n9SBycsh0+uHL0yZqBppCj8E12u2aF
         6BiHa2UOOz/6eSRI506EnOKMCupjf8bHjmO8JqF07oneMeZC3fMjTi1wd3iPsmcjMrGS
         Ts/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=04ci24EeRYTWH7l+QmBmuamObYeLeSO4tTq/kd8kSDs=;
        b=L7zWBwdHW9xMBxVoJMBMRiY/B3IZIvhGni13nmPeQ77KDWZMs8/apJJJkmS0SVRuC2
         OkEjk9oEsMLpCUb0d41GNmX/TIpU5ddfVyuyqxVjRx3zlEIWqwMTCRN0k6b+kQAWxlEK
         19NrY00mEgvt6+ZfH+vJ2x7QTvW507NxpQwEyz2xg8cvJmW0LrRIQAzrhooZf6bFR4bM
         hwd9eCWVHJznaZrrBRauNgraQ9TgJFZVPx/drOsxj8WHBh3y1A8hqZUAQlH5kNUrK9Dq
         Su2p7oORsAuRHdOVzyJ3eeCNYRcM0pLLFQ1hBQaVmKqgKxuSZDUx9mlPHqTOtkWcSR1V
         2QLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Juutc0uA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o56si12641961qtc.173.2019.11.18.12.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 12:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Juutc0uA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWnGy-00039t-QJ
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 15:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52471)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iWnGo-00037D-6L
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 15:05:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iWnGm-0005T7-Qf
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 15:05:09 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40465)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iWnGm-0005So-Jk
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 15:05:08 -0500
Received: by mail-wm1-x343.google.com with SMTP id f3so684988wmc.5
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 12:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=04ci24EeRYTWH7l+QmBmuamObYeLeSO4tTq/kd8kSDs=;
 b=Juutc0uA2MATY3pl+UmG1kZ0IcIO1JSoZZ7QWztUJrLg+yn2pXTIl3jR7yLWhRfPuK
 3awv4TgjAKekPhaaGSI/pRrANfCfN+dmzSTz3UBR4z9zDTF5W7vy9l2Pt8p1XGNLXFBi
 Es6fh0aCXKALYqHx8CZPkfEUW3Eu9nIi3zmtGf1EHfE5ZKOnUTLv6ar49iP+ycX/2DlL
 gmPxlGFmWJMKPYiR3d0iGdEPq1FbEUTiw2zxxONkG5OcohaViYco+UN1tOagkiSjwJQV
 CPUBwkiUY9TmCw/ln4SZWcBW0ZGqedHSIBWMp+NO0E81ro6cFKp6fRZAxKKE2QH4AfBW
 oRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=04ci24EeRYTWH7l+QmBmuamObYeLeSO4tTq/kd8kSDs=;
 b=IIjC5/GCgbfbuDbHJReZNzpKpqgTzn7ck3+deGX9lGGcBZ3PxOu1x1zon5feGCdxPJ
 ++XEhXw3GO6QgyBGVRpqsqXmQq4inhlQ2wkQLMpYuoKuqkwS46fBh6JXGeJ6nyJxson2
 dXlkN22olpwohtKL34kzYezCu8RsUz359+ASiZ90nkrkIjQDeP0Eo8nZSc8dntorJWJV
 eOGTZlFNme76MfqDqxCOP2I9vg6Ut2u992NuuOoiK2rlCS0BjVDPjO8CSY9/d5pQhDI4
 wqGrZ4ODeUrrflnkI5UzejPOiYP9Ou97jYEza5cC1Eoh+EuJ7+9FIzuEveB3iqGPHbXj
 p6qA==
X-Gm-Message-State: APjAAAUl/ghmlJbjruYGCkercZzeAjUE9rKXCyf3nZwFbpK8ZPLHTBG9
 EOlUZ6DWgTougTCcflL3o6MBf9GyHqlcZA==
X-Received: by 2002:a1c:113:: with SMTP id 19mr1220652wmb.42.1574107507276;
 Mon, 18 Nov 2019 12:05:07 -0800 (PST)
Received: from [192.168.8.102] (65.red-79-149-41.dynamicip.rima-tde.net.
 [79.149.41.65])
 by smtp.gmail.com with ESMTPSA id t185sm500610wmf.45.2019.11.18.12.05.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Nov 2019 12:05:06 -0800 (PST)
Subject: Re: [PATCH 0/4] target/arm vector improvements
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191017044232.27601-1-richard.henderson@linaro.org>
 <CAFEAcA-36SCWn+FNgNiB_JbOJvYxpHa9S-gOVFH__xgGm2+cXQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9c88496e-ab0f-b0d4-d6e8-3380fb083f80@linaro.org>
Date: Mon, 18 Nov 2019 21:05:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-36SCWn+FNgNiB_JbOJvYxpHa9S-gOVFH__xgGm2+cXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zY+/Q2feLufi

On 11/18/19 5:26 PM, Peter Maydell wrote:
> On Thu, 17 Oct 2019 at 05:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The first patch has been seen before.
>>
>>   https://patchwork.ozlabs.org/patch/1115039/
>>
>> It had a bug and I didn't fix it right away and then forgot.
>> Fixed now; I had mixed up the operand ordering for aarch32.
> 
> Since Alex had a nit on patch 1 I'm going to assume you'll
> respin this series once we're reopen for 5.0 development.

Oops, I forgot about it.  Yes, we can postpone to 5.0.

> I think we have two plausible choices for DIT:
>  (1) don't implement it, since we can't make the timing
>      guarantees it suggests
>  (2) implement it but not actually change our behaviour:
>      this is technically a lie to the guest, but it means
>      that guest OS handling of the PSTATE.DIT bit etc can
>      be tested
> 
> At the moment we by default do (1). I think we should
> probably postpone doing (2) until somebody actually
> asks us for it.

Fair enough.


r~
