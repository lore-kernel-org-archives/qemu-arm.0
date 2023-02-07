Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5029631ejb;
        Mon, 6 Feb 2023 22:54:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/Mb4L7YjnkgAWhPLkWVfrVNxaai+DM6ZWvKvaRFXh1FTVtTD0by0UQ2OQqrkp01vKa+Q/V
X-Received: by 2002:ac8:5bd5:0:b0:3b8:6990:b35b with SMTP id b21-20020ac85bd5000000b003b86990b35bmr3760488qtb.31.1675752894676;
        Mon, 06 Feb 2023 22:54:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675752894; cv=none;
        d=google.com; s=arc-20160816;
        b=SUBK3NpWWi9dC9pdxkcgFUZ08A32hxz7Kn7jENooysaiREWt05MtgK/90snQGtz3Kl
         OOF2q4stm7m6Iz9Of/SXc+1YGE5ahQGCLR6rsZcQXdrYt6pRFkGWk08xUop+Gc3sUHpc
         AkowaszVYk4ygu7Muem+6/DteLj1W8d2pyIV7wPqxNOBpspvzI79r4D7FbbTQZJsXWvl
         8OJjC7F3tx7xMB/UiDcbvv6SCsqste0OygjfQrYTTy93ZLWVFZlGScR4ORfiX6tq6HAd
         F4YpZa5N86494gLCYn2Qbf/c2+RfVVCNva6wItKg9bAU593u/mVtBlQFPbEcr7POP52o
         ND8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QVBDqjAv6bn47iC7IXsc60XP4PkllUXL68MsCZdEd90=;
        b=ZRgBC/c36bPUuuy3YtatFqRIedim1MOyqmWHEN6GnarBRd5WSW5lU3dW3OwS/H/MVJ
         Y0DhqTCG7ZZPEgJd5OdSyUPhlPV2lQmhw9Jxl+Lx8HY3e+Crm0k0SdtKNDqGxQ7HXhev
         ZzPVaoSZbSoT/SMaE9NhvU+8ILeReyWvOg5mysRo14FM6DxDVfE47+jmNxDsRdXCYmHF
         EoDkKNwpKGTGJ9N5G9gXY6z5aqbWnB5/KZPz5FkdbGhUnHbX+vKPnMdLlSbwP/fMvFXn
         6IfmBOhL7ZWcA6/Qxh57JD3UpqGan+LTn+XbJmY2aF23xAD5nFUJV76U0WF9Zkcb6SE2
         9ljw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ndCFp6p5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j63-20020a37b942000000b0070922ae66a8si8962540qkf.309.2023.02.06.22.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 22:54:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ndCFp6p5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPHsQ-0001VI-9q; Tue, 07 Feb 2023 01:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPHrj-0000HC-AB
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 01:54:08 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPHra-0005JC-SH
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 01:54:00 -0500
Received: by mail-wr1-x429.google.com with SMTP id o18so12551065wrj.3
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 22:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QVBDqjAv6bn47iC7IXsc60XP4PkllUXL68MsCZdEd90=;
 b=ndCFp6p5IH6Wjc1ubwtKDLBE4bD/u4wvMdrKWl+cH7w+S6Xw95FBy/qv7mmcBkQAwn
 QmSX8J0r4CNfsEJg8vkXTKfOslMIKjLPAJ6EXpYFoYHC6f4wzNyIH2XbjOItV6fSPVIm
 Gd9zsu6NeFj5KFtAmqsMWm6N9ypeoaF5D9VlCwRMb+cikdkduIgVt/Yhz5hkVFGuvyW5
 jS3GZSU8bR80I8F6k//Vk3tRAsxZhhlSfwx+6guVy20LmehihSSXZLInwsYyM5OuU5i+
 7vGqipHP690ewW9rbqQRVDlh8rJ6w6rXCI2bdfhxfPLEYFt1LVrsTODpMv9xTe6MPjj+
 ns7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QVBDqjAv6bn47iC7IXsc60XP4PkllUXL68MsCZdEd90=;
 b=1yg5vPMhyctQ9tjh30l7QQTVDTeyJGUI4DRK0vYk9q31Tb1Ymjw6KNc1ht2Pxi063b
 Aeu37+Fk29OsGfhCPOTgeTDiSIUUINqLZQIxusDDWTOBj3M7/uuKv1oqvzS6qISbF5bN
 2ay093NtgLziu3BEE9HUZMDPK2tB0VhzUrBbKNOQU152seaFlVpLXG7gN/XgizkvSR1v
 VyLQgvXTp1ua38Z/E0F7eJoD6PiJ2mM5RupAoNOBFnAiAf1D2/XM/w3QjZhFBiZSZ3mr
 IW5tfJGNFuvmYtzZe3yoU3t249jf4vpbC52zM6+xF6+WWZ9YbKXLeMdHde6BHnNpmOaU
 yzdA==
X-Gm-Message-State: AO0yUKV8/hWRqyQhxqnbw7Z/TkdVViFH/SHIq2EF7ofgzqSDOPj3WOHF
 iXToAcCN8YkKYuqgz7Xbun4N9w==
X-Received: by 2002:a5d:6a08:0:b0:2bf:c106:719a with SMTP id
 m8-20020a5d6a08000000b002bfc106719amr1416839wru.65.1675752836874; 
 Mon, 06 Feb 2023 22:53:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o21-20020a5d58d5000000b002c3f0a78e39sm1857061wrf.9.2023.02.06.22.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 22:53:56 -0800 (PST)
Message-ID: <a297fbc8-cc52-1204-0173-54dae2f619ad@linaro.org>
Date: Tue, 7 Feb 2023 07:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] MAINTAINERS: Add myself to maintainers and remove
 Havard
Content-Language: en-US
To: Havard Skinnemoen <hskinnemoen@google.com>, Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com,
 titusr@google.com
References: <20230206233428.2772669-1-wuhaotsh@google.com>
 <20230206233428.2772669-2-wuhaotsh@google.com>
 <CAFQmdRbnFFOJbJSLS8c2Nv8JMAdS=xnMrHYO2K6cs2iSZyMmBQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFQmdRbnFFOJbJSLS8c2Nv8JMAdS=xnMrHYO2K6cs2iSZyMmBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2rVOqdkAA8bC

On 7/2/23 00:46, Havard Skinnemoen wrote:
> On Mon, Feb 6, 2023 at 3:34 PM Hao Wu <wuhaotsh@google.com> wrote:
>>
>> Havard is no longer working on the Nuvoton systems for a while
>> and won't be able to do any work on it in the future. So I'll
>> take over maintaining the Nuvoton system from him.
>>
>> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> 
> Acked-by: Havard Skinnemoen <hskinnemoen@google.com>
> 
> Just to confirm that I'm no longer on the team that does all the
> exciting qemu work, but I love to see all the great work that the team
> is doing.

Big thank you for your contributions and reviews!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>> ---
>>   MAINTAINERS | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fa10ecaeb9..347936e41c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -799,8 +799,8 @@ F: include/hw/net/mv88w8618_eth.h
>>   F: docs/system/arm/musicpal.rst
>>
>>   Nuvoton NPCM7xx
>> -M: Havard Skinnemoen <hskinnemoen@google.com>
>>   M: Tyrone Ting <kfting@nuvoton.com>
>> +M: Hao Wu <wuhaotsh@google.com>
>>   L: qemu-arm@nongnu.org
>>   S: Supported
>>   F: hw/*/npcm7xx*
>> --
>> 2.39.1.519.gcb327c4b5f-goog
>>
> 

