Received: by 10.28.71.27 with SMTP id u27csp1771468wma;
        Thu, 22 Feb 2018 02:01:43 -0800 (PST)
X-Google-Smtp-Source: AH8x224e4+JDPuIKtn8QUhjxaG2JiuFVjTU1bSQBffBoC+8TrzR344LjV8tOovfrRl5BrpjWe9LO
X-Received: by 2002:a25:41d4:: with SMTP id o203-v6mr4214438yba.141.1519293703443;
        Thu, 22 Feb 2018 02:01:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519293703; cv=none;
        d=google.com; s=arc-20160816;
        b=UkcdURwvR3riA+u033m7CyaIG9QHsxyjXP4BiecNqTKO1DzXEenfAHbOjb132QRkJL
         nf3SRUlYuRA7FawKYBYdMdsM5ocdY4xJA+OgU9yt3bkyLsjZCX3dhHNgHdDU8JpKEU2x
         kYQ/HteriuTdYsgmMYYWTB6eWKfmKKLXl2/beadRfwUuwJYflaQ3/Evf8mBCZMXLtcM4
         ltp44cgqP9itYJu5bZcJME8PFuiKhe4sso8UiT6HOKiFmyHL0DpNRRV7mVefYheZ6ECp
         SAc+B4dTed8uUnDGcvR4HFj32LvzclRCLL01Z7vMK70IMgt7uDHUBivSHE7TLrK0Oq7H
         AJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zR1aw6QIKvQQFXfAzxW5rD1jZNKkYT34+fMIQ3LgFUA=;
        b=q4G4oXkTZnsNHSc3Rf5bl5wy0A82a3KMPctqIEw82v8eyfJquGbKHQDPT64phMRimz
         6+NrQcrZRbJ87w7xnsPVPJfzahDUXdmAKKM2PmAL1+6pU6vM7j5pU76oxncmp0b/j87H
         LcpyycWNJ5B2wkgevFitxmObC1+VqMc2qrJXExfCOWkldPD0jSxk/muwFntu0npVnu/j
         d6DRQ2Dv+CT3hw36LrpUaFvVKnHuP+OYURcETg/oL8+z4XmPV6EbK/IrBG+3cZ/yWYKT
         gxF9gOq7kXNlxBr8jlIWEW5GnbGcQ45vQGYUK4sF/N4610wD+qk/0Z2D2qGX7+C6omxc
         c0tA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEYzOXBR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t24si2061165ybt.709.2018.02.22.02.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 02:01:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FEYzOXBR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eonh8-00062y-Uw
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 05:01:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eongs-00061s-51
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 05:01:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eongn-0008Hb-HR
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 05:01:26 -0500
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:36531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eongn-0008H7-CJ
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 05:01:21 -0500
Received: by mail-oi0-x230.google.com with SMTP id 24so3288029oij.3
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zR1aw6QIKvQQFXfAzxW5rD1jZNKkYT34+fMIQ3LgFUA=;
	b=FEYzOXBRxUFcfNuMAOFGQYJAYjN/4ZLjRsvnkJA9fXC7DoY7VGViF9U7E+lzljscbV
	xOCsmz4S7z+p3jCJBg3+cvR7EkqK+8ANH635PqjS4KvPx1//tuCPmpv/GVl7HyJJYden
	8Hb/TqLJR/6tDSmhpHUjvpjPyw3D2Kp25qCNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zR1aw6QIKvQQFXfAzxW5rD1jZNKkYT34+fMIQ3LgFUA=;
	b=UzfsvcuyrTlJN47chmXsP9jY/Zt1DMaSZ/MqjWEjYV5GJr830EQ5ioETZDZK8+iDNo
	xF25Ve7buSlHoFsbCxMRGQ9/7sHwWsOz+G8Aekp82lxO9GuMnDwp2mtFzVPlDInFXbUQ
	V4UCv3Qdgo53bsaeCwhZ8bhJfSGgDAo4+kSRKnjBJp1kaxVIK22cET1Ca+Co9R8sn/Lh
	NDgU/2tCd8IwPSIIgFMjmRwJCyVQhIz5Fdsce1n0guMfuw6mtALXCHYSbJamTS+yXgtk
	NVm8LkWeavmiq0MEmF8kK4oNxQQMmEKUpX78ZvYvbn2o5IDhRUcY+f+eLCo7wlCMZQIt
	G19w==
X-Gm-Message-State: APf1xPD8blvnm+3tuvDPZ9SrtC9n5/bcjxT0V43470CazXraXiVmiMna
	H9NmkP70UXeIO9gH/JAddNh20WLJhAEldmlJGX26zQ==
X-Received: by 10.202.17.13 with SMTP id 13mr3936016oir.164.1519293680271;
	Thu, 22 Feb 2018 02:01:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 02:00:59 -0800 (PST)
In-Reply-To: <CAFmp02w8XoiRket_sAGziU3bDX3w+NWVwvBkbT0XE_xrbG-TVg@mail.gmail.com>
References: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
	<CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
	<CAFmp02xLicV+dSFhJjYX8djQMGvVaYtih6hB9HAd4HqnA2=VfQ@mail.gmail.com>
	<CAFEAcA9q=u-wF96WW3oJ=1PDuA7bAn_k-YiGRf2gn8Appj8mBw@mail.gmail.com>
	<CAFmp02w8XoiRket_sAGziU3bDX3w+NWVwvBkbT0XE_xrbG-TVg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 10:00:59 +0000
Message-ID: <CAFEAcA9xv06hquekGd-6+MNn_U1FYan11ihccy03U0cuzx+c2g@mail.gmail.com>
To: Rd Cheung <rdzhang@vt.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-arm] ARM cortex-m3 instruction fetch misbehaves during
 do_v7m_exception_exit
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dFpbaL+mOqhe

On 22 February 2018 at 04:09, Rd Cheung <rdzhang@vt.edu> wrote:
> I have turned on the log options and I find out the execution will go
> into the same interrupt service routine for multiple times as soon as
> it exits from execption handler, before it hits its expected return address.

What device is the interrupt handler for? Sometimes you can get
this behaviour in QEMU for timer interrupts if the guest code
programs the timer for a fast interrupt rate that is faster
than QEMU's emulation speed can handle.

> So I look into the NVIC registers in cortex M3. I find out the ISPR
> register (interrupt set pending registers) in NVIC is not function normally.

If you're dealing with interrupt numbers larger than 32 you'll
need the bug fix in master in commit 12fbf1a1639ed91, which
fixed problems with ISPR for larger interrupt numbers.

> I made a breakpoint just before the code exit the exception handler.
> And I use 'x /20xw 0xe000e200' to check the ISPR register. At this point,
> the
> value is 0x0, and then I type 'si' to gdb, and the code go to the expected
> return
>  address. Then I 'x /20xw 0xe000e200' again, but this time, the value is
> 0x10,
> which indicates an interrupt is pending. If I type 'c' in gdb, the code will
> go to the
> interrupt service routine again.

Especially if you're stepping in gdb this can happen for timers,
because the timer will expire while you're stopped in gdb, and
then fire as soon as you let QEMU run.

thanks
-- PMM
