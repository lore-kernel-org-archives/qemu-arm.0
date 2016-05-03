Received: by 10.25.208.137 with SMTP id h131csp1372124lfg;
        Mon, 2 May 2016 17:05:08 -0700 (PDT)
X-Received: by 10.140.106.199 with SMTP id e65mr34688066qgf.73.1462233908644;
        Mon, 02 May 2016 17:05:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si355740qge.102.2016.05.02.17.05.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 May 2016 17:05:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axNpb-0003to-Vc
	for alex.bennee@linaro.org; Mon, 02 May 2016 20:04:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axNpP-0003Ya-ML
	for qemu-arm@nongnu.org; Mon, 02 May 2016 20:04:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axNpE-0003jc-6N
	for qemu-arm@nongnu.org; Mon, 02 May 2016 20:04:34 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axNpC-0003ej-Vw
	for qemu-arm@nongnu.org; Mon, 02 May 2016 20:04:28 -0400
Received: by mail-vk0-x22b.google.com with SMTP id m188so4952859vka.1
	for <qemu-arm@nongnu.org>; Mon, 02 May 2016 17:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E7No54bZvIjHbBxoz2Eo9E/YsN4MKX1DsDUdVJHkGPI=;
	b=dipK1D+b2gmjebsauCh8Jm+1b+58sLUEAdQ6DOs9vpknCck2rw/mPOWIpVWYa5hbG2
	vK53v+tb4lCSwwRJHJidRv1a3wDK4BDtRmKf/axHWPhkmlKhlbMmZuI706P4445T3M24
	L5jaX8dYC8JsuWpjYFcygN5FVlZ/HRLH5IQs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E7No54bZvIjHbBxoz2Eo9E/YsN4MKX1DsDUdVJHkGPI=;
	b=m+dOIDob/pRHLivJVkA2OlPqKR8BPkhYH/MLrFbdHImxJ9FN0TuxjeSv42LzAURXCK
	RMc/cJIkyh8wW4wBu7eTljs1cp1gS6tGK9hsPKHppmUeu7BuNp8CqxLV3b0KxZhYs1M1
	7Uae0Hzq8rSGhLacFqEaZoct4qnUKHxXpEo1WE/mQy9c+IwJJoEVHmP8sM3QeWI/KWSP
	92svJbUNAr2HDOqLBrBIbWTGh8jzMe0xVUmlFCo5dOi8oLG2d18YojTshSWSgJ4iMGKn
	/AkJ5UjAr5IDgNPLU4Q2PXiETlPnKInwcWtPoW2+066E0dcja33Pmlij4i70S/lPNDju
	vJ8A==
X-Gm-Message-State: AOPr4FVnoURv0jMAs6Q90+/ohNP+ttUh9rGKxHGFtCNxiB5n13ktNQ4hnepfjps76jQe8xxt6vLrVwHDipKzkRan
X-Received: by 10.31.102.197 with SMTP id a188mr1185779vkc.37.1462233845101;
	Mon, 02 May 2016 17:04:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 2 May 2016 17:03:45 -0700 (PDT)
In-Reply-To: <1B088DF8-FDE6-49AE-8C12-BA60B4D20BF6@gmail.com>
References: <1461325343-24995-1-git-send-email-sylvain@sylvaingarrigues.com>
	<1B088DF8-FDE6-49AE-8C12-BA60B4D20BF6@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2016 01:03:45 +0100
Message-ID: <CAFEAcA_HeC98ey2JGhT1BHN5snrfQK0AU8q82fLy8TNECPkzmw@mail.gmail.com>
To: Sylvain Garrigues <sylgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e6TAS/1rUjFe

On 2 May 2016 at 22:21, Sylvain Garrigues <sylgar@gmail.com> wrote:
> Hello,
>
> Shall we commit this patch?

Hi; this is on my list of patches to deal with, but QEMU
is still in code freeze for the upcoming 2.6 release.
When we reopen the tree after release it will go in
shortly after that.

thanks
-- PMM
