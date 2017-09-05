Received: by 10.223.172.38 with SMTP id v35csp1616325wrc;
        Tue, 5 Sep 2017 09:27:21 -0700 (PDT)
X-Received: by 10.55.31.211 with SMTP id n80mr6408351qkh.324.1504628841243;
        Tue, 05 Sep 2017 09:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504628841; cv=none;
        d=google.com; s=arc-20160816;
        b=1HqpSyJlMG+YY8GDg94hM92Ukr/wBSALCWTh7N97fmEwBtHiGHNuUMLZ2B9EhiLRoi
         rCezXHsxs64upZLOUa1ehrUf26LaG3jFsRWz96XL0v9sz1KjtmtkKwcgY7Clgvpy0gbf
         2MSYyEgLxughKUEAR7Pk8rV9kOqjHBzl+I0RwOklNBHg2KhqBGbssG/NYEH6XI9BdRuJ
         xrBSWKU1sfbbqa/SPLu0Snj13z78aCF1PQIYWDgW24Trw/FMbHAiqh96sUyTg9hbuWOe
         dLz299eVhnmmXPK8c+S/uqafLn37XypMpRooGD0wow5UvGlbPrch9BJIaqSjFP3DkmFI
         EPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=oyqoJOMUtq3LAF2lemI+YRLqkIcck9C0/gh3d4WmXPk=;
        b=jAfCQrnZQPmJIw2DVbDltVZYzLt+eNBdCdX3kiVOH6DqOvHdmCBEgoagk69dwhWqwW
         r0D6vizq7qi/IFSHz0UG2k4Rlb5GDhi+gHQUFkHjtEuMxbGSMNuGp9g0XOvot2CSdi1E
         APjtOoKdxTwiNzfm4wzzpKXmbscClsjeAfFKKKqxbH0yewbv7AxKz8p33eLrtogq9T8P
         CysIF6CVb23mXu7+YX1Jh83alacWuEcjU8K9A1X1fgHcaWZFUrzXIMAXUNduqoQn+c2h
         UwKTVjH/iee70JBLNGZsDLJYvFLSpdTHPj5+cc3nTEOvhR4rj8pln9ftOQ9Rmhd6M/4d
         aqVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i3H4VW5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u40si650768qtj.50.2017.09.05.09.27.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 09:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i3H4VW5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpGh5-00049U-0B
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 12:27:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpGgs-00046S-Qj
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpGgo-0005MJ-5l
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:27:06 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:38198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpGgn-0005LV-Vo
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:27:02 -0400
Received: by mail-wm0-x232.google.com with SMTP id 187so21414056wmn.1
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oyqoJOMUtq3LAF2lemI+YRLqkIcck9C0/gh3d4WmXPk=;
	b=i3H4VW5N4iyaXVes971dnC7F501r0bIdQF1hKpbvfkzGi1FBLZANdUwP/H/wiJzsIV
	Tu0FdfuwBUQ3nNo7ZbyAgZh7RrgKIAO9hbq0S3ytRXFt0Mze0AeUV4vHVCru+libFL1g
	ChRNP3VATB9hUjta7lGhpQ68MuSQmDb7J8Rdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oyqoJOMUtq3LAF2lemI+YRLqkIcck9C0/gh3d4WmXPk=;
	b=Zzqhl3dPxHPH+EVsEc/3FlOjzLAva7Q/eDIkWHtSsJ+w0Svjp7x5Kmr69B0V4YX3Ey
	DhbgKh5A4oq0RF2yBqtLd76xEFQAnzid0BGW9lES/mraUHQgqAnBHYJ471L3Owisq/oL
	KFFkQMHxtLWA5wu+w73wkcHqGpTqekWXs502TgoXiWnXMOEkovdHkhKINyMPC6IHgz+e
	NNDEREEpH0ggVifC1ZjpecLT6VkzGxG6NtNuWHArHfkAO0m88vUt2ZehhysN1NXk6GyE
	+wkimIQKzsJ6ypVWA+3KZFzPwYiCDaoy9b/KNFC5zvRYHCwnLdiIxrG4C/0sL8RyMhvz
	QSww==
X-Gm-Message-State: AHPjjUjZokWNsFbBp+NqvT31Ho0FFbmgB7B5A6OW4wjgkEW7NqLuCmS8
	twR0nbRSBeEzKxivbHH3o5Ec+4isuOoH
X-Google-Smtp-Source: ADKCNb7/Tdp2dxB77GSf86kcZp0l4vLc2b5y6WkUP4Yvu0n9KfIJTP0ewmMtyk7s6hxCWii5K93zW75uCh95g8lLSU8=
X-Received: by 10.28.34.198 with SMTP id i189mr3364509wmi.165.1504628820823;
	Tue, 05 Sep 2017 09:27:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 09:26:40 -0700 (PDT)
In-Reply-To: <b59d3474-15e4-7f01-d4d7-8ca0fcfef6b5@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-11-git-send-email-peter.maydell@linaro.org>
	<b59d3474-15e4-7f01-d4d7-8ca0fcfef6b5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 17:26:40 +0100
Message-ID: <CAFEAcA_F-oRO0vT4d62G1vat9o0o9exPKfEXw_BykXnXZJEYgQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/20] nvic: Add NS alias SCS
 region
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JtoAnvMJ6mRZ

On 29 August 2017 at 17:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>> +    regionlen = arm_feature(&s->cpu->env, ARM_FEATURE_V8) ? 0x21000 : 0x1000;
>> +    memory_region_init(&s->container, OBJECT(s), "nvic", regionlen);
>>      /* The system register region goes at the bottom of the priority
>>       * stack as it covers the whole page.
>>       */
>> @@ -1185,6 +1242,13 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>>                                          sysbus_mmio_get_region(systick_sbd, 0),
>>                                          1);
>>
>> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
>> +        memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
>> +                              &nvic_sysreg_ns_ops, s,
>> +                              "nvic_sysregs_ns", 0x1000);
>> +        memory_region_add_subregion(&s->container, 0x20000, &s->sysreg_ns_mem);
>
> There's a whole in between the two regions, which you are leaving mapped.  Why
> create a sub-region instead of two separate top-level regions for which you can
> leave the whole unmapped?

We don't map the hole. The container is 0x21000 in size, the normal
nvic_sysregs region is 0x1000 at offset 0x0 (which will be 0xe000e000
in the system address space), and the NS alias region
is 0x1000 at offset 0x20000 (0xe002e000 in the system address space).
There's nothing mapped in the hole in the container, so accesses
there will busfault, as they will for other PPB accesses before or
after the SCSes.

thanks
-- PMM
