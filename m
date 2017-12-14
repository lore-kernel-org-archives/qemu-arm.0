Received: by 10.223.159.74 with SMTP id f10csp6487980wrg;
        Thu, 14 Dec 2017 08:05:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBov/cTgOJYNOVD/QRXS7P3iQJ7JTf3+YA2MUS85HDzR1iqK9aC2bh67CL8y/UAdgjrhVLcDq
X-Received: by 10.37.181.146 with SMTP id q18mr4682591ybj.328.1513267549788;
        Thu, 14 Dec 2017 08:05:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513267549; cv=none;
        d=google.com; s=arc-20160816;
        b=zcXaZMFNipQF0Zfk9BTAx4aDcrgLJ+qEBzKDbQ40JsumoIXHKXeuy+hRPjfkKa+cdA
         JlcBl32qGg7EJOYtgiMor+QWj6uIYBTq2EF1vkwNt1RXJiYwoqb0WeqZ99XBk4kQE+Fd
         g9Rlliu2+7aQsZBfwORelJ6cte8SrEzxCZkBbL4HQF2etiEbxG6gWRRNyA6APBFr440o
         wu0BvbORYRxS9H69YT+xyCLy76NCQyI0qig6DaiNFYyM+6QVuF3EeJe7c5VMNE3+kYcB
         08+AYiKa6qQ4dhJ6i8lfDSDqV1VpU3/nt5iqaQrtGRDUZiFr/OZQeigw66YbulU9uA5L
         TyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=DfyGgKtgwNentbx0fpLoy2wQ1rXcoexXGA0vb3dvK9Y=;
        b=k9mQTvfxd+PEjovZl/38v9ZoAaUWcs9/Ck3GGiGd9q8Ie7jlpBFm0naFlbdi8VwZfK
         uwN+8jjyOr39JGtEtLRlcyvhUlNPLLVWWOs85YJdSrFl34ucP21ACFQ0be+1ITPQEP0l
         AUTU0CDLKyZoVhxfFePziXhUv+7unTHY2GxbsdId10Kd6DejQS/eEZS4t3Z2LMqeDh5b
         YOr6E8PSy03WTay8hVei6DD3fIlbZs7kawmIiDj6cAPR7t0iwx1wLV1/KgwyxTkhbm3F
         XNVELXzXmYkaZhAB3qStNQ61y3cacpIXy1oNiYJzg+STBBfr+Ky1z8mNf7WN3ocJNhvM
         JEUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V0jQ13qm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c198si848134ywc.174.2017.12.14.08.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 08:05:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V0jQ13qm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41741 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePW17-0005SW-7w
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 11:05:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePW0k-0005OQ-0E
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 11:05:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePW0d-0007by-U1
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 11:05:25 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:39412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePW0d-0007bU-QF; Thu, 14 Dec 2017 11:05:19 -0500
Received: by mail-qt0-x241.google.com with SMTP id k19so8527700qtj.6;
	Thu, 14 Dec 2017 08:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DfyGgKtgwNentbx0fpLoy2wQ1rXcoexXGA0vb3dvK9Y=;
	b=V0jQ13qmrfboMGr31nTLbBThkcLeiOQ148ytQ4OeYfQY9/4Jcuazat6+K6+c6gAgdk
	ZRRVe/gR3tqA9fg4lRESvL73UNoFvxPiVjABlxqB4lWQLkDdF+XxCYDLhQBU/nwZE+E4
	yz0XAbeUWTL0KT6xOvRh3E5YA0AfxfxyARHu/vX3O+zLoKlLH1JPG7hf66L6gzkptVx7
	6YeP2zlX/ZmIrSJ0a+dcGj5I+H911hvmA1pE6jAFOwD6vQsssQTxn9MREC+Dkc8jkST2
	tzA+aWPp455P9K8n7JgJM6/vI2JlfFKkvnVLJmY3a0Je38zEHeuotWmfuUUJbIZ2k+gv
	t54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DfyGgKtgwNentbx0fpLoy2wQ1rXcoexXGA0vb3dvK9Y=;
	b=fiE5dxGR9ecELIpur2RDMTqdJi/rrLLuh9qw3OtgBmiglyoYJ661DQD74NfB24kMLH
	NQLYGANMSr8gnayrUiwqaVrr7s+vU2GnndvkHROqOB6pGepw6CRE+5DjztheOfWsgyEI
	fMoRWO8/uu2Q3VZpPfosXqAzuMFt7WOAJaWm1/lm56U0psIAO5vO/RMwUn3PHLRiYOZJ
	bkpNhFTW4SUGhdO111fRugFK3dhaG27PJ4u4EJuNVs58bpUg4rrFr+ch9kR9dtdn06Rf
	SGaaY0Cw9DCo/rEy6TNb859Gq+O2FoFWDH4eTn059pm/z8RwH+cllWD4W0QNF5NhuHbR
	SYow==
