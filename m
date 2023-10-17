Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3891150ejc;
        Tue, 17 Oct 2023 05:44:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuUB0OUl9G7V1JvKGH3PNYBpwF9imgy4T4q9gzAQh1+EFhaYskHZ4qrecGKEDOKSAsPM/C
X-Received: by 2002:adf:e3d0:0:b0:32d:9d91:6273 with SMTP id k16-20020adfe3d0000000b0032d9d916273mr1590918wrm.71.1697546670529;
        Tue, 17 Oct 2023 05:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697546670; cv=none;
        d=google.com; s=arc-20160816;
        b=FR1DveFS5IN4IsRwpx5QsKJOpDkx6eaevyiLDd21eDagH2Fplamti0+imAWGbOXLaz
         8kW01ViuDNMUfCWf0AObkOQTLUtHfGe712QsnYZXRKJ60bPiGUxJt0P2MJr9dmpA7tcd
         q7qfBS5lUkwcNzYOTwEv89zgwgvUNrlhb8DGsAXKwvRnDTZmvxkDRbLJydI3YQQoVXam
         lLF0s9SnMrWTuts9HA/oN0+FEM+fj/OqKaTo+PzvrOr4ErQQa2muGmlKaVOSlFJd1Kxx
         1OrBPAX26MxbFddXs/QS9QM69I/9zcfAKpu33jypyPj7hCzULc3YV4Ts1gFKZMwNYZIE
         YqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=OI6XxeHEGNN/AelK/4GCeSwmqDn2vKzxp14UeZdcQUY=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Fp+6fz//4qvHTBvgezDWTW8NWAhNw2xwJKw1lpF9JD9wiqdYWktjwvaGS8yho8kPkF
         woUVNcaPmhXoxuwkKyE9hk2Wf2oBgEkYI35fHcgHAagBgLrcUK19xcph3/IZHKIhzyiV
         vRM9ovLrKPLBylYC0Y+bxkGLUzihEisp5hrvuG8oMVolKt9XeldP+QGBxDPxyA5ndxAJ
         JwTK+fNAUcpYZHzBUZwhkVwBkJ09FT4PwiCYJDGey0eduaP/u14pt1UXK3MGcTD7wOZz
         vLJlnqWfztQMXnLOZbCTXRwri/iZckfTTbRqoOCxp3+Vsg4QLb6ZncEf9abilB89x2+Q
         KINg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mHj+oaIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a5d658c000000b0032dbaf50346si951260wru.1031.2023.10.17.05.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mHj+oaIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsjQk-00077x-KN; Tue, 17 Oct 2023 08:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjQj-00077P-9I
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:44:13 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjQh-00086Y-Ds
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:44:13 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so222683366b.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697546650; x=1698151450; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OI6XxeHEGNN/AelK/4GCeSwmqDn2vKzxp14UeZdcQUY=;
 b=mHj+oaIkUkeI+vNTf8XsAvdcL/GNJTkNIlhVO8h0LjBBJQWERfuisIH7snre8kPWi9
 iwLu/FVnmp1OQpN0NJtC5yVRPitnLjQPl6+DU+IVFXDKOc2wBE8As+j4F0hWlABbV7LI
 DmeJCTfXKm3W3BPxwZugRjB8giEeBUTu+m9FIuDxAORhfjXY2KVPdgTk5CBaFoUrR8GS
 QfdznBUaPoEUR5qaIn7PdRITFCmwamVUKvJKfLAYrkZD7TfUpNKkuVknH+giLMdk47qW
 B/uIH6yQn+GD7x+qSCDFnGmW/X7mkdE8FKBKxsJ/amv52DUDK/3OcbrWeLXZ9uswZgei
 MlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697546650; x=1698151450;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OI6XxeHEGNN/AelK/4GCeSwmqDn2vKzxp14UeZdcQUY=;
 b=cNLgbTO2IDPH1StGgjcYHlOX5/a8gzJ8uWEiz9HV4qJkN1bQyessXl4qcGxt3tEjDq
 DPAgtzx5T55gIM4pBDUrwCd+lPDCvOU+GuhWG1t4EhurX4FY+nArSsB9PbUc5PZznZ/g
 khVoaMBBuKivKf7yf6kjGie6DYp+EnKodAu58thQbtdsyNBLpl7ZtmzJ4avlrvx+ikLB
 SSX/Qfs8orjsDfo8J5xyPDkQbCZOhuSBD9NLJ27498tz7KMMt10pnEVB/Q6gfgkm8+87
 f0KxfcoUeYQsAXtLN7BaubwBYvh4XYbShTolJDg+I32eK0ZwNZ7Mt8QQFf6DY1vzAzIk
 5Naw==
X-Gm-Message-State: AOJu0YwUmbSMxy71bLNvt6rJ6QeKwBXhqxvxZYhFUspgtp/Gt3AWX4BX
 eWA3CJCVjcMvg8e0Yul22XCGVfm0t6vSvKXZthT16A==
X-Received: by 2002:a17:906:da88:b0:9a6:4f54:1da6 with SMTP id
 xh8-20020a170906da8800b009a64f541da6mr1356029ejb.57.1697546649620; 
 Tue, 17 Oct 2023 05:44:09 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a17090607cf00b0099ddc81903asm1201474ejc.221.2023.10.17.05.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 05:44:09 -0700 (PDT)
Message-ID: <c61b98d3-cafd-862b-09ad-818a5e2f051d@linaro.org>
Date: Tue, 17 Oct 2023 14:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 4/6] hw/input/stellaris_gamepad: Remove
 StellarisGamepadButton struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
 <20231017122302.1692902-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231017122302.1692902-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: iv1QsY3s0+vK

Hi Peter,

On 17/10/23 14:23, Peter Maydell wrote:
> Currently for each button on the device we have a
> StellarisGamepadButton struct which has the irq, keycode and pressed
> state for it.  When we convert to qdev, the qdev property and GPIO
> APIs are going to require that we have separate arrays for the irqs
> and keycodes.  Convert from array-of-structs to three separate arrays
> in preparation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/input/stellaris_gamepad.c | 43 ++++++++++++------------------------
>   1 file changed, 14 insertions(+), 29 deletions(-)


> -static const VMStateDescription vmstate_stellaris_button = {
> -    .name = "stellaris_button",
> -    .version_id = 0,
> -    .minimum_version_id = 0,
> -    .fields = (VMStateField[]) {
> -        VMSTATE_UINT8(pressed, StellarisGamepadButton),
> -        VMSTATE_END_OF_LIST()
> -    }
> -};
> -
>   static const VMStateDescription vmstate_stellaris_gamepad = {
>       .name = "stellaris_gamepad",
>       .version_id = 2,
>       .minimum_version_id = 2,
>       .fields = (VMStateField[]) {
>           VMSTATE_INT32(extension, StellarisGamepad),
> -        VMSTATE_STRUCT_VARRAY_POINTER_INT32(buttons, StellarisGamepad,
> -                                            num_buttons,
> -                                            vmstate_stellaris_button,
> -                                            StellarisGamepadButton),
> +        VMSTATE_VARRAY_UINT32(pressed, StellarisGamepad, num_buttons,
> +                              0, vmstate_info_uint8, uint8_t),

Don't this break the migration stream?

>           VMSTATE_END_OF_LIST()
>       }
>   };

