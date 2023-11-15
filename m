Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2821486ejc;
        Wed, 15 Nov 2023 06:48:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEz5zHNaTLJUMiIRJ6x6Wa0tQypXNeOXZwM3di/KW4cQs+LQ+VbpC29kyEM2Vdn0rcJn1ix
X-Received: by 2002:a05:620a:244b:b0:769:89c8:4fae with SMTP id h11-20020a05620a244b00b0076989c84faemr6401171qkn.52.1700059692889;
        Wed, 15 Nov 2023 06:48:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700059692; cv=none;
        d=google.com; s=arc-20160816;
        b=gKSxNReT1VkOufe2+mIwi09QXtrd/FFeP/3IgcB9IH+7JTdFVpG4o/c70dJfNB8rxR
         /1Ar9hjkr/shq3BgCc6hsbH9YrPIk3fe+y6NF0D9T7/p9Qw/xHPou8DWt/BpD0Wb4Xah
         3IFoURO7ZgJNx0s5xxMubNEHcNbOSarmxNWhkDvrveJZNcOd73gwWAge8rHhV1YcG3qS
         PKbnENnw0Bv0NI+TaBGKUU5eayqtroEt/iTaNqCjE393KQkzdcyUfIH2NApXA/aDyxlV
         RVB54ZakEBP1F1r+gsO7t+TRyJnGvzL5u2R/gtzzeiD00cnB1yoo+3wMJWj1sWlkt1di
         U1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vkw0S7izseqIgzkkW87TLP0K8eZgtlZhVNMLwo1dlp4=;
        fh=1ZFdxd4lJGX8/0EXKONIPHogDKApTYxrJhmoD5HcMLM=;
        b=i69MJQLXSli8XIea2IFjczkuXeYyVbTQCJrTMPUsOa+LYJAyjcETNDQiEZo9rvFZjn
         gP9zgvRPaMqx9bQCf2GlGkS7FSu6hVQsVSkK5OwLypc2Ke9cLmKaYkmzS9iusLLzz8Hz
         zG2+8NyYpGxOk4zJfOeP5gvqzkbQ+3wsdM5Ejfy6PVCVdTLPwu8RgwfzFh6VVfBRHsC2
         aAS4JrL2xhcVOj33sNhcn3bID5MM/0akGq1HmTLcqJBDIvJWytjXEQYpLMGUTFCSZTVE
         QSlLU/wOuPbZqSblYwE6W9k2wsGbtin/CxjxAufr2WDL6FnqNNwaa8LOLavMbO8BRCjx
         OSzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmDAH4KC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi8-20020a05620a318800b0077575bac0a5si10088706qkb.98.2023.11.15.06.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 06:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XmDAH4KC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3HB7-0003OP-Qq; Wed, 15 Nov 2023 09:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3HB7-0003OG-8p
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 09:47:41 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3HB5-0000Nf-F0
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 09:47:41 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40859c464daso55276465e9.1
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 06:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700059657; x=1700664457; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vkw0S7izseqIgzkkW87TLP0K8eZgtlZhVNMLwo1dlp4=;
 b=XmDAH4KCZSvQh0MbuWyNRFttOxvSqoGKJoUb/DkBQuCtdzhQnx7a8udUp5TSvH7AHE
 KXDZgRJjRMe4qoW1hRxCNl1WISAtSK+zK7b9dztTEiFo0SAcfjcSA4DOXpAYTph4w2+D
 251JsAM63oCEFh468diDyiblr0f3oV7mS/jg9pCuODFgU42P2YzsmlMLf79Sr0Yr0QjG
 1RoRzpSWuQsIn5C0mHZqfrgQp7rDMfvJUrrtvmKpzhb4M6xEwYMiyVZl1gr6EXdSPw8G
 Bu6wql5L1MsO5ZHEjT+idiOD5hj8gdhX+aIMwa3s4Cj+sCe7V75jEfd3fpNKrlbolie9
 uZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700059657; x=1700664457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vkw0S7izseqIgzkkW87TLP0K8eZgtlZhVNMLwo1dlp4=;
 b=hSU7Y1amVqR4+qZ9Rtkq/XOirwM3ef0+pSKcfc5p5PcKXQ6HZQeLVg/vKjtsHRy2YJ
 loKI2XgW15T04Mte/TyqOLOxA4Tzw+XxJC0cVQYtPFwWGf39S63WyU7H/+w0ym7MhEof
 AhEHq57Rpbm/tB+KQzuVYyb2hA3/qx017PpQTvOVPFA1MHq/2044l8LGFEd7vVrfEjDx
 6MpBPW8HEDgE20tvvJcOEnma21mY6TH67pmnYDKOwB6I7II5pKeFxsa7lQ8TIrcEcsUW
 SoyPkefAwwz7to5+k2EVxOhijWFf0zCEtRh8wyX4Yt+YIYiLXPCNlcZj7IPVGvV35Qag
 IyxQ==
X-Gm-Message-State: AOJu0YyTMuDe4x+u162O4Ljv9ApfFaWICTXAfaS0MkcyrPf/oe0WXmPi
 nQZPzb6SIoA82z8l7lsyHVieWA==
X-Received: by 2002:a05:600c:4f03:b0:406:f833:d853 with SMTP id
 l3-20020a05600c4f0300b00406f833d853mr8693295wmq.15.1700059657507; 
 Wed, 15 Nov 2023 06:47:37 -0800 (PST)
Received: from [192.168.69.100] ([176.176.130.62])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c350a00b004097881d5f0sm21198422wmq.29.2023.11.15.06.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 06:47:37 -0800 (PST)
Message-ID: <8455c237-2908-4a10-9438-0ed6b5275d92@linaro.org>
Date: Wed, 15 Nov 2023 15:47:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 0/8] hw/pci-host/designware: QOM shuffling (Host
 bridge <-> Root function)
Content-Language: en-US
To: qemu-devel@nongnu.org, Max Hsu <max.hsu@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Greentime Hu <greentime.hu@sifive.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20231012121857.31873-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231012121857.31873-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: i5UCQzeOm8Lt

Cc'ing Sifive developers :)

On 12/10/23 14:18, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> While trying this PCI host bridge in a hegerogeneous setup
> I noticed few discrepancies due to the fact that host bridge
> pieces were managed by the root function.
> 
> This series move these pieces (ViewPort and MSI regs) to the
> host bridge side where they belong. Unfortunately this is
> a migration breakage.
> 
> I recommend reviewing using 'git-diff --color-moved=dimmed-zebra'.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (8):
>    hw/pci-host/designware: Declare CPU QOM types using DEFINE_TYPES()
>      macro
>    hw/pci-host/designware: Initialize root function in host bridge
>      realize
>    hw/pci-host/designware: Add 'host_mem' variable for clarity
>    hw/pci-host/designware: Hoist host controller in root function #0
>    hw/pci-host/designware: Keep host reference in DesignwarePCIEViewport
>    hw/pci-host/designware: Move viewports from root func to host bridge
>    hw/pci-host/designware: Move MSI registers from root func to host
>      bridge
>    hw/pci-host/designware: Create ViewPorts during host bridge
>      realization
> 
>   include/hw/pci-host/designware.h |  20 +-
>   hw/pci-host/designware.c         | 376 +++++++++++++++----------------
>   2 files changed, 187 insertions(+), 209 deletions(-)
> 

