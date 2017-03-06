Received: by 10.25.0.147 with SMTP id 141csp1564907lfa;
        Mon, 6 Mar 2017 13:41:53 -0800 (PST)
X-Received: by 10.55.81.10 with SMTP id f10mr16165436qkb.171.1488836513033;
        Mon, 06 Mar 2017 13:41:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5si15689776qki.175.2017.03.06.13.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 13:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cl0O6-0003Uy-Ej
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 16:41:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cl0O3-0003Up-RU
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 16:41:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cl0O3-0000zR-1R
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 16:41:47 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:35418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cl0O2-0000z8-Qt
	for qemu-arm@nongnu.org; Mon, 06 Mar 2017 16:41:46 -0500
Received: by mail-wm0-x22d.google.com with SMTP id v186so75079789wmd.0
	for <qemu-arm@nongnu.org>; Mon, 06 Mar 2017 13:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IUACubLIv9Nw8UH1yZ0uCrrWm1vM0dpxmzrelEogqms=;
	b=ghmFC9Sf1RRH3QYKPUzCfrYze9IWMTOWbvSopjIhIQ8343J/J4yzTilGn89S7zOpPp
	oW+pbZtf2I5+Yg82H6enMinI483+L2WxrDBRhYIwHcfjnpL0xw08kHHziafD8PEvUx5u
	Y3zyfrngyF74JUOmowAXNQg9gX3QYLNsVLsUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IUACubLIv9Nw8UH1yZ0uCrrWm1vM0dpxmzrelEogqms=;
	b=hq89J8CtGhc1cIcNvZKo8QbUXrgcs+tKh293VyNv7V0g8BsTZZy2eUO4/bEdTN8+ew
	c8gzdO9j1+Mz6ACxlJGXcdxX2MB6N4coCfyxMr1QXBT2VUhCA8rsHYcYCN3Lnr+LI7Nf
	PoVXunjX3/8K+xsjQ79aAzszhFYS5C5rXKljWg5S28Vu3tXMV+GMH7vp/8lYBqHRm210
	mbmJ1O2e6z5cQHIlNb8AHq0Z8jvdqMnuFf+unBCKL2FIKR3fJzAuWdEj4NkniZWLV8qf
	Mg/tGRGrxHH9BLMhOiBGMHNklHtU84elNDzIvKcNVBbDV+DkCxeU1qddxbtQNsHhSjm8
	YHZw==
X-Gm-Message-State: AMke39mS2Y3SkcmqAb9/eRRWOYMQ9c14sRTiK3kagiYwK4WEfHYpxk2IlJaLx2rxf1Wn7u+yuIjYSJVdOy2dmP7v
X-Received: by 10.28.150.194 with SMTP id y185mr13499852wmd.92.1488836505610; 
	Mon, 06 Mar 2017 13:41:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 6 Mar 2017 13:41:25 -0800 (PST)
In-Reply-To: <20170306170751.jr7cgwsz3yqq2kd2@kozik-lap>
References: <20170305214857.9510-1-krzk@kernel.org>
	<f441f1d9-b312-5f96-0fbf-53a46a8b16a8@redhat.com>
	<20170306170751.jr7cgwsz3yqq2kd2@kozik-lap>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2017 21:41:25 +0000
Message-ID: <CAFEAcA_w7i6NsHXUL+uGMyJDA7wH8s7=sXjboq_Y9oXxF_iGMw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/3] hw/arm/exynos: Convert
 fprintf to error_report()
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IeqbwvDaQckK

On 6 March 2017 at 17:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Mar 06, 2017 at 10:55:12AM -0600, Eric Blake wrote:
>> I don't see a 0/3 cover letter. When sending multiple patches, it's
>> always best to package them in-reply-to the cover letter ('git config
>> format.coverLetter auto' makes it easy to remember).
>
> The patches are trivial cleanups without any dependencies so the cover
> letter would be one sentence of "trivial cleanup". :)
>
> If that's the practice in qemu, I can send them, no problem.

Yeah, cover letter always for multipatch sets, please. We have
automated tooling that relies on this (and also manual humans).

thanks
-- PMM
