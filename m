Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2174213njb;
        Sun, 20 Oct 2024 22:56:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6TM/DMmGQTluV4Tdl0mWIO+ZzSwcRSLpJCmQq+FBMHDd86uTMA80m2HW73olemTnYgPM+c8uyRLCtEg==@linaro.org
X-Google-Smtp-Source: AGHT+IH1r4FhwlYn5ht3zZ8bv/Lnx7UCTmPp0LR/X37FS1q4Ot9VBKqHAIFu9eCoL/osqOTtpe/w
X-Received: by 2002:a05:6214:3198:b0:6cd:69bd:ad06 with SMTP id 6a1803df08f44-6cde168010cmr140818836d6.50.1729490219338;
        Sun, 20 Oct 2024 22:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729490219; cv=none;
        d=google.com; s=arc-20240605;
        b=XbnbeSNPOTPz8yAqtyQVBIWS9MiQCqMXS0HAmjpfevJyBU+UgLMGuZYudy31SCdlX1
         D7PtM5rM4A3jdH0Ci4YEG7bA/qdwNl4SmwzJLEUWJw1xmDjW4m0QNMgjiHhp9TLIbdz9
         1AcXgtSGZgvNJ5hj+LzCCOcLERlwH3H97+nqqxkSIfUGoZ4r32rxBQcJwUOK3nmVHZr0
         H4rLeJFvwz5sAIlcRpeK1LjNT4ZeilEfc9Qnx8PJr/0E17HTs8JDEDJvlmJQVQaZAR2x
         n7e3cmYvCA1RbPuHkxJZqhH2Jl/aan+ziSRsybSCE9ma9U480AXvOg+j2UJ8mYcF7D3t
         VIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=9C/1nr+iQpNqGrojigUh4vnZaEsUT5yEaU/QimwQXAg=;
        fh=eN7lZ9heibeUB6u5SzBPQic8EU7Yz3B8TtcMbhjB3Lg=;
        b=SB0wJKiM54m6Wpzhm/eNAdTrJ/BfBFhpz3a4VN1A1l2+fALvTTF4sf7aUoRlhW9QUq
         MABZDzYW0fnO2sDBu2VYieGwv8JBwdMQnBgalKRHtgyCwSCjKgG4Osq3WtWq6jhzNFAo
         ybzwGfrc5920KKQ0ZcDn4ttRhihWYe3p3jTsn6oYhw7ijrJdDNaa7QkQIWa4yX6rFNPW
         EYTL0OR0SfE8gz/BAvIryFf2jXKnJBOMTwBhX2Ha2l/uLoGJR2ULsbGPR5JrfSykQrM9
         sG9duQXDBgDCS10Y0ehDe3H32lBpYbqgqRKJt8J3E91vXOCWzfzX00IMrV+XQ8hfHu9s
         XTqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce008f4bbfsi32799676d6.169.2024.10.20.22.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 22:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t2lPB-0008Qh-Td; Mon, 21 Oct 2024 01:56:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2lP9-0008QP-Cs; Mon, 21 Oct 2024 01:56:35 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2lP7-0005DA-Aj; Mon, 21 Oct 2024 01:56:35 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XX4Lf4hK6z4w2R;
 Mon, 21 Oct 2024 16:56:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX4Lb5Bhrz4wbr;
 Mon, 21 Oct 2024 16:56:23 +1100 (AEDT)
Message-ID: <396815bd-0a3b-4f73-8597-621f88092e90@kaod.org>
Date: Mon, 21 Oct 2024 07:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] docs/system/arm: Don't use wildcard '*-bmc' in doc
 titles
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241018141332.942844-1-peter.maydell@linaro.org>
 <20241018141332.942844-3-peter.maydell@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018141332.942844-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=cGEO=RR=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.17, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NWAGAppz+iiA

On 10/18/24 16:13, Peter Maydell wrote:
> We have two Arm board doc files which both use '*-bmc' in their
> documentation title. The result is that when you read the
> table of contents in system/target-arm.html you don't know
> which boards are covered by which file.
> 
> Expand out the board names entirely in the document titles.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   docs/system/arm/aspeed.rst  | 4 ++--
>   docs/system/arm/nuvoton.rst | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 6733ffd2b94..968ba88b997 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -1,5 +1,5 @@
> -Aspeed family boards (``*-bmc``, ``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``)
> -===================================================================================
> +Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``tiogapass-bmc``, ``tacoma-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
> +========================================================================================================================================================================================================================================================================================================================================================================================================
>   
>   The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
>   Aspeed evaluation boards. They are based on different releases of the
> diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
> index 0424cae4b01..05059378e55 100644
> --- a/docs/system/arm/nuvoton.rst
> +++ b/docs/system/arm/nuvoton.rst
> @@ -1,5 +1,5 @@
> -Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
> -================================================================
> +Nuvoton iBMC boards (``kudo-bmc``, ``mori-bmc``, ``npcm750-evb``, ``quanta-gbs-bmc``, ``quanta-gsj``)
> +=====================================================================================================
>   
>   The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
>   designed to be used as Baseboard Management Controllers (BMCs) in various

