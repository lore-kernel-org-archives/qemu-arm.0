Received: by 10.28.91.67 with SMTP id p64csp549110wmb;
        Wed, 28 Feb 2018 04:28:01 -0800 (PST)
X-Google-Smtp-Source: AG47ELuBlSZBZqX5OS55kl99mEgD31J80hPd1ABEoLTqXAjLRsWhS/aoBVQk6T2RD6aTx4H0u2Gu
X-Received: by 2002:a25:9841:: with SMTP id k1-v6mr11830180ybo.109.1519820881667;
        Wed, 28 Feb 2018 04:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519820881; cv=none;
        d=google.com; s=arc-20160816;
        b=C43rzewKyc9QCtqOi2iWE4Sf8PuyXrlQ1oubX1cPNfWvZ8RaU8gS8hykMUQOVRdeXr
         oY5IDjaUrfvUqY/lWHGZSazb9uv9TC4G0eU5amPZMMBsPVNTTM7Mo4F8j+Ps7cv8DCZ7
         HBJISP62hNxrN5oSc0kD2+kf9x0YS/UHnbfvqQX11njgkNV4Iuyj1QWjUO5Foz54HY7C
         6mPDd2efGuK9S/URs8p+yRtQodA1/xjMwGzjLLrl+SQiLxPDQxYf43J10Zz3IC+VnPDV
         e3gLByn98SxfAf4zoAgxPb/DsdhnEocQmsL1KggrfrEgfruDS2Xf72tBR7+5juYHCxEQ
         QdTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=0kpR14+NvdhkKG2FT8eGfiyVJN4Jo5S3TFF36megp4g=;
        b=ldvuMFX38Lra71LMbtELUrVk2XS5e9rw/n80Lnb38pj9nFOXvtbHsntID/4ziVfUBU
         ORS2cncZbTF5XhiT+qMpO5rzziBOraRBuikqWMQrZw79thebKgJ9sdIHwbDhLIJYO2Mb
         XWPZBWLktd+GQq+Jvn8/8CDVERgugVzsFdY+XadvnXUR5YrIpIIHI2Yl1URJSXcfqvSp
         dbjF/q1CAfGMjnCpkbe01Ps0sulRfzEz9mj8IFy3DBkoaDvuef6jtv9B1U3NNXIFON2X
         tilvWDgZm3HT2VfvRw0/7l8XaRfdzNxyPjvk+BFSwTwQIvrKD4nJQW2iLRIqdcpODB+5
         R1Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QQkbwiEF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f82-v6si247570ybc.476.2018.02.28.04.28.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 04:28:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QQkbwiEF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43676 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er0q1-0008Iq-2I
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 07:28:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1er0pp-0008Gn-Sy
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 07:27:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1er0po-00079e-V0
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 07:27:49 -0500
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:34712)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1er0po-00079B-OU
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 07:27:48 -0500
Received: by mail-ot0-x233.google.com with SMTP id n74so2045961ota.1
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 04:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0kpR14+NvdhkKG2FT8eGfiyVJN4Jo5S3TFF36megp4g=;
	b=QQkbwiEFs7+U8HiT3Zd2fog6cmASN378pNKUjYWm8S5KByKbrs/zRUbvJw7xeKixxL
	xjmjrmNNZHshfem9VneeiI4FqZKNrfqXaXOG63zTr7DAXfPQIhf+Ary4MvWSmFKRudyn
	6t+ZZPMhaFsRmsgPMOkwYlmdme1lBi+wT14GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0kpR14+NvdhkKG2FT8eGfiyVJN4Jo5S3TFF36megp4g=;
	b=aZJi4ZfYwEzumuZvXpuCrS1IwWpuVAvE33r9VczuMpcuarApdNNo08S3pjlQCIOcTu
	IXdkg1Zr/ZjxL5uR/Ado8eGI39sLTLmkjzI5j601nqEECDUs1JZ950JWldZXmI+rW/vb
	5oXMZSXuc9tvLAaOWl4xEDE+xpowyGlrnMHsCHAXbbvZ38uLJcLw4Y0EFrIsm9IDnQG+
	XYo87/MSW5ZDK9fHbD3+RIcRL1gQFs6/njp4cxmkwMFrBAz8bWirDOj+pCVQmUNoi9+A
	ULvl5uCxfBknQDiypdu78YjV+yJKyKFJBbMJd9ekN1ixeG+lCarykkh59W32gIj/EueM
	EeZA==
X-Gm-Message-State: APf1xPCr9zkbGyYAByTblcyWkLCSyYGDarhEtKquurCGBUDMJS8iuN1s
	kfCWcK6UloLG05Y3G162FNyCSXbYfKp7E5plST78MA==
X-Received: by 10.157.23.34 with SMTP id i34mr13595749ota.210.1519820867875;
	Wed, 28 Feb 2018 04:27:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Wed, 28 Feb 2018 04:27:27 -0800 (PST)
In-Reply-To: <1519815685-29200-5-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1519815685-29200-5-git-send-email-abdallah.bouassida@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Feb 2018 12:27:27 +0000
Message-ID: <CAFEAcA-Q+_87n3-s5TnJK=90FJFL=MAA_3VDN4OQxBEvxbFOkA@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-arm] [PATCH v3 4/4] target/arm: Add arm_gdb_set_sysreg()
 callback
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U4tq/pmIpXeG

On 28 February 2018 at 11:01, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> This is a callback to set the cp-regs registered by the dynamic XML.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
>>> Some of our customers need to connect to Qemu using our tool TRACE32=C2=
=AE
>>> via GDB,
>>> and for some use case they need to have write access to some particular
>>> cpregs.
>>> So, it will be nice to have this capability!
>>> Usually, a user won't modify these registers unless he knows what he is
>>> doing!
>
>> I also still don't really like using write_raw_cp_reg() here --
>> it will bypass some behaviour you want and in some cases will
>> just break the emulation because invariants we assume will
>> hold no longer hold. It would be a lot lot safer to not
>> provide write access at all, only read access.
>
> Adding to that our customers may need this write access, our tool TRACE32=
=C2=AE
> needs this also in some particular cases. For example: temporary disablin=
g MMU
> to do a physical memory access.

By clearing the SCTLR bit? That's a good example of a case that
won't work reliably. If you clear the SCTLR.M bit via raw_write
this will not perform the tlb_flush() that it needs to, which
means that if anything does a memory access via the QEMU TLB
it may get the wrong cached results. If you always clear the
bit, do one gdb memory access then set the bit then it will
probably not run into problems but you're walking on thin ice.

thanks
-- PMM
