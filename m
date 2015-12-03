Received: by 10.182.158.201 with SMTP id ww9csp11904obb;
        Thu, 3 Dec 2015 07:08:46 -0800 (PST)
X-Received: by 10.140.93.52 with SMTP id c49mr11504127qge.101.1449155326189;
        Thu, 03 Dec 2015 07:08:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 142si4988718qhq.87.2015.12.03.07.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 07:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:35891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4VUz-00050V-S0
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 10:08:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4VUt-0004pX-7y
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4VUs-0001vW-5w
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:08:39 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4VUs-0001vP-0s
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:08:38 -0500
Received: by vkca188 with SMTP id a188so47374230vkc.0
	for <qemu-arm@nongnu.org>; Thu, 03 Dec 2015 07:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JeTG3V8y431DsU6jbt+CcafFyo5Nh13CMUViHvln0Os=;
	b=mg+8laQLDW6XgGhM3ShXnb2Hs00Y3ailaBrs3eq3i9izjL3RF+IdW//wMAxMbnjPu6
	HyGKV0MAq/F9EGjRugXBlLUeuoR7gUGIPWxE+Q67eteehIvwAbwhJyptsh6kpLG8FCPG
	U11ShyOaL4opydnNWFglE2H0eaWUDkFhP35L3oKrHhg/VbTlpgqj8onQgdTMNtrKfGMI
	Vt8s9xgkFJ7/qW9ZmyOvnLfSR9Irs28J57yws1xB7dp4k2Z2fetfeIFDPBq9n0jfotY3
	Nl0mlaEwPNW28IdY0k/RffxhqRn2D7HQ6yNX6R4wK2Lo9871KvEgnuFT5z71nffZgnnj
	GiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JeTG3V8y431DsU6jbt+CcafFyo5Nh13CMUViHvln0Os=;
	b=Mmmf7DY0dJiT9qOGPJarsEoLZzek+Z4SHbhjbffPrGpdJlvmvmrwzxDO5ORFUPiGDw
	Eiq80oNn98WWJmF06R2wrI5cJdFu72CMIzD3nprYXKgI/wNCfpBiVsHRuWvEWSZMsEQB
	rOZec/AxqITk1E2wiOpwbPfxPtnygWlT++qTE2Xihh+kC8oc4O9N3e3haxDwhh2wEwvD
	Fi1pelp/gA5alxIVk1N6MnW13NVXltqiCFoRbNVV2NFg1pcy30zTsg+aPlp0TYq5nFR4
	XGo55+9rGwAUIS63MUP6UM01kSzgOem6sBw5VPL42Jz0N8NX+Defpm8+WOWZFE47NtOS
	yozQ==
X-Gm-Message-State: ALoCoQmbDrD/r3qy3V7d6e16O/jW6cnTsHxrgZQQ2iWm6GjSJbwkZGNcmxpHAKwwIJNFyavx60KF
X-Received: by 10.31.13.205 with SMTP id 196mr6681644vkn.37.1449155317185;
	Thu, 03 Dec 2015 07:08:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 3 Dec 2015 07:08:17 -0800 (PST)
In-Reply-To: <CABoDooOU4xKWvn2s2ByYPBbhAUqckM2wKAKa23x35f8RVowpXg@mail.gmail.com>
References: <1448922238-5696-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA-N2SO-aLSNE8rJ_vUzBS3_ipY6kdW=t9bLa=d4McwYLg@mail.gmail.com>
	<CABoDooOU4xKWvn2s2ByYPBbhAUqckM2wKAKa23x35f8RVowpXg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 15:08:17 +0000
Message-ID: <CAFEAcA_wkdN-mKGy3hR6dZWkK1NGK4Xo7FCN_qZqKLk1=GzGFw@mail.gmail.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: raise exception on
 misaligned LDREX operands
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YZnyZJmXSeAJ

On 3 December 2015 at 14:58, Laurent Desnogues
<laurent.desnogues@gmail.com> wrote:
> On Thu, Dec 3, 2015 at 3:36 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 30 November 2015 at 22:23, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>>> Qemu does not generally perform alignment checks. However, the ARM ARM
>>> requires implementation of alignment exceptions for a number of cases
>>> including LDREX, and Windows-on-ARM relies on this.

>> TCG supports "this load/store should do an alignment check"
>> using the MO_ALIGN TCGMemOp flag (which results in a call to
>> the CPU's do_unaligned_access hook if the guest address is not
>> aligned). I think we should use this core-code functionality
>> rather than rolling our own equivalent (it is more efficient).
>> There are some examples in a few of the other targets (eg MIPS)
>> of how to do this, but basically you need to arrange that the
>> initial loads in gen_load_exclusive get the MO_ALIGN flag
>> ORed in, and then wire up the do_unaligned_access hook and
>> make it raise a suitable exception.
>
> After quickly looking at the code in softmmu_template.h, I wonder if
> MO_ALIGN would correcly handle the ldrexd pair case which requires an
> 8-byte alignment but does 2 4-byte loads (even if the code is tweaked
> to read 8-byte at once, then checking 16-byte alignment of AArch64
> ldxp 64-bit could not be handled correctly).

You're right, those are not going to be handled correctly.
But I think it would be better to enhance the MO_ALIGN
handling somehow to deal with "must be more highly aligned than
the datasize" cases as well as the "alignment must match datasize"
ones. And we can definitely deal with all the AArch32 cases
ok, which are the ones Andrew needs. (As you say we'd need
to do the ldrexd as a 64-bit access, but we should do that
anyway because it's supposed to be single-copy-atomic,
architecturally speaking.)

thanks
-- PMM
