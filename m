Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5501428lff;
        Tue, 14 Jan 2020 05:23:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqySCjzUe0+3AkujEuE0bAtlSQo0kxCAnQnHaDCURIGqdYuvHA/Hl6iW9bGTqMuHJlH2iVJU
X-Received: by 2002:ac8:2fae:: with SMTP id l43mr3545922qta.118.1579008187421;
        Tue, 14 Jan 2020 05:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579008187; cv=none;
        d=google.com; s=arc-20160816;
        b=My4Llxp4AMXxk2q46oUhOWn1HEFqfnANxebcKl7aB5wGvsvApS8HCqnRDNJ2u9lcCM
         jIjXbWj5ZQTL3+eidZxIk3Ort2sW5jtKbLCM9gAsQ5//CcRY/C16SYCahGStYw099I9u
         5YLBgrYICOuNxqer0ad0lMbOHZDbTog/I19PSlp1rS2PihlNqCfCOnxzddFIcYEkGB6u
         2nFkYLGi7SXb0iPs/EPaTwD4Emg1UVWkG3krpOibcwqKmDq2734UfVfjbxRl/DGznnM4
         gH8PlN7Ocb544wMTwDgpoYVCekRboyy/FZXuRD43cn8MBMwBXUnTy1xE1dxQ+r8qNdFc
         Ah5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=pAxWsE1gRGx/4cmg4hEreYC/KKFC1pnVmIAxEdwVujk=;
        b=En6zFnyAiwhcNALdtD/gduNlU3MTh2UYi4mhoLFdaKXO/4OEEeQB1XHLyWJbJiReC/
         lm+LU6keraQ92uL3BGrjMRJXMlSnf10n2ynIwToLeGJiaccwu5PDhwkpUhHmgMTTXwAC
         0Rw5BhKdDeT5emuheX8byFvWcV66+nlp0Gnj1TYxqMjcbbiDxtPksYLdGfW+LijjwOsx
         ZTszATln10llIwsNeuIRzBoWfvL/xr7lTs25KTdBTRV+Q58WCHkh6beJ7YeIh8wqJFAl
         vUtG3IEYyn52j/6dHiPNDoN1qOdVUlyKYnD5C16Svcxn9TEn8gFJJW0yshRUoOl13W4H
         2VMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb14si8110943qvb.50.2020.01.14.05.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 05:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irM9y-00050b-Gu
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 08:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1irM8k-0003iy-D6
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 08:21:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1irM8i-0001WE-Jw
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 08:21:50 -0500
Received: from mail.dornerworks.com ([12.207.209.150]:17960
 helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>)
 id 1irM8i-0001Vp-FN; Tue, 14 Jan 2020 08:21:48 -0500
Subject: Re: [PATCH] target/arm: adjust program counter for wfi exception in
 AArch32
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20200110180211.29025-1-jeff.kubascik@dornerworks.com>
 <7f45c4a2-0192-aaaa-8d0f-7ea7890ca448@linaro.org>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <879fa44b-a405-e1d6-eb3f-90216f5d3385@dornerworks.com>
Date: Tue, 14 Jan 2020 08:22:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <7f45c4a2-0192-aaaa-8d0f-7ea7890ca448@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 12.207.209.150
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qR/16FfM/WWR

On 1/13/2020 9:41 PM, Richard Henderson wrote:
> On 1/10/20 8:02 AM, Jeff Kubascik wrote:
>> -        env->pc -= insn_len;
>> +        if (env->aarch64)
>> +            env->pc -= insn_len;
>> +        else
>> +            env->regs[15] -= insn_len;
> 
> QEMU requires all braces.  See CODING_STYLE.

I received an automated email from Patchew regarding the coding style issue. I
have submitted a v2 of the patch with this correction yesterday.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~
> 

Thanks!
Jeff Kubascik
