Received: by 10.25.208.137 with SMTP id h131csp277612lfg;
        Wed, 4 May 2016 10:00:33 -0700 (PDT)
X-Received: by 10.194.57.168 with SMTP id j8mr9636882wjq.43.1462381233318;
        Wed, 04 May 2016 10:00:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v198si6205371wmv.34.2016.05.04.10.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 10:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ay09o-0005Am-8F
	for alex.bennee@linaro.org; Wed, 04 May 2016 13:00:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ay09f-0004xA-KB
	for qemu-arm@nongnu.org; Wed, 04 May 2016 13:00:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ay09Q-0003g5-Sj
	for qemu-arm@nongnu.org; Wed, 04 May 2016 13:00:02 -0400
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231]:32849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ay09P-0003Xy-LI
	for qemu-arm@nongnu.org; Wed, 04 May 2016 12:59:52 -0400
Received: by mail-yw0-x231.google.com with SMTP id t10so105556079ywa.0
	for <qemu-arm@nongnu.org>; Wed, 04 May 2016 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cHYsXgiNvzGRo6vl6E1lsBn9/XBHxuHy0VGL0pGxg8s=;
	b=LKxcolEL9fSJQdhh2P4NVsfmJEjd3qaSX9tV0wYI4nijltkwiSrPY2tkt8dDG6XZr1
	XvWGs22Uuh84oVPzYvA1JNC3mBY135aa/dGkmU86rPaxL2cxuxhGSJ4wN5FEDPGN3bmk
	/S94I+S26qZMb9DuRF/NxgukSvuNl2wxicr1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cHYsXgiNvzGRo6vl6E1lsBn9/XBHxuHy0VGL0pGxg8s=;
	b=I5DTuEQwQkxcBD5th3+OImNQmypKw0E45bNE8BtAeAGl+6JdQEVXidQS5DP9uRD7eO
	xbZ1mkrVW4J/bhUOhcz+DgR46aE+5dv8Crvefqr5i4BlgZeaHGe9Cl9yYz7W3gBIOTws
	Tt+Qh0daVtG3pG1/WgBQqZ2LvXVjgGIRxP9AwWd4t2c8KsAO6fRFfqno0QfKFsGYuRUf
	l5bq545i/saCZKHlm+BFc9hzxHhJFAgr5UWQzYPy5+gl3+gXnSE7m+K05C2pwVkcmnkJ
	4a2+7K4e5Ad950Bv539nhuJ20GIlSaagyVy+u1Ro8wM4OTvn9Ws8G9RMO1LMrMVMYpF0
	sPWg==
X-Gm-Message-State: AOPr4FUKS42gmXMqCoDzDGEwF9LvAicKhQD1uV/EdxV3IWXyTszcdQqF2ezzm6S5UlcnFi2mAE1XiXxaXttluFsE
X-Received: by 10.176.68.162 with SMTP id n31mr6652995uan.26.1462381169506;
	Wed, 04 May 2016 09:59:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 09:59:10 -0700 (PDT)
In-Reply-To: <1460996853-22117-1-git-send-email-afarallax@yandex.ru>
References: <1460996853-22117-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 17:59:10 +0100
Message-ID: <CAFEAcA-jZ3OfSNE7mkHSBY+19oiFP9uO4u3tuX_rrpQhvxaPsw@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::231
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: Fix descriptor address
 masking in ARM address translation
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
X-TUID: cTJvpOmq13nK

On 18 April 2016 at 17:27, Sergey Sorokin <afarallax@yandex.ru> wrote:
> There is a bug in ARM address translation regime with a long-descriptor
> format. On the descriptor reading its address is formed from an index
> which is a part of the input address. And on the first iteration this index
> is incorrectly masked with 'grainsize' mask. But it can be wider according
> to pseudo-code.
> On the other hand on the iterations other than first the descriptor address
> is formed from the previous level descriptor by masking with 'descaddrmask'
> value. It always clears just 12 lower bits, but it must clear 'grainsize'
> lower bits instead according to pseudo-code.
> The patch fixes both cases.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
>      /* The address field in the descriptor goes up to bit 39 for ARMv7
> -     * but up to bit 47 for ARMv8.
> +     * but up to bit 47 for ARMv8, but we use the descaddrmask
> +     * up to bit 39 for AArch32, because we don't need other bits in that case
> +     * to construct next descriptor address (anyway they should be all zeroes).
>       */
> -    if (arm_feature(env, ARM_FEATURE_V8)) {
> -        descaddrmask = 0xfffffffff000ULL;
> -    } else {
> -        descaddrmask = 0xfffffff000ULL;
> -    }
> +    descaddrmask = ((1ull << (va_size == 64 ? 48 : 40)) - 1) &
> +                   ~indexmask_grainsize;

I still think we are going to end up wanting to revert the
"look at va_size rather than ARM_FEATURE_V8" part of this when
we come to implement AddressSize faults, but let's get this
bug fix in for now rather than continuing to argue about it.

Applied to target-arm.next, thanks.

-- PMM
