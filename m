Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp702038njk;
        Wed, 17 Jul 2024 03:02:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOx8zgZ76NmZQGLD4rBfCgkulmMQYPV/KNXGXS4ccO+M9woP8UsYiJtL7Uj6c6aEQjedYLD7g4wXM+qGnX9oj8zbZ7MFBS
X-Google-Smtp-Source: AGHT+IGePHBX1wFvgpDT853g2Hn+P8Rq/mS8sVEYx1OdOfbTX9LdtjVw7DKXkBb1F41QhZlsnGLQ
X-Received: by 2002:a05:622a:647:b0:446:5aac:ca7f with SMTP id d75a77b69052e-44f862baa66mr14365001cf.22.1721210566635;
        Wed, 17 Jul 2024 03:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721210566; cv=none;
        d=google.com; s=arc-20160816;
        b=nO+Sb8h7cv9JibFk1m8YQkKnlaiqb6xi13DxWQBWwqF1inyLd4+Ce9QXDUwpJPhzY1
         lgI6L9pv146xezQTXMxYHAxzrKO+niBYyhtXgjy1ALwnFTDmFLhqd4eRJvhvHfcLp3Bx
         EkB2SzvLXV+CM6sPBR7EYsauKB3EwG+cI1uymmo21aIGW5Tj/reDIIJ7KkV1wDXeAr3P
         y+/5HbPBrxJNNhgTK4ljXIDKzWfxmlRYMUhrHuTmGs2U/BL4U9wBSU1AqFQ4VIPaaJJf
         2TOLkVxpL6SsyXQ+2LQ9zuzNlzGlWMJkNmKUuZz0RUBoKwUrinMpxAP4kotFwDo2HP7b
         WOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TsrYKh5Zg8n6P6g9dpI45osLWcbwS9f12XYwFuWiSzQ=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=zmpO/NuQ94L4YKcSMpRPpk1EXSk/GyXCoVvEMbY3TQMRUz82byiFx3gAiCDlTMTpze
         nFdInt9kenmmUph4nk2oCU8EtAf97oE0YoWnwn5Cm8fgIxh/bALLZSLPApgY6eRD7Y9+
         R8iR5aQOtz2ROkxdczYs9X8ngVuRcyDKwR+I9KRYz7PizrnMHS5QBisCuU6IFogpnsQ1
         M06eridLTHoutrFu+wGGgRWeriLIoU8Ht7UOsWdS//2PX6R2JtvZpb4ZLCgFJ4e7IK+p
         In0tp4pEcOmrYIuvZRm1mKcuXkDT5ZeAjRgfZUxFnIuwc8NNITFNr/qLXy/4GIXtnyvw
         IggQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htEnB7s2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b77d6bdsi93053981cf.113.2024.07.17.03.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 03:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=htEnB7s2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU1Ue-0002E9-Bs; Wed, 17 Jul 2024 06:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1Uc-000256-B3
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 06:02:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU1Ua-0000bO-IC
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 06:02:37 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266b1f1b21so46051025e9.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jul 2024 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721210555; x=1721815355; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TsrYKh5Zg8n6P6g9dpI45osLWcbwS9f12XYwFuWiSzQ=;
 b=htEnB7s2V7+zTzBXMIO2GZwgAg3rqjOewVel0cp/bKJ7ggm8vthlwiU44P6ibaTVID
 p72X3aUsVz/9x5FZgPJTUBv8ioecbALJ0jOuhfHD7qRmHY+bI+IYieU2V2bl6x1X2VN/
 UanFIEvWUp2558yQRniDx00hn9cKyDqTkPAxX7icvsVMpBSaTsxY3/7WVFbxkvUtPAlK
 KKauXeqkjkXAbTsIQayVEgJcwrYue3gjG2nQ5gNP5oZGWap8bnLjDse2Nlw6mdVhdnF8
 BwOuZCSJEcCwdm8V6MhUDIrZSWn6qnNSLReBsS7XXDAi28+aE+Tvl2kvn83kjKeB7b5p
 BWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721210555; x=1721815355;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TsrYKh5Zg8n6P6g9dpI45osLWcbwS9f12XYwFuWiSzQ=;
 b=XJ5B3iyWYJy8ESSsb9V+ybYjNhtaAFTols9gyKfGxdsdfnVaBLmhWAVcN7JPNR0WEr
 G2FlQlUXzXiBjWTR5cWlNXnq4gsyezX6pQ+lL3QdSNYIzE5mfHVz0vaiM72boLLOXcp5
 XlSB7dVY29aWl+ZksM9neq0MpnvtDUoh+LD5aWU5mHSvqvmXIJ23f4NqM8VDCpdcavJd
 bVUrt1N+R2c+ZJlwo9UgwZkPYwXl6Cx63/24JDd8NlrTgH4DupOVOgDVEQoa8et7yr08
 GrP54FwztD9ipE57pGErrBIRD3sAn6yPHeXX5IZzhn6k3sbYoBCoS6M+kPPIfpUOO0TD
 QjMA==
X-Gm-Message-State: AOJu0YwR3hm8mmfPwGL4XEURJFoFyqakcNvV6/YS4WXX6W/DUtIJNqyy
 tWGYaiOHPfU3zoeADH4ogPmLpv0vRTb1UTPGNBCgu44wDHqoX1j6Lwok+XNe3vY=
X-Received: by 2002:a05:600c:450d:b0:426:6157:7ad3 with SMTP id
 5b1f17b1804b1-427c2cd0c64mr8198125e9.19.1721210554734; 
 Wed, 17 Jul 2024 03:02:34 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc32esm200739325e9.35.2024.07.17.03.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jul 2024 03:02:34 -0700 (PDT)
Message-ID: <c3b1870a-6939-4470-92be-c9a4ba0c98b4@linaro.org>
Date: Wed, 17 Jul 2024 12:02:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] target/arm: Push tcg_rnd into
 handle_shri_with_rndacc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240717060903.205098-1-richard.henderson@linaro.org>
 <20240717060903.205098-18-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240717060903.205098-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: mUEElcGpIENc

On 17/7/24 08:09, Richard Henderson wrote:
> We always pass the same value for round; compute it
> within common code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 32 ++++++--------------------------
>   1 file changed, 6 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

