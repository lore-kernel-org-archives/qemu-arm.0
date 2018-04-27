Received: by 10.28.4.212 with SMTP id 203csp1050826wme;
        Fri, 27 Apr 2018 10:51:35 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqrh2QpnfpZ+7d7gyYQygewPjqTsSFvvsUrLR2vAcMh55H0f8NWGUF6u0C1vQwJqqW+ZW6A
X-Received: by 2002:a0c:b165:: with SMTP id r34-v6mr2981297qvc.48.1524851495480;
        Fri, 27 Apr 2018 10:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524851495; cv=none;
        d=google.com; s=arc-20160816;
        b=aoUQDY4T2ycD9Di/+9F6zpUxNRe7f7e4gKIvqFbEP4Pjb0rJkKe5Qyg591KvuGDjtA
         ZdbUopcypEP598ZaJr8+h4HTjsTlR/pf9xoFfljWpIk7+VjI5PKV/9MaHg2Vq6g55PHe
         jojMdKdfcDgB00mFc/zF94YT/NzVb7pG/uwCtfaR5RXBMn5pJELUNBVKvQWgaXcmV9GX
         TkjTogq+A5L3QOeLWJhUNTBYzQFZfe6k5Xddw+hVqaX/lHTMS0L1BZCzSZYkxEi9b8wS
         xnILYuiL5w0x3PJdYX1VhC8JlcnoLIxIl3wS5WOw82ywrVQWbVJyL5NdTCb65lz5vbpL
         KlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=MZEK+azvrd7daRoLp/XbvFCAn3N1hALXe49w5N6ly6w=;
        b=Kn1/lEgxbGLm6t9lRNPtYz9/rIa2Qe6ybNToaQ7N7ZUMQdmTj53bKUqYhnCwmQJma0
         I2TeIvGoUmDnBt/v2hJ98cm0b7yDYiRsQogLAxAYWWMOuUvvtIjy+OYb8OwVVuuPDA3V
         ZadlI59ID4CALvWurvcsPhPo7ZKUvJtO1E7n1fJah5izYwfALolSjigDzrEjRSBtXbBs
         s7GXN3XWf5WqWnEN9AEr2NLDto8pwBWMeb47kSEmsVhkImz16zuRofWbUa2fQbODcbPY
         5k2bVToUi+0+MvkEYBsad5CwSyk8t06QxXbRcAYTsiJc13vKfOhetU0dFeU9n1Jtd+uL
         YjxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SpLX49IB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p77si1789842qka.22.2018.04.27.10.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 10:51:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SpLX49IB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fC7Ww-0002Lm-Vy
	for alex.bennee@linaro.org; Fri, 27 Apr 2018 13:51:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fC7Wm-0002KD-CX
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:51:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fC7Wl-0005o2-Jp
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:51:24 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:46346)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fC7Wl-0005nn-DV
	for qemu-arm@nongnu.org; Fri, 27 Apr 2018 13:51:23 -0400
Received: by mail-oi0-x242.google.com with SMTP id y15-v6so2298728oia.13
	for <qemu-arm@nongnu.org>; Fri, 27 Apr 2018 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MZEK+azvrd7daRoLp/XbvFCAn3N1hALXe49w5N6ly6w=;
	b=SpLX49IB/crEPvCT0IFhuNqFiM3BwOQZKVHdnUYBGdmQwwN2s7qR/WhN4ZNeVb9EhN
	Ih8rrESzI1lGuXVa3oO5s+N9oXvgr6psApYxw6wwswcb8FG/kWtXE/nagW48B3bd8d64
	omXrD5yjW+EsBV8MCzOrEaKgZdMn0JOsmnUAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MZEK+azvrd7daRoLp/XbvFCAn3N1hALXe49w5N6ly6w=;
	b=dRU5x51Z/BT+qNTGtILr1tKVgIYFc7pZ0jRcnqMaG+3Y4UuZaMRsKQ3baYf9pbIM0r
	Pw8kQpCIOOdbIisUNGbgd/rA2O2cw+wj0HLwhh7Izf5lvgLR7JNTJAguh+iCVbYl2r24
	hFB4td9ZZsJ+FhoBQSr499sAJPmxQUzHoNoAqGPfcGkTPWrRBfU5xZu2M63+jS7Vicdl
	xPOI/9eeuArME+25jdxWkWZwU+dt4J2xYSYsxhxhP7aQdUvSUcXpqu7oiy4NkN2Qo5GD
	zbgH4e88YCKCt1FsscoCH7KVf/+8VUyHVh/PBBFlMeildHDEvhQDTUj9FJeZM4sQAXP2
	PY5w==
X-Gm-Message-State: ALQs6tCgAHOcWPJb5z91cB7Tfyh3dxkl+Ab+3+FhNf8dJbKaTXCbNJlz
	F/gTGwK8sGY/2ZCBSswpdoxye0b54lW0WdKMHTGGtg==
X-Received: by 2002:aca:d447:: with SMTP id
	l68-v6mr1929072oig.102.1524851482542; 
	Fri, 27 Apr 2018 10:51:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 27 Apr 2018 10:51:02
	-0700 (PDT)
In-Reply-To: <20180427134728.2w5f3tx2hjcdgucd@kamzik.brq.redhat.com>
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
	<1524061685-83305-6-git-send-email-imammedo@redhat.com>
	<20180427134728.2w5f3tx2hjcdgucd@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Apr 2018 18:51:02 +0100
Message-ID: <CAFEAcA_NMWuA8WSs3cNeY6xX1kerO_uAcN_3=fK02BEhHJW86g@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.13 v2 5/5] arm/boot: split
 load_dtb() from arm_load_kernel()
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9G/sUNYA81od

On 27 April 2018 at 14:47, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Apr 18, 2018 at 04:28:05PM +0200, Igor Mammedov wrote:
>> @@ -1173,15 +1141,6 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>>      for (cs = CPU(cpu); cs; cs = CPU_NEXT(cs)) {
>>          ARM_CPU(cs)->env.boot_info = info;
>>      }
>
> I wonder why we need to start at cpu here, but first_cpu below. If
> they could both be first_cpu, then we could merge the loop statements
> into one loop. Reading enough code to build confidence that it could
> be first_cpu is too much to ask for a Friday afternoon though...

It should be starting at first_cpu -- starting with 'cpu' is
a bug. However as with the bug fixed in 75ed2c02484101d5, it
isn't currently causing any incorrect behaviour, because every
board we have is passing first_cpu as the boot cpu, either directly
or indirectly.

There is a theoretical use case for only feeding the boot_info
to a subset of CPUs, which is where you have a setup like
the xilinx zynqmp which has 4x A-class cores which run Linux
and 4x R-class cores which run something else; in that setup
you might want to say "the boot_info stuff we have here is
just for the A-class cluster, and the R-class cores should
look after themselves". However, (a) we don't really properly
support heterogenous setups like that -- zynqmp works by
accident rather than design -- and (b) if we do want to
support them we need a sensible API for indicating which
CPUs should or should not be involved in -kernel boot as
primary or secondaries.

So we should fix this loop to start at first_cpu, and worry
about the heterogenous setup usecase if and when it becomes
reality rather than theory.

thanks
-- PMM
