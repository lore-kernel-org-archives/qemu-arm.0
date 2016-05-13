Received: by 10.25.208.137 with SMTP id h131csp263082lfg;
        Fri, 13 May 2016 09:57:05 -0700 (PDT)
X-Received: by 10.55.4.131 with SMTP id 125mr2685818qke.86.1463158625789;
        Fri, 13 May 2016 09:57:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p28si4964428qki.93.2016.05.13.09.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 May 2016 09:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1GOf-0003Pe-DU
	for alex.bennee@linaro.org; Fri, 13 May 2016 12:57:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1GOa-0003JD-SE
	for qemu-arm@nongnu.org; Fri, 13 May 2016 12:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1GOV-0004B4-MY
	for qemu-arm@nongnu.org; Fri, 13 May 2016 12:56:59 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b1GOV-0004Au-C2
	for qemu-arm@nongnu.org; Fri, 13 May 2016 12:56:55 -0400
Received: by mail-vk0-x230.google.com with SMTP id f66so144592925vkh.2
	for <qemu-arm@nongnu.org>; Fri, 13 May 2016 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+YRlyIUiaxLhbdTiwWrHiuJyTAuhsvKky1R5aF2NOlA=;
	b=Di4NnM190sBIUYCTHkhGq2T2fndxomTIJmPNdPUfinh4s/3GTuAtg2itIJWA0YT235
	n7CRwzluxM7DoEhAdrjplzPWedS6yUUZ+o+hv1dI3Mzv3LhDvx9VuQ5/LEDuhKgMzkci
	MxtzsJD6k3x6BW62BffkMxPuBW8TD/K7XOwQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+YRlyIUiaxLhbdTiwWrHiuJyTAuhsvKky1R5aF2NOlA=;
	b=ZOHudrgdrMivYM1ZN7RYfcAbxKJarsVktHXSnJjS8itGAbK2LSt3zX9t+RMAzG9SZE
	IHaTsktulZ2Pqkqk/pnFq+YxeVu52oo0g1SWb+kybquRCAqTnB0CWaMZwp0FnXleSR+G
	W6gZZwDKE80m8mAzoJSKtiHSsUGJlFTEUv1ygJs+g9mgjN9sXpsUgyG3yDY9Y2SVxQXa
	HeufLoVagxDsbJmNpv+KqBqU6xwXJkTytW3hoh6TGsuGXZXKgxYXqj4BEJhMUW/8EIY/
	QUcwe/VEwkjscrJlVkJfbn3P1Q12HXeJUOsHC5+gNGY0K1EZBJqf7z+MOcMT6ah7AcwF
	0ARw==
X-Gm-Message-State: AOPr4FVcntP7cMm9JqAZrjkUYMlo5o6H13o+IcD6LJdVtmwlHNnLQ2P37vR/Yz3WpQ5frnAiPPw5lufUVQZRG7KG
X-Received: by 10.159.54.232 with SMTP id p95mr7325431uap.107.1463158614573;
	Fri, 13 May 2016 09:56:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 13 May 2016 09:56:35 -0700 (PDT)
In-Reply-To: <BLUPR0301MB203455969C9F25DB4CCD43849E740@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <BLUPR0301MB203455969C9F25DB4CCD43849E740@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2016 17:56:35 +0100
Message-ID: <CAFEAcA_-tzkqp4FBu4EiF9h42zRB412PkpBJdY5wGvM-nMVbVA@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] Shouldn't cortex-a15 enable ARM_FEATURE_EL2?
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
X-TUID: v4Q6KAR3151h

On 13 May 2016 at 17:41, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
> I'm trying to use the MRS/MSR banked register instructions you
> recently implemented, but found that they raised an undefined
> instruction exception on the cortex-a15 CPU model. This seems to
> be caused by the check in msr_banked_access_decode(), which looks
> for ARM_FEATURE_V8 or ARM_FEATURE_EL2.
>
> The quick kludge below worked for me, but I don't have high
> confidence in its correctness -- the CPU supports the virtualisation
>  extensions, but I've no idea whether the rest of qemu is consistent
> with enabling that feature. I guess you have a better idea?

Yeah, this came up earlier this week in the context of the A53
and A57:
 https://lists.nongnu.org/archive/html/qemu-devel/2016-05/msg01006.html

The short answer is that EL2 support isn't finished yet, and
I don't want to enable the feature until we have something that's
complete enough to be able to run a real guest that uses it.

thanks
-- PMM
