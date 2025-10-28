Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDAACCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 14:39:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDkrD-0002fj-L6; Tue, 28 Oct 2025 10:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDkr9-0002ec-HP
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 10:39:27 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDkr3-0003wQ-Aw
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 10:39:27 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-63bdfd73e6eso12882123a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761662354; x=1762267154; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EXt259YuBfadOH1lDpfgQiRnIoeCkfp8taYmmSXcWIo=;
 b=oT8m3F4w2b/0+HB4fgVgVH/6G6fY/YL/uWVbSoJDAjfV0L8Lg/v9PUd9/XrwpULk41
 jR8a4Lh9BfAiBEJE9Uk0YnEJjjnwf+290BjBS4SOyj5qnInY71wMgKn2alfD6e2edf6c
 YfBGUWndr+ZNYDxl+uQjL7I+VZAifWL7qe1D5GW064sDZTvpJ1SI2qyO3pxRtY9YS8ZO
 bCzYN3k0Q4wlvoFayTbsXFAJ88DkErDMpPIKTE7pUkt9IaZDGpTIgviY5dv8SUPtgrUO
 qkFKIIfHyzACLaHe4GZr4G4qxzIYdE5CIDF68U9kMI9f7ZqXPdONkRoCSi2vAYTlCAcK
 a7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761662354; x=1762267154;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EXt259YuBfadOH1lDpfgQiRnIoeCkfp8taYmmSXcWIo=;
 b=PBZ1JbOhhOo6SvCompwcSNKa4GR8PSC8At4MgT7aNvAVSJE0Dax79EiQmFjeRBxHwJ
 ARDtzbb5QMV+XDX0TxNRdqh5xAiPLb9VpHbQT6mKz//B6z2TOXd5zQpSq0YlAdUQV1hf
 Q9rvi3DvTwrM55cAFnoXMeZT1aJ67Yt9z4seO6YHEi3z55foj6dFZn72AMbdzBOT6BVm
 TqGRVUYIkzNRYTEPcIGW3PQM2paRPFLwTXCuMsZixTHYw8llnsHIgt0MV1oL33BaMrBI
 eM9l+ecjNd+nsGXZca7KjJvnV7pk/Jsn52qg+n5pm5YVyA94wPX8BcIVdf0vapzEDMsB
 j1Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKNQnuXvbURK/wEkf0xewFADsqxJAPlwhSU4+3NSmSl75LW1RT9oAjEU2wg0vyiJX4tmfPgEPZMw==@nongnu.org
X-Gm-Message-State: AOJu0YyC1T1c9onO7SEBh3fbT5godJ1Lgr7i5k8MJMyuIArqWGs1IEQw
 gNKXWsngtyFujIvK5eI4rCNKqvnZfwUveuEm19/R5qNvdGSR8kIpGijS4xi7sa7LnE4=
X-Gm-Gg: ASbGncvoPO5UnpyIv8Yxvckg/XDIAMl6yvlV3MQA/nmKUYXa2GBrdMJ357B9+Utx70o
 r7xcKv4Dt9kA6ioK5Hzj8L1N5Bf87XtqvOFMJAQ/l/lgiewRVtdQRrwoIC1TmK5Tjqsp9rkG7Rl
 0IuQpoOn+fQ7K9nldkLDv7kfHckk+svE19rp9E1cdc/AiIc5PVWQs6BEntNN/uJeJXmkPXrFyjl
 58kuOO4rOpLGjz9RxKUx7ArOdvvs50sBSE34Ee2wR961avsc4aLeGc64D2diV7RkYZ3UUKzekoD
 GUT2F+ZsJ9/S5y8w24ATSMiT8upwtUd3gLWzYp9N+MWIuBzk7/fiFTV9Pdg81I1XD60qn4vhbft
 iL5M2MwHzC4xxn/Vg55gAbcrWZT79UQGZMy9erZdA+qdjkEru/lieQbb6SqJOHmi9M6xE9hP55Q
 tdIVFrJOWiCHY+q0fy
X-Google-Smtp-Source: AGHT+IEBtALiFGdo41uao0HFKjCFVb+2yYyK8UVzv6XwVHKGhRiyZ9dvrmrPI81tVm0wx7rHMhjqVw==
X-Received: by 2002:a17:907:1c0b:b0:b50:a87e:efe5 with SMTP id
 a640c23a62f3a-b6dbbf72685mr410492666b.19.1761662354453; 
 Tue, 28 Oct 2025 07:39:14 -0700 (PDT)
Received: from [10.240.88.227] ([212.144.248.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853f9a0fsm1104953566b.50.2025.10.28.07.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 07:39:14 -0700 (PDT)
Message-ID: <686b4a77-cf53-45e8-9b75-2b8dd9c4a67f@linaro.org>
Date: Tue, 28 Oct 2025 15:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/37] target/arm: Consolidate definitions of PAR
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-21-richard.henderson@linaro.org>
 <CAFEAcA-tVBn3g185gzs2uOCnYLeqWN_zwfeQ0DccLf0n8BN5PQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-tVBn3g185gzs2uOCnYLeqWN_zwfeQ0DccLf0n8BN5PQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/20/25 15:31, Peter Maydell wrote:
> On Tue, 14 Oct 2025 at 21:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create a function define_par_register which handles the 3
>> distinct cases for PAR.  It is easier to understand with
>> the definitions all in one place.
>>
>> Make the aarch64 to be the primary definition, when present,
>> rather than being an alias of the 64-bit non-secure aa32 reg.
> 
> Doesn't that break tcg-to-tcg migration across this commit?

I don't know... possibly?
I guess we have a test for this somewhere, but it needs setup?

I'll experiment.


r~

