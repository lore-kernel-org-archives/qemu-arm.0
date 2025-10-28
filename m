Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8838BCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:45:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDi8M-0003Vd-Dj; Tue, 28 Oct 2025 07:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDi8I-0003UQ-8l
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:44:58 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vDi8D-00067V-KK
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:44:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b5c18993b73so1018952166b.0
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761651884; x=1762256684; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mk5i2be7EZssQLJ/1l17wpc5az1qu4wnupbq88AWFYE=;
 b=LhDiVIrO+tAfAbZMmgJpcCapxhXN0/fDjFXwbadXwIvln0PtrnqGQ1IY4mVIaoFA5s
 FTmyG05wawMPmKIxCe5dyLayW0Gn9oh3l8c/1Mn88CCL3sZ70TGmTpH1fI4YoiWDiVCI
 mtnAQXiDsBqh2nZ1LWRDiJKB6/ka7e0t9Uy6+Vy/w+K79n3D6BJdfUqZHYZXzf7JcA1a
 C8/gwPDCYRTlTsT7OCjDZCQLbDAsdWyP/wbWzzPb/2mIv83fDQuU7Qsyv3bOcYrlDbcR
 6HOoLpulw7pA5pmUtGqtgWCpFEsL+Pw/idLcXhDJc1iGfmSrexsSbDJP6ihnPRto3igi
 zsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761651884; x=1762256684;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mk5i2be7EZssQLJ/1l17wpc5az1qu4wnupbq88AWFYE=;
 b=dX7yKWIrdQruFa8UoYlYXsBkpPNrb7TMh8grFSmyir5iQ55EW2LyxgvXbE3CQ+tuoL
 WQT0crKyXLITB4mYLT1nVlvnZ4cbWaLNO3QuvNUrgZeIWF2uzkAkfch1ncfREQ1JJEFO
 SXSGCuT7qMJ22YrLhEik1l/R56WNkCHlKIDopO6w/2y033Q0u7zifuAEVONUj/FTdq1z
 HMqrWrCpExMB85p/N16v+Jl2xJD3w2AXGXuSK8YUJl+3iYQFFz05kTGOUqlGeGbn6w28
 S173mIQjrWG1gklYEbog0bhrVu9zOg2oLHQXUE0IZAmoYk0lfeSEBzwRkEYTlM9Qo8ls
 FeFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUyP0mejOh9NFbiS/E5fIXwxY1umu/f7BCbQpXD5gUTkuIvIKWFYXC9cPyn7Xk/oEF4Ypm/iAfsQ==@nongnu.org
X-Gm-Message-State: AOJu0YynVFgtunRHezkuKMp+ZFAMpmgS7mBELrFTPUV3TrgjB3gng+my
 7lThKK1ZEFazzGZ0NrtNbw1X1uH1FRWvOm1Fu0eftSJxUM0/reoyPqm+c76G7WvJhQE=
X-Gm-Gg: ASbGncsqaP8llbXY3DPly9C+QF4Elk4xmk5ofk/Q3tuzocQf+wMDofy27SUFO437cvS
 Wr1LlNwhzcOWtqb0mpVDLU5uEoTj6m5xX8clwim8ff7K7Z9vGSsIeU9W42NuI3b//VPS2uV0Usb
 YXmRcibOiL1GVrqqZ+FtmLh7vihB3UtaaxL3EoYDwMiO7VHElrJ5KwyVWwmfycn+tEgTnXHrY8G
 25zTLsl/rPI9pluLEX0lLqV0fHu+QCRkje5pC6VeeBEqFZgCAI8zWVKBC8m9do5oHr5gMOmq1pW
 ZkccfsN+F+sPeEU0oJImZgUDAzdNtpLUaJJSQ1gZCNbwwiVX8IrfX3UyU36BtNZFpYgopSs5+gW
 Ult41XnHp4RvYMIkaJ8mkZvfe5eGmNkWhX/sZ3dxkJ+h+lm9UIm3jD6+aHvnQyHvga7jWIcxIno
 G/d6pUwasVks19GRGV
X-Google-Smtp-Source: AGHT+IH0TUavLg0vZIia+x2IXs73pUR162RJh+Ciodcn7fHTqzh33pG2sJtHgdOiuC+jIgNRgS4ZBg==
X-Received: by 2002:a17:906:f58e:b0:b3e:1400:6cab with SMTP id
 a640c23a62f3a-b6dba487a3bmr350894366b.17.1761651883755; 
 Tue, 28 Oct 2025 04:44:43 -0700 (PDT)
Received: from [10.240.88.227] ([212.144.248.67])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8538478fsm1075342066b.33.2025.10.28.04.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 04:44:43 -0700 (PDT)
Message-ID: <635a923b-cfd2-49ad-99ff-dedb26ebbe58@linaro.org>
Date: Tue, 28 Oct 2025 12:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/59] accel/hvf: Enforce host alignment in
 hv_vm_protect()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-33-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251028054238.14949-33-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
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

On 10/28/25 06:42, Philippe Mathieu-Daudé wrote:
> hv_vm_protect() arguments must be aligned to host page.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/hvf/hvf-all.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> index e13abddbd9c..2efecdc9f40 100644
> --- a/accel/hvf/hvf-all.c
> +++ b/accel/hvf/hvf-all.c
> @@ -11,6 +11,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/error-report.h"
>   #include "accel/accel-ops.h"
> +#include "exec/cpu-common.h"
>   #include "system/address-spaces.h"
>   #include "system/memory.h"
>   #include "system/hvf.h"
> @@ -67,6 +68,8 @@ static void do_hv_vm_protect(hwaddr start, size_t size,
>                            flags & HV_MEMORY_READ  ? 'R' : '-',
>                            flags & HV_MEMORY_WRITE ? 'W' : '-',
>                            flags & HV_MEMORY_EXEC  ? 'X' : '-');
> +    g_assert(!((uintptr_t)start & ~qemu_real_host_page_mask()));
> +    g_assert(!(size & ~qemu_real_host_page_mask()));
>   
>       ret = hv_vm_protect(start, size, flags);
>       assert_hvf_ok(ret);

You should call qemu_real_host_page_mask only once.
Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

