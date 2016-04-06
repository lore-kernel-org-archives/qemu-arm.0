Received: by 10.25.208.211 with SMTP id h202csp1036125lfg;
        Wed, 6 Apr 2016 08:02:11 -0700 (PDT)
X-Received: by 10.140.98.163 with SMTP id o32mr24947280qge.46.1459954931799;
        Wed, 06 Apr 2016 08:02:11 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f185si2346797qkb.71.2016.04.06.08.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Apr 2016 08:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anoyB-0007I5-C0
	for alex.bennee@linaro.org; Wed, 06 Apr 2016 11:02:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1anoxV-0006H6-42
	for qemu-devel@nongnu.org; Wed, 06 Apr 2016 11:01:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1anoxP-0006cO-Ch
	for qemu-devel@nongnu.org; Wed, 06 Apr 2016 11:01:29 -0400
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:32787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1anoxE-0006ZF-88; Wed, 06 Apr 2016 11:01:12 -0400
Received: by mail-oi0-x231.google.com with SMTP id w85so61690225oiw.0;
	Wed, 06 Apr 2016 08:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=rFrm0ghpqU8Fj1n2dte7jJ5x5ydw2L34BKtjJXTodkA=;
	b=f/rEB4U35GGgAcLv8awvJO/FwaUQr0ZwiAQHSEu4JTCScx95jrqg7dEXi0ouqa+eDM
	CkdjDmxeJG6P+iN+YDDDoVnR9MV4eaPGwPS3xM/3/l/3OxGzbaFN1oTnWjcUGnHyZFk5
	Hb4Bj5x6rS5MZwz71sUozERrmqKIpKX5YGT2F6WFEo/rtHuV1iY311VbqQyXvJps46r9
	W190Tt7AsshddcZ0UPpzHoHNFCIr8DjK7IwjUJkyvTzhVCoXAlwaXMCkS+MXay4bAUEA
	ErrvFaaqZbb+z3WneIA/YoIWpKkAwYyuOU3fJ1CPPpHONcB8jVwNwBZs1+vSH78XVnh3
	z8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=rFrm0ghpqU8Fj1n2dte7jJ5x5ydw2L34BKtjJXTodkA=;
	b=C9DvKKLjDtGX9Y/me3YX2aOMEPkPnra1JnSg7fQ+EdP9Hwa5ejuKErHdCk/hJdhWsF
	72JBXWS3WUbakpCirvIzhIUxLWjy9eXgpwXFTXGiA22r4oq14nbZBWIZHWokUAcDwfu8
	cxkdbWtOlWdsRYnd3Yebyt987B6pF72R2svSXoslru/wnayp3kmXQLv28ihumbNp/ZTE
	NBsrEhR3ESSZi/WVGqmBRplBzJ/sVayyQ+Rig2PLbC2kvRtXUQspVvR36uEzlimE4t1j
	EAJ5OeuYLDGSU+nSdvwK0KQAn2Y8E/7CLQYJXKpQAVVoGp1rgL8d5aQT6xyU1l/Spfap
	jA+A==
X-Gm-Message-State: AD7BkJKIo/wwGDhLvTASJ/W+zow/fnAP92KRzAeZTW/Z5PmBvaVLauAlEBBigVeWZHjXSTs1R+ObqLGueBq3AA==
MIME-Version: 1.0
X-Received: by 10.202.204.130 with SMTP id c124mr11499054oig.112.1459954871107;
	Wed, 06 Apr 2016 08:01:11 -0700 (PDT)
Received: by 10.157.29.134 with HTTP; Wed, 6 Apr 2016 08:01:11 -0700 (PDT)
In-Reply-To: <CAFEAcA8sCNFY7dF2MSZcELgEfJg9MhNERFAY2ZJrou=e1zKM5w@mail.gmail.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-2-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_RDSe=exvgo-yF57bQDk2=sx3kLnvKiKkXHPJHCTGE+w@mail.gmail.com>
	<CALicx6u3yCdFSUuLyQgt7yP08RSwXP=k0w3WKmeTRfn7jS6vRA@mail.gmail.com>
	<CAFEAcA8sCNFY7dF2MSZcELgEfJg9MhNERFAY2ZJrou=e1zKM5w@mail.gmail.com>
Date: Wed, 6 Apr 2016 20:31:11 +0530
Message-ID: <CALicx6u_YinmXd4xCZKsRVtWcnSUHqoe_7Tc1TOG7ai3cg_rYQ@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::231
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijay <vijayak@cavium.com>
Subject: Re: [Qemu-devel] [RFC PATCH v1 1/2] target-arm: Update page size
	for aarch64
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
X-TUID: 0SBsQCVGmA61

On Mon, Apr 4, 2016 at 10:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 4 April 2016 at 17:40, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Mon, Apr 4, 2016 at 7:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> I agree that this would definitely improve performance (both for
>>> migration and for emulated guests), but I'm afraid this breaks
>>> running 32-bit ARMv5 and ARMv7M guests with this QEMU binary,
>>> so we can't do this. If we want to allow the minimum page size to
>>> be bigger than 1K for AArch64 CPUs then we need to make it a
>>> runtime settable thing rather than compile-time (which is not
>>> an entirely trivial thing).
>>
>> Do you mean to say that based on -cpu type qemu option
>> choose the page size at runtime?
>
> If you want to avoid defining TARGET_PAGE_SIZE to the
> lowest-common-denominator 1K, then yes, you'd need to
> choose it at runtime. That could be painful to implement.

Had a look at it. Needs some changes in common code as well.
I will send this as a separate patch series and drop this patch
from this series.

>
> thanks
> -- PMM
