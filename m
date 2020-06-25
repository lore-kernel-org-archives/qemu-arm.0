Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1494173lfm;
        Thu, 25 Jun 2020 10:07:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3ZTtEi7wBEpGOLOWfW1H17fDiG127BoVHiukwnXwxdKNQHNOvUoc1aeQWC8apWD00AYo5
X-Received: by 2002:a25:b90e:: with SMTP id x14mr56053790ybj.8.1593104840247;
        Thu, 25 Jun 2020 10:07:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593104840; cv=none;
        d=google.com; s=arc-20160816;
        b=IJv3N6d5Efat/v9U7aMwkfDBtFFjA4Y99DEjhaZ1H7XhZAm/qvpf/NUwscc/3CmxnE
         1qi52/djEH/vhl+gw5eUW8eP4DRoykAlNVxD6TOv4tGE7iS1PWVBZdRT9fsWTv3WVjp9
         CgPqAIIfekPPVnnQG55QOfYtOUpL9e7xY7FAljWN3Sw/9kVIoS6cho1w/18bK4Wqtiu3
         wPEDLcXHYIJE3gLsZhk6cXRX4TjzjDM2u1jUsvdKNkZ3sE/zpQisyJ1yv8wdDHepVU7f
         RyL4ajD+fSx6vsv1bkCUYGt0lFsvFVZjtN+9k874xd6ns1T2WSdJnWHeOCplF/UPTJGh
         VzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3K3jGMzF0K32dMSMc4Kpk989o87ObLTOHIDmhk3ktSk=;
        b=LoHecfghxjuu2TtU3dETjqUAx50+SHpcTJJnvSjKscfiMMzdVeeFQQcNeVjCGdhJga
         MVM8oYLCLAwX3UMWUe5g/TTfaRyyf8bjuoblXff9a8Rkq8nkE+IaBITawtsZP7ObrybM
         YZyTgILIr4BLZyu5d36dSoV0iFyYA+hyeb01C8qWtaUkppMJalNDI0HqLZMP/eOqbkBT
         Yf/P6Q3AS5BXbl3JeBE+P9BbkfjucIh5+WytP0sozx/ocEjB+RZZK0kejIizDOOlw9xa
         PiksauK/9dUr3yfOsx/1WU2Ob9k880e7M16dnzmz/pK92DW9oZea1MsYnx2A2SXGCr8Z
         yFUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="JImYE0b/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si22122837ybg.371.2020.06.25.10.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 10:07:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="JImYE0b/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joVLL-0002Jb-KJ
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 13:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1joVH1-0004wa-4O
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 13:02:51 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1joVGz-0000SO-52
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 13:02:50 -0400
Received: by mail-pj1-x1042.google.com with SMTP id i4so3529066pjd.0
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3K3jGMzF0K32dMSMc4Kpk989o87ObLTOHIDmhk3ktSk=;
 b=JImYE0b/jn5XFAyjwvR4Ws6RS+GDA523ktI60arGEj686eYIraA87ZJFirVbfzlzqX
 EDl7LQSq2axZfkeGsu9X2a6gxUBkrvNmK5Ix77c9MUwux8e8Q+WV5lish1kHUbTGOULz
 SWijR4dYidl/Th9p9k4hfik1F4QwaRhwKePwHGjWxcmOft+EJuuoNqILvQL+XyeA0b1O
 jcZVeE/HOAFhWO4SoSi/5g3uIVKq8iCsAeDBlsgrHdDLsphI8ZT4tvQkNnEr3OFVbcaD
 200uoXxGwZIf7qYOa4qqmBX7qg/eOifm27xwGy46ngxswuKIOtm2gTGXZ3K1JwK43kwR
 kdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3K3jGMzF0K32dMSMc4Kpk989o87ObLTOHIDmhk3ktSk=;
 b=esZD/DA4IXOoNp3gnVchx7yIdkNFp/RLYisgkeYWFd7+QMV9B06YCl9abeE2sj+Ddq
 9WT/ZRTxL+s912J/8fJdkEDJ/5al6m9PPEec1mhfwYRG6MIufgGP+gZ8fVH6pd9q+HwY
 dlCwNNKrvziOna3x8LlTn29PQ1xlFefNhbsmdrh0g00Pw+6D/u+Db72/af+x3CuoKIEn
 IbngsV/nS2ronNqVQEcbUEnESrkUljkgt4dheWwHiYjT6ummstflKNc+npN4CnOkj6J9
 K0hVwZ9cKleI3pUlkolrRAQXIEX4aREy2GuDJmBvmEvbO1E1K8oazgAQpC1BObGhL0xH
 eUQg==
X-Gm-Message-State: AOAM532yiFsEqWPrtHVxeNIabeCQu8seZbnge159zF0xpwHEaJ4vIlSe
 RzcDksH5PPLZJscE29BoSthN3w==
X-Received: by 2002:a17:902:9346:: with SMTP id
 g6mr33016935plp.19.1593104567550; 
 Thu, 25 Jun 2020 10:02:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b13sm2131641pjl.7.2020.06.25.10.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 10:02:46 -0700 (PDT)
Subject: Re: [PATCH v8 44/45] target/arm: Add allocation tag storage for
 system mode
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-45-richard.henderson@linaro.org>
 <CAFEAcA_svDHEDP5g3aaEL6_b-8hy0AB8oRBWj=y6G1K_r6E9nQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f15d6bf6-03ef-70fe-2f40-0665d49b0851@linaro.org>
Date: Thu, 25 Jun 2020 10:02:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_svDHEDP5g3aaEL6_b-8hy0AB8oRBWj=y6G1K_r6E9nQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: david.spickett@linaro.org, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VGe4lYN2e2X6

On 6/25/20 6:03 AM, Peter Maydell wrote:
> On Tue, 23 Jun 2020 at 20:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Look up the physical address for the given virtual address,
>> convert that to a tag physical address, and finally return
>> the host address that backs it.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/mte_helper.c | 126 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 126 insertions(+)
>>
> 
>> +    /* If not normal memory, there is no tag storage: access unchecked. */
>> +    if (unlikely(flags & TLB_MMIO)) {
> 
> Comment says we're checking a memory attribute, but the code
> is checking for TLB_MMIO, which isn't the same thing.

Comment is not trying to allude to Normal vs Device, but "ram" vs "mmio" in the
qemu sense.


r~
