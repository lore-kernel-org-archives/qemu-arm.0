Received: by 10.25.30.65 with SMTP id e62csp819323lfe;
        Tue, 24 May 2016 09:20:49 -0700 (PDT)
X-Received: by 10.140.180.132 with SMTP id b126mr4293484qha.32.1464106849391;
        Tue, 24 May 2016 09:20:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c128si3210295qkd.12.2016.05.24.09.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5F4a-0006g1-My
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:20:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5F4X-0006eq-6x
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5F4S-0001Nr-8x
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:20:45 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36617)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5F4R-0001Nf-Qi
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:20:40 -0400
Received: by mail-vk0-x229.google.com with SMTP id y2so28572337vka.3
	for <qemu-arm@nongnu.org>; Tue, 24 May 2016 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wtYvme4mPLrWR04WqiolKTQ2VaOaOiE4Rp2pm4pyhu0=;
	b=POsmT1M69meV20v202ENhHEtBdrGwFwbzN/rLUHsS5ZLWk5gmRhpVjwGM6FosYidK5
	KBg6PvzfilfU18+0mvvzs2hYrA/QXx6DygVP/llZLSgDp+b4c2/91jT/0ZvlPn7LtO4Y
	wtZ5/n9Gofs0ifGj6LHP5YJ69zRHfCrtsAtrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wtYvme4mPLrWR04WqiolKTQ2VaOaOiE4Rp2pm4pyhu0=;
	b=EWAog/LZyQXnsioV28mlFvsPrGoUDg1Q7LEJabXiPL8GA93rJGLPxTn7LP5pXqIppM
	uyOCix9g9FFnRTwkklzo1N3Svx0NXQHCjRg3T3/bxFfFWV5Q3WPO++9MKICKZ2H6NXoR
	1Q/OktrQxM5rd5AB991Ztuzt01jgO/caPcyPEGK7ANrSH2/YSU4DH+GSr3YkMPbmURV5
	/przmdotUbsn7ZBtT457TpkyS6b8vD3ALvj8nhHClysCop8PEB/NtV8y7BJy2kcHVhsd
	WzUjO5RG6mLCvRTouU/7kWcJ2ZXrW4HarhY4+OvUyMzWXoUZKtHWPsI/fN9e3qWkAiRO
	/kXA==
X-Gm-Message-State: ALyK8tJ51tbhzxZHfc4SJ/bF10ltCBIdYj/PUr47Cis6CM5emeiJ4cU+X0qHtlk4wc0ajdqFvBXkyeInpBtz7xUU
X-Received: by 10.31.81.199 with SMTP id f190mr2462303vkb.139.1464106839083;
	Tue, 24 May 2016 09:20:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 09:20:19 -0700 (PDT)
In-Reply-To: <56FAE2D2.6090307@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
	<CAFEAcA8ozt0SdmfgzKVSr+2Y7ou2u29g=Y35u-jmi5O8ZgH7qg@mail.gmail.com>
	<56F92FFC.4020805@gmail.com>
	<CAFEAcA_SCnc_C_LteDMRwSXFa80gKOt0Gimc_R8vjVURWx8pSg@mail.gmail.com>
	<56FAE2D2.6090307@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 17:20:19 +0100
Message-ID: <CAFEAcA9o3gcsgLLPQpsnww+Wn3OgpXgM_gjbTg6t6J2_SmA=NA@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v12 0/9] PTimer fixes/features
 and ARM MPTimer conversion
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
X-TUID: R0hiE3AcYVoa

On 29 March 2016 at 21:17, Dmitry Osipenko <digetx@gmail.com> wrote:
> 29.03.2016 22:00, Peter Maydell =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 28 March 2016 at 14:22, Dmitry Osipenko <digetx@gmail.com> wrote:
>>> PTimer fixes ready for submission:
>>> [PATCH v12 1/9] hw/ptimer: Fix issues caused by the adjusted timer limi=
t
>>> value
>>> [PATCH v12 2/9] hw/ptimer: Perform counter wrap around if timer already
>>> expired
>>> [PATCH v12 3/9] hw/ptimer: Update .delta on period/freq change
>>
>>
>> I'm afraid at this point I really don't want to apply changes
>> to code like ptimer that affects multiple platforms; this will
>> have to go to 2.7 :-(

> Okay, this is fine too :)

Can I ask you to rebase this series on master and resend it,
please (or at least whichever parts of it you think are ready
to go in) ? I'm sorry it's been kind of left in limbo for so
long but I promise to look at it when you resend it :-(

thanks
-- PMM
