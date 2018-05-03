Received: by 10.28.4.212 with SMTP id 203csp2158134wme;
        Thu, 3 May 2018 10:27:05 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZozCbM+D7MiugE5iJohx6sQ43rO73AF8GJyqjstqk+Fxeet3IGgSTgui7IPy7b9frKblrYw
X-Received: by 10.55.102.75 with SMTP id a72mr19104944qkc.218.1525368425783;
        Thu, 03 May 2018 10:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525368425; cv=none;
        d=google.com; s=arc-20160816;
        b=n5mlCwKwatK4dYxC2TJc2c4tOECAV/sX/7zZ81CptM62R6dXtrg+4Mj0EtxWpQYnoo
         6w1jz7XmMwGvftRtpW9+VC8Ve8zhvXmukqW894vG9U8R4JQU2ZQ5nd6sbdGth4aNw+m2
         Dd30p3yap+GtKelBNWmFWSPdzGf772t4q8r1fovOyaAQhsiJhciLQ375iBR7ErsFG5s8
         MY2nIKRa/6u3L4L0PdBnOfN8sFnP/yyn+9XYtGI5zMW5y5j54qWfH7PV997ZJDrbfNTI
         dCAkVXKREeIdw0Z2eoKAHd6rhCW5kGB3pyPgCv48AK+UG79GKlp1Uz+f3GANId/vQ/iI
         //5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wm/5dIqiFCCqte1RnvxOd571dA2CR6F6f2H7r23khzA=;
        b=NRP3Ac8yBucLCXm9aGPO5tlQ4roJ5sHCZaJGPsf3txM0KSeipkQXrcwQ/2puG9Cols
         8qjgFBP5OSq7eJzBb6Kj4EORP3UMPsTlH7PVaBffMSveTxRZmUDfcH2dpAcQ6rjXg5Kx
         BjXtRbvn0G9znl4YT7C9EZCeWt2yWSDVzm2x+6C6drzb0rj3E7FeDiHB8ME3Dx7QSbau
         1LUCWGMr76dyqew1ipghwE0JsG4SAXT+U7RyAr8Wsce+hcQrXa5z6vAJPqkTJh1LW7t5
         ZYfXFkVoPTXsqPHqDD8J3ejQJWn/BFV5+E965ihLL44OXJwNQnfTnRFX05l6PMNrSnzP
         oUxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AGVeVivr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u128si720764qkf.206.2018.05.03.10.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 10:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AGVeVivr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEI0X-000594-9V
	for alex.bennee@linaro.org; Thu, 03 May 2018 13:27:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEI0I-00057i-R5
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEI0H-0000P2-Vb
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:26:50 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:37919)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEI0H-0000Op-OI
	for qemu-arm@nongnu.org; Thu, 03 May 2018 13:26:49 -0400
Received: by mail-oi0-x244.google.com with SMTP id k17-v6so16805001oih.5
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 10:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wm/5dIqiFCCqte1RnvxOd571dA2CR6F6f2H7r23khzA=;
	b=AGVeVivrxpiKO/gLapXwcnJXQ8mPBVUTOKgwzAk68YE/dF9cOElt5qJqLZsSdiR5JW
	V8pnLAD71wDeuR6g4syENJR+Rv1jnpHKIGtAuJKe49IVL0alQGCX2HPVRlEZRI8GSgMG
	ADr9BExrrNdJGA09L7Fb0BupZPPT3FT9uGK8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wm/5dIqiFCCqte1RnvxOd571dA2CR6F6f2H7r23khzA=;
	b=q8tfeofJEsQwXdqETSyMFHJPpDQI6FZMMWpFtAVRTdwd+gp6Dilca7hBV52xZupypU
	8N7L7xaHCbBBsOehAe35SyZ+gKHjoPww6P3UD0mjp6OU4gibPAHehBbUchhqULQapGKU
	/3YBbZdStIiAjXpK1tynvegrv2FrJwhbFaiFEmk7tUnCTPMnOVRHvGXbamYHXDv6qurZ
	SgAY9Rcir6KQmOADf/jwZu0pgBmq6AyEG8sldPOYIcy5xgBsjdxrzXttH1LqtjAa9aDm
	71Bv4r0BEBZ+P/rvoTqPOut9BkLRhtO8P8lTePAglSLjTwSGoRPnT+DHEDR62ICXiHtw
	hc9g==
