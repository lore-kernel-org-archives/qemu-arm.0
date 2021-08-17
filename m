Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp643594lfg;
        Tue, 17 Aug 2021 08:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/L2A0kDI0dPUXoBOEHHtRkzIWuxYA6osB1euieTGrTa03ZpL60T/qBJSjjygQjxK7ISfR
X-Received: by 2002:a67:1901:: with SMTP id 1mr3780042vsz.22.1629215631014;
        Tue, 17 Aug 2021 08:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629215631; cv=none;
        d=google.com; s=arc-20160816;
        b=HYUY8JwkTNe8yQE3WKWu1LKet4ftp+5RSHloCl32mGo9Gr/f+2fR714Zaliod2Jyj6
         6eUNn9rAgYdyGlUbH04bO9mxhV2Dczuqya6M6pzHlcEvcl7NHHeTYgL6obCliG3oDQOZ
         aFsIFn59WVmkYmQak1Ie69pk9Gkdu/8DWlc9/DgygRRRDKR7mZx+21pJiCNmI0/BPTr0
         CcY3wDfD/o/bXvYi3LVgCVVtL8JYk3IFNQmO9f3/x0Cob3OSnK6lO4ymB4Bkg0onK9ds
         Wq5hncVu0Erhe5eqsZF1fuRaauzHWAK2cHcb6VwNUOyyDmYmHgNLFvEn/CufEGHLE6zJ
         pfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hfUudmOi+wqXyPDOY339e2DVPnIEwu0fpqDRt3BOh7M=;
        b=WLki2nfIsqI6goff11xoPfOaUqz+oIxmBYrkmni3oSx/uVJXwxTXZl55l3RADVYzhl
         s3oW3JdAILsf2PycgOHoq41Y9eTcvv5QTA/03BIyRjsznzrLdXUjzGZrLwq/shL01Vw7
         8iAxCb4rP4/t824gcEUj0nEqY256urpZCTPX+89+WUgzU7lywSUnjytZ9w5OG3tsEAaU
         6dZ250uYZHoFMuiBkH6Sg3+DlZsFXK2/VghoWNRDeEs0SPiqQ2s+S245BqhlHIDL/ihz
         uPPLmvYF22mG2csPIqw9oCXYWfoaAlsr+jEjFsBf75IaZQ7pK6W6xRDS+Eyga0Jt6WiB
         I6Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rrshm1Md;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si1332737uap.106.2021.08.17.08.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 08:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rrshm1Md;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG1PS-0005lu-AM
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 11:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG1PJ-0005iP-Pd
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 11:53:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG1PH-0003BW-4k
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 11:53:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id e15so25302809plh.8
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hfUudmOi+wqXyPDOY339e2DVPnIEwu0fpqDRt3BOh7M=;
 b=rrshm1Md4DRSq2yU5burKAok+v0ieYRO9QapsM3ccCQp7ID8dRFR3AuWS+Lzd47GIP
 mrJ3ht26cW4INWFbNVLpFsoE0akc+jm8Pk7ZlPDRoYBs9AS8iBEc3w+JsgNg3304zRfB
 UYYjGms4D99bdvFKDBQAdEp7whzXAjYrQcaZZ/7xy/YxhlR2ndJXy6RpJ1vfo9/SC2wy
 R3kx4KB4IAOsXeyB/5LVXvyDf2Z7PH5At/4pG1OP37UYt8k99AoTNt9R6J0kN6ujGmB4
 AnouPuLjN0aOzAmIZUTIiDdgOr4FZpsAQ9c+xq7lrcO/ToBp/IGbAekQdZQ2unoHWJIj
 d1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hfUudmOi+wqXyPDOY339e2DVPnIEwu0fpqDRt3BOh7M=;
 b=l3oN2+YpFir6koccoUCLIoD1trAMXXtLKzieIbx59hUQUXuLSpap9vFhNh3ugNeny5
 vyDMO5gjz1J3fsg2XQ1X070dsgS4sMBQwp9FUjNni66gL6WMdlnqrCzLwije37W8CtkS
 tSNAS5Y+aaquTcDGH3IutTLAY5WXXWIFmgR1S1ABj+H1kLhlTdZKDqwKa/3/6YBm4LdZ
 2bO8zS/0O5jrnz7V6WIqA7tqiM1MzcaaYNDdCOfag9rnnU07Y0bAWmI6JgwUg/wTPif+
 1qZZWhoBwWAIlwTqz6jvGR0fQM3sMbttJqlgv0UdmByqC1rSUImTLM+hkwzcsj9Pcz5X
 2RzA==
X-Gm-Message-State: AOAM532x5Sd5MYKRw8oh1IMeBvoVUCF3wBD90n3kVxuXRxHJjZ5LQ4Tu
 dfF9mTXJGSgrfiU1RxUoq+1aCg==
X-Received: by 2002:a63:f754:: with SMTP id f20mr4164125pgk.385.1629215617559; 
 Tue, 17 Aug 2021 08:53:37 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id z131sm3180466pfc.159.2021.08.17.08.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 08:53:37 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
To: Andrew Jones <drjones@redhat.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210817115635.d2wxvnvis5kupegh@gator.home>
 <667f9384-cd28-8e4d-ebd1-4ed4b651676a@linaro.org>
 <20210817153639.o5fxdgmuhjusvyhq@gator.home>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3846b738-719f-a9a1-a59d-d7f54e71009c@linaro.org>
Date: Tue, 17 Aug 2021 05:53:34 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817153639.o5fxdgmuhjusvyhq@gator.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g5pLTCGYkCnm

On 8/17/21 5:36 AM, Andrew Jones wrote:
> On Tue, Aug 17, 2021 at 05:23:17AM -1000, Richard Henderson wrote:
>> On 8/17/21 1:56 AM, Andrew Jones wrote:
>>> I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
>>> which would forbid changing the properties if you wanted to, but then
>>> we need to answer Peter's question in order to see if there's a
>>> precedent for that type of property.
>>
>> I don't see the point in read-only properties.  If the user wants to set
>> non-standard values on the command-line, let them.  What is most important
>> is getting the correct default from '-cpu a64fx'.
>>
> 
> So maybe we should just go ahead and add all sve* properties, but then
> make sure the default vq map is correct.

I think that's the right answer.

Presently we have a kvm_supported variable that's initialized by kvm_arm_sve_get_vls().  I 
think we want to rename that variable and provide a version of that function for tcg. 
Probably we should have done that before, with a trivial function for -cpu max to set all 
bits.

Then eliminate most of the other kvm_enabled() checks in arm_cpu_sve_finalize.  I think 
the only one we keep is the last, where we verify that the final sve_vq_map matches 
kvm_enabled exactly, modulo max_vq.

This should minimize the differences in behaviour between tcg and kvm.

r~
