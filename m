Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1956515wrt;
        Thu, 24 Jan 2019 05:59:16 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Z9yPg9eHH+KyrOIVTPwV5vnRq6Tm0DjwrUhAnNTlefM4/4yqtrvhF0RfUk8hmsqjX+Ztb
X-Received: by 2002:adf:e407:: with SMTP id g7mr7174801wrm.277.1548338356108;
        Thu, 24 Jan 2019 05:59:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548338356; cv=none;
        d=google.com; s=arc-20160816;
        b=fK0r4kfDpWErmEu85/NDUhoPNpGhmTgSatwbt+j3IhBIOnSqSMM8tLhQk94+nm4SzC
         c14NedSYHwWQJLZHpqq0Cha4niaIFqKfAO0p1vr/NiCDzRVMmxJdHMM7qf7if2FTwXTZ
         gmYORuNtqZU9Ezpqd+tyH9xzki/eklGt4tndPYUWjcdl7ob3YlWXKuDCTvTKCO8sFWfO
         0VdYhXtACpz9NQDXpxDwcIzXXFRR534UvD4ssTXBG2EL0hws94NfOkKSYMZMqmLDMfr3
         JB1zVQnuT8WtqhiL/TfhDu4FEMxQl3F1FXn/JgQ4i+GRYu1SLQvGoEGhsoFjfGJElSn8
         aSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dFs21xW0E5vDnBfUwcyToGav7uVmL6ijKi6F7wEhhhA=;
        b=UGL+8nR7Lg/mmVc4A04wAnPO+kO6EA84bLQXUS8CXQfvA9i1zpgImVgSSDBsWz0tBP
         9wBj+U1VSvAL2cq4Pi0qZ9sImpn2G3mMEfoOcErGsSiEbcvrvnHlLw/xVkv9ROyxeMGy
         KwHyRykW5z/1mUMzxmSrCAxBlW7ckS9JNk/gJPBa/3XiJ+RLFCNQSzn0IggHAjwwRpER
         jmFAOkpEm99DfCY46yQE9OC0+i/sjEEH2BPZsV6VQprOWxMpWhIza1eolN1OLoPIQijB
         PKvBsa+lqsDGgLd+6IyDMgp/899bd+1/2wigZnytB6HGNGuCU5AXH10YU8PjQdrs+V/V
         TsoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kTimtiaQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si65111189wrq.289.2019.01.24.05.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 05:59:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kTimtiaQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfXH-0003HX-6r
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 08:59:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmfX0-0003CM-TY
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:58:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmfX0-0002UF-4y
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:58:58 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmfX0-0002Sg-05
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:58:58 -0500
Received: by mail-oi1-x243.google.com with SMTP id t204so4862510oie.7
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 05:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dFs21xW0E5vDnBfUwcyToGav7uVmL6ijKi6F7wEhhhA=;
	b=kTimtiaQbLs73OiZsfHlUFeYC4STRCjisAfj1hvqY9518m16lYjSDV11sjrSLEJsBc
	LIkYr0IYMK9GoDoI4JCUPo6rCqTMxTLaOq0i1YZQ05DhsSu6coEUf8g8pIxqh22og+Q5
	34cy2cVgT/Q7T6aNYL5GzI8GbNaLmql6kuP7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dFs21xW0E5vDnBfUwcyToGav7uVmL6ijKi6F7wEhhhA=;
	b=fEKqpOzzTBLytvDhPA8Z5PUemR+eAF6WE7Ik+lTVQJX4B55afX0n84D7KdbGXV7lx4
	2mnQGQ/XfnmzWC8db1yCQmA69CqleAGR+AT4ostT5j5X3vTWgRnm45JbYwjzaeZhOxwt
	Gk3oljxkUE9eKFxGW8NMnOEb+yu+fzowSjogex8cogtuCo0t9G8KJINpZDepzIVHuk2D
	d245lRwLuvEKcQzuj+QcJR3y3Efd5QxWaPdIWYjuSl/2cBETn+gG7ae01X/m4YKtGLRq
	ddZNCBLGhRtSGf4qmrKQMckg1gEEzOVhh4qGOtxqvplSRpObTK086jTgEY8zzxRVqMsN
	GNiQ==
X-Gm-Message-State: AJcUukc9SzngAy+J7PJ/eCfM92bH+y3xBxN+BXfeerRfGHFZwikQATZ0
	aEh9Kz9Pv3ZJYtqweKy9dhLX6lWAJnWrQbPWuz5GOA==
X-Received: by 2002:aca:ed92:: with SMTP id l140mr1126305oih.112.1548338336382;
	Thu, 24 Jan 2019 05:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20190123212234.32068-1-stefanha@redhat.com>
	<CAFEAcA_Edcs-w4UCmARzwV69XUw61ey0qO08_nuEC=Zsvi0N6w@mail.gmail.com>
In-Reply-To: <CAFEAcA_Edcs-w4UCmARzwV69XUw61ey0qO08_nuEC=Zsvi0N6w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jan 2019 13:58:45 +0000
Message-ID: <CAFEAcA_RXn-Krr=NngDzyOnHpQfNM0ytM_vPNnzfdM0x=mgmrw@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v2 0/5] arm: microbit Non-Volatile Memory
 Controller
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Jim Mussared <jim@groklearning.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGYljYrUisa3

On Thu, 24 Jan 2019 at 13:38, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 23 Jan 2019 at 21:23, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > v2:
> >  * Add Patch 2 to call memory_region_flush_rom_device() from pflash devices
> >    [Peter]
> >
> > This series adds the Non-Volatile Memory Controller, which controls access to
> > the User Information Control Registers (UICR), Factory Information Control
> > Registers (FICR), and flash memory.
> >
> > This is the last piece of microbit work needed to make basic programs like
> > Micropython "Hello world" work under QEMU.
>
> I've applied patches 1, 3, 4 and 5 to target-arm.next, thanks.
> Philippe has review comments on 2 and it's not really microbit
> related anyway.

As discussed on IRC, I'm dropping patch 5, because it conflicts
with Julia's patch that drops the usage of global_qtest.

thanks
-- PMM
