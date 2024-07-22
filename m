Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2158938njc;
        Mon, 22 Jul 2024 14:54:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUd4yoa333xVBJcYhsSZF+YLnFQI11/3XEbeemvvM0TKLtSSB5cd5b5321i0U8/cjxgdJvrrZA2ubUx1tJpgIkZGLvIz8YP
X-Google-Smtp-Source: AGHT+IFoPYWRR/p5RgagB+3OaWMxORFtvWUJOIG/zsGUskUKuy1ZhHTZt9vUj9lO8Xxl5UpUzEO1
X-Received: by 2002:a05:620a:371e:b0:79f:1eb:d76c with SMTP id af79cd13be357-7a1a659f8c1mr1103404485a.43.1721685274516;
        Mon, 22 Jul 2024 14:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721685274; cv=none;
        d=google.com; s=arc-20160816;
        b=SogwAiKIIEp4+Y5swobRciZ3wdz9yo9kBbAb2M63Atyq2tOKK9Unu+rKA2Kx6mvePo
         brjavl4fvuhRMYHnWS2n03umnIUHv3Eu/yJCFYHWALMrN56CtkGvL1NJv4LK7iM9Lpl8
         RhaucIzQtz0fP7kNkN8M8SgxZOSC4toEtbqwdwyEGvVXeqYLHkRfYsKJc343mRz/6JI9
         ynBjmjwLmvqvQ0htMB6ldG5/uCd/QRJn09uIK1cKaH05DBuotEgZJxt8LN+yIPp6a0Dg
         mGDZPZft0qxexme/5L0KSNW91gc6QoKtcYwlU47l7nWv+6btEFA9AhyveJAB2I/RYuEN
         a4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=M/iTTKXzDIaEIagjYDsG6FTWs9ak/8rwN6KBnSlAIEI=;
        fh=qrrsiAPEudD3/5ftsz/nvVcekCVoSg/misswN0Bk4SM=;
        b=E5XiS6vQBZNf2cVw08UJ0/mWi/cccjWFhzpyj7XXdYsioTa028AS770DGd0NVO2Qrx
         TOYjmuLcWsrHAYEeRzmTo4p9buEs0/ueE+qBUDaERcg+cexWw5lFTKhMF1MvQlRKIePr
         s/7rkb9ZNy50l2Bac3lEZ9Zipmvgy0Rg7Fo2vCXZ4878Bns3qwEJNd6C3CXbVBoiGxPn
         kbYycZznNU8qEm4xjGngb/5o70b753BjC4Z2aNS2OAK7ixupM0ANoelW9WhQJBzfyIQN
         YvDYRMxBAXGqJKTgVom5B+/+7UF+rBH7Bc7DfGYsKoeO1/5nQkrbNZPUJqFDy2TZTeqz
         Ql6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YX47j+v8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cf191d4si90109161cf.762.2024.07.22.14.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YX47j+v8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW0yx-00079y-4x; Mon, 22 Jul 2024 17:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW0yu-0006xI-4w
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:54:08 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW0yr-00066L-DT
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 17:54:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4266182a9d7so31985205e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 14:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721685244; x=1722290044; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M/iTTKXzDIaEIagjYDsG6FTWs9ak/8rwN6KBnSlAIEI=;
 b=YX47j+v8ciobVNDunHU3PyU3pCd0PF3SavARUMHNBA67Kl1qyvPeEymCGfy4LboSIn
 KYexzqtTJEd7lPrwoycaAoI0c5XHE6InuBnyIkO2i/urGPnaTezaLtm4pIJp1ejjogvo
 wcRGId0Q/IMWWLDVd4Y7OuC2ZzLTv+AmOBqNMN0ka00eHLtT5pzzz+qmFt2tnEaGBx6y
 pQe+DfSzfeIPe3H5xmxDPlYhLNTAzk5Ya5Kp/F0ZioNyop0tFWWywld0lxej9xSzUua/
 VA13cBh2+Cv9t5hCfHnstc6YaoW9E4F+WDfb0QaT5nJ3I/8TJj+3Fyv7RHI+mfYwyqCo
 adLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721685244; x=1722290044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M/iTTKXzDIaEIagjYDsG6FTWs9ak/8rwN6KBnSlAIEI=;
 b=XoCWKwJrA2nQH1s0u28JyAoMzYiqEBC6G2sh+3jWZHwC9KLW3/5uAn8HKy3jgzImLE
 kgvxHdh5+K73YzDAVpqh0RZX0eeG+rYwW9+kM8IeW1S2InDIWujPGJ3Lt8nvUGqwgP62
 kUhqJaEW/yWSOz3UG7Tecf2b2/JsYS1rNEM05ufXS9DACiA1nZpSvwiCKvJhKheodSXA
 r86Lsr1BQNyDJWN7HpsnXAMm6+uTpstcJ9BaQJajyjrE5v8FuWXFulNKxEG9j9yogeU8
 LImVDtu6NAHJw+fePpLXJEmR3Y7H9SD8Hre1GPX8DjfWyqDJkMikFhbEO7G9c7JKMs2U
 PraQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC12LgkjnQCCrSsjyvBEAbSiilF72B9eUMuWQhdcUa8MKxrF4dvppwHLAzcT0PdeI/ESj32fThEkuJa+8J4A+Z9p/L
X-Gm-Message-State: AOJu0YxqNx3HPRlojvldJirh7790ZC8kP70sjSJpyEE8tl+vqifOC4kv
 3VnayJrZ3bgtPl4N2SBHiojzSsYsRpdx5e367mFL/ipr0G5S1MJ973NIBf8kDWA=
X-Received: by 2002:adf:ee41:0:b0:368:7883:d14a with SMTP id
 ffacd0b85a97d-369bae51e87mr4401659f8f.33.1721685243648; 
 Mon, 22 Jul 2024 14:54:03 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ced78sm9677669f8f.74.2024.07.22.14.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 14:54:03 -0700 (PDT)
Message-ID: <f3c9d0c0-1cfd-46c8-8524-cffbe5180d3f@linaro.org>
Date: Mon, 22 Jul 2024 23:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] bsd-user: Add aarch64 build to tree
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-15-imp@bsdimp.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240722214313.89503-15-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: Ee7uOfceGdh4

Hi Warner,

On 22/7/24 23:43, Warner Losh wrote:
> Add the aarch64 bsd-user fragments needed to build the new aarch64 code.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   configs/targets/aarch64-bsd-user.mak | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 configs/targets/aarch64-bsd-user.mak

Can we build aarch64 on Cirrus-CI? (not clear on
https://cirrus-ci.org/guide/FreeBSD/). If so, could you add
a follow-up patch to build that on our CI, patching
.gitlab-ci.d/cirrus.yml?

Regards,

Phil.
