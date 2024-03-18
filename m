Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp760084ejb;
        Mon, 18 Mar 2024 09:32:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZSGsHnnvhgtXSGHXJEH0L0YKx6vCw918AHJKSC3Ju36avgUKGhuaWKULYXOgoUfArmBZlnnFYIgKaeHhVHNoRnLY47MaX
X-Google-Smtp-Source: AGHT+IEvnp89dkXNDn4lWnRqQTnCloOjKcqeVKSlmq1a/5ToiiCQDYY+VObQAEqWp+8COsBaSQF9
X-Received: by 2002:a05:6830:dc1:b0:6e6:9a73:c169 with SMTP id bw1-20020a0568300dc100b006e69a73c169mr1679710otb.35.1710779551049;
        Mon, 18 Mar 2024 09:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710779551; cv=none;
        d=google.com; s=arc-20160816;
        b=Xk1NsEyS15FAMLpbTttbvVp0fN6iB2uzBTg4WMfxUcGhXswbMP2JOa/jj/w37qWLGT
         i70DTYFpS3ICoUmblyxRcxpwTdLNTPte6NRQvO1t+VrzpWbXBYw6RcEnShR+wJpmJrJn
         McyWZCyb9lrW6p2q40M9+3jy5EnkSzxYmSrDGiCkhh7e1VEz3Jf2B2t0hqkKg9MztI6G
         txgXD6E/RFwwMrHgE6vIE+LChq0aKS0b/Ui8B4nCDwNtU4G+Er9ulA6Pnmiw2pMLI5pA
         qaBuTLbF/IYtTwjU6LlIGAia9tcXkhkLbc/JWS0Dw/ZSX4mtIqfySkBOgwOfavB7LMN+
         mg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pDJ0ibNF1M3ekEACvkUALcVoaI0Gx11RdJxUho1aJ+Y=;
        fh=i29y86SK6PvGuRRP9FY99l2AdItqTuMuogZGpWLiC3Q=;
        b=Zhx6pT13Mka97ZEXX8DYyFB42a3aPbd93gp+6l3K87GEdEViTCT2NlSyJkCvBk3Bx2
         3rqqrIm3523VFG9EN3rUqHLdaq5dBz9YKtvTJ0uls06Tt+NENMJEj0MeMOfJ5Xgelj76
         IPnXiZxynni8OZ1F2AL1BNv2nBXnCUzt6NZpH1kq0WZzTLlpvnL1+eiva/OSoI6jDKJC
         7NE+/lpwgrVSah5v+sEjE2fTCF8c0F2WzgZ6IRkTyVFW94kuSaFpQU4E52NGnLO4vnUM
         CY/AyyXybawO2X5jXsb4EKq0kCCr032mlALn28+Pi9db30dITmXNxXnNolFR1vVYVDF8
         mFSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0PncYlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a05620a244100b00788637a3f35si10489986qkn.707.2024.03.18.09.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 09:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0PncYlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmFuQ-0005Nh-V9; Mon, 18 Mar 2024 12:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmFuF-0005IX-Ud
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 12:32:11 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmFuE-0007g9-8F
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 12:32:11 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-341808b6217so324491f8f.3
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 09:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710779529; x=1711384329; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pDJ0ibNF1M3ekEACvkUALcVoaI0Gx11RdJxUho1aJ+Y=;
 b=m0PncYlmLu2khyg607053bOBg/T2KjjQndrJ23OILjNNGmPdmo8n7efnOJmb7g8inW
 I/8J0zldXC9rHuo1YsDfvLRFXbW/0mJlu18c3uuX0gJpk0+xctU3/PbIIgkKGjeYRh1P
 IH6ucPmfBFLOf//k+liiruJYS0+RV2OmgxMXai3ZcvfXjZSAKUIUDysn7mMZftT4e0hz
 EEh1Mz6dfZd8Cs4TBJ1YsNLN+RGDfuF0mpgSaR+lmm6f1ojUHrYaSyZiXycpclT2WmHp
 b/tl7BGBa/p6WYyjlDIwy3Rr0AiTVPR2MhODaicp+XXpwHFE73GDRNkjckX6w+eAmfi+
 XcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710779529; x=1711384329;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDJ0ibNF1M3ekEACvkUALcVoaI0Gx11RdJxUho1aJ+Y=;
 b=G/KJj1kp32RjsDlqBbbKz+++XPhr6IMEY69JwXqshHUfKkJhrZrgwZRf13JW/CTTyg
 bY0Ok9pJX/2yl1SnHAj+FLf8DYyc1DasvXyYxG9WwkjCrYE0UWlwxswkfDW//r27epCy
 Ecmviv/oAoWmK6rIPNEkJBVIrIoGT47Clfwqol+i6qzhUTh51L1JDH7rpbnvwGsIzo+q
 4lyGKjuEyY+1pE15g/yyORcWy3oKtu6822JUNQuTaE+qgGgqeV0Niq/lLc8gEr+/423u
 okxaQvuqpDH5OiV23lnj21zXyuEiTVeq39zS/FsyBBHATtYTGn+qnAQIvoIh2EF/1S/U
 olKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPUFkRsGcdKOU1eN+MMpMR1WFVlVYepN83hAqHoQu6VPEfVMobL9fREhRGRPljaFnMBYKYcK7vJT6RdqYau8YFJXo9
X-Gm-Message-State: AOJu0YxZV50UfXVwn38UllDaBSSUVPxTe8EguUA/AZgxLG0seybM0LFq
 ycyuXbidS9odMWgMu25JAVWAN4UT2jZKM71gVFzOXY9SNTEqfYY97XO+yKI0e9s=
X-Received: by 2002:adf:f350:0:b0:33d:746b:f360 with SMTP id
 e16-20020adff350000000b0033d746bf360mr10035922wrp.51.1710779528722; 
 Mon, 18 Mar 2024 09:32:08 -0700 (PDT)
Received: from [192.168.69.100] (vit94-h02-176-184-29-165.dsl.sta.abo.bbox.fr.
 [176.184.29.165]) by smtp.gmail.com with ESMTPSA id
 a26-20020a5d457a000000b0033e7e9c8657sm10163161wrc.45.2024.03.18.09.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:32:08 -0700 (PDT)
Message-ID: <ab0fd2da-bbed-4f04-9829-b6a7841b1f36@linaro.org>
Date: Mon, 18 Mar 2024 17:32:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] tests/avocado: update sbsa-ref firmware
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240318-sbsa-ref-firmware-update-v3-0-1c33b995a538@linaro.org>
 <20240318-sbsa-ref-firmware-update-v3-1-1c33b995a538@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240318-sbsa-ref-firmware-update-v3-1-1c33b995a538@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: CBpFukql/gol

On 18/3/24 15:08, Marcin Juszkiewicz wrote:
> We now have CI job to build those and publish in space with
> readable urls.
> 
> Firmware is built using Debian 'bookworm' cross toolchain (gcc 12.2.0).
> 
> Used versions:
> 
> - Trusted Firmware v2.10.2
> - Tianocore EDK2 stable202402
> - Tianocore EDK2 Platforms code commit 085c2fb
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 40 +++++++++++++++++---------------
>   1 file changed, 21 insertions(+), 19 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

