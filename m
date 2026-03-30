Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E7B1061B15
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 18:10:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7H3v-00050f-S6; Mon, 30 Mar 2026 14:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w7H3R-0004tr-Im
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 14:09:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w7H3Q-0002Uj-2e
 for qemu-arm@nongnu.org; Mon, 30 Mar 2026 14:09:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43cf5fbacc9so1092073f8f.1
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2026 11:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774894173; x=1775498973; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kKhsamchR/ffB/aYYhevOtJn/yKx061VmVI0QpKthlU=;
 b=XEl3axPLDPlwqj4d+dbkp6CRnIg00wJ07lNQ/gSE+PfImz+0qVXZHf5Qjxgxr+xYdZ
 WJwuy9nw7wwRu1pfW5cjo6kquXAcQXFr98Z4anJDrGy1LNmZICYIz7yi8Btr41QgMUld
 u12IECaZc+UoPqTsFgWfQZqUR4oOsXBi94nCZ11WbE9S9fHPbiAPySYZsepJD1yaukyB
 CuO77lXqgpmVrNND0iGJ/S7icvTiOVtngoLVavtku9VffzkLjLBdeLSlP5zUslqp/EoX
 ZfYXkJZu4IXceA1u+kFgKuyeZvFslfAxd0LsqKw68Ikn4MlOJBhOPpicCq9DV9gR7TVd
 jQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774894173; x=1775498973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kKhsamchR/ffB/aYYhevOtJn/yKx061VmVI0QpKthlU=;
 b=TUCAVEDXpj6sIAoA7SJXJ0OMSlMd2ClFfCmLddljifLh/I04RaKSwa6QRoRwx7Td06
 odSHF9eXxBkYocu/v1uWaggmwudl0o5RnFkgz85WMqX5Pyja/imitFHOTcmqGKJr1yB6
 Yp8R/YtokQwmGxoatRJhXtpuO6xiiUTUTXlLUIaK+jr1rafEe80hp0wgEgz7xe/RaNlS
 6/xrk+Y03B8T3x0iLGCkOR4KSO6Fh7kU4342Lm36myAa9oJUbbUpS56E15pZJ0SfKLX7
 1nQG81l+pAQtfHNcQs+FZ97ii8pBSDCnBySNl0aUARcihwYDZDmhu25q2INrBgV63qEz
 cNUw==
X-Gm-Message-State: AOJu0YxLbVlCneCr9NzAShPbMzzUPtwcCRSWP61dYvp0X1sNW2uiieaW
 VpZNXBZJd0HA3Y6j8lfpIAb6HUKM7uPy04ht+8it4L5kRFH6koYbAAYdk1Y01JCXDTU=
X-Gm-Gg: ATEYQzzdx9kVdf+6rqPSxQkVjfi1zCtkROrdrUtf1CLMiCM0RqI2FKcege5frAbnIeq
 CZ5WLw2kHrlgp0sGDRAG9BsulWfCNWEmn/wh91sD7M7/g0AhG2T0ZOGoVqYM6R4OY9RWz/VyM4T
 pvRI1skNcwhI+6uY7hTGLzlrvL5uyGkkIRFSXN3BNQlKTI6lTAwQqeNJ9Rq1eK5L/Ka0AtZyO6r
 g7zxQcrq1w16xV5NuxZX+c/GVfHsuMaavDarwLp7E5NXt2hzq1hyKNBd04SzPWZuxfmTeB4NKTY
 hu9scZ+hoGVt0FB0B1XKy6fmyDYmp3KxE2EKKUPKiZigbwryJWI/qbz3ot+yiWsnml6Ubu3+LP6
 vQ+6LVWe/t5cNszxAFAKMP+t7Qwb20iu/X7LSKxXSPmHyAiKRRLpdwNqbvsfpMSKiNTFrZJrDlN
 b+KuFrzHOMnm8VZKqGIe9Bboeuyfqa6CJctIJ+1+Iy9h04PAs3aLoPMaz+2dbXkb388Q==
X-Received: by 2002:a05:6000:18a1:b0:43c:f5d0:4f6a with SMTP id
 ffacd0b85a97d-43d0820be28mr950768f8f.21.1774894172880; 
 Mon, 30 Mar 2026 11:09:32 -0700 (PDT)
Received: from [10.193.39.66] (246.148.216.82.rev.sfr.net. [82.216.148.246])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21ebef9sm21594523f8f.13.2026.03.30.11.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 11:09:32 -0700 (PDT)
Message-ID: <bdf00031-f778-412a-95a6-005bf855ab56@linaro.org>
Date: Mon, 30 Mar 2026 20:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] target/arm/tcg/translate.h: remove TARGET_AARCH64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-5-pierrick.bouvier@linaro.org>
 <adafed36-b654-4176-a519-f6742c4eaba8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <adafed36-b654-4176-a519-f6742c4eaba8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 30/3/26 03:06, Richard Henderson wrote:
> On 3/28/26 02:50, Pierrick Bouvier wrote:
>> We need to stub a64_translate_init and gen_a64_update_pc.
>> At this point, we don't need to do anything for aarch64_translator_ops
>> since it's just an external symbol.
>>
>> We can now include target/arm/tcg/translate.h from common code, since
>> all target specific bits have been removed, or can be specialized with
>> specific defines.
>>
>> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
>> ---
>>   target/arm/tcg/translate.h | 10 ----------
>>   target/arm/tcg/stubs32.c   | 17 +++++++++++++++++
>>   target/arm/tcg/meson.build |  1 +
>>   3 files changed, 18 insertions(+), 10 deletions(-)
>>   create mode 100644 target/arm/tcg/stubs32.c
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> t~

o_O

