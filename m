Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3546549njk;
        Tue, 3 Dec 2024 01:30:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWo1Ugwz9ZDM3cLsnignPu4p9RPZs8e6T9KeRm8QNgzPLw7oBJ1iHvaSw4AFPRMY1wS0iUhGHpsdrSBxw==@linaro.org
X-Google-Smtp-Source: AGHT+IGRDiTUtWdEff0/En0Hdh2urKGE3P/Yi22W212SoH1T/p5SppBbw+SiK+97jnEx1s2b2K/B
X-Received: by 2002:a05:6358:4b4c:b0:1ca:9118:440d with SMTP id e5c5f4694b2df-1caeaaa67e2mr125186055d.7.1733218208290;
        Tue, 03 Dec 2024 01:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733218208; cv=none;
        d=google.com; s=arc-20240605;
        b=CNCoKlOzZfCsyKI+n4+0MSyEVTxImpgQw9YX8MCJTMrFT+CEQ1wq4Gqcf+E5QKACUN
         rOMa14IuWrquRlERs1zayzssbnvsP2v2VexZjSw29edxYxqpLJnlEmNiFuM4hkc3hIRx
         +ByCZUXqzlNrk3p49GI+XoyTRkNGbNGgTApzevyOMG1cnGBwACNV9fXjVrW3zPBcwfZ0
         HAd6DIXy1zgGBEIG+ErHLxBipqJGxHNEDa3A+6Is7LfHS/5aQntgNmGwI40OPLNOrQ7U
         5/DJRgxlBZmWoo812i13mYsU3hs9qO0jLjR7kF8n/auuCkWczHaBHRM+buoOR+MSzKhM
         d7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mUfwTfUP4L1om2jRfG39T/GQKt1AH0QtOiGjBnI0NhY=;
        fh=M2dybG0TOJ/BGkAjFV3Y0Cz9HY5MSE+KhqiLSsJa5q0=;
        b=dyz/OkD/S4YIP6hstqHRhgtTg7Rice4FmEKVXlQx4pFm/BvWOMOl3cMwk9jp52uibj
         vXXw+0QmnoM38rJtxflbl9ve0x2tbz8xeCLUtrMBRAGl3njw6C0XXk33es+5tbh0DpHj
         H+GCvUBeu580vRX0snADPrYX5tyhC1s6dS7Reoz0Zaew3/5fmMnBdRECYc/Sw6dEXl/b
         gySfhKfwA11a5pcrcJ5/0lpc/h/B9PVrlEzrMUAX97WRreKUm6CnbNZkvw17JfGEp5Hq
         YvcSNmDSGZpHLg3xxSJoBje2IxbZ23GIDcM3n24+bCiQ6PH6YwbOaxBCbRE5jebdDrOe
         h1Ug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uOhBHWXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c40544a0si138307041cf.135.2024.12.03.01.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 01:30:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uOhBHWXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIPE8-0003Ze-1d; Tue, 03 Dec 2024 04:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIPE6-0003ZP-Sg
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:29:50 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIPE5-0003Vt-G5
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 04:29:50 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-382610c7116so3484620f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 01:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733218188; x=1733822988; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mUfwTfUP4L1om2jRfG39T/GQKt1AH0QtOiGjBnI0NhY=;
 b=uOhBHWXTcwxwparEKXtzzeYAWwT1DQslWzFG65Kbl7v0S+5nan5ozWjvhXFCLwlm85
 +Z22yKdZwz/y3eQ9X+wXkmHVksgjScthorPBTIv2Qd1qz9xdZnuaiPuA+aDR0U6O9VHu
 81iCcfM+UEfyNbmyMfMG+QFoD8tuPbYsgqfX5eBZGOjTJEWqUaoYYs67V0pPy+wAJzsn
 wevXmlr0s9SMgLi6yDmliHNjvsnV8+c03mUqrOJ1p8sQgx3SzvtDIw2JHLo4/+I4Qfwb
 Eu0DddSMRf0E89sZgSgDEdzjlh/EzaLp6Glu1Zx3VsStC6pVpFC2DanOn8RB3pbdch8q
 NAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733218188; x=1733822988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mUfwTfUP4L1om2jRfG39T/GQKt1AH0QtOiGjBnI0NhY=;
 b=qqpkIsxLPdPTX4Ndg9G9FPNV2Icn1/DVBzI8q8eHJIN4/VAB6Ci+CExWJBZwl1nV7N
 qClaoJ5lsu8np1FcVzIoB9AUlv4lk8FB/PwmEhQjCfQ40cA99v0qnwfsTtxQ/eKurhab
 GPBFGEsVgbwHoHCRbZeSxhAKrZiWdTprgxf7YqPEsJYuuSxFMWCPh///rzZSzw4fY2V1
 AHu+5UC8ewfaOevh1v764ddo75USDcJbkFoz/D4iH8YWLwb3M51Ug/dSDpB/U2kqh73Y
 CXP3VLp9U0SZ1/ASPLcsgDTqC0uD3vjqEbxKAm4fy/8w8gyxs66GZh2KPS7XBHPRze6e
 wWuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFmBF/4bKPrRnQOSuKqrUQQLsa49expZKsyvPNy8I/8lNCloYGqO6yx90u85fh8qhdHA6NIzKm2A==@nongnu.org
