Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp570220wrh;
        Fri, 3 May 2019 06:34:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxez05CjxwkqBlV2R85fc7IIzz3eA5bfVtcmY7kL6aQR83B2jugQ2jeAjGuccWNnHhqu6vH
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr6187694wmg.14.1556890475351;
        Fri, 03 May 2019 06:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556890475; cv=none;
        d=google.com; s=arc-20160816;
        b=XZODpMmXw7pl+6gr+1Cw/b1TFMgqg8sk4Tomop4M1rT2lvjBCqNXSakGEyxC9+5/dp
         noKgmJdCcfZ8z+qnTxq4mHLH0FA35Wx4s6quC3UajlCA6lnZc/ka/wB9Q3IeUhCuRzwE
         ZXJihio9F6Edh/QXpm5SGPJjKc7gM6nLzm2dIIK6jF87wd3pTOO1dmmbP/Y2T2XtyeTx
         npVxEsbYP7nHXjoAHjL93VjjtN7P5p2dvDEvihvv3h1rmjDDsXQK9Ws6+BxFQfozRDyg
         Qq979TGE0JP1nFi78SAE6ZYp0yzy2cg1e5OgBBgElYG33C8JyCkCTKufZ3iIzssPsNEd
         pv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s0ASd/NXbuwDTPMnweznDAH4VIMGLMzVeOqmXZbhbKY=;
        b=Jp6ICVro7AY3tprJZ+APP3H3VHZNEXk4s4Kac6ITmh18TSsS79zZC/Egj7zEEO3mmp
         maJNbibzLgTjXnB83Bkoj46JMeUwSBwylMCSOoOyZw05BIytjpXCdI1/p0H45hdI0QhL
         EFANdYKb/nHhbVLJ5bAgCxDYIt6IMh2RZ+ajm6Qt9FEb5/cObi/ldo5FPapPoSEIM9jn
         TIOJ2sDeCLwzTcj6CgRpfLMtsRsBL0pzgASJSKP/kp3pZSn7jYjt/sirzT4xMhDLhtEi
         6Z6G+/DXeFpq6KVDYReA/6AkADkUAqDAyTHG5OxwU6OTPlwOgrLX3E8UacFgLwljhyo+
         fy7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qDTMSoYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si1569369wrr.376.2019.05.03.06.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 06:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qDTMSoYw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:40810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMYKg-0001zt-Fd
	for alex.bennee@linaro.org; Fri, 03 May 2019 09:34:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYKU-0001yI-Lb
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:34:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYKR-0002Sm-C1
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:34:21 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39785)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMYKO-0002Jh-Vp
	for qemu-arm@nongnu.org; Fri, 03 May 2019 09:34:17 -0400
Received: by mail-ot1-x343.google.com with SMTP id o39so5278552ota.6
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s0ASd/NXbuwDTPMnweznDAH4VIMGLMzVeOqmXZbhbKY=;
	b=qDTMSoYwdYGix1Y2WlMEWpCZRWoSBdXqLxMzhKr8zeSucadqazQe2uMe6VsLlKHqef
	VDMqlj+KF9oVB9/nKcd/IX2uRMlIH63isuTNfqQuBdOfcbf7o1bWAkXJRsQbWC7/Zdix
	VEqhoM8Q8F0RFgHiGFyepxFLBgtcVd45eewtSxPjWp4/ovdtfkRDgtQv+Rjbg7/uR5cU
	wO+MWh90AgGnb3/bJ/fUOS0q2pkKrkR4SXEgH/a95FeimzWKTwy3vqzn9FpYbeKoFLEw
	gJI+vaons3W9/cGb3ImiSj5TKAqnGt4MywqVxPeDjIBA3CtK6v3JIKeXxxMJastlZV1y
	5l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s0ASd/NXbuwDTPMnweznDAH4VIMGLMzVeOqmXZbhbKY=;
	b=NtXNSaCOiYMnymIcK1rwmDlBelTrCQ+JnwwPaRQEDl1jKgMkw+BdgVCwtd6cs9aJq5
	q2a/1+nMl5t7TW1P6h7Nh0ejWWh4dpOVWgPgudUVNngS/3dYatYN9LB519TAwsS5ijHe
	71scj1Vt+cvS8sJSzWF6KQeo780aPAlMLW1UL7CGLsyPvXxBhAdeYqbn4+hMyvffoBY0
	75LtN7EPp3GMiwCG9opzp4vGjHJlYAGXC9tJbjsCrzt6FNgoOGhVVzsOpr16PcD1zOlj
	5N1ct2k3qn9B09FYDFMEBLm5B8qYXyDr1YRwxAeZ/yDMienEA5jCZDoBxIpsos2p8y8O
	CsGg==
X-Gm-Message-State: APjAAAXiFaqM96KA1FaYq/+yodTQnplce5XxPafCj5q6fYwFtRtncGat
	KrUzuJC9PmQ4I6H/d/FPNKWw1eQH4OiJS2Xa8mebUUimcKg=
X-Received: by 2002:a9d:404:: with SMTP id 4mr6426899otc.352.1556890453968;
	Fri, 03 May 2019 06:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190430044036.1144-1-joel@jms.id.au>
	<20190430044036.1144-2-joel@jms.id.au>
In-Reply-To: <20190430044036.1144-2-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 14:34:02 +0100
Message-ID: <CAFEAcA-A-2RYAibPMRxKM6RPabxiOH-DLAzyRu8s5c3Vz+KFgQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v3 1/2] hw: timer: Add ASPEED RTC device
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bMkyTYQTjmLp

On Tue, 30 Apr 2019 at 05:40, Joel Stanley <joel@jms.id.au> wrote:
>
> The RTC is modeled to provide time and date functionality. It is
> initialised at zero to match the hardware.
>
> There is no modelling of the alarm functionality, which includes the IRQ
> line. As there is no guest code to exercise this function that is
> acceptable for now.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
