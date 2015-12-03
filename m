Received: by 10.182.158.201 with SMTP id ww9csp241389obb;
        Thu, 3 Dec 2015 14:17:16 -0800 (PST)
X-Received: by 10.140.133.145 with SMTP id 139mr15308557qhf.0.1449181036528;
        Thu, 03 Dec 2015 14:17:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y70si10833282qgd.62.2015.12.03.14.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 14:17:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:37640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4cBg-0006Tl-A3
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 17:17:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4cBe-0006Sw-FQ
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 17:17:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4cBd-0007Ao-9o
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 17:17:14 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a4cBd-0007AA-2x
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 17:17:13 -0500
Received: by vkha189 with SMTP id a189so54566775vkh.2
	for <qemu-arm@nongnu.org>; Thu, 03 Dec 2015 14:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KABDOyB+L2HJHLtAjfAHon4JSZVPXG3ONNsApgve1KY=;
	b=V00qrVzD0uI4tAYObGkb/Qk37oExLY4xP9JTAP+Kph9Hva3tBkqvWkf1j5tdXeuF3P
	WPLQOAqbH/CvaZwL5QqFlaQe3k/aObcwuEFIXciRaaDcsJjIUKzkeKEE7FCQxSXwu7o8
	Sto9NUkFPtgTV7+qDglAWimMGzP1N1/6g3w4hLFfi0YXX2jgpgCsVcjaSXl0GSLKQDW2
	1AV/t85oicXTONRRS4d0CBSpRADBX0IwWPZOdy2uMOqTXKMKUU9STQc+JVHmxWwJkKXs
	bOf4JOyCPUp/3tXAzACFkGf816CLp/z5rZBiwQTS5plajvNMqCkvQPn6bgIxitwIjrRZ
	AMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KABDOyB+L2HJHLtAjfAHon4JSZVPXG3ONNsApgve1KY=;
	b=PNKwWG7FT0dZ2hagIlsRlkwGkw856v/TcKDX7T+QP9VFHjBlth5I97gpp+we6cyP94
	yijcTGTx/mcLObpUU76G1nK4Nt1xpOLnpdFYyCQ2QdsJ0Le9JkoSqBvATtfZOci27RiR
	XjxyTqcT4LC73uG/lE0BUmLckYVhFbxichQmhAKWpGyXwJL/3s5md4VAsX5huBjhtHbQ
	IntEf1InFEz6OFW7G8dPejx5ZGRKyIIpx9K2Go4HNR0W4YuLW17BW+lpSwEojxaDyjdB
	0JWck1+8lmnqMAxrLgD6INJR+1n1memtgZ4oMa9aEw0bTFc84oKJq4lAESx3qHfKNBoc
	5PwA==
X-Gm-Message-State: ALoCoQk3n2KHdQtgxhLJFSBLKrX5XMaF56IxBRBFiNMiTfm3asW/H94CfTz6qksi8ZMeY/9VW2xu
X-Received: by 10.31.107.193 with SMTP id k62mr7395370vki.27.1449181032221;
	Thu, 03 Dec 2015 14:17:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 3 Dec 2015 14:16:52 -0800 (PST)
In-Reply-To: <5660B23F.9030701@twiddle.net>
References: <1448922238-5696-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAFEAcA-N2SO-aLSNE8rJ_vUzBS3_ipY6kdW=t9bLa=d4McwYLg@mail.gmail.com>
	<CABoDooOU4xKWvn2s2ByYPBbhAUqckM2wKAKa23x35f8RVowpXg@mail.gmail.com>
	<CAFEAcA_wkdN-mKGy3hR6dZWkK1NGK4Xo7FCN_qZqKLk1=GzGFw@mail.gmail.com>
	<5660B23F.9030701@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Dec 2015 22:16:52 +0000
Message-ID: <CAFEAcA91GG2w9SMeY=ogcp5yYQroL6sQ+S5F4z55KYDXz0PkQQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
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
X-TUID: +Z3EePs7+nln

On 3 December 2015 at 21:21, Richard Henderson <rth@twiddle.net> wrote:
> On 12/03/2015 07:08 AM, Peter Maydell wrote:
>> On 3 December 2015 at 14:58, Laurent Desnogues
>> <laurent.desnogues@gmail.com> wrote:
>>> After quickly looking at the code in softmmu_template.h, I wonder if
>>> MO_ALIGN would correcly handle the ldrexd pair case which requires an
>>> 8-byte alignment but does 2 4-byte loads (even if the code is tweaked
>>> to read 8-byte at once, then checking 16-byte alignment of AArch64
>>> ldxp 64-bit could not be handled correctly).
>>
>> You're right, those are not going to be handled correctly.
>> But I think it would be better to enhance the MO_ALIGN
>> handling somehow to deal with "must be more highly aligned than
>> the datasize" cases as well as the "alignment must match datasize"
>> ones.
>
> What's the full set of features that you'd like here?

As Laurent says, for the "load-pair" instructions we need to
be able to load data into two registers with an alignment
corresponding to the whole thing. We can obviously do
'load 2x 32 bit regs' with a 64-bit load and then split the
result into the two values, but the 'load 2x 64 bit regs'
would need either a 128 bit load or a 'load 64 bit reg
with 128 bit aligment'.

The other instructions with wider-than-the-type alignment
are the SIMD ones, which can ask for an alignment of up to
256 bits (for instance VLD1 multiple-single-elements).
You could reasonably argue that there we should just emit code
to do the check, since we're already pre-calculating the
address and then emitting a lot of load or store TCG ops.

>> (As you say we'd need
>> to do the ldrexd as a 64-bit access, but we should do that
>> anyway because it's supposed to be single-copy-atomic,
>> architecturally speaking.)
>
> Something to remember for future is that we're not doing single-copy
> of 64-bit data for 32-bit hosts.  I'm not even sure that's generally
> possible without generating awful code.

Since this is in LDREXD we're going to be doing something
fairly heavy-overhead anyway for the exclusive handling,
but yes, worth remembering when we have multithreaded TCG.
(Guests do rely on the single-copy-atomicity of (non-exclusive)
64 bit accesses for updating page table entries for LPAE CPUs.)

thanks
-- PMM
