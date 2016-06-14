Received: by 10.25.21.96 with SMTP id l93csp60124lfi;
        Tue, 14 Jun 2016 05:34:46 -0700 (PDT)
X-Received: by 10.140.95.68 with SMTP id h62mr18869938qge.33.1465907686499;
        Tue, 14 Jun 2016 05:34:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f127si18213579qhc.54.2016.06.14.05.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 05:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCnYL-0002uF-OA
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 08:34:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCnSs-0006Dz-PU
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 08:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCnSi-0005qj-Jp
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 08:29:05 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCnSi-0005qI-FJ
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 08:28:56 -0400
Received: by mail-vk0-x230.google.com with SMTP id j2so42401148vkg.2
	for <qemu-arm@nongnu.org>; Tue, 14 Jun 2016 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g4ALclh7pyezmqIBHHAj8+I5gH65eJ9g9QrW8zcyOyw=;
	b=Qx7C270fvg5PsVc0Yok3YlEKXYRctWioXp1fdkvrsuDwj3ZiwMxQplEjQsIwxVV06R
	UJctAMItH31KB7Hiuwfc5BR5MlLKL3jVA51VFcfpVVSLjUv2Se1VP3ntwM2Wk2dFo5a2
	EmJRJSM2NjzK58F6n9BJb4akTc4ztxO3Iwpho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g4ALclh7pyezmqIBHHAj8+I5gH65eJ9g9QrW8zcyOyw=;
	b=fPfZz9nznOxClQzYGgVZyjb6fzxopPbncwaO72f4Jzl+jx8WlCB87rC4daZECDBRu6
	hkqfU4rxJeXQJi3Hc11Q712uIb5nxE+uXfV/IkvP8CrcH4EbHjitlohgVvEakmxuh6pG
	Iz0sOWIme+U+wg2DM/BcKZxS6YEkYA8GqdJaHI0+9wJOtgf0PQNQ72Cr39sOy1TIGDX+
	aXoqZZNpcdKmSud+hw/Tr73yBmR0749gNQaxQ86umvSU8nIoojvT2u2sBCV9h+tC8d0U
	AAGYYb38uMmj0f4691IaSgAQjY/ClC7EEh5+FgiX+OsoTRrMTUrB/bCaifEnAus4t8sM
	SmDA==
X-Gm-Message-State: ALyK8tLozR9YaA2shsbSe8SUOy6ZzJmwkvF3PdZWxSg7UVVwvNTJgyc4msjk7zsv2FgAkhFMiy7PnqVMEmawSDd4
X-Received: by 10.31.15.20 with SMTP id 20mr8500056vkp.82.1465907336060; Tue,
	14 Jun 2016 05:28:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Tue, 14 Jun 2016 05:28:36 -0700 (PDT)
In-Reply-To: <CAFEAcA-HB57NGY=+8EeX4XFWoe8SSNJq66WGEPJsqTOQcG-WcA@mail.gmail.com>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-13-git-send-email-peter.maydell@linaro.org>
	<575F7577.1020903@huawei.com>
	<CAFEAcA-HB57NGY=+8EeX4XFWoe8SSNJq66WGEPJsqTOQcG-WcA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jun 2016 13:28:36 +0100
Message-ID: <CAFEAcA-eCR5qDG_86iMkj4TTM8AqTdrTsB-1gGj2iafynYE0mg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 12/22] hw/intc/arm_gicv3:
 Implement GICv3 redistributor registers
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SITbVAdaNsv2

On 14 June 2016 at 13:25, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 14 June 2016 at 04:09, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>>> +    case GICR_NSACR:
>>> +        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
>>> +            *data = 0;
>>> +            return MEMTX_OK;
>>> +        }
>>> +        *data = cs->gicr_nsacr;
>> Look like this is not consistent with the SPEC.
>> The SPEC says
>> "When GICD_CTLR.DS == 1, this register is RAZ/WI.
>> When GICD_CTLR.DS == 0, this register is Secure, and is RAZ/WI to
>> Non-secure accesses."
>>
>> So when GICD_CTLR.DS == 1, it should make *data = 0.
>
> Agreed. This should have the same kind of condition as GICR_IGRPMODR0:
>
>         if ((cs->gic->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
>             /* RAZ/WI if security disabled, or if
>              * security enabled and this is an NS access
>              */
>             *data = 0;
>             return MEMTX_OK;
>
> (similarly for writes)

This also applies to GICD_NSACR.

thanks
-- PMM
