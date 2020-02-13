Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp121436lfp;
        Wed, 12 Feb 2020 19:49:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6QA2wv2f7hi6f8QXFlra/qHzBTzizApxhfaA3aj1qdzw9guuuwPKRoHNuHHv8KkaElarO
X-Received: by 2002:ac8:65da:: with SMTP id t26mr10002396qto.5.1581565790789;
        Wed, 12 Feb 2020 19:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581565790; cv=none;
        d=google.com; s=arc-20160816;
        b=VMYNVUBFxCEJZ/w5qjbe2QQOhyBqUuUvLePH6b8ZIWb7lSa+3JlP0EPb81I/cgpuE8
         wTrxqYfCjgN8EKaxkuU9+CXHAleFrv1DG1uW3QJ6BrCUaBSFQZhp0lcT00BVENEY7OMU
         gQ1G+6fS/hBEXvKFSOQWmhemt6mzkZYe94lfkvFkSA6s1j017X9AGTN6xhHkTnSu3vMu
         HcfGA24B7eA3zywugzY2vfue8vYeiKvZpi00/iwAiT8FASRAO3OqvoG+I2IaGnzGSU8F
         T0lPGxXtgaPVHzE5alUI4Xp+H8j1AQyQWsasunA2a4qYvqcROGckAv/KRuEUyMv02Nk0
         3kAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=47Mm1myGpPPW+ruwkT/I7EdLKcI7mHHjG7F+OyG5zcY=;
        b=nZKxUomVHnFmMVpQU9ubNRPRfbiuvaE8D2ycjt/Yo+5Hqkp+I0Wsih7OQ64nX2exuX
         6uLhL60OF3BASVJlzZy4AfcPuWTXb7bfAatGqjpiHywLGPRV6pgcwny4YdzPMb4qvZtE
         gPxBRe4WGGCb6L+k2Dc8+71Bmbn8XjmPP1JfOQQp+sgSO/tpipd/LBduaa3npDrn4NeO
         s++TG8XxA21u/6gOjVLgFfdmKCuF8LcFQfHM/BPwJ9w1dm3kYzi++HMYPw9fXma3vn55
         sEzrg7ScICLrahA7Bq7C8DwJmKTvkB/6E/37i5WIae13TQpw8HKdVqXPY7DwnoLLc6PX
         9iGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bO9TiYDt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si581730qtq.169.2020.02.12.19.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 19:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bO9TiYDt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j25Ve-0003Hq-8N
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 22:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j25VT-0003HD-Ss
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 22:49:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j25VS-0006f4-Ln
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 22:49:39 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29017
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j25VS-0006dM-Hi
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 22:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581565778;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=47Mm1myGpPPW+ruwkT/I7EdLKcI7mHHjG7F+OyG5zcY=;
 b=bO9TiYDtoHhRFTF9wGzBjtFaqL/j1niz+K5yrO6hAZMlG+sefQPf+EBI400TLdVWdD/gdE
 P4cp3N+5TtS/Or3YoHe5vRrBR25YdgsD6MRHn0wgR5MLo4qChviHBkPurJChQ5XGRVsipo
 x81WiSRQ2ObXMcDDLrHWjWLTRGlIPxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-lpd9mqrfPjGyNrAGruFQdA-1; Wed, 12 Feb 2020 22:49:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BD8613E4;
 Thu, 13 Feb 2020 03:49:31 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-95.bne.redhat.com [10.64.54.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7B060499;
 Thu, 13 Feb 2020 03:49:24 +0000 (UTC)
Subject: Re: [RESEND RFC PATCH v2 1/2] target/arm: Allow to inject SError
 interrupt
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200205110541.37811-2-gshan@redhat.com>
 <8dce7dbe-c6c1-122a-f960-0fc29257dd1c@redhat.com>
 <CAFEAcA-RiVfrFFkxppB=z8x76rjorF-5onyGwVAdsHY7W1U88g@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <21e4051a-4d06-03cb-6d8e-5331b5b570c4@redhat.com>
Date: Thu, 13 Feb 2020 14:49:21 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-RiVfrFFkxppB=z8x76rjorF-5onyGwVAdsHY7W1U88g@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: lpd9mqrfPjGyNrAGruFQdA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kf40hsAlEsZW

On 2/12/20 10:34 PM, Peter Maydell wrote:
> On Wed, 12 Feb 2020 at 06:39, Gavin Shan <gshan@redhat.com> wrote:
>> On 2/5/20 10:05 PM, Gavin Shan wrote:
>>> This allows to inject SError interrupt, which will be used on receiving
>>> QMP/HMP "nmi" command in next patch.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>    target/arm/cpu.c    | 11 +++++++++++
>>>    target/arm/cpu.h    | 12 +++++++++---
>>>    target/arm/helper.c |  4 ++++
>>>    3 files changed, 24 insertions(+), 3 deletions(-)
>>>
>>
>> Hi Peter, could you please take a look when you get a chance? I'm not sure
>> the implementation is good enough to inject SError. If there are somebody
>> else who can help to review, please let me know so that I can copy her/him
>> either.
> 
> Yeah, this is on my list to look at; Richard Henderson also could
> have a look at it. From a quick scan I suspect you may be missing
> handling for AArch32.
> 

[Thanks for copying Richard Henderson]

Yes, the functionality is only supported on aarch64 currently by intention
because the next patch enables it on "max" and "host" CPU models and both
of them are running in aarch64 mode.

https://patchwork.kernel.org/patch/11366119/

If you really want to get this supported for aarch32 either, I can do
it. However, it seems there is a long list of aarch32 CPU models, defined
in target/arm/cpu.c::arm_cpus. so which CPU models you prefer to see with
this supported? I think we might choose one or two popular CPU models if
you agree.

Thanks,
Gavin

