Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp600811ejq;
        Wed, 24 Jan 2024 15:12:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKZlMenIfuzGIiKSz03NQxiChh8jrdLt84E00UAdFQP+/2KnS7YaEegbffiTfP0u9jLq6S
X-Received: by 2002:ac8:5dc8:0:b0:42a:35bf:413e with SMTP id e8-20020ac85dc8000000b0042a35bf413emr97365qtx.56.1706137950402;
        Wed, 24 Jan 2024 15:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706137950; cv=none;
        d=google.com; s=arc-20160816;
        b=CbdDoCRPHWSH6gvAgjYteV9pE+qnwpWgyggpC/E1V7TcTGt++MCB5HNAQ279G5XNwG
         Nf5r515xy6tUQuxtedYH+hH64oGqGoSk3i5jJltnsUpLFkZTos20WTdYovXu4RP0PJqm
         JKlgFJRPmbA9YS94H1mEw7qzd+HZoTxrnB2it7V7PyWZHrFafxNUqcHGBqT6NOY6ErMS
         JCka+eSgZOFrjo3kWWEN0s1Pq6m+MavcM+LqSt3NPSgVRZ5mt7+GSyMsXQJ3/z+zmytd
         hOCj+iDWuqMWG6vPAmibaqOCWr7j4aFih1ZeMYcxktj4Z0VmV+KQ1dLxsp3jUMy4BoAI
         lsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ooNjC5URG4Lz86seiX3R4uiDgkFfNlSMcOQI4mNAUj4=;
        fh=BV2EuOiWf6AH5YN8lynj7fi/DnpKhO3Y2LPVLIls540=;
        b=hKmhQXLNf+HbicCqoB0L0xLy0jqbDELRnCV+cyyEykgZJoeNZd3f/KE6BIn4t+SkDT
         +4FeWZjgiypz17Z5P57BKHkUkNXyacHAH/63yas74ucXUjmfTF9QIa9dZxAOj8ZZCjAQ
         oMCciEgPDIoYOvn7H5tx108i6Sk5K51FJ74kTWp7O4oF749uVgqH5adlEqbOBKkPuGBV
         v2OVqAVRF+MfxzUctjl5hcpfIl7RQdWscO4zJ85XpBKvC7N9C5WJ/28Wh5L6yE5FbSck
         hLT1Jlhtjz6adFQMsyzZ6parMdwlKyDRBDWFT4SCsa8aXRk7BKdYu2o7bjbSkfQnmZ6z
         lu+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHyYmjHa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5-20020a05622a174500b0042a2a89bfc1si11220378qtk.251.2024.01.24.15.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nHyYmjHa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSmPM-0006is-Jn; Wed, 24 Jan 2024 18:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmPL-0006iH-BA
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:11:47 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmPJ-0003wl-Qn
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:11:47 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6dd80d3d419so1871900b3a.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 15:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706137904; x=1706742704; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ooNjC5URG4Lz86seiX3R4uiDgkFfNlSMcOQI4mNAUj4=;
 b=nHyYmjHa9lAWZbwQ3LnGmUvXG/G24oWnjPpRXzDKzWmWuNvFcW8gPUZxM9Cf7NboBv
 9qszf3ORlaOotqLKlV95QwMrRxv9s+rCzFdwEGXjWKmAidh+xhh3ruhm8gJzor0cHcLb
 XjZe4zUbp4Usq/1nkgrWiYPPGO5ZCnPDZGu5rj33KT8hkRvPAopkB5pP4N4Sp1LfXQIb
 8SKHeP3xbu4oNfb56eqE1c8I2tY9gFDjXyMJMlEhluSSg1EIHzPq/kZufdrsVv2q2uTM
 eq+gv4WvOiBOAuCz7Hj4Dmj040dA2nDA5oW/edgVmNrmRywUq6c0PEao1h+ZlCV6o5z+
 U1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706137904; x=1706742704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ooNjC5URG4Lz86seiX3R4uiDgkFfNlSMcOQI4mNAUj4=;
 b=EaKvgkgS8Ec/7R27fQL+f0sQmkPeLG7oVi3jU/DNSslRtmO87/jWUBdv9L47tSoOS1
 bFQz+0nKPOMmHk3Jhx6+kbGt046NufikZgeURgyaWWwOSNtclnKFStTo8X5cYpN315Ls
 Xk/0FOdljlIms9IoM5sxk52gmHWn/GirKkJTaFpc7Sjud9gtYL0WoHx3WEXWRXNPdeOJ
 fqanYG10bWaaImfW6epCOPjNQDUWeJZR4o2+GS9wOanYkeDHdCL3cYHETaRoRSZdKgJe
 FPJCwxBz6/vF1ziWvmxRJc5WdLCyyfHXbsnQAKN3HVIX5CeTjmP623LRI5G3iiOAZ5sO
 SuIQ==
X-Gm-Message-State: AOJu0YwJs8vWEbeItpZOn7ZQjpBZqGQczOtceayDeaAQckGyjOkIgnTY
 A+h+GisPLcmHJEoC9WqhD1LsVHBzATAQgWP3N5P0gMHNtCp1bDIfNiysJ3MC8mI=
X-Received: by 2002:a05:6a00:18a2:b0:6d9:cb27:e47 with SMTP id
 x34-20020a056a0018a200b006d9cb270e47mr302674pfh.18.1706137904441; 
 Wed, 24 Jan 2024 15:11:44 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a056a0010c100b006dbc750ea5asm9684090pfu.196.2024.01.24.15.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:11:44 -0800 (PST)
Message-ID: <2f66bba4-992c-4af7-a09f-42bbf2540dde@linaro.org>
Date: Thu, 25 Jan 2024 09:11:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] hw/arm/highbank: Add missing QOM parent for CPU
 cores
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>
References: <20240123222508.13826-1-philmd@linaro.org>
 <20240123222508.13826-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123222508.13826-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: f17xaXdIUjsI

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> QDev objects created with qdev_new() need to manually add
> their parent relationship with object_property_add_child().
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/highbank.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
