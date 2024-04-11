Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp181803ejv;
        Thu, 11 Apr 2024 14:03:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmQ49oplLcKprCA1rYHt18HxmebfA+N409NcSzUWs4r9r6d+KX4eSIP69o+iM5402T8SS6ASDlagO5pUp5iFvPQDMHDD4O
X-Google-Smtp-Source: AGHT+IEpCXYTZT7J/jDUWoA6zd+ZkkqFkGxuXdGjok66WzVEP+fTFE8rGSQVTnPY8J/dZ44ck8Hv
X-Received: by 2002:a81:a145:0:b0:618:5117:fbec with SMTP id y66-20020a81a145000000b006185117fbecmr627529ywg.16.1712869404029;
        Thu, 11 Apr 2024 14:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712869404; cv=none;
        d=google.com; s=arc-20160816;
        b=WAC3yhRjH14k429jfWzCdLt0rOz3OwZy3TCNRdUWUsG/WYqaB1TyJr+GmWR4pKSgnZ
         KwBGwYVn885zCyWJ9DxyUHEjGfik344olYxyN8e+xw3zeH3ov+aTyYWHeXkMuPGbynyY
         +O0DqnN2LBcH4bKQlvWln8syYRYD5fr5QQ67UIuNnDsIYMm0UouNLpBBv/LOTEA7Nv+S
         wM0KNg26WqDUuN6Cxy0J3LzLJqCO1mMoNcNvVqEXg75dEZ3glZop0uYpTCjDDTcEw2ta
         iQremGR6SoUKtabocYisvem0AU5AiVFbDSrx1Tqu6KCDDYePu0wf/CAv8/+mKj77LSXp
         Oxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UFg8LpGbWjJdewisFMaAdYQRct2RbE/pxC2/MCy7zjk=;
        fh=U4SfK750Fjk2X/ZXYAk8oW3rlobHjsvdc2B5xDD8tt0=;
        b=tJMCeKiRhLVvxeWn27J4Vn/1qXbDeli9nDWdM4N/ukHeYxHZ+qV34WsA7OVbsUqR0p
         KIRVdp1d9UdJaLOgSO+k2Sxs1eFpnTT+xRRwM2u3OF0KW8/beX3JoshN3AmHUx8kC2wL
         zCwtCK9tH2/FessLsGytzs0weo3xXHeYENeayqIPOwJoI5Jv2ZAUeopW4hdSLkozgKay
         I96WMM5YM6yQnQ5qh9qwfaKH48aexrjQRwOodta0tv4BHJNf+uROMU4JvlijTZqsHu/4
         9dIPPXGtUYEpZ9tTmIcazyF2ryaKVTcR3rPUgu3Ct2DwQIaW7xXYDtH4I+rDqjFfflEz
         zUdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F22gb/Mc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a05610232d400b0047a4138dc07si272789vss.735.2024.04.11.14.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 14:03:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="F22gb/Mc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1Zl-0002sp-Qg; Thu, 11 Apr 2024 17:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1Zf-0002sF-Qo
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:03:15 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1Zd-0007I2-1N
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:03:10 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6ed01c63657so286044b3a.2
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 14:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712869387; x=1713474187; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UFg8LpGbWjJdewisFMaAdYQRct2RbE/pxC2/MCy7zjk=;
 b=F22gb/MclihkerF5cJbCTmgPtyFiTE6LQQGlXAdUKGCGiSJ+xNWtWhMrsIf9cHTlqY
 /MektXC4pPOT23uMEtqDf9//v9J6ICUSVSJUpAj7xqi5pAtspzLDkwISQRv3vG4b/aH1
 jt7bZD2P7TJz2MpAF+AtCEjyvHUA+1xAvdpHc9EHsTAcnNezzUb39Gtp71orMgbkQRES
 kCRLVpNwTXsO/zaJVKTim5WnUMlKsgR4Vt76B1LfHTVHH8t4RilZFj/m+HqAeJ/JH0ol
 L3o3jmsxy9IG3bCVOuYaeU1O49BhZYJugIXVSLq1Rly20fvO4ploUNA2nuCclTz1x4yc
 7peA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712869387; x=1713474187;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UFg8LpGbWjJdewisFMaAdYQRct2RbE/pxC2/MCy7zjk=;
 b=AFlFSHSK8IB700MQr0E6B4hqvD3++mnoOw8euK6V3cnJpIj2MQFXd4cVGTfuNOS7rw
 FiQL02og/wzkivrJAW+s6WyWgIdddO2csq6RkFTN1jbxbW5HYCKJIGHWYN9VjvUAXjEE
 Owy2KiVCauXtjM3KkcDyo65Vuvk+S5J4MPcUH4e3fMfrvG7VxD1KmbV02M32ERUgSj+I
 lPSA0wX9nb/TuhOgeUEDQdOMLJw/c7CA1UxDVlmsQGtqihFuVVEZR4omMMH3DEvH23pb
 LUGm7ACVjpM1tGqTTxDQk3dFfg7N0oOYCP6KKdFr+geIXbUDeWZmlKp1Zw9+DqBd6bPg
 5xSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3EipwDQ+Hd3dieLcu537LNCJ1qyEd5E5glROJx2PGFjXQPh9DfcgnaCg8MYoU7Qvh4Lc0JL0fZlO1kkz+VA1M8xX7
X-Gm-Message-State: AOJu0Yy8k/Y5Pfk89OTZeKHdYegkRukl70JU4ylAFarQTmKlhdu9czNb
 I3PO1VJudoWmZDueh0Zc5b8FaAY15K5YfdOfoLfzuSo4y21VFTN0RdW53ESEwo0=
X-Received: by 2002:a05:6a00:1302:b0:6ed:63e:3525 with SMTP id
 j2-20020a056a00130200b006ed063e3525mr833129pfu.31.1712869387393; 
 Thu, 11 Apr 2024 14:03:07 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 gx15-20020a056a001e0f00b006e71aec34a8sm1599275pfb.167.2024.04.11.14.03.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 14:03:06 -0700 (PDT)
Message-ID: <b75c03fa-2db3-4dc4-bb52-a8b6f97fc0b6@linaro.org>
Date: Thu, 11 Apr 2024 14:03:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] disas/microblaze: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-3-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411104340.6617-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Jztp65nQaADs

On 4/11/24 03:43, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   disas/microblaze.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/disas/microblaze.c b/disas/microblaze.c
> index 0b89b9c4fa..49a4c0fd40 100644
> --- a/disas/microblaze.c
> +++ b/disas/microblaze.c
> @@ -600,7 +600,8 @@ static char *
>   get_field (long instr, long mask, unsigned short low)
>   {
>     char tmpstr[25];
> -  sprintf(tmpstr, "%s%d", register_prefix, (int)((instr & mask) >> low));
> +  snprintf(tmpstr, sizeof(tmpstr), "%s%d", register_prefix,
> +           (int)((instr & mask) >> low));
>     return(strdup(tmpstr));

Any s*printf followed by allocation should use g_strdup_printf to do it in one step.


r~
