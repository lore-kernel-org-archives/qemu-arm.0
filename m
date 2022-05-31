Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3501431lfh;
        Tue, 31 May 2022 07:35:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypt9eINcG+R9v0V9MqgXjXmq9j/baM7uG6D2AF9L0njlIfrHDRPRjzjhKC6Qw/dTtLKH0F
X-Received: by 2002:a05:6214:5284:b0:443:dd21:7db3 with SMTP id kj4-20020a056214528400b00443dd217db3mr50668743qvb.27.1654007701303;
        Tue, 31 May 2022 07:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654007701; cv=none;
        d=google.com; s=arc-20160816;
        b=MnJI6KFgIoRAFb5Gb7ll35LcIu0r81+lCkSwvmuTIbQXtPF57b20X0ocxG2tcR254H
         JSuLiEQAay9YXSExgRBEojHVm/WnG8GzLVebCEqm9u0QyYQYmKT4Pv1EnDAWb03baK/D
         5cTpHnPFjbulMIVrT5grsUckn9D5dU4wEFldev7tOsDmLFFeQitD71nCBMJW7ObEPBnZ
         ozvjQPu7YiyExfwbzOFW8uq7llcR75B6iQqc6AylQNCaZh2mqlnzqWGwrbjxQTGIM6vh
         1TK4iljcfGbTQ5hh8VlIndF8jyKAh7TQphv0c/a5UUFOeqB70TvqZl5nTrynfsMk/nrx
         M66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JmkndiAKQRhnkSBP6ytZ3Qi1SfVd1ySDssf2jp1dqqw=;
        b=jEsW3lDIZicDte1puTjL70+xVZU64+zZpUAM5o0p1Qlab7bPI8zHDyawsVDIv2r5jh
         0U9nXSg9sEmpX+bNbSbC924AzH8/5VhNkJDLnRm4f+6TjaLvNhO038BlbU/1e20UptHn
         lnnaL1LY3BYdV3xMDdn9WmOtbJ5mwp5MTlXQxh/dCdFMhXQ4JLAga6UB076k0x53KvC8
         Ae6bnjoOHl39OgC+sJxyyhxh2NKjhNBzRYJ1h9PnAjLnH7ypuOTzjbgR2OxwJwC1r11g
         E09OE6ETfwWn1Tt79KrJnkXdPKYcaxZwByHPPudsOT01x4dVqLOwAxfBC2u1kZgnnrGo
         jRHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z44MYzPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020ac85907000000b00304b5f49461si2769874qty.206.2022.05.31.07.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 07:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z44MYzPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw2xY-0005hj-RM
	for alex.bennee@linaro.org; Tue, 31 May 2022 10:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2xK-0005g2-UP
 for qemu-arm@nongnu.org; Tue, 31 May 2022 10:34:47 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2xJ-0004uF-B1
 for qemu-arm@nongnu.org; Tue, 31 May 2022 10:34:46 -0400
Received: by mail-pg1-x531.google.com with SMTP id f4so13005032pgf.4
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 07:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JmkndiAKQRhnkSBP6ytZ3Qi1SfVd1ySDssf2jp1dqqw=;
 b=Z44MYzPlD+xebnzBb3bgJrZPhyHhZ3+w6IRZ7McqN/+3VP7s7mY2FKYRd52MDPT21G
 znYXF/Vk8EHoyBKOH1V8wxt960htHTK+Yb615wGGgtM2941IkFToofwJhA78oWSyQefw
 Ce2Q0zcH29BUk8BmDmi/CArIoUvU9yIiL4lzyuGx99uCgOMrbs+J/0eJOPfcOSq8c2EY
 mG30IJEbdtyEY7yB/QsOd4PKkBU61ASh6fd4hkqEmk3cxAydAzpOv9qntZZ88uq4TnoK
 hDfotTUTnRXklM2xR7ssalVdurX2/shhxbsQs/9mAzdClXCubLDKRKFPpXssC+mn7O71
 1tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JmkndiAKQRhnkSBP6ytZ3Qi1SfVd1ySDssf2jp1dqqw=;
 b=AelJfdxSwJ0NM1DaJ6Im4owTbCUaMcRm6QmewaX05Cy8wNh1B2RZ6KsY772fxIZmTW
 yDJN5uxFMH7/LHS3/dnJ/DHSPUYNKodaHItoFrV2VunTS2tCbgcwr3MScczx8/68icCn
 z5Yx8NqbIkPtRZgOR2q/3ajDWUcsLrOYBVfmNTVeu1GXSPXsV4Z1HSb64YDJQBMzadK7
 MfCzG7+TzzIYFdE9DyGbGnk/arG0CxQTFSyIOGhsxORGZ5wM9c5oKVJ7wjT0F0ei5bwa
 SR6ufw8wBipthvfcxIA5KOZ4qtLxNjUQDWRDm53+qnfxku5KKJcug23IT7YsvwM9gYnT
 prMQ==
X-Gm-Message-State: AOAM530VvzImv0BTenRHTdAK3Fg70xKyG/WUaatSRpT/1CbzyzrqKu2W
 GUDJ9Y0yGyMs/EpNquLBYkw12Q==
X-Received: by 2002:a63:e516:0:b0:3fa:dc6:7ace with SMTP id
 r22-20020a63e516000000b003fa0dc67acemr41755208pgh.215.1654007684005; 
 Tue, 31 May 2022 07:34:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a170902d4c600b0015e8d4eb259sm6643661plg.163.2022.05.31.07.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 07:34:43 -0700 (PDT)
Message-ID: <0d33860d-2f6b-6b47-45a5-303d4d9d9e62@linaro.org>
Date: Tue, 31 May 2022 07:34:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 17/18] target/arm: Add cur_el parameter to
 arm_generate_debug_exceptions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-18-richard.henderson@linaro.org>
 <CAFEAcA_pFQqZtpqeBLf8htev=sNDEPS1UdJaBonhsPnyO1LVSw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_pFQqZtpqeBLf8htev=sNDEPS1UdJaBonhsPnyO1LVSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pRsbqrTIsPHF

On 5/31/22 05:07, Peter Maydell wrote:
> On Mon, 23 May 2022 at 22:07, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We often have this value already handy in the caller.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> True, but it makes the function clunkier to use. Does it really
> make a noticeable difference to performance ?

Probably not.  I'll drop this one.


r~
