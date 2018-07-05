Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1753468wrq;
        Thu, 5 Jul 2018 08:46:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc9F4r3Kbd6XqzBU7DK3ODwffdgiDaGCHBjv76u1nYOw8mVHVRwAu1o84OKMOPxQ/b59A8W
X-Received: by 2002:ac8:3304:: with SMTP id t4-v6mr6026268qta.43.1530805583057;
        Thu, 05 Jul 2018 08:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530805583; cv=none;
        d=google.com; s=arc-20160816;
        b=vOGAH32En0Rm5BSUPBrftIdJI84KnX3Huu7JSv0QuY0CvJyAVLPBdtDkWSYH8FFLkp
         4nt0SqSSK6X8bQhZufy51rXgavcZBUWp2gd+vKIWH+QArDL18ZReGvfVYLhJucc3WwM0
         LvgFYGd5TrKhBQbnNob/r3JnBMfNIa03xQU1qY7iycwH4VG8+fr+mcTOpDt/iTeBkfDi
         UiNWilZhJAeL2Y3PiKbosLTJhpLVrbpRO865IQLi3epSL7jGtrqs2jdqZreJunIgtx6J
         nq1WomBNUk4Obe5aZm3sZAMskSBLtFHRqZ8WFRcKV2V4GHe4/ROJB53RSQTNh+gOY0Hy
         c9ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9EPowGdDCuZkOorb2V5FVr1QesYVGKJYkOYiCHjd81I=;
        b=B1KniqrtccLUVwMHxq8N2x3f8+Yd7xRWeXtzRyiaRy6gxc7s9ZZr0u4bVPmustbJ0f
         IQQLRBoyNvWk8hAhHsJsVtJDN+BEUiNOL2gaYWithDmNrv3jxaLcQzU0g6eRPXaCVwAT
         tLh3/48bKNU+0QcK/AgJhEXhQL4cMXTHqyhYz7UUToTXgWHvz8jIc+ERtsnBTdVQHRDk
         3hTzkw8UUmZ7rBdtEz4zWGTbfhx1Uyk9CKeivqfD0I6oX8DU6+koTQjqB1ddQQ5Ldjsj
         hXF2Wk5cMF3rR2YK3GyBkMpwBVpXcJzNZdSCBPlgcq2LV22+BxUNL/7hG06Z9IjFSeoD
         jNSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GwQ7ekTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33-v6si2911578qvb.246.2018.07.05.08.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 08:46:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GwQ7ekTI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fb6Sc-0008Ar-JS
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 11:46:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb6SM-0008A0-CG
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:46:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fb6SL-0004MH-Is
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:46:06 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fb6SL-0004Lw-B7
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 11:46:05 -0400
Received: by mail-oi0-x241.google.com with SMTP id 13-v6so17772760ois.1
	for <qemu-arm@nongnu.org>; Thu, 05 Jul 2018 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9EPowGdDCuZkOorb2V5FVr1QesYVGKJYkOYiCHjd81I=;
	b=GwQ7ekTIBhdZFuJxCPJi0sU3xWQxoXxp0kIWVzjQrbObSYw1x+ehG7P2wv0JcMY5Vm
	wjLZVe1ReSUz1PqWcQWqFQhipAUZt5WTK4fJFma196wzmvMypY5Ityz5Eo3hTdx7Nq1+
	zIVw83UbCZ1WbTD8fQMvecy5kIC8xgCvMutpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9EPowGdDCuZkOorb2V5FVr1QesYVGKJYkOYiCHjd81I=;
	b=Gx/MUElm2ZphvNbudPqqBq6FfU0Ms5Ph3Rdoe7kkk7bnb/XtnYufx7SbFNbvUiMBIN
	WZd13u2988GS0ed4MZo0iv163Ot/JEWUaauEXIi7wrWsC9LX+Y/mex9p4ok4D1IkdNsX
	kdFX7JNb1bdmhY2gx1gJGpOgOLZ/YMX+l0ZOlfq1ytzAU4x1AxnyEhsut0mlDVO9vEVl
	e7ngEK+rQhVdkOU6UdG0lUJcZv2F7z9YrDgJFnklI5zyVwq+uvEeHH2v7lZUgq8tlAEJ
	SbWh9Y1Xw1yMRkIkc2Xt9X0CqxIxaM/OJ1BR+Q3bSU7Ta57NvQvp756BYAE4m9Go188C
	HJPg==
X-Gm-Message-State: APt69E12+Z6o37GiTA+hMUvZpVElMnSdaXx5mcrLjPesG5VTplnE6mSd
	i0f+XHFHSyezjC3KaH13zGj9waomHZtYGXD+XP2dOQ==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr7675540oic.252.1530805564585; 
	Thu, 05 Jul 2018 08:46:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:554d:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 08:45:44 -0700 (PDT)
In-Reply-To: <20180630091343.14391-2-stefanha@redhat.com>
References: <20180630091343.14391-1-stefanha@redhat.com>
	<20180630091343.14391-2-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jul 2018 16:45:44 +0100
Message-ID: <CAFEAcA-boywojdasSCZ5EnnGMtETMH7JZw30fOR7fepMQaqctQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/arm: extract ARM M Profile base
 class from ARMv7-M
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zX5OTve3EIu+

On 30 June 2018 at 10:13, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> The ARMv7-M code is largely similar to what other M Profile CPUs need.
> Extract the common M Profile aspects into the ARMMProfileState base
> class.  ARMv6-M will inherit from this class in the following patch.
>
> It might be possible to make ARMv6-M the base class of ARMv7-M, but it
> seems cleaner to have an M Profile base class instead of saying an
> "ARMv7-M is an ARMv6-M".
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

This makes sense, I guess (though it currently leaves us in the
odd position that we have separate a object for v6m, but the v7m
object handles both v7m and v8m...)

>  /**
> - * armv7m_load_kernel:
> + * arm_m_profile_load_kernel:
>   * @cpu: CPU
>   * @kernel_filename: file to load
> - * @mem_size: mem_size: maximum image size to load
> + * @mem_size: maximum image size to load
>   *
> - * Load the guest image for an ARMv7M system. This must be called by
> - * any ARMv7M board. (This is necessary to ensure that the CPU resets
> + * Load the guest image for an ARM M Profile system. This must be called by
> + * any ARM M Profile board. (This is necessary to ensure that the CPU resets
>   * correctly on system reset, as well as for kernel loading.)
>   */
> -void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
> +void arm_m_profile_load_kernel(ARMCPU *cpu, const char *kernel_filename,
> +                               int mem_size);

This is presumably just a code movement and rename, but it's a bit
hard to confirm that. Could you split it out into its own patch, please?

thanks
-- PMM