X-Gm-Message-State: AKGB3mLAqc9Zwhv+23HHDuyZ5Iq96wqraUjZqtPdctSGY8HJThTXJMpP
	HXYWLxreTXmGWlrZU1eUDkP6oYw3ccP5vlkSzuc7OgLm
X-Received: by 10.200.54.176 with SMTP id a45mr16206221qtc.176.1513267519074; 
	Thu, 14 Dec 2017 08:05:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Thu, 14 Dec 2017 08:05:18 -0800 (PST)
In-Reply-To: <d56f5ba0-29d9-d5b4-7137-28e312e15a02@amsat.org>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
	<20171211213007.7353-13-andrew.smirnov@gmail.com>
	<CAFEAcA_6R61208pZ5rchSG0Oy4c_2eSGD+dO-LQs3Dncjnpf-Q@mail.gmail.com>
	<CAHQ1cqHhN=hLun2mzqvg0N3NkxEbPpBU1iEf5-mAdnHqEs3KYg@mail.gmail.com>
	<d56f5ba0-29d9-d5b4-7137-28e312e15a02@amsat.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 14 Dec 2017 08:05:18 -0800
Message-ID: <CAHQ1cqEA1_OP4+Y4Y1B25UsmWU9EoR6uFvJTKmAj494q7HskoQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
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
X-TUID: 6NkfchpXA7xg

On Thu, Dec 14, 2017 at 7:32 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Hi Andrey,
>
> On 12/14/2017 11:03 AM, Andrey Smirnov wrote:
>> On Tue, Dec 12, 2017 at 9:52 AM, Peter Maydell <peter.maydell@linaro.org=
> wrote:
>>> On 11 December 2017 at 21:30, Andrey Smirnov <andrew.smirnov@gmail.com>=
 wrote:
> [...]
>>>> +    case ESDHC_DLL_CTRL:
>>>> +    case ESDHC_TUNE_CTRL_STATUS:
>>>> +    case 0x6c:
>>>
>>> Isn't there a name we can give 0x6c ?
>>>
>>
>> Unfortunately, not that I know of. It's a mystery register not listed
>> in RM and the only place I can found it being mentioned is in Linux
>> driver as a part of errata ESDHC_FLAG_ERR004536 fix, where it is used
>> nameless as well.
>
> This sets the SD CLK/RCLK frequency (10-bit) for the 104MB/sec bus speed
> (UHS-I mode).
>
> The "Sampling Clock Tuning Procedure" figure in the Spec v3 is helpful.
>

I am a bit hesitant to agree that this is indeed the case. ERR004536
errata's title is "uSDHC: ADMA Length Mismatch Error may occur for
longer read latencies" and recommented workaround is "Use SDMA (or
ADMA1) in case the AHB latency is larger than the =E2=80=9Cminimal time for
one block=E2=80=9D. On top of that corresponding code in Linux
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/mmc/host/sdhci-esdhc-imx.c?h=3Dv4.15-rc3#n1061)
doesn't seem to use it as a 10-bit frequency field, treating it more
like a single-bit flag.

Thanks,
Andrey Smirnov
