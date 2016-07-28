Received: by 10.25.21.156 with SMTP id 28csp902613lfv;
        Thu, 28 Jul 2016 09:44:08 -0700 (PDT)
X-Received: by 10.55.122.65 with SMTP id v62mr43009829qkc.145.1469724247955;
        Thu, 28 Jul 2016 09:44:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si8525084qka.153.2016.07.28.09.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 09:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSoPn-0007ul-Fp
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 12:44:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bSoPk-0007uN-91
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bSoPi-0006S9-Cr
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:44:03 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:35986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bSoPh-0006QD-J8
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:44:02 -0400
Received: by mail-vk0-x229.google.com with SMTP id n129so36015354vke.3
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 09:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZFCzb9dqGykxdclR02Ks4JJKJkWS7xOYtqmUSI1XOBE=;
	b=bCz9kgvLcv7V+S06BfMYK5BmoMsCp9ltSNAtcvymfbHIRnl1sCL4sN3cmhXoIxHp0T
	Mv2RYI9xuIhuUufrmTbhagkaZvHw8Hn/6+nXQUcV1QDnW9+W++XZ36aKl10aCfUswumC
	k/dtb1j0H7MfLgGBUl+ra1gL3jcoQS46bPM9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZFCzb9dqGykxdclR02Ks4JJKJkWS7xOYtqmUSI1XOBE=;
	b=drd85CUM+gs/3TK5nqHJmNG4XU6SQah9JUqT+TMMXjYguI8nk8s1eeickPAOnbTc1Z
	LFmieJIFWsfHRyvItJYhZrRkPUXyymiJa1ur91HhaqTQMOJT+ibdQYsWF80DsDwEJGMy
	4cuPuaO9GG8Vdrl8yPUgibhGmT7ZbcJ2TAd7gx2/7UNM277Sx5t+pu5llzipDjearZ8A
	/7RTT7QBFzRclgmCTszC6UdwlCTDavcD53BPVB6R8+3fFPg5kbVW19NK/uKCAS5l/r53
	ff0qs8Z9ymEUcJHny+m57Qv8pnNzu6T2Ncz+oemjkSi0xKtsb5b/WIcrGpqgb+JdqXRZ
	piiQ==
X-Gm-Message-State: AEkoouv65cjfj3S2N9dtsnrjbufACPgKWR/Ty0KeROj/2XZl7OFVumLr+wA5Bqt/U0FYCx4Fho+5R9PQkms/S3ON
X-Received: by 10.31.106.195 with SMTP id f186mr13719545vkc.50.1469724241120; 
	Thu, 28 Jul 2016 09:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Thu, 28 Jul 2016 09:43:41 -0700 (PDT)
In-Reply-To: <CAKmqyKPv11rO-za=VJqS4scg0-vUFUKkSKbo6Wbmt3PiEJfN3g@mail.gmail.com>
References: <CAFEAcA_UPR+nyBPX2qSPiX1j=fVkg9-+7FCo2bxX7RpmftfNKQ@mail.gmail.com>
	<CAKmqyKNxG4rNa6Nke6nXzXN1frRnkMYM3cy6p3Gr3sOGv-8n1A@mail.gmail.com>
	<CAFEAcA-2JYdTaBbxUB+D=6OyVHOQE=QC6CGO=vJFc5BC4CLEYQ@mail.gmail.com>
	<CAKmqyKPv11rO-za=VJqS4scg0-vUFUKkSKbo6Wbmt3PiEJfN3g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 17:43:41 +0100
Message-ID: <CAFEAcA_RcBW2m7xWVB0j4CBY4HDtJTz6o9k32X9bpyXAfDinKw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/6] cadence_gem: Add queue
 support
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lQi0IiyFlF8J

On 28 July 2016 at 17:41, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Also, I have a MAINTAINERS patch on the list, that should be fine for 2.7.

Could you give me a URL for that, please?

thanks
-- PMM
