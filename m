Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2ACCCFA13
	for <qemu-arm@archiver.kernel.org>; Sun,  9 Nov 2025 10:46:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vI2vu-0008NF-VU; Sun, 09 Nov 2025 05:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI2vt-0008Gu-6T
 for qemu-arm@nongnu.org; Sun, 09 Nov 2025 05:46:05 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vI2vq-0008TG-UV
 for qemu-arm@nongnu.org; Sun, 09 Nov 2025 05:46:04 -0500
Received: by mail-ej1-x642.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so292937166b.0
 for <qemu-arm@nongnu.org>; Sun, 09 Nov 2025 02:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762685161; x=1763289961; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I0XbYMG3ZXeiT8BVAbvjtRixtNLKhkoATyUV7fZJRHI=;
 b=hlrUDek525ECRXHgAzq9xnB876yd/x1WrEPlMQmlZ2FvjEfSnsjEfwUp812nyyyKYn
 JEXYvUZfaWD3+jXs+rbt1olUmJ0QSX6tqKh6p0adVYFmm0feV/tso8mpFrcLnvX7b4SG
 VftWmdzLd/hz7J2K8bfWbAgAjffwUdVYh46TZ8WJcsJOZ73o6DYeQ9xhBFL30KF2WQd9
 IKLrJnoWc6gHWiyFQjUn4WPHUu1g6OtPmkWe+iF24xA6XXuEgAZaZ8vZ6LB7Yw24oil2
 AbQuPundOb8lJvKx+nQ3MrjocHgpSY+5B++aElM1GE/L16nb0qqK5bFznOIqmjqgVHoh
 htjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762685161; x=1763289961;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I0XbYMG3ZXeiT8BVAbvjtRixtNLKhkoATyUV7fZJRHI=;
 b=kpFGchK3BHJnRWZr8Uj9ysJ/MiRuZsatpomXGcHf45BcHppiDxqHwHeQl4OpYqE1ep
 6syxaBac6J2qEXjlRzarp5r2htk7i0uG4bmd2j+f70D/hM7H86xB7NMU6RVpBs3vdx0U
 NNIeGKyXAON242iKH9bSGHPGjhq3rsBdfxBu8/AXG7BOTvQwHCcFsLCyng/NbmvWVFzO
 9mm5uDy+nZMcHmhM5fpPNPV8L3ZgCOIJRDAOL/sHLfJ+Rk4mK3wtzraW6iX7TAg9xopZ
 KzLP9VeamAdUo5im4pKR2zIBWaj4b/cL5yoS54D8aTGr1ibKL6NE6BK29iJA2UjUdDds
 Hhyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsJmUD5fOSqMY2Vemb+pwi5IUX2KaT1lLpt3XvPKIMReEqEt0UPRUq1SVxiJyy5FGnWs/NnHseDg==@nongnu.org
X-Gm-Message-State: AOJu0Yyf7kA1FgpEvYzxyATQQhWDrvhSJQmtMre1bnyk11UCLC0/QLh0
 6Crn+RkLBpM4t9saQtWebDZsb+xElwKVdK3FMu+bVHb2LZy3mCbee0JIbNoH2TXdyds=
X-Gm-Gg: ASbGncup8R46C9/N2tGAEcGwyVIqqbgkVvf/gFwHJqdD81uCWPnfW0bavAfFCnUNfGw
 7zRVBXRo0i53aXFsIyvJy3q6ukl/S6WNSpzUnfclIr15I1hXH7q1cZS6+sBzeS1CBVXA/QpeMiS
 F/NoB6xPMJG9LRIN0wepEXJVw9I/Sm980JCLtF/P/7BtPrJx1oHGHcguf83GykmWUYEPWKwCDIz
 6WF07GVto6CDbBPe9MCWT/hH2+IghaqtURI8fJAofF7Y69EjVq57TxTVq5VA0WCo60AXWWsADHV
 lAq0qUE7K3GdDlLHf9Qnst0VOh5bZWIxY7zeq0Z6wa6kv7yIKIHK8TwIV9q9AaokUFX3euaU6SP
 vSbE9XPMWSaHtnMQJGgc3ygyuoz4ZXyluQOm3hP/jVr3eOlPRLBVEjEIe+5GHo19C+0xEYd18nR
 1EBFZsvDAVxlnkt8N8+UaMcLDArysyTttZeHg4RPsE7tALmdVES/Pj0pQsS3HFa+M=
X-Google-Smtp-Source: AGHT+IFGDx2Hg73K7SSEPTwfZS2TGY1L073Ka2nm6rM/5PhMlrkhLyCHj33kzYD6np7OnaNg3o5IVw==
X-Received: by 2002:a17:907:9721:b0:b72:5640:ac15 with SMTP id
 a640c23a62f3a-b72e03156dcmr456854466b.26.1762685161095; 
 Sun, 09 Nov 2025 02:46:01 -0800 (PST)
Received: from [192.168.2.7] (tmo-086-152.customers.d1-online.com.
 [80.187.86.152]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbcea51sm767269166b.4.2025.11.09.02.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 02:46:00 -0800 (PST)
Message-ID: <e3530b1c-6f5f-48d0-ab5e-da94e59c275a@linaro.org>
Date: Sun, 9 Nov 2025 11:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/audio/lm4549: Don't try to open a zero-frequency audio
 voice
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20251107154116.1396769-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251107154116.1396769-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x642.google.com
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

On 7/11/25 16:41, Peter Maydell wrote:
> If the guest incorrectly programs the lm4549 audio chip with a zero
> frequency, we will pass this to AUD_open_out(), which will complain:
> 
>     A bug was just triggered in AUD_open_out
>     Save all your work and restart without audio
>     I am sorry
>     Context:
>     audio: frequency=0 nchannels=2 fmt=S16 endianness=little
> 
> The datasheet doesn't say what we should do here, only that the valid
> range for the freqency is 8000 to 48000 Hz; we choose to log the
> guest error and ignore an attempt to change the DAC rate to something
> outside the valid range.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/410
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This bug has been around for so long and is a weird edge case whose
> only effect is to print a debug message, so it doesn't really seem
> worth cc'ing stable on.
> ---
>   hw/audio/lm4549.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

With s/8000/4000/ in description:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


