Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp288350lfo;
        Wed, 3 Feb 2021 06:51:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0elMUkXIM10xFhGwewQf7nTQdCxpHB0idCtWjwsJ5Nj07guPHfstvREccDKVkjKL9cIEk
X-Received: by 2002:a25:a088:: with SMTP id y8mr5074070ybh.512.1612363911775;
        Wed, 03 Feb 2021 06:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612363911; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6QY9Vg4+xkErH2jLs5kF3+XsxvLz5KAgkWHAJZMdmTTtS69ZP1UpiBG6ySV9Q5jiG
         uzCEeSK+CeCflpr6zJfB0w1aoLH1vq9+Xqq6YNcPySp0tnsC+PiAXxsN+lmQ7jFEUlnU
         na1EnjamqoL9fyub80ttURnDWlR0LcogwdR1g7FSLEv7BbJLEjPvwgvhDbfKGxgXRi+6
         BI5aNDo3iSnpFsh2zB3InEcL8QRvOb+udVQm7xbsW6QeXSDbvq/7lLYMqvBKBdcL8sx0
         9OMBkaPQd7PxAQBA1IIV0HvW9MoeItZMUjkJcgbhQO2tNsoNn14lQbcmrre9RbPoK7MJ
         oniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :in-reply-to:mime-version:user-agent:date:message-id:references:to
         :subject:dkim-signature:content-transfer-encoding:content-language;
        bh=0uE24s382jVgDv7bX606hbe4lXyseVKliElSODL0/B8=;
        b=kJelnsQRXkgk4x8hBLReM4nVTXndK+KN6LBxHUT0Znlak9w7lRq0T/jHlc1lFz4cEZ
         HzUsQ6s3r9ZjCXXTSCi0xVzYAuSoW7mP0qU/FOy9AXdlRB9Fwg2cv/1XB1VTBxWe1Rs9
         t3o/Utouk8G1iEJ2OdCSnlCt3w63ldCkygWAud2dGSlo95CGFdAbLrh2Tbu/8PAQnTwl
         c89R/XGmwj45ykinbgax+daoLNS452JmJnt2vBRBc2pPufAMiPGA0PggwP+OqSQ5h7ft
         hKV0WWty/jECwEQbKEWhF5chqUFl1MwFP2e8Zh8I4/8DHCXM2XBglrje9eLjFCY5/UhZ
         OshQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=vwfCmDdL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si2608635ybp.257.2021.02.03.06.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 06:51:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=vwfCmDdL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:60082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7JVX-0001hI-4U
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 09:51:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7JUM-000079-3q; Wed, 03 Feb 2021 09:50:38 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:47262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7JUI-0003x1-DG; Wed, 03 Feb 2021 09:50:37 -0500
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1612363830; h=from:subject:to:date:message-id;
 bh=rABu3avkqod/lsfnklxUG+JBM4kGsfV8rIjgX4daLNI=;
 b=vwfCmDdLw0yDzEklpDh8AaftWbxIwf+8+QI7VUX5l3P2NhdgSsIVD1CAdwPfaJDhcg9ntM16eJ3
 7+U2AeEI5loy0GI9+tL3zQ199ksncTylgogPLdYfBi5aWlVLLfngqkjI4dh6FjghZmffUHQC8ui00
 4kWM5EKLdidgfvYCLHapJeZrBb7KmkI9XgVvAqWtkyTfzbptFFnLT8prh2qEwrvIBiIxpJ9Fdz4Qg
 lwuFmBrbVkftzs4LP1sJ5dXS/3vuzkl855lYFMIWKypISAzsuoCxXg0dJ/GafRdhx5j7qXId/DOXY
 D2Rj2O+lBAKHxHeK03VHPxt1NXcDlqdn0dag==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge07.gtri.dmz
 (10.41.104.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Wed, 3 Feb 2021
 09:50:30 -0500
Received: from [10.43.17.128] (10.41.0.30) by tybee.core.gtri.org (10.41.1.49)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Wed, 3 Feb
 2021 09:50:29 -0500
Subject: Re: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
 <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
 <CAFEAcA9Wi+jSPEZa2Thft1Q899VW0YyHB8Cb+U86m+WbB-Ns=w@mail.gmail.com>
Message-ID: <15dbbf3e-3386-583a-4813-4d1a93123d2a@gtri.gatech.edu>
Date: Wed, 3 Feb 2021 09:50:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Wi+jSPEZa2Thft1Q899VW0YyHB8Cb+U86m+WbB-Ns=w@mail.gmail.com>
X-ClientProxiedBy: tybee.core.gtri.org (10.41.1.49) To tybee.core.gtri.org
 (10.41.1.49)
Received-SPF: pass client-ip=130.207.205.170;
 envelope-from=Michael.Nawrocki@gtri.gatech.edu;
 helo=unifiededge.gtri.gatech.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-0.178, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Michael Nawrocki <michael.nawrocki@gtri.gatech.edu>
From: michael.nawrocki--- via <qemu-arm@nongnu.org>
X-TUID: ciryxwL1VBqT

On 2/2/21 6:29 AM, Peter Maydell wrote:
> On Thu, 28 Jan 2021 at 14:31, Mike Nawrocki
> <michael.nawrocki@gtri.gatech.edu> wrote:
>>
>> Fixes an issue in migration where the reset value of SCR and the value
>> produced by scr_write via the writefn for SCR_EL3 mismatch.
>>
>> Signed-off-by: Mike Nawrocki <michael.nawrocki@gtri.gatech.edu>
>> ---
>>   target/arm/helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index d2ead3fcbd..e3c4fe76cb 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -5785,7 +5785,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>>       { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
>>         .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
>>         .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.scr_el3),
>> -      .resetvalue = 0, .writefn = scr_write },
>> +      .resetvalue = 0, .writefn = scr_write, .raw_writefn = raw_write },
>>       { .name = "SCR",  .type = ARM_CP_ALIAS | ARM_CP_NEWEL,
>>         .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
>>         .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
>> --
> 
> I think the problem here is not the lack of a raw_writefn,
> but that we're not handling the RES1 bits [5:4] in SCR_EL3 correctly.
> Specifically:
> 
>   * if the CPU is AArch64-only then the resetvalue for SCR_EL3 should
>     not be 0, but 0x30 (but if the CPU has AArch32 at all then it should
>     still be 0)
>   * scr_write() should not be saying "force the FW and AW bits to 1 if
>     written as an AArch64 register". It can, but is not obliged to,
>     do this if the CPU is AArch64-only; it must not if the CPU has
>     AArch32, even if the register is being accessed via its AArch64 form.
> 
> This is because RES1 has some complicated semantics for bits like
> this which are "RES1 only in some architectural contexts" (this is all
> defined in the Glossary entry in the v8A Arm ARM), which basically
> means that if AArch32 is supported then the bit has to be reads-as-written
> from the AArch64 side.
> 
> thanks
> -- PMM
> 

I see what you mean. Does QEMU support AArch64-only CPU models, and if 
so, is there a way to determine if the CPU has AArch32?

Thanks,
Mike
