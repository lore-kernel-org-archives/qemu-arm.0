Received: by 10.25.208.211 with SMTP id h202csp750812lfg;
        Sat, 9 Apr 2016 15:45:55 -0700 (PDT)
X-Received: by 10.140.106.199 with SMTP id e65mr10496189qgf.73.1460241955550;
        Sat, 09 Apr 2016 15:45:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f68si15001425qge.89.2016.04.09.15.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Apr 2016 15:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33219 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ap1db-0004Ec-5V
	for alex.bennee@linaro.org; Sat, 09 Apr 2016 18:45:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ap1dY-00049j-Gh
	for qemu-arm@nongnu.org; Sat, 09 Apr 2016 18:45:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ap1dX-0000bf-OQ
	for qemu-arm@nongnu.org; Sat, 09 Apr 2016 18:45:52 -0400
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:34452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1ap1dT-0000bA-FL; Sat, 09 Apr 2016 18:45:47 -0400
Received: by mail-pa0-x242.google.com with SMTP id hb4so11517635pac.1;
	Sat, 09 Apr 2016 15:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=mbQBMdHPZtd+bMvj0CoZPgTcPYdaZ95xJC9pZHBgrKI=;
	b=Smi/0/s0Xh78oYppWN17p3pYW6V+yzexCDYWN4CCYDUm6XqMtNYDK6T3K0KkMACt+l
	fl0lx4E8rBmEBJ4bcUD5BqRU/969109pGX6CCnjnmT2GSBWV3z/flfb6yaCBmR2bT2f9
	OTDEZOO0zof7UFVmLzmQ3NylBR+T6lqETRQtkW7e5vfpLoksxjccYtSqRGcrkUaC82jb
	5eYCxXt6Q+DbIIjWk+VIfjqkZWUWoFWB1TW8CQHT5NiJA0uQ8dMyYqNaFi30JH73GQOg
	d2arhEsCRGj4FSQ3Yuum78urR+UjFg+SPZeS/g7dFXqTwBcg2lHW/yMv1CZz5VFIuLQK
	EzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=mbQBMdHPZtd+bMvj0CoZPgTcPYdaZ95xJC9pZHBgrKI=;
	b=nNUJ+yV680+2hcKYclyUJJL3DdI1aI1fHd4GrgelwhXMz2vdXx49GFUbazv3bm2gAw
	Oxmw+BoRGcqQfsM5sXeKHO2/x4oOZu75kP81IWFL4rH7h+qBC4sg57+si4wP+Zvvx2HB
	7640LMUC4BPizEjZepNhOmsqbnJa4ehcVSqhssV4v8xK5eKNGpTVP+2SJt6Dx4m/+m2+
	BdpAMxeFjZ5KAR1O6PPH9zs+iIeRwRXB3s+H0leYrQyPGnTxmshIWD4JbzRdB1+KE7py
	ejapGIfxuDnFoZfb92YEehU4+G+8p5UnqExL52lwbn0yH4bkAOI6NidV6sYQ2jAjRRSa
	7CQg==
X-Gm-Message-State: AD7BkJJU5xhcdwnYKvTcZawSZsR6L2JT0Oy4b3ygMbEhJM80cm23wGFkHt3GJsMtU2pEHQ==
X-Received: by 10.66.222.41 with SMTP id qj9mr22511266pac.136.1460241946209;
	Sat, 09 Apr 2016 15:45:46 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by smtp.googlemail.com with ESMTPSA id
	b82sm26959270pfd.89.2016.04.09.15.45.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Apr 2016 15:45:45 -0700 (PDT)
To: vijayak@caviumnetworks.com, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, pbonzini@redhat.com
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <57098617.1020308@twiddle.net>
Date: Sat, 9 Apr 2016 15:45:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1460023087-31509-2-git-send-email-vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v2 1/3] target-arm: Use Neon
 for zero checking
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
Cc: vijay.kilari@gmail.com, Prasun.Kapoor@caviumnetworks.com,
	knv.suresh2009@gmail.com, qemu-devel@nongnu.org,
	Suresh <ksuresh@caviumnetworks.com>, Vijay <vijayak@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8u4gRWonyKOv

On 04/07/2016 02:58 AM, vijayak@caviumnetworks.com wrote:
> +#elif defined __aarch64__
> +#include "arm_neon.h"

A better test is __NEON__, which asserts that neon is available at compile time 
(which will be true basically always for aarch64), and then you don't need a 
runime test for neon.

You also get support for armv7 with neon.

> +#define NEON_VECTYPE               uint64x2_t
> +#define NEON_LOAD_N_ORR(v1, v2)    (vld1q_u64(&v1) | vld1q_u64(&v2))
> +#define NEON_ORR(v1, v2)           ((v1) | (v2))
> +#define NEON_NOT_EQ_ZERO(v1) \
> +        ((vgetq_lane_u64(v1, 0) != 0) || (vgetq_lane_u64(v1, 1) != 0))

FWIW, I think that vmaxvq_u32 would be a better reduction for aarch64. 
Extracting the individual lanes isn't as efficient as one would like.

For armv7, folding via vget_lane_u64(vget_high_u64(v1) | vget_low_u64(v1), 0) 
is probably best.


r~
