Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2201673ejb;
        Mon, 13 May 2024 06:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBQ8tKdwebL7Ps3RU5oBbNiUD/F/cSiiloalDQuN2NMy/FWrOXJc+JDk87M28RtXiCP0O88RoIC4ZlBeNcc9FW16iRM8Ob
X-Google-Smtp-Source: AGHT+IHDSRN+EYAHHzSWrIjlqNk3gBouJRO8tuj3mrN5jddR2rtxqDx5OyuAEQcETL2Y/elv5Z9m
X-Received: by 2002:ae9:f71a:0:b0:792:8002:c2f2 with SMTP id af79cd13be357-792c75ae92amr1093876585a.37.1715608324140;
        Mon, 13 May 2024 06:52:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715608324; cv=none;
        d=google.com; s=arc-20160816;
        b=EAhruYm7p9wdXigultqNCJjl9pI6SCfGdXcpuKTrMoJ76+lbHJj77uo3u/zEGuzJpb
         k/idBsMM3drfGfx8KZGPk39nTo9ZBsEusgJQpMaufvPOswmH1M9f8vEFSwQHl3iykeBH
         Tgp99k6UAFbEaJ21QyVXwI1ZWMzb/nVl1iGibB6sE4hb/wO04hp2x0nzt8WFxf1O85fW
         zn/ELG3ZhbQbVLo7DyM23cjfxYhrtXjqmEZH/0k3dOfIL4VuWXxlgLIbs6QtCd0SCowR
         QEe0NB8IkRwHbbYFqwnuK2EcR2Lx+KMNdibxLUHWYs7zdRLfnq8pHwwu3F1T34yO4ZYL
         0q0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=82LYSb9QtxmGOJ7FKKd622y2hJxOOUzTKXszhiub2EM=;
        fh=02Q5UEEySkFUn4Ns+VHUxx3Hzd4V8tISBUgwENh2Fcw=;
        b=HkcTWNTYmiScNf5j+bFdXbMlUp4v/635ZpLbp9g9kYIq3gpFnXkbCpn+tQwls3P7MY
         ynwuzcBPHgYlzxKd7OntYCj1GlO3aro3PxkA+vsxnEypD2imCCrB2iwUOF1uHGNtH7tw
         IAV0BvE87sL3g9dRpJMPUKBCApbh7qwylbvF7ypNEZpymexhsrzEOj9gYoLAfEqKrrne
         E6Ub8BZJxvtzcYVbXoNhEjpzkC4kjumtiOL0MLMmknRs40XI+RPFBPR4oMFecsP6YFBq
         AzWhc4WfsRuB6IvYZdY9NFNMqvQSxyT78R4PaUxAt6PwwwJWwU87m9G1RimNjfJOZQEN
         ntmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KSgOrCjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf2777d7si945820585a.100.2024.05.13.06.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2024 06:52:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KSgOrCjY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6W5d-00065p-Th; Mon, 13 May 2024 09:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6W5T-00061M-By
 for qemu-arm@nongnu.org; Mon, 13 May 2024 09:51:34 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6W5O-0002Fd-6F
 for qemu-arm@nongnu.org; Mon, 13 May 2024 09:51:31 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so719907966b.1
 for <qemu-arm@nongnu.org>; Mon, 13 May 2024 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715608284; x=1716213084; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=82LYSb9QtxmGOJ7FKKd622y2hJxOOUzTKXszhiub2EM=;
 b=KSgOrCjYZp8zKirL0r9VLvAgExPX9xXyALT5/IFCIqU8BquZlI4iuzEaOntNd7b9cK
 1L+bSLrWeHxXcNI/vNFpyS20UgOUcAHcLfdpiqxOXbuTPfDj32HhQ8AHZKo8f7gTv0u/
 bVgSNHxn2VCvJn6Moj+xExlQgBozxmnJsckeyBPDnHvPgjdTNb5598gLHUYytIj6g3FP
 joiJPQdNZjAgbPUPpZegA3fJ/oBtz+ZMSJVbW89eS2kWCDNpiqLBsra4cUhELgd2Vq3v
 /3aiOnnbGoYcewWa4bwWXhZg/+w1i8btuYS/ATF/Rb74r+hrbjWwrzJzNzj6BD9n5vTw
 2MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715608284; x=1716213084;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=82LYSb9QtxmGOJ7FKKd622y2hJxOOUzTKXszhiub2EM=;
 b=C6KxfWjMVDaHN8rZlJRdPAP5pCpc77UEJCKKuAqbiSTvljmtwKIX9amEiGDsSGZDDt
 uNIRHSkQMJn5F2eXyqrzP6tA+rQk2SY6a+fy73f3S5J4Fgtaaq7qSVCLDIJ1Xf+3Fq3F
 LUZ/HIxv05RWeONmnT6XV+0Ru1a72x11O52AXLWX1kvJRCTWvmW+AfrXuut+YLnMQFtT
 CCnedEnpXy/dTvy851JjAzpT1sCMv5ePt2w7T8ZWDImE29od9TWju05nxn+FLZDBzU2v
 LDJCQuDSS0M9ASs6f2te91o8mmZlXZ6DYoJ8leOGzpad2UoyXDT2uwNBG3OQomR0YAO8
 7GzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNyJ9L9kokM8mtO2f3PXTT4WBbpqcAzqBtUAmj9orSYsysQvG2FM1UR+cMdr4zalR2YBISKWWS0MGVKno7CR8PDNwh
