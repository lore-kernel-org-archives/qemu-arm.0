Received: by 10.25.205.13 with SMTP id d13csp1362905lfg;
        Sun, 11 Dec 2016 14:54:18 -0800 (PST)
X-Received: by 10.55.120.195 with SMTP id t186mr76565455qkc.218.1481496857913;
        Sun, 11 Dec 2016 14:54:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 43si25118610qtv.54.2016.12.11.14.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Dec 2016 14:54:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGD0b-0005Vn-E8
	for alex.bennee@linaro.org; Sun, 11 Dec 2016 17:54:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGD0V-0005Vd-OB
	for qemu-arm@nongnu.org; Sun, 11 Dec 2016 17:54:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGD0R-00048c-P7
	for qemu-arm@nongnu.org; Sun, 11 Dec 2016 17:54:11 -0500
Received: from mail-ua0-f169.google.com ([209.85.217.169]:36159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cGD0R-0003wk-KU
	for qemu-arm@nongnu.org; Sun, 11 Dec 2016 17:54:07 -0500
Received: by mail-ua0-f169.google.com with SMTP id b35so66543574uaa.3
	for <qemu-arm@nongnu.org>; Sun, 11 Dec 2016 14:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fSVrvSWvEyGQxEkbKwyA0HbqwEIiaE2IPTyaz3D1s18=;
	b=b03i8y1o//hPVnperfdCKNY3EzwAAGqigpCEjfD/Z9I8nC6XHX8i6Y4UF423Ijk1+s
	C9W5PGF/yVV9idYqCUQTX+pFD5knFnblS90CcCVYBjE8sIMDQ/mYeQ/x8RlJK5YZfN5s
	33PfIi8ChUzxfF4/jWQqgorxg6WPGqV44rcwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fSVrvSWvEyGQxEkbKwyA0HbqwEIiaE2IPTyaz3D1s18=;
	b=ak2ZbIKDDyrLVyC491cWDcv9zFKTwj4Hra0YUjKweuNSUN2WMyp/PB5VeZYpuie0PC
	eSbfoP+UqRqeudYVFnoerZDk3YwMLJPUx4zw1lT+4k+jhK5apUyJDEGlaIEkHSnKTun5
	W4U+oENjCstrC0HiFfx7Y/ShUCPjCKpvUKidSxHKLxkRNeGvRulRabMsgtJAzadGK1cC
	lqoBFRDa5cbXO3E2HZQpEGKAJbG3bqKqPimUaNeTP1b1KiNW/IoMkouB2/2/E+GsHTML
	A1gFQ8NqBYRGWODuHHaEYnMaVWrrdi2WKKuub3T3FPZe1P/ylXwG8f2eeoqM7JiKYAA1
	GHGA==
X-Gm-Message-State: AKaTC03lQnrk6JpI78iLroXqhu2gFyI0+2vPVgxCjeuUF8cgA4Zm1Tr4gg41avQIKEYMiPi/AmLM458PuJHttydo
X-Received: by 10.176.2.110 with SMTP id 101mr73528859uas.8.1481496765611;
	Sun, 11 Dec 2016 14:52:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Sun, 11 Dec 2016 14:52:25 -0800 (PST)
In-Reply-To: <20161211163502.GB6352@cbox>
References: <1481301020-21777-1-git-send-email-peter.maydell@linaro.org>
	<1481301020-21777-5-git-send-email-peter.maydell@linaro.org>
	<20161211163502.GB6352@cbox>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Dec 2016 22:52:25 +0000
Message-ID: <CAFEAcA_zvNvJ7K5GgPyeJ5EWRxO1XL2=rc6dv_nT6_h3qF=m6A@mail.gmail.com>
To: Christoffer Dall <christoffer.dall@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.169
Subject: Re: [Qemu-arm] [PATCH 4/4] hw/arm/virt: Don't incorrectly claim
 architectural timer to be edge-triggered
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ry8FNhpjHU1S

On 11 December 2016 at 16:35, Christoffer Dall
<christoffer.dall@linaro.org> wrote:
> On Fri, Dec 09, 2016 at 04:30:20PM +0000, Peter Maydell wrote:
>> +     * For backwards-compatibility, virt-2.8 and earlier will continue
>> +     * to say these are edge-triggered, but later machines will report
>> +     * the correct information.
>>       */
>
> Is this really necessary?

It's being conservative -- from the guest's point of view
(any guest, not necessarily just Linux) "virt-2.8" should behave
like the "virt" machine in the 2.8 QEMU release, including bugs,
not providing newer devices, and so on.

Andrew would be the expert on whether this is being unnecessarily
conservative in this specific case.

>>  static void virt_machine_2_8_options(MachineClass *mc)
>>  {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>> +
>>      virt_machine_2_9_options(mc);
>>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_8);
>> +    /* For 2.8 and earlier we falsely claimed in the DT that
>> +     * our timers were edge-triggered, not level-triggered.
>> +     */
>> +    vmc->claim_edge_triggered_timers = true;
>>  }
>>  DEFINE_VIRT_MACHINE(2, 8)
>>
> I don't understand this virt machine class version stuff.  In which case
> is the claim_edge_triggered_timers set to true?  (ok, appears to be when
> a 2.8 machine is created, but does that happen automatically or does the
> user specifically have to ask for it?)

If you say "-M virt-2.8" (or -2.7 or earlier, etc), it's set
to true. If you say "-M virt" or "-M virt-2.9" (or "-M virt-2.10"
or whatever we call the next release) it stays at the default
false.

thanks
-- PMM
