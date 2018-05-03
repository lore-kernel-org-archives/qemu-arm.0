Received: by 10.28.4.212 with SMTP id 203csp2207951wme;
        Thu, 3 May 2018 11:20:16 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp6vcoMLk41ra5CjC8aTzla+ADpObbXt4t0IO2x1MGM3V8DsuTFgDr0kp4+Z0Ru0gP+DAdZ
X-Received: by 10.55.87.65 with SMTP id l62mr4219497qkb.204.1525371616649;
        Thu, 03 May 2018 11:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525371616; cv=none;
        d=google.com; s=arc-20160816;
        b=H42wA6tibw1FhQVhTxOaQnOa/SkhEAU0L1gLXTLoKD3HddjxWEGwRUgeUg2X25cF7Q
         jTh+JvMH8KlS6KVpYUZNzOcpZCxeojIUbaAVKjQZimNPDdUe/AUC6mf6O91tyLc57Mhd
         en9WkHuzdopWt5I+uWbv6g/uxS3NdFVtRv99bEa/0h4XXQeeNopJYFnQL59t4SVzmzwg
         G0tfrdc/6hFbwnzA5WnKxkcoIrYP59kIpkC9cQ/ik55nbmyy3iVNsa4UeUWxXRucT1cc
         GVEfOaBFYGzMIP0+hAmnDY2HkQSwsu20qhYUFPlwchsDAjPJjyMFZMp1itkXHXwFFMwU
         xapQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=kwLc2pxfPhIhMZ1Qzqwl8DCQNGTs4beZD30x8zXA9j8=;
        b=zuAIctmNgPvCrWgbLo+WxwHzaTEx5bCPZPvaQpG1OnfGIoQpo6Cxlgr5cpabIQ8dNJ
         EBNyeDYRuTEmST7cfPcKhasr8uq2w10eyKDoYmyLN6vxAtXPPHNpS48lbSGVqbuxw0p3
         u22mPh87ln6KW8ECetXGvVJ4CIIVBB+IlJ0TqjiXQF9/GssL+mHMCUYk7SDTcxAOn3UZ
         zfQc4gJNMraL2/f7VxP8UvPFaUfR7+0yED5ks40Q1xqDbLht+bFA/DN6Kual8RPQa7b8
         UNVsm/UmnPJFHnqwsxiI+fxkAHjpYe19ziQ7ju6I9BI9E73CzQ8UsAKXxF9a5lYGYG1h
         ceVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zt5nAbQd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a8-v6si125843qti.315.2018.05.03.11.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 11:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zt5nAbQd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEIq0-0001OV-4x
	for alex.bennee@linaro.org; Thu, 03 May 2018 14:20:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEIpp-0001Mq-Ad
	for qemu-arm@nongnu.org; Thu, 03 May 2018 14:20:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEIpl-0007qY-AL
	for qemu-arm@nongnu.org; Thu, 03 May 2018 14:20:05 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:39892)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEIpl-0007q5-5x
	for qemu-arm@nongnu.org; Thu, 03 May 2018 14:20:01 -0400
Received: by mail-ot0-x244.google.com with SMTP id l12-v6so21732298oth.6
	for <qemu-arm@nongnu.org>; Thu, 03 May 2018 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kwLc2pxfPhIhMZ1Qzqwl8DCQNGTs4beZD30x8zXA9j8=;
	b=Zt5nAbQdYTZ0q0iDeULs+tr++qhX+cYDo+EZRkO28gEqPrS9VtW6LnNnWuLlEuIuZo
	cfXz4luKw204O9hvfzdSwcIRTzRztfQxWH/TB0mL6/ADysd65n7a5kZtzMQ8zOXFAprZ
	223VZxIqdnNnjQulySShGgj143GvIMF2xi608=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kwLc2pxfPhIhMZ1Qzqwl8DCQNGTs4beZD30x8zXA9j8=;
	b=o9BtG5LC76Rgj23lDxE6PZM27OZborimdk99j1HpJ6dJ8W9Qik0Q00aC7SZPRoO8hx
	M75+Tji+78ClIU/bicpEBpYpO32lTOyO5V3yWf5L6zbAe2iVLqJ9g5E+/j1PHdXR38sA
	TW02vMfnpHmnInfm4+eCqw3V2mjvY6n1Y4gdHbZ+5RNxdh2znLYsTw7GTI7j8WeqCOv5
	cwrH7Vq3zUtTQ8nNKrngNJ8e7jNyiM7cJIgiujwmYDU4NrOJ+7S0pu/w+cLDK0a4MsGU
	imbTMH2gyza/x0uY/AFPnMwjjPrUeQHwsy7QpnapsfbCzRFB7IQg8r3orT88MyyLdHTZ
	e5qg==
X-Gm-Message-State: ALQs6tAXxyZGeSNfbHa+tQo2AxSGSD0Ks3uHnSXYxmk/EqblelMRAW0/
	QaneMjmVzXRJXyq+K1t5ZghVqHIHp1W5Sw+rg/U4dQ==
X-Received: by 2002:a9d:3bf5:: with SMTP id
	k108-v6mr17741886otc.308.1525371600617; 
	Thu, 03 May 2018 11:20:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 11:19:40 -0700 (PDT)
In-Reply-To: <41757507-1fff-e28e-9847-5e1a28d3b7ca@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-5-richard.henderson@linaro.org>
	<CAFEAcA-wq3kasUe8pkdUJXNJYNnLABrPgeQE4fokSLL995SFkg@mail.gmail.com>
	<1ad8ffc6-5549-99bf-940f-6734c579e354@linaro.org>
	<CAFEAcA_gPP80BdfhExzHksJyf5KhbQtMH=bGypW4C9uy=fm9jg@mail.gmail.com>
	<41757507-1fff-e28e-9847-5e1a28d3b7ca@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 19:19:40 +0100
Message-ID: <CAFEAcA_c3w=c4en19Qk+t7Bp4kmF6QVjeKBMaXPh7dF3bD-Nxw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
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
X-TUID: 9V5JBYbrsYUV

On 3 May 2018 at 18:39, Richard Henderson <richard.henderson@linaro.org> wrote:
> On 05/03/2018 10:26 AM, Peter Maydell wrote:
>>> It won't be compiled for the 32-bit host.  Translation will not attempt to use
>>> this helper and will instead call exit_atomic.
>>
>> OK. Can you point me at the code that handles min/max atomics in that case?
>
> exit_atomic raises EXP_ATOMIC, which leads to cpu_exec_step_atomic, which grabs
> the exclusive lock and then executes the operation in a serial context.  This
> is expanded inline via do_nonatomic_op_i64.

Ah, gotcha -- hidden behind a lot of macros.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
