Received: by 10.25.227.6 with SMTP id a6csp1462927lfh;
        Sun, 2 Jul 2017 14:01:10 -0700 (PDT)
X-Received: by 10.55.179.197 with SMTP id c188mr987116qkf.69.1499029270850;
        Sun, 02 Jul 2017 14:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499029270; cv=none;
        d=google.com; s=arc-20160816;
        b=miccu96YosCt4L33xfuAmbIniZqt9sh4i4pLtXpdQWGYwnCbWxK/BJe8ybU9hg9I79
         82gRyghiVGPwJYqgV+y6Y/Djmh3zYC1RN1m0YwsYWfo8/ncqqR2YPMshsgD30sDTBRgR
         9vK7xrqiHdN4Y+fTw+RKf3qQcNHTG8lgMbI42VwOgetStrEAWF7IiARk3AKXyHZldtPg
         RoKb0N4VQGBRwjYWVI+G8t1DApNVxLV1fiAYqoCJQpSLz/uaQjPbXlLSd8XUzaoP0j3C
         OLTCePau66junhBR7RzyMdquC5KyBVYKouLC5FkMOw56r1SdscarUTOIDFlY5pcFjoBG
         UhKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ElT1DhEVNcM2tYPN0JUDbxvmjn4Yv5G7Iv6xk8V4Fxc=;
        b=B8+2jiY0ZCNWyRZB2fuK/hyTKRS8wsQi97bgPLGPNHF1k6oR74yFN2AGzSvUdXWHSL
         nJlnfVlFAeZiLt593CX/oBAhCEHTUH9OEQv+Nljy0fuXS11Sc4Yb54h25bOqo6eHtHlu
         jz0bqODGjFuP5ytt9nbxy9Oz4UOOLhqjX+5jvJRh7jOHAa1hYtrcFOYUO9qA4hockYcV
         hitV3e1SLNaIMM1BF3edb1WdM9k3LtqOK919xGgiIaQgMHJJkJdmeg5MUP1bARYkBhBA
         uDdwHlEVonPfFoFt07S/WhlWCGVU6spRNHgpCD5NlzI/cvOxYXag5jlGUIHIaARVkRTU
         53/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=ha0WzuwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si7379971qtd.274.2017.07.02.14.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jul 2017 14:01:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=ha0WzuwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRlzQ-0002by-AA
	for alex.bennee@linaro.org; Sun, 02 Jul 2017 17:01:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dRlzL-0002b6-50
	for qemu-arm@nongnu.org; Sun, 02 Jul 2017 17:01:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dRlzK-0005bX-FX
	for qemu-arm@nongnu.org; Sun, 02 Jul 2017 17:01:03 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:36343)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dRlzK-0005Zg-7x
	for qemu-arm@nongnu.org; Sun, 02 Jul 2017 17:01:02 -0400
Received: by mail-wm0-x230.google.com with SMTP id 62so152010197wmw.1
	for <qemu-arm@nongnu.org>; Sun, 02 Jul 2017 14:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ElT1DhEVNcM2tYPN0JUDbxvmjn4Yv5G7Iv6xk8V4Fxc=;
	b=ha0WzuwLBA9smZZV/C3KlZviqmVp5p6mtvZKst11WU0VonKTFLRmA81tXNX7lOIj1T
	rUrnY7ceU1H4NInjAc8uVNh9q8Ojw0ayAAroRYITu3X12v4aiGTyu1L+V4CfTfPU5dw3
	FblxvS3D61yyxY7FaiNFl2h0jahytr274VHUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ElT1DhEVNcM2tYPN0JUDbxvmjn4Yv5G7Iv6xk8V4Fxc=;
	b=rxeLV5LbqS5249XeZ+/lqaWXtE6SHb9Kc367oIhwHAR5P3x9jR9ZyIi2U+KH6wCjsS
	f84cJjgQPndT6pjhOodwLEZ9Jl7oJ3/2lpao499U46/3B3Ey6dXIxDPqZG0yhSSj+z71
	gtV3upgAIwzXP8lMu6iCZtCTcoeHn3uCwDqNcDe3qmyKIWmcA4MsQP+YYFhAmxkpb3rb
	V4KkkE/93ojHeTcHpbWr6jrU7Ru6Zq+UCoWFCwj7hAca2CIaH40IlbmEL0wxfnt1NpQY
	oBdNGn9lhq8YcObAYl6ivuJiuQemqZI36aat9d5KGP3CpLxhJ94gsrUqsqpBVEfnjB2Z
	kLsg==
X-Gm-Message-State: AIVw110ZIfGToGfBig5AMcLE7mWZNUs0oDZkPpMBP5WZHAfEoeWqKSKZ
	uvKEDL4RDxJhaIkGBZI4XWu+/znmbD5O
X-Received: by 10.28.213.75 with SMTP id m72mr2569304wmg.41.1499029260743;
	Sun, 02 Jul 2017 14:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Sun, 2 Jul 2017 14:00:40 -0700 (PDT)
In-Reply-To: <CALHRZuosbYEcBYgjRu+45RZD6e7VWL5hQErAB7rJNEQ7ZdPguA@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
	<CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
	<CALHRZuoVHFOYV345JmvSkfJHsVjS7Wv_ySzAUtwo1D7eyoS_XQ@mail.gmail.com>
	<648515bf-ba1e-3d7f-d5bd-51b243f8c29f@amsat.org>
	<CALHRZuoihb2Oiu9adm=2gPUf-LFdkBR9qw1iV+ohL6kp0t5d=A@mail.gmail.com>
	<CALHRZuoFU6vmnEBobVEqesApB6qm6cmNQfm9oVMG2RaooNEh7Q@mail.gmail.com>
	<CALHRZuosbYEcBYgjRu+45RZD6e7VWL5hQErAB7rJNEQ7ZdPguA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 Jul 2017 22:00:40 +0100
Message-ID: <CAFEAcA8zxjMJN0Uv4L+vM5S8yw93GDbAh9xQxmrOESAxeAS_Rg@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 0/5] Add support for
 Smartfusion2 SoC
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tqn3eqhcL930

On 2 July 2017 at 18:39, sundeep subbaraya <sundeep.lkml@gmail.com> wrote:
> I figured out that systick uses cpu clock as clock source and
> system_clock_scale
> need to be set in msf2-soc.c. There is a bug in u-boot where it uses cpu
> clock as
> systick input but configures systick in external clock mode. I have tested
> the modified
> u-boot on real hardware too and it works fine. I am calculating
> system_clock_scale
> as below:
> If CPU clock is X MHz then system_clock_scale = (1 / X) * 1000
>
> Tested with different frequencies and they are yielding same results.

If you calculate it like that you'll probably get rounding
errors. Better is
  system_clock_scale = NANOSECONDS_PER_SECOND / freq_in_hz;

(Our systick implementation hardwires the external clock
frequency at 1MHz, but this is not really correct, it
depends on the SoC.)

thanks
-- PMM
