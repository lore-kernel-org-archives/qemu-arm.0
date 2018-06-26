Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5267308wrq;
        Tue, 26 Jun 2018 10:18:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfWAgzoQn4CegW6CaiXZ2k98Xt+JMY2sGIQAOPB0ro5pvltqEjdM7+aqqKPhMz7qKhC7jgo
X-Received: by 2002:a37:99c3:: with SMTP id b186-v6mr2149223qke.261.1530033504578;
        Tue, 26 Jun 2018 10:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530033504; cv=none;
        d=google.com; s=arc-20160816;
        b=FMXpQUEWgd9e/OKlkuMSHHityICjRuPNp40P6pcO3/08MOt7FcrWxgOUJQzo6Yd5EO
         Fctq82wCqEGMSUQZZDHkbhkhnYSZN/Q37UGYQ5aDV3TOzYXANsTHQKGnqaS1Y62iuSgk
         NsbYSVAY8flr3vcu5RatoSeUYxz4FwQEQAahajxlQpRzrYmm7CMtgkGXtN82yh4+Vyz1
         3IdPfjRxNZ9Xc5s7kbMEnUhnduNW5P3LlJuH2cL9jeynlN0zGLcbLQji6Z22c3UuPpvC
         lSt18wMHCzr2QD9Dkj2mHdzp3nVy1+zYIrpzDJ4m1tXoLtBEdTVtW6/zXFpxKzPpAW/k
         p5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Nkz+MVDOB+IJ2WJEe2Mlt5v+phgWwS0+dOyvl/A4rkE=;
        b=hdTVWctEwtpEgqAlc5EUSeFnfV6+8cBJqKdGmO9P0YrKYN/RTKmWjnsdj4nJjp9mMH
         rlJ8t//G0g/F0UzjrBtMgzhYlqEmye6QJCAuDigCYGTJ8WJm0AgGhYXZLvZu7gH+Muxw
         c1PYcvFlAHjurQP5PA47HnKaEeD90DhzZht1oEK7nNj13eDDeCM+6sneIs5Xyl8LlEhe
         XWWUXw2wwRxH1cBo+QLMIV0CZXyCeMbipzQ5P2BNg5woR9lBZcKY9l/+lkuky906RfT4
         9rj2q4g17T1KLP7c7/Nl3iu6I5DMAbdoUJM9hWIFsqQZuIL6q9kT4to5XJc14N4/f29f
         I1iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eJ6AhOmF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k189-v6si681876qkf.39.2018.06.26.10.18.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 10:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eJ6AhOmF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXrbj-00010T-Mv
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 13:18:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXrbS-0000zH-P9
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 13:18:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXrbR-0007lj-Ua
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 13:18:06 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43330)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXrbR-0007lL-Fg
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 13:18:05 -0400
Received: by mail-oi0-x241.google.com with SMTP id x18-v6so7338372oie.10
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nkz+MVDOB+IJ2WJEe2Mlt5v+phgWwS0+dOyvl/A4rkE=;
	b=eJ6AhOmFvDL2jwFjUMCB/DTakldFaH1jGhe3vV6pxHnlTvkAcjndRlvO/Vrt3Y+Ujh
	GxjFODGw693jj/vGkPyXqPODVInHdqI9QqhHaSW3g1Gu+gh0n9px6FF64cwFQsuNgX3t
	8uxVnW8BfXnFscCG/jiPQ8FA8YithsORwn0n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nkz+MVDOB+IJ2WJEe2Mlt5v+phgWwS0+dOyvl/A4rkE=;
	b=ABkZ6AdDtWifT9yha4yCui8Oa4US4HNwrCsPzFm9s/v9UZHf/voszMR3wU2lamPGVW
	g8UldejFnZhq4qjRTBz62YnizC0Bjfz6V6nbvnY5Gv7VBRMqUxJdaBXUa6MwS1koOmCa
	GKCqLt5bKG+RdPHL/MWzfQGpq5FMyUBtEYiK/FY1hIHRZ6ohd5yNNR3dMoANci8HM8h/
	FvrYCQk7c0GisSiRmC07sXm4kBeJzu3/jHckQaCKXsKjDxA7Wmlt6mt1ghU/yOsp8tQz
	x+iKFW3SQl4NRyfJcGn6bw09WCCkFMPFFo569v6Nm2NEtKBy2Yf4U8ISCZtVlbwccPz8
	Y9Pw==
X-Gm-Message-State: APt69E31Czu751pM1ZFPlvncKUqigDDqanjc1tlfrIOMwR2yYWltd3k3
	x8sf5vHfddu+vJDLAbmo9E6DTqmkbSLJwpeeRSVJsw==
X-Received: by 2002:aca:743:: with SMTP id 64-v6mr1264784oih.164.1530033484742;
	Tue, 26 Jun 2018 10:18:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Tue, 26 Jun 2018 10:17:44 -0700 (PDT)
In-Reply-To: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
References: <1529374119-27015-1-git-send-email-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jun 2018 18:17:44 +0100
Message-ID: <CAFEAcA_8TAWdkgTzPPE7eggP4UAHjVPmcXiEa_-RCxDBphJ4HA@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH] hw/char/cmsdk-apb-timer: Correctly identify
 and set one-shot mode
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
X-TUID: YA3liJU7OHPc

On 19 June 2018 at 03:08, Guenter Roeck <linux@roeck-us.net> wrote:
> The CMSDK APB timer is currently always configured as periodic timer.
> This results in the following messages when trying to boot Linux.
>
> Timer with delta zero, disabling
>
> If the timer limit set with the RELOAD command is 0, the timer
> needs to be enabled as one-shot timer.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/timer/cmsdk-apb-timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
> index 9878746..79c1b49 100644
> --- a/hw/timer/cmsdk-apb-timer.c
> +++ b/hw/timer/cmsdk-apb-timer.c
> @@ -119,7 +119,7 @@ static void cmsdk_apb_timer_write(void *opaque, hwaddr offset, uint64_t value,
>          }
>          s->ctrl = value & 0xf;
>          if (s->ctrl & R_CTRL_EN_MASK) {
> -            ptimer_run(s->timer, 0);
> +            ptimer_run(s->timer, ptimer_get_limit(s->timer) == 0);
>          } else {
>              ptimer_stop(s->timer);
>          }
> --
> 2.7.4

Thanks for this patch. I was wondering whether it would be better
just to remove the fprintf message instead. I'll either apply
this or send a patch to do that before 3.0, anyway.

I think we also want to make sure we convert back to a
periodic timer if the reload register is written with a nonzero
value before the timer expires (and that if that happens after
the timer expired that we restart the timer). Thinking about
this is also on my todo list.

-- PMM
