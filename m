Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp1298989ejb;
        Tue, 11 Jun 2024 07:43:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+o+BDWa1tqhLEKaRAJAmuJG/zTzwTin14WX53FWfcfDrK0DSLdQV0HC8XRSHuWTadc2xRkA/UctMwBvpE8ZtfSjFksvPM
X-Google-Smtp-Source: AGHT+IHEt4g4SO9bZLt5XFjdg6Yslo1FVtdav2oIdgbMEtSk9o0M1pPq/w7+IOYReWSDrt5nt8xN
X-Received: by 2002:adf:ecd2:0:b0:35f:1f6d:bac with SMTP id ffacd0b85a97d-35f1f6d0c08mr4297510f8f.26.1718117006104;
        Tue, 11 Jun 2024 07:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718117006; cv=none;
        d=google.com; s=arc-20160816;
        b=J7ybq2BO9pH4mA2iDePccryP4YNlz0WKMDeuMEXhU5EMWp3851RZIT9yO4+bMxawNn
         dWru0tulRdDRdGg0zqY+A9TEiq1dgobDvzLau8z01v083k8iPo7v+9duMJBeDDCK9nrQ
         gFMs5/c+H5KSxqL/zMTw2wz0Cp0l4kL2aNtogzVW0F7sIa3h2Ay4Di76dNYL/x34mKlp
         /XJBcrwmVktgTLhL6rSTqjxEwm3Bp7s+6y7ctVc3mQi3qH3mzUlNWq+lSYCRwLfm18F0
         t9I6rY7rwnSwWaP9mHg5pNLJrk3WP8buI7mtoaqpoPsK6Sp8fW8ucyjlypfj+Q9N4kbn
         Masw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=PWXCS/ShO1VjkwkUPxbHgZ97GAoGArUOIrXRzfQrIu0=;
        fh=141MY+usyjBRWBgRpgn+jc7Ggjqf9XIBbbkwokJ8UZ0=;
        b=Q6vwB2UNyKdhiJjdkkRbEvMfol9H45zNE+1Kwwan5UZlHAjHkyHZjoqr1vb7vCNOR7
         Hap+l1lST2+B4XJDnP9K/2RNCSpTiZUyGFrtpffMfB2K29Yf9m+BMf4k2xkKkirEHv42
         zNPn2d8+ZjpXAzq9n3EBzdCs9WbMAYua+L2mQGMTr9uxwwPKpS2tEFYQmNAP+Hf/PUbu
         pmKlb3aKOoBQBZSMkjIYY2sD0iBlNfg7AgvamA0+EarSmqm5bp2jSqM16VkcShUoDZjx
         652mkT/+3h2g3+rVuMsfznQkI0PW5LnwIRd+UI55Kju2Lb31K97IqhYiSTcG3o8xCG2E
         Ecjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W0G3vyZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35f1008bc40si4767187f8f.532.2024.06.11.07.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2024 07:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W0G3vyZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sH2i9-0002xB-4c; Tue, 11 Jun 2024 10:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sH2i8-0002vH-7r
 for qemu-arm@nongnu.org; Tue, 11 Jun 2024 10:42:56 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sH2i6-0001nB-HK
 for qemu-arm@nongnu.org; Tue, 11 Jun 2024 10:42:56 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so332124466b.3
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2024 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718116973; x=1718721773; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PWXCS/ShO1VjkwkUPxbHgZ97GAoGArUOIrXRzfQrIu0=;
 b=W0G3vyZAQ3HSKjFC/sM748zvWWfnCuf/jz6bH6ikLVSYmMAVjPbtlNcRfoZh8BytZU
 j9IlkbUJ2d/HtBaHT7BVB4AhnvJsObN0m+yg9FNVh9IIKFxAAUClEzLmiaSHOPK/u5GX
 mavd9sFQaH+jWPjf7EntLFf4ylk3QZJSUnqVJxsp/KRhXhNRWIdei8QFMMnO4Aj/lNCz
 4J3zUxZ9sYuewEga/q0XmFm1zfYycq57ig30CitknMFD73SIaUKH2yu22e3P+lg4zmZU
 aRn/IoqKYm+/NgWjHGjqxPtG6ofpOpfvY9OM1Fxwc46lUNMK8NccNR+mZfMsvKbqVUe9
 EtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718116973; x=1718721773;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PWXCS/ShO1VjkwkUPxbHgZ97GAoGArUOIrXRzfQrIu0=;
 b=kXTZ/p24SR2wSq12hF1Ii5hUYqoLHR/x6frfCYkMEJ/Alm3b9xBCvPS72HcdvDAzqc
 plHpqyuaTJeU3nTBwbBCkMmzitjBal8u8yC4PeCVUVjLv1vaJNlH2UyyrSrqN8lGknOA
 g6o95YnjeKvsfAqovDO+iMpDq5IzXXhxvlk9y7c/sV3GLDUZh4h9UsVoJhBjM7EB3mQc
 SKJZZ449OWeKEbRnNzX/kVl1lsvW2wkcSr7gG4nQEs0oPtIL8Vkzaj8Zd4CAkP8Li2Yb
 GXy3O02dL0b/O1P1CVpa6rYUIk9kdZbY2/Nm/WaZTyNMTQjzr+TK5nyjHGw95yiWXBsP
 aeAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBB3zomgTJwNrnYx04V0ivcfvpd/pk5qqKKwG0CXMhkeia/iSbhojlFbMzqbpAgOS48ZiygTzt4fTvTxgzDOf592xG
