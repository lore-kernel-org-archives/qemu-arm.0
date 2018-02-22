Received: by 10.28.71.27 with SMTP id u27csp1970641wma;
        Thu, 22 Feb 2018 05:43:18 -0800 (PST)
X-Google-Smtp-Source: AH8x224hjBHp/A5ZpYTbPPHTIHqFLJEMCaHqRNPWD91ZtkVD2UCvKXgPuHOVykQl8/kElRO/SBpP
X-Received: by 10.129.118.18 with SMTP id r18mr4719401ywc.96.1519306997974;
        Thu, 22 Feb 2018 05:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519306997; cv=none;
        d=google.com; s=arc-20160816;
        b=v7N4lCoXlN18jI7o1gbLjYdEkUcwk81hcBzrEUMOgMK3HJA7mJX7jrMg3x5i62LSR9
         FcbAe2ZEnf67TT6iqtQojuxhhO/0Bgm+8GPMpR+qlU5zsrndvIYycaBsSPzQI/r4mt18
         sQPa7LjyXWuazF95NWhDGTgNqSkJRy309DrnmXVkrOx9bu9d8/nR3pqEU/THJ74BurIS
         LaQsqLf8oc7u+rQz5HkqN+U5fMiqfkvUewU8fvZ6G6X3XmfJt8iDnWENXM4zlo+U1Zi7
         5wNW++9biVK8Bt6vRT3oUKyG65pPJZw6v4PjcmAfu7StgZotsicgrHuilILgAGVRbhyx
         x1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eO8yVK7Dbl5Fjz6s7PXxNWU2RmyVVXdfoa+BAxl2WBU=;
        b=iqOI50CJ7efxpE+s+IfK6eLO1fAB6446z+WPH5FfBYtrLED/18/QoyUbbK/thLZ3ap
         UoRbrVQtypsbXSPcbgmlnCzWFgt4IQsAjHZSo2b02Q/bajMn5W2LLCPL0EOml79ycMn8
         ZfqZZdbBU4EVwGiLxP9BZMlkI9I2/OlYNjAcRe2eHG55JSh2Q+Po4RuCsmIiCTNy6f3W
         C+om4rdpVTHxxvdXk0k89KNG7B+j20KCmqo6F+wnrqQ2rg75iMHhaxpcmM7iFWvdnTz/
         E+9LVaQ3CEmYShXgujUwGIpq79WeavqeHsST4awk5c44pufbNG4wnj33KhO2zSRhjCTd
         EyFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QwXTblo2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s126si19274ywg.134.2018.02.22.05.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 05:43:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QwXTblo2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eor9Z-0002zR-G9
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 08:43:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eor9S-0002z8-9K
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 08:43:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eor9R-0003mY-FT
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 08:43:10 -0500
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:35716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eor9R-0003mF-9P
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 08:43:09 -0500
Received: by mail-oi0-x22e.google.com with SMTP id x10so1150806oig.2
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 05:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eO8yVK7Dbl5Fjz6s7PXxNWU2RmyVVXdfoa+BAxl2WBU=;
	b=QwXTblo2aKUXlCFvSVnK1/ronNjtD4P5qZpq9OliR0gH4zo5fu9Mn1m7DRX38LKc9b
	Ns9FEzLEAwsoTqik83zeZVXJZ8WO8404jzOgEd/FB420BbLbUSf2uB2FJhedHD2lAjqU
	vbEdMu2TBdVX2u8vV7p4KJpUaT/KxBlbYyFpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eO8yVK7Dbl5Fjz6s7PXxNWU2RmyVVXdfoa+BAxl2WBU=;
	b=A48mVkyY2VqsQuh0/5vqaJN4filyTzTBly0Y6sS3YTwjERvFsT+B2YLJETCoEJb9ng
	S5Mdj1yeHUd/UJYJixd9uVI2VF75VOj2a8I0sB+l1obU0HabGCuFqtAWmEG7aQ/oLkqT
	YtdwZx53bwrWJzV4XLJquNfr8uEc8MrytsYxxzfyeC15/Rym7x5q4fS8hmCgaZqeLlhe
	i/yWP7nz4f+jG1ulsx1h9APGOaQvmsW9yajZt7SEf/IwlveeFyOFLHAUU2wZvLm/qjFG
	zU5i7biX3QoES0fw1AFZAuCZyV+QRaxLxZ2tjMHO1hMwFl3po7l+A3/5qgPCVgc5FF9Q
	Fr+Q==
