Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2833151wru;
        Fri, 10 Aug 2018 02:04:30 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPySCOMA+bFRA2Rf1xSSZDAl3ia4fgLYJ47DmAe9wOudGEa25aq70n3DdgtrGSCCCpz5Je11
X-Received: by 2002:a0c:89f8:: with SMTP id 53-v6mr4746637qvs.233.1533891870134;
        Fri, 10 Aug 2018 02:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533891870; cv=none;
        d=google.com; s=arc-20160816;
        b=fz6YP+gHXZlq+GhAnbfIJbNcSsHljzs1DoKOn8XGT+/gyD4kdeyInmalYXyBcAILNk
         oLRKIy6gW0CwIEhRP+GoTspZrjoVpRi5EseGS5cExPoMeMbruQMpXs19kZD0Ci0l0cjg
         /5Vha7fqyyvItJ6gX5Kuw1gdFhRptRaE4rGVOKGpMDcokeHhgSqVs7bfp7YFIpIh/vwP
         hkg5s6JmPCeAXZAcoUnKsLzlb3pO8rL/hGyZZkHpRHJs+paSh6qd/L2//h3C8VCL37W3
         Z9LpjX75VTIXFmSBMwg6Kq42uxXii2As/oyg9V1HfDnieWOcxNNXumNkBxnnyqOh3lPV
         tQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=4TYuA8LP4A6yRqnjHPm+sE7flR38V3rrxjo3kbwOQEE=;
        b=v2dwIKwZu7+ahdurs5rjO75HuXXj/AZkWiexlOReRT9TkWEN9JA7YYfu0ocElzzcut
         GybnU6hTHWmxLxr/Q1sKKcibAkUFsqGonqJr/IpfeenDLL59q5YmpoMe6UgLlGw5HsuJ
         D2CdEQaYoEb8FzaY9v/S8yZDx4obhR/A0UAVODpjg4XEpqIEuon91WorIPldV2Zlntus
         SA1w2BifdkRkF7tBo3qcmuI+CnVBgWIjWnXcaYuvXQzthNxZAxYBgyZZjkZwop6ilHuo
         hPUWCAvxDwxUybeTVAY+R6L5WkgrKOF889M7QHcV/xB3OtxeQMiEw8oyriO/E2VMLxpa
         3PVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C56gMx4r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n19-v6si3768523qtp.63.2018.08.10.02.04.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Aug 2018 02:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C56gMx4r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fo3LR-0000wN-GY
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 05:04:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fo3LD-0000vI-Nh
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 05:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fo3LC-0008KH-6k
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 05:04:15 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:39435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fo3LC-0008Jp-1q
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 05:04:14 -0400
Received: by mail-oi0-x243.google.com with SMTP id d189-v6so14649264oib.6
	for <qemu-arm@nongnu.org>; Fri, 10 Aug 2018 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4TYuA8LP4A6yRqnjHPm+sE7flR38V3rrxjo3kbwOQEE=;
	b=C56gMx4rwhX1BCMwLDF5Wo00RiKkkcGK6KSQShntjrHTzRnZecwWSD0bSZAZEXwdu5
	JGGbtl4ptgcfUjnV0dSW892dkqaYMAcl0vvw2v4TlJSVG54tiXHNzI29SdrpcTqJ0gnx
	rigD3Q4uT3jDtr4XPqpdOxp3QxV5kse/KDEtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4TYuA8LP4A6yRqnjHPm+sE7flR38V3rrxjo3kbwOQEE=;
	b=eocRsysWXTLRsdwvex5bqgQDQVO91btMD/gfoJ+uSxQkiXf9sAEftiCDwFC85Ym+/d
	BP03bHIjGVbQzZG4AiqsZmPV6BuXELeS7DMFdgCoaVqb4ZW0gQx4OOifX6DURIm0hH6e
	UNts8MD5Dei+j69NkwZNqirzxUFWY71X+ranUK4jr/dtAzpmGUgTPgexJOURuZjEoQLj
	d3ed8GTZO4NFOY+wEy0fHHnsEaacQdsuIn2iU/sahyPMliqOGpzAnSDjH8W683C0PRWx
	r+bAyau85LHqGG6BJ77ZKDwxQqwXFPFb8rcsLSJvheVZNgKXJLJqD9S9GU2BKmogE+Sz
	rLYQ==
X-Gm-Message-State: AOUpUlEUXElNL2EuD5VApb4LywYNcfEbzEfhlTXD7xraEKGQ/4yP6OtP
	wp6Jr161z7itsZz+oHXFvcsda3sUMvMuD60RslLVeA==
X-Received: by 2002:aca:5f0a:: with SMTP id
	t10-v6mr5412653oib.337.1533891853393; 
	Fri, 10 Aug 2018 02:04:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 10 Aug 2018 02:03:52
	-0700 (PDT)
In-Reply-To: <fd82c9db-1ecd-a833-8eab-0060647c2220@amsat.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-11-peter.maydell@linaro.org>
	<b16ded66-e814-43f4-389f-65e697660740@amsat.org>
	<fd82c9db-1ecd-a833-8eab-0060647c2220@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Aug 2018 10:03:52 +0100
Message-ID: <CAFEAcA_tVngNnDEgbeg4wobzJLsHHMKyv8=yDRb_TQSBUOg9_A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH 10/16] hw/dma/pl080: Allow use as
 embedded-struct device
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
X-TUID: JMGcJaNK+++I

On 10 August 2018 at 06:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> On 08/10/2018 02:18 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>>> Create a new include file for the pl081's device struct,
>>> type macros, etc, so that it can be instantiated using
>>> the "embedded struct" coding style.
> [...]
>>> +#ifndef HW_DMA_PL080_H
>>> +#define HW_DMA_PL080_H
>>> +
>>> +#include "hw/sysbus.h"
>>> +
>>> +#define PL080_MAX_CHANNELS 8
>>> +
>>> +typedef struct {
>>> +    uint32_t src;
>>> +    uint32_t dest;
>>> +    uint32_t lli;
>>> +    uint32_t ctrl;
>>> +    uint32_t conf;
>>> +} pl080_channel;
>>> +
>>> +#define TYPE_PL080 "pl080"
>>> +#define TYPE_PL081 "pl081"
>>> +#define PL080(obj) OBJECT_CHECK(PL080State, (obj), TYPE_PL080)
>>
>> The PL080() macro can stay in the source.
>
> Oh this respect the "coding style" indeed.

Yes.

> Can you add the PL081() companion? Thanks.

No, because the PL081 has no separate data structure
and there is no PL081State* for a PL081() macro to
be casting to.

thanks
-- PMM
