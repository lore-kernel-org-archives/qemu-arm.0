Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2418237njm;
        Wed, 3 Jul 2024 00:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdqhjC33UFoKRANFyWzJvbtAoHvoffsfUibosgcU8WG4phzjL4nAeUAbqkaW8N9PRMpjS1
X-Received: by 2002:a05:6a20:4388:b0:1bd:2a05:5f24 with SMTP id adf61e73a8af0-1c0bffaa87bmr1529602637.27.1719991421473;
        Wed, 03 Jul 2024 00:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719991421; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNYCwWLxFjno9boaLQZs8bHFmPMhF5vlfnsPOYkTji/9T75DarRPDaNmqxyAKsPZdT
         YLmMeDeZM8O+UUqVveRiAoX1d5l9oO5oAZq57VDYOd2b38pBQexjYNgmvOCBWq3MvttD
         0xREwX2WFE18gS4CGbs9tsO/QC7fxLHnZDqlRFNHtRQfo2xuBaIxQ+xnfm7G8pfucZpk
         I2C6AutlBOAcLlS9Ga3yIEkQ3ZPw3mQ4vHdyECMeC19rC3mY3YLYbl7kmXwkGNwvfCO3
         dNfE2ui3gkFDcgvbrv1VZp+rD8zO0kfX1JtYaxqkXscV0EZZghKYduw/Lth7b16GhoOK
         jGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:user-agent:references
         :in-reply-to:subject:cc:to:from:date:mime-version:dkim-signature;
        bh=PNR21walsmmPlKx+EEnlCN9q2DuGCXQodYRLsZHa6hg=;
        fh=rd9djB/sHdHBXbpG7HqS3Z5XSt5MYkQLbnLvHMfSZcs=;
        b=BXu9yJ4/v2tjyt1+iVNYj+dRBMbJwh5oZsb3f/TFShHlBp5c/OXWavTMOY+EYQDwz1
         diTndkPhLQR0YSMKC7XKGVPvCLiRWo4rnjXekxTXZn0Cf3MFJwe7nj4s6c8ZTThTpLJY
         huiZyQEgWxtCto8XMCWb2fhSZ8BRWJJiTJocegpeISX4IFl1HcBGDUXc/sx/gJ3vy4BS
         P6FVVBXXmTogL025ANht6Gcv4qzomrSEeFc/hlJkmJ2PM9CigzlSJnQrRhQb1VtA5zG3
         FNRq2cfQ/jZo+4E+Scrw+23RQSsgrcskgzSo9YPwmwjytR/Xv+b+9Nvze/eI3wmwAN0p
         4jog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nmY77SKa;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <maz@kernel.org>
Received: from sin.source.kernel.org (sin.source.kernel.org. [2604:1380:40e1:4800::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-72c69d3e540si12400387a12.174.2024.07.03.00.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 00:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of maz@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) client-ip=2604:1380:40e1:4800::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nmY77SKa;
       spf=pass (google.com: domain of maz@kernel.org designates 2604:1380:40e1:4800::1 as permitted sender) smtp.mailfrom=maz@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E24CCE1FB7;
	Wed,  3 Jul 2024 07:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E01C2BD10;
	Wed,  3 Jul 2024 07:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719991419;
	bh=bU/2YsOmK16v0fOdsJ38br5N/4af3GRgBNGqmZiO8vI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nmY77SKan33oVV7BCDgh9UdHHeEJg95y4e4aq46WP/By1OUdh7ymaLPuAOzwyeFcI
	 Azyn1U4InRUI9MjEX5g/LTA0xXPJkqXiVDiOpGz8dHwi/xbKzJnx4gIle3yrlH93Kt
	 jiyWwpSA3KLs0M7+Gwkh7zGQhSD8KRVVp4LMbjhjJF9VgZR5TYA3x+nSZC8Ri41siP
	 Rdp3GQGCbzd1d0/ZM8Hw0WjEIcO60VqN7IJySppYsew1BFzWGKCP67U5plxEY/RfRw
	 ZBpiFTblyfea6k0wvlxGPNNMkOSSCu+rWQXSuwSmJZsDHaB4z+R5rceCeJQO1ZRER5
	 QI+MaDADhNu8A==
Received: from disco-boy.misterjones.org ([217.182.43.188] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sOuL3-009LsO-75;
	Wed, 03 Jul 2024 08:23:37 +0100
MIME-Version: 1.0
Date: Wed, 03 Jul 2024 08:23:37 +0100
From: Marc Zyngier <maz@kernel.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 pbonzini@redhat.com, thuth@redhat.com, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org,
 christoffer.dall@arm.com, Anders Roxell <anders.roxell@linaro.org>, Andrew
 Jones <andrew.jones@linux.dev>, Alexandru Elisei <alexandru.elisei@arm.com>,
 Eric Auger <eric.auger@redhat.com>, "open list:ARM" <kvmarm@lists.linux.dev>
Subject: Re: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU introspection
 test if missing
In-Reply-To: <8c11996c-b36d-e560-cdeb-e543ee478a54@huawei.com>
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
 <20240702163515.1964784-2-alex.bennee@linaro.org>
 <8c11996c-b36d-e560-cdeb-e543ee478a54@huawei.com>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <74e184afbc4b58fba984b91964915a9e@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.182.43.188
X-SA-Exim-Rcpt-To: yuzenghui@huawei.com, alex.bennee@linaro.org, pbonzini@redhat.com, thuth@redhat.com, kvm@vger.kernel.org, qemu-arm@nongnu.org, linux-arm-kernel@lists.infradead.org, christoffer.dall@arm.com, anders.roxell@linaro.org, andrew.jones@linux.dev, alexandru.elisei@arm.com, eric.auger@redhat.com, kvmarm@lists.linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-TUID: /TGOuaac5nxm

On 2024-07-03 08:09, Zenghui Yu wrote:
> On 2024/7/3 0:35, Alex Bennée wrote:
>> The test for number of events is not a substitute for properly
>> checking the feature register. Fix the define and skip if PMUv3 is not
>> available on the system. This includes emulator such as QEMU which
>> don't implement PMU counters as a matter of policy.
>> 
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Anders Roxell <anders.roxell@linaro.org>
>> ---
>>  arm/pmu.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arm/pmu.c b/arm/pmu.c
>> index 9ff7a301..66163a40 100644
>> --- a/arm/pmu.c
>> +++ b/arm/pmu.c
>> @@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool 
>> overflow_at_64bits) {}
>>  #define ID_AA64DFR0_PERFMON_MASK  0xf
>>   #define ID_DFR0_PMU_NOTIMPL	0b0000
>> -#define ID_DFR0_PMU_V3		0b0001
>> +#define ID_DFR0_PMU_V3		0b0011
> 
> Why? This is a macro used for AArch64 and DDI0487J.a (D19.2.59, the
> description of the PMUVer field) says that
> 
> "0b0001	Performance Monitors Extension, PMUv3 implemented."
> 
> while 0b0011 is a reserved value.

I think this is a mix of 32bit and 64bit views (ID_DFR0_EL1.PerfMon
instead of ID_AA64DFR0_EL1.PMUVer), and the whole thing is a mess
(ID_AA64DFR0_PERFMON_MASK is clearly confused...).

I haven't looked at how this patch fits in the rest of the code though.

         M.
-- 
Jazz is not dead. It just smells funny...
