Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp160730ejf;
        Mon, 15 Jan 2024 03:07:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBA3KY46ryZyJ1g4iFtMi31eXelvsIO2LjJH+g/f+2JNZhfjhzBkHHlzKUltiJxQaGuq83
X-Received: by 2002:a05:620a:223:b0:783:16e7:438e with SMTP id u3-20020a05620a022300b0078316e7438emr5677288qkm.27.1705316834460;
        Mon, 15 Jan 2024 03:07:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705316834; cv=none;
        d=google.com; s=arc-20160816;
        b=J687cfhAXxIe3ay0e36LkRkpP3ZQZligCKdSlzPkBIwVnXp4/0h0rmyY3US0LiuPQF
         Rg0oMKPE6HPuvgUMYDQvBIrXkOe/TOTLiVSfseKnxoDmn7rZUwIomwZk13dm3yYoJkWD
         EWVGls5+rSc+9gO2Qz1FtKtmuctHh16DF1URi27FdgukZ7AZzIHmepH/PUlVpTb0M+EV
         gun0NEMtqHkkM8CNcaoL7XUk5aUnKcRj1L7PK0msDOTTD0wmUyj7t+NtU+lURJHHhn5B
         bUobFv6fdgbKBfVNZUa2MNvJb1Z/uMFhvT/sPrh35cwONPwJIJuJXu1nblEnP90oRyG6
         C33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jJJ1XssqEEeqeEQ+1czPyZxou/Xjsx3aqQEkHSMvTYA=;
        fh=V7R4ErpEz/nA3AlX63XKPPNgnGlu9HUTr8I30UVGVM0=;
        b=yocGlvB6sGLbPc2K0ERY2yh1N6a5QUTJuiqw8RTPsP17Fc3It4IAwb0cpWzbwwyYPR
         6ggTl5/oHWbPCf6C0byqDsgVm84GtwEhPVQ65BV0jcMaaf8Cvjpd9i6YL5niS7tDWBfC
         fPXq7sX67LGco7C7IcmHx43tuYck+AbCXcHG4o9gPukH2Nzad0OFpBGcZlwSAzyDlKtZ
         1tDxd3PN3c4/9jqgJ4kJY6PyWfnKdd6D3x3IwIpJs8y/Q2Hz5Oq71hVc3LpIfZPr1Eq2
         VBn0zeeQZxJAQ6B0twVAZT13eNRtc6rvzEo17AN/Ku1Awfmx0OHEPYkKIRVvxh30gVN3
         Ly9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J845m/Ss";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020a05620a410500b00781795d5badsi8650785qko.14.2024.01.15.03.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 03:07:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J845m/Ss";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPKo4-000689-Ii; Mon, 15 Jan 2024 06:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rPKo3-00067q-R6
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 06:07:03 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rPKo2-0005GU-78
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 06:07:03 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2cad931c50so303944566b.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705316820; x=1705921620; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jJJ1XssqEEeqeEQ+1czPyZxou/Xjsx3aqQEkHSMvTYA=;
 b=J845m/Ss0Y+X0WkXbVYb3iFc9BRSFBqXH9cpST/4r16tQSDt+v+ezMKwi6z+7Y9vgP
 Y7XqDWNcMe5QH4Lolr+r0XFMem1mbnUTvkjeDoQkTakgGmtft/PJvVTmht///CvbzmDd
 XRJ0HiG/Oac8dARywyN2XRcQpUCCIPm7UsJkhCQ/Cl/Vqru8zd0j1l0hPcY2mA9HPos4
 yixxarsWEz670OMsrmLz3lqTET3KP1n0gCqAY0LEenkFXAtgR0Bx26Z9aYlMNb4dtzM8
 EwVGhWov6FaATToBxnnMw8ASU2dTYmddUf0q7w1knoalCRxVAZ4jhSMZ6QrlSMevc/4F
 yEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705316820; x=1705921620;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJJ1XssqEEeqeEQ+1czPyZxou/Xjsx3aqQEkHSMvTYA=;
 b=XN07M7N2yXvMNwmh5IM5yJsm5CZ1rncmBQfYyPin/2m7oaRzIV0GrWu0xSVkl1zusF
 4MzmnpqRMOYc56anBHTysUsaFIxb6fs+CIwzQ2FygvcN1/59mA3P1TH1AM/dbnNqIi2P
 xG20sBUvQYJ3HQXbZRy2H32aO+mrPbnFREgjzJsl9vXV49xzQ+caK6txhvBlfHda8iha
 Cb2Pg00JdFbuxd3r6GJkmV0JKsjdRWfbkGGyqjgz5jIpPYEkp01IpunY+MdOfnbmQ4Hi
 OGMsHw4wwKwNEx80KwFUhK6lCnW31OCsjGkLRHRikSoZkvY7+lVuOPuWa5SLvBKaIePz
 FyGA==
X-Gm-Message-State: AOJu0YyJJTd4F+DjiFAtYwhsQ9aO5KqwtXRMuHMCR+iOEXCJNp8UN8Mb
 CiYi84m7lea9DrKL/DDN3DXon25Iw71Uo5D3aX6M28swmII=
X-Received: by 2002:a17:907:2cd2:b0:a27:e711:8b7e with SMTP id
 hg18-20020a1709072cd200b00a27e7118b7emr2174637ejc.106.1705316820630; 
 Mon, 15 Jan 2024 03:07:00 -0800 (PST)
Received: from [192.168.1.102] ([176.187.209.30])
 by smtp.gmail.com with ESMTPSA id
 vs7-20020a170907a58700b00a2caa85c0c1sm4253888ejc.30.2024.01.15.03.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 03:07:00 -0800 (PST)
Message-ID: <5e0b0da5-c737-41c4-9c8e-52450ca14af3@linaro.org>
Date: Mon, 15 Jan 2024 12:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/arm: Refactor struct arm_boot_info::get_dtb()
Content-Language: en-US
To: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org
References: <20240115043431.3900922-1-bin.meng@windriver.com>
 <20240115043431.3900922-2-bin.meng@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240115043431.3900922-2-bin.meng@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WDMUFtD7jFlE

On 15/1/24 05:34, Bin Meng wrote:
> At present we expect struct arm_boot_info::get_dtb() to return the
> device tree pointer as well as the device tree size. However, this
> is not necessary as we can get the device tree size via the device
> tree header directly. Change get_dtb() signature to drop the *size
> argument, and get the size by ourselves.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   include/hw/arm/boot.h     | 8 ++++----
>   hw/arm/boot.c             | 3 ++-
>   hw/arm/sbsa-ref.c         | 3 +--
>   hw/arm/virt.c             | 4 +---
>   hw/arm/xlnx-versal-virt.c | 4 +---
>   5 files changed, 9 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

