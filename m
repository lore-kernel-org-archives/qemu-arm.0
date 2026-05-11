Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB59CD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 09:58:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMNP5-0001zo-As; Mon, 11 May 2026 05:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMNOc-0001a8-JC
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:58:00 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wMNOa-0006MU-Fz
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:57:54 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so69771785e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 02:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778493469; x=1779098269; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lhiXJyub3Ga4ovcB3ChLg8d3yoUQcqBlb9R0XIGzwHE=;
 b=Lfsg705hao7XfhRzjUIYuHBVHEti1mi3AiFDQCsqpq/J2gvb+z6ONTTZJJ+ngxmAdR
 4qVPPmY1q23m4C2IoNqKngoQ+Wy7VI82mqGRDKMxvG9a+o+RRgkJDDdx+B4UX6MxSp+6
 kUyj0w3OVrxFE5BkHNutX7+pRoXa0pdmrMzfvRgSOgQyj1UKrGKMdmQLwxq/I9XC28z0
 K8LX1vylhJbzb2iSH1uCfTopVvKSbqD9lWVJpXCSNYFdRnXp7pMiFLW2O7YxHpQPgm/2
 k9Py4Zs1O4ZkUo7iQptyEqqb11V0sXZOenKphkem0UDTaxPce3Q2j7PGy6a3knr0Hvgl
 xm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778493469; x=1779098269;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lhiXJyub3Ga4ovcB3ChLg8d3yoUQcqBlb9R0XIGzwHE=;
 b=nWEz/yfGCn5p64KlToIQg5PamH8Fo1jfrSBibeX6wdQnj5tt2mBEgcaPjSxld6Bckf
 q3Po7I20YHNHVM9WIPhaDSk22TTcEswMwXb9BkQAEivd2il+CXeozkcIqTk8Thz5zkBo
 Cd0M8zZVoQFvYNyd391md+Y3Omoao8pZkOkCWN7gi4DzjUZetcSZVU5caWNw8LHIfxYd
 DaW1qVZPG+MJXwF6eJYFHgVr46fKPpcfnJ5DxRVx7/20ndAqyR1CRouQgJfcU8J5cpJH
 F98VTAq+2v2695bTS01Vto7NPW1KIrOcgprB/qQcP1FN+WUquaRQ1wGLsuazxySAerq6
 EDQQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9O58sjQPPpYh7lq+PbRXcXFfzZGqyWUlmpVg62n5x7R5luucXwvCmkz9XBEDLPWYTArty1Gaumdg==@nongnu.org
X-Gm-Message-State: AOJu0YzNbARhR+UTeACvjQqcHf8cZlXPi11fVGMtV5st3nuAPQb3ATO3
 7YJkbSMqsO/P8nJrPhSFmpNXlgCsG6NvLX6iNo6z3Q0Nb7p9kVGFmzN7+jW2chKujQg=
X-Gm-Gg: Acq92OE3+nS0pUxp7t7zK+au1QocI1SBjZfhubJwTNROaGgV0gs+HIonbsZtF6YldMS
 P5K9kqMBi01QO55mOYvg5u32Vk0euHinf1Dku6yxq9BOlQV7qBxZSTOLOkxKKRBKv/tn0Qxzvlj
 166IuR0X+laP4/jBkao/c3Kbxuz1OXMansQcJfhZHYhdKzc5UGBM2rSB4DeolQtxjyHjYKLaMuY
 qYZ6W5fSwyHhmGvJ4saofn/tKeRiGDNg2gvCoUpllH4y6Ie4m8RsKtjoW3waLV1xJ5thDA9y0OF
 LItMTo9bZoA35LeXNxxyOaIaNZEHGjStcE1gVOm/FOB8LjAeZbirtJkNUtW8Ie0Aj6UuGkIFEW6
 nsJusc4VSW1k6Joy/5bNRDE8fWHCUhfQvTwn86uobwMwjyq3OmmDWfNDSmNjs+jA2xRzbRcDfTU
 U8Sw/Od2eLh92LCATGyQ07DzixlQaVjaIy6OXE1Qlvj1CKtQyJKd78bGjbRwDbVFIw0A==
X-Received: by 2002:a05:6000:2507:b0:43f:e7c4:a36e with SMTP id
 ffacd0b85a97d-4515b525d56mr38128555f8f.16.1778493468750; 
 Mon, 11 May 2026 02:57:48 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454922715b9sm25841344f8f.36.2026.05.11.02.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 02:57:48 -0700 (PDT)
Message-ID: <9836d542-3234-433f-8db4-41f9722a37a3@linaro.org>
Date: Mon, 11 May 2026 11:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] hw/arm: Remove sonorapass-bmc machine
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, kane_chen@aspeedtech.com,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
References: <20260510165704.2935316-1-clg@redhat.com>
 <20260510165704.2935316-2-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260510165704.2935316-2-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/5/26 18:57, Cédric Le Goater wrote:
> The sonorapass-bmc machine was deprecated in QEMU 10.2 and is now
> removed in QEMU 11.1.
> 
> This OCP SonoraPass BMC lab server never entered production and can be
> replaced by the ast2500-evb machine with appropriate fmc-model and I2C
> device configuration via command line.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   docs/about/deprecated.rst          |   9 ---
>   docs/about/removed-features.rst    |  10 ++-
>   docs/system/arm/aspeed.rst         |   5 +-
>   hw/arm/aspeed_ast2500_sonorapass.c | 102 -----------------------------
>   hw/arm/meson.build                 |   1 -
>   5 files changed, 11 insertions(+), 116 deletions(-)
>   delete mode 100644 hw/arm/aspeed_ast2500_sonorapass.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

