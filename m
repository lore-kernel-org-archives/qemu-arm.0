Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1386423ejb;
        Tue, 19 Mar 2024 08:51:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNBFkr6ZJq9jgjmmDN4FAS55HnNTUrX27WcVwdf7lumGdVBdQukYfjU1uoHbd+TrObfEVF0ilrcJujmGJDYUi76qKMkAs8
X-Google-Smtp-Source: AGHT+IE/qcBoNSTGhiQS7ytkdW/5KmN394TTw2nDYsbHncVmjlRJX4Dta9lCDaY8PLoAsxD/spru
X-Received: by 2002:a05:690c:4609:b0:60c:d24d:f962 with SMTP id gw9-20020a05690c460900b0060cd24df962mr12024401ywb.42.1710863473963;
        Tue, 19 Mar 2024 08:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863473; cv=none;
        d=google.com; s=arc-20160816;
        b=Dd/NvHY0aShPKdCoRA9c+SatYeJxrberdkGokTXxsxMKxylmi3nEN+ZtokfdpKc/0K
         hJcDJmzpf8PnDY9i3cYmuyWFShogTfSc95F/gmNXQX14OPiK59K+xuyBTQcPchvOu97i
         U1idNK4BvKlWIpXYVWsZK/q4FBHNa+TNdyA6YT9UUDLH4u1WfolB21a26Ztpkb8HGOgx
         o1XZLcEIu+A+qN23hC65Aw0K2M6V72qySUpcnCakKn1KWK8+sfDSENlTkLKTjzmqF/VK
         pIGSTlFYpMKoNAgtX3rVBkLgW6Owf4mZoEIm+7EceEq8nPAxUhCBDCCezI5hfuUYmNmv
         6nBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sAFmieUWILTCKRkamo/d7jrRPjeosX/hmTYF3Y7FJ0I=;
        fh=4EVAndxaK5B4fenUMuzxHX/zTIC0CB+tZ6OiAG82Gx0=;
        b=elaZZiPTMuXSiDaM2VOBJ/sDN55/DlXgDcbHW+8J20ybtiKF9AVOpL1iEb3U/SAjki
         KkYkNM9tx1cp7Acwi/SMjlMDH5Tl9fL0oiNAwflttGrJhRZFNVzisG7lhINCxmBUTS4N
         ge17z52LAR3WmPMCCFbdpz1/YHCSk6d6o640C2NiAH8+zKJTgySUuMI5Uc6MUOJdy6uc
         WhvGCg+oyzSaAdJzGbOpkoqQ7Xcs5h6EzfHKu0Epjkc8ywjY0unzbbT4yuyIUw4uMfyC
         RqqXGIgyLBQRJHY/xKVBwMtm8PGJqkgtTMihGWpt+b+PQR0tZ2jw3R1l6TzJioO0CbfJ
         7/3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KNkjRW2l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020ac85a82000000b00430d2816a3fsi4554128qtc.7.2024.03.19.08.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KNkjRW2l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbju-0007KN-PV; Tue, 19 Mar 2024 11:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbjl-0007Bw-Ge
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:50:51 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbjh-0006i0-QZ
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:50:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4140efa16caso18722035e9.0
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863441; x=1711468241; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sAFmieUWILTCKRkamo/d7jrRPjeosX/hmTYF3Y7FJ0I=;
 b=KNkjRW2lqyeqiwDFdJs1Ze7yY7Nekcd0ibal82qnyqN9k0m3K0M3YWaKADVQ0PqaJC
 P43ei1b0HD4nY+uM572NdlPzvRLeeMJRBCh21S9KfcQuLgpeNLqgo+na0iKIJfjUfefv
 OiFJJe3Oj3RXzDSlM19utDa42OxbbqCjYn45D2eVcnqVTHCSSGAEtWD4HQt3pd66nwyq
 j/jlJKYlXG6s8+2DbE0Vkx8SjlxqCIpEIfMjfUDPgyCxAVthih+9gtHKgKJKpOOJLHRz
 vB8UmVC6DkPr8/OcP+tAgL64xJyjjgZLrSnVDdu04c9DDw+nlgQH+rpYXfn88Lipr4T+
 6cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863441; x=1711468241;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sAFmieUWILTCKRkamo/d7jrRPjeosX/hmTYF3Y7FJ0I=;
 b=AWPsR0L2njYjRQA6KDUqyScRSpUZtL8Ri0/EXXwR0ScxsGtyhvgtnhNIDd9sDzykyR
 EHDZbcJK9orwbD70AiV0dJl86AXku1548Pfj/6IE81dibhpMEgwDy6Bb/hBMdeQuyD+7
 9ItzhjkArS/eD1oPTa2NpbsqWVDbBfYWrHKM9Az9+QyticHFgkUkaNa9PpuWws4GR7xk
 4eIV8Mxi/yc+RoWtr32DWJNjYzrm+v9fcPATyEAyzbM3Dw4bfREOs6DAmQRrWpwLg7Gg
 swIb+FYYSH7Df65uI3rYsA1PNWV2KctxgwifNXNtZglGTB7dAQd5o95h+Hen2XZJ0qwg
 i93w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz8P1FzpXjj7csnErCYOJl4TloD1t/vcaR/B1Zu+LulgzdOj9FoYhQDZumXWFW/hU3KXEPvFbxrPSUZFQuyjCxpjDv
X-Gm-Message-State: AOJu0YwG/rP+br9KkcCpYArKy0ZLUeJ/JtcvFs2lKAEncdMIQvvgOr4Z
 pezhKK40LL5KTIhd/FmOBArvtFLfOEfuR8Erl4+NpIz9y629FRNl9+hOxQ9BxNw=
X-Received: by 2002:a05:600c:a4c:b0:414:729:1189 with SMTP id
 c12-20020a05600c0a4c00b0041407291189mr7961730wmq.21.1710863441396; 
 Tue, 19 Mar 2024 08:50:41 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b0041413546e5bsm5711005wmq.0.2024.03.19.08.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:50:41 -0700 (PDT)
Message-ID: <61da973d-e017-41d2-bafe-12570956aa8e@linaro.org>
Date: Tue, 19 Mar 2024 16:50:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] aspeed: Make the ast1030-a1 SoC not user creatable
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240319150903.413662-1-clg@redhat.com>
 <20240319150903.413662-2-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240319150903.413662-2-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: a0vPUJXhWyER

On 19/3/24 16:09, Cédric Le Goater wrote:
> Aspeed SoCs are complex devices that can not be specified on the
> command line. Fix that to avoid QEMU aborts.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2227
> Fixes: 356b230ed138 ("aspeed/soc : Add AST1030 support")
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/aspeed_ast10x0.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

