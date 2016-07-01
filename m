Received: by 10.25.21.96 with SMTP id l93csp498989lfi;
        Fri, 1 Jul 2016 15:08:02 -0700 (PDT)
X-Received: by 10.129.156.131 with SMTP id t125mr331261ywg.224.1467410882375;
        Fri, 01 Jul 2016 15:08:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si3241578qkd.96.2016.07.01.15.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 15:08:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ6bR-0008Jc-QA
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 18:08:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bJ6bO-0008JG-Vg
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 18:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bJ6bJ-0003aV-SS
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 18:07:57 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:32806)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bJ6bJ-0003aI-NQ; Fri, 01 Jul 2016 18:07:53 -0400
Received: by mail-qk0-x244.google.com with SMTP id n132so26477979qka.0;
	Fri, 01 Jul 2016 15:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Z2v02EI4q938mSaXTNaCPMbeVBoGmTFmlq/+sMRr1FI=;
	b=Nhha985CjlieKJgfupPXZ9n/CHACqc9iaWNKIJKqJP2MQrjpAKtAmparXJkowrpS5u
	tYHBgnTKo3XYdYk/KJuVr4hEKv1sqcPTkW8ag1AluIgZTbcS8H9Pz7kfLYKtwL3cF3Np
	p7qZiMW0SiEXe6q0Bd5V6MXyuPD9jHUAjITUVpiv2h9vmjRs+2/VC4ak4Bn8WIURzEqA
	FyFY7zWOZiaCbITQ4+kEImcO29UluVzBNKJV7jUWdxUDIEpT1a3IGrVIYlNb7dXCzJTY
	FY7E08ftJQrtgishriGNhTs58KaoqM4Po14hmpEWBlYhufr3E6GvQQjij51Vsj04zI5X
	Gh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Z2v02EI4q938mSaXTNaCPMbeVBoGmTFmlq/+sMRr1FI=;
	b=FNjMiLfKtKkNNaCW8mt0OH5s/sHmsgDVGZTunrKAPgIJgAvqdUnhoSAIC92Xn4iyE1
	FNq4U94PTUBFf53SiSInppL2Prfct/7lF8rYuLIRp+JcLjL3zw5Lk3Iju6nL+ManSiO5
	IuR4c0QRvzvrIY7sem6Ss5tDPKEsh8bevDJxJ8nrIe/bAYu0wm/kpPlcxfamnfUS5DwT
	ZHB7dFYcfdK7WXKIDtJbZACidiYWrvfVrhB4n6nSYE+MjAF2rHOVEJvzbdFNIieE9vh6
	sOu8j+yafuR0sDFS9KmIyIf1QLByM+pzOyoZdOxnTq+7asT7yBXVv8UNgoIRa3Kqd288
	kaaQ==
X-Gm-Message-State: ALyK8tI/MGJsmIWrAeaSrrCsuR4JaGMSohwDLCn5WPsHMT7BGLbU9pWF3lz0y9ZjsRo3hw==
X-Received: by 10.55.175.134 with SMTP id y128mr752398qke.67.1467410873263;
	Fri, 01 Jul 2016 15:07:53 -0700 (PDT)
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net.
	[71.37.54.227]) by smtp.googlemail.com with ESMTPSA id
	p62sm3148513qkd.21.2016.07.01.15.07.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jul 2016 15:07:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Vijay <vijayak@cavium.com>
References: <1467190029-694-1-git-send-email-vijayak@cavium.com>
	<1467190029-694-2-git-send-email-vijayak@cavium.com>
	<CAFEAcA-Ro3tN-4aGvivH864o0Sk3+FY=Z0W8=_3yooxk5+x=4A@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <de1ccdbf-59e9-bece-923b-f83ddc02154a@twiddle.net>
Date: Fri, 1 Jul 2016 15:07:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Ro3tN-4aGvivH864o0Sk3+FY=Z0W8=_3yooxk5+x=4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::244
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
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LkoDv+MlNzBp

On 06/30/2016 06:45 AM, Peter Maydell wrote:
> On 29 June 2016 at 09:47,  <vijayak@cavium.com> wrote:
>> From: Vijay <vijayak@cavium.com>
>>
>> Use Neon instructions to perform zero checking of
>> buffer. This is helps in reducing total migration time.
>
>> diff --git a/util/cutils.c b/util/cutils.c
>> index 5830a68..4779403 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -184,6 +184,13 @@ int qemu_fdatasync(int fd)
>>  #define SPLAT(p)       _mm_set1_epi8(*(p))
>>  #define ALL_EQ(v1, v2) (_mm_movemask_epi8(_mm_cmpeq_epi8(v1, v2)) == 0xFFFF)
>>  #define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
>> +#elif __aarch64__
>> +#include "arm_neon.h"
>> +#define VECTYPE        uint64x2_t
>> +#define ALL_EQ(v1, v2) \
>> +        ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
>> +         (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
>> +#define VEC_OR(v1, v2) ((v1) | (v2))
>
> Should be '#elif defined(__aarch64__)'. I have made this
> tweak and put this patch in target-arm.next.

Consider

#define VECTYPE        uint32x4_t
#define ALL_EQ(v1, v2) (vmaxvq_u32((v1) ^ (v2)) == 0)


which compiles down to

   1c:	6e211c00 	eor	v0.16b, v0.16b, v1.16b
   20:	6eb0a800 	umaxv	s0, v0.4s
   24:	1e260000 	fmov	w0, s0
   28:	6b1f001f 	cmp	w0, wzr
   2c:	1a9f17e0 	cset	w0, eq
   30:	d65f03c0 	ret

vs

   34:	4e083c20 	mov	x0, v1.d[0]
   38:	4e083c01 	mov	x1, v0.d[0]
   3c:	eb00003f 	cmp	x1, x0
   40:	52800000 	mov	w0, #0
   44:	54000040 	b.eq	4c <f0+0x18>
   48:	d65f03c0 	ret
   4c:	4e183c20 	mov	x0, v1.d[1]
   50:	4e183c01 	mov	x1, v0.d[1]
   54:	eb00003f 	cmp	x1, x0
   58:	1a9f17e0 	cset	w0, eq
   5c:	d65f03c0 	ret


r~
