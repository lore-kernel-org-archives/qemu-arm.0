Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp556720ejj;
        Thu, 23 Nov 2023 09:34:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7Df3hniGnZVjdjuVuQMELVcynk+hjaMgL1vmCIQd/f7wbR7n3mI57frGRBl9Cl3Z5fR+M
X-Received: by 2002:a05:6358:6f11:b0:16d:bd39:46a with SMTP id r17-20020a0563586f1100b0016dbd39046amr7685100rwn.14.1700760889255;
        Thu, 23 Nov 2023 09:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700760889; cv=none;
        d=google.com; s=arc-20160816;
        b=N90Me2XgDVQ6xdL4ljusLhRkEw1bwfw1YJIx57drDQo7bXoDBZ0UEEMEm7xsX/Hn0i
         OOirRK/y5FarEcBqIUkE3nrkXW6UibXtnC7d1jQdQtPe4hcGnuxFxQFw0lxmbz+p2TLr
         bsh0hGZn4FQ2yoWecaNjzLsSMm4HX5Ch48TcmI8uBXTsQbjdeI8bzKvLnXMb08wfz/D+
         NQUW9BsqifoO4BaLUHij0CrSQBVSq1wia+r1G9lPIeR9d3uSZ/hYzW7T8NrYo48O68BR
         C8X/1Q3Di3X5MgDHrkLbBlPuS+ADJZV+UvZYenGGLOGtvuMmay/rhzCYZMfILOmAzSTg
         NcEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ga/ctq7wtLLO8DBQq8FXYJC7uPEM2Wr720WzVAYdG/4=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=0NDAyAN4oSTlrriVdhlTXc/H7XBQESCWbQSD0PqFAA84EHbd1Kw4PjCNTs3YWMXwbB
         EeF+kH/0VaTQXL8QwBfGBd4PkCOwbgMqkRl1hP+JdrPTOTOSSIFktlN4+dGa7W4ea3ay
         IZ4YOns9esPzDrLmlkQEH4VoDkuNxfJqx7I2slQQB797AtsnIJu5Dz6SmY5OUv9xKsR5
         OosAoOWMoUMPLCR4UYYoyscJLtI//aeOBT7G40633sxGHmBH3TE8lNZRiUPLYfLPnvI0
         YTtjg3GvMbijGX6wmdZtcFExdKlGm0HjCjbocJiyKuuy4z1yOZrFsenkIS+1URosI7vN
         dP3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adCIpmI6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20-20020a056214031400b00679d9606a1bsi1535811qvu.55.2023.11.23.09.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 09:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=adCIpmI6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r6Db0-000446-N3; Thu, 23 Nov 2023 12:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6Daz-0003x2-Cq
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 12:34:33 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r6Dax-0001Qy-Ok
 for qemu-devel@nongnu.org; Thu, 23 Nov 2023 12:34:33 -0500
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c50cf61f6dso13463991fa.2
 for <qemu-devel@nongnu.org>; Thu, 23 Nov 2023 09:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700760869; x=1701365669; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ga/ctq7wtLLO8DBQq8FXYJC7uPEM2Wr720WzVAYdG/4=;
 b=adCIpmI6AUlr1EaFDoz5Rl4m0fvOOttGjq5nZZLmWuTNyn3/0i6jiyzlKVQzZj9MWV
 SDtbc2UX29JGtWYxrs3CmBGI73gxTFf4jz5AB+ggpGn6yu/RXpSa+NlD0WqPhWgBKHhY
 LX20Llfdu7q5MlMxR+4oqejTpIhPqyzDtrkDxA9VmZQzpxrPuMLntZ+EOfjSlaESO3/H
 FUk+73YWxE3H8mACUCn2ocOy5lUe5H81IzZ5wb7SnmaSDclWsNgfcSKQ/towibJKI9xx
 b7OVGkPdJtHWbqMiSBdtkNcvcJqLhWnV4ldl0dV7qOuoKx+uIN/IkAYP7OYveZXqL5W9
 xCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700760869; x=1701365669;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ga/ctq7wtLLO8DBQq8FXYJC7uPEM2Wr720WzVAYdG/4=;
 b=jk51fzVlVbTh1g+C93J6ge7Qa8OMD2FK9qKbSq9JlKzreqFArDjAWkf09F/DmlWGpn
 EUa2JzeXHIyqHhPTqoiTuPIHeCNuNXIO07RAismbvRVlj3AQO1gt9mbw9OWPujfIMFVk
 yoXhO1W6lU02kn/4Uo0CeP911WUmDU63evCWDnjh6j003kBimLybNUdTLGBv3hO14qXN
 MCYOTdxK6t0BicmrB+6BtJGL5bIIWtXY0KpQ7NAs32e7V6P3VK5zErSx052XPAILCgPM
 eiFjDF3QJEBcQ+/iOyB3m5CShAjIR4QDU8oEcSgUBMmppzS2JONtvqBujJAfxylJEhZh
 e9Kg==
X-Gm-Message-State: AOJu0YxQSiJgg+oE8bIErGpEnUc/f8/6BFj6e7xxvwMMXdqOHKEzJcog
 QlufViz1JWdIPfgFzsBXZcbkrw==
X-Received: by 2002:a2e:97d8:0:b0:2c8:83c7:4046 with SMTP id
 m24-20020a2e97d8000000b002c883c74046mr49386ljj.26.1700760868943; 
 Thu, 23 Nov 2023 09:34:28 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b00405442edc69sm3305072wmb.14.2023.11.23.09.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 09:34:28 -0800 (PST)
Message-ID: <ec96f592-63ae-424b-8f6c-dc8332744f8a@linaro.org>
Date: Thu, 23 Nov 2023 18:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/21] target/arm/kvm: Unexport kvm_{get,put}_vcpu_events
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jPyeoEP9+DK6

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 20 --------------------
>   target/arm/kvm.c     | 20 ++++++++++++++++++--
>   2 files changed, 18 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

