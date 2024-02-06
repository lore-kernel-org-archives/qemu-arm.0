Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1927673ejb;
        Tue, 6 Feb 2024 08:50:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBRA0LZHEAuIpYz4A3lVNtYkYADs4QFY2tjUs/tvGBWe/3GX4K0JBqLX77ZQ7ZVyjhCST/
X-Received: by 2002:a25:ae45:0:b0:dc6:b190:9341 with SMTP id g5-20020a25ae45000000b00dc6b1909341mr2074208ybe.49.1707238241241;
        Tue, 06 Feb 2024 08:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707238241; cv=none;
        d=google.com; s=arc-20160816;
        b=IePUHtw3GpYLx+2NlLD4vkJixSjTixwFFKJuqbex3Phj+ZtU6x/cf53ugCzNz7YkMA
         aQ/4fJb7RsY1VIcOexJ+M437jwSAUJqRY1FIo0LwVo6xjGVCAjuuarJK5AI1qe8l91iT
         J/bnX2b7nzXTnFqxslAOUq99Dfs09hxt+zWqQx8cY9EYp9mMkQK+B8bI+NK/0VJq4FrF
         c3grxTZjFkoSjg6aHxBF04oREpYy+XUJw9fkGQPjbE4iP+GtvFdf/pEqlU8bUG6TIln4
         fYgmdEW9MhHuwmjAv4i8ZhrRIupvB+0cBniJ/kSOMFv6uEi/1n8PMdIZAreYe7Ic0iVt
         3KZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=s49/HD0qFkU4ujycZbidgOmgKRRWit3c4XLOPxJLbLA=;
        fh=bfwkDGjmHZqmzL7G0BvWzdPWalhwXXAOxctywtn/O8c=;
        b=w4qwMiX2shTInDcaN7GDhTLglx/qxnlGzzr0784U2NcrgYNqLM/SnEJyfJBz6qza16
         k8rfxG0veOL6wqJE7OjT0EiNHxu1rvS7Z2r/PLG9Fi/Rg3pBECJS/q+pkbyA4Fs/upbD
         mV7pFYmZPjCHPu+2lBXSTIXgFxhECQCDKm5GOOJ01L2omX4FfOPTkbzCORJDFjMBV0ui
         H46WVVdTor9Barz6scTnE8juc6GEZWuvQlB+7Rk6S6aRM/DqFpfr/wtytXUbi2UPZapF
         +vdHaHRU/DUAOZUGs0+xLHAMF0FFU6sapVNhb25pbI5UEvW5P4V4AudcpOK8j+4CPan7
         Kjew==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWoMrBQL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCUyQGi1JTjg1g7amjvxcvHfEmagF11S11upAaVMGnoWLOKzzokYt2BgsS/e5uk5mIpuiaF/Lf7PZpnlJFScZ2lu3Xb3bJ9O
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dd12-20020ad4580c000000b00689128467bdsi2690641qvb.367.2024.02.06.08.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWoMrBQL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOeQ-0008Fs-Oi; Tue, 06 Feb 2024 11:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXOeP-0008FZ-Qe
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:50:25 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXOeO-000769-63
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:50:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40ffd94a707so642985e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 08:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707238223; x=1707843023; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s49/HD0qFkU4ujycZbidgOmgKRRWit3c4XLOPxJLbLA=;
 b=gWoMrBQLca4MKlUOxl0oTqVNej3Yu90ugE1ArKt0tU89In5LAiRYp+RE6al/O4Nln4
 h534StnoGUC1dda/CxsFyLdCaTjTFmYn9IROQc9QIdj+ArpH2e/oKcR4InPETItUQjZx
 ro8iWi2eWBE6sA3TDuo1WfgOYe5a/3Oz9qmZDxPKN9n+esiRgK1y0dtV0IdbWKZ3Xswr
 OHFAlH7hY+2lnfyG8Bd6G99CSvJC2dXe1a4Ot5gfpMq2cA9WsCypbthJ8RV6GLBmfzW7
 eDXl88sEo1VAqKW0BW2WR74Kw1obymaFcSJrsxobDTY6pL+z4pZlvWg8Nq+vrT/ONoXu
 itYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707238223; x=1707843023;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s49/HD0qFkU4ujycZbidgOmgKRRWit3c4XLOPxJLbLA=;
 b=XQYzoTaCYPO00TMc/+mHPV6CCfziEGCJBiPHE0vN737OOWUY4+9rsS63gpg+AC/jsM
 bxLLwowPar5qF+3ZybRmr/DB3o+7Wi1ns/PTznWleEikfot4b1tGB0dhbUUj4QkviEEr
 QmoEbiK+4rKAi5e+Q0/A3VA+tcfNEda+H/G4JkkFT5x6FAJrp7Acu/sZOFPjcybxHOjq
 IenQE58uzHYUFzbBk8Cl8IT2HcckciEWOokTcc2OOmkUthl2i0FPOb0KjZKQMd2SxbWw
 sPAHC9djZ/C+hvwvNSuKyejqxzD+EYO/uGXTBC+bbQw5+nj8bTpzqIm8gCmYvQMQblmP
 vZVg==
X-Gm-Message-State: AOJu0Yxf8Fvv/4MnbWozQQXBx3P18kexL1Wsv5ve3+Xtu3qzkQEPErvn
 R2iahROJxCVg7KUTx3dIWEykMFWzf/v6Td003LAsweouAlD6614q+asZgKwTrPU=
X-Received: by 2002:a5d:58f0:0:b0:33b:296f:defa with SMTP id
 f16-20020a5d58f0000000b0033b296fdefamr1842839wrd.9.1707238222724; 
 Tue, 06 Feb 2024 08:50:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWb6QQlk4KNn+adOCDQS6DL2LS3IC2ND6ua2Lu1uLmP/sNyrORGlwM5hfVO0fU/rC1WZY7sfF7DRebx7TCXpiBs9uZdWS9c9+OFITsEh/wyIXt4aodIT+V+/0I=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 l31-20020a05600c1d1f00b0040e3635ca65sm2534632wms.2.2024.02.06.08.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 08:50:22 -0800 (PST)
Message-ID: <8ed5b586-d62e-47d7-b74d-2c4ab63331ef@linaro.org>
Date: Tue, 6 Feb 2024 17:50:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] docs: Add documentation for the mps3-an536 board
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206132931.38376-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: Yn3547d/WeSn

On 6/2/24 14:29, Peter Maydell wrote:
> Add documentation for the mps3-an536 board type.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/arm/mps2.rst | 37 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 34 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
