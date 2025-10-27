Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A45BCCF9ED
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 07:56:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDI5K-0000hj-Fq; Mon, 27 Oct 2025 03:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vDI5I-0000fp-MO
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 03:56:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vDI5D-0003Ai-Dh
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 03:56:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so2794212f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761551761; x=1762156561; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SQl+NisJFxZKOAs0wWeJ4+Zx/WhIYmpfXNRhIe2eUS0=;
 b=rhdlZlLgXMmYImEDQz1r9Gg8YqroaKYeR/Z+v8Ck44Xko94RBFYt+DE38vr3zbDTWq
 lXltO2nSExzkr4zDPj/VlSk7srGx34/y+WfF2FB5t67K4SHqkHxaxW/CF+KZQbnfWsuB
 iSsgNEh4Jfx9AHBqmHrFmjBhnPecBRV87E0INSqNxghX7qbAcfFlnivjkGR2dSPtxNUb
 yUAgMvoP62R/gcfMrpSA86yA1R7Dv3AcGsQU++oIlxKa1r7qUjX/Qq4jmdUH/Ei6/n0j
 m2Jp5go1gC24pUtorCteNkRjoGbj+kSHQ+hWC2RACy1yCuCykY0i266cRufDLsMbG3P5
 hDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761551761; x=1762156561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SQl+NisJFxZKOAs0wWeJ4+Zx/WhIYmpfXNRhIe2eUS0=;
 b=va1e4Tb2y+ZNEMVrWTIPL7D4J3FnEyn0SogtFYB1QfyyM/vpQbQxFSbbJ1wC4d2ewT
 S2fa0Wz3ocUPpt+uAW4JcwozE33mSqclu9E768MuUNVtoPMQSuSXK9qRtMnacYcSkqvj
 zHyN7TM+5sJr0wkoHZT0SCIJ0m/gB3fTy50gEIyOkZpxq67QXjg9qT6Z8VtTwVKzSKJl
 lZQV8nwRvR0sN0yuz9/A2pvgHHJjQdvDH8fyelRVl8p491z1U+hV2r+dHHMEs1fN1FwR
 0zOEFCwLKvgG+dg0oq9tRkjhrEkY3XqquJkhSFf73hWfmJjpiN7Zwwf3/+kiEYjGpPAB
 TaBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMYfVzFMHpT9m3ABqN1QPdtH+jhtg4E8LnsWYU3FNJ1dNna3a2TgryJj+tuNBnNbo7eBqfLPVapA==@nongnu.org
X-Gm-Message-State: AOJu0YzV8WblEONpUczlICziEIWmOPooZA8gTOgFz28azJLk/1vNuMnu
 Ob0iA/KuphIS9jCqQu1KoNMy806Exlbpqsw2DyFcsCZaIoaDK7QzNnTOTLH0mWkwZNI=
X-Gm-Gg: ASbGncv5bs6jrSFek9erzImeU+6JFOt2vcvPVMQUgl2JPPj9iUwvqNwZdE3K53tZJUn
 JBomUo+58UMyTkyOyZO5yNBCi8g6bJbkJN+9zfdR5I3B14/xvdD1xEOL3Kf10i6jTfed4lPVTpv
 7+LykXGSPrHbUn8plGxrjJ4kaq/wcO+YXFgr/Srnc52kb68mWq27m9iUqDGNwOKKezwgViPdD/J
 r0FGLNuvGN5kq1uz32bfElT3wiv/hgGbbhmyuh21twmmsMSdn7mLkfGBk1enexbViktFeNTFGfa
 RINN4OL+0X9B4wpKAJ5/JpYHJ3MhyovtoMrCdjXvQX5wXCYP38+jJpDv2Pqr/fDVBCNkqMX8O8E
 9vVd3K8FCtnN8zu3LamhgsDevsFEMW6w1WTEARbW9+mnkS8ddsqSwXQa4D9KnGpdSm62YdThWAJ
 lvN636FISHs8l1gHyiAepmSuebvDwPO/XY/AFAX8U4FrjjG73lhkJMQEP8AFMgNMpvmA==
X-Google-Smtp-Source: AGHT+IEoa7YoqXjwVsW1lLWBoPF6gggZOI6+XF3bY9ecPa74D9gFf4/xAH6v1KQ7ZxIhD5F1vKXGuw==
X-Received: by 2002:a05:6000:2508:b0:427:9d7:8720 with SMTP id
 ffacd0b85a97d-4298a04e95fmr10995412f8f.24.1761551760763; 
 Mon, 27 Oct 2025 00:56:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6?
 ([2a01:e0a:404:4d10:9f16:e9b1:dc97:28e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb7dcsm13127131f8f.11.2025.10.27.00.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 00:56:00 -0700 (PDT)
Message-ID: <05a6fb35-a2ad-45f1-9a84-79477560442c@linaro.org>
Date: Mon, 27 Oct 2025 08:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 24/24] whpx: apic: use non-deprecated APIs to control
 interrupt controller state
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
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
 <0C41CA0E-C523-4C00-AD07-71F6A7890C0E@gmail.com>
 <4F98A2AD-02A7-4A7F-91B8-269E9EC8E5B1@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <4F98A2AD-02A7-4A7F-91B8-269E9EC8E5B1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42a.google.com
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

On 2025-10-23 19:02, Bernhard Beschow wrote:
> 
> 
> Am 23. Oktober 2025 09:23:58 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
>>
>>
>> Am 23. Oktober 2025 06:33:18 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>> On 20/10/25 12:27, Bernhard Beschow wrote:
>>>>
>>>>
>>>> Am 16. Oktober 2025 17:15:42 UTC schrieb Pierrick Bouvier <pierrick.bouvier@linaro.org>:
>>>>> On 10/16/25 9:55 AM, Mohamed Mediouni wrote:
>>>>>> WHvGetVirtualProcessorInterruptControllerState2 and
>>>>>> WHvSetVirtualProcessorInterruptControllerState2 are
>>>>>> deprecated since Windows 10 version 2004.
>>>>>>
>>>>>> Use the non-deprecated WHvGetVirtualProcessorState and
>>>>>> WHvSetVirtualProcessorState when available.
>>>>>>
>>>>>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>>>>>> ---
>>>>>>     include/system/whpx-internal.h |  9 +++++++
>>>>>>     target/i386/whpx/whpx-apic.c   | 46 +++++++++++++++++++++++++---------
>>>>>>     2 files changed, 43 insertions(+), 12 deletions(-)
>>>>>
>>>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>
>>>> Couldn't we merge this patch already until the rest of the series is figured out?
>>>
>>> OK if you provide your Tested-by tag (:
>>
>> Oh, I did for an older version of the series w/o this patch: <https://lore.kernel.org/qemu-devel/5758AEBA-9E33-4DCA-9B08-0AF91FD03B0E@gmail.com/>
>>
>> I'll retest.
> 
> Unfortunately I get:
> 
> WHvSetVirtualProcessorInterruptControllerState failed: c0350005
> 
> and the VM terminates. Reverting the patch resolves the problem.
> 
> Best regards,
> Bernhard

Thanks for testing it Bernhard.
I didn't have time to run latest versions Mohamed posted.

Pierrick