X-Gm-Message-State: AOJu0YwRisxWRI/V7KaAaWzr24L301CMO+E04kYW74A5byeidS2SptYc
 buF4pHhFfqszVlJ7jfUfqyCWoKFwSU3QasI/6y/izAidlxZNcAKTt7iNWmm96No=
X-Gm-Gg: ASbGnctIN4AGoD5CvNw66RVs1Nz6yvNdzxdmt3Jvs8iO6R11jcHzcSnxIQfO6s3wcTd
 uVP8/5miLW2CC5foMyEG+OK7TMgspFwL64VsgYvV5rRg1blVzrpXklx0w/qySpyMV9LEcmlT4m6
 6m8umWFdE8HrBUd0I1YjZma9D6MqL4m3af4na3dZPqE5QcIjwsrvZZF0kFMqrz2GtLPO2fLhO1b
 hmPnIPusZ7RVcA5wTf1nkjFzyxmQmpX1PeSdFGBTsh2Q5ZK2DzJiqO1Axl2+1ynrg==
X-Received: by 2002:a5d:6c6d:0:b0:385:fac7:89ba with SMTP id
 ffacd0b85a97d-385fd43734amr1395324f8f.47.1733218187733; 
 Tue, 03 Dec 2024 01:29:47 -0800 (PST)
Received: from [192.168.69.223] ([176.187.209.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385f8448d32sm3405121f8f.96.2024.12.03.01.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 01:29:47 -0800 (PST)
Message-ID: <86e4b6d7-aaa1-423d-958e-28cf37022b8a@linaro.org>
Date: Tue, 3 Dec 2024 10:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] hw:sdhci: Introduce a new "capareg" class member
 to set the different Capability Registers.
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
 <20241203021500.3986213-4-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241203021500.3986213-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: XQlzIuFkhmAQ

On 3/12/24 03:14, Jamin Lin via wrote:
> Currently, it set the hardcode value of capability registers to all ASPEED SOCs
> However, the value of capability registers should be different for all ASPEED
> SOCs. For example: the bit 28 of the Capability Register 1 should be 1 for
> 64-bits System Bus support for AST2700.
> 
> Introduce a new "capareg" class member whose data type is uint_64 to set the
> different Capability Registers to all ASPEED SOCs.
> 
> The value of Capability Register is "0x0000000001e80080" for AST2400 and
> AST2500. The value of Capability Register is "0x0000000701f80080" for AST2600.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast2400.c      |  3 +-
>   hw/arm/aspeed_ast2600.c      |  7 ++--
>   hw/sd/aspeed_sdhci.c         | 72 +++++++++++++++++++++++++++++++-----
>   include/hw/sd/aspeed_sdhci.h | 12 +++++-
>   4 files changed, 78 insertions(+), 16 deletions(-)


> -DEFINE_TYPES(aspeed_sdhci_types)

> +type_init(aspeed_sdhci_register_types);

Please do not re-introduce type_init() calls. We want
to replace them by DEFINE_TYPES().
