Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03533C982DB
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 16:39:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgmqi-00040F-Qb; Fri, 16 Jan 2026 11:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgmqh-0003zx-Mh
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 11:38:59 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgmqd-0008FJ-Jg
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 11:38:58 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b7ffbf4284dso298495066b.3
 for <qemu-arm@nongnu.org>; Fri, 16 Jan 2026 08:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768581533; x=1769186333; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x4Tc973jOTHABPnQERVMdDzMxzIQZH/UhcGyjpS8qMk=;
 b=pDHEJGo8BFSumjteebPoXWfTgwvsxkC/vD5egWNDO+nyoj4Jvh0OLzpb0WhLL1l6LK
 8rILhb3kIXzOKQM6yVnwyJ1/VSGi0GLGglHdS0S2EuAvYH/67giQ2BqD3S6jyquwQ4L2
 8pi0Ys6suv7GMtMZwnVv/u0SOHCJZoh8KEw5zELHta061RmObncpV7+B8YswkO83R4N2
 n3VmmH/HlEJ2Ad34LhKMTOy+bBG1o9ILSzF4a0H6s+bkT0tw7eQTG5MEpfr5TMzOOG2A
 jTS0Czd2QDRmm4eJwItzOlfhVmoS6l07Ox9ZSQq/d27SdYpuZ5HRRWibc/FPqYpkD+WG
 RQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768581533; x=1769186333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x4Tc973jOTHABPnQERVMdDzMxzIQZH/UhcGyjpS8qMk=;
 b=OKbqw1pJFpv7pSpYMTWsEoXCNatOjtB5IYz/K0aakq4qRlQj/ewvHg7pIU6e3md+ug
 HDBfDPb8GpzZ98wSIuPBiFeWvYXFgg4FY3KfdM8dWIYLkc2UpizjnNT3asRo99d2n4hy
 Mhye2nv2RjPtZUl1KgAeT+q19h3W6KzhMDq2hoEoVsYyUsjxvbq84kkMbchnvpcphIBy
 wO/dcAar0NlYua0EYET54NjdiWnJ7Qkq2CVw8iHFXYsIo3i+/n3T8xSR7bc2V4vQJ4Z8
 Yz35Dob07GiYOQtAB/xUV0JBhyWGDBoFe/WkM93iRcdhTWW+RUFtLAjItqMZ0thyTXkv
 OUfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwxsAGkmzEERxDBaETkDj7psAl7MT7coYq/QSdnSWfhRSl93VNOrj21TXJQ33+4ey2CL7p+6W9+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw6yFGUaWTcrBWG50fGcfcEVjrCQm2YhwpAjjSnh2xtq5cpAenN
 7zUPho6GQv7nUu3+YSlvAJQLgDIMLccQQP9vAyjcHy9n4lKRn8xZEEOEaTTYwUrBamg=
X-Gm-Gg: AY/fxX6fFiQJpmP/k7lsrV2rkHKrZ3SH2VXyAt5dk+YWDLtm35H8Cos59jVPXdefd6Y
 VmjzC8UeV27M37UcFQ7jpiWLdsPEBIQofmUloKv5JtXCX1YhZGei2VKLf/PWmBwGP6643Tn2/JU
 mu3U1qMjxKQX2Y9FdhAlY87QFymsYPjf6Sh93C8hyZZkpOY0OsKoTDWyNliSrqXy0lTNdwpU22/
 KCrZE3IroEUN2PIvo2znymiYU3Bb2v7DrUr7SdpdAew4eVFlmvhmlTcuMTRd9Sgmy8RBri4PQ1B
 CSkbFISXHQVqdPBsJCJpgZgMFNUSg5AAdYLOoFzONK6AO1EGqKlX8W+4O3BsrWfDB0DB4tDT5Xp
 1192aLxV0EbePQQzalV72tk2VU1B9iBzDe9s4WjEL7y9DI78Ec4SbjbtnRatmfYeYe2594XGlRM
 9OIpyVua2gH+stANS/Ca5/gz6VwM6jLa1+XDiuRl6Ns4gr5HV9Bi5UBw==
X-Received: by 2002:a17:907:930a:b0:b87:751:6f21 with SMTP id
 a640c23a62f3a-b879300b515mr326634066b.36.1768581532631; 
 Fri, 16 Jan 2026 08:38:52 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959f6e74sm277303266b.48.2026.01.16.08.38.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jan 2026 08:38:52 -0800 (PST)
Message-ID: <bb2418df-067b-4686-8118-b7a40325b732@linaro.org>
Date: Fri, 16 Jan 2026 17:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 26/26] MAINTAINERS: update the list of maintained
 files for WHPX
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-27-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116135235.38092-27-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
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

On 16/1/26 14:52, Mohamed Mediouni wrote:
> Add arm64-specific files.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9127a82ec3..f03ffe907d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -565,6 +565,8 @@ M: Mohamed Mediouni <mohamed@unpredictable.fr>
>   S: Supported
>   F: accel/whpx/
>   F: target/i386/whpx/
> +F: target/arm/whpx/

  -> squash in patch #15

> +F: hw/intc/arm_gicv3_whpx.c

  -> squash in patch #14


