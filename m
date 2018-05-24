Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1635558wre;
        Thu, 24 May 2018 02:11:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqmcLCB7Dl20Vcafz8UonJ+Cl3mmxRrdxX5vJfNglnAzdm81LZce4X4gkqS3Iq956G9Tdnr
X-Received: by 2002:a0c:e0ca:: with SMTP id x10-v6mr5922355qvk.8.1527153105305;
        Thu, 24 May 2018 02:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527153105; cv=none;
        d=google.com; s=arc-20160816;
        b=EyT99GtV/omyrXyGFRmpkeVr/e4roi5ylwErUuwan93cVnOk2a73o5eLUFazk6NTqK
         4xC1kiCtB0mVPWtgITDsILDstNk6GdxNbiWE4yqvmdguIPk72GnObwR5wTAjuTO16Knh
         PPRiII5R4YYDIflSPzK9XMMr2VTMBU2fi61ou9bQ1M4umyvGANxfsw0ngYxXDC85Roqt
         9XWiP4Xw2FxzYZS8Lk/rw1Wk0YVaJnSlcTMagy7/NMi97HhgV3IeOjs/JMFp2AUmun9I
         8ipmy2R0GdPC3llcYL4OIg/p94mx2aacd+W4mKRtMoC5nWt4zOC+dt5ofDllV54gnac9
         1Vwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KZQIRvTh3TV7zS5BxDmASXVpsPQ8D0av0gJnoYYT3RM=;
        b=tSamWg8U+oPvvFRP+Br0qj1+v8sWL55eOYCLf1m+cjOLpWuxu4+h5SwtlB8dB5COo1
         SdJYrRcRnQm+6VGwfUThshd1sEOx9cQ5TlzfQQiecSePGJ0X8cGIWCvbsegoTdhC5FFq
         zW7ghc8gOT3glMgtSRx5vsfAXADKgpk3pk+QoPp9ezB/p0vNH719vFFZeDo3D4P+OkZV
         jtRpkhnVyksdv6XipSwXZpEEKBMxwroOVjlxIhPSg8Gj0Dz46TdH3d1gqfAuuGyGaFRo
         7YQ/qmG7b2Uqeg+GTuzq8pUFbH18UKMmML951pG7p8PwGZlamPfliJxU5u8GIVBRQd2n
         gbQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XZJqBj6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s18-v6si4391865qtc.152.2018.05.24.02.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 02:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XZJqBj6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLmHg-0006Kj-Ro
	for alex.bennee@linaro.org; Thu, 24 May 2018 05:11:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLmHU-0006Il-EZ
	for qemu-arm@nongnu.org; Thu, 24 May 2018 05:11:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLmHP-0001PN-TD
	for qemu-arm@nongnu.org; Thu, 24 May 2018 05:11:32 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:34660)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLmHP-0001Ol-PW
	for qemu-arm@nongnu.org; Thu, 24 May 2018 05:11:27 -0400
Received: by mail-ot0-x242.google.com with SMTP id i5-v6so1077603otf.1
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 02:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KZQIRvTh3TV7zS5BxDmASXVpsPQ8D0av0gJnoYYT3RM=;
	b=XZJqBj6IwR8gIRwTOUZhBcrd0HwnxV5j6vyoJ5gSZe1tEQlBjdYBRWgySYmgNxxxSp
	Uvy19aVdk6zJ7k0g8wtrrv3l06d4QzE7llMgNBgzGCGWXYwZBN7EGBCaxMNSkuWZcZvw
	8hKPO6LvgINy1Ywdpg9J7TibWulkZZHDDDBFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KZQIRvTh3TV7zS5BxDmASXVpsPQ8D0av0gJnoYYT3RM=;
	b=LGVhi/IRj1yfCjjDwXE8B3XUPXiBTFKJapYBXpY4Tre7wPbEUvyLXb2tQmlo1wSW52
	T5ovK8muRPUHmwWD9zY1Mf7iyAoXUnGoBeAd/T2eqnIBrswveG8AV1PFKlsx6pGbm+1D
	mDofLpOFwwYOGLoB8UKthCB5vlEvMhueCWfXdVWIhXmjdh+xgLAnGVYpXOtPsKH8Z5Nl
	KKxM2nnpjwlVgXdNLYr0+mdWnFxdG8aHk8Oi3lUaUN7SsIJ/8e8UysGgSvW7mtUbia2q
	6V05WdQENQkxykS10Ey88sDyY2QUkkivsPz4tIaOIYcPYPoJmwQ1uKIDwydldiRNXry4
	mRbA==
X-Gm-Message-State: ALKqPwdB7UzgKOcovlHvgl/lsBGt+rVI3XNkfBOfC+evo8xKoMxzAeCk
	sjKbEudVjzt+YZstm7SR1PJnLDaMmeCugkoG2KBrag==
X-Received: by 2002:a9d:255b:: with SMTP id
	j27-v6mr4321608otd.316.1527153087115; 
	Thu, 24 May 2018 02:11:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 02:11:06
	-0700 (PDT)
In-Reply-To: <22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 10:11:06 +0100
Message-ID: <CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/2] ARM virt: Support up to 256
 PCIe buses
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5iBNBDwth61M

On 23 May 2018 at 21:52, Laszlo Ersek <lersek@redhat.com> wrote:
> On 05/23/18 22:40, Auger Eric wrote:
>> On 05/23/2018 07:45 PM, Laszlo Ersek wrote:
>
>>> Regarding the second patch, I do believe we need "more sophistication"
>>> there. For example, I guess it could be possible to distinguish "-cpu
>>> cortex-a15" from "-cpu cortex-a57" somehow, and stick with the low/small
>>> ECAM in the former case. (The 32-bit firmware already runs on cortex-a15
>>> only, and not on cortex-a57, according to my testing.)
>>
>> So we should detect we are in ACPI boot  + aarch32 mode to force legacy
>> ECAM region, right?
>
> Agree about the aarch32 subcondition.
>
> However, "ACPI vs. DT" is not the right "other" subcondition here;
> instead we should (minimally) check "firmware vs. no firmware". See the
> "firmware_loaded" boolean field.

Won't it also break a guest which is just Linux loaded not via
firmware which is an aarch32 kernel without LPAE support?

thanks
-- PMM
