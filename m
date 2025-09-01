Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FB9CA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 20:51:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utBUX-0005sz-5y; Mon, 01 Sep 2025 16:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utBUV-0005sL-VM
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 16:51:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utBUT-0003eJ-NX
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 16:51:03 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3cef6debedcso2029399f8f.3
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 13:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756759859; x=1757364659; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I1KFB1tWZdhySBc97No5Pn4pnNpz5554Ov13PB1hYww=;
 b=K09KR/KJ3qCHjyLfp/VRPg5q8OV68xHkubqB3a8d0MfUYry7PGjcCrrCeJoh7+/onU
 vDs3lBr0lCYkzmFFSfAhbk4ZIuHxUqkVaAN7IBeXP0ocTHVYYCKJafSkIw9KT0cG0k5h
 8+w08p964iR3+tfJTWuFsF7kqjNvK//EeM71qR4/rraCul2My2fGuuiCpxYzcaj0cjkt
 04Yv3WJ+Hc7njOZvFJoIHVXJDRvrvkeNjIWdFXHSocJZ1NbIYITCCkS5O5sTtjhMxRGK
 lO0C2sQ47J32TtqHoesghHNvAk3RVzgBOKo7FB/gv9EuEPMjWCkNmqd5xLO9eHZge8Fq
 ty9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756759859; x=1757364659;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I1KFB1tWZdhySBc97No5Pn4pnNpz5554Ov13PB1hYww=;
 b=rj1sWWJsAb5F3xOaYXfW5PVWG+qcnsA0gKmWJl53mB4zULzSMsAifSm+aRhbQeaUkQ
 WlX2ySTn/JNrh1d0deg2sG2QT4CzG/1hNQB5GVigulw9jXFkGnNAjkIz6ndfwpeRhVDG
 rPXB739Bj6ti0NwnatL9X6eszYKMBewzTEI3QlBuIwEJ8bVIoTOxHKJNAwYngWPs6sRo
 TG2RikscY0jAIGfFJ00fig8B//133uoPHN4yK/jWwyB67BVD6NBm/wruKpLxK9IQHkik
 oEbn18yp5rfjxLJce2B9IKCVaiJV+ZPTzUw2aTzch/mu7/oQSPunKiVbmFHQp7rkUrkF
 TClA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlC3fvvIKwACgmAUw7ppvf6LoGtWMkIFecaThj3anSTTmDLaN3odGAa8BvWyOE96XYG80dJXAfFg==@nongnu.org
X-Gm-Message-State: AOJu0YzsdylwB24GKQZM8EfaaJ3GLkfDS8yse3CB8XDTy8q/RIPjiFkq
 Kz9nyBxhyzvuuJOKmFZfS8i6MRBbF+5yKIQu9wQJdizb9eqFfL7uxp52psKC/2V/eU4=
X-Gm-Gg: ASbGncvBu4AQpJC4QP3F4t6GuR+N1aLxU5asw9oKyw0ftCUmZDhC+CyvuywvoB9P+nX
 lcvZIHOCPN3VzX9FaYh4Ab0uPETNydYBhJqXsca/29ADhXZvNtsy2DCAV1zq81a0cvCZ0o42cGY
 TV0X0x4UAkq/6Jvi8M4MwLIBphX8Z8wG3cvkuX5h99Gd/tFOjQwlvtCgJyucVQSf5XCQu3bAk9w
 1ltab7Bq35W7zTZRuacAD2AOpIiH+BeoJ2l+5EYBvKbhkaWKixIR3Jp/tJ2ArofHKYKcJ3gIWEp
 lkOz0S54TyzR6xkt1+piMf31kaGbQReHcQq4YbOYnW4NocQt7rIgCq0ja5PTvGYUCZ7Hsur0zDI
 4rjugJb3frNFMWRGeBHcY7iVTJtEL2Q/aOxOz8D4pDV/z+Gov7vZ0jm11QoWspSS10fDXyvMpuU
 IW
X-Google-Smtp-Source: AGHT+IGGMMw//c77Aq7nktUa+n8ml0M74uW9fLD7hPFGq1abIM2yLnVkdCSLaebKPD49duehSTD9IA==
X-Received: by 2002:a05:6000:18ab:b0:3d6:a2d1:8e9a with SMTP id
 ffacd0b85a97d-3d6a2d1927fmr3711254f8f.15.1756759859139; 
 Mon, 01 Sep 2025 13:50:59 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33fb9dbfsm16632172f8f.43.2025.09.01.13.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 13:50:58 -0700 (PDT)
Message-ID: <d9b4f4ee-7e25-4cfb-821c-bb12ce8d4e32@linaro.org>
Date: Mon, 1 Sep 2025 22:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] single-binary: compile hw/intc/arm* files once
To: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250801174006.2466508-1-pierrick.bouvier@linaro.org>
 <3ca7be1f-267e-45c9-9894-67e920ad5ee9@linaro.org>
 <CAFEAcA991uW624qVvQe9Q+6JY7Qu7w+ksWJH6AExYghD8UtSFw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA991uW624qVvQe9Q+6JY7Qu7w+ksWJH6AExYghD8UtSFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 1/9/25 18:23, Peter Maydell wrote:
> On Fri, 22 Aug 2025 at 15:31, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> On 2025-08-01 10:40, Pierrick Bouvier wrote:
>>> We simply compile them as target common code, without moving them to hw/arm.
>>>
>>> Pierrick Bouvier (2):
>>>     hw/meson: enter target hw first
>>>     hw/intc: compile some arm related source once
>>>
>>>    hw/intc/meson.build |  6 +++---
>>>    hw/meson.build      | 45 +++++++++++++++++++++++----------------------
>>>    2 files changed, 26 insertions(+), 25 deletions(-)
>>>
>>
>>
>> Ping on this series.
>> I'll be out next week, but it should be ready to be pulled once the
>> trunk reopens.
> 
> Philippe -- I'm assuming you'll pick this up as part of
> the single-binary work. Let me know if you'd rather it
> goes via target-arm.

Oh, since the topic is ARM devices, I thought you'd take it,
or provide an Acked-by otherwise ;) I'll queue it directly to
save us time. Thanks!

