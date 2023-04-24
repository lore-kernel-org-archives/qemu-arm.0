Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2967721ejm;
        Mon, 24 Apr 2023 10:36:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yd0Q5MjSpPYPWTpzQmeMCGZIs+PTyrKJxyocSaKgRPbn5IxHpsNQXA4kFIWyiAbKtGzZPQ
X-Received: by 2002:a05:6214:d4d:b0:5f8:ad2a:fef7 with SMTP id 13-20020a0562140d4d00b005f8ad2afef7mr27468438qvr.32.1682357809346;
        Mon, 24 Apr 2023 10:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682357809; cv=none;
        d=google.com; s=arc-20160816;
        b=hnwYEc/ayNEyHh2aI4vptYFPJdwX/5IuMY8emcA4DEq9055cl+dPEwTIpP8WJZ/G34
         IsiD+FeuB4mtxseR977rTm4zCvOKD4qleTnX0rURYG/LmpXEGuPQDHv4tcKyodGPf1Rd
         j3UFrGpIyuyyl+GDc6H2qn6FNND21n/Uglp93eq/O4gQdwmda1aftHotLwjSjR+GMR1K
         vlznXIQVT0Jd9Y0mVuF2KERsqNU9E43AqDG3E7D2g+jkd0c7/rGPe8juppRCEsZU7p6Q
         of0QW3+bUwVkbTCfGcNiqOGjRfLz3k7VeL3rOFr0NU/VR3uzuudb1I3QFvxgVlrqLKj5
         25ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7GHvnY/7Tr19wP7tKmWdIlSTR+C6KiHi84yAvUw0cTw=;
        b=xoyEtEOCmOgW7/xVm63hLLXMR9Mt0gDtF2Oevu1GR6iWB/LIsu8KhjACeKliPnMkex
         5DE/k4C4aktDmXMX55Nvr/bxKlp0fynHDNDZQaQ5y792qLC4qbxUXxAyU3TqegKFqlZg
         bzxNCQlEHuZvOWTEz3BcAu9sjD7ktGbHP7Q92XCRTnLjwtjPIBSt6+ieHvmZJfKLYaqD
         FXWsaD0lc6hD37pvhAISXVqAQGPhxWcfexlMny/Lnw8cqiqBsEiDvAnfjw63XE5x6Um9
         XS5mkTu2tdsyGkqEnluhCd7rVLGXOe95AmZecxzgjMPQ8JbluhEyA1Dl9VsVMhfpjzhJ
         TokQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+SMvTWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020ad45bc8000000b005ad18b4d5cdsi7266553qvt.476.2023.04.24.10.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 10:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X+SMvTWd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pr07H-0007jH-Ma; Mon, 24 Apr 2023 13:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pr07G-0007iW-6F
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 13:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pr07E-0004BF-Jk
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 13:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682357799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GHvnY/7Tr19wP7tKmWdIlSTR+C6KiHi84yAvUw0cTw=;
 b=X+SMvTWdlc97vtFm8TqvPGTMoyHoXOKgZnHUiRezt322U+8LEPP5x+XS89iUw6+c6tticf
 ldYzu8lhVavxxh1EmqKdnN9AIxjJzlSp56d45UiqVIiz8lEC77qhHnOn3M+i6/N7Ejji9d
 +WjjqLpA899BdpnPzGZC3+ikfMi84Jg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-ZiPvXmqkMheKvv3ZkRX4tw-1; Mon, 24 Apr 2023 13:36:38 -0400
X-MC-Unique: ZiPvXmqkMheKvv3ZkRX4tw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2f6d4e7faabso1485494f8f.3
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 10:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682357797; x=1684949797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7GHvnY/7Tr19wP7tKmWdIlSTR+C6KiHi84yAvUw0cTw=;
 b=f16ieBV6IvfwVM4swfX6DPiq8jfAvkN4sLAioangE6qABRwpE5mjCIsUGKF5uaooB6
 OHqe8SIwPfRsTvAIdHU3mRS0g4hotC2nZKi0vNdqZO3/HE8iKj0fVQT9tOONh6pSkevX
 z4ErwRvTIvuwhCpV8u41BheqMomCoX5+RI4ZnODvciT2cGSh9SjWCEmPen7ncZjtfFhw
 OPiJz7OCzj3z7UZPPzUvMIHaU1Elt8q0m2o/HN2cb4yLQTizv6jsQrZPZ9BPCMM5baWD
 6BbRNv0bY5ygBa8yWFD7ogSfisUueHjbK5/9KPL4kZJlgjJxkUPYee/IeJPN7h3Bym5x
 yJ8Q==
X-Gm-Message-State: AAQBX9d2l9On0nX7NjDqFU+m/gTyACJB7xrwGMJhKFM8gL1qAIMZEmqa
 ZcvjTiKqaSWWhyT71RgeTfGq8K+LenFMVtLcYnyw0PVOqKf+pDNhHkTD13cwnSmc3EKBXEjz3on
 vzF0ZWhfsZGPr
