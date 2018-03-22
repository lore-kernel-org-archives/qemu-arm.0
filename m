Received: by 10.28.71.155 with SMTP id m27csp196698wmi;
        Thu, 22 Mar 2018 04:00:34 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtr9eUkMZXi0k8ddSh0S59fph0uafHwyM2GtXKwye7FsnY92rO621srhzkfB6OC5lQthxMD
X-Received: by 10.55.54.73 with SMTP id d70mr34588704qka.260.1521716434156;
        Thu, 22 Mar 2018 04:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521716434; cv=none;
        d=google.com; s=arc-20160816;
        b=NlznvEWtP79YJ96pNaIydmuhZKSkD+ufce1+fLegEyD7gqkF6kcgiu3joSitkmPxMk
         cxJoz2GWzNNFrwoPw4wrNfJ40m1TnjNZld9vc/YG+td7IbzKTQWb8UDTIXQ+HCSSfkcg
         5cpIWbm9JwbalVeOq0j+QI4TlR6juxtvw2rXuqs/fpq8Lrhv9XtKElvQssoJ1z3CPaL0
         xhBPKCu6CGxghkurv0OkGBIcyWou3xXnE+xUiePw8at/tcyO/WAXT2KYbo33SbD6pdFH
         7By/3kLYbBqmSiWFt6bsMu+FKjHM1QBj68DHBA6au3e0P59BcHjYyQVAUrexUvsBWHv4
         mP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=h5i0xFYIpcMze3aSSTtV7at9k6QwV1RewxWahMX0PaM=;
        b=OqBJSyhbxGxHbiChgaA2fwpyDpVbvNL0S6WCPp5uEdwt6OY4XoF3BKhCWIU6MKVAdS
         BSFZMiMZs1EXqXUz3cciR9taq95dEW/CPTtZUXVP9t3F09AZDWDWXVS9fL4iGd9WKhsz
         RYwO94bcmxvzKFyF3HfhqbIMPUATnnh9YcDjjGBHi5PQf+9mDBjddkP0Hvs8kmFiJldh
         Dtf3+9biMS/fotb91mHJP2RmxVzx2+fPcRC+z4r+OMkph/w4Yx9RxBbVromjDZYE7UBV
         HOdk+HvHm7i+IKrnA/9eIIjfC3EwxTkVFjX6M/lsntIbxGUr2qlgsIQSl3UYMOax2C1c
         VYNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ND3KnAQa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m61si721881qtd.4.2018.03.22.04.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 04:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ND3KnAQa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyxxR-0001A1-Ji
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 07:00:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyxxA-00019c-DZ
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 07:00:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eyxx9-0004bJ-KW
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 07:00:16 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:34935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eyxx9-0004ay-ET
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 07:00:15 -0400
Received: by mail-ot0-x243.google.com with SMTP id r30-v6so8954354otr.2
	for <qemu-devel@nongnu.org>; Thu, 22 Mar 2018 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=h5i0xFYIpcMze3aSSTtV7at9k6QwV1RewxWahMX0PaM=;
	b=ND3KnAQaouTKTp2F4TOid8FCPDPCVCllwdDFFpdLWwVz5NRMuFuZ6OkYwkwH/u7GVn
	6ucXF41PcK1eUnvHLJz5lgJDmx8VAds8ziFOCemiHFwPUrVTb1wQFNkJ0531WTGYlpB0
	0uCqK8na+xVX/+gZVdWHw4fAknnnVm+vm0yyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=h5i0xFYIpcMze3aSSTtV7at9k6QwV1RewxWahMX0PaM=;
	b=EDnA16TfvicZAssha4NEwYGLJ7F6c/fP3nSoPiqmEi2BiAcY/2MKudDEqA/tSEMI7F
	5t0uLSplbRyKKQosrLbRwi2rUx04UDtS2VlvZNG8PhcQ8msm0/RcJqSHnwaBPb7yWvg7
	qj4khNtP1YctySRYk5PSckA9BIFhMWIPhGxdhYW2U8PsWanOjPw+NcXkDPm8iPOc9PxB
	u5Fp8Ua8w30P2s8btXfq/WKpF6aUtyIZe3ja1OPm4mt7QBsVwf+tdQCK0XybctqGn+45
	KyDDwsaI0r4bf3i6nGVxz9hFmMGfB9TFX24ola1biKuYnLYXb8SAxkZu8uap7qGmkY76
	Kcxw==
X-Gm-Message-State: AElRT7F/WS6mO0ibaRhYh6rob/5kIcATymhl2l3SK4ssVgchNh4LZCFW
	v+rGjW/8k3VySNZZNthEulpSfQP2u47IIdCuc6G7wA==
X-Received: by 2002:a9d:4c0b:: with SMTP id
	l11-v6mr4783412otf.258.1521716414581; 
	Thu, 22 Mar 2018 04:00:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 03:59:54
	-0700 (PDT)
In-Reply-To: <8f878d04-d5c2-77ae-9fb9-d98d41efac3c@amsat.org>
References: <20180320134114.30418-1-peter.maydell@linaro.org>
	<20180320134114.30418-5-peter.maydell@linaro.org>
	<8f878d04-d5c2-77ae-9fb9-d98d41efac3c@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 10:59:54 +0000
Message-ID: <CAFEAcA-nShiCLTDvgeLxCoUJciB3uTLCGeLLD0mRLtRFj8WN1w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-devel] [PATCH for-2.12 4/4] target/arm: Always set FAR to
 a known unknown value for debug exceptions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bBLoJqjK32wJ

On 21 March 2018 at 22:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> On 03/20/2018 02:41 PM, Peter Maydell wrote:
>> For debug exceptions due to breakpoints or the BKPT instruction which
>> are taken to AArch32, the Fault Address Register is architecturally
>> UNKNOWN.  We were using that as license to simply not set
>> env->exception.vaddress, but this isn't correct, because it will
>> expose to the guest whatever old value was in that field when
>> arm_cpu_do_interrupt_aarch32() writes it to the guest IFSR.  That old
>> value might be a FAR for a previous guest EL2 or secure exception, in
>> which case we shouldn't show it to an EL1 or non-secure exception
>> handler. It might also be a non-deterministic value, which is bad
>> for record-and-replay.
>>
>> Clear env->exception.vaddress before taking breakpoint debug
>> exceptions, to avoid this minor information leak.
>
> So this series is worth Cc'ing qemu-stable...?

I don't think so. This isn't a regression -- we've behaved this
way ever since we introduced LPAE support, five years or so ago.
In particular Linux doesn't care about it.

thanks
-- PMM
