Received: by 2002:a05:7022:4391:b0:7c:9548:a19d with SMTP id bo17csp2874760dlb;
        Mon, 27 May 2024 09:10:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVPsw3nh9b3flFFPtoDdakIY92RjsQ6nUblMaXxA3zwtMZoyH+q6L/gQPpoEu3fVeRzB+dKebFrrpU3sVkWjc+/NiwCLAN
X-Google-Smtp-Source: AGHT+IGt5fB2BUfthxP27gqHlhfoB3nK+HMZQzKgwLmQUl8CO/QmeJ9mt4BlE1s6qsaTqcPOjR/P
X-Received: by 2002:a05:6214:4a07:b0:6ab:9213:f250 with SMTP id 6a1803df08f44-6abcd10fc55mr116790276d6.60.1716826252802;
        Mon, 27 May 2024 09:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716826252; cv=none;
        d=google.com; s=arc-20160816;
        b=saBnxttyL9FXVG/2/3GUE5mjPxPCN1iocGKsjTgmLPOBuCxC2tN9RXUkQefFzUFj2Z
         X4dqxAdyPjcR8in1UY7kKhcrqyf4e9g69PtmxqkHANvOrkzlnk1sbJ6FVlMDbJygd4RO
         3DmaFvFYRTqsbcbu3smwtrvbyAB8+45iMEgbvWAEQYDezhIx95odPI6/pEW67OxGV2b8
         TlvcMomPHvSrrSfghl7lO1XNyszsQwQso59821RZ3KuVQDl61QpY39xuyV5JH8c4Jfh2
         FilDcja+d7htV5GMXIp1wwgN68L7ooiQnafiNe693y+7+5TFRFwlqReENMbICPMhaJaX
         oaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=R9qSmOdrCVnRR6Mk4dZsp5uLeuOZ6apDqnW//et28CY=;
        fh=GFN6Y1WPC+/eoxgviPbQjxqIdT1U1VoJGM2w+bjwVr0=;
        b=Fh63wjAFvkNXuUa3iR6Bd6L6LqfguG1YQyZq1KhANR2sX2/4/PuuJ4MmjQ6lp+GEgh
         VOQUSagPBanxAHRENVlYAcCUSLrbl3g4XqxOII1u1GCGtg6vmhRudEMNTz50vTVcq4rn
         YAwI27yQ8cXC7TLgk3d+Ef4KwNlwJDtA9gDD/Xv0eLDfQErsnsuf205grDrXNIBsx9Ig
         xS2IELpZyTGm8yBdrdPJxinbIZF8lGaePIbrS2d+4saVi4pKe59A0Nb2nl6WFRjRGHMh
         y5JQwBeGEpTzyI7O0rIi3U1tLFJ1hFhgg7xA+Xxwg3KO9j7MEeub4B0fuks5w9gIYMPQ
         Udxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KprlFfGv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162d9e6asi81117186d6.579.2024.05.27.09.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 09:10:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KprlFfGv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBcvh-00058D-6E; Mon, 27 May 2024 12:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBcvf-00057n-Lp
 for qemu-arm@nongnu.org; Mon, 27 May 2024 12:10:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBcvQ-0001by-Kx
 for qemu-arm@nongnu.org; Mon, 27 May 2024 12:10:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42102c51524so24723505e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716826215; x=1717431015; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R9qSmOdrCVnRR6Mk4dZsp5uLeuOZ6apDqnW//et28CY=;
 b=KprlFfGvgUOMXuMQvUfTs/ch/kDLdtI61lWvvJ1ZFVP6vZ7bFx5vJoAryT48PnPNWm
 EMH3bGIU7LSC8mcYrQWepX3qrgIRTGsmn3neeqZdFGi40ySKXFspOJhtKfNk89CiBqP3
 0smB7iZTVlVOy1/06vU+dinCYlBAgd08xZhuJJzv6Y8yO7ObJLNpTsKY8hXuAzFJBpfg
 ek/dAhLKopNcCiBIwouFXW5uZt+EDr9IzJgpSRRbGwb7DJuPsMfTU4gUevs4wnGkfYDM
 iXmVbn1Cup0LmSqgLqVgPYtKXQUH8+KDJR87nb5rvswrHnpBpvmU21pkztgynj8CqT1M
 tM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716826215; x=1717431015;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R9qSmOdrCVnRR6Mk4dZsp5uLeuOZ6apDqnW//et28CY=;
 b=qZmL5/2B+kqBW+rZv6IHcqnW9/B3tlzXBK4D6hP80Hta6chzXHjJYhr6dP0e8AuHOu
 XXiz7aQLOHQ8E766ascdARQ5ueKdCNwjNmnNmWsPRNvP3MTo+0DGIuudLwUBSE7g+Jqd
 9v82oz64FTC0VcnjwnnLBTSthBBxr6eQLqdeKixDi24V6MYxZ2TVCGhjOsIqKv7C5/Pc
 aBg9rssR6gSbg3DLkeFoiSxkt9pzTKH5TmRYpSKxz74gQGeq5y1dwxzPRlq1c3GjZNV8
 RL0/RvvVDUQTcuhDt6+u74k4ccpOg4VBAhWBl/GYbRXjlnRBvBun5LcrtD9Op54f3EDs
 IRuA==
X-Gm-Message-State: AOJu0YxO6XHDj8Il9G8IBj0e1Hmo7AzGiOISzGJojYiDHmOk2mllrWIz
 0eZAnK9EZRODjXwIc4A41oA/vb0a5ZcPcS8gU83X9c2d5P6H4q8Fq6Pd81L+ll8=
X-Received: by 2002:a05:600c:1386:b0:41c:66:18c2 with SMTP id
 5b1f17b1804b1-421015a6086mr105678435e9.4.1716826214964; 
 Mon, 27 May 2024 09:10:14 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421089afcfdsm113725695e9.36.2024.05.27.09.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 09:10:14 -0700 (PDT)
Message-ID: <f8ef776b-3ae8-416f-ba73-bf141bbd33b8@linaro.org>
Date: Mon, 27 May 2024 18:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed/smc: Reintroduce "dram-base" property for AST2700
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
References: <20240527124315.35356-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240527124315.35356-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pD1fQPA/cS7p

On 27/5/24 14:43, Cédric Le Goater wrote:
> The Aspeed SMC device model use to have a 'sdram_base' property. It
> was removed by commit d177892d4a48 ("aspeed/smc: Remove unused
> "sdram-base" property") because previous changes simplified the DMA
> transaction model to use an offset in RAM and not the physical
> address.
> 
> The AST2700 SoC has larger address space (64-bit) and a new register
> DMA DRAM Side Address High Part (0x7C) is introduced to deal with the
> high bits of the DMA address. To be able to compute the offset of the
> DMA transaction, as done on the other SoCs, we will need to know where
> the DRAM is mapped in the address space. Re-introduce a "dram-base"
> property to hold this value.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   include/hw/ssi/aspeed_smc.h | 1 +
>   hw/ssi/aspeed_smc.c         | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

