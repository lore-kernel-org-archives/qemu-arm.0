Received: by 10.182.158.201 with SMTP id ww9csp217411obb;
        Thu, 3 Dec 2015 13:21:47 -0800 (PST)
X-Received: by 10.55.77.9 with SMTP id a9mr13721009qkb.38.1449177707357;
        Thu, 03 Dec 2015 13:21:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h38si6223013qkh.116.2015.12.03.13.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 13:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:37469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4bJz-0001OF-0z
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 16:21:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a4bJR-0000mq-S9
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 16:21:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1a4bJM-0005J3-W2
	for qemu-devel@nongnu.org; Thu, 03 Dec 2015 16:21:13 -0500
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:36069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1a4bJM-0005Im-Sw; Thu, 03 Dec 2015 16:21:08 -0500
Received: by qkda6 with SMTP id a6so35879419qkd.3;
	Thu, 03 Dec 2015 13:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=nVidxCjawCYtIX0QA7d4jl+LPbgioNQdLmnNVRRZwiM=;
	b=JbaelsZmIX+aFXZOKnp0yHE0zSTBO4r5Ih5wKMKM5iyzwZaRz87Wq+OgvBFkkba5r9
	kr5ZRkoPOhp80J9l1A5N5RYFNqmvJXTOYDdkcpcCTpxETJBOUO8vkUQ6IRHdi+BJu9cW
	aSO+ryd3VgqEigW7fR2TXU9AD2FkQSoKObROnFca2SWVHpBvhDg7K2bk68rYb6TxyuiX
	pQazuD9N5AGLSu5HasqwR8Ep93W9W86FxunOivSdCvZljgri0reFNIBzc6QegVvacxS3
	CBx8pnSZD6GMNYdsIAwGy8JydynRSjLXx3QK+ZU9LbzInQBy8oPhmP6aTX+eFceuyP0z
	n8kQ==
X-Received: by 10.55.203.19 with SMTP id d19mr13987339qkj.57.1449177668239;
	Thu, 03 Dec 2015 13:21:08 -0800 (PST)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	z2sm4067738qhz.38.2015.12.03.13.21.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Dec 2015 13:21:06 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Laurent Desnogues <laurent.desnogues@gmail.com>
References: <1448922238-5696-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA-N2SO-aLSNE8rJ_vUzBS3_ipY6kdW=t9bLa=d4McwYLg@mail.gmail.com>
	<CABoDooOU4xKWvn2s2ByYPBbhAUqckM2wKAKa23x35f8RVowpXg@mail.gmail.com>
	<CAFEAcA_wkdN-mKGy3hR6dZWkK1NGK4Xo7FCN_qZqKLk1=GzGFw@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5660B23F.9030701@twiddle.net>
Date: Thu, 3 Dec 2015 13:21:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_wkdN-mKGy3hR6dZWkK1NGK4Xo7FCN_qZqKLk1=GzGFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::231
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: Re: [Qemu-devel] [PATCH] target-arm: raise exception on misaligned
 LDREX operands
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IJetdTajgwJJ

On 12/03/2015 07:08 AM, Peter Maydell wrote:
> On 3 December 2015 at 14:58, Laurent Desnogues
> <laurent.desnogues@gmail.com> wrote:
>> On Thu, Dec 3, 2015 at 3:36 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 30 November 2015 at 22:23, Andrew Baumann
>>> <Andrew.Baumann@microsoft.com> wrote:
>>>> Qemu does not generally perform alignment checks. However, the ARM ARM
>>>> requires implementation of alignment exceptions for a number of cases
>>>> including LDREX, and Windows-on-ARM relies on this.
> 
>>> TCG supports "this load/store should do an alignment check"
>>> using the MO_ALIGN TCGMemOp flag (which results in a call to
>>> the CPU's do_unaligned_access hook if the guest address is not
>>> aligned). I think we should use this core-code functionality
>>> rather than rolling our own equivalent (it is more efficient).
>>> There are some examples in a few of the other targets (eg MIPS)
>>> of how to do this, but basically you need to arrange that the
>>> initial loads in gen_load_exclusive get the MO_ALIGN flag
>>> ORed in, and then wire up the do_unaligned_access hook and
>>> make it raise a suitable exception.
>>
>> After quickly looking at the code in softmmu_template.h, I wonder if
>> MO_ALIGN would correcly handle the ldrexd pair case which requires an
>> 8-byte alignment but does 2 4-byte loads (even if the code is tweaked
>> to read 8-byte at once, then checking 16-byte alignment of AArch64
>> ldxp 64-bit could not be handled correctly).
> 
> You're right, those are not going to be handled correctly.
> But I think it would be better to enhance the MO_ALIGN
> handling somehow to deal with "must be more highly aligned than
> the datasize" cases as well as the "alignment must match datasize"
> ones. 

What's the full set of features that you'd like here?

> (As you say we'd need
> to do the ldrexd as a 64-bit access, but we should do that
> anyway because it's supposed to be single-copy-atomic,
> architecturally speaking.)

Something to remember for future is that we're not doing single-copy of 64-bit
data for 32-bit hosts.  I'm not even sure that's generally possible without
generating awful code.


r~

