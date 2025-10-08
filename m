Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D76CCCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 04:22:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6Lgj-00036m-BU; Wed, 08 Oct 2025 00:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6Lgi-00036U-0Y
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 00:22:04 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6Lgf-0007SK-4I
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 00:22:02 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so65960015e9.2
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759897317; x=1760502117; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u2ajPmm+eRUp61Y6Id+fOTEnJlRwOUyL/tHC3b6C1Fg=;
 b=Eh/X9Y0lQ4jrAAfmh15/4snByFs9zSihcRYN7E1AIlGDUW/T0bYAL5ce1KS+p9rpsC
 pZ0ezbotTlKEymrjk6u2QHGw8qPQvmuevfdxNB0Rw3b8bAkrtmYtz8XATfHq1IX5E0Yz
 w2IoRowtyhKJAWxLfnf26I0Nk5bPu27p4DJTrEIeLdeXnyWh4Y1NHvyYmkiz+WDTPqks
 J+0EXZpPNJxE9wN9dv6HDWntLNV6vMLH9mYYwj2u/GmWW80tY68etACpzCaW4OEl+cZL
 BmWzt4Ew6UzZ3xs7M9yDywgz2XO2AdyhfvhkH0Zw/8UefVMWojW6QjUp2nHqVrHrhB7a
 alYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759897317; x=1760502117;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u2ajPmm+eRUp61Y6Id+fOTEnJlRwOUyL/tHC3b6C1Fg=;
 b=IO3LzItsiSQdgdN7DxMMet2TXaoV+gY6eTvsv8KTnWX+ksbYpe3SqbzRZJj4lNZdEr
 0u33xtoz5qNWx2vOQu2nyK0PSxir12mut658N/vmriWtNCTZNKD+tBUZzqJTu7nnRX1o
 H475hCcKytngDxAwj9J2gD9Kz7vPWc3t0EnsIQdlAawC4/nZu5OhiOEot5zxPKeHgdgj
 S74wKBrlvCvjs04ZbGKSx2ZJ1XBWQK/quK3NxQ+POMxAIy7ZSeHzbtf/trmrQ5e96BEE
 ivZzOBYelU+tHQ+u0dTRlyL8Gcz5Wl9yT8lKIedWb7/YQK69VUYp1fAWelJJkvy2STdo
 2iZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUieqG6kaHcZFMYD6doPbAHPppjYR+Rr56LOWjthHg58DyOt3tOksGAKLGk8b+RAw+1z+qBSZslxg==@nongnu.org
X-Gm-Message-State: AOJu0Yx8JFBMcrCZwrvelT3zxN5WZi8Y0LxI9dgD0p+8tPV62qWGKx/d
 7000jNGLbhsVocrDLPsWYLL6nTz1U9S7t94gu9qSBwOCXUCr8MUXayOGfQIGkOSxPBM=
X-Gm-Gg: ASbGncvzJsM90mrfNGVYhGS0jDdNjBbnPXI2j/jIVtJaMTY+1ZHhbJZz6JLCkdNTcAa
 Cj8mSjv1mTiTNb3Xx7KOYV82Jl23+flC0uINSqZBPUKMnGdV0olIVw29EoeiyweKdWmkJTxvhAr
 hZI6cZuNhfv+kU71Z++NsfqUOJe+i5MI75aE1koeylgGNj2ka+umQ7s08yG/00v03fEz3NeIL7c
 c8t8BqCSbi8NDDPznECBXNJOo+U35P9Y19f3h0CQPm6Ai1j6vvJB5tQz2nGw23nioCmzyV4Doaz
 Dy8Ogsii6evp9lFvuBvQe1LYaTpuVd3qEdvRUoVAJ1wRxgq2T2lAgX1RdkJ9wvHx9Imk3aiySp+
 vssw/7I49+w25rBCv8BIYmA3UdcOglmFoXTJBvvzh9Xi5aYOuEG5EEAd+EnVligjj407e3eoaxy
 pmW9g0aykERltQsU1VcQ==
X-Google-Smtp-Source: AGHT+IHZSQLZkkNaeWB4/oBFuJ2t0364K6H4BCVVUmclQQZtKBubym6NBZtTAzcWraw8jE4k2lrnnw==
X-Received: by 2002:a05:600c:3b11:b0:46e:4c7c:515c with SMTP id
 5b1f17b1804b1-46fa9b182e2mr11776665e9.34.1759897317395; 
 Tue, 07 Oct 2025 21:21:57 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f01absm27804078f8f.44.2025.10.07.21.21.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 21:21:56 -0700 (PDT)
Message-ID: <7beffd85-5800-4935-a95c-cd9a4c831b53@linaro.org>
Date: Wed, 8 Oct 2025 06:21:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 3/4] vmapple: apple-gfx: make it work on the latest macOS
 release
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Peter Maydell
 <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
References: <20251007203153.30136-1-mohamed@unpredictable.fr>
 <20251007203153.30136-4-mohamed@unpredictable.fr>
 <1e873f0c-3e1f-4d78-b61b-909443510191@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1e873f0c-3e1f-4d78-b61b-909443510191@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/10/25 23:19, Alexander Graf wrote:
> 
> On 07.10.25 22:31, Mohamed Mediouni wrote:
>> Follow changes in memory management, and enable process isolation for 
>> a sandboxed GPU process when on a new OS.
> 
> 
> Please detail here why this is necessary.
> 
> 
>>
>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>> ---
>>   hw/display/apple-gfx-mmio.m | 56 +++++++++++++++++++++++++++----------
>>   hw/display/apple-gfx.h      | 13 +++++++++
>>   hw/display/apple-gfx.m      | 42 +++++++++++++++++++++++++++-
>>   3 files changed, 95 insertions(+), 16 deletions(-)


>> +        FlatView* fv = address_space_to_flatview(&address_space_memory);
>> +        flatview_for_each_range(fv, apple_gfx_register_memory_cb, 
>> memoryMapDescriptor);
>> +        iosfc_desc.mmioLength = 0x10000;
> 
> 
> Why 0x10000?

Maybe we want qemu_real_host_page_size() here?

