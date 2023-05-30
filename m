Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2452836ejb;
        Tue, 30 May 2023 14:28:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vdjrD9iW68ubjWeYYMbJLFEX4gWevC2RIZj8U8bgPxc35uXhlQSFDmPnaaJH0T4RPiOE1
X-Received: by 2002:a05:620a:1b83:b0:75b:23a1:3605 with SMTP id dv3-20020a05620a1b8300b0075b23a13605mr4304459qkb.22.1685482128857;
        Tue, 30 May 2023 14:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685482128; cv=none;
        d=google.com; s=arc-20160816;
        b=AuBeLg9CfjvvnjLqKF0mxEwal1o/INgniA18tbkNByS8HI0xvwMuF4DRx2HyPKKRhL
         CBbL2InjQvxm5ZzsRWQ0F8TdWLudmx8c2rbi1JMc5M6splnJ2IA4V9MZgyZf47mJpuSA
         xdJ4uimeKXsqw6137B/nB/SfQTVKED105G5GlYZo95urU4Ce5bJDAsxg+JRAEbvJf566
         GHeWc1m0cpVUSXotyTDkc0FhP2pY0aXc2ikhk0OF5aFAoWIzBQt5xhHlddsljjKijRHN
         yTMSN3q1x9428cukbyyPKnzPHvUUneNgT02sQKx54FxjOW6Zq6KIA815L5GzJwbyu0B8
         nIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KU4oEhlGRxerWvIOMGjYmW6SMeqdbHKL537lQ1kP5x8=;
        b=YgfNIUj9OFgbYT1OfdFH3hJBaAShDk24HDILOx7S03cz2O7M3A0r2iJh5UWcDhCb6w
         xzSMna+3hcPjBTeBk1WVfTJH8lOitS89rz4PCbCYlIm91V+GTHllg8SStFndtnGCIeHt
         mY509CdYlCfMGdv7Js37kfCFQCC2EM19IaZDYqj8eeuq9tnHevRC2o+VAtSEHkHhlKxU
         GNpeAl1Q93+gbs94rcpJ8LNgVTlN/0QqiQkO/nnbUnxXppkY+5acD+Kwg/ILZDzQ1Pz9
         d0GROA00uNipFIKkGccizTnlBgS0DVlNp9KS8UJKn5/VNNa7GGumP/SphVfmPfxCFRHD
         f8/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bERHJyx7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c28-20020a05620a165c00b0075b233a91a1si7111003qko.234.2023.05.30.14.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 14:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bERHJyx7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q46tT-0005oL-4q; Tue, 30 May 2023 17:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46tR-0005iT-L8
 for qemu-devel@nongnu.org; Tue, 30 May 2023 17:28:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46tP-00073e-J4
 for qemu-devel@nongnu.org; Tue, 30 May 2023 17:28:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f606912ebaso52470725e9.3
 for <qemu-devel@nongnu.org>; Tue, 30 May 2023 14:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685482114; x=1688074114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KU4oEhlGRxerWvIOMGjYmW6SMeqdbHKL537lQ1kP5x8=;
 b=bERHJyx7757KEKdEcvsduOTmS/a57KgEtlw642MKI5imuqQ/a3RVEygc8FCihrrkvU
 P+iuASG/hcuo5IluHmB0k70kOtkGSiJsbRA31JxGmjGUdnP8sW0iBLBytQwmCqcgyhcu
 2L7nI6NlK1pgCWM+9sSBITB8R7sqDmb2GYfGF9VfrPZSljuls8qWtCURyhyAGcTH46oW
 d/UJuDIB23S3/BLZIpG3MEDAggYG7zZlSGhS5+JgUCuErxaxLXc0oJAtKeR5WIsk/ALJ
 rh3fyD7tpRKN2mhHtLCG+aJ+B+bimXbt4mXE7/49Wg30kzTuifs00KHQGKwzIgWbQhnB
 e3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685482114; x=1688074114;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KU4oEhlGRxerWvIOMGjYmW6SMeqdbHKL537lQ1kP5x8=;
 b=IPsjYwuc15Uxgqpg/m8eyDCeYt6eCs/u94oVaowoW1k/YVzMiupYau8IrZ16yzeTBw
 6nnrxMRerbPyVObeJMKrXEOl6eZLDEppNmbuk4Y3JWfrIcnC8i60p8TUgGihhF1YIa5M
 O/isDZX8Z93TgI7ybUdI+csIhPoHFq6F9L8Sy/BtT+RbOMcPcBIhvI8Z6DwPL02i80uY
 gek50oUb2+yID+I98U9wQ5IPSf8SMI73eoEohdyxLgXh8grtVXVkBKj/C+Y5UA/TFTnA
 OTloJkV1HQ+p4tBu5J/qV/XJ/dXsk/kQ3Nsr8XQJ3S6L6E2oonA1iDA7Szpvzm0T1oOL
 BvFw==
X-Gm-Message-State: AC+VfDyTYb244PEyCOU8rdhJamRxwzV6h1m4qizRW2AxiCrraJQ6sO0C
 ouxeQub4Q48dPQkTDxl92IGizQ==
X-Received: by 2002:a05:600c:ac4:b0:3f6:906:1195 with SMTP id
 c4-20020a05600c0ac400b003f609061195mr2337586wmr.35.1685482113799; 
 Tue, 30 May 2023 14:28:33 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a7bcd85000000b003f09d7b6e20sm18471215wmj.2.2023.05.30.14.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 14:28:33 -0700 (PDT)
Message-ID: <27928a06-ff10-6300-23d6-8185c8f4e952@linaro.org>
Date: Tue, 30 May 2023 23:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 02/12] aspeed: Introduce a boot_rom region at the machine
 level
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508075859.3326566-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: adKyF6oSVdK+

On 8/5/23 09:58, Cédric Le Goater wrote:
> This should also avoid Coverity to report a memory leak warning when
> the QEMU process exits. See CID 1508061.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

