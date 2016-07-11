Received: by 10.25.21.156 with SMTP id 28csp1588086lfv;
        Mon, 11 Jul 2016 10:57:13 -0700 (PDT)
X-Received: by 10.37.72.193 with SMTP id v184mr12555964yba.99.1468259833597;
        Mon, 11 Jul 2016 10:57:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h71si1031040qke.280.2016.07.11.10.57.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 10:57:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMfSD-0005Of-3g
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 13:57:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfR8-00049H-Ey
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 13:56:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfR6-0008Bc-NB
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 13:56:05 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfR6-0008BU-ER
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 13:56:04 -0400
Received: by mail-vk0-x233.google.com with SMTP id x130so22502917vkc.0
	for <qemu-arm@nongnu.org>; Mon, 11 Jul 2016 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r4y4Y6GJ9cCdUUfYfBgaVzV6sMuWtjo72uFwKhEPNUI=;
	b=X/Yt8ZB+JhD21ah1x2X2WRz3xg/dldDqvHIE9jXCFdaoNJe0mSMcTvxeuqF6oPlz6L
	0zUjWRjNYge8s7Af39329/DloKR3N1U758Itg8wsG/eW1trm7yUWMK+YdrkG0eXVfkix
	KWEEz2KQHQoOXZOIbWOSU8nCySpZCFfLM4NZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r4y4Y6GJ9cCdUUfYfBgaVzV6sMuWtjo72uFwKhEPNUI=;
	b=mow/TjWPhd6vjnzTAWj6e6ecNm3y5QO/C2G2wuWc5/kOqzYJLGXnRqcgerDlR/QPa2
	53pBIBL0M2AQpvm3H9D4U8tmpNT4yGea1iLNUz23GH7B+qUKhGl1h2ctI/frjoTbtN9w
	TFWdpfVPMWu0jqUywImQzroPGgr6r3ar2evr3utC7hLAqFg6TO4Q46w9D3E1rzCaf44i
	m1IAO1b54JtO7QzjErB0dP8mljDe+bNCZFShm+6Or8wQc6a7rdRRZqWf4CsfPr/mv+tc
	zKkELfilpDcOAI6DworfatUtuWf4qKHuBkeV1BDPqhrJZwhOFPYK/u8gpwMHvVLqc3en
	C0SA==
X-Gm-Message-State: ALyK8tJk5eZgiQmfS9EQ4AogDIrGpZWAPW/VlotJWnD8BpgDTARvd/S8iqMtQPLT/1a//RCH2f18q0bFYolJgKX7
X-Received: by 10.176.0.208 with SMTP id 74mr10266895uaj.64.1468259763773;
	Mon, 11 Jul 2016 10:56:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Mon, 11 Jul 2016 10:55:44 -0700 (PDT)
In-Reply-To: <CALicx6uJ=nK0-EKqi2j4_wQvikf2vRWV+Td1Ke5C6ysrv7ombA@mail.gmail.com>
References: <1467190029-694-1-git-send-email-vijayak@cavium.com>
	<1467190029-694-2-git-send-email-vijayak@cavium.com>
	<CAFEAcA-Ro3tN-4aGvivH864o0Sk3+FY=Z0W8=_3yooxk5+x=4A@mail.gmail.com>
	<de1ccdbf-59e9-bece-923b-f83ddc02154a@twiddle.net>
	<CALicx6uJ=nK0-EKqi2j4_wQvikf2vRWV+Td1Ke5C6ysrv7ombA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2016 18:55:44 +0100
Message-ID: <CAFEAcA9h5rmFvD2O8H8coekTy+byKU41sr-JdUrLmCLzspy7=Q@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/1] target-arm: Use Neon for
 zero checking
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
Cc: "prasun.kapoor" <Prasun.Kapoor@cavium.com>, Suresh <ksuresh@cavium.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Vijay <vijayak@cavium.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mg3vNiFkH9ID

On 5 July 2016 at 13:24, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Sat, Jul 2, 2016 at 3:37 AM, Richard Henderson <rth@twiddle.net> wrote:
>> Consider
>>
>> #define VECTYPE        uint32x4_t
>> #define ALL_EQ(v1, v2) (vmaxvq_u32((v1) ^ (v2)) == 0)
>>
>>
>> which compiles down to
>>
>>   1c:   6e211c00        eor     v0.16b, v0.16b, v1.16b
>>   20:   6eb0a800        umaxv   s0, v0.4s
>>   24:   1e260000        fmov    w0, s0
>>   28:   6b1f001f        cmp     w0, wzr
>>   2c:   1a9f17e0        cset    w0, eq
>>   30:   d65f03c0        ret
>
> For me this code compiles as below and migration time is ~100ms more.

Thanks for benchmarking this. I'll take your original patch into
target-arm.next.

-- PMM
