Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp239602ejb;
        Thu, 30 Nov 2023 05:55:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFN5Mqsrb811+cDzJqbFQ/Zti2LkBM3wmqi9as0EpWB7k0XIpkcFQs0hUxEbG94r8AIacU
X-Received: by 2002:a05:620a:4409:b0:77d:992d:4147 with SMTP id v9-20020a05620a440900b0077d992d4147mr22371788qkp.57.1701352538359;
        Thu, 30 Nov 2023 05:55:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701352538; cv=none;
        d=google.com; s=arc-20160816;
        b=KTGzMwem4F313PhLjHckCUedlkxLlP55quS30L0157/xSS/Ezs6hxHkMc6SLA6PEUL
         GioIo5C0JZp3vMEsiotumOdhyEaNQHt0xv/LDSKrUitEQ9z4f5CA19BmuADxbNiXVW2O
         RH20K3duvIfhpsuImwIm+yEqtRr/hgbn0+PR8x0cXfcrvvz13vuDSocoW5MGSLV9/2y6
         rNAMwxhORGdmccoWYPYvWqvqHP2KJpYWijVLpqFAmqhaTTm45Np+Kdl1ePyncRyznYXF
         UPyyeRzuq2238/p7jTAQLgjMwY0YqHo92jyowL5RagTr9f32Kd7OFaG3bJ/6eGiyZ9Xx
         r8+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Tevt+WSS9yMSg7Lt+dXXra2u3BFLuZRamfvpgWuwhAo=;
        fh=/RrdLm4Ou7UIppr7mujMEKLdAFCvoPW5qzhA6BPQrlU=;
        b=j24R4JCNzHpTQY+AIAVQl3gLdfUKid21hUpasMcM7BmwLnax0/SB2C7JtY1IfWxy5j
         JPTjBwb2mdyCYwK3q9nbZeVFxkr9vhEHxrFb8oROEjsFYBKLM5FUzpITOA1JXXJ6XNfj
         qNpGdxgNDHX9gmurzoPBbW8uVJbpcQkh64UvfDnhprarOGuJrqnhJ55hNQeKWB2c9bNW
         V/H6LlMlzzQi+f0XmSk5DHaR29JTDGbdLNSskdJWMKHKvnuq9HsQkv4KHZTasAdQ4Scn
         6OaHgGN0zS6f+6t2hp+SfOBGGHwoxH7+rPyakRxWi0RRl1QYLT1MS3gWrxXS2L6bSelx
         t4oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6aa11yj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl34-20020a05620a1aa200b0077bc0ee2d5bsi1090461qkb.351.2023.11.30.05.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 05:55:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6aa11yj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r8hVW-0000MD-8P; Thu, 30 Nov 2023 08:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r8hVV-0000M4-Gy
 for qemu-devel@nongnu.org; Thu, 30 Nov 2023 08:55:09 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r8hVU-0002H0-19
 for qemu-devel@nongnu.org; Thu, 30 Nov 2023 08:55:09 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6d84d9e55c7so604523a34.1
 for <qemu-devel@nongnu.org>; Thu, 30 Nov 2023 05:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701352506; x=1701957306; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tevt+WSS9yMSg7Lt+dXXra2u3BFLuZRamfvpgWuwhAo=;
 b=a6aa11yjk7IFaOUbTCWXPeTVi8OT7QyZghjSrH0hX4AnYOBWaErXqT30Bk1t1i5JAF
 6mfoj/821hUQW9czThrHQ7vmfg7CPaFvBtQYhojKIwZWzCucXBX8mwNUFc1pZBtLRLep
 KmEUQnie0x9cZzf1df9peR0xQUvrUVzisGT2DskiZw4fOEz2GLwz67IvKk1a9aRr8Pcb
 M8CTHjaI4O1Fvk5LyjSSDvgtiX40/N/FLteEerfY0EGANbrAZDYzYm/1hIQq3TZDR2C7
 tuKHsY0ln7HZFqG4xKgsT5ZY1gzormXTV7KXffRghJsqXkqFurBpqtqylC4hQXlouzya
 P3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701352506; x=1701957306;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tevt+WSS9yMSg7Lt+dXXra2u3BFLuZRamfvpgWuwhAo=;
 b=bZX0nOxMkEHz3SjVu9WbpmbOLOfOuxtrLso7hBtrVzr0PdFxG9nWXm25Tj9jJjzDlS
 4CYMuYtbThWnHRcf0mNJMVzA1YQWU8if/y/dwcW4yPNkJVt29EjceOtyPihVAX6TpzfW
 N4S4SM76YCAjnzyCrSOnaDdCIIlLdw4RpZvFKELR7wzDZDev0o8nL4fwIrcnbtFi5B41
 6f0u/bWDJUANKlss4MGPK7z6Tl7e2h9iSRcycSwWG3lBwm9kfTHjREVOHYCN6cRfYwWK
 Nc5dA2af2Hxtmqpu20SFPJSKJb7cUekRtWf9iW4lb66jyNdaZr/9Z/ElzvEjkaFuQNFz
 LqTg==
X-Gm-Message-State: AOJu0YwAmxVzLIA5jp439dVuMRVKWrEteuAjAaVpHI074D7Lgx7dxMkr
 JW/QHkaHY3YYvsSCiINwqMDetQ==
X-Received: by 2002:a05:6870:2b1c:b0:1ef:a87f:5d52 with SMTP id
 ld28-20020a0568702b1c00b001efa87f5d52mr27275141oab.6.1701352505999; 
 Thu, 30 Nov 2023 05:55:05 -0800 (PST)
Received: from [172.20.102.4] (rrcs-71-42-197-3.sw.biz.rr.com. [71.42.197.3])
 by smtp.gmail.com with ESMTPSA id
 lw24-20020a0568708e1800b001fa245269a3sm254687oab.27.2023.11.30.05.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 05:55:05 -0800 (PST)
Message-ID: <2328aed4-2756-43e5-8aaf-c0e0a44c0619@linaro.org>
Date: Thu, 30 Nov 2023 07:55:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0] accel: Do not set CPUState::tcg_cflags in non-TCG
 accels
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231130075958.21285-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231130075958.21285-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
X-TUID: oRY8qO3J6RZN

On 11/30/23 01:59, Philippe Mathieu-Daudé wrote:
> 'tcg_cflags' is specific to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Other targets already use it restricted to TCG, or are TCG-only.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
