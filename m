Received: by 10.223.159.74 with SMTP id f10csp6501760wrg;
        Thu, 14 Dec 2017 08:17:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBovdPdmBxq929fYas0+l6xh1/4UnYm+3Ak9JOps5xUNEMtWNt1xxjMiGkoh8W5x9ZYEotNp9
X-Received: by 10.37.233.9 with SMTP id n9mr4793976ybd.241.1513268255248;
        Thu, 14 Dec 2017 08:17:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513268255; cv=none;
        d=google.com; s=arc-20160816;
        b=mWhuSgnEkBpKBHS5Mi/X6yagFbKy0sSss8LPfa9SBukOHskIGn9CL3pNAQZw5NdY2t
         W/Mygoev4Gl5VwMVq6cj0PEjrwe31PdsP3+g7OBmF6ejlLcSWM0uwUTfh72c8YALfZ4v
         QFJpN5eYWp/IRNhcOGP2URtCYV9EeDrftxI68ZMlKHnVp2/M2NQk6/klzHJCu/J/B9Kv
         UdU5wvKHpZ8OL8BE+g4Ur1U2fDeZjBEWgrhNEaqMDtjwMrOTANMNKFd1uXwqFY+IKGXW
         D75VgaoWkiNJ4OA8C6tw4x8H1SqK5s+0EQ6H1G9ZmauuSKYOiGwfFZFao3LBerJuJRHU
         C/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=w9ZlfAIN2dMzIJiEv6L+F/iQcn3QQnIlEN9h5hcL9PY=;
        b=b5AucIy+X7tCR/JvAyt8LerEMaGoNUT8+uaKBuGxBD7wdjB5xAgstrK9aLBSLKekkf
         PSTqyULuQq8RW/L1KcDIiAPlmXV+2Gi8RdW2i0+mMOx3zmRjE2rBoHYe09ehOBp86uCb
         uxIotJzotwWrIIAzQj2QRPzaHqGt7Q/xoVN2JCk2eZao86x+2imDfeaHtmxeR1j7qUZI
         9/gXSl+8UVMJ3ffxVo8Zuph1vgW6HCP03HC/t04bVwhil09z6BKtkJpWeQSX6/Dqi4Cf
         Z2q0pP3HO6Oung/gKPs/t5wbzgTDNvjZ4wVbDkItfZSMBQVQeqiP8ejnrQLFt1dqK41U
         ZZ7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k77AgG/A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4si856848ywm.805.2017.12.14.08.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 08:17:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k77AgG/A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePWCU-0001XY-M7
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 11:17:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePWCJ-0001Wi-Qo
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 11:17:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePWCI-0005Cj-WC
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 11:17:23 -0500
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:36835)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePWCI-0005CW-RD; Thu, 14 Dec 2017 11:17:22 -0500
Received: by mail-it0-x241.google.com with SMTP id d16so12348868itj.1;
	Thu, 14 Dec 2017 08:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=w9ZlfAIN2dMzIJiEv6L+F/iQcn3QQnIlEN9h5hcL9PY=;
	b=k77AgG/ABPAljEO60WDULOjqK9YqWEdsqVvFxvn62ftFWIdx8npi9GETqqRDQK94Ka
	1E7XOcXnsivb2e7lg38RxE4A7Rr+QObKVbNcCiy9CpRla4bhGElaPHN1Y4Zxk/dB7Yms
	Y7d4C61zzB2y1NVYgf473uewHR03o+NtZgsGpu9cRPXYnzRIodzP8MWeFPY0jN9PZvDw
	8R82+Prc9mnfmG0lyIKXNMGiqMiynqUx+PBBwfLTB+1877uWaPesb+c0OWqmSwiIuOx8
	tcr4ni8zrSlBbEu/FTYQ4JlITLBQ1PAUFrYBmnBEBdR5ub8BAHQkv3oCiEVjkFkbmK6E
	nQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=w9ZlfAIN2dMzIJiEv6L+F/iQcn3QQnIlEN9h5hcL9PY=;
	b=gMn+8Y+lZfTwpYZ0qEmZQAoURcnAO9J83/lzJKuhwLjJW5B1tYVS1stM6CN93ihd6U
	T/IaYE/sFyB2cI1LlfWE7PbwixQlSCcpDuf4pAufccIwKXFhsefZEvQ6rJr33lU1WNaH
	d12p6Sa0ka8W2KL9XmI2Sn3ib4KHWEwu+2yElOUjaRr+MLT36Wg7v/Bh09zpJHVmrmut
	pQ9bY/SYvfHUIVhWhR6jfQ+cOawG+l4oTn+/4WNVhhBm0mRzmutVAF5aklpoP7ZuUb6v
	Vlu5RgeEWTWq4886dJq4teO+BRaBNy4ZpnMHFCiffLf5w51aZuQX4NMggUkHBUwCkVyp
	Swsw==
