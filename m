Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46FC982D1
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 16:30:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgmhx-0000by-2J; Fri, 16 Jan 2026 11:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgmhm-0000aC-NO
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 11:29:50 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgmhj-00074v-RI
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 11:29:46 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4801d1daf53so12810255e9.2
 for <qemu-arm@nongnu.org>; Fri, 16 Jan 2026 08:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768580982; x=1769185782; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tjG4vIAWwuc+XtwynpzOFi2h/9DUenqkua/KON79W9E=;
 b=arDRPp07JDrTpHx60ijQmJPLtyt8PUL5e07ju0NWAZW7MxXAd9nT9+vrLqyBsfFszP
 exIdS57Cc36wfzqoUv1NCPcx7wDCjPIOX4aTT26kifbR6SzsPLXgdrgMBIoQLCbHC0sm
 bXa+gjEQRWTXsqYlmdcUucQitPKzplw6zEbwrdF9OQLHv7hZlhKk/Uak+pyfdrHzZI5Y
 J1sVyDhTBAbWWNLV10NvOFHXVVavh9LUW5If1GoC/a1Ha2sjYLFFrQuHNU4hTdNG0qNb
 ReLyLJpLQ/gbMADgcvLwWunooCmSdHgbzeHknXssC1uox90GVDp1sCoPh5Z83gCU5aRX
 jRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768580982; x=1769185782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tjG4vIAWwuc+XtwynpzOFi2h/9DUenqkua/KON79W9E=;
 b=HrJTJ47YrDo8oLHXYAmFM5s2K/8Y3PSlq2tEwmYkvnPE0kzOzoQgcFNj25J4BZhwd/
 qA/9dGavLu9E+ZJ3uzXYDrLIBRDzzygGyCfQKlkVY2VFl2rZn5To8YWIrX0OjxZymJ9R
 pEwKW4F24sm5QanXu4GR78rsm1XrRIV7txNYca/dMmQY6Pr0X1OjgCQGPRSSdm6R6/Bt
 hu9PH25ej9KVBoIBK+IU81VV27y4kpF1QxH+jskcRAE3pSJXvdJdBPBZTszWuW9zsbEh
 6913a1IXEGd1whnpBQ69Y3jrY5qN6aIvbYc+Vi67L13qR5PRuUkfMOAMgvNKbxVbnoFZ
 /fbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU15YA6GvJJnwxCe91cqaI78XVyAdJZMTy8GWnLFdeB2IX6697uSc7/4AFMa+9s8Op3rFqynFz89Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw1NuN8zvKbOPodS8HS4IvZFWE1+6+nR+2f8ARF6WoAkh1r8ugw
 Z80llmxu2YMgA9WbxsrDr5x1JWZRMMEQAUXMG6I+yYYzem1e8hrp9I2/q6rE7wpcxow=
X-Gm-Gg: AY/fxX7EPUzuAg/vKveuyfoQy1BeiA6Pz3DFrKCKwOPR6VuK5tUXQUfFJxCV4N03M2v
 XcSPwypzK46aLI1DxcrdVqFGNTpYV+IGWoAba0STQJvJIuiBCFJPmS4T/jtyFTL57ahtBTzuKAG
 2t6/HgnXNAdnknKEpJFIsZ6txSaX0hGBVvUUl+8w4NxT07Mp8honNHX4ZffqHxW7moOeBcEeBZ1
 8QnVR+NxrrvjK8IPW0/LFYYYLWpObxKevoQx/M7x1l1tT//y9dbXAgGljDPwFrvQAp9jZQO7ldp
 JZ2zdIk8WrlEoUkX/C9ymQ/WuqX/9lxLx8WYZjPxgjYIe/zW75VgAibSDqynd792AC7jwShDgwt
 uJjIrnOMylUXs+i1KcHgHql21OOcljCQOHbqrHoyVlqwVM1H2pwHsDeQa1szRx7tpD5SGcYdCFy
 wfG4IpnaQSPds5glrqLh709m4IDwd8v4dbs6Bp0hr2KFF2ailIDb3ffA==
X-Received: by 2002:a05:600c:458c:b0:47d:6856:9bd9 with SMTP id
 5b1f17b1804b1-4801e3342bamr33031195e9.23.1768580981897; 
 Fri, 16 Jan 2026 08:29:41 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569927007sm5989271f8f.16.2026.01.16.08.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 08:29:41 -0800 (PST)
Message-ID: <9405870c-1278-43a7-9fdf-ba986e362ed2@linaro.org>
Date: Fri, 16 Jan 2026 17:29:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 15/26] whpx: add arm64 support
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-16-mohamed@unpredictable.fr>
 <23800170-66aa-4e31-9e74-e256933c8a8b@linaro.org>
 <D57D8689-9535-41D8-9818-79E544E46DB1@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <D57D8689-9535-41D8-9818-79E544E46DB1@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 16/1/26 15:58, Mohamed Mediouni wrote:
> 
> 
>> On 16. Jan 2026, at 15:21, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 16/1/26 14:52, Mohamed Mediouni wrote:
>>> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>   accel/whpx/whpx-common.c    |   1 +
>>>   target/arm/meson.build      |   1 +
>>>   target/arm/whpx/meson.build |   3 +
>>>   target/arm/whpx/whpx-all.c  | 810 ++++++++++++++++++++++++++++++++++++
>>>   4 files changed, 815 insertions(+)
>>>   create mode 100644 target/arm/whpx/meson.build
>>>   create mode 100644 target/arm/whpx/whpx-all.c
>>
>>
>>> +void whpx_apply_breakpoints(
>>> +    struct whpx_breakpoint_collection *breakpoints,
>>> +    CPUState *cpu,
>>> +    bool resuming)
>>> +{
>>> +
>>
>>         g_assert_not_reached() ?
>>
>>> +}
>>> +void whpx_translate_cpu_breakpoints(
>>> +    struct whpx_breakpoints *breakpoints,
>>> +    CPUState *cpu,
>>> +    int cpu_breakpoint_count)
>>> +{
>>> +
>>
>>         g_assert_not_reached() ?
>>
>>> +}
>>
> Hello,
> 
> Called unconditionally today from the common code. But does nothing as breakpoints aren’t supported on the platform.
> 
> If trying to actually enable a breakpoint, common code will go through whpx_set_exception_exit_bitmap and error there.

Ah OK, then let's just add /* Breakpoints aren’t supported on this 
platform */ twice.


