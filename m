Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2408465ejb;
        Wed, 24 May 2023 02:00:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ478kJz3izDoq7yXv6Wq09W7NQfnqFEmEWisVs03+ZiRzNKu4utbByKw+dv4W1pke+KlWOZ
X-Received: by 2002:a05:6214:27e6:b0:622:199c:c4d3 with SMTP id jt6-20020a05621427e600b00622199cc4d3mr27698812qvb.43.1684918834369;
        Wed, 24 May 2023 02:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684918834; cv=none;
        d=google.com; s=arc-20160816;
        b=Fho6eP9SGvMoR8cw5KawjuNhJm9SG5xOoJNfwctuwxpsq0BWrhB6f7A2/fIAgOexCh
         EXnwhvTAWEC7TX/9qQsLreZRAUX4/pM9aZW8F0dW7eqdRhFNOWHUr3rDCiLvoVZCKZ4q
         2FmVZbbezObW8psNgQIsMkjOogtH6Ln08KgcpGvHNYNXRLfkixRd8Kp4YWWNU9lWrXi5
         OUUhLkT8nvRhXBSPV1EPfzWzN+NRoAU7QeYcX0n6kfif4RxIkHB83YQJvTO6wdSwasVX
         3Jbw0Wgc0KElnmmkeZPfuo99l8Vhpy8WlZsy2FUpPFIoZvvjGPfLbKRLlYwF/XHJfaEz
         ZmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xkqy27kyvMiqMriySDVMh9p4nXjBI8B+MVNT5/1J7VU=;
        b=OeECWVHPMT4FBquAE0DpvvwONjT7KVQzRl5cuAGGrzeN9Vqiuc4faIqGOqSUjffuGI
         T4rwr1X0VMCr3z7/zyOuPOp/fwI+BRM5fbraANrgpd2epynjiou3yHaTQBO3Uq2LZNrd
         IJw0PjCreH9+qNb3IHd6D1WZWG1fe34ULO377Oiy2pFEMuerRpNJszuyXvzN7t4nVwej
         8AmfyOO2fFR2PHu0Z8pj/LPIoV55YABQfDI+/bCfHwAFoVbaj2fKWFC4lMlE9C+qvMMc
         3Xt0Ea8OkdXWu8YIk/rN+FQdKhyJTcSNbHP9aZGwUuGls6ApnM6ZrgqcStTJMDxAZ9rc
         9sBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DdJ14tDu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14-20020a05621419ce00b005ef676dbf8dsi6683497qvc.96.2023.05.24.02.00.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 02:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DdJ14tDu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1kLP-0003Jw-0b; Wed, 24 May 2023 04:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1kLO-0003JF-6L
 for qemu-arm@nongnu.org; Wed, 24 May 2023 04:59:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1kLF-0005cV-Sq
 for qemu-arm@nongnu.org; Wed, 24 May 2023 04:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684918771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xkqy27kyvMiqMriySDVMh9p4nXjBI8B+MVNT5/1J7VU=;
 b=DdJ14tDu8Tr+WEg8GyEaue+NmpXnPpghZ74NlE0jtun+tqkUa/g2GsRE7yC0pqJg1ckoLA
 jEFwbqu2MNFcawyW8V7tCD4Z0kUu5j/7fRa+pCYFMmbt/+A9tN0NblbCKYC7yimq0uFysA
 Q9+KQUg40I3xJqhL43COEXph++n5SN4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-ql2D5YmVN16h_V0sK-vOSw-1; Wed, 24 May 2023 04:59:30 -0400
X-MC-Unique: ql2D5YmVN16h_V0sK-vOSw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so2862065e9.3
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 01:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684918769; x=1687510769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xkqy27kyvMiqMriySDVMh9p4nXjBI8B+MVNT5/1J7VU=;
 b=aJOyioMR/B0yACp+p+rHWj02Sfh0hJACu5YlONCXaaZ0UxFAWI4OhQa63CLUUUVa/t
 aQfdpX5u/iXmO3eeF3KnJlS9eFgEwHBIrFkddz2BicLashyMnqYsqtPIAc2wK3e0f2YC
 /n8NWx26UhyeCCMimu0fxCysR+gHztXZoDIZbb7M9bLndxKrvgBclcddiCnPF5nzukRK
 qZYsk0QTtxuTaG60SJszj4KBpj1uJRr7bb7aIwrzHy3JvTLIlMG0A2SxwvZFr0oHEc/4
 0y3VwNC0HbHA/y6SQRpwLf44rdzYrSZ+pDYUBtzsqYijuaEEUrd1y+F5CdvmFgOLZCtA
 n5fA==
X-Gm-Message-State: AC+VfDzmLqutXssrYja49N7H/zsDmNE52YheZ7oICD/tUohw9LtJaj/J
 7NpR6M226qu4bprBMH5LhomGLwhZpJZjpOmRSl0uHR/szE2QDnCEdObmkOO2nn/b43NBSaRFq/V
 3F2qV8UV0vY3B
X-Received: by 2002:a7b:cd0d:0:b0:3f6:787:4a70 with SMTP id
 f13-20020a7bcd0d000000b003f607874a70mr5407644wmj.15.1684918769091; 
 Wed, 24 May 2023 01:59:29 -0700 (PDT)
X-Received: by 2002:a7b:cd0d:0:b0:3f6:787:4a70 with SMTP id
 f13-20020a7bcd0d000000b003f607874a70mr5407629wmj.15.1684918768722; 
 Wed, 24 May 2023 01:59:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c00c500b003f0ad8d1c69sm1581551wmm.25.2023.05.24.01.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 01:59:28 -0700 (PDT)
Message-ID: <ec6387a4-cc02-9cdc-1719-25f939f68946@redhat.com>
Date: Wed, 24 May 2023 10:59:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] hw/arm/sbsa-ref: add gfx card only if we have pci
To: 20230524082037.1620952-1-thuth@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
 <20230524083913.696175-2-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230524083913.696175-2-marcin.juszkiewicz@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: q6H/hfceu1f4

On 24/05/2023 10.39, Marcin Juszkiewicz wrote:
> Creation of network card is guarded with check do we
> have pci bus. Do the same with graphics card.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index c540b2f1ba..9a3d77d6b6 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -647,10 +647,10 @@ static void create_pcie(SBSAMachineState *sms)
>   
>               pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
>           }
> -    }
>   
> -    if (vga_interface_type != VGA_NONE) {
> -        pci_create_simple(pci->bus, -1, "bochs-display");
> +        if (vga_interface_type != VGA_NONE) {
> +            pci_create_simple(pci->bus, -1, "bochs-display");
> +        }
>       }
>   
>       create_smmu(sms, pci->bus);

I wonder whether pci->bus can ever be NULL in this function?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>

