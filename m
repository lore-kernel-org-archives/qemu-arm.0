Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2421108ejb;
        Wed, 24 May 2023 02:27:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44/SGNGbDXU72rjj3bDy+Ba5CQiJYutiW/h7Z0UGS8gID8rTbXjFKIvZWT3V0BIZkpTV0t
X-Received: by 2002:a05:622a:1111:b0:3f6:c146:a1a8 with SMTP id e17-20020a05622a111100b003f6c146a1a8mr3290381qty.43.1684920476303;
        Wed, 24 May 2023 02:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684920476; cv=none;
        d=google.com; s=arc-20160816;
        b=HJ94c/tgvkm3y3oNCJSGgMYYxnswfsMfqR3JRXSwU/JsOc3+qJedHtKbQoEoGhz+ZU
         kCW2HzJUCqwpVDVgIiODT2pjFijCh+UI51AvLNemJkmbf6hTDKjYdBK04HDWa61QoIns
         9Lw0Z18qnPe/Ne3/wPDGeyadaPPtHotNI+9gBrxn27qiAjIoOUGqwMjOtN5VEWajPdbw
         rlBhC3bxekNh2Pu9+6mDrwtOehV3gm9wNJ81NSpVV0fWx5/SjEaw16rmho0Bek+geF6n
         ajlRM6fpv0Rsj0pZ0SzrqPPqKBP+j0wj/VVvrzPFcylQEHTTyNzTldRQJzM6d2l6jIVM
         lPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ufFcDheTSf78huTOmn56tXCiVzbq+QEy3Ph+84ltRvY=;
        b=pwvXEz+GXTVLUxG+Nv0cGwZQj0eZU/wU4DmEAZBNVAPDntiLA1pRXDqJbco6Tw1v8N
         +QyuprXofPuYx5h/KxO3emgtxb9rQkp6Z060e81yLZvnPVa8NMIny4GIhe1Xaq3QKhiR
         cetacJvPbkL6upXLHXNps406dSeu8nnDBbqJeRlQ82MylyA4bBhZwd0hoO7qYowFZCE9
         MmqTPSApbzbW/MYxGukUQcTgg+chpEYOIebCju5VM95/0dfOKiMwQMVYp5vB2Ij/6YPh
         g5UXNdHT4Z+odTqMuDcFnfjYK4oJI1WU7Fz5HqdUSPuW7IJTki6TIIDL7OR3FOBYmYFs
         QraQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ctayd2Ez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05622a05c800b003ef0551af53si6433781qtb.219.2023.05.24.02.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 02:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ctayd2Ez;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1kmg-0006aj-Af; Wed, 24 May 2023 05:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1kmf-0006V2-4Y
 for qemu-arm@nongnu.org; Wed, 24 May 2023 05:27:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1kmd-0004r9-Ja
 for qemu-arm@nongnu.org; Wed, 24 May 2023 05:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684920471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufFcDheTSf78huTOmn56tXCiVzbq+QEy3Ph+84ltRvY=;
 b=Ctayd2Ezq4N2wlXgk4FpUl6KlX5hLSsCPIUumvByXo7lThS5CnTL8Pa6FpIgOBMar/uFcX
 PISYUruBVhoT9VXEQ4dxJO68D8X7uoJukmhfnjGA8qMqbPw0kcJ9aH9LfUKolHkaFle0Vp
 U/1T5LSCjfsaiyVxVqMN+Rr/yi7WC4o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-Eu-2Lsq8M1G2bC1yRip2Pw-1; Wed, 24 May 2023 05:27:49 -0400
X-MC-Unique: Eu-2Lsq8M1G2bC1yRip2Pw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5d6dc52fdso4437155e9.0
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 02:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684920468; x=1687512468;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ufFcDheTSf78huTOmn56tXCiVzbq+QEy3Ph+84ltRvY=;
 b=UWK38YRQmx8XZ8fxlq2MnOO/gcKr6WFs6egDAY4HUEBJimaDdRewmSYF0tQ3CeDBOB
 c8JR4CFSW1/SrebA7oYjM1TgKVP4d27aUOzQ294RDBDKnigSAbvzL1uIJXlCfibPrru7
 InSn2LtdLaFzL7oz4zEw39wKhPkSn+9xQZtFvIp1RvZrBYfXAqmaGI/ZbRbVSn/cPOTW
 uttyY3ES7VxF2g7SoLSRKONmbapuDDCeIOuPWnC0lLfdFsuP1CU3P4Yi0Hz8Yf9NawM7
 5xPS7GXq7ILzSlUaKeDmCpuPHcwyWHu4wsmVfHB27UWf1+4oLLTZgMkmJc8myWhQYlDc
 ySuw==
X-Gm-Message-State: AC+VfDy3C+5ljDWlmdfqdAw2a3HBJChBunwXeWFBPVyPPDmHqx4W8oh8
 dhlrcEDXk50yROgs2keXjQjIGxcFw6zFaz+v3v5xvekqUhkgJYoJP9ndBgTertvfFsDAe0wJpO0
 eJERoTmQnrv1u
X-Received: by 2002:a05:600c:1c0a:b0:3f6:335:d8f0 with SMTP id
 j10-20020a05600c1c0a00b003f60335d8f0mr8132429wms.13.1684920468499; 
 Wed, 24 May 2023 02:27:48 -0700 (PDT)
X-Received: by 2002:a05:600c:1c0a:b0:3f6:335:d8f0 with SMTP id
 j10-20020a05600c1c0a00b003f60335d8f0mr8132419wms.13.1684920468201; 
 Wed, 24 May 2023 02:27:48 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 13-20020a05600c24cd00b003f4dde07956sm1629948wmu.42.2023.05.24.02.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 02:27:47 -0700 (PDT)
Message-ID: <1eddac35-9a75-7a03-6501-6e50a0ba7cd7@redhat.com>
Date: Wed, 24 May 2023 11:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] hw/arm/sbsa-ref: add gfx card only if we have pci
To: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
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
X-TUID: 6duWsbPSweSP

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

I wonder whether pci->bus can ever be NULL in this function?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


