Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FACCCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 16:37:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3zoM-0006IT-UA; Wed, 01 Oct 2025 12:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3zoE-00067p-8s
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:36:07 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v3zo3-0007ID-KK
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:36:04 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-77f605f22easo108414b3a.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759336545; x=1759941345; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yj1etB7dz6B2SrykECpHpVFrBoe/dfGwOm0Zu2It1m8=;
 b=GdRMxeF4DirErAoPG0Unu5ycSq9pHlU/sblSB3JYKZdoVmbSCi+4z0rYtALuciMLhB
 R1ZNLljMU+E/lGF8ZPgn5Enk0Ykng446wqP9dZOzha1Ef9JBqwcrDFiCui87qawLrriN
 jgFR1yTcpFngJFiNFX3nchkCd2pvj3/dnhDhhl8cQYDuoTFV6HFNxAK5jb7TtXimskmG
 odhkcf0vUkHVRcfFXfo27dBR/WarykYHz6u/cXcQ2jnx4Jqm9YDTmnwBrO2K1Q1mDjMN
 1hPsjcYVwx8mYrV2fnWj5c7pHw83VdU6AwlH/L84DfFBHQjXI49ynEm399DwH8u9bnRG
 PMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759336545; x=1759941345;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yj1etB7dz6B2SrykECpHpVFrBoe/dfGwOm0Zu2It1m8=;
 b=acKx9zFYbRVKaWIthSRyT2X6RiuHBgxRNBi2O8lN/pIHPRYCnAvLxtruLYb1bI2Ol5
 ycJIaTJJ/ctWeuMOAcCTBGMjvlms3d2uTmHE68sHRLiQZNCZXkDyWI84v16TnKOJlIMD
 0Oj5WnTaxqvpC+tCDLX31a3N/0B0/ULoXTkFv2/RsWGWgYYbElMpgN/2o9oQfCpilBl1
 H/MSY5cF7gyGD1A1WVfLOe+lpoX11bwvbPqzFeXRmAT0ftBPMIjttkkg7rx19JI8qsa4
 3YZOMUAoy8UleC9410OMxBrBBoxvhyE/ntoZTqSgjNfwqvi1V3RyYLORMeSU+yj060xU
 iElQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq8N4JoeDmPdiJtQ9Mx0jN+wU+3P18i0kkUnojg3Oe61gjvsbFbjSxf16Pz58x/h02d3/s6Zy9ag==@nongnu.org
X-Gm-Message-State: AOJu0YwX7SAlW4H5LKDQu/ECR3yCtZqphVSSvwUKEbJO1yR66ymiABdl
 NUB5aXNhXnpZa7CPmOBNIvqKjExXBVBDkmeMyE/bgcXzUS0xZDOj0DMF+EfmJl+QnD8=
X-Gm-Gg: ASbGncvYcoBlS/gwc/JzvIxlBy5CAAA6AtVkiwZsMZX8dcHl6ug6zMmzSL+8yYgn3Yi
 UtNz+u7DMydNk4rdEPEDsEHZYQdKnP8LzERd2I+Dk6GUgQufluwnFaiBxhu8hCYcpnZ3wZNlgaV
 TIffUzxbia5ugSBJn2VBhxMhB0KulEDJikg7A+9eLFYTLp7BJYO2rowXKojM4X3XCG7USpfaaQD
 Vl0pIhPW6Ujj87V9MzZI7pawH46CjPgGgUY/8FASMQ3TeCjHhHlMZa0GiRr0Miu9wZe38E3Awh6
 STHE3+EcY60IbNSWFkcrBzSqkhBNOpvwx05pzMT5mFX3GV0wQK7q3fAO1JY8/h+hhTcUOc6WNNW
 M5kxjvPR/rne8/yt48T/qEPM/TP0FYIC9iN4t2/0/Sl2BxXmEHlZ8/dykH8WkDePon+Gs5j9gcZ
 9UXsmnv8Ss7MSGWFTYHc3Pe+JsvayrR18=
X-Google-Smtp-Source: AGHT+IF3EPkkHdN3dGaDsrKnobA5Ss2WAYPrZ1tSjTgLyD62juadCZr4IcGU0Nj7qL7nrey5zB8ggw==
X-Received: by 2002:a05:6a21:9210:b0:2cd:5403:ed9d with SMTP id
 adf61e73a8af0-321e3edc7bfmr5900224637.33.1759336544767; 
 Wed, 01 Oct 2025 09:35:44 -0700 (PDT)
Received: from ?IPV6:2607:fb91:1ec5:27b9:1bec:2e21:cc45:2345?
 ([2607:fb91:1ec5:27b9:1bec:2e21:cc45:2345])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099d4dec5sm1811a12.30.2025.10.01.09.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 09:35:43 -0700 (PDT)
Message-ID: <b5280074-e87c-4838-b816-eb9e42dd090c@linaro.org>
Date: Wed, 1 Oct 2025 09:35:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] hw/core/cpu: Remove @CPUState::as field
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu <peterx@redhat.com>
References: <20251001150529.14122-1-philmd@linaro.org>
 <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/1/25 09:08, Peter Maydell wrote:
> On Wed, 1 Oct 2025 at 16:05, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Instead of using the convenient @CPUState::as shortcut, use
>> cpu_get_address_space(asidx=0) to get the vCPU first address
>> space.
>>
>> The goal is to reduce the risk of AS mis-use for targets
>> that uses multiple ASes per vCPU.
> 
> I'm not sure I agree with this. The cpu->as is handy for
> the large number of targets which only use one AddressSpace:
> which is everything except arm and x86 right now.
> 
> Targets that use multiple address spaces need to be careful
> about which AS they use by definition. Unless we have a
> track record of code in those targets carelessly using
> cpu->as when it should do something else, I'm not sure
> that there's a benefit that makes it worth making the
> "use the one and only AS this CPU will ever have" more awkward.

I agree.

Moreover, '0' as a default is just as bad as cpu->as, because you're giving no thought to 
the selection.  Similarly using MEMATTRS_UNSPECIFIED.  When such things matter, we need 
the real attributes and/or as piped down from the proper memory reference.


r~

