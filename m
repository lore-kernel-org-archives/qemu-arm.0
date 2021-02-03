Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp397908lfo;
        Wed, 3 Feb 2021 09:08:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIqx1fD4FUKQ87FF2+73HOo7L+AuQifAR6kHylEKCcj+pvyfE6mdD/Uni8+QqjpVtO7KGB
X-Received: by 2002:a25:6cd6:: with SMTP id h205mr5474564ybc.166.1612372080109;
        Wed, 03 Feb 2021 09:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612372080; cv=none;
        d=google.com; s=arc-20160816;
        b=TyFMWTfUhr2W0TtkuzTYLiSHkepE3h0RZ8qo33ebS92J3jOvTJonbDjIMZi5RCHA+g
         oN9aqVWfOi17jbwFCmcZQOB4JFiJgu2PkqclGzo+46TEBQR6hL6w896qEyTKnzeSiSdN
         FkB8CFuYjOaSn6qKYcVpQe+4strmypFMqVG28XAN+rSztn7GqelFqlkX3iAgEYW0NJ0t
         zabsaXLYMvlnrmN1e7FixOscwKJtJFAR9AlYTPrK06ZVtCuUkf+H2ZIDTSZKpcHd65UO
         /kOA5YZHsMUAsgnfE9LwOir8ic6dE5OFM4h8U6rS72QqRfF/rJ7rW35oTAf0lt8iXPpW
         rH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence
         :in-reply-to:mime-version:user-agent:date:message-id:references:to
         :subject:dkim-signature:content-transfer-encoding:content-language;
        bh=Tgp109RPNQ/niMcjrqFbg9dpXfn1lp/frfRTCTIH4+U=;
        b=SARvPBwn4WDyUJ0V4Ht9W+DDnKWLfnhilZZo4ZZv53YwMKaP/PW4KYtfYXkFBOOJe/
         2Uj+t6bG92QA7zZYgQVFdYjMUbUcf2wdZkANVFuuHnCPAKRMDxQ4DxIb1NmXZOx8oLPf
         3SWYhSSnZppboYxraDlnoTsijk3a6UnzVSBfiIRkk7qgcYBITVmDlPDVQlXUJv7yjUl4
         3vw+xYvclGUzls0ADmnNtJUNJFaT4IL311suJTL46szg3PhAUfIefkYbJaswEuWxqRjj
         hnO2gMKWBq+ZaLTh5vMzw/5FOwj/FoXF/AJ00MFv2t7E+vFNKl988AzNcjQ9AMgza6fd
         ojsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=GvNjGWeM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f203si2892013ybg.92.2021.02.03.09.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 09:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gtri.gatech.edu header.s=unifiededge header.b=GvNjGWeM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7LdH-0004p9-E3
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 12:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7LUA-0007hn-CA; Wed, 03 Feb 2021 11:58:34 -0500
Received: from unifiededge.gtri.gatech.edu ([130.207.205.170]:45521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Nawrocki@gtri.gatech.edu>)
 id 1l7LU8-0008Cc-QY; Wed, 03 Feb 2021 11:58:34 -0500
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; d=gtri.gatech.edu; s=unifiededge;
 c=simple/simple; t=1612371510; h=from:subject:to:date:message-id;
 bh=HmErLV9RyMnvygHr0496qByGG110ay1smQCzlrVpi74=;
 b=GvNjGWeM1emiEjJlnxew+2dkLadO519Pvks/tVZOu54KxyX2B7IjZPlHV28Ijs5IuDS/y6zDQpk
 /x2EAQeIYz6KRJkwiFrhaMl6e+3xwW9hVf8vb/W3VJYdmKWpvmo5irhveymwCfqi7I04023B8Wm/Z
 xq2PazYDIY5cbtlLJ3UygpXhzzIr4qySim+Ilpcb2y8RhMu9Z7G2vA7QWOk3LqDA6pB08wxmMM79L
 Ef2jUFHLQDKSecMqeNjGtBDAhDrJr5c7gXRSy9cKvyKJBSUCMogXVrnl1gnUfqIwFO/45GSF5za3B
 Qudqwq5vODjHlgoaE++QhVRJlJ5xBJoL+NlQ==
Received: from tybee.core.gtri.org (10.41.1.49) by exedge06.gtri.dmz
 (10.41.104.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.721.2; Wed, 3 Feb 2021
 11:58:30 -0500
Received: from [10.43.17.128] (10.41.0.30) by tybee.core.gtri.org (10.41.1.49)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Wed, 3 Feb
 2021 11:58:30 -0500
Subject: Re: [PATCH 1/1] target/arm: Add raw_writefn to SCR_EL3 register
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210128143102.7834-1-michael.nawrocki@gtri.gatech.edu>
 <20210128143102.7834-2-michael.nawrocki@gtri.gatech.edu>
 <CAFEAcA9Wi+jSPEZa2Thft1Q899VW0YyHB8Cb+U86m+WbB-Ns=w@mail.gmail.com>
 <15dbbf3e-3386-583a-4813-4d1a93123d2a@gtri.gatech.edu>
 <CAFEAcA_y2G62w13aK+8tKBGPYUyt8rUFKeXV8reovSaG6JV1TQ@mail.gmail.com>
Message-ID: <ab3e5971-9abb-5b1a-f540-48fd3c6398b7@gtri.gatech.edu>
Date: Wed, 3 Feb 2021 11:58:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_y2G62w13aK+8tKBGPYUyt8rUFKeXV8reovSaG6JV1TQ@mail.gmail.com>
X-ClientProxiedBy: parris.core.gtri.org (10.41.31.72) To tybee.core.gtri.org
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Michael Nawrocki <michael.nawrocki@gtri.gatech.edu>
From: michael.nawrocki--- via <qemu-devel@nongnu.org>
X-TUID: 0bLBlrgklp3P

On 2/3/21 10:04 AM, Peter Maydell wrote:
> On Wed, 3 Feb 2021 at 14:50, Michael Nawrocki
> <michael.nawrocki@gtri.gatech.edu> wrote:
>>
>> On 2/2/21 6:29 AM, Peter Maydell wrote:
>> I see what you mean. Does QEMU support AArch64-only CPU models, and if
>> so, is there a way to determine if the CPU has AArch32?
> 
> We don't have any currently, but in theory the support is there
> and we'll likely end up adding some in future.
> 
> More specifically, in this case what you want to know is "can
> the guest ever see the AArch32 view of SCR_EL3", which is
> "is there support for AArch32 at EL1 or above"?", which you can
> check for in the EL1 field of ID_AA64PFR0.
> 
> So you need a function similar to the existing isar_feature_aa64_aa32(),
> but which cecks the EL1 field instead of the EL0 field (you could
> call it isar_feature_aa64_aa32_el1()). Then you can test it with
>   cpu_isar_feature(aa64_aa32_el1, cpu).
> 
> NB that you must only call it when you know that the CPU has
> AArch64, ie when arm_feature(env, ARM_FEATURE_AARCH64) is true.
> 
> thanks
> -- PMM
> 

Thanks, that's very helpful. I submitted a patch v2 that I believe 
encapsulates this discussion.

Thanks,
Mike
