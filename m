Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1432967ejx;
        Fri, 2 Dec 2022 08:32:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67IOhiaEPhG+eyI1FhToxoDkKf4isVGynT3hojCQxGN8bw7+P0k5lsEA2hEXaXe+Sz1Tzt
X-Received: by 2002:a05:620a:146b:b0:6fa:f548:7cfd with SMTP id j11-20020a05620a146b00b006faf5487cfdmr48706439qkl.103.1669998765536;
        Fri, 02 Dec 2022 08:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669998765; cv=none;
        d=google.com; s=arc-20160816;
        b=c28sw5bkKfjI37RpjZ3JRd7pgKRO5CWS2jrgS9iDw6/1yH2jq2oNUwqngCkfzr38GA
         RhQkZ5hQgDxq9fr4yAlwE/1/EKivHpG6d7muQkACOf0EijZh5x2gdEqcernXYipg969t
         cMccCwqo06wmy04ukOJAXQpEzJnEnzTSR54rL4rjzp1APRRNur4NvBfairyCO7Brw6fc
         CWp4qqY1b1SHxB2b8/VMV09vCdSWMA6lD2QJxYkgo59fg3mXDsxp7wTvGTnO2b+zKJLJ
         Z8NzRzSB6RkwQwzU6uhjUhIVRJTfaC5WSsVUh5LP2Rzwh3dKAlBnwUmAENdUWQG82oBQ
         vYqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IMcXz2RsnhT9TNrW2EhBFAT2x7c9/rQmHCw+cYOt29E=;
        b=NisKqcJJnYuB9++aR1OQ0isNDXjHE55WH6kdp82z/ZNJzxMq8UllQLe/ikNLCi+GIs
         ly96euO3OdMEvADpCZR4xkpgBYs5IyAjaTZXPteXxk2iCopynyG1RUM6WezCg7c+ocBt
         5Stw4/IxSp4WYGco2gVS4OT1y/MrbjMo8PXNyM5WTwu/hA7Qs7ItEcKI2mPgDlrmN8Z7
         zM+I0vMV3K1BRPSTrX9f05pScwbAfj0m8jR/AvzijUATDSJ/rjT1Vy1zBxGoHeBW4msS
         1d6NRszQ6ACgvqcFC3xEg+zkY451NsilsGuhKP5PeF8bzE+gyyVG9rqk5H6kLiUs821O
         pWIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nP2XQIgZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a280800b006fbf7a09effsi4396550qkp.647.2022.12.02.08.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Dec 2022 08:32:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nP2XQIgZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p18xf-0002tV-NN; Fri, 02 Dec 2022 11:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p18xM-0002ol-Sq
 for qemu-arm@nongnu.org; Fri, 02 Dec 2022 11:32:11 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p18xK-0000Al-32
 for qemu-arm@nongnu.org; Fri, 02 Dec 2022 11:32:07 -0500
Received: by mail-wr1-x434.google.com with SMTP id y16so8619905wrm.2
 for <qemu-arm@nongnu.org>; Fri, 02 Dec 2022 08:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IMcXz2RsnhT9TNrW2EhBFAT2x7c9/rQmHCw+cYOt29E=;
 b=nP2XQIgZiBnaasNqExzAUr5bzWIq+Q0kgR9McFT18lYLkZLxpaqBWbot33PZl+wTkK
 VfpxFJu7y4Gl1NEWKY4WTLKTiIkzY2akVDVOqdOsM4DhtzmDJJqCDbiglXmeGeVVmu8Y
 DSCkpLk6qj8nvWodMwaStMPWsIaEQhNCINMRccQWNxWX7cfi34ttuVZ9Od5KXMYan3gE
 9CaNNKnBTlLicnIN0yoUUh6htOUccAszbF1gkZSqyT+wveigjXss1L/4Kih+uHZidciv
 dY/B4cFLrj229dE43kSYZmWlVmo1Wwn2XYHNqLdpXR572Gwey4UmphxpXMoWj2f8EUK/
 dhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IMcXz2RsnhT9TNrW2EhBFAT2x7c9/rQmHCw+cYOt29E=;
 b=10PPD7Q0r2zSN4oS5e9u29/jYNMkr5DUy7WRnM24tR9Z2F7SZ+j4lx+jXXwT9hGQmQ
 YzLbRAKeC9tO75JK60CHg3IMqPCbFaOs/JAan38vZff58jKUH4KJDnbQOUIf+AVampr4
 Vd/XMC//E9zyEhlGvzZmoxWOjzv9JMdbyoJ7RghaSs8lpiJ+ORlmnJWdn9zCRuvg1IqL
 x1gPCHLteoIq7Lfe3wU6OMjTmuSO5vzDThFXPE1H+amHOOSWL1PPITEHR1+gIJaKyX6i
 3CYw92LFwW81S99mFpMw3BVSJG+GQR8gADuAW0DA2Avn15+QDbcKRsmuLu6b3nrw+B+0
 5ilA==
X-Gm-Message-State: ANoB5pmOEMf0sKO3nV9tD1LCEVhc0ljCVlQ8n5hhK74JI6PSQ84Wl4kS
 aoeud2FcfFP4Eq73kNe90RDFhg==
X-Received: by 2002:adf:fe46:0:b0:242:13dd:c4a1 with SMTP id
 m6-20020adffe46000000b0024213ddc4a1mr16127867wrs.669.1669998723911; 
 Fri, 02 Dec 2022 08:32:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e14-20020a05600c4e4e00b003b95ed78275sm9071927wmq.20.2022.12.02.08.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 08:32:03 -0800 (PST)
Message-ID: <7681b7e1-2c03-cf98-3d73-e2b9f3dd0a72@linaro.org>
Date: Fri, 2 Dec 2022 17:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2 for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20221202154023.293614-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221202154023.293614-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HJu/ko03JYmq

On 2/12/22 16:40, Thomas Huth wrote:
> The header arget/arm/kvm-consts.h checks CONFIG_KVM which is marked as

typo "target"

> poisoned in common code, so the files that include this header have to
> be added to specific_ss and recompiled for each, qemu-system-arm and
> qemu-system-aarch64. However, since the kvm headers are only optionally
> used in kvm-constants.h for some sanity checks, we can additionally
> check the NEED_CPU_H macro first to avoid the poisoned CONFIG_KVM macro,
> so kvm-constants.h can also be used from "common" files (without the
> sanity checks - which should be OK since they are still done from other
> target-specific files instead). This way, and by adjusting some other
> include statements in the related files here and there, we can move some
> files from specific_ss into softmmu_ss, so that they only need to be
> compiled once during the build process.

Cool!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Use NEED_CPU_H wrapper in kvm-consts.h instead of avoiding to include it
> 
>   include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  2 +-
>   target/arm/kvm-consts.h                |  8 ++++----
>   hw/misc/imx6_src.c                     |  2 +-
>   hw/misc/iotkit-sysctl.c                |  1 -
>   hw/misc/meson.build                    | 11 +++++------
>   5 files changed, 11 insertions(+), 13 deletions(-)
