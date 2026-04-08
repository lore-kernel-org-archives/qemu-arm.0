Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C0F10F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:37:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYcG-0005lj-Nx; Wed, 08 Apr 2026 15:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAYA8-0000tY-3C
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:02:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAOMZ-00010a-RV
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 04:34:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so3552564f8f.2
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775637254; x=1776242054; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UZhlEHU+bENR8VURxKqyDA9WFdD20Y0dP5ryc9G/KCM=;
 b=aKQBdye9Zx6unLGGxEbiwT1zz2kSoPb6s3CnbMSbQxA9pYq1zIzHaKLoR4RazdWXPC
 nDCYqOvxBP98tU0/oY1O1OGfkKi+9FOI/tbhIqVbMwvD6iaQoXDG9kwPkbXRCt7uUEaZ
 wlLA5ID3/jkeu5iOXaPT3NMXk7Qvut/rfG/ubAcF691foeQB8d0TPU7AM74RVlboVvzK
 2ClxgixdXm2wbpfelSC+0dyuYEUbQFwz11Tvh4y4ToFPZjbGFuXGVwxDcv6RGYq4FPvc
 /gkBG2j6Ux/X5B3z66Zks4uGSkfg7nw7+1K1+HwwHDBcE+tKCcayCJlkg+d5+mIpTA2B
 himw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775637254; x=1776242054;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZhlEHU+bENR8VURxKqyDA9WFdD20Y0dP5ryc9G/KCM=;
 b=Ne78/9lhMeGC2FRAwEB5cYj/95/cKpKl1Dbt+J025kIcI1LEQ5FuoJrWWOx7oMUK48
 rCMYKdQehrrjgVPD7BB5MfjuRq8+3gyWT6OtUpjS9+otMi4/hsXJKsTD8/JWbpyEfZMb
 ymnajldAdMsqIcQabr3EEVSvXXLm+dOeUq6WMuXiPNO7KXsroOEnvJIZ5dTLf0SgtsCC
 Q7oF8YRvvQ206kz9WW0AxhGje+TH/r0Z0sGVqetD3Je2R6hZLIbH6nDcYJOBN2QPiqLq
 8AjxsuN3h6KYxTJYUsKAj6U6I3mAFBVISalaZQrUDI62bLIoQ6uXFOe0qInJVuwhaxdA
 gHRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKG1jGnNCgciEIRHi5rU8NF19T1Z588RjswnVPlevsbOTC3rC2sLMfrrltFtExxU4VTSe9O89Mig==@nongnu.org
X-Gm-Message-State: AOJu0YzHQ/Gy3p4Oy3LpwNoy9zvn9scPHApFTs7ryhB3JHCoJ/Xt9UZS
 eSWACaoQVBOpb5hBz02mb6VLIx6Ge3Gi6vMPtwz28HkzH3usnsOt/RrLgbur9ohzWI4=
X-Gm-Gg: AeBDies+LBWFCT7mwf4dI2k/Y0djkvgTsItz+BzDDDrcTm0vEby2JK3dxJb9IO3ncPE
 wAU2uRo3oUiz/oKpdXgd4FKdo7g4WUJnhZajMIghRvDl+Lp25sx3CVTGtiWysIp8JurzGMLeGXC
 BNZbNaFBVGBBy/LTiHU8dopnaf1Rv1ZmC8vThIK34KydTOhjH/djIk66FSz6afHJC5eWKk4hL2J
 XVenMeoW9Vw5wLZ1NBKv0qANyp0RUe7reevO4cfBTm8TiJBmle71kzXkV8PCzfU1sO7w5f/eqmq
 ZhEiHBFysPh59n6U7M5FYDCrzzsJ2pBJS80YG3YWTUzYyo8RxeeULCcEuHP7byh1exMkvFhNURu
 /VyTlY0jRdmwzod48kz70wTe6Oi7hjq9r8kA+wG+zs9nq/bQT2EntXAF44800wj4KwweaDK2k/F
 c7OTPhC8yr6bZvF/WutnBUD0nZoNQrDeVPBWpcCBc/ggxF1Ct6W4RAdytNjflv8M8QEA==
X-Received: by 2002:a05:6000:1869:b0:43d:dd:8cad with SMTP id
 ffacd0b85a97d-43d292cbccdmr28207761f8f.32.1775637253997; 
 Wed, 08 Apr 2026 01:34:13 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d282esm56142130f8f.18.2026.04.08.01.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 01:34:13 -0700 (PDT)
Message-ID: <63521e31-993d-4838-86cf-a8bf7c4b07e4@linaro.org>
Date: Wed, 8 Apr 2026 10:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 19/21] target/arm/cpu.c: simplify endianness handling
 in arm_disas_set_info
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
 <20260407222208.271838-20-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407222208.271838-20-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 8/4/26 00:22, Pierrick Bouvier wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)

As per v10:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


