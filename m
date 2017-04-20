Received: by 10.25.0.144 with SMTP id 138csp720395lfa;
        Thu, 20 Apr 2017 06:03:23 -0700 (PDT)
X-Received: by 10.55.0.65 with SMTP id 62mr7098507qka.158.1492693402413;
        Thu, 20 Apr 2017 06:03:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p87si5498570qki.311.2017.04.20.06.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 06:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1Bk1-0004Sb-SO
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 09:03:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1Bjm-0004PW-Cy
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 09:03:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d1Bjg-0004nX-PK
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 09:03:06 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:34893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d1Bjg-0004n7-Jz
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 09:03:00 -0400
Received: by mail-wm0-x235.google.com with SMTP id w64so103442967wma.0
	for <qemu-arm@nongnu.org>; Thu, 20 Apr 2017 06:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QQjeqBkNpeEEatcLJDUubU7we6tWvX3Rfp6H370b+LA=;
	b=iU4LoK+v12fxyU3pNZ3cWhv5QMCAPAeOifyDISr4E/iFMKqCLvSOk7SBAYUjUNxgPI
	PI/A0nWITy+EIfblSOQsWs+zDvxNtiYpcCvBFy8CrkHhvsd6ll/3qS8B+1oyFWQp84HZ
	YjRrq1oBR081B75JEVVo4NRIsfsNXURMB2hA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QQjeqBkNpeEEatcLJDUubU7we6tWvX3Rfp6H370b+LA=;
	b=aMLtt5bumoTDYs/RMdGSpodFKrRdMPmhnWMMATxAp6xsFnK1zzVBpqCgPJ9GL4AHC+
	aLkODBC7zDNy6HNM9b755oe/alqlpdpa3gO2PdLLev2dXzr7dKjOIk0PFYHtRBOKXBf8
	CBzp9lvNyBG2/dagk8j3Jw2SqPiUt3/7Z2OuHdY+0bHuqWsYOrt/+k6BPT0V1+YvYB4m
	8ARz0YZEEBiWQ3SLCuSqH5OjrmtIpGfHMPsyga9SpIvOAmufNyYTcHFmo+Tz+kqow0Os
	xDHMCMZvG9kVLe8LLmWu1C440+Mueu1KPRgnftMsCTchLnTQjttKrFxb8v/VCgxPo0ew
	EBCQ==
X-Gm-Message-State: AN3rC/5K3vJRGh/OfBDr/U8JN3NTALRY0HU2cnPFxlkfFUBIBQpPgluF
	aoIHzTMN0Jlw/LxjN4kBWHuKPA8l/0lE
X-Received: by 10.28.236.210 with SMTP id h79mr2966391wmi.92.1492693379297;
	Thu, 20 Apr 2017 06:02:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Thu, 20 Apr 2017 06:02:38 -0700 (PDT)
In-Reply-To: <20170414083717.13641-1-lvivier@redhat.com>
References: <20170414083717.13641-1-lvivier@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Apr 2017 14:02:38 +0100
Message-ID: <CAFEAcA-NTpaXL9foLOqZ1AyBOcFokKfJGMxicQFXeAzkMATfBA@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [PATCH v2 0/4] qdev: remove all remaining
 cannot_destroy_with_object_finalize_yet
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
Cc: Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TdEsDikuCXsy

On 14 April 2017 at 09:37, Laurent Vivier <lvivier@redhat.com> wrote:
> This series removes all the remaining uses of
> cannot_destroy_with_object_finalize_yet to finally remove
> the flag itself.
>
> The ARM patch has already been sent alone and reviewed by Markus.
> I have tested the ppc one on ppc64 machine with KVM and using
> QDM device-list-properties command.
>
> For the versatile one, the flag allowed to workaround a problem
> in the bus unparent function: the bus unparent is trying to
> unparent all the children of the bus. To do that, it has a list
> of the children of the bus, and calls object_unparent() for each
> child, and object_unparent() calls object_property_del_child() if
> obj->parent is not NULL.  As qdev_set_parent_bus() set only
> parent_bus and the list of children, parent is NULL and the child
> is never deleted.  We can avoid the problem by moving the
> qdev_set_parent_bus() to the realize part.
>
> I've tested all the changes with "make check" (including
> device-introspect-test). I've booted a versatilepb machine
> with a 3.16.0-4 debian installer kernel.
>
> Laurent Vivier (4):
>   arm: remove remaining cannot_destroy_with_object_finalize_yet
>   ppc: remove cannot_destroy_with_object_finalize_yet
>   versatile: remove cannot_destroy_with_object_finalize_yet
>   qdev: remove cannot_destroy_with_object_finalize_yet

Markus -- are you planning to take this whole series through
your tree? I'm happy with the ARM patches but I guess we
should keep the whole series together since patch 4 depends
on the other 3...

I guess that means
Acked-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
