Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4916052ejc;
        Thu, 31 Aug 2023 01:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXE4/G7Q/xgXfJ/bLWJcO6Y5/E6LWPCGm/Eqt0BftrlRZqGwiFmXJrc7Ftnp8e7VmuDiQr
X-Received: by 2002:ac8:5f53:0:b0:403:a308:3cfc with SMTP id y19-20020ac85f53000000b00403a3083cfcmr2154431qta.25.1693469661545;
        Thu, 31 Aug 2023 01:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693469661; cv=none;
        d=google.com; s=arc-20160816;
        b=VpGj0qG4Bde5zMWxFOhA53nALwfQuPA7mat+J0tDCdHqwjNyYnVx8OxSEqLpYeDywr
         u134un7xWQVqmfPM+AYcKTi1vHjiCHV/5UWyYfTodJxl84ee27m7f0VBe2abmV9NrxRo
         XmTGzyi67rJB7F6SSnqLs5Pw2NUIgziuHf3XZjmcUmQyRPUETj5GpeHkF0Y3KMqIx6jZ
         7uVqRevTyqD43yZ3rMMh/E1EwbobzS02QFoqzL2eVJydwDIdk9SCDaMcMIM1IOJU7S6f
         jJRTmQ8J95IEsdjzyIOVDQZPtYp68XpX5cgIpM5C98aUdZ5A7tD4bRxWemGNcDJ/tJMw
         vKmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uLOSf4IKR2u3nLq7YRvZKcumpqtqVZcRnAHRKPjSApI=;
        fh=QqthsvRPx6ugefmob08vnvxQjkC04zz2llF6QWhZ9Ak=;
        b=Px/iPhRQWpTDmglVc4IBvLhJB9wqPfYGofxThI3SU2tEiLfBm4UD+SkANLjnJqQLxA
         Qhmi5iMojEAO5ee5XYNvStvvIm5/V9tREH8eD3bxoh3jQmOg2E/PrsIonUCjPPw8VUoU
         B6Wb7jtbgsAfBgS/4ZneOvtyZAbOhpsE8vRMTl1s6Wlg1qeAKfnvCng2Vnt9v959HefB
         JpP24ztyygthRxMBWWDLkzYoScK+OVVMptLo9VQYfExfzdCNGEn5/juxI2P9G+vrCK1D
         v5pGDNn67OVK2Wa2Sq/HwCSZYyyGNJY6WKPTq3clSk1zjWXzvP1yUuT2KZUuFQ/kHRB1
         0dzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWNMdoj7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18-20020ac87f52000000b00403b950e782si493029qtk.592.2023.08.31.01.14.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 01:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GWNMdoj7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbcoR-0003qs-VG; Thu, 31 Aug 2023 04:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbcoQ-0003qO-QI
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 04:13:58 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbcoO-0005ry-F7
 for qemu-devel@nongnu.org; Thu, 31 Aug 2023 04:13:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401c90ed2ecso5259055e9.0
 for <qemu-devel@nongnu.org>; Thu, 31 Aug 2023 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693469606; x=1694074406; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uLOSf4IKR2u3nLq7YRvZKcumpqtqVZcRnAHRKPjSApI=;
 b=GWNMdoj7kN54Glc9rGv0AhSC7ws95yJYz8/XjHCec6jL/PD8zdZSnDUw2lhY29RYqR
 M4L5iYBw/qjbWGCAxhIWx0YwLOBssJvB2G+N0Ix62NnLzxLGIIKgMFMrihboOpxTC2xS
 XZoImDV6xYPiGx7SHbpGVslxtiFYmt9/keNaBDCXBMCrcreyL0MEm2YLpLUDc1Pb4wTQ
 ddhGJkS2HS0ZDiWFHlN2jYeaZQSsrkCaFUSMeZIQpdb1DCFpP3+gIrft5FZQdAAqosxe
 yXaDe7ifANxi6dMT2r9Jm49ajwcp7htzc9zAH61N6I1Csd5hDwYs9zUm/O/UU8j8Ih0u
 zOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693469606; x=1694074406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uLOSf4IKR2u3nLq7YRvZKcumpqtqVZcRnAHRKPjSApI=;
 b=AG+LWIraW2Gqra/hAYNKua3kSf5G5dG93WsMygaXEI/KzTw29htJalB13ozo9Br+Yn
 2QbQndQ98pGygNZZ3hS2NCxT6h0D5gvZIbh5Vd61D7AG/2fuRQj+gZU/wSxiwClV4x/I
 AqjCZV/nmWYDuAhUHRg5IjzYDkGQr3bRf04V6aw5veDtogu0eGIWKQn75LSyv+3Mft61
 oYKkRfqQUG5eBGz3hStMrabZfQWPfpuHcVNRDDh/K4znO0jJP7qohUpYfL+YfOx4jGm3
 wP7rsDD5YR0Li50xfhjNseN9xt8RlTXXDwpllGdks6+I1hgTM4/9MRGmuqa/BCx1Tazf
 28IA==
X-Gm-Message-State: AOJu0YwxV2M4Bjw+UnztpQdlo5+PQFzJwgFNcluDzkOO7Yu6e5cMiu8I
 7ABuE0FeuD7oB2D8MJukNxDFSA==
X-Received: by 2002:a05:600c:3641:b0:401:b0f2:88cf with SMTP id
 y1-20020a05600c364100b00401b0f288cfmr3938812wmq.40.1693469606245; 
 Thu, 31 Aug 2023 01:13:26 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a1c4c09000000b003fee849df23sm1168800wmf.22.2023.08.31.01.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 01:13:25 -0700 (PDT)
Message-ID: <02fb7b48-8314-4f92-aad2-ca9cf2ceaad4@linaro.org>
Date: Thu, 31 Aug 2023 10:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 04/12] hvf: arm: Ignore writes to CNTP_CTL_EL0
Content-Language: en-US
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230830161425.91946-1-graf@amazon.com>
 <20230830161425.91946-5-graf@amazon.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230830161425.91946-5-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Ki5d60p9NoMs

On 30/8/23 18:14, Alexander Graf wrote:
> MacOS unconditionally disables interrupts of the physical timer on boot
> and then continues to use the virtual one. We don't really want to support
> a full physical timer emulation, so let's just ignore those writes.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> 
> ---
> 
> v1 -> v2:
> 
>    - Add log message on write
> ---
>   target/arm/hvf/hvf.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

