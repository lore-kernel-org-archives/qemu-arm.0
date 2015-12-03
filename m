Received: by 10.182.158.201 with SMTP id ww9csp3976obb;
        Thu, 3 Dec 2015 06:59:00 -0800 (PST)
X-Received: by 10.140.241.146 with SMTP id m140mr12150962qhc.102.1449154740156;
        Thu, 03 Dec 2015 06:59:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i83si8927500qhc.5.2015.12.03.06.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 06:59:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4VLX-0005TW-TO
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 09:58:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1a4VLV-0005QV-LO
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 09:58:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1a4VLR-0005vQ-Mb
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 09:58:57 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1a4VLP-0005uv-KQ; Thu, 03 Dec 2015 09:58:51 -0500
Received: by vkha189 with SMTP id a189so46621406vkh.2;
	Thu, 03 Dec 2015 06:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SciVxkPBve87+PgfpIacNeikRfXop9Mydy6tWHMwlwg=;
	b=f5V/KubREb5fEXb/83SwSWF3u0bu7xFHd5YvHMoZ31WUBeCSrQlem9WwoC0d9KGIVJ
	xW0OVDuuhy32qY4dkN8VDBnoa5mEvRS/wuGvsf8d+JtJKjLW9ms1tuP0rN6QagU9jtdq
	MpddU7Uv5A9bJaFqHsc9UP5dmPbJbeQqp0GOKYRDMxc01qUjBWfla7OyXWll5fft5MKj
	QTZWqEipjOeswXDUFju/mb7RkiMxjuYSYIa9eNi8Aj012udkfswVRis2/eUNVTnyx3il
	sJD0fb2WGvHhm/+cGg+uAg4gzuTH5aUYTAwbjV9Xm5vMeoK77y4KRGfUaBSaGS0OxIOH
	7Pdw==
MIME-Version: 1.0
X-Received: by 10.31.50.85 with SMTP id y82mr6030308vky.48.1449154731052; Thu,
	03 Dec 2015 06:58:51 -0800 (PST)
Received: by 10.31.219.3 with HTTP; Thu, 3 Dec 2015 06:58:51 -0800 (PST)
In-Reply-To: <CAFEAcA-N2SO-aLSNE8rJ_vUzBS3_ipY6kdW=t9bLa=d4McwYLg@mail.gmail.com>
References: <1448922238-5696-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA-N2SO-aLSNE8rJ_vUzBS3_ipY6kdW=t9bLa=d4McwYLg@mail.gmail.com>
Date: Thu, 3 Dec 2015 15:58:51 +0100
Message-ID: <CABoDooOU4xKWvn2s2ByYPBbhAUqckM2wKAKa23x35f8RVowpXg@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
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
X-TUID: o2MagHn0C/WP

On Thu, Dec 3, 2015 at 3:36 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 November 2015 at 22:23, Andrew Baumann
> <Andrew.Baumann@microsoft.com> wrote:
>> Qemu does not generally perform alignment checks. However, the ARM ARM
>> requires implementation of alignment exceptions for a number of cases
>> including LDREX, and Windows-on-ARM relies on this.
>>
>> This change adds a helper function to raise an alignment exception
>> (data abort), a framework for implementing alignment checks in
>> translated instructions, and adds one such check to the translation of
>> LDREX instruction (for all variants except single-byte loads).
>>
>> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
>> ---
>> I realise this will need to wait until after 2.5, but wanted to get
>> the review feedback started. If needed, I can resend this later.
>>
>> arm_regime_using_lpae_format() is a no-op wrapper I added to export
>> regime_using_lpae_format (which is a static inline). Would it be
>> preferable to simply export the existing function, and rename it? If
>> so, is this still the correct name to use for the function?
>>
>> CONFIG_ALIGNMENT_EXCEPTIONS shows how the check can be conditionally
>> enabled, but isn't presently hooked up to any configure mechanism. I
>> figured that the overhead of an alignment check in LDREX is not high
>> enough to warrant disabling the feature, but if it gets used more
>> widely it might be.
>>
>> The same change is almost certainly applicable to arm64, but I am not
>> in a position to test it.
>
> TCG supports "this load/store should do an alignment check"
> using the MO_ALIGN TCGMemOp flag (which results in a call to
> the CPU's do_unaligned_access hook if the guest address is not
> aligned). I think we should use this core-code functionality
> rather than rolling our own equivalent (it is more efficient).
> There are some examples in a few of the other targets (eg MIPS)
> of how to do this, but basically you need to arrange that the
> initial loads in gen_load_exclusive get the MO_ALIGN flag
> ORed in, and then wire up the do_unaligned_access hook and
> make it raise a suitable exception.

After quickly looking at the code in softmmu_template.h, I wonder if
MO_ALIGN would correcly handle the ldrexd pair case which requires an
8-byte alignment but does 2 4-byte loads (even if the code is tweaked
to read 8-byte at once, then checking 16-byte alignment of AArch64
ldxp 64-bit could not be handled correctly).

Thanks,

Laurent
