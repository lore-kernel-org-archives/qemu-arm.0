Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BC9CCD193
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 08:48:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBqzK-0007cq-Cj; Thu, 23 Oct 2025 04:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vBqzG-0007bh-4M
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 04:47:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vBqzE-0002kZ-3a
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 04:47:57 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso333203f8f.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761209273; x=1761814073; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rz8/K0tEMyMdFk9Zgt2mrSe6G0rqUn802kF8LFl6g/o=;
 b=USCFQHox6j3EMxFHJ2AvEOzfRZWjcAHXRxxLZkdaLLYwpbY3OYYmZaIsdLi8Aw5LGo
 sRdCkRU7Ac9AbwVMpRcHtZ6uW9njRa4AIl32yF4dMeiR6XY0b/Wse53RuV8Yp7eNSsVX
 gcSDibp4o4L2CdctYzfeIV4J3GLAI22so7ShmDlwXcUEHW7WiOM4n8+dShB6DUPy1Myd
 q781mPqXuxXMs2ZVlW9A/G2CeU43hol8Ulhcpc9bbosorOZ/WQGu7i7l1IKYbhNjDPcS
 4/j3zfWRA7SbSD+ori/6GZciJzyYwqwX8ZLGCA71g2fGAR8m42EBk/sn7MQvllyK8KL9
 Vp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761209273; x=1761814073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rz8/K0tEMyMdFk9Zgt2mrSe6G0rqUn802kF8LFl6g/o=;
 b=QPMBuFp3g6iTjCBtXRQfdjqjSUpR2PrsEGTJ7FmVEsWGgwQ3Y+HIvKhXiLGt9sVrX3
 9k8kXvna01I158MT8IssvKiaakd78ElVs2lMY0gcEX17v8appT60FZwBsuIDj6TQLLgX
 JnYbIXKItNep5q6G20+kIowiDbE09/0/xwAz/V2ZYba844xwuCJyoC9jkTxCjRyIauTu
 6JoBHr+ZZYv+kjZKOODw4kRutys6h8kZpbxYpGieuXimDQZ2HJJNrJ4K4mPsiXmTf5I1
 j4m4/QWy0TVeMA6krqBCtVu0eNWeXSuEiuvcPmEpmxm9deMwtpg4PyDLzlpcnTyTe3oe
 +/kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwiMhRugXqjzdYdx7jsJfZW+IP+Js/qC9Rp0BXX37Mq1Pj8m2gNwNrGTEOUAVnXENXHwm5b02Vw==@nongnu.org
X-Gm-Message-State: AOJu0YwnNSSzXSDTjT15IZw2JqBgljdZR6OPmHW0wDeaiUi+7bgcMu//
 u6GW36lMOZWE12YGWDz3Y1KW7IoTeTl+ZNCfxA+Hu8aw5rG9ingzqfhaTf5tA/qi4Bo=
X-Gm-Gg: ASbGncv5gifHhp7MP3BlcCx0EIBBz9nvVdzACjE+PUi8gsUMsx8Sq5M93TS0N8/es31
 QxbwL5swJuElhD04g4nEVcRdG+VhhcV7uHoRhoIULctFQgFxgvYSc04f2idkzxpfdaZlKbYCIvm
 dGT0aQRGLz/sEITCPO9yRixPLW4QOjLncZADGiCyN+UZWZkQIySVKNudGlt0BFLsNl2M97YNTvX
 oz4NyR9tCkgnLVaCQU7UtSKjImevX44vj9ZTZFgqnlMW52VCa1zQunIzgtQ0BPTaIiSCg7nIzAq
 GZYG8Y+3YkcA3udM+Ic8Q6pCbcOmDYzQPPE881LbVBcS0TYgzCTai8mNQVW+59Eish8z8m6Inp0
 zqMimy7aY+nfy3qdEZ2KrCqz4Sm5D6jj5Qqy0OCKlfVH7JF+UnGF8lZGPb4FMy59WBJ2JtuyFBg
 C6FHqM1rFAXYW5nuRp4004tRVJrp/duyFBwg5N7jgVSLCHbH8qh/MFBHczZ8gotsn6VA==
X-Google-Smtp-Source: AGHT+IFDm4qYEEpbTlOdExTrEq2HLGdn+RSQQuCW6SQSu4OKkkIkvK0iQV/mXC3K8TkmaNLnEhoL1w==
X-Received: by 2002:a5d:5f93:0:b0:427:4b0:b3f9 with SMTP id
 ffacd0b85a97d-4298a04071bmr981873f8f.3.1761209273145; 
 Thu, 23 Oct 2025 01:47:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6?
 ([2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898adf78sm3002027f8f.32.2025.10.23.01.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:47:52 -0700 (PDT)
Message-ID: <67daa7b7-7411-4207-bae3-0bccf33f77f5@linaro.org>
Date: Thu, 23 Oct 2025 10:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 24/24] whpx: apic: use non-deprecated APIs to control
 interrupt controller state
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Eduardo Habkost <eduardo@habkost.net>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20251016165520.62532-1-mohamed@unpredictable.fr>
 <20251016165520.62532-25-mohamed@unpredictable.fr>
 <2cbd9feb-2c20-46e0-af40-0bd64060dfba@linaro.org>
 <6982BC4E-1F59-47AD-B6E6-9FFF4212C627@gmail.com>
 <60cd413d-d901-4da7-acb6-c9d47a198c9c@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <60cd413d-d901-4da7-acb6-c9d47a198c9c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42e.google.com
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

On 2025-10-23 08:33, Philippe Mathieu-Daudé wrote:
> On 20/10/25 12:27, Bernhard Beschow wrote:
>>
>>
>> Am 16. Oktober 2025 17:15:42 UTC schrieb Pierrick Bouvier <pierrick.bouvier@linaro.org>:
>>> On 10/16/25 9:55 AM, Mohamed Mediouni wrote:
>>>> WHvGetVirtualProcessorInterruptControllerState2 and
>>>> WHvSetVirtualProcessorInterruptControllerState2 are
>>>> deprecated since Windows 10 version 2004.
>>>>
>>>> Use the non-deprecated WHvGetVirtualProcessorState and
>>>> WHvSetVirtualProcessorState when available.
>>>>
>>>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>>>> ---
>>>>     include/system/whpx-internal.h |  9 +++++++
>>>>     target/i386/whpx/whpx-apic.c   | 46 +++++++++++++++++++++++++---------
>>>>     2 files changed, 43 insertions(+), 12 deletions(-)
>>>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>
>> Couldn't we merge this patch already until the rest of the series is figured out?
> 
> OK if you provide your Tested-by tag (:
> 

I did in the past, but I'm not sure it was reapplied by Mohamed.
In all cases,
Tested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

