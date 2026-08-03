Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D026C55182
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Aug 2026 17:26:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wqwQn-0006Nu-0d; Mon, 03 Aug 2026 13:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wqwQl-0006Ne-RZ
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 13:26:27 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wqwQk-0005Sx-Bb
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 13:26:27 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-8485ef63b68so3957775b3a.1
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 10:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785777984; x=1786382784; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WR3cPdbg8+sBxb7TO+E7ye8EiCIdgZwJ1HnxFT0EfJQ=;
 b=Mg6rdR+qXD9G1DR+YXMFnZ24a8+Oyee4QRiIrZYdzjHtZFYG1Ey2u848MFDZoEUJ2/
 MZX+UESBYXTfcoaiVV0h8i+fkqzWlb4KHqVies8wALdp4v23484MmW8OowztjMslqFHn
 ZlYBfAW2mmPEDgmoZSd130z/XFx4xrW8dzg+p3gclyfkxO8YzHZGlNypHyb3qn4rTeRY
 7XZxRoziJhzOPSf7IU4QF/KttvlNhMrd9Fo8mj2rsnMamOUVK/vDGpVnBOcjoMACstE1
 PjpR+GpDcsdx9QAwiXsWhAfaFIhBOpvEyjuD4w/i5m8Y4E4oUGoVHoD2+1g5AgK/9WBu
 YOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785777984; x=1786382784;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WR3cPdbg8+sBxb7TO+E7ye8EiCIdgZwJ1HnxFT0EfJQ=;
 b=O1p8AWQBdPzlIMvIMhwhG4mOkaB0VYwni7CC8T2q5QA/avo6N1C9aoLMEhU6IueWvq
 WIn4QSgqa0zSrCoveXBV5lOVLh2I9NnJ4d9FDndmAs8IlUnj/TyKj2nmt7k52BskgZbp
 choayDAQRtv6FlNTE5rHvz59ewS75lpKFhgitVGwKAzK9UnFJqnAPtdIapMyMRz7ioiu
 i2oECTEUbk4dFt7+l3wFQ0tP1dMU4cOkcesrMQxqMZCgz9v+52ansWVCS7TC+lQTfelc
 3wP8pbHBYZRUduSinBJUg0jtrOc3NzzRalXii9s/GUy/q/p4yM22x9qP/2+NpgMWSUjB
 bNQw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoRvLdy1M0LmpXpvLZwkr7UwBkR7UmDD1TLUv9YPNNw+uJNmA8sBC5+VLOg/OWdkUn8GNbZe7ntcg==@nongnu.org
X-Gm-Message-State: AOJu0Yw1IWkSQ2O4BnCh8yJgX3Cnh83iWc6oQFGqHOBRZU7DpBTEUUoS
 iR1b/vC4sYxqPs0NgfTYoqFtUnv4838LXedmY04QO8vP6euX2DzyyrTG/80ToLFPVpo=
X-Gm-Gg: AR+sD13FVe/uF/pJG672Yk7GhJNJ0OM2DK/hNwz5Cb7L3V+LnKALnHB1IlZZRVDIzOh
 6E8lzUT91/RG0wbeuhBMf/M77pOkoKA4v18MqlsyLakiuHmDVxvff4S74GJ/BB56zqNeni2rk3Y
 A2DIkGqrfWWEgtPVF79th4pGNwzvdjl1EO0ooWUS1xxFvZhhO5/jfnPJcHEJiVCcsnF8HCMwFiT
 B3qltR3oRQCtwCCLKyuhiQ91FH9a9S2D0ojiyXhZ50gtCyuZhrTnbMeD7+5lhgxJcslkVlXGL1X
 BlvWqz9svZdf+lVwD50UShNfiRU5+ZLQBOdT13+7kAeC1sMswVC87z8kghmSCx8wyByvpElUDP1
 dDch5EyOHR/5JFDLKAdEgLadrzrOFIo0N6pTpec/7q1Xa1R+6SNYAqmTwAUGNmylefr+7OLvy0s
 XRSLYIA8nf0RTKZckemVvdvPxfYsIlMo56QzNbB61tNOj/fzV5R0OxwCsEkRsdry8512KdmQN1v
 STdeZQ0pHobiN5Zo475o81cC5Lz
X-Received: by 2002:a05:6a00:3c85:b0:848:2f6e:e538 with SMTP id
 d2e1a72fcca58-84ee49217d3mr10004831b3a.76.1785777984424; 
 Mon, 03 Aug 2026 10:26:24 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84edbe7da67sm4127794b3a.25.2026.08.03.10.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 10:26:24 -0700 (PDT)
Message-ID: <a2b68ee9-861f-4511-a2e8-13889d08c151@linaro.org>
Date: Mon, 3 Aug 2026 10:26:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] tcg/loongarch64: Import REVBIT insns
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 git@xen0n.name, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-11-richard.henderson@linaro.org>
 <4b5db4f0-bad1-48e0-bde6-f72ae4681f39@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <4b5db4f0-bad1-48e0-bde6-f72ae4681f39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 8/3/26 08:06, Philippe Mathieu-Daudé wrote:
>>    * This file is auto-generated by genqemutcgdefs from
>>    * https://github.com/loongson-community/loongarch-opcodes,
>> - * from commit 7f353fb69bd99ce6edfad7ad63948c4bb526f0bf.
>> + * from commit 40ea52087699392ad911387b666541891d33da31.
> 
> I couldn't find it then noticed your
> https://github.com/loongson-community/loongarch-opcodes/pull/10,
> so pending it to be merged?

Yes.

>> -static int32_t __attribute__((unused))
>> -encode_d_slot(LoongArchInsn opc, uint32_t d)
>> +static int32_t __attribute__((unused)) encode_d_slot(LoongArchInsn opc,
>> +                                                     uint32_t d)
> 
> What triggered this code churn? Could we commit before generating for
> REVBIT opcodes?

It looks like the program passes off to clang-format.  Perhaps a version change in the 
year since last regenerated?


r~

