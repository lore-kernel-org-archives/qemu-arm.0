Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2217000ejc;
        Tue, 14 Nov 2023 09:56:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGS3unPGdXp26WI9V9HcSD3W2+kKUVB2GfT3jNfZh2o+MWJvZS27ARRryDPJWPO64us0wkf
X-Received: by 2002:ad4:4089:0:b0:675:b904:9bc1 with SMTP id l9-20020ad44089000000b00675b9049bc1mr3099281qvp.49.1699984613829;
        Tue, 14 Nov 2023 09:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699984613; cv=none;
        d=google.com; s=arc-20160816;
        b=sbA2O3TE58GkcJxxIt9EZscY70Wp+W+i2+50De38XTVBBiXpff8z1Nak9djDOFOpBA
         9TgqjV+BOKy4Yl87Za1BvIjHQRcTmb9KtW/ujUfmqdsS7BPBSyS4H/Hzk2C0R1KrjVLk
         xXf+3UoGCroVI5sgHiE6VrurtYXGWQDNBd2xwBn/dJVOvXciYciGl7cV1d1Z6SAkGThO
         WTK6dgL+qVNE9QTL4QiivlBqb6zn50Buk2XA5EI7rvp7lJEIiokHr58VtHY3qocfTq7y
         VmCDVdCxQwIOtu45P/h+KMJNvnrgMeanuCPqT1mvde2RthNSYTCTLjvkutkSKzbAz5k/
         bShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=lWFmJaXdNb1cvdOqSWYWj5lK+WjOKKjQscIAYFDHkGk=;
        fh=PpZ1CCXoZMh/DRvZh+FxXhmYvb7cgaexUeWdx5nsuRU=;
        b=PzIBcjrpvKBZRxl/hGeHgxsy+z3lQgK6KYp8ErkB4TCplHhL2FKkMr4NwItGqx80Xv
         T/R929oAPhMjFnNkcccEkxQBU6PwNGjIx85YL/tq25EB9UzKtzmvMOtuMyymRsdaodFI
         p77N5CXt2yhMsnaCyfF/UDWwymJT/UiSuidLh7yh/om2fnYaAqkPuZ3OLvoK4+/wNUbH
         U2S3KCPtVIa18PQLSV6J1Uc3VQFRPl2c0CrmWOnRsIa+M0XmomLArRZuFMw5EEUY0VOj
         f9kqmhU4hmaijT+6t/Gd5c/hJSxrt5DrejGnG/+/btZ4bGhwKwmZDx4xXiVlL4Gt6ObQ
         Yn+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codethink.co.uk header.s=imap4-20230908 header.b=s7BLtcsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=REJECT sp=NONE dis=QUARANTINE) header.from=codethink.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pm13-20020ad446cd000000b006716c269316si7402035qvb.467.2023.11.14.09.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 09:56:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codethink.co.uk header.s=imap4-20230908 header.b=s7BLtcsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=REJECT sp=NONE dis=QUARANTINE) header.from=codethink.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2xeS-0003Yc-PC; Tue, 14 Nov 2023 12:56:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1r2xeQ-0003Uh-80; Tue, 14 Nov 2023 12:56:39 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1r2xeO-0008CI-1b; Tue, 14 Nov 2023 12:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lWFmJaXdNb1cvdOqSWYWj5lK+WjOKKjQscIAYFDHkGk=; b=s7BLtcsUn11XePqDDdrVw1L0j8
 ZQTFqOTdTxcm1EKu63Dvm7PK+qviOdU71NVzyRuWHBmJV2LUCiqNUKDuBBuS4uQrUyL2nq/GflXpA
 EvK8i1P6L4sGgYGiLIYqinfHHBrBJad/AZdU6D5ea7vvdq2e2KDgswKw4U14ftjBLtVxG78zUQgkl
 u1LXKwoclK3j0dk6zpVntJ4xpJDY+KfPjq1LCW+UGvDtZ0t1IieoJCq0xLELRbg1eYWQxBVJPtlbw
 gXTb3r1ZyElyXdTPdMVw7mfXxPT9ciqWOsbzS+UFiPiS/q01k4XEwp3p3zXbbFYqPqf053Ca+PfdC
 FXfMM8Bw==;
Received: from [167.98.27.226] (helo=[10.35.4.236])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1r2x8I-001oh5-U3; Tue, 14 Nov 2023 17:23:27 +0000
Message-ID: <78989536-e29c-4ce1-a972-36be6c70349c@codethink.co.uk>
Date: Tue, 14 Nov 2023 17:23:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/arm_gicv3: ICC_PMR_EL1 high bits should be RAZ
Content-Language: en-GB
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231114165404.681826-1-ben.dooks@codethink.co.uk>
 <CAFEAcA-MG+ak8+xVyqgpWqmKAryOXJtOckUmA=GysQwnpuz5SQ@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAFEAcA-MG+ak8+xVyqgpWqmKAryOXJtOckUmA=GysQwnpuz5SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YTbFAtMhfmOZ

On 14/11/2023 17:14, Peter Maydell wrote:
> On Tue, 14 Nov 2023 at 16:54, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> The ICC_PMR_ELx bit msak returned from icc_fullprio_mask
>> should technically also remove any bit above 7 as these
>> are marked reserved (read 0) and should therefore should
>> not be written as anything other than 0.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   hw/intc/arm_gicv3_cpuif.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
>> index d07b13eb27..986044df79 100644
>> --- a/hw/intc/arm_gicv3_cpuif.c
>> +++ b/hw/intc/arm_gicv3_cpuif.c
>> @@ -803,7 +803,7 @@ static uint32_t icc_fullprio_mask(GICv3CPUState *cs)
>>        * with the group priority, whose mask depends on the value of BPR
>>        * for the interrupt group.)
>>        */
>> -    return ~0U << (8 - cs->pribits);
>> +    return (~0U << (8 - cs->pribits)) & 0xff;
>>   }
> 
> The upper bits of ICC_PMR_ELx are defined as RES0, which has a
> complicated technical definition which you can find in the GIC
> architecture specification glossary. It's valid for RES0 bits to
> be implemented as reads-as-written, which is the way our current
> implementation works. Valid guest code should never be writing
> any non-zero value into those bits.

Yeah, got some proprietary test code that is trying write-1 and
then assuming read-0.

> What problem are you running into that you're trying to fix
> with this patch? If our implementation misbehaves as a result
> of letting these high bits through into cs->icc_pmr_el1 that
> would be a good reason for making the change.

See above, local test code issue.

  > If we do want to change this, for consistency we'd want
> to change icv_fullprio_mask() too.

If this isn't useful then I'll keep it as a local patch for now.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

