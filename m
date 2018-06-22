Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp428549wrq;
        Thu, 21 Jun 2018 22:28:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL+Dvj2sTtam7+YCzIlulLfquPZlVSGfh9RrLWZArZjGOu4rYGOy4o1hwBZ9J7yT6UEXp3G
X-Received: by 2002:ac8:26b8:: with SMTP id 53-v6mr124179qto.57.1529645311686;
        Thu, 21 Jun 2018 22:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529645311; cv=none;
        d=google.com; s=arc-20160816;
        b=QtAzpXttnldRov4wupA88ScC6gFU4uWLSKhCPtAPQsEF03qj0gunmm09QuJoX5DHzm
         4tc2UIG8etOPnj5jSYwzWgmJd59hHmuciPO4mri5llDLWhGJ9x/tTMZkxbJKOFT9veo5
         kEQaqVZJuMxFgIB26K7Cgh/CAEdfgokQmxho+NjldH2UbysOPbd7QkMFb3ykwJUOyYlf
         q1ucGQhmLj+t9rfx3DPiynhmLay1o8aQYTMkUkX91AKs28LaBvi/ZJQGdQV4iC2Yid6J
         XsWS15BcZmJEhOhbTcR9Q3vDaPeNSDwxjv/EJ1LCZamegizRhM3YPr+Sgv3ByecSoiPQ
         d98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=IRHhTXkqStH7rcLZjN0NUnn/nGuDgpjXQWOOYvqtYQs=;
        b=v6SJZb0znYCswQwbSMIs1BnmystOnqtkvKpauimM1P3NFtp/gfivK3Qz9Pace/hq/A
         rsKJBhEffZ1EbFZN38biWGDIiB9wqyJB+rpywMgBR0pfpRf8QVWcvT7nMUymycDcba4B
         2pg02AedFUxsnzwDQyBb2+RE+3yQuBDeFC0qh04ZaAgEBtNK50K1RQrWz2rmcE36NL3s
         YXt1IXrJw0yKA8MYWn/7WzFrJ+dzDdGLko2aHyGVVti8hO0PdPRTemdYGe2DfwQfOvUO
         aPRVA4NDEugwiJQYdDfLfIK4pgS5p+/mEkQtmCoh2GYtgpdLheUXlbWp+qa7q7EY0A3B
         n07w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14-v6si6345562qvn.132.2018.06.21.22.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 22:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWEcZ-0006xc-6c
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 01:28:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWEcQ-0006w2-H7
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 01:28:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWEcN-0001o9-Ci
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 01:28:22 -0400
Received: from 8.mo6.mail-out.ovh.net ([178.33.42.204]:42093)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fWEcN-0001mm-6I
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 01:28:19 -0400
Received: from player687.ha.ovh.net (unknown [10.109.120.75])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 58ED5165DEB
	for <qemu-arm@nongnu.org>; Fri, 22 Jun 2018 07:28:15 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player687.ha.ovh.net (Postfix) with ESMTPSA id 8985F2C009F;
	Fri, 22 Jun 2018 07:28:05 +0200 (CEST)
To: Joel Stanley <joel@jms.id.au>
References: <20180621223946.20738-1-clg@kaod.org>
	<20180621223946.20738-2-clg@kaod.org>
	<CACPK8XevZ-n9+M+zYmnnZPqb35SxCZjb8TB6fp17jZ+DZ1mPiw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <27a0d65e-5d67-eb24-2ee3-f13fdb53cdec@kaod.org>
Date: Fri, 22 Jun 2018 07:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CACPK8XevZ-n9+M+zYmnnZPqb35SxCZjb8TB6fp17jZ+DZ1mPiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 9866823837530033067
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.42.204
Subject: Re: [Qemu-arm] [PATCH 1/3] aspeed/scu: introduce clock frequencies
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EBAWBxfg4LCM

On 06/22/2018 02:57 AM, Joel Stanley wrote:
> On 22 June 2018 at 08:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> All Aspeed SoC clocks are driven by an input source clock which can
>> have different frequencies : 24MHz or 25MHz, and also, on the Aspeed
>> AST2400 SoC, 48MHz. The H-PLL (CPU) clock is defined from a
>> calculation using parameters in the H-PLL Parameter register or from a
>> predefined set of frequencies if the setting is strapped by hardware
>> (Aspeed AST2400 SoC). The other clocks of the SoC are then defined
>> from the H-PLL using dividers.
>>
>> We introduce first the APB clock because it drives the timer.
>=20
> Looks good! One small issue below.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/misc/aspeed_scu.h |  70 ++++++++++++++++++++++++++--
>>  hw/misc/aspeed_scu.c         | 106 ++++++++++++++++++++++++++++++++++=
+++++++++
>>  2 files changed, 172 insertions(+), 4 deletions(-)
>>
>=20
>> +static uint32_t aspeed_scu_calc_hpll_ast2400(AspeedSCUState *s)
>> +{
>> +    uint32_t hpll_reg =3D s->regs[HPLL_PARAM];
>> +    uint8_t freq_select;
>> +    bool clk_25m_in;
>> +
>> +    if (hpll_reg & SCU_AST2400_H_PLL_OFF) {
>> +        return 0;
>> +    }
>> +
>> +    if (hpll_reg & SCU_AST2400_H_PLL_PROGRAMMED) {
>> +        uint32_t multiplier =3D 1;
>> +
>> +        if (!(hpll_reg & SCU_AST2400_H_PLL_BYPASS_EN)) {
>> +            uint32_t n  =3D (hpll_reg >> 5) & 0x3f;
>> +            uint32_t od =3D (hpll_reg >> 4) & 0x1;
>> +            uint32_t d  =3D hpll_reg & 0xf;
>> +
>> +            multiplier =3D (2 - od) * ((n + 2) / (d + 1));
>> +        }
>> +
>> +        return s->clkin * multiplier;
>> +    }
>> +
>> +    /* HW strapping */
>> +    clk_25m_in =3D (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN);
>=20
> I think you want to do !! to this result, or shift it down. Otherwise
> you are getting 1 << 23 or zero, when I think you want 1 or 0.

yes. I will fix that.

Thanks,

C.

>> +    freq_select =3D SCU_AST2400_HW_STRAP_GET_H_PLL_CLK(s->hw_strap1);
>> +
>> +    return hpll_ast2400_freqs[clk_25m_in][freq_select] * 1000000;
>> +}

