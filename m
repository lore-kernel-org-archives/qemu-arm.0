Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2399100ejc;
        Wed, 13 Mar 2024 04:45:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU067Sur2refthZ8Io302+ruzuTw4H3TvsudIvUhuvZMyTnVVPdgdJnPOo6KY1r9AOFBqGCnlEC+zm9+joJXtQkqV1QYb48
X-Google-Smtp-Source: AGHT+IGmzslrE6/rrDZ81d5LFmykRB4zut/7zB33CgRXnC6VbAi6r79MXjD1TapJ60ehcj2nTsxM
X-Received: by 2002:a05:6214:5c4:b0:690:bc2e:a67f with SMTP id t4-20020a05621405c400b00690bc2ea67fmr2828538qvz.37.1710330328273;
        Wed, 13 Mar 2024 04:45:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710330328; cv=none;
        d=google.com; s=arc-20160816;
        b=MSGCmfHGy5e8WfFhWR1eBmm+5e36IakKgRLAxXqvda4ruTXpT03Q8Q3MBDn8sDaz7k
         0MVZXzViD5j066ybZX6lVUgUuhrx0RL2rlchg1chUtNK+mc0UvUf6u5m8NU3UXws3EpU
         Tt72f6HBZ5OjGL5QJTbBChgNVeHWDeODfzs+sBi5ANeWHNnsJClrGT3KRB+96UshuRp9
         PQ0vY1b+xZJ6MIxMmd2NiXoCnvioGecpPpt4eoXBMRg/uVp+xG+R1pR+BBvxRaDr55rn
         Fn0JDOyt0/5FQp/tLoE6Y60qCZAxtEPLvTYFQNYKiryL8lLa59pU8zp3222FSnoOnCfv
         Wupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YiBLyKUiP5fWogCu58cDeSiwf0mKYYrCZi1EDZXDNis=;
        fh=SyFnjqIX04GLstmyT0Rp5gk7Y78cxxBaxD9QRqFyLug=;
        b=sha0/SFqfwmfMFlA62MpPKXf7VwcRDNU7kqI/nrbcDO0oTS4bXADSIUGtMp0wY6C1U
         QRdn8X7oOEMXxXXnKUFxYhsUWudJRJdk78vB8YyvuHNkd5d/qx47058SspscM0jok0Nw
         +FCip+pLDc3V7BP0lsWgGJxjpWIYJxkp1jnMVISc0uBVdfW230Uw/MSIbJ0oyah0IyUH
         evRw4MvbNtWbdmV7W324fTlds7eBzPabMSUY2jov+WKugyvYU7Lo1BCn3BPC69ojAKAQ
         P2aVKY0Q8/dYyZA85T1+q8Df50EKZTpSDnuUZbYWGxNSm3w8U/vwWb5LFzzndxp49hRy
         OlJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yv+zh1J7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a0562140d4200b00690c73c1552si8287452qvr.562.2024.03.13.04.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 04:45:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yv+zh1J7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkN2R-0003lG-0c; Wed, 13 Mar 2024 07:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkN2L-0003kp-62
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 07:44:47 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkN2J-0002HB-Jk
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 07:44:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33e6aca1ca9so6421743f8f.2
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 04:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710330281; x=1710935081; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YiBLyKUiP5fWogCu58cDeSiwf0mKYYrCZi1EDZXDNis=;
 b=yv+zh1J7WBX+psXqd58/drbe8klSVqflx3vYpgEyRAYzuBc6GWqpivH9/vVyY76itT
 mjvaAB7/ClWWCJiNIOvfikD+HBobn6SyhdOA1gRuibinQWjtl50QlXMO7Y+gAAey54NH
 SKnValZ56mvxnVdC5GPEfxIGmtcoe9vlh8tiXmK5U0rSia4u8SnnGj8YD0AdlcJSHxd1
 +NXghq9SKddnFAFSI9d+L5C5ilcr/Xkjo26XeVbTbEbQnciNmSkGHSjEDreuAQ2myURY
 Z/k/FNYiz60PX8zQ+2RBUWQPOwUown+tCZ6eZyiS3xwGgjx8OJSCGiFZMhsO7zaeCGnL
 jJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710330281; x=1710935081;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YiBLyKUiP5fWogCu58cDeSiwf0mKYYrCZi1EDZXDNis=;
 b=OGLrOFv5ETnC+XzcN9sA+z+uqoXd90rLqP//3M2yL/l/ulSuiW+MrOV08msqaTzoew
 /v71YzzbWdrGNo193eig33E4Cn1/Fyh4BraCzKCJtW0KRMFzXWKvdS7nH29IiPjid9zC
 HWNdJdsiWGqV7R3dJednZ08M7v87HZ4DZ7KdbPLlT6sGJZgZe3dgIyorLivy5vgD0w0z
 KLgKEPSG9aUK81Gjsho6BKTaeSZkN+aQ97ksCvW97iG/DhV6u9levMetfqaXIg6Bxa8N
 Osi3mArmNV1DAMYuho3ZdG/NnXCGXiYoW8t73SylKBr6mIB641lnfi+xhqcN3cssexnC
 OaSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDWm4WBLAS8ujhUsfx6JbNNKYxf4GwhppPlu9cll33LAFFGAvxN35CkeX8XJt8O4mY7cIJroL6Tu1zZm5FrmmX9HyV
X-Gm-Message-State: AOJu0Ywvejy5XL+rIyQpmafM6N9eoxpMdjaIDd0mkKsblud3e9OIT0kN
 rCcb477bSicN4IZsEiOZuBVrNPGMFmmdlMEqVFBR3a2i0fCMlOnwMn1whABkOkY=
X-Received: by 2002:a05:6000:1b86:b0:33e:79dc:1867 with SMTP id
 r6-20020a0560001b8600b0033e79dc1867mr1556178wru.29.1710330281590; 
 Wed, 13 Mar 2024 04:44:41 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a5d6046000000b0033e122a9a91sm11417556wrt.105.2024.03.13.04.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 04:44:41 -0700 (PDT)
Message-ID: <8c197bfe-0cab-47dd-beec-c9752d434a47@linaro.org>
Date: Wed, 13 Mar 2024 12:44:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/avocado: use OpenBSD 7.4 for sbsa-ref
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
 <20240313-sbsa-ref-firmware-update-v1-3-e166703c5424@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240313-sbsa-ref-firmware-update-v1-3-e166703c5424@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: NRLOE9dW3C67

Hi Marcin,

On 13/3/24 11:08, Marcin Juszkiewicz wrote:
> 7.4 was released in October 2023, time to update before 7.3 gets dropped.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   tests/avocado/machine_aarch64_sbsaref.py | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)


> @@ -180,23 +180,23 @@ def boot_openbsd73(self, cpu):
>           self.vm.launch()
>           wait_for_console_pattern(self,
>                                    "Welcome to the OpenBSD/arm64"
> -                                 " 7.3 installation program.")
> +                                 " 7.4 installation program.")
>   
> -    def test_sbsaref_openbsd73_cortex_a57(self):
> +    def test_sbsaref_openbsd_cortex_a57(self):
>           """
> -        :avocado: tags=cpu:cortex-a57
> +        :avocado: tags=cpu:cortex-a57,os:openbsd

IIRC for some reason we must use one tag per line... Even if
named 'tags', this is handled as a single tag, so we couldn't
filter on "os:openbsd". We need:

   :avocado: tags=cpu:cortex-a57
   :avocado: tags=os:openbsd

>           """
> -        self.boot_openbsd73("cortex-a57")
> +        self.boot_openbsd("cortex-a57")

