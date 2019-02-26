Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11014942wrx;
        Tue, 26 Feb 2019 04:30:42 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iboa328N809qsgXVi2eYorEPK0BJSnalqSIgcLgUET2zQoshyxb6H/j3lNB4tY2QMpzITO5
X-Received: by 2002:a25:8411:: with SMTP id u17mr1615270ybk.5.1551184242072;
        Tue, 26 Feb 2019 04:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551184242; cv=none;
        d=google.com; s=arc-20160816;
        b=Ta6E/U0BTdly9uk9z93/rd0Pa+lThQCvdsFOaq8NZusCQQHbnmyroK7VBotFKOsMLr
         jqC9P3V5JOQa9SdA0rGSG5wBhcWBSUwhHVqlCu0g8PWFqnAOs+oGg8q+fhedbYWcqb7D
         N5nZN1OJ2zGidkEwzAQs56NV7QegxaTk82/MU3fdm88Uq8mMtVPgWj9iHDJrNS+5LxSP
         FguTBz4rYNysIdYi4RTyYLdBUVpB7z3+RrVvL82y7AL4SGNGt8pqUYZ0kcECxFURFAfR
         5DDfvcVbXlkQixPhexQTiHM/87RiKZOhKFGNW+mX6X1P3Eb05lEskD3ZYWMKX/XYBtL3
         HS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8Y7nW2aO/YLc6RZ5XFgGEH/l5w2tJ2W//lIbYVFEagw=;
        b=mhAYQ8cuz9DsHyFHJYT2u0ASncD36c0Tl9YG9g4QQSlXcsj9AHvA+1tHRYG2qCyzDc
         aoXrJcYohuozaIzT1m8UgxvKyL+Pm561HNk5iJ3dPxk6foYLkmqWUKdpeqvdSL4hZnHN
         lbeNW+GJYSJOgFYuAbhoRczvWfXCQ8utBYCwtMEBAi06KiB69V4bF2EQnGDZnYygN57c
         IeIbsvZ+rq+TDyRrIYkxsVEcaOATSsgZTBgvsml0zdwXVgA8dUm4y9z/ZUORzKt+L7EW
         A7lVw1O3/EY/bXZZYp7eBMxYMGMI98Xl1Ocy31ClHLcyMmm7MXRbUR28cY3y6a/WtUUA
         Nkgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yw5uz8UT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si7005082ywa.187.2019.02.26.04.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 04:30:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yw5uz8UT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gybsf-0003oz-Gu
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 07:30:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gybnl-0000Oe-0M
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 07:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gybng-00089F-Ul
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 07:25:35 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gybna-000864-Ep
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 07:25:28 -0500
Received: by mail-oi1-x243.google.com with SMTP id j135so10139353oib.13
	for <qemu-devel@nongnu.org>; Tue, 26 Feb 2019 04:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Y7nW2aO/YLc6RZ5XFgGEH/l5w2tJ2W//lIbYVFEagw=;
	b=yw5uz8UTfkx7wy/KIzcSiAgzIEyeAR+18ex9AxFvVSiP1v7jSg8qr+vh/iBbcaIcpK
	GhezTbj7kZ7YqpKatB1uC9x4Cnyjn4RwHbX+KtFOZ7pJMCbgR5I4dgUKCD8isdfjEQeI
	iw8z4fNmY01LDb03x7t+YpzqOB4nTjt2ZmT3+g6Ylh7krFBDaUUiXFHDWP8nuDYFHZi3
	ZcCaiFH3HvsTIIX/0+E32vVC0KRJphQr7qIqpDTQgAF/vh83TV8bJL58JHQhkYdX6eAP
	JesII/k2u5uUeQnGRSNLqCU7cgAjwMYhE3dWAlrcQo0fCModBIJl7WTo8Go7zY+6CZI0
	pY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Y7nW2aO/YLc6RZ5XFgGEH/l5w2tJ2W//lIbYVFEagw=;
	b=Z4W56jykPmptIacblJywvkppwM1FplcPBhn8qpeO6i6R29KmInYzkclG28YpRGymaa
	UOo8kVlSgrJ27s1RbDgmmZO4bEYz5LKVEeTAjXKaDxEXUpnF5Nhmh/IpXy0eMVjFj9f7
	7qCkTAlOYte2HDM2rzt9Q7RxwTi+SqbVcVFfweJf3kp960M3+hh39iSwxKyErdVAJrHG
	r9KjX5oBcKse9tW2RDP6GLCn7QDL+IxciXz6Es5yNtGol0J1aut5ygCJlzjwMhrgYv3V
	4HkHjJ+DpBj9q59YKuTdSyO4erDwp3yPYW3fQB9DSnEWl4fMPAIIctGkTVYf/1vntgDE
	dxPA==
X-Gm-Message-State: AHQUAubvU8ynO2Uu3lbfZfdawCswMVlnExcdjBVlYxfVmz3xnqu7GD7i
	/YryVLlRvd1gtgy8tNLf+xi311qfKiHdFaW+gj+IZg==
X-Received: by 2002:aca:1813:: with SMTP id h19mr2060410oih.146.1551183920829; 
	Tue, 26 Feb 2019 04:25:20 -0800 (PST)
MIME-Version: 1.0
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
In-Reply-To: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Feb 2019 12:25:10 +0000
Message-ID: <CAFEAcA9G73yrRvj3AdyxAi2uUBH9GPPerwi7y38oMDKw8F0B=A@mail.gmail.com>
To: bzt <bztemail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CyR2W3/wXNjd

On Tue, 26 Feb 2019 at 11:38, bzt <bztemail@gmail.com> wrote:
>
> Dear qemu developers,
>
> Honestly SubmitAPatch is a bit complicated for me, so I'm hoping I've
> done everything right. To be sure, you can find my patch here:
> https://github.com/bztsrc/qemu-local-timer and diff against the latest
> github repo here:
> https://github.com/bztsrc/qemu-local-timer/blob/patches/3.1.50.diff

Thanks for the patch. You've got the most important things
right -- patch sent as an email, and with a Signed-off-by:
line from you. I've put this on my to-review queue, and I
should be able to get to it within a week or so.

thanks
-- PMM
