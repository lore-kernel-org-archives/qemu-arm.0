Received: by 10.25.21.96 with SMTP id l93csp160542lfi;
        Fri, 1 Jul 2016 01:03:25 -0700 (PDT)
X-Received: by 10.55.188.198 with SMTP id m189mr23630797qkf.205.1467360205709;
        Fri, 01 Jul 2016 01:03:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x185si1946721qkc.165.2016.07.01.01.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 01:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bItQ5-0006dj-4u
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 04:03:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bItPw-0006dX-53
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 04:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bItPu-0005fc-Ae
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 04:03:15 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33742)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bItPt-0005ev-Pz
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 04:03:14 -0400
Received: by mail-vk0-x235.google.com with SMTP id k68so56851094vkb.0
	for <qemu-arm@nongnu.org>; Fri, 01 Jul 2016 01:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=L2KwAZPCsMtnYlWpwWZWiBPyv3SRZRqdEZzgz+wnXIM=;
	b=Vqtatxyr4LPuiAiuXsBzKoEVQseaamuIi57HEvs9xjwVm+QarBaFQL71BurPuFoQ7w
	vGQYzPHgH4ygi5a6xVZvTlzaNyEap0QHZPhYclpwK9NgOcFWjEC3Z21gPj17OB8hK/t/
	C/NzpW2ve0J8dfKkc6oE7SiZHPj7ux7kIzXUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=L2KwAZPCsMtnYlWpwWZWiBPyv3SRZRqdEZzgz+wnXIM=;
	b=juSkGXO9hGmOOY7yhDOclHVV/IWYbzUshMSA9xk8pVTtqesxJvovNGQ9fyfp0Jkp75
	oNIgq+vEiKX5QxpQunJackIVOPiGFimBdO4ixgsKLu0QNeou0AIICBERHDWYugzV44pS
	lbmDodRkeqRcyZsXSfL6T3Omi3S/DRWO59a9OMbfzupXCufO/XTHEfJx+1CYPLvWIn3T
	5QBqVunn1hfxMnHTOV52qTJUSKBi+wXQlN8Umo0woo99AQDizPNE8OKbd4Apul23o0q0
	UbfpLqu1UavDlE3UzLAFzO5RnnTdX89c/EzeUNeYoDCs8HNk1pO9CY+tCaKURA4DhHjD
	3WaQ==
X-Gm-Message-State: ALyK8tKGf2vAmycNyhqi7cShfiWkraJd3dqi9J2asiyVaLERqxbKMuSDwWVspHYiFRoNCtYWdYDik0qBZJNQUhCZ
X-Received: by 10.176.69.138 with SMTP id u10mr8723870uau.24.1467360193010;
	Fri, 01 Jul 2016 01:03:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 01:02:53 -0700 (PDT)
In-Reply-To: <4c195494-c97a-29e5-f5fb-88e26e71ae13@kaod.org>
References: <1467301824-10123-1-git-send-email-clg@kaod.org>
	<CAFEAcA_iAVMPNxi8m=uv9OTGoHqxg8egsLT+SN=YFJA=tS4B9w@mail.gmail.com>
	<4c195494-c97a-29e5-f5fb-88e26e71ae13@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 09:02:53 +0100
Message-ID: <CAFEAcA-xQ7Y=LPMweCU4yxLr7Mk5t0yy7SXX3=u2rGvAi7VA0w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/misc: fix Aspeed SCU hw-strap2
 property
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7Dsw/hwbQwU

On 1 July 2016 at 07:11, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 06/30/2016 08:24 PM, Peter Maydell wrote:
>> On 30 June 2016 at 16:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> These strap registers are complex enough, let's not mix them.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>
>> Was there a cover letter for this patchset? I can't find
>> it in my email...
>
> Ah :/ No, I didn't send one as the patches were small and self
> contained. Should we each time ?

The basic rule is that single standalone patches don't
need a cover letter; a series with more than one patch
should have a cover letter. Some of our automated tooling
gets confused otherwise (also I like to be able to have a
single email to mark for attention in my mail client).
These confused me a bit because they had the series
indicators in the subject (1/2, 2/2) but no cover.

thanks
-- PMM
