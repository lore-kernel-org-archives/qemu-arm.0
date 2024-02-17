Received: by 2002:a17:907:77cf:b0:a3d:1c09:7d3d with SMTP id kz15csp395826ejc;
        Sat, 17 Feb 2024 12:41:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZziAET+e4zZl1xRJTS/yI1pWj4ipS9/38ZUp1Uk+0nUfgifS2WpBoDqeph8J3RNG14jO/ypaD3TZy9AGtn/nAGCeDnrEb
X-Google-Smtp-Source: AGHT+IGqegPfCBkqVEbWgAIBRJ+m0ZFv3dIM6Ymy42ABJUDX6QwTaE/I7fg1kGJPnTrcFc+6U1HP
X-Received: by 2002:a05:6214:c6c:b0:68c:c6cd:99ab with SMTP id t12-20020a0562140c6c00b0068cc6cd99abmr10987540qvj.18.1708202482329;
        Sat, 17 Feb 2024 12:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708202482; cv=none;
        d=google.com; s=arc-20160816;
        b=pRtRO8610Q3nUC/vRIy3aPlpRwbq9p7PLMCz0xfbXJk9nG23Zh8OMmRc/cgE8Emcr2
         nqZyDkecZrEKH5E8bbt2+IIIDXRXG4v4HLUZatzEIGpQ8WBxFAvuAUrUQFUjFvKDm7ug
         h2/OYjK48wjkGC4oNVcGAzwPJwW02dXRdkBXYc1wQdblF6ZG6700URcW1s8r+Y69reot
         1gGxZfn3NgN8eH0womSO3XqScWuWEjqQw2FMyucFRT7Ew0ZeqB1NOOkZsJxwJkjwZd4K
         4D0u6yKHlg9/m3GSRhUTEprcHUZqiKmAotQJGtKdyE2T585ZC59vnuiJvBFACw5W/lWP
         8G8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7JzjLBKap7J0DbzYGpEUhSjnn0WH/hYWUzSacKN7Rdk=;
        fh=0zwKSCtruJJzi8vddrofewy90/7O5QoqFwDHr638A6w=;
        b=IPMZJQNrbUIthOuPypv0zq5AMVuBg5c6mzSAqkrYEVT/efzAd+7JmaPQki71g6FpE0
         kdyfdGgr92wLTcA/w0WTrWh9xvh4PTXupna53vGXycDOGt7c6VOt9EjA3tqU5aUnyPQO
         aTxPZMZC1YO69yJ5pH0ZbUiom+kKwWh0cIR896sT8H9EniBK2NqvWEkpHY8j8SUVxoX7
         801UDcJEMThhW5wdvWz7f+C56PGoRqCEoCs2gvYbtPYRqW6t9cYGIr1oAxXR4MK3WInc
         F94A1axk/uQHosJMRHpWqvHGkzKcyzDPRM4q4/GM1NihlTSxFJ37HnHldGcbG7LxAr1+
         e5Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OH6YDULZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1-20020ad45741000000b0068cb6c24c50si2912692qvx.360.2024.02.17.12.41.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Feb 2024 12:41:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OH6YDULZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rbRUs-0001br-48; Sat, 17 Feb 2024 15:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rbRUr-0001bg-DZ
 for qemu-arm@nongnu.org; Sat, 17 Feb 2024 15:41:17 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rbRUq-0008Rq-2B
 for qemu-arm@nongnu.org; Sat, 17 Feb 2024 15:41:17 -0500
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3c13410a319so2043207b6e.3
 for <qemu-arm@nongnu.org>; Sat, 17 Feb 2024 12:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708202474; x=1708807274; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7JzjLBKap7J0DbzYGpEUhSjnn0WH/hYWUzSacKN7Rdk=;
 b=OH6YDULZr4yRCBkBHFQRw7YCCewqiApRrxHDTw8eZPNJUQLLl1Glq5NR4whb5jd/Wb
 YI6trk12c27OWcqW/xFi9bd6psGoRaFVS6sarNQA1scJcltCspfgVuSCGj+lgYcglahb
 N1R2qmvzhXFBc3z/F8VBCNAPYsQvJW7wwym6HoQyv0yUXACJfL42+P76Z5qh5xbylwac
 PgDKKDYsdnWuta5Vt/kXeKqqp84USwlsz/dXyA6uzz7c03RwgLR4LEIbzVJt77FCQDee
 LcB7Z7dgqojgH3d3/5luOGFgEeSKbGCNjZVBdvUcKURN/sopd0/k587ml9ZvBeCPBpYc
 iBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708202474; x=1708807274;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7JzjLBKap7J0DbzYGpEUhSjnn0WH/hYWUzSacKN7Rdk=;
 b=eukN61fJbT912o9/Tw1TFCC6f7r/gBC5HYTD0B9Y1r4ppC5m3tRRyS1tdFSi6PQVKj
 7t9Hw69VX7OiJ+tSCqEVjOTQScbXvaUy71GMvCBDkMTYJ5Ft1p07ysBCddjFw/UwUU/F
 MmiugBXUujBYIvnCbyeNaAN5uW8PQ0rgwIc9vDdzNtoN3nZVIPv9tlv9wHHYJ9rYKTY8
 4g8WlVZVqqOO04j/vjEpjXKZoImXQb0UbPPvoa27esMaJXyIpwFF+e77/nYGuhMoNIp+
 iz8D99T86AY3htgvMnAqk5y81mByWZHMF0MjOesiDtUubjiMQ8dkHxr+Z9WmJp2EuZMR
 K1zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX1b6ZCqn7cv+F6W6cEHoyO0louD4aqa8VF7yNHTi+rC0wK9eh8Ovvqr6opdXOuIUmVmbHM8vXlpt68DSFrNwJWVNK
X-Gm-Message-State: AOJu0Yz49ZuRJ9P0nuVPm7cShB96gjhrTk0jcXgwzT8ueBOC30HkKgxB
 DiookYwBEAnpttaKNOYZWMwPZIIiPXZBOL0qfAMZRzlAHKSFXbdag7m+UuCUCrQ=
X-Received: by 2002:a05:6808:22a4:b0:3c0:3733:bbe1 with SMTP id
 bo36-20020a05680822a400b003c03733bbe1mr10844398oib.30.1708202474673; 
 Sat, 17 Feb 2024 12:41:14 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 n15-20020aa7984f000000b006e0651ec052sm2049388pfq.32.2024.02.17.12.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Feb 2024 12:41:14 -0800 (PST)
Message-ID: <98343599-9a1f-4298-80ab-4c41c47233e3@linaro.org>
Date: Sat, 17 Feb 2024 10:41:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] hw/display/pl110: Pass frame buffer memory region as
 link property
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240216153517.49422-1-philmd@linaro.org>
 <20240216153517.49422-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240216153517.49422-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
X-TUID: Rv4iltHsWiCW

On 2/16/24 05:35, Philippe Mathieu-Daudé wrote:
> Add the PL110::'framebuffer-memory' property. Have the different
> ARM boards set it. We don't need to call sysbus_address_space()
> anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c    |  2 ++
>   hw/arm/versatilepb.c |  2 ++
>   hw/arm/vexpress.c    |  5 +++++
>   hw/display/pl110.c   | 20 ++++++++++++++++----
>   4 files changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
