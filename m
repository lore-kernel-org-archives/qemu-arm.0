Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp580618wrt;
        Tue, 20 Nov 2018 05:45:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5ed0JJ/LbC5gjSf6wlnrXXzS0W+PJuaTr4/EBTrHh6fVWs8Cb02oONMfj9itnJwnA6urmq0
X-Received: by 2002:a25:1888:: with SMTP id 130-v6mr1834119yby.276.1542721538229;
        Tue, 20 Nov 2018 05:45:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542721538; cv=none;
        d=google.com; s=arc-20160816;
        b=YbH/9sbR3wIHPCKWbpTcKalElnKS95pYaw101BAvQ2oV96JRPr4JQR/rotFS7vIagv
         7bb8ascv9+ncoGjb3QBSHvju22M3O30Db4iZY+nCSqBP6x8/U/2jwyzhZqA5T3Hxf5uN
         cCtGyzJvoTm/ogfgJvAjtQw1pa0riW/yopOP8LMI1tiAec/nymV/UhDMmqI5z4cC1/ze
         vC59J95qMX/8ZZmijTqwyt9l1KL61waUz8MkNg+RnWTKOUHtzXajdrGAy/uErIpzHxwR
         hyR0JvpVN1RuGaAQMlMK74a/epxP6ZIDjdW0YNZXVvvFj6u/UZfc+dfRItYQLMNk48At
         5jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=i/nm1RW3SjSa5RNV5ad9ZPg2qRD8ZgRCLQHs7y3V0fg=;
        b=kbd3Y+3URsuaw6r5yxgavml0iUe80IqU2fJ61QIsdmt/pR8tQPvL32efCIDJQavUKs
         OVBUe6vkqaBIXr1TbzNkB2D5PxIx9q8j5EFOAS5fe2OSdM36kuwuTZ0l3OY9th2qcw98
         pspM1yRhJ5RVLkJBPUD9wAO083zmBg5orVh8AhitGMucKw7S5xk4L9ImkP7fSVCQx42z
         Om/Kr9G+gQbtYSxn0ttRU98Or0OzUi6le3wlPoAyNQoIZGXEtZGxKxCOQ6Fuphs/JWjm
         nmn2iQ/OOtloudJhf3sSISIOZioA2tVeS6yZK+sICkV+U3mRSxhSYwsVA/N6POLFU34H
         nVjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UxYF2o0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si8119461ywh.60.2018.11.20.05.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 05:45:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UxYF2o0S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP6LR-0003nj-J3
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 08:45:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6LK-0003nd-IH
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 08:45:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP6LI-0006Jz-K5
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 08:45:29 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41449)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP6LE-0005tc-Oz
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 08:45:25 -0500
Received: by mail-oi1-x244.google.com with SMTP id j21so1495889oii.8
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 05:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i/nm1RW3SjSa5RNV5ad9ZPg2qRD8ZgRCLQHs7y3V0fg=;
	b=UxYF2o0SjrwbxJtZz+K1E/4xL0WKqiH4qAa9JkLCvmGYYVPw8RIbMrnS15llpNh1R+
	eMNSqVvBDXrLU3TMO2bWPRJAKqwm+FJfNNGjSfrbt7PLK06aI//IlH9VZhn5PbkP3+dK
	l4MF7K5MAm/J33/QKeOjrzzeH0nXexCbiPgGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i/nm1RW3SjSa5RNV5ad9ZPg2qRD8ZgRCLQHs7y3V0fg=;
	b=KKKun+umH9q3/0JYVoWdwIJlN+hlsrpQi6nX04EcEVGLUhKp8LlXJi0E3X/8acZZdD
	vriwuWyMQGtV4cjHES8Fmz8Uy/33AcQHOzgXJgnDz1JAD1bbU9gqUzf7BUZX6DWkz618
	s2YrmhX6HLc1VOO+ZC2lYdeQIMgQPfp9z7yXW/u3wPme+VIU571/GEH2ZRpcjdrVUDuw
	wQAQAegT/yIeuGJyVmZd7Yju6RYZxVEdDX0UPIe/HagMpgbj8ZAj9iyGRX8CXjjOS3rh
	sKP4obNlBA5MMQdmRFCtUOx+vu7FTtetsFWIMxuom+hd7/jMX6n0Qi/OByYJTuXbFWWh
	LHhw==
X-Gm-Message-State: AGRZ1gJE62+It9QXEjTZStuprDjZhfREKG2C5EaSCEwk4LNbZ1ppgAxK
	L7cS0+AYR/szawxk+pIGZl9w1Rct+HXB4J7FBhzYTQ==
X-Received: by 2002:aca:f1d6:: with SMTP id
	p205-v6mr1175746oih.332.1542721523899; 
	Tue, 20 Nov 2018 05:45:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 05:45:03
	-0800 (PST)
In-Reply-To: <20181113165247.4806-5-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-5-sameo@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 13:45:03 +0000
Message-ID: <CAFEAcA9wvrnshOTYz-jZ0n6m7SfusYY+bnB-iPnQuVNqqdg5Ww@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 04/13] target: arm: Move all interrupt and
 exception handlers into their own file
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: weuoRZQKmVix

On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> Most of them are TCG dependent so we want to be able to not build them
> in order to support TCG disablement with ARM.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> ---
>  target/arm/excp_helper.c | 550 +++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c      | 531 -------------------------------------
>  target/arm/Makefile.objs |   2 +-
>  3 files changed, 551 insertions(+), 532 deletions(-)
>  create mode 100644 target/arm/excp_helper.c

You'll find that you need to rebase as there is a recent change
that your moved copies are missing: commit e24ad484909e7.
(I have just discovered git diff's --color-moved option which
is great for checking this sort of code-movement patch.)

What is your plan for dealing with the way that the KVM code
for injecting a breakpoint exception into the guest works
by calling the do_interrupt code ?
(see target/arm/kvm64.c:kvm_arm_handle_debug(),
which calls cc->do_interrupt(cs).) This patch moves those
functions to a file which won't be compiled and a later one
in the series seems to stop cc->do_interrupt being set at all
if CONFIG_TCG is not defined. That will result in QEMU crashing
when it tries to inject an exception, won't it?

thanks
-- PMM
