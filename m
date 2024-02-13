Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp248935eje;
        Tue, 13 Feb 2024 08:43:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUotsrlAUToaxNe73xR4SxJUuW6UXpIdksxsxCz2ShuSC4MIFG9IKjVYC2Covx0SL2Z4lyFbX6VrBzOEx3c0hbBrNqgYukM
X-Google-Smtp-Source: AGHT+IEwRGMPzXNaGuNqz9p2HsZayreA+MMGPbu7hHqvc1uvWkhuhXkruIoDeMyPjRw1LmG5o09c
X-Received: by 2002:a05:622a:1747:b0:42d:ac78:147c with SMTP id l7-20020a05622a174700b0042dac78147cmr3229874qtk.60.1707842616668;
        Tue, 13 Feb 2024 08:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707842616; cv=none;
        d=google.com; s=arc-20160816;
        b=knSYa1PDQC6brDKHWjfFmcHRrvcE7LPNgLFu5lrvUUC19YEcvZ02MFaOBxl8/LNatR
         TWDX60YkdWBj1Oc360bP07jCe9NA5+gZxgKKIVYxLRSja4IzmLprXOlXlKT/E6ftyOUx
         F46RFnVmTkmHQIUp6aBJqsCUi9PgJd2u4FgF2VYSUmQZz+s+cdYlFrq9gi7jD4vnSw0c
         YUR8D8EVtpw/FLBpkNjxcGGbEjBrseTjxF1ltOzoKEk0Ai8pBr8JTmiRmghpkXtcAdMD
         f4ewmJ4fiFmyaq4R+Uxhq6CnrTipUmsu1tl3Zr/TyUy7dymKQIwv/tutT/QGw4VbUMYI
         I4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FOwl5k/h1KDqksz2Wse0qLE2glUEserFMJa5leufMzI=;
        fh=GxpoUoiBp976JuVBLXcwuo+zuuGYfTMSpXyZSU3JAAk=;
        b=ohNpzLLTu8ihki+gqG1yrcPTY4m1ONXf/SovHRt5g0hMT3GzacrBV0fG+rEHMD05X+
         i4V4jK8WQh+JNzlRI0ZEcIGjxfTEexh/tqIK7pMmPMMsUjShVBYT9uGAIFxQLPAepAgF
         oQsWybevWOPqU94xxpUOYxNIip3Wlne49PJkNzGDbpCc4/+OPhPuL+MzCJfUO6etZRl7
         URgk1R2qynaSYf5TeYmoDWF7yGpd7mSiGenKruArnKT1OU8vBKpuZE36jXnhbQKxK69Q
         cF/mNTxZxL7+F+jA4awqPrmMHWOIc1gQ92pbC+yOND5O+SN+q2UrBWa39cFwIPpPfezb
         mFRQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TGvnTzqy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCX9JViF/vaRZWnbQyJ1ronH2egklOsKLBHRbl1q7IZdfU5tlhnhESPpcjWI+DJ5timM6zY9USVgsf8m2JQ1y9jzMCuucqjS
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020ac84449000000b0042c38359742si2884155qtn.271.2024.02.13.08.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 08:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TGvnTzqy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZvsN-0000k4-8S; Tue, 13 Feb 2024 11:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rZvsL-0000ji-R6
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 11:43:17 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rZvsG-0007H6-9a
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 11:43:17 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-296c58a11d0so3413877a91.3
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 08:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707842590; x=1708447390; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FOwl5k/h1KDqksz2Wse0qLE2glUEserFMJa5leufMzI=;
 b=TGvnTzqyUPXvkiOoiBvdQhHPISI6NM2PvZnHIV40YGbT4qRTBom3UhfXoWP2G+Mw6m
 JZ+845HPUHgbulXEuaREfbAwPH9DgnYEMMU80q5eH0crg/5vVhDIeH3itTF0DKGFFWtw
 M8oMKhQ0nUPdsjTpB8H4TIhnHD39gI7oJDvVanVTKOBRprn8Q2SnpJ++loitRezZ5TP+
 pvEpwvnL4AcQFhfEac5Zit75yPS/7ZlfBAN5nCB6ibo271neCtPs6Dc7YMdzd39ZMlvG
 DTDh1apSjI8AjhgEDACEl1FXOx422kwsGVAIqFxa6TMkanXMb00rNJQ87Y9I4s7EEeUG
 VjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707842590; x=1708447390;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FOwl5k/h1KDqksz2Wse0qLE2glUEserFMJa5leufMzI=;
 b=V5DbdxO5D1aigdv40LCjSPGQaI397F2cMxA+O2SqflburGqvA5WbUw8KeSSW4H5I5D
 JI1gWVRS6bMRkM+JvBpvf6wjxsB8mghXBgUjphWS1hA6dzitIKrS2eHQkfMdjgkj/re2
 Nf9YveSooj9JLqYn1JxWFjNkpVWlmfMNSge22WZmQFKwBjK0fwrHy8zqJ7AKgUR21HTQ
 UYBaQIzJB4wz+uhqelrqrQIoztZuyHYHejpPPWjQrJ3EVZW6Dgyu3h947QlP36qLfeCD
 9pxwz5hkP7q5aQbAf/zyYvs5Lu6OXOdG1Ypmg1tXiPm4L64BVJjRPG3osO/gY69EoLCG
 p0rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIi31+B9cZJf0cohJ2VayjW4hf4qi3g870/ERMLeTHDD4WsNkrbGAZgN4ieZZAHFQ4uGs7B3N6YRfsOZYPz3LAhyZ7
