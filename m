Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3858439wrx;
        Sun, 31 Mar 2019 04:32:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSSFRNfF1S/YL2wk+x5iWoCmwZCJQ3MzFf0tx9f6RkKbsn0E1y1OJQWLMu/90pECbDEKv5
X-Received: by 2002:a81:234b:: with SMTP id j72mr47465042ywj.279.1554031968842;
        Sun, 31 Mar 2019 04:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554031968; cv=none;
        d=google.com; s=arc-20160816;
        b=JDygObG35CzZWI9y1p15vI093tmv61caDeCL4HuGM3eQDD4Yu09S5WHU1gvm8+Oyby
         NjCplrHawGZ7zhIJozYGd0MJwZeeuAGJJ/T63lpS8qnJIXu+kMGlQdClsm7Uu30j6Cvx
         opWCGxenHWHQWrsatGKykC4DXwpRQ4aE/B7rk40lyylstYDhrn6PQdmkvEvGPlgUmW2v
         jXzzjMBEfu5vofQuapr5F4mXa6Vr+JG//j7MNYV382Jra8Mlvi2pezl9yKGie5X7vgw9
         AckYLbHNLADv9ArFyTflaPHaDTag5aQarEWq8cTnHz8IjV6WLo3AgZtaV/J3l8seWEnW
         9aKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dogQ13Nv7tQIENc2yNRZRCUa+/rqK6Oi0bz4OBdqSqg=;
        b=g1q7UszXhI6JnntOi7DwHBdyT+F1X0T7ZuUHIUD2pxLlXrOvNJNdMfieGgKmG2DtjK
         oSoBsHD7sunTP8pC5sdkUD6KAZkp0pTTBnJgMZ9QTLM9bh1/enpDRth67OLqAKEfUXYE
         DkrwE6Q3qCMWY3oLlamyH/GPhiAuSFHGgdn7T8ocWZ+Z51AmBxKfs7JWHwaiMXy+0uz9
         3YqL/2YEaX2y5C/a3WmJsoFu9htrXGEar/sabzUeLbaNjapi4ETui0SLWvqzZ4mbOMEY
         ZXKAm/DVLuv/4nMbvGyxJU2BTr8gwesOKEIjA8eTdC5zlRMGd+mEPg6a1UFwY++js/2/
         6yaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lujdRPuy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si3404406ybb.51.2019.03.31.04.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 31 Mar 2019 04:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lujdRPuy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAYhk-0004DD-Cr
	for alex.bennee@linaro.org; Sun, 31 Mar 2019 07:32:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hAYhX-0004Cy-0G
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hAYhU-0003LV-2S
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:32:34 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:38934)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hAYhT-0003KQ-OB
	for qemu-arm@nongnu.org; Sun, 31 Mar 2019 07:32:31 -0400
Received: by mail-oi1-x22b.google.com with SMTP id n187so5029167oih.6
	for <qemu-arm@nongnu.org>; Sun, 31 Mar 2019 04:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dogQ13Nv7tQIENc2yNRZRCUa+/rqK6Oi0bz4OBdqSqg=;
	b=lujdRPuyy9dH1G6VlFpn3VsQHZO3pDRpUWleoRSqYvkxdWobFU+734pWIBFMQy2aXA
	b3n03N+U5QiYtc7DLDYjJpzUAjuZJE4sjwGRQoMkOdhby9ZNiutNUP/nrxJHLT8uPSXM
	HqGS6/Vgnzn3GDTVI6Edxy5gfuM5iYnSlJnmP+Wy9zRT7CY7jWqR9/kIrRhpvn9/YFha
	h7BKGF5xJh4YZoofIGwU3tlczMnRtnCYgz+NckjUWkmfNPvu4M0S50pjYQi12TSa9Dio
	AiOud0+yr4HFrC6sFKGdGXqtUsJsxs2uQqgXILg6w8bl11o5z0Z2QdBWj3//pcw4/sSB
	jnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dogQ13Nv7tQIENc2yNRZRCUa+/rqK6Oi0bz4OBdqSqg=;
	b=QWOmZxcKYfnNNzwNzBpBEuFw5/BEyIGMwws3oDap6VzsMy04P2Y6vLD0D2Xd20eGGm
	1crDmctPbUYWK/F5P2Qm5rm7ff3WHa7is+wjcogPZh8NBQJcUk22R2y/NKGryOdVNtGU
	6o/UPQ4LSwVLp+NJ48cvdfeVv4z3uVE1hrX0yIwywAPmE4MRukWITNvLXl0iF+Dxdoj2
	ycAi3YIlUXxQZXxcIHDC+lyzpEHOSggp7vFaS+mCmCKQcEWld0bnBj+uLksuGSlsIN+k
	3adMSjh+p4KYGyqEB3Qf1HTJtfIBv6mqFoL0wzvBiWaTnGOCjEhpLVg062wID8L1nknp
	WK9g==
