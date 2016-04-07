Received: by 10.25.208.211 with SMTP id h202csp422608lfg;
        Thu, 7 Apr 2016 03:44:36 -0700 (PDT)
X-Received: by 10.140.223.17 with SMTP id t17mr2627214qhb.65.1460025876043;
        Thu, 07 Apr 2016 03:44:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t65si5420998qhc.2.2016.04.07.03.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 03:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao7QR-0004Da-2S
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 06:44:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao7QJ-00047p-4V
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao7QI-0002sG-72
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:44:27 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36593)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao7QI-0002s4-0r
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:44:26 -0400
Received: by mail-vk0-x233.google.com with SMTP id c4so93516789vkb.3
	for <qemu-arm@nongnu.org>; Thu, 07 Apr 2016 03:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kdVzF679a6GCqIoaeMTFqcomV7x2nbpVHUMbrYSpZE8=;
	b=iIyJLZlpMII65wCSC2ZflVvcJbcKQRSj9WUDvS+IqL8XYXUa+ua18J0d2gXWfQPTtz
	X3GdvL8qJLq20DeHHJ+l5VptcDyL+DBIwwzQoqytvEh5mL/JsRsPbB2qehOAx+kvjAYb
	pi8Wrdv2yrwZrHldWT9JXTId2zWMC0QmDN3wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kdVzF679a6GCqIoaeMTFqcomV7x2nbpVHUMbrYSpZE8=;
	b=QxYWE7HpxWqX6imLb+SR6M3aGLYfkR7Mu+dNQ/kDW4wq34EujatUGX11KSYo8QYOBV
	8efM0cpvxHiMM75tx7EN054yvieyd3sjF61buoyK/o6iByZiYoO6aw+ztyH1rt52BKEf
	1RaJ7Vtzg26yTEthNNQLoHstvTWNIv/KAhYcIGBvAgT3odsJOhA5Jq3XcmAlpcWYKxHG
	92FT24oBYTTXkewhoRhRPatYMrSFZKiIwxQmfRzpiU2Bm+qc+Yl7IlY90rBPAAvDTaFF
	iv7vxUlvTZFwzT/oaOxEwcfrUrEV9q4EH/AfOPA0ZdWn1qPYig0q40RkruY4o/0jT54N
	OBZQ==
X-Gm-Message-State: AD7BkJLQio9BQESMEHn5rDFODhCVhqEHshcmwCOmSI0SbtfbQhblgajVs/xECHh8xjFDZLdlkBsbCyO5Ppe3zI4s
X-Received: by 10.31.149.73 with SMTP id x70mr824549vkd.83.1460025865194; Thu,
	07 Apr 2016 03:44:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 7 Apr 2016 03:44:05 -0700 (PDT)
In-Reply-To: <1303989769.499295.1460025007144.JavaMail.zimbra@redhat.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
	<1303989769.499295.1460025007144.JavaMail.zimbra@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2016 11:44:05 +0100
Message-ID: <CAFEAcA95xomF=afFEKUQfuWqyKNDbwYKJHp2GGMEDLvY+zyxQw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: vijay kilari <vijay.kilari@gmail.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	knv suresh2009 <knv.suresh2009@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suresh <ksuresh@caviumnetworks.com>, Vijay <vijayak@cavium.com>
Subject: Re: [Qemu-arm] [RFC PATCH v2 1/3] target-arm: Use Neon for zero
	checking
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
X-TUID: XZpa0jpyFtDZ

On 7 April 2016 at 11:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>> +#elif defined __aarch64__
>> +#include "arm_neon.h"
>> +
>> +#define NEON_VECTYPE               uint64x2_t
>> +#define NEON_LOAD_N_ORR(v1, v2)    (vld1q_u64(&v1) | vld1q_u64(&v2))
>
> Why is the load and orr necessary?  Is ((v1) | (v2)) enough?
>
>> +#define NEON_ORR(v1, v2)           ((v1) | (v2))
>> +#define NEON_NOT_EQ_ZERO(v1) \
>> +        ((vgetq_lane_u64(v1, 0) != 0) || (vgetq_lane_u64(v1, 1) != 0))
>> +
>> +#define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR_NEON 16
>
> Unless you have numbers saying that a 16-unroll is better than an 8-unroll
> (and then you should put those in the commit message), you do not need to
> duplicate code, just add aarch64 definitions for the existing code.

This pure-neon code is also not doing the initial short-loop to
test for non-zero buffers, which means it's not an apples-to-apples
comparison. It seems unlikely that workload balances are going
to be different on ARM vs x86 such that it's worth doing the
small loop on one but not the other. (This is also why it's helpful
to explain your benchmarking method -- the short loop will slow
things down for some cases like "large and untouched RAM", but be
faster again for cases like "large RAM of which most pages have
been dirtied".)

thanks
-- PMM
