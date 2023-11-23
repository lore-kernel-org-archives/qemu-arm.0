Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp322086ejj;
        Thu, 23 Nov 2023 03:41:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnd7jFVXU6l4lSX6oQahMavm/l9A6iGSilOQ/UbjlZg2pXBQupE1eJ2t8ysCJR4h807ucs
X-Received: by 2002:a05:620a:408d:b0:77c:1fa1:528a with SMTP id f13-20020a05620a408d00b0077c1fa1528amr6559324qko.51.1700739660274;
        Thu, 23 Nov 2023 03:41:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739660; cv=none;
        d=google.com; s=arc-20160816;
        b=LGgkH9KZivXGtWDYcrcoSooDoiEfwa+XvxJsg7rtub9l7XjBdMukPNhzy3b9z10Jps
         EES+m7S1F1+wWGDjmIZzE9C+CWF8vinK9JCFDkJ2eqicmH4OVYveSJiTPgBZvvUp2Qfw
         o0RKudjGkLzK0819LzQgPwLV3mBRA2c/sT4IfD3m7QO03bmwIMCeqh1Kw03g0qLpx4XZ
         Q+W7sAB0e5nzgnm3M/CNDhGZBCI/MUpaRydmhnFkegO9lCpVUQp6sm54sfhj2gPxfd2M
         oWGdpPrQHshqSaYq3xsQ8+caTlrs90wHcJJ4FfGnGmFgYXQX8ayPCQRixsBaamLe5+5I
         +RAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tg5tEsLSqPL1rKJe9uQFPwG/4KppfiEAqvLyfwo3yMA=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=b+ILOoqVst3fzzqi5fLkmALx01YjzwGIqF+oE2gqi6rB5tt8lUPf7n55uqeqcNmZeh
         h2pjPg6axhAWtB8rMeCSFJytCa9pyd5gapcXgjjSwoq9PLXr/P48K0wQtRVwlbBj2Lcy
         +XIJBsyibGMEMo9nsgkDekZrk+35kXsM5TCpPAtizMao/EERV5opXhUK1/gGDVqpIUxI
         tsF2aP7NM1+zlMMiMtGpb239GgP+E/9eORFNK/nRuFjhbflxuvx1juva2KEmFfUxxs3P
         ksRFmzG4aYewhif5ZFvWTQB8Z1Do82lbIb07HO1kj9hdkKnq6w1SGi/jV7hLzXXmAX/M
         fNlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Td7jeNvH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a05620a16cb00b0077d75295408si657979qkn.737.2023.11.23.03.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:41:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Td7jeNvH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r684i-0005wt-Q0; Thu, 23 Nov 2023 06:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r684h-0005wc-HY
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:40:51 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r684g-0004JC-1H
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:40:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso5895025e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739648; x=1701344448; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tg5tEsLSqPL1rKJe9uQFPwG/4KppfiEAqvLyfwo3yMA=;
 b=Td7jeNvHrnUxYkJR/m9cRDMnbfbvR8kiB3XbW8c+y4xwbZsk2nUukw3JApjCGquL3U
 0J6gGUmP7vWBykT9jrfps5chgxqsB3pZ/cGMSgQUrUVLqmY6Nnw4vi0b3fXHEEH9zks2
 lcvddDm7cS4Ahiva6j8zcgQeyL1etZfIxkNaTXD9JJTn5b4aD32+GZVlMYG+OlODdpAV
 tbbRrogqQE5rZHOZk3dfTa56AE6Tzu5CBRmoID850qSLLSsiwbobFrtUN5/E8QJVnggy
 U3HXkOs68Og1TezZvUDbC6r4izt7iVoXIppG9eF9cfYaeip7VJQGRoEgqlBiAL8f6SKV
 zO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739648; x=1701344448;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tg5tEsLSqPL1rKJe9uQFPwG/4KppfiEAqvLyfwo3yMA=;
 b=Fi8IWQ1JQxWzIAek/D3ZnnC8ePjhjRThw/IFJq4QFDZ1YDnmaHfU6XW3IWhM5RvQhz
 G9DGFA8/6TixstClXC7sPvdf/eX4m44x1iHgeKLC3K/HXU9qlDOLec5luKKi9PjPQ0L3
 jAi0OYqubG1RG5MZ2S+oMYfl+MiNBdy3H6pWrCX5LzgBszMtw4uuKFxCj8KnE1WIjly3
 YyKHZ6VBXHk3iD5eTx90NKDGSDS67emuoSJfbXXHtYmyl0JKQF6zYxb2rDgJ8WArkas3
 HPktVvNilZtyVfJVnzskbiNWsOgiEILkuXPYV9/l3LTAN0uK9u8+ttbPgkuG7joilUMU
 T2dg==
X-Gm-Message-State: AOJu0YwsmxHQwiW4G5vaOLcwL7hfvIyUsRlJxiuBmOHkcVSVqXnShPxm
 gA2+a6hpe9eQtv7BzJKhQn94JA==
X-Received: by 2002:adf:eac3:0:b0:332:e3ef:fded with SMTP id
 o3-20020adfeac3000000b00332e3effdedmr1027314wrn.31.1700739648357; 
 Thu, 23 Nov 2023 03:40:48 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adfa4c4000000b0032d8eecf901sm1455905wrb.3.2023.11.23.03.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:40:47 -0800 (PST)
Message-ID: <4d96f4cd-8f6f-4ad6-806a-f47e9eea843c@linaro.org>
Date: Thu, 23 Nov 2023 12:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/21] target/arm/kvm: Unexport kvm_arm_{get,
 put}_virtual_time
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: lg746QxGpRgO

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h | 16 ----------------
>   target/arm/kvm.c     | 16 ++++++++++++++--
>   2 files changed, 14 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