X-Gm-Message-State: AKGB3mKc6J03djnS56U0yckTRsWMAAOJVo7GP5Ff8Lvqe2uT6DGwBlwq
	btcpHLL3e49sByx/k0YEuDxPzkGFI7hJA7oyom0=
X-Received: by 10.107.183.20 with SMTP id h20mr8464594iof.23.1513268242074;
	Thu, 14 Dec 2017 08:17:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.183.19 with HTTP; Thu, 14 Dec 2017 08:17:21 -0800 (PST)
In-Reply-To: <CAHQ1cqEA1_OP4+Y4Y1B25UsmWU9EoR6uFvJTKmAj494q7HskoQ@mail.gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<20171211213007.7353-13-andrew.smirnov@gmail.com>
	<CAFEAcA_6R61208pZ5rchSG0Oy4c_2eSGD+dO-LQs3Dncjnpf-Q@mail.gmail.com>
	<CAHQ1cqHhN=hLun2mzqvg0N3NkxEbPpBU1iEf5-mAdnHqEs3KYg@mail.gmail.com>
	<d56f5ba0-29d9-d5b4-7137-28e312e15a02@amsat.org>
	<CAHQ1cqEA1_OP4+Y4Y1B25UsmWU9EoR6uFvJTKmAj494q7HskoQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 14 Dec 2017 13:17:21 -0300
X-Google-Sender-Auth: 1TPEEkBAX23llX4eHzVH3WdO404
Message-ID: <CAAdtpL4iUEu1xqbj3Ep0=GNP3K2QZicHVEZBGhRvXsbfyoH9Ww@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-arm] [PATCH 12/13] sdhci: Add i.MX specific subtype of
 SDHCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pOufzFWmKRuC

On Thu, Dec 14, 2017 at 1:05 PM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
> On Thu, Dec 14, 2017 at 7:32 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
>> [...]
>>>>> +    case ESDHC_DLL_CTRL:
>>>>> +    case ESDHC_TUNE_CTRL_STATUS:
>>>>> +    case 0x6c:
>>>>
>>>> Isn't there a name we can give 0x6c ?
>>>>
>>>
>>> Unfortunately, not that I know of. It's a mystery register not listed
>>> in RM and the only place I can found it being mentioned is in Linux
>>> driver as a part of errata ESDHC_FLAG_ERR004536 fix, where it is used
>>> nameless as well.
>>
>> This sets the SD CLK/RCLK frequency (10-bit) for the 104MB/sec bus speed
>> (UHS-I mode).
>>
>> The "Sampling Clock Tuning Procedure" figure in the Spec v3 is helpful.
>>
>
> I am a bit hesitant to agree that this is indeed the case. ERR004536
> errata's title is "uSDHC: ADMA Length Mismatch Error may occur for
> longer read latencies" and recommented workaround is "Use SDMA (or
> ADMA1) in case the AHB latency is larger than the =E2=80=9Cminimal time f=
or
> one block=E2=80=9D. On top of that corresponding code in Linux
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/mmc/host/sdhci-esdhc-imx.c?h=3Dv4.15-rc3#n1061)
> doesn't seem to use it as a 10-bit frequency field, treating it more
> like a single-bit flag.

Ok, I'll have a better look when applying these SD patches on top of
my current SD tree.

Regards,

Phil.
