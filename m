Received: by 10.28.173.206 with SMTP id w197csp865324wme;
        Thu, 11 Jan 2018 10:40:17 -0800 (PST)
X-Google-Smtp-Source: ACJfBovuSMsEgKmOpJBXLh5QLnZBMVKoV8o1aSnh2lIQmLZUVV/GBWlMwevlBMfv+LtXvK+zDuqt
X-Received: by 10.129.121.193 with SMTP id u184mr16559455ywc.100.1515696017453;
        Thu, 11 Jan 2018 10:40:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515696017; cv=none;
        d=google.com; s=arc-20160816;
        b=DBG3vPiWHu8Qe5GWJRq3vPClf7lzLQzYfKHPuIDML0D9j4q4myXQgNmaq+noLSoj29
         4LetUXqDhgUd9BoBWGOR0w4mv/j7EaJ73eFVEPhZD8e3M9LTESoLna+S5pPyZlHEgjrp
         gSEfCbXitK4lsQfYwMiUJFJbEj1AKQ73fb37c7yxhPHCvmE0sOybtAEYUXg4uwhrTcL7
         TlfjZ8fpH5OCKS7IcXhdPcOX6w8415RhWrJpO/Sg8+TsftCuvW32V44cdnBCEMQXFdOk
         zXDKdbVtTf+RduoA8Vlh+Ph2fhj18iX75/6Re4p/PefQRg7USfkG2JpVKr6Py9LKfnoS
         w1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ztSQP3z5kkgb/c0PY8bhy7/VrMO43obc4yCI1qLYwxc=;
        b=W3f1Pov9XshqnvF5JhI3Yc/C4+6nFImQmjbWKer4f7MBwdrk1qyzw3AthTwJUVJ54f
         P3m77PtyfXvZZxM4wHhxtie2jTNOrxMZ+riJWsJoGUReJb4izuSgL3IX9haes46gxh/r
         aZOlywu15NKzmXjWm/bQo0OF5aEsbCWgzvpKiCCjrEWZjiQxp1BAhIcdnI7vNpri3HIv
         pO3PQCQn0In5saTwAZYUD2rqxyi/BEweMXOvYHE+ognLGYQAbIHrCoS8p9mXNSzUmu1n
         izg8nsGF7EbSydkn7kfgV5b3v8NCWQ1VoZK4FWSPy0vddA3PUps/8zWmIxXlpziUQvkV
         +dpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P62khTjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g142si478266yba.603.2018.01.11.10.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:40:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P62khTjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhlw-0001oC-Sx
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:40:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhlj-0001kd-Ax
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:40:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhli-0000Kd-AU
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:40:03 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:41656)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhli-0000KB-6G
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:40:02 -0500
Received: by mail-ot0-x242.google.com with SMTP id 44so2057845otk.8
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 10:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ztSQP3z5kkgb/c0PY8bhy7/VrMO43obc4yCI1qLYwxc=;
	b=P62khTjJ/DZ93ZnZTm6yyr2AgoVJ5GcKsO3ysgJ/UdlXHOnQLFQen7bNbZERktLIV0
	BgsKv0Y6RoO5sCsv0Ai0N+AJkwbXl/Sz7lPht5Nvi+WaASODcDVQYMPg7BcAw0BcvYiP
	MpGM9q4W5PT3UOHovSsYltDTtIGLNXb080wGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ztSQP3z5kkgb/c0PY8bhy7/VrMO43obc4yCI1qLYwxc=;
	b=AG1docfhqEtQPhbmw98Ol6qepj+E0T0nhSdVGPtYfVSofMC2h+962F2O8YnNEtQnr4
	QCN9eosqYZAPQPN8/RXpriJRF/OJHbscIpeSTs5CUlKT4EuhssoMjxZSXLn8EpRvuJCq
	g197ymY7UGoJwuuiU+ZVuBitB2z3dilmJHfA80JCwCab3F7ugPLkv516MmjfzUt9/OB7
	2wTDRHP/8+qzn2dbe2VyatbEEoUffUXrNJFjUHyH7MJg0ctHSxeMNzv1UTZSonvcz4p/
	r6PSXlq+9o1/GI9j0NSCFddRzJxwEvqrztxZynKhxa6DLq7hs47VUBPqMHL0/oouH03M
	AhAQ==
X-Gm-Message-State: AKwxytc0soo+mBVweOMOIn++Qz2iavgsaFzFDUwtR6UZGPBuyEZryumB
	t/CakeaU0xPia1C0aO+BzUzPdxnjoruPd3ygfqW/+w==
X-Received: by 10.157.8.172 with SMTP id 41mr12647515otf.116.1515696001209;
	Thu, 11 Jan 2018 10:40:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:39:40 -0800 (PST)
In-Reply-To: <20171218173022.18418-6-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:39:40 +0000
Message-ID: <CAFEAcA8+fQ7QiygiM0C5kgesNSpiFnJDCjnAyjAtm=zt2cRnAw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH 5/9] target/arm: Add
 aa32_vfp_dreg/aa64_vfp_qreg helpers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SR5sVMw9waFH

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Helpers that return a pointer into env->vfp.regs so that we isolate
> the logic of how to index the regs array for different cpu modes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 20 +++++++++++++++++++-
>  linux-user/signal.c        | 22 ++++++++++++----------
>  target/arm/arch_dump.c     |  8 +++++---
>  target/arm/helper-a64.c    | 13 +++++++------
>  target/arm/helper.c        | 32 ++++++++++++++++++++------------
>  target/arm/kvm32.c         |  4 ++--
>  target/arm/kvm64.c         | 31 ++++++++++---------------------
>  target/arm/machine.c       |  2 +-
>  target/arm/translate-a64.c | 25 ++++++++-----------------
>  target/arm/translate.c     | 16 +++++++++-------
>  10 files changed, 93 insertions(+), 80 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 7a705a09a1..e1a8e2880d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -493,7 +493,7 @@ typedef struct CPUARMState {
>           * the two execution states, and means we do not need to explicitly
>           * map these registers when changing states.
>           */
> -        float64 regs[64] QEMU_ALIGNED(16);
> +        uint64_t regs[64] QEMU_ALIGNED(16);

Why are we changing the type of this field ?

thanks
-- PMM
