Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4176543ejd;
        Mon, 22 Apr 2024 04:24:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtFbu282f/X1ycCIbTPJ61UWNiMrHiM1cbbPw0jfILRiS2kjrwqSM27SfBAvUgR2coeMkPgHc9QsSSQCWZlUy5o+jh9QFQ
X-Google-Smtp-Source: AGHT+IF+U8IVBQrlLrw8C/gjwGiTRCGn5DcYE5dwSQ0h6WD4K4ngD5Yl+svXnIUTUsasdgrdHNSL
X-Received: by 2002:a05:620a:521e:b0:78d:5f1d:23bf with SMTP id dc30-20020a05620a521e00b0078d5f1d23bfmr10082400qkb.29.1713785072661;
        Mon, 22 Apr 2024 04:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713785072; cv=none;
        d=google.com; s=arc-20160816;
        b=iVnSBV2+ey67xjtDXCGnoOMloEOY0yiy5ue5khS0/zgMWT2HeD04ozcZmvU7H1Ms5d
         OO56Uc9nS9EfLYuHmaFQVDYYbxWo+pCES0AzX7yK82fT0ZpTbHpxDh+mhd0QZgu0FOCh
         pu1AL6BmDyTNavSmfDFH7mRf4pxwxp2/79fwjFzJ0vu8UTyT+tESyoLqsDRThQK9MH2Q
         JAEWBMZeJ+CXaF6ugTGmnGb7cu0nef1S8ZIsHcQRNVINiFLFc0NxxPrJBFhTssJstS5/
         1+DPlfeLZTr6yExe0/LwcZd5OOYIZb6CuS8WxEbLfWaqm5NyvFOTKYBbFFxvzUJTjQ9f
         Hr5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4zSmrIlgHV0Vw1AbLT6ZWFHT7n9hH21z64JC62MO0XM=;
        fh=7GhKSgcqwxIpHcad1S9IjQycKtKpPNc17BW6pAdfq0k=;
        b=I6ugeMFNtWgPwW/igJnL6J/C4HmK9GyCwLDXNZukkPcgN1vg5XjpUEZ9pj9mHTVZ3s
         QRV2SP00P/PwiLJuFED5kJrvsjLOZnIm6hObPQmEzhLiHj7B2jAg7rr0Lcc+1lzc4xRm
         su4+MDIKbrRQAfbjRF4UwrOInqQpZo+5UgtUN968hpyeNH6vAa6nOLxJoYqThHE5Z8vo
         q0o5lmiyU5yzm/p+IXmtYI3FRl12+FAqdttysCz06HSQt/bXQ/tG2T7x0iHhw6qgNROW
         nRgZxRPUyB/6plQPsD51gZNjCkRRceXpcRiD96Kuh0S9X7OiVxRYLBhEkTuechBoUmxd
         PHzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dz1xJgrF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23-20020ae9e917000000b0078ec8d2127fsi5699518qkf.615.2024.04.22.04.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 04:24:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dz1xJgrF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryrmb-0002YB-Lf; Mon, 22 Apr 2024 07:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ryrmY-0002Rn-2e
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 07:24:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ryrmW-0007IW-FZ
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 07:24:21 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-346359c8785so3650359f8f.0
 for <qemu-arm@nongnu.org>; Mon, 22 Apr 2024 04:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713785059; x=1714389859; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4zSmrIlgHV0Vw1AbLT6ZWFHT7n9hH21z64JC62MO0XM=;
 b=dz1xJgrFqcljUFDeDVRxm7oL71Q2uR5iSN/ZjWqStsiWu78ShAEIZaHsT49OIvhHU1
 8XbGJRjdcwuSbyRbTA8b3HAG+u3xPaL9tb4VUxplLTT8n+zK3C3dHcrAMOpIn1h30TiB
 Y2FVh08gFTIiw8e0GfFAJyXG9H09nehvgR/D1J6oau9c/+2vh8+vbTjF8HbjZcpkvMAR
 4kItR81CK+eH2PjP0CGymsqzdvb4OC51nQwGwTQRSoJAkK2/G7AmdTJrjmiLvkek4wgO
 qFHO8GF5KZapxtAw2ISyApnyoryVLNU9NSkmJdxVPpypTxyWzV+RHUwgzLz4TcEY+ACu
 JFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713785059; x=1714389859;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zSmrIlgHV0Vw1AbLT6ZWFHT7n9hH21z64JC62MO0XM=;
 b=rUbe3Z27DU8L/yA0LRKFGfFQi+bMDPkG1Ysygcho67IrTOyU2TOmcgIgTsufLG2ALf
 6xjGZUxa5I/gLdbjoZ0asrOmw/n8I+rNMBX4cR19IW1/3z/uvmWBy8bTUNbrqYRCXvsV
 6fBvMSxGt8k9yKKPrGA3kNaCa8OmgU+ODC7DJFu6THPJP5dPk7N6ICmdvZXMZpYJJ60C
 3WnW7+mT3PCFivo6d6JAyK9fNmBJ+60OCimhk9JpwKMOi+Q8W5eyBJSWdpXnCytUuIfe
 JGK/9pFruuDMpXVCZi2ssHpN351GwGvhPOQhZH5ir/gqJRB+hOHAJKgR/FOgBvzfz8UL
 L/Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI8LMlnDWQ05JfGu0PVxaJpzG7G4nYfDvZ7S4pPy6WUzyrQuBzQecJ0eT+uiBJ0LRUdfsJaxJkNu7tPPCQ5KmfZHyk
X-Gm-Message-State: AOJu0YwMTiBIuTvYtHLKiju42u9TNGqPpkJNaRm2URLDliA7AilkRoMh
 R3TQCAkbVkDCBegGreVwmZ6cp6qmNar2JG3uij/Ram/XRyb0zbsJ461FRPH8+8A=
X-Received: by 2002:a5d:6901:0:b0:343:5cc6:647f with SMTP id
 t1-20020a5d6901000000b003435cc6647fmr5601554wru.21.1713785058896; 
 Mon, 22 Apr 2024 04:24:18 -0700 (PDT)
Received: from [192.168.1.28] (lfbn-bay-1-170-196.w83-193.abo.wanadoo.fr.
 [83.193.250.196]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d67cc000000b0034a51283404sm9310828wrw.72.2024.04.22.04.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 04:24:18 -0700 (PDT)
Message-ID: <a7763561-62b3-4363-8049-fa4f7bb44047@linaro.org>
Date: Mon, 22 Apr 2024 13:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc : Correct 5 spaces indents in stm32l4x5_exti
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>
References: <20240421141455.116548-1-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240421141455.116548-1-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Fddbnnt+B/d3

On 21/4/24 16:14, Inès Varhol wrote:
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   hw/misc/stm32l4x5_exti.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued, thanks!