X-Gm-Message-State: ALQs6tAzU8PV1TiagG0LNWe3xeIohas5y0fqzvmK+/VXlLCKCR6oL6XI
	PhMGtpTECwKa/rtll1stEhzH2KP239SyxWv2O+RYjg==
X-Received: by 2002:aca:f141:: with SMTP id
	p62-v6mr12937042oih.80.1525368408994; 
	Thu, 03 May 2018 10:26:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 10:26:28 -0700 (PDT)
In-Reply-To: <1ad8ffc6-5549-99bf-940f-6734c579e354@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-5-richard.henderson@linaro.org>
	<CAFEAcA-wq3kasUe8pkdUJXNJYNnLABrPgeQE4fokSLL995SFkg@mail.gmail.com>
	<1ad8ffc6-5549-99bf-940f-6734c579e354@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 18:26:28 +0100
Message-ID: <CAFEAcA_gPP80BdfhExzHksJyf5KhbQtMH=bGypW4C9uy=fm9jg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 4/9] tcg: Introduce atomic helpers for
 integer min/max
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xv0v6J5FCoFi

On 3 May 2018 at 18:13, Richard Henderson <richard.henderson@linaro.org> wrote:
> On 05/03/2018 06:26 AM, Peter Maydell wrote:
>> On 27 April 2018 at 01:26, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> Given that this atomic operation will be used by both risc-v
>>> and aarch64, let's not duplicate code across the two targets.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>  accel/tcg/atomic_template.h | 71 +++++++++++++++++++++++++++++++++++++++++++++
>>>  accel/tcg/tcg-runtime.h     |  8 +++++
>>>  tcg/tcg-op.h                | 34 ++++++++++++++++++++++
>>>  tcg/tcg.h                   |  8 +++++
>>>  tcg/tcg-op.c                |  8 +++++
>>>  5 files changed, 129 insertions(+)
>>
>>> @@ -233,6 +270,39 @@ ABI_TYPE ATOMIC_NAME(add_fetch)(CPUArchState *env, target_ulong addr,
>>>          ldo = ldn;
>>>      }
>>>  }
>>> +
>>> +/* These helpers are, as a whole, full barriers.  Within the helper,
>>> + * the leading barrier is explicit and the trailing barrier is within
>>> + * cmpxchg primitive.
>>> + */
>>> +#define GEN_ATOMIC_HELPER_FN(X, FN, XDATA_TYPE, RET)                \
>>> +ABI_TYPE ATOMIC_NAME(X)(CPUArchState *env, target_ulong addr,       \
>>> +                        ABI_TYPE xval EXTRA_ARGS)                   \
>>> +{                                                                   \
>>> +    ATOMIC_MMU_DECLS;                                               \
>>> +    XDATA_TYPE *haddr = ATOMIC_MMU_LOOKUP;                          \
>>> +    XDATA_TYPE ldo, ldn, old, new, val = xval;                      \
>>> +    smp_mb();                                                       \
>>> +    ldn = atomic_read__nocheck(haddr);                              \
>>
>> I see you're using the __nocheck function here. How does this
>> work for the 32-bit host case where you don't necessarily have
>> a 64-bit atomic primitive?
>
> It won't be compiled for the 32-bit host.  Translation will not attempt to use
> this helper and will instead call exit_atomic.

OK. Can you point me at the code that handles min/max atomics in that case?

thanks
-- PMM
