Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp649009ejc;
        Thu, 19 Jan 2023 14:04:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuOZrtnXFkfSeJxKgVr9ykcT0wpNuB9AtyVyoSzgDtWI9JdxzNIGVrFNVsLg7C3XrA1JWjW
X-Received: by 2002:a05:690c:78f:b0:4fa:e002:d6f9 with SMTP id bw15-20020a05690c078f00b004fae002d6f9mr2954844ywb.46.1674165872323;
        Thu, 19 Jan 2023 14:04:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674165872; cv=none;
        d=google.com; s=arc-20160816;
        b=AIxUy0lGC/0KY4d4gxO4Du0/rKZVQWkfNtzikPR79BKsJXmTvvYebttpiX+Gz6XCYk
         HevG3bbnihSXlzltJ3kAARXkxmF0yQeA8pZxh9gEhcNc5WIbTTUNa/CqKWemc8NM41Pd
         uAUn5Hr8RXYEjP1FcDB4QXw7dh4VmYAFyEiCkG7B5FiRZ+aaDPRu1nnXUVGS/CTpsmd+
         odaD8FNCqrmJBrUQiIJB2l3+ZKbb7CtOvqzNrUydxPgI1r3p2qKV0AO4vy0NJxP5KTXD
         62tQ/EPJqXbPz8m+9iXS2Opw4vH9c2ybwEYSPh2sKkUIDWb6V4kAvJ0TtLYFnzWpN7BF
         nNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature:dkim-filter;
        bh=IrlmIyq6dXkAWOFnaVlWqG8mJktcmtMCI/lEVURgqO0=;
        b=k0DyfPd5ZaICsA7B9DZ/5lFYSdYrJGMN1bWh79oxn9JwebUliNbYt7VRyH/DM2BMcW
         PDZz5lLJlTuHJK+gKtxk3l8MC+AmIPc9vjLXh+XdsOqoHTrz82ss2wIGONXUScG7Zel7
         oSsJ4/YFbprDHqtChRVHYwnRlFWVsBayMFlExwHnLmK9bKgMA5mL0dz6bbdYyd7usyda
         ca9amJZFY2js0wCP1+zXPA+SKFTWpNPQg06a2CVmRME+B2fxYT5PfWjt8/QgW7JxwvZN
         SJBbfFtk22QH3alFR1kE4gKDsjOLD7V9ICSDUGi7l86/B81oG1gvewYHyH/NEqMOlcuq
         TQbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=AMStUl97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a05620a448100b006fa9e8a1696si27279296qkp.588.2023.01.19.14.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 14:04:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=AMStUl97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pId13-0002Zl-EY; Thu, 19 Jan 2023 17:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pId0t-0002UN-3F; Thu, 19 Jan 2023 17:04:04 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pId0j-0006h8-Uu; Thu, 19 Jan 2023 17:04:02 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1DEEF20E09FD;
 Thu, 19 Jan 2023 14:03:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1DEEF20E09FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674165823;
 bh=IrlmIyq6dXkAWOFnaVlWqG8mJktcmtMCI/lEVURgqO0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AMStUl97NRTwGsJPeshrT44Fp9pR+G8P4IzD8VVl4p2e01sbmo84pQ4FRVs/9pN5t
 yuUDIq+xcZE2hvibfuRAErzjirfto8q9hKdD+ku4/iTi4joAdMPGaJtfh43tuFZD12
 3M/wdz9D9/rehLq9zb5A55ify3vcVtVWrT9jQRFI=
Message-ID: <640fb5b5-6524-9cce-22c6-fe94df80e91d@linux.microsoft.com>
Date: Thu, 19 Jan 2023 23:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] target/arm: implement DBGCLAIM registers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
 <20230117150405.2940-2-eiakovlev@linux.microsoft.com>
 <16c2871a-9e2a-5113-a121-5373d6e4bb71@linaro.org>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <16c2871a-9e2a-5113-a121-5373d6e4bb71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 8YkYPrgsVbGb


On 1/17/2023 16:48, Richard Henderson wrote:
> On 1/17/23 05:04, Evgeny Iakovlev wrote:
>> +    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
>> +      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
>> +      .access = PL1_RW, .accessfn = access_tda,
>> +      .writefn = dbgclaimclr_write, .raw_writefn = 
>> dbgclaimclr_raw_write,
>> +      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
>
> You didn't need a new function, just .raw_writefn = raw_write
> (which then uses .fieldoffset to dtrt).


Ah, i see, okay.


>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
