Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp2283298ejb;
        Wed, 15 Mar 2023 01:48:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set9I/+cr37utwVSY0/8moVZa1KdoPULv+nMkKcTmUIxW0yHZTE6eoIqISc6S88/Gp/3tGNcq
X-Received: by 2002:a05:6214:c88:b0:5a9:c758:ba0e with SMTP id r8-20020a0562140c8800b005a9c758ba0emr15124798qvr.16.1678870104312;
        Wed, 15 Mar 2023 01:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678870104; cv=none;
        d=google.com; s=arc-20160816;
        b=JDge1VQFx28Le2HvGAWz4+rE9y08GJAMdAK6FELmH2dmEcbZpuZYZxv2ACyJ/0pAuc
         6T+ZaLHyALpsgzC1Klkt2jMjydZwVLb+k+IxgFixQKilH2vvfw3Kblu1Zub4R1wU86lI
         C7S0OaCmNAsvxvWHwAbN6gLk8pE1MGh+suIwR2EmrlmiPEghdq7LfGkZG4TXbmwB1nHh
         uz5FAsbmInAMMUulgjQ/xZjHQsfTN25E6e3dSIf8z5kYPaTw103NKpLfHhxl3xfMuIfr
         wtwOfaReVeVEOOARW4Nku0o9He1ftH2me6Ihm2WNx/GcW1s3DyF9KuiU26vuNCj6zwXT
         xKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4yerwE9+4vPstoVuHRhEh4PA689XsXccyStWiJuEUPQ=;
        b=WPU1aW5F2o1osESD7ZEAhw+vlILg/a16LWvy9jCx17XLXLJmXxkNjI0bHJpH3VFRYZ
         RgbcRRHjuwnPxWzt52Qed+SbNV3UoapNfBH+Y9c0/+wgQJx9u8jjBd5HKnzCAk/xQwWA
         TtY8Y/3LGIIsMouyhNRjsMI47hgkL1V5BUsm4Z+nucwVOsAvSnFH2Ge5HMFuE61CZBrN
         7rqayNF5u60PKOJtQcDHy+3ZHJsOSRFY/3Qyfc7kWoHOv3LTu8xLNMbbRNMQLhRM2y92
         1E2WcumNGnfqVvVBDz0kx/pB28eh92V2Ek6uLzScrz39pAV4EAr/V8aR9XbypxNpKQN5
         p2gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xoDAAUjW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23-20020a0cb457000000b0056ea329d455si4095218qvf.16.2023.03.15.01.48.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Mar 2023 01:48:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xoDAAUjW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pcMnU-0005qv-PQ; Wed, 15 Mar 2023 04:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcMnQ-0005pV-FZ
 for qemu-arm@nongnu.org; Wed, 15 Mar 2023 04:47:44 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcMnO-0005mI-Sk
 for qemu-arm@nongnu.org; Wed, 15 Mar 2023 04:47:44 -0400
Received: by mail-wr1-x435.google.com with SMTP id o7so7161096wrg.5
 for <qemu-arm@nongnu.org>; Wed, 15 Mar 2023 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678870061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4yerwE9+4vPstoVuHRhEh4PA689XsXccyStWiJuEUPQ=;
 b=xoDAAUjW1475zxjbgGmouLq71XvjXUzUgsA3Gb2SW1DYgntPfDPV/SBPJ/8blG55qe
 SD7E8sQXlEiKycN1uTenVsmySOobnK6CwoV0TOAJ02Szi+y8IDhmMvDg5cLGdU2BRp0b
 xXopvT3DmWyVww9lDIY5zS86mdGJrttgHy2APUD48qAvA1vBXJW36YX9dIu/mfAnXM58
 USK5Cmn/Tg/jDD45MqasSl8H3AtSGe8m/I+8cuJWQYWnhnH61UNh2sr9vYE/KKY3U4Kf
 7Nw+Igt637haeoMN80PilySMLqMWUJtUZRy8JLY9+672e6a1tBlilRND39cVY2T9bmX7
 OTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678870061;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4yerwE9+4vPstoVuHRhEh4PA689XsXccyStWiJuEUPQ=;
 b=T+EBvWFr0MtPqa+ddaTYuULX+SJUUT07W647LuqdUT6Tcj0yWp0GG1aD3JxqaNlJVR
 Qw/OabvVkDnlpeCzCQEkE0cKxl+nGvoFfFWH7/ffd8KtICCJHG6SC2N2D/eh0PcuuOzy
 ZmjormNOIhdWxILzYfIjCQcFa7S+Rtwlf5+oBFy+j2ULeCOAsE/SZV4NIkWofKwzFSEc
 bHztFsusr0hOh0axFJ5axNs/P/Sxwi+6O2eBLZo9ZkgeXwbQwo+tx4RFQ+faQuk7dYZs
 qGNcy+BFKzRSA8Xtenn8kZOJFKZGnB+VVNfcx3kW94QFYmrkNw+dlz6wSlK+N2Xg0Ai8
 yv1g==
X-Gm-Message-State: AO0yUKUKLUHuxi/lcQQx/n7qK6kLSHneqG8x95ftd9Cc6V7jPNcAKFLa
 iHtp5tJFfY7MFhLEx6I9341irw==
X-Received: by 2002:a05:6000:128f:b0:2d0:4321:b9de with SMTP id
 f15-20020a056000128f00b002d04321b9demr648390wrx.39.1678870061189; 
 Wed, 15 Mar 2023 01:47:41 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d60c8000000b002cea8664304sm3990672wrt.91.2023.03.15.01.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:47:40 -0700 (PDT)
Message-ID: <158de4e2-47e5-d3f7-84a9-56fe5882986c@linaro.org>
Date: Wed, 15 Mar 2023 09:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20230314170804.1196232-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230314170804.1196232-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: C3/GpXO7IvEG

On 14/3/23 18:08, Peter Maydell wrote:
> The cadence UART attempts to avoid allowing the guset to set invalid
> baud rate register values in the uart_write() function.  However it
> does the "mask to the size of the register field" and "check for
> invalid values" in the wrong order, which means that a malicious
> guest can get a bogus value into the register by setting also some
> high bits in the value, and cause QEMU to crash by division-by-zero.
> 
> Do the mask before the bounds check instead of afterwards.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/cadence_uart.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

