Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2171988njb;
        Sun, 20 Oct 2024 22:47:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3CGkkW77OZX3iwNGwR5wxK4LD3kEKQ8f6cm8kuexb03AN5Pj9mCIrnvl7sj55gt6Igcy0v3IOgXW5Pw==@linaro.org
X-Google-Smtp-Source: AGHT+IFZw6h+TGoMAg+slhUePpBYEYPfNsoMijo5XwJOwmPw1hYscIZkTDIZmQ3ErOcU+W5swGNp
X-Received: by 2002:a05:622a:2309:b0:45e:d8a5:86f1 with SMTP id d75a77b69052e-460aecef55fmr161699391cf.10.1729489661712;
        Sun, 20 Oct 2024 22:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729489661; cv=none;
        d=google.com; s=arc-20240605;
        b=WuY3xgC80j38dp3eA2HvfmU5pnvJM856R4pzKPfBZH0v6wbZ8t84oa5P1jD/BPGhSi
         BxpLmQHLTCUrAilMvyW5DaV2qNFAcAompzs28xyrJ5Q6CGJsxdirzLFl/MKMHR+UOOU2
         O0BID30YWtgbrM+Noq8s/hIafjawXNZBhRoKpgsP3Vt4izoqO4Oh1o4PUzLDniQey+Le
         nsNqdyXSSq3YcXm5dkthQWKpTyJnuiwOGFXo9XTwGkKnAVyTFINCRTS4Rud8hLAv3N19
         v8Via5g5pKo9OYOz37UxQmdZbWdwzty6CZlOtZKQtV4BTTQrABA+ps4xnStGFIdDv80C
         LWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Ks4ZiNEtNI00WuqUAxTBmZRugJ/Bhon7A1owUmBdeuM=;
        fh=eN7lZ9heibeUB6u5SzBPQic8EU7Yz3B8TtcMbhjB3Lg=;
        b=d0xUpjMIcWTuGq2D/gSpihX68+qkQ+RvZLVX8Q8StiYl2u772m/ki4Lh/2uYQSXir0
         6BMZaN41SW3fscUF20t5h7QBp02ZH7G1payoroOtMxBiihydMVyOEsYpJdbIqZNA6m2/
         IlvQOtfEaxpAFGbeXydgqW3OQ/Qjs72lOWz1A3a2Sqj3xMqIOXGOO1P6PMKA4PPNVp8t
         OuCetYirr3Nj0B/xvS63XrQZKsrAsMonEXKf2OwDo5HdD811kDtCMWTNhGeypRFGq0n1
         3UQbfrpMz8ugtP2Y3gv3dqplxAtPjRAOqadrDXfFm5zsB9mp8aG/S7AED/9sw55zrIX6
         stsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3d9475bsi32227411cf.676.2024.10.20.22.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2024 22:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2lGK-0004GM-Ls; Mon, 21 Oct 2024 01:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2lG9-0004EX-Op; Mon, 21 Oct 2024 01:47:18 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=cGEO=RR=kaod.org=clg@ozlabs.org>)
 id 1t2lG8-0004H9-04; Mon, 21 Oct 2024 01:47:17 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XX47t3rbWz4wbv;
 Mon, 21 Oct 2024 16:47:06 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX47p6hrRz4wc1;
 Mon, 21 Oct 2024 16:47:02 +1100 (AEDT)
Message-ID: <b396dc9f-c38a-48b4-9ee1-a3dd1eed2c15@kaod.org>
Date: Mon, 21 Oct 2024 07:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] docs/system/arm/stm32: List olimex-stm32-h405 in
 document title
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20241018141332.942844-1-peter.maydell@linaro.org>
 <20241018141332.942844-2-peter.maydell@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20241018141332.942844-2-peter.maydell@linaro.org>
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
X-TUID: fEXdPsZVDJdA

On 10/18/24 16:13, Peter Maydell wrote:
> List the olimex-stm32-h405 board in the document title, so that the
> board name appears in the table of contents in system/target-arm.rst.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/system/arm/stm32.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
> index ca7a55841b4..511e3eb9ac1 100644
> --- a/docs/system/arm/stm32.rst
> +++ b/docs/system/arm/stm32.rst
> @@ -1,5 +1,5 @@
> -STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``stm32vldiscovery``)
> -========================================================================================
> +STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``olimex-stm32-h405``, ``stm32vldiscovery``)
> +===============================================================================================================
>   
>   The `STM32`_ chips are a family of 32-bit ARM-based microcontroller by
>   STMicroelectronics.


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


