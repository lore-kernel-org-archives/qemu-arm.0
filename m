Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2234550ejo;
        Mon, 8 Jan 2024 04:03:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Y05cPMb6oi8cgQf2MwJkZMCSuqnVMXVBcbvl5RK2gQlcwJiI+0cHPeBjBexkWpK+12rc
X-Received: by 2002:a05:6214:488:b0:67f:5784:bf26 with SMTP id pt8-20020a056214048800b0067f5784bf26mr6435275qvb.47.1704715402331;
        Mon, 08 Jan 2024 04:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704715402; cv=none;
        d=google.com; s=arc-20160816;
        b=pLwg1pSI2N6aZJCVuAQaXWB6va2b9ZiuBBaoFR/IikF7FwPV1RBr94mdcgBqTp59b7
         jraZgyfPMSF9Ws7M+SSIuo3pCkS0EBmEakVbjlqPPb3TeJC86/FVWweCWQIx7MiipzoZ
         cPKM9IVNY4T938xHNkOTYv9HdNBxNSnzrW5dPURJ8uCo5cp2DOskjzDWVUPOLCBfov0X
         FoL1p287x5LbfQve30qNoLVsBUTMSrx3HApB8tSRwUcY86ITPUrsA74bGrTNfKtXB+xp
         d95vhWdB7asly3y7i79osCaavHkszlV0x7bYjnCPuE9xmEVXFHhrvdw+zbFoYSXTXygm
         Aj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zpymm/kt3CHzXmb7fCv0GtjP6/svBoF6IF2skQ/PclE=;
        fh=2fVZqZt1+HwIA6QyNWBW0YENHVKwH6/KbylVC4hHYL4=;
        b=PDlc3IkpG3hznbJwYOthDQT4VNWC1pYN+0/qu1g4UxZeYxJ6Ss38bTWWEzQG4USzq+
         17vzb3TgRqDxP0wlg41tKSUrFT1Z3XC8z++VpE/f6gJz3MFtDDRRVHikhy0l9zHn43cz
         magyPqluFmJ9F18onJb7frKQQfsYZeZytXVxOQRadcLjZenh10Oh9rpesdlmrHnjQSr2
         odIsIhobuy1nU4FEhT+ws4yk9jAL7V/xgooG4Fesn17WqeN0HkJlb8d5b6WUs9j3Kgcz
         I1pgxHMu93GJEHfOhajeP5KcQtZEh/OnSa87E4w5+kdHZ66DJb9Q8V+UiieW4n7vPDhL
         SyqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nus1EJW5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a0c8e8c000000b0067f85fb3dd2si7652560qvb.465.2024.01.08.04.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 04:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nus1EJW5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMoLY-0001h8-0N; Mon, 08 Jan 2024 07:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMoLW-0001gr-Ie
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 07:03:10 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMoLV-0005br-2Y
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 07:03:10 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e461c1f44so9919395e9.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 04:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704715387; x=1705320187; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zpymm/kt3CHzXmb7fCv0GtjP6/svBoF6IF2skQ/PclE=;
 b=Nus1EJW5PtDhVmkZVmUOwTmtEO4w5LsJWs88dHd8qt1h3Cexl7R+TIMaaLukV/7Fay
 p+0VjeN8HQ1GOP/PWOElCKxc4ng+2s9ceAWrlnixMWAywNMfauSm4pmmgdw5r0/2JOYu
 ReKhwb3AlLFxXO5yKlW3/t0wq2CPS8+bcagyprNg6o74JPpDaJRNR03CEjYg2E/fcckW
 5pQgcSPML8lqQ5bb0TsUyqocJaIC/lqQW4s99nqdbDb3XfoTSX5DHA4udd3LkdjrR0dH
 Vevv/1Z7q85Qvvyg7czpumePDXd+qzeChQSQoB5RjblxGl1aBbgq+hO+zvY3yZrRDETa
 tQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704715387; x=1705320187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zpymm/kt3CHzXmb7fCv0GtjP6/svBoF6IF2skQ/PclE=;
 b=RxYxGH7/ER6i78K8rkKPpnnFCogKqvjq3QBwWJVr4R1g/0T6OvhfXK8NcmL+mwONzN
 oe+EqqZUC1xIYZBYzezLnrP3uCQiBHn/77PjwTjs+EUQ/wrbIjp63gCXe7VX5+/m/J3b
 wBFfmBBZlPY3t0QNJUOM2gpvq9pfmAdKDSA/TuzqD1Udoj3IjRYiE2t7XHTbyD3yP6Tq
 89jkDis8Or0PfBfItwJ6E/4OnvZIkbnsTobIXUNucWEYVZ+t6UZQyw/GE3A8HCZYxzrB
 49RxUa2R7DvGQNrtyyPPd4FjL5i1iQtPWXbgxY1t0fc6s/JwmVtP5IHv00Bx/TpuTQ/w
 qVdw==
X-Gm-Message-State: AOJu0YysMllJDiMhMZn1HR7hmcqLTjEP+Req92qTavaRg6hiFfc65e4o
 jDiJuHxtXyhLZGFsGLmh7Wp99oiEZzifFQ==
X-Received: by 2002:a05:600c:6907:b0:40d:88bc:a896 with SMTP id
 fo7-20020a05600c690700b0040d88bca896mr1859077wmb.62.1704715387557; 
 Mon, 08 Jan 2024 04:03:07 -0800 (PST)
Received: from [192.168.1.102] ([176.176.175.62])
 by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b0040d6ffae526sm10813708wmb.39.2024.01.08.04.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 04:03:07 -0800 (PST)
Message-ID: <0ba00ce5-0b4c-4e43-890d-9ebe6ecca6bc@linaro.org>
Date: Mon, 8 Jan 2024 13:03:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] hw/arm/armv7m: alias the NVIC "num-prio-bits"
 property
Content-Language: en-US
To: Samuel Tardieu <sam@rfc1149.net>, qemu-devel@nongnu.org
Cc: Anton Kochkov <anton.kochkov@proton.me>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240106181503.1746200-1-sam@rfc1149.net>
 <20240106181503.1746200-3-sam@rfc1149.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240106181503.1746200-3-sam@rfc1149.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: WN23mkvPwqV6

On 6/1/24 19:15, Samuel Tardieu wrote:
> A SoC will not have a direct access to the NVIC embedded in its ARM
> core. By aliasing the "num-prio-bits" property similarly to what is
> done for the "num-irq" one, a SoC can easily configure it on its
> armv7m instance.
> 
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/armv7m.c         | 2 ++
>   include/hw/arm/armv7m.h | 1 +
>   2 files changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


