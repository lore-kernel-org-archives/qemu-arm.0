Received: by 10.223.172.38 with SMTP id v35csp1629152wrc;
        Tue, 5 Sep 2017 09:39:49 -0700 (PDT)
X-Received: by 10.200.47.24 with SMTP id j24mr6488612qta.147.1504629589089;
        Tue, 05 Sep 2017 09:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504629589; cv=none;
        d=google.com; s=arc-20160816;
        b=fQS0Qv3E6WuxNS4Tz2Ah1WagbISltcM/AUusdnqvX3NeOt+PmnWx3vV74913/b70iF
         roNw64Ih7N21neaos804oUBpgCxs548PfVIlpr1pPK6m/1TggqpPbOsz9lWlD1TkHW1A
         ogZtOF/KytaRs3KFG25oIq1ss9HGr+EdJQYfGCdK8A/CufncOn/8PNjYJC4TTur9lE7G
         B9b0Bcgpz+0iN5ZQk+bq/qkrr0tD9we7x/4hwM5Wdj8Z62acR/Hb6SdQT4TyeOCraulE
         gEMaqFHbeZe58lf9TM97tbz112zVhoJ8cv1pZoWNTJXoSJHj0VGWPN/Fs1gZZ1LrTiz3
         vvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VrKKF5LCQl7WG7C5VLE1SCFRonAgt3w6EiMicy1jcHE=;
        b=EseoPOEXTzIgG7Y4LyWmdExTe7aA3gcjB0oyiwii3LFbHQw0NYoQdly2SDD8Xh0OX5
         foHDZg4hjxvTN6Exw0DvlFHO+68HTgjTGW++OXCpdlxGM9YDDoXftLovwGO25xTeShTf
         0j69qH026bBXyPSv0yvgg2S2VRgPLTcIDC1dr6bThWiNXdtreqhcHSJuY3YkHkxE+MAU
         jRyWw0tOTcPImrGyHsFxEcSBMNpaVVAAnwebTuPxfXnkVhB084D0CCv6kZnrl01UTmQH
         yOrm+SZEslNDyUQI2Jktvyc977VRVnVm7RezuKFHbvLV+DsAmIo1T0gxNBIkTzxVWDOk
         yurg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S5h8YFcX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17si626002qtf.108.2017.09.05.09.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 09:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S5h8YFcX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpGt8-0000Bv-S6
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 12:39:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpGsx-0000AZ-Jo
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpGss-0007dB-RE
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:39:35 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:35366)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpGss-0007ci-Kl
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:39:30 -0400
Received: by mail-wr0-x230.google.com with SMTP id y15so9880772wrc.2
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VrKKF5LCQl7WG7C5VLE1SCFRonAgt3w6EiMicy1jcHE=;
	b=S5h8YFcXL3hkVNNXxOzb62fBSMhLUZglUQFdbjFVoGM7SzAkr2uMkzA4JzYUcJDRin
	JoXfSs85dfcHtB3K1jv3aKxOc0CL0ZvXcjIyqeimp5meL7+2vFpzbXhbu+1Hig53PolN
	wDR8AUGkSggRMALoC7iHPvmuKqebWilbvPayE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VrKKF5LCQl7WG7C5VLE1SCFRonAgt3w6EiMicy1jcHE=;
	b=gQ9ZyAp4dKmEignIMJOHaIbKeV9eWwFdw9j+gc3sGspk0UV05zny9Zt/G73GMs/eBn
	jPI7EAgVVRGhDXZ4bokIyr6TBbamGfgc5Is6meAT9GqXG+XzIw4pMNCz1L4hSbN3prxm
	Z9ZrDKcsumS5yC36uDNvms/16hbjPyhacN7KhjZcY4Z4djQB72EOJF5xL2g91ttgXkIt
	+oRA9tEPTecB4dpaEjzdH1Oo7TTX/uhsWfLietSEmtOQlktRMmhdvMenVpVP11+H+U74
	8VwXS4npoI0k+FzYBolYWbtSJ5G1IWtIgUlDUWEGTephhvYURNdJ44nzS1wXO1bC93AL
	KlZQ==
X-Gm-Message-State: AHPjjUjIVP9SiNcN60z8laLP12r7zZGxIenpHIRYta049AXg4RR3Tlti
	LKu6DKAjaKPOFlJm1xpk7j9cZcU8WSVY
X-Google-Smtp-Source: ADKCNb7bdliOXfdj4RWhA3r6+OH3wf5fCQHafkV/0DWqjhnsfdPgYNdIcqheA6O+sk8iuVrbHzV4A8B+1UeDuQDJwJo=
X-Received: by 10.223.135.250 with SMTP id c55mr2671964wrc.11.1504629569381;
	Tue, 05 Sep 2017 09:39:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 09:39:08 -0700 (PDT)
In-Reply-To: <93e924b9-e8db-124b-8a17-a16f6abf5e0a@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-17-git-send-email-peter.maydell@linaro.org>
	<93e924b9-e8db-124b-8a17-a16f6abf5e0a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 17:39:08 +0100
Message-ID: <CAFEAcA82DLRjLaO=5TDdo7KXw9vYKnO=suz+9hBFLgEkzefc_g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 16/20] target/arm: Make CCR
 register banked for v8M
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
X-TUID: LZDjULCfTP2G

On 29 August 2017 at 17:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 08/22/2017 08:08 AM, Peter Maydell wrote:
>> +        if (attrs.secure) {
>> +            /* the BFHFNMIGN bit is not banked; keep that in the NS copy */
>> +            int new_bfhnmign = !!(value & R_V7M_CCR_BFHFNMIGN_MASK);
>> +
>> +            cpu->env.v7m.ccr[M_REG_NS] = deposit32(cpu->env.v7m.ccr[M_REG_NS],
>> +                                                    R_V7M_CCR_BFHFNMIGN_SHIFT,
>> +                                                    R_V7M_CCR_BFHFNMIGN_LENGTH,
>> +                                                    new_bfhnmign);
>> +            value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
>> +        }
>
> No need to extract and then redeposit, just use the mask.
>
>     cpu->env.v7m.ccr[M_REG_NS] =
>       (cpu->env.v7m.ccr[M_REG_NS] & ~R_V7M_CCR_BFHFNMIGN_MASK)
>       | (value & R_V7M_CCR_BFHFNMIGN_MASK);

Mmm. This is one of the operations that deposit/extract aren't
too wonderful for. I don't generally like direct messing with
bit operations, I think they're harder to read, but there's not
much in it here so I'll go with your version.

thanks
-- PMM
