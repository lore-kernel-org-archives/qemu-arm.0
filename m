Received: by 10.182.158.201 with SMTP id ww9csp3768333obb;
        Thu, 3 Dec 2015 06:36:58 -0800 (PST)
X-Received: by 10.140.101.51 with SMTP id t48mr11712363qge.71.1449153418083;
        Thu, 03 Dec 2015 06:36:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si5337850qge.70.2015.12.03.06.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 06:36:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:35735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4V0D-0002gO-NL
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 09:36:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4V0B-0002fV-9k
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 09:36:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4V05-0006OY-IA
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 09:36:55 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4V05-0006Nv-E0
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 09:36:49 -0500
Received: by vkca188 with SMTP id a188so46723675vkc.0
	for <qemu-arm@nongnu.org>; Thu, 03 Dec 2015 06:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Pp1N72zb4xN+F7k9nRbwepYG8obJJeP6g1I+5MBr4yg=;
	b=kc0m0Q7CRxRQ/YKBEyg6xRdZQdXI3s8ie+AjXBVCyFnwYZw5AUEQUdIfe7lQ8hGMo5
	5PgFXi5pX/pN2C0cyIY2fmLOp/4+fokEqZJ/9IR9xAjUev9p5PQjbqk7c/FcWRmV1qLv
	Mm0VH0+rfX6Gs9V2faccSGwaUhmIh1c0TNZGuu+FjaruO71qe0VtnmjzUJb5LDhGJ4Vu
	hydjc53M07Tv+u66wQmCLyQG8V21e6yqQyzo7AqQmnsYXra097PuCnkW+EpM78yco1j5
	tok8VVfYvpn813L4LjWc8nxBe4h1x9RWufuYH+FnDdkcpmqXPk2L1IukmzFWlOqnq5ov
	tqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Pp1N72zb4xN+F7k9nRbwepYG8obJJeP6g1I+5MBr4yg=;
	b=juz0LAEFGQBsOZ5JvbVjVlBW6fHp/pJcxbuoiyUaa9qpRB2HHiZenZPch6fO6ATCWC
	trPHmvCRUwOH5X6Y92hN0GkQhkhN2hhnZ646+BbBetirv0n7Ro0dexlvTZtfFruq3I5h
	Ype95BLXMj0D+aVShhbQCb/0mQYG3bjsgpyx28o8UD4MXvbr94tMoReaTH+8eZGJbKX4
	Xr7e/Zf+ljZlQbEy6zwSsDp8CgrSFaWvPram/2nYw04NmMHBwTM9aZhN35s5odtj748P
	wzGpAphckB4KQOgTE0bla39Wm0UzLQ290K4fQamlMluvdPTupG8jvVqkb9FC+tehCLeK
	0s6g==
X-Gm-Message-State: ALoCoQlkrfd10ojpf9UVSG2ba3iy1MF6NBZnjyqZUAAfmfFpUG5FahzYciR5RH1mHjR9SK3oiYYq
X-Received: by 10.31.194.201 with SMTP id s192mr6274211vkf.92.1449153408938;
	Thu, 03 Dec 2015 06:36:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 3 Dec 2015 06:36:29 -0800 (PST)
In-Reply-To: <1448922238-5696-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1448922238-5696-1-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 14:36:29 +0000
Message-ID: <CAFEAcA-N2SO-aLSNE8rJ_vUzBS3_ipY6kdW=t9bLa=d4McwYLg@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: raise exception on misaligned
	LDREX operands
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
X-TUID: QoX49gjxg544

On 30 November 2015 at 22:23, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Qemu does not generally perform alignment checks. However, the ARM ARM
> requires implementation of alignment exceptions for a number of cases
> including LDREX, and Windows-on-ARM relies on this.
>
> This change adds a helper function to raise an alignment exception
> (data abort), a framework for implementing alignment checks in
> translated instructions, and adds one such check to the translation of
> LDREX instruction (for all variants except single-byte loads).
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> I realise this will need to wait until after 2.5, but wanted to get
> the review feedback started. If needed, I can resend this later.
>
> arm_regime_using_lpae_format() is a no-op wrapper I added to export
> regime_using_lpae_format (which is a static inline). Would it be
> preferable to simply export the existing function, and rename it? If
> so, is this still the correct name to use for the function?
>
> CONFIG_ALIGNMENT_EXCEPTIONS shows how the check can be conditionally
> enabled, but isn't presently hooked up to any configure mechanism. I
> figured that the overhead of an alignment check in LDREX is not high
> enough to warrant disabling the feature, but if it gets used more
> widely it might be.
>
> The same change is almost certainly applicable to arm64, but I am not
> in a position to test it.

TCG supports "this load/store should do an alignment check"
using the MO_ALIGN TCGMemOp flag (which results in a call to
the CPU's do_unaligned_access hook if the guest address is not
aligned). I think we should use this core-code functionality
rather than rolling our own equivalent (it is more efficient).
There are some examples in a few of the other targets (eg MIPS)
of how to do this, but basically you need to arrange that the
initial loads in gen_load_exclusive get the MO_ALIGN flag
ORed in, and then wire up the do_unaligned_access hook and
make it raise a suitable exception.

thanks
-- PMM