X-Gm-Message-State: AOJu0YzEuwxhI5Er2jOeSDu0I1QKPRImFvboziC8Ry7leph5F7CQ2SnJ
 CxHyFG9X1UlKruE0dHkNWcz0DdvEB1mvw6IYcN66JDO4ZXLtmPG037rFs7GWqB8=
X-Received: by 2002:a17:906:17d9:b0:a5a:177b:d8d2 with SMTP id
 a640c23a62f3a-a5a177bd952mr1009852466b.22.1715608284482; 
 Mon, 13 May 2024 06:51:24 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781ce4esm612859466b.13.2024.05.13.06.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 06:51:24 -0700 (PDT)
Message-ID: <fd6de35c-dc98-4900-b542-946a132ca0f1@linaro.org>
Date: Mon, 13 May 2024 15:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hw/misc: Implement mailbox properties for customer
 OTP and device specific private keys
To: Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20240510141010.656561-1-rayhan.faizel@gmail.com>
 <20240510141010.656561-4-rayhan.faizel@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240510141010.656561-4-rayhan.faizel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: tC/VCtv4appV

On 10/5/24 16:10, Rayhan Faizel wrote:
> Four mailbox properties are implemented as follows:
> 1. Customer OTP: GET_CUSTOMER_OTP and SET_CUSTOMER_OTP
> 2. Device-specific private key: GET_PRIVATE_KEY and
> SET_PRIVATE_KEY.
> 
> The customer OTP is located in the rows 36-43. The device-specific private key
> is located in the rows 56-63.

Better to define these instead of using magic values in the code,
i.e.:

   #define OTP_PRIVATE_KEY_OFFSET 56
   #define OTP_PRIVATE_KEY_LENGTH 8

> The customer OTP can be locked with the magic numbers 0xffffffff 0xaffe0000
> when running the SET_CUSTOMER_OTP mailbox command.
> 
> P.S I am not sure if the magic lock combo applies to the private key as well.
> 
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>   hw/arm/bcm2835_peripherals.c         |  2 +
>   hw/misc/bcm2835_property.c           | 71 ++++++++++++++++++++++++++++
>   include/hw/arm/raspberrypi-fw-defs.h |  2 +
>   include/hw/misc/bcm2835_property.h   |  2 +
>   4 files changed, 77 insertions(+)


> +        /* Device-specific private key */
> +
> +        case RPI_FWREQ_GET_PRIVATE_KEY:
> +            start_num = ldl_le_phys(&s->dma_as, value + 12);
> +            number = ldl_le_phys(&s->dma_as, value + 16);
> +
> +            resplen = 8 + 4 * number;
> +
> +            for (n = start_num; n < start_num + number && n < 8; n++) {
> +                stl_le_phys(&s->dma_as,
> +                            value + 20 + ((n - start_num) << 2),
> +                            bcm2835_otp_read_row(s->otp, 56 + n));
> +            }
> +            break;
> +        case RPI_FWREQ_SET_PRIVATE_KEY:
> +            start_num = ldl_le_phys(&s->dma_as, value + 12);
> +            number = ldl_le_phys(&s->dma_as, value + 16);
> +
> +            resplen = 4;
> +
> +            for (n = start_num; n < start_num + number && n < 8; n++) {
> +                otp_row = ldl_le_phys(&s->dma_as,
> +                                      value + 20 + ((n - start_num) << 2));
> +                bcm2835_otp_write_row(s->otp, 56 + n, otp_row);
> +            }
> +            break;