X-Gm-Message-State: APjAAAXPRrfMKfzs62/wdpVAt5LOCiBFBLF/wok8CGJfsaM46PQjWX+j
	119MRvUNouviBWFhkuheF4p7w0teYKhK0YCfGqUdVNj/N2k=
X-Received: by 2002:aca:c1c1:: with SMTP id r184mr9001251oif.146.1554031949884;
	Sun, 31 Mar 2019 04:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <17F853C4-CF36-4325-AF2F-1B6330EBEAB4@deepvision.io>
In-Reply-To: <17F853C4-CF36-4325-AF2F-1B6330EBEAB4@deepvision.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 31 Mar 2019 11:32:17 +0000
Message-ID: <CAFEAcA-7ecwVMuUc9E=S5HuKYv+8EO_O5TdgewDd32Txuq+NOw@mail.gmail.com>
To: ratna manoj <ratna@deepvision.io>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22b
Subject: Re: [Qemu-arm] '-M virt -cpu cortex-a7'
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dbdAD17mMLNw

On Sun, 31 Mar 2019 at 18:17, ratna manoj <ratna@deepvision.io> wrote:
>
>
> Hi,
>
> $> qemu-3.1.0/build/arm-softmmu/qemu-system-arm -M virt -cpu help|grep cortex-a7
>   cortex-a7
> $>
>
> As shown above 'virt' machine type lists 'cortex-a7' as supported processor, but when I try to load a  kernel with -cpu cortext-a7 option it says:
>
> qemu-system-arm: mach-virt: CPU type cortex-a7-arm-cpu not supported

Yes. The '-cpu help' list lists all the CPUs qemu-system-arm
supports -- it is not cross-referenced against a supplied machine
to eliminate CPUs that will not work with that machine.
(It's a very long standing bug that '-cpu help' on its own will
not print the list: this is because the "must specify a machine"
check kicks in before we handle printing various -foo help texts.)

> This is because of the check for valid_cpus in hw/arm/virt.c, where cortex-a7 is not listed.
>
> From hw/arm/virt.c:
> static const char *valid_cpus[] = {
>     ARM_CPU_TYPE_NAME("cortex-a15"),
>     ARM_CPU_TYPE_NAME("cortex-a53"),
>     ARM_CPU_TYPE_NAME("cortex-a57"),
>     ARM_CPU_TYPE_NAME("cortex-a72"),
>     ARM_CPU_TYPE_NAME("host"),
>     ARM_CPU_TYPE_NAME("max"),
> };
>
> If I add   "ARM_CPU_TYPE_NAME("cortex-a7")," to the above array, it works and I get correct CPU type as I see it in /proc/cpuinfo.
>
> Is my change make sense ?  Thanks.

Yes, it would be reasonable for us to allow Cortex-A7 on the virt board.
It will behave almost identically to cortex-a15, though, so you
could probably just use that.

thanks
-- PMM