X-Gm-Message-State: AOJu0YyfuU+ILklB8cgYivEM6/L79GrbDigV0Lc6IJPNBF1HDEJ/6b/o
 dY733PYAXvknqNQ7ZkIrmb6LcbdQvwL0UopgIKzk/IPpvkCoED50T06O0vaNcyc=
X-Received: by 2002:a17:90b:24f:b0:293:f16d:e53f with SMTP id
 fz15-20020a17090b024f00b00293f16de53fmr64404pjb.0.1707842590275; 
 Tue, 13 Feb 2024 08:43:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWaYWXbC9AHWMMDSpbAVUbaLHORA05uyPGFkRGiLBjsZzO4QlLzvT24sWczkJm7KnwaO/h5jZ8x6EqvNh+hw4+xuaJtZI+vBMo18Mn23BwafnLupi16PJ4iXJhhtgzbacSIH2ckhf6yBWCczZ74KMp81JbpXdoxanW0VbW+SLEMwmAfxH163nUdh2rABaD5OdzC3FyidN0+g7GekWkXaT7SiyEzfux9Z7H2XrYUhCQGVB4V2ZV9ZzIfX44WZ0zMFVqotyJUWHcWPCOyMb8rjjSGX+uznGqzBAdSh+PBzBY0UzdDZZcGFW1Gtrg18qEHz+lvFg==
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 ep23-20020a17090ae65700b00298a1d613c4sm1832683pjb.27.2024.02.13.08.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 08:43:09 -0800 (PST)
Message-ID: <f2dd89fd-db4c-410a-bcdc-2a117e4f633a@linaro.org>
Date: Tue, 13 Feb 2024 06:43:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] hw/ide/ahci: Inline ahci_get_num_ports()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20240213081201.78951-1-philmd@linaro.org>
 <20240213081201.78951-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240213081201.78951-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: mD7ciecF86td

On 2/12/24 22:11, Philippe Mathieu-Daudé wrote:
> Introduce the 'ich9' variable and inline ahci_get_num_ports().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/ide/ahci.h | 1 -
>   hw/i386/pc_q35.c      | 6 ++++--
>   hw/ide/ahci.c         | 8 --------
>   hw/mips/boston.c      | 6 ++++--
>   4 files changed, 8 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

As far as it goes.  But it certainly highlights that

> +        g_assert(MAX_SATA_PORTS == ich9->ahci.ports);
> +        ide_drive_get(hd, ich9->ahci.ports);
....
> +    g_assert(ARRAY_SIZE(hd) == ich9->ahci.ports);
> +    ide_drive_get(hd, ich9->ahci.ports);

ports is always a constant.  Or perhaps that's only from this PCI usage?


r~