X-Gm-Message-State: AOJu0YzqUCXmSDe+ruFve39nzAo2O/nDAw3O6NzNYkPS1EBGB0sVcxb7
 t5mLkFFvCs0fNXJG78QC0+HomfAQT1sb9TK1VXFT/wz5zClwjeUF2FYfI4rUZCPkXT/fpX424Tf
 C
X-Received: by 2002:a17:906:3410:b0:a6f:3f75:41ac with SMTP id
 a640c23a62f3a-a6f3f754297mr67268666b.63.1718116972977; 
 Tue, 11 Jun 2024 07:42:52 -0700 (PDT)
Received: from [192.168.69.100] (rsa59-h02-176-184-32-6.dsl.sta.abo.bbox.fr.
 [176.184.32.6]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1244180bsm376451966b.116.2024.06.11.07.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 07:42:52 -0700 (PDT)
Message-ID: <01dce86d-9644-4a97-b066-0496398b3c56@linaro.org>
Date: Tue, 11 Jun 2024 16:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw/arm/virt: allow creation of a second NonSecure
 UART
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240610162343.2131524-1-peter.maydell@linaro.org>
 <20240610162343.2131524-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240610162343.2131524-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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
X-TUID: wPFnjmNhKXB/

On 10/6/24 18:23, Peter Maydell wrote:
> For some use-cases, it is helpful to have more than one UART
> available to the guest.  If the second UART slot is not already used
> for a TrustZone Secure-World-only UART, create it as a NonSecure UART
> only when the user provides a serial backend (e.g.  via a second
> -serial command line option).
> 
> This avoids problems where existing guest software only expects a
> single UART, and gets confused by the second UART in the DTB.  The
> major example of this is older EDK2 firmware, which will send the
> GRUB bootloader output to UART1 and the guest serial output to UART0.
> Users who want to use both UARTs with a guest setup including EDK2
> are advised to update to EDK2 release edk2-stable202311 or newer.
> (The prebuilt EDK2 blobs QEMU upstream provides are new enough.)
> The relevant EDK2 changes are the ones described here:
> https://bugzilla.tianocore.org/show_bug.cgi?id=4577
> 
> Inspired-by: Axel Heider <axel.heider@hensoldt.net>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Tested-by: Laszlo Ersek <lersek@redhat.com>
> ---
>   docs/system/arm/virt.rst |  6 +++++-
>   include/hw/arm/virt.h    |  1 +
>   hw/arm/virt-acpi-build.c | 12 ++++++++----
>   hw/arm/virt.c            | 38 +++++++++++++++++++++++++++++++++++---
>   4 files changed, 49 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