X-Gm-Message-State: APf1xPD+qSc+D698GLGlrqWvOOYpDxq5PsguuAp4PmAqCG5Vh3q8IJpX
	osCGPEMgMR/cKtP27y+98FVJUGyWcFAHrrK1bssUpg==
X-Received: by 10.202.216.67 with SMTP id p64mr4391392oig.337.1519306988217;
	Thu, 22 Feb 2018 05:43:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 05:42:47 -0800 (PST)
In-Reply-To: <CAFmp02y=n4RQQKvd1NEeDjX5OoX4sao-bULfSO_3iSHksEnpzg@mail.gmail.com>
References: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
	<CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
	<CAFmp02xLicV+dSFhJjYX8djQMGvVaYtih6hB9HAd4HqnA2=VfQ@mail.gmail.com>
	<CAFEAcA9q=u-wF96WW3oJ=1PDuA7bAn_k-YiGRf2gn8Appj8mBw@mail.gmail.com>
	<CAFmp02w8XoiRket_sAGziU3bDX3w+NWVwvBkbT0XE_xrbG-TVg@mail.gmail.com>
	<CAFEAcA9xv06hquekGd-6+MNn_U1FYan11ihccy03U0cuzx+c2g@mail.gmail.com>
	<CAFmp02y=n4RQQKvd1NEeDjX5OoX4sao-bULfSO_3iSHksEnpzg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 13:42:47 +0000
Message-ID: <CAFEAcA9En65ctWd6RigQmBz+ECV_TF-WOG9DGWWNLjFDhcs7Ww@mail.gmail.com>
To: Rd Cheung <rdzhang@vt.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22e
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
X-TUID: Zei25i5ZOMKf

On 22 February 2018 at 13:19, Rd Cheung <rdzhang@vt.edu> wrote:
>> What device is the interrupt handler for? Sometimes you can get
>> this behaviour in QEMU for timer interrupts if the guest code
>> programs the timer for a fast interrupt rate that is faster
>> than QEMU's emulation speed can handle.
>
> The interrupt handler is for a real time clock device and the interrupt
> number is 5. I trim the gptm code for stellaris because the firmware
> image only need real time clock for now. I set up a  qemu_log_mask
> right before the device use qemu_set_irq to raise an interrupt. And
> from the log, the qemu_set_irq is triggered only once. I guess fast
> interrupt rate would not affect in this case, since it is not
> continuously triggering an interrupt.

Is the device also clearing the interrupt status by calling
qemu_set_irq() with a level of 0 (this should happen when your
guest's interrupt handler does whatever it needs to do to the
device to clear the interrupt) ? If the device is still asserting
the interrupt when the ISR returns, the M profile CPU architecture
requires that it is automatically made pending again (so it will
likely be taken immediately). This is documented in the ARMv7M
Architecture Reference Manual (DDI0403E.b) in section B3.4.1
"NVIC operation". QEMU implements this in the armv7m_nvic_complete_irq()
function.

> And from the log in previous email, I assume the interrupt has been
> cleared during exit, because the IABR (interrupt active bit register)
> is cleared after exit. I am confused about why ISPR (interrupt set
> pending register) is set after exception exit. The proper behavior shall
> not include this.

I think you're seeing the correct CPU behaviour here, and the
problem is that the device isn't deasserting the interrupt line.
Either the device code is wrong, or the guest code is wrong and
not doing what it should to tell the device to stop asserting the
interrupt line.

thanks
-- PMM
