Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp677011lfq;
        Wed, 13 Jan 2021 10:42:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIKWwBIymtodomyGOf2oFNnc8JnZXmMMBIdxCkF22Q6+6Fd/Gt3HmYXdNfh/4HSbAyozeE
X-Received: by 2002:a25:d788:: with SMTP id o130mr4930381ybg.245.1610563373473;
        Wed, 13 Jan 2021 10:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610563373; cv=none;
        d=google.com; s=arc-20160816;
        b=fIvWudzjxUeIwsCrtSPA4WLl/MhVtIS82oDztcW1jS0t/FfenTmflfplULDBEhkhdD
         Hb8RG1bO/12o7c80ClYyzFWNlTBmqTEJuRk0fckv6zJdwm8c159ufTttkCuSX4s2IUDH
         v3DN9CzCgyllBKdbocBLbWkufmXJhlJMRDBV/mHhlid24RE0+w1ctAAJkRheFF1dUiQR
         niTYeQJkFiAdPaA36W644Rlh9tSG/KaQzR9Gy6BDoUCxINqhIcrLIPiJ2SJaxyF9xiza
         VnmIRqey1eo1kwiV0DZt7jwFGZxELkYGvtkCo63t3HVT1Mv0/kIecEswqzCGppWZyrEi
         XVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gYTnyLNc9BDdch+CYT/M8NXtPx1Qcjw9nfMbl+C0AfM=;
        b=FhmdoF4DuOBguWt6mM3AcvyW5fgHBtsDKGTihwvfc7CKo/iRaOuFrCJdE4bHbnXifL
         0IndDdvGEoZgBxD/rzd2uf1L3MIsnmczG43vpH9q88RulXFlPLyiNBY0cnvCH31NVBmg
         aIrHfB4hfovSrNGVTrLd1Gp6knsq5fOeWzJ5q1aMSeBNn8sNiJXBsZFNzRoUKFrwJziZ
         37oacDvjfTUXa+ANHmOLTqTMQ1DNJfZeqTgPZ3612S/E9UGQcqPjX7TSIE8BUEnkH51C
         43hqJhpVPiW/HokfYKNG8q3sDFg3xSp30oeTeNjk2+q86ZyyN+A6eITEVKh6H9RoOGDI
         5sew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ch4kCmbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si2730045ybp.281.2021.01.13.10.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 10:42:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ch4kCmbW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzl6a-00085O-TX
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 13:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzkz6-00049i-MW
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 13:35:08 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzkz3-0005LQ-6X
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 13:35:08 -0500
Received: by mail-pl1-x635.google.com with SMTP id g3so1569059plp.2
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 10:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gYTnyLNc9BDdch+CYT/M8NXtPx1Qcjw9nfMbl+C0AfM=;
 b=Ch4kCmbWWv4489uaGsdeEhwG8p/5HGqaNIKfbipKDu2xnEBt0EVAp7UcU9GEZf3iyO
 7eQHIfLLtqjRRJy4xacVLV2dbX5DSQ6elH7tPzF01SJdsxC4Tu3/ynpUE6ddDApoR+rD
 rfTjxelItBzJpyTER8X8LjSui8YKL3xVRFNJu9of6AJlYkA8JpT4QmGArpIgAuYtbICn
 25vv0mudvmNz/LSoNMyc5NkTIFeatMRao0cc878X58McX/TMpeyyhtglZDMyl5ZLbE9i
 67SHezA0i59TTDETRa+VKx01m0uRG1Y49d/MvdQlSVcb7WTl1XaeMwDuxX4x1/oq4+u5
 12lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gYTnyLNc9BDdch+CYT/M8NXtPx1Qcjw9nfMbl+C0AfM=;
 b=ImgTTkOq4UgORl5jez9EAWUYnEwKp7drC5Rc/b6aI8Q1W9ZCvPoBAVS4vlGXdCmEs9
 Z7WahRZwb+byWym0L8IVCmCSyFp+s8ZtgxWfcDVSMFDtp95xirLPrGhuaeNIG2THrZ2D
 z1gyPs16Qiyb/12es0MHF8xGnKU52mICeb2U5Z+Ie4+faRtMFhpgq22LIlSsoZl7lXuH
 isa7PoDYrBVgL+HvqdvGyg27bc6jheI6fVd8/3WgZic9m9RzWEpaU0JYv1tp1cQv9aF2
 1nlIoZ8LM1w2ecFqeHU2pXuJOjBFpXugpnzoeXgk5YJsKTlalghX2FbEZgnX45QIaA4v
 5ekw==
X-Gm-Message-State: AOAM533Yz53zPGHpk98Ok2BALZ9ujW5wmSqX97llhDdPdpBcBSuXNENV
 cU/5Ri74KNEsumna6XeLtw8qIw==
X-Received: by 2002:a17:90a:bb8c:: with SMTP id
 v12mr578106pjr.227.1610562902984; 
 Wed, 13 Jan 2021 10:35:02 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a31sm3024994pgb.93.2021.01.13.10.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 10:35:02 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210111150114.1415930-1-f4bug@amsat.org>
 <43f360be-af44-27ce-619b-7a2ad169aa2f@linaro.org>
 <e157e0ab-1d96-040c-5329-8ebb8064c7c2@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ba66bdc-c464-26c5-ef35-fdd6f2b538c9@linaro.org>
Date: Wed, 13 Jan 2021 08:34:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e157e0ab-1d96-040c-5329-8ebb8064c7c2@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gmjKzdzeLVmO

On 1/13/21 5:07 AM, Philippe Mathieu-Daudé wrote:
> On 1/11/21 6:22 PM, Richard Henderson wrote:
>> On 1/11/21 5:01 AM, Philippe Mathieu-Daudé wrote:
>>> Attempt to fix the warning reported by Miroslav using GCC 10:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html
>>>
>>> Philippe Mathieu-Daudé (5):
>>>   tcg/arm: Hoist common argument loads in tcg_out_op()
>>>   tcg/ppc: Hoist common argument loads in tcg_out_op()
>>>   tcg/s390: Hoist common argument loads in tcg_out_op()
>>>   tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements
>>>   tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements
>>
>> I've been trying to figure out a cleaner way to handle these, but this is
>> certainly ok for now, and avoids the Werror.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Will queue to tcg-next.
> 
> Please hold on, Miroslav found a regression in the PPC patch.
> 

I had found the trivial s390 one during regression and fixed it.  But I'll
dequeue for the ppc one and let you re-post.


r~
