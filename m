Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp323842ejj;
        Thu, 23 Nov 2023 03:44:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlY7uJQRXDDnyLXCq1ggIsU3K3C06uAcyaH4ut2nWEQRW24lQCXIL1tCUCUR76vYCzK5Lh
X-Received: by 2002:a05:622a:24c:b0:417:9c40:c606 with SMTP id c12-20020a05622a024c00b004179c40c606mr6407899qtx.4.1700739891517;
        Thu, 23 Nov 2023 03:44:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739891; cv=none;
        d=google.com; s=arc-20160816;
        b=Sfnc0HEzd7BhD+SrgutQAJgJjcHG5BgbZ0lpxsgieY9L2b4eLFm7xeC4UtbDKp0ycU
         y5gybJ9hg/diowkMWZL3gu7w0Pv+1lrvsJxAXLgjcnEmUGd4GconFQACXKtDuOHFujmq
         y/c94G9we7PHIrvgjAW+Bgc3qh4u3+uRJTMRGKCRgw07ZmVsx+AVyEz3kKRTjOKQ2Dze
         dm5eiLjK10AW+sAN7KmAcA/3/P372OjYJXwPKpLzTozaOZmpMsTp/4k9BlO0gWMxKYiY
         OoJ/vbFK7V4uNg1/6FWyWEvY/TgmyqGr6Jbv93++9D4EHgOP/w10Mf/7go9HZsw6FgKK
         h6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DyBumdY4oK4xGOLba13k7G2SW2DI2Gypm/xiew+OYA4=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=kKK4Nhq3AYxrJeXXfzAzWP6ZPcabh3Z48SVzFB5e+vqfajuPWMFXTX2OYHf4Bseq8i
         TrFtYXJV1Jzpjbco+ex0h5+LEL6Xe9zB9yOtC1ykq+1Nc7QKUR7dP1JNuifECUdA1SCz
         skCp7nIJwAiS1Ymc9wxcXhDPohPKJ96mhVwGlkrt2er9g9QHofG0XYGs5UPgx/SBwvE7
         V5uZgzaIY4nvVaYeKJ4EZd8BgnhClYX+Z5g3WsFiKoiBbG+smo85Xa8WP+ildXsawZV0
         I29Tn6iP4dRvOtutrxQ3VyHwnzua/1QfwHZMY5yMwftXssk+ZPfjpCrXYbMqBAV4TdDA
         BNsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDLvVyyi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey14-20020a05622a4c0e00b004238e53f8b2si618519qtb.236.2023.11.23.03.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:44:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDLvVyyi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r688Q-0003Dy-Ga; Thu, 23 Nov 2023 06:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r688P-0003AU-C7
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:44:41 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r688N-0006o4-UH
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:44:41 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32fd7fc9f19so487650f8f.2
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739878; x=1701344678; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DyBumdY4oK4xGOLba13k7G2SW2DI2Gypm/xiew+OYA4=;
 b=ZDLvVyyidBks6GSrgQGRaQP3r2HzeORfEigo2qq6+FKrAALaUTX/hrwF8eSJah14lP
 g3F/2nZ5j15BHvaA3ZkqyAfOSEsxQqzCu3gZ2M3XSDzvOyCucDGg13AVcB1hqdb70VcF
 V2Thulo3lB2N6hKBO5S2jv5vHSfCLsYUN8Xia+4NzUsluAGbfThKAyWCl1YacJdmCN4N
 xSHDEZ1h8ro7pP/7jT5atfIk3eVNbZHL18B91NoeENb8Z2oeCa6hs0JRRF2OERsoGPWT
 Wq6DZLAuqAUTXQUEsb1ojv0JZmNDjNkxjQUVJyouqtfiam1h0LUO4yx+c/8iOznL98m1
 xmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739878; x=1701344678;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DyBumdY4oK4xGOLba13k7G2SW2DI2Gypm/xiew+OYA4=;
 b=OvBGo8NBNI7jntFeHsIpTwnSDZ/dl3c9r47EhdP0Oe6xqEt+iXcLZy/SwcrXVq+zNX
 GTm9h6o+Z1pr/JZdQ19jrTmzxmWJ5Mino0Hh5kCMX+dbipWmIGR6eaizEDxFz2BfbwnF
 N2OeCS91LI2NkOVY8hyNXVdj0T1foDgUcweITSdXOtUFHoy+uQBLSc7wyX4N17U2ybcD
 KLTHfWFaQFNcR88e+e1unwtoe/86Rja7uiQCrPnbFfIggzfFU7aFHrnVwtlwGMm0ZI+4
 uxBH2aqwXNUV3TfResAd5vr3gKKlLR7OVktNMK88ChXSV7UcODZ5FdXT8iebihQxb+wI
 1J4A==
X-Gm-Message-State: AOJu0YxYBzq29Letk2x0rnfCAEPITpbnLCad3JrysMS0zUmUeKKcbMwp
 aaRvNrhJnmww48SCc17MDgw5pQ==
X-Received: by 2002:adf:e285:0:b0:332:d11d:5288 with SMTP id
 v5-20020adfe285000000b00332d11d5288mr3381752wri.46.1700739878093; 
 Thu, 23 Nov 2023 03:44:38 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adfa4c4000000b0032d8eecf901sm1455905wrb.3.2023.11.23.03.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:44:37 -0800 (PST)
Message-ID: <868b09e3-a191-49d8-9acd-a18453aad4d8@linaro.org>
Date: Thu, 23 Nov 2023 12:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/21] target/arm/kvm: Unexport kvm_arm_vcpu_finalize
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: VPZe56Mgotll

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 14 --------------
>   target/arm/kvm.c     | 14 +++++++++++++-
>   2 files changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

