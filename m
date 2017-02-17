Received: by 10.25.77.65 with SMTP id a62csp295342lfb;
        Fri, 17 Feb 2017 10:17:08 -0800 (PST)
X-Received: by 10.55.137.69 with SMTP id l66mr9138113qkd.133.1487355428187;
        Fri, 17 Feb 2017 10:17:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n68si7996611qte.207.2017.02.17.10.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 10:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cen5f-0000P6-JM
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 13:17:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cen5a-0000OQ-RJ
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:17:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cen5Z-0003BW-QO
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:17:02 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:36432)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cen5Z-0003BD-J2
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:17:01 -0500
Received: by mail-wm0-x231.google.com with SMTP id c85so22711285wmi.1
	for <qemu-arm@nongnu.org>; Fri, 17 Feb 2017 10:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7g5FuegoLdS1ybLstNjnGQzErZ7ZbD/jraXd6ouE4MY=;
	b=ZotymqDoq9PKl4OIcQTGJEqRK4xPY/xmNPFR1aAQwg6KkVgz1P9+I6mDrjTKnRFsIO
	SmNvX49yEU6tMRcVxtKchQutUerjtpVBFj3RE5W9Gb3himi32XEsEP7d/R5V7mglOGKl
	pkJuXWmCMys/cleUiEBJAlfu35+DxV0XpvTJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7g5FuegoLdS1ybLstNjnGQzErZ7ZbD/jraXd6ouE4MY=;
	b=egiZRaBwI9ZEX1J/OBvWWGXZpgbYMxmrDd9Iq77yrVFxhHKcbspg4QPHP1LKL5yNGP
	l5RWMU60tEgn4FGieSbS4i7nDKnG+Mv1yFl7DnI2fv/Ag/xylGjj5axnIdwHzV7Axvns
	CE7bn0GJqxKxLIsQLlFbvPT2mRAP+GsyV0GYT8vCo570DMi/GUjCyuYm39iKn9w0nuqv
	RBJa3+KLoCABwnRsB8x0ISZ2OzE8f+mOrFmesx4jAhv72Wb+8RnYTOdYHNu2pj1mWFfK
	C9NU+Sq5yoMpuGrGUB8QJj0syTTZDcyxTRa8BQCH4xuh6q5m8d0WRXAtv66T72H0pEes
	+oOw==
X-Gm-Message-State: AMke39lEn7ULInYnc3TLwUnRbDc+hkChRC2TzWF5iWITmMHph7ffXxVWKBKqEn8QV5ixfBo11IGgH5xn1EeTfqB7
X-Received: by 10.28.55.199 with SMTP id e190mr4849991wma.92.1487355420578;
	Fri, 17 Feb 2017 10:17:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 10:16:40 -0800 (PST)
In-Reply-To: <1487354284-7587-1-git-send-email-nreilly@blackberry.com>
References: <1487354284-7587-1-git-send-email-nreilly@blackberry.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 18:16:40 +0000
Message-ID: <CAFEAcA-JOsT_oKzJ=-0EGx7nnG4ck9AkehAK8bjpeTPMJW42fw@mail.gmail.com>
To: Nick Reilly <nreilly@blackberry.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [PATCH] Add missing fp_access_check() to aarch64
 crypto instructions
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
X-TUID: URGG1jAfZj+q

On 17 February 2017 at 17:58, Nick Reilly <nreilly@blackberry.com> wrote:
> The aarch64 crypto instructions for AES and SHA are missing the
> check for if the FPU is enabled.
>
> Signed-off-by: Nick Reilly <nreilly@blackberry.com>

Oops, nice catch. Applied to target-arm.next, thanks.

-- PMM