X-Received: by 2002:a5d:4b91:0:b0:2f9:61d4:1183 with SMTP id
 b17-20020a5d4b91000000b002f961d41183mr9933607wrt.45.1682357797524; 
 Mon, 24 Apr 2023 10:36:37 -0700 (PDT)
X-Received: by 2002:a5d:4b91:0:b0:2f9:61d4:1183 with SMTP id
 b17-20020a5d4b91000000b002f961d41183mr9933593wrt.45.1682357797212; 
 Mon, 24 Apr 2023 10:36:37 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc855000000b003f17300c7dcsm12626457wml.48.2023.04.24.10.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 10:36:36 -0700 (PDT)
Message-ID: <b8d82416-26a1-06cf-ba72-46845fcbf254@redhat.com>
Date: Mon, 24 Apr 2023 19:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] hw/net/allwinner-sun8i-emac: Correctly byteswap
 descriptor fields
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20230424165053.1428857-1-peter.maydell@linaro.org>
 <20230424165053.1428857-3-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424165053.1428857-3-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: OWsxhMA6pvqA

On 24/04/2023 18.50, Peter Maydell wrote:
> In allwinner-sun8i-emac we just read directly from guest memory into
> a host FrameDescriptor struct and back.  This only works on
> little-endian hosts.  Reading and writing of descriptors is already
> abstracted into functions; make those functions also handle the
> byte-swapping so that TransferDescriptor structs as seen by the rest
> of the code are always in host-order, and fix two places that were
> doing ad-hoc descriptor reading without using the functions.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/allwinner-sun8i-emac.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/net/allwinner-sun8i-emac.c b/hw/net/allwinner-sun8i-emac.c
> index b861d8ff352..fac4405f452 100644
> --- a/hw/net/allwinner-sun8i-emac.c
> +++ b/hw/net/allwinner-sun8i-emac.c
> @@ -350,8 +350,13 @@ static void allwinner_sun8i_emac_get_desc(AwSun8iEmacState *s,
>                                             FrameDescriptor *desc,
>                                             uint32_t phys_addr)
>   {
> -    dma_memory_read(&s->dma_as, phys_addr, desc, sizeof(*desc),
> +    uint32_t desc_words[4];
> +    dma_memory_read(&s->dma_as, phys_addr, &desc_words, sizeof(desc_words),
>                       MEMTXATTRS_UNSPECIFIED);
> +    desc->status = le32_to_cpu(desc_words[0]);
> +    desc->status2 = le32_to_cpu(desc_words[1]);
> +    desc->addr = le32_to_cpu(desc_words[2]);
> +    desc->next = le32_to_cpu(desc_words[3]);
>   }
>   
>   static uint32_t allwinner_sun8i_emac_next_desc(AwSun8iEmacState *s,
> @@ -400,10 +405,15 @@ static uint32_t allwinner_sun8i_emac_tx_desc(AwSun8iEmacState *s,
>   }
>   
>   static void allwinner_sun8i_emac_flush_desc(AwSun8iEmacState *s,
> -                                            FrameDescriptor *desc,
> +                                            const FrameDescriptor *desc,
>                                               uint32_t phys_addr)
>   {
> -    dma_memory_write(&s->dma_as, phys_addr, desc, sizeof(*desc),
> +    uint32_t desc_words[4];
> +    desc_words[0] = cpu_to_le32(desc->status);
> +    desc_words[1] = cpu_to_le32(desc->status2);
> +    desc_words[2] = cpu_to_le32(desc->addr);
> +    desc_words[3] = cpu_to_le32(desc->next);
> +    dma_memory_write(&s->dma_as, phys_addr, &desc_words, sizeof(desc_words),
>                        MEMTXATTRS_UNSPECIFIED);
>   }
>   
> @@ -638,8 +648,7 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
>           break;
>       case REG_TX_CUR_BUF:        /* Transmit Current Buffer */
>           if (s->tx_desc_curr != 0) {
> -            dma_memory_read(&s->dma_as, s->tx_desc_curr, &desc, sizeof(desc),
> -                            MEMTXATTRS_UNSPECIFIED);
> +            allwinner_sun8i_emac_get_desc(s, &desc, s->tx_desc_curr);
>               value = desc.addr;
>           } else {
>               value = 0;
> @@ -652,8 +661,7 @@ static uint64_t allwinner_sun8i_emac_read(void *opaque, hwaddr offset,
>           break;
>       case REG_RX_CUR_BUF:        /* Receive Current Buffer */
>           if (s->rx_desc_curr != 0) {
> -            dma_memory_read(&s->dma_as, s->rx_desc_curr, &desc, sizeof(desc),
> -                            MEMTXATTRS_UNSPECIFIED);
> +            allwinner_sun8i_emac_get_desc(s, &desc, s->rx_desc_curr);
>               value = desc.addr;
>           } else {
>               value = 0;

Reviewed-by: Thomas Huth <thuth@redhat.com>

