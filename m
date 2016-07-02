Received: by 10.25.21.96 with SMTP id l93csp677653lfi;
        Sat, 2 Jul 2016 02:43:19 -0700 (PDT)
X-Received: by 10.55.3.18 with SMTP id 18mr3437056qkd.154.1467452599635;
        Sat, 02 Jul 2016 02:43:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23si1945094qki.133.2016.07.02.02.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jul 2016 02:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37715 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJHSJ-0004MH-0D
	for alex.bennee@linaro.org; Sat, 02 Jul 2016 05:43:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJHSF-0004Lv-DP
	for qemu-arm@nongnu.org; Sat, 02 Jul 2016 05:43:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJHSD-0003IX-A6
	for qemu-arm@nongnu.org; Sat, 02 Jul 2016 05:43:14 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJHSD-0003ID-0r
	for qemu-arm@nongnu.org; Sat, 02 Jul 2016 05:43:13 -0400
Received: by mail-vk0-x22e.google.com with SMTP id k68so94593689vkb.0
	for <qemu-arm@nongnu.org>; Sat, 02 Jul 2016 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TVkxFSyvqXsf0/n1t9II8gdNz2JgMzH/2keXRq8ey24=;
	b=jetW8rlYV7z3MNMKN3BX2MRtnrznk+KwkRjm4P6vJXqmw7s/ThIKlT2tbnRyS7OuHf
	kvj6GzbF5uckNfrhDWUfrGHID7fNWtmDJdC5NSRbi3b7HG60AbrYOTPYO/jCrOO+Pc7f
	Gox13mZAiXFmMr0F4vrmAudsfQlAwOn/8kRo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TVkxFSyvqXsf0/n1t9II8gdNz2JgMzH/2keXRq8ey24=;
	b=XLRMJlIK2kaNm9HfMBuZrERXGYzNtxcgHy/Cym8DcWmJpjr0BBtwyfH2e+Qlbo8f31
	YHui0bjwTchH9MBxepDFJToAapy3QMoyd8BKEtblAbh/UMJHxyhl6Ozd2WFjGLg35bvJ
	nn7Xmng/13TO7Fld+0IPU3bbCzATM5WZx4SabLe9/ofV5nujt2uRHZnkxTOX8BxJPA2S
	PoVEjRcNsQH1lLak6ctm8KDxPuhcHgAEvBp+MGQVuFgVQCYI0zr3uaAVX5/Q/0TUSIME
	B0OXHirVDrfz4EjXdVqSoT8LCG1Ew1/xVz/0+YAH5Fdhu9MnBosdG2nvcsKNpzPlnSdr
	7iKA==
X-Gm-Message-State: ALyK8tJCRFFsomOeuaXLNfnrrBHZvhLT0y1zW90MR/nQht60hyq46jdRfkbOaBAZuIwfOtWvA4jxx+rTKuiR5rJU
X-Received: by 10.176.5.3 with SMTP id 3mr1145735uax.52.1467452591745; Sat, 02
	Jul 2016 02:43:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Sat, 2 Jul 2016 02:42:52 -0700 (PDT)
In-Reply-To: <de1ccdbf-59e9-bece-923b-f83ddc02154a@twiddle.net>
References: <1467190029-694-1-git-send-email-vijayak@cavium.com>
	<1467190029-694-2-git-send-email-vijayak@cavium.com>
	<CAFEAcA-Ro3tN-4aGvivH864o0Sk3+FY=Z0W8=_3yooxk5+x=4A@mail.gmail.com>
	<de1ccdbf-59e9-bece-923b-f83ddc02154a@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Jul 2016 10:42:52 +0100
Message-ID: <CAFEAcA_St80mOG=fcx9K0XpgL5ny0cq9Xhk3h+gwEOf5Bs1ZQg@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
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
Cc: Prasun.Kapoor@cavium.com, Vijay Kilari <vijay.kilari@gmail.com>,
	Suresh <ksuresh@cavium.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Vijay <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wlG7M5ETXnSz

On 1 July 2016 at 23:07, Richard Henderson <rth@twiddle.net> wrote:
> On 06/30/2016 06:45 AM, Peter Maydell wrote:
>>
>> On 29 June 2016 at 09:47,  <vijayak@cavium.com> wrote:
>>>
>>> From: Vijay <vijayak@cavium.com>
>>>
>>> Use Neon instructions to perform zero checking of
>>> buffer. This is helps in reducing total migration time.
>>
>>
>>> diff --git a/util/cutils.c b/util/cutils.c
>>> index 5830a68..4779403 100644
>>> --- a/util/cutils.c
>>> +++ b/util/cutils.c
>>> @@ -184,6 +184,13 @@ int qemu_fdatasync(int fd)
>>>  #define SPLAT(p)       _mm_set1_epi8(*(p))
>>>  #define ALL_EQ(v1, v2) (_mm_movemask_epi8(_mm_cmpeq_epi8(v1, v2)) ==
>>> 0xFFFF)
>>>  #define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
>>> +#elif __aarch64__
>>> +#include "arm_neon.h"
>>> +#define VECTYPE        uint64x2_t
>>> +#define ALL_EQ(v1, v2) \
>>> +        ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
>>> +         (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
>>> +#define VEC_OR(v1, v2) ((v1) | (v2))
>>
>>
>> Should be '#elif defined(__aarch64__)'. I have made this
>> tweak and put this patch in target-arm.next.
>
>
> Consider
>
> #define VECTYPE        uint32x4_t
> #define ALL_EQ(v1, v2) (vmaxvq_u32((v1) ^ (v2)) == 0)

Sounds good. Vijay, could you benchmark that variant, please?

thanks
-- PMM
