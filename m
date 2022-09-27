Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp633997ocs;
        Tue, 27 Sep 2022 08:09:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7jWiUT4U9AACQSdXEPZC6YC3AoUmCIfST+UGYOJJNp8hxJv23/RHrvw7TV93Y49xTXciJ3
X-Received: by 2002:a05:620a:146d:b0:6cd:f206:ed1e with SMTP id j13-20020a05620a146d00b006cdf206ed1emr17874596qkl.424.1664291356376;
        Tue, 27 Sep 2022 08:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664291356; cv=none;
        d=google.com; s=arc-20160816;
        b=aYWsqDfAyoHTrqNMHyUj7VBJuQ5l//JaBzTtw0SkRrBveysw7/crSSWKIYktB+d3pT
         BTZDI15BI36k5PSsm3FdjZya9X0WCmwMFZUDC02jmDj+5AGah7jvcOGlLm3K7UEPfneQ
         gzd0aaAM2HtT/ZF2PUcRecxuew5dK2bMDnZNNvKNGexLwy6r/DosldbqwxuoZVzgP0Tn
         3+88+m8S6zgH73rL4eq0QeK0w6nS5WYLzIMn0womaAEXUPA0IzdT9W4Vai3x1Y3RNNau
         DVVoY4mt+aJ6KBV7benytwswUi+CMB8mJ1Pnb6w101Xv9zvASWer4deEqM87X9prpEbf
         ogpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YkvKGoZI9TLSH3d7GE+i/g81FyFuBAaQO2BkoSj7XpE=;
        b=uxWNi2s+xCo7hKbEseBl5GikLOnXb+3MMJukefY1FlNlIyMcuh83s8caZ0FNeC+yUh
         Kl7VvwqpTvT9W7E1hO28ytvtIfIIYiGiPmsM85RXP8RMMFlkt9um1MV4gNR4i159EtbE
         o1+9Wrz59SSrVA64sZFD18vRb/CT9+zm2HXWtMLhfRVxc2m2hx8381OJtp2mdcvFC+sE
         QTX314hQbkNuVC1qFF5IfyCSo5bG8WYZbLPNPOsZawmLUG7SGrs0/3aoFSpzVVvKg46b
         dxSgHpApkkRdy4fmAJEarmZJjyuS5XqbODj6UA9KHqOuJN8w9ceV/Tj2fcqiZBUER7Aj
         9CyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XK7qJyeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f65-20020a37d244000000b006cf28677379si936072qkj.643.2022.09.27.08.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 08:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XK7qJyeX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odCCx-0005EL-Ee
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 11:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odAZl-0000du-Vv
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 09:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odAZi-0005kN-37
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 09:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664285075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkvKGoZI9TLSH3d7GE+i/g81FyFuBAaQO2BkoSj7XpE=;
 b=XK7qJyeXiiXNvplK5ZCNZg4xmiTL0vCPQmcqgXuk8tMrQW0S9TRahGe8jVoFuCFDu5O6hp
 BuSPGmbzn3acyonttT3qbSN96ZHyrkUDfv0UUY/JsVuxY1uODDYTdw0RWCX0ApaZqChW9Y
 irPqxYkiVlsv4vyBdmpM4GkD7aElwD8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-Vg28vny5M0Kc6sRY8aYV0A-1; Tue, 27 Sep 2022 09:24:34 -0400
X-MC-Unique: Vg28vny5M0Kc6sRY8aYV0A-1
Received: by mail-wr1-f72.google.com with SMTP id
 k6-20020adfc706000000b0022cc19d5dd2so454211wrg.7
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 06:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=YkvKGoZI9TLSH3d7GE+i/g81FyFuBAaQO2BkoSj7XpE=;
 b=F0ozzluxtsGQLl1uHGdgxnRg4D3tI/jyIuTX3LyOUZGgWGRS+1aJJ/vNjcaXrzl1OW
 3cQukQwDhl6HlMZkqMel4fp8f7IiWXkhHZzmoWLl81bBfIuhNdYC3r7FJzOiLaRKjn49
 rKtAVN1tVwbhED9HZo6dX2eUdJdGgdTg/DX2AKz8sWPRIFenJAwtT1Y4bs9e8SszCMcs
 5n/T93EiV1omb3aMXEJN0sp/LEg7twltCgCJZJcoO3Vv+HKBevR+UAECgBEB9ssjIk+h
 c8xCSBGHxTExWUim6C133Hbsd8qOpriB2VZBQIqBS58mEhDntvprAZYB8gYGpI7+NZs3
 RF2A==
X-Gm-Message-State: ACrzQf3YcFZ72+Iqp/y6908GzfmV5TBZHuViRFDcsT0jHmkdm/wjNERg
 ACxV2T4NfYXfmIWUcAsp6gc/VPncXUQkOV77w6gZ13DFiIrBXAc2b07UV7VJE/uv8jsu6GKNSjG
 8xE602o/E6UeA
X-Received: by 2002:a5d:6808:0:b0:22a:c437:5b36 with SMTP id
 w8-20020a5d6808000000b0022ac4375b36mr16904262wru.459.1664285072606; 
 Tue, 27 Sep 2022 06:24:32 -0700 (PDT)
X-Received: by 2002:a5d:6808:0:b0:22a:c437:5b36 with SMTP id
 w8-20020a5d6808000000b0022ac4375b36mr16904246wru.459.1664285072351; 
 Tue, 27 Sep 2022 06:24:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h7-20020adffd47000000b0022c906ffedasm1764299wrs.70.2022.09.27.06.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 06:24:31 -0700 (PDT)
Message-ID: <de209311-c944-45c7-92f9-278fc43fd01b@redhat.com>
Date: Tue, 27 Sep 2022 15:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/8] hw/arm/virt: Fix devicetree warning about the SMMU
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-7-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-7-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 31/wYR5Q3iqs

Hi Jean,

you may add: as opposed to SMMUv2, ...
> The SMMUv3 node isn't expected to have clock properties. Fix the
> corresponding dt-validate warning:
> 
>   smmuv3@9050000: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric

> ---
>  hw/arm/virt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 10ce66c722..2de16f6324 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1362,8 +1362,6 @@ static void create_smmu(const VirtMachineState *vms,
>      qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
>                       sizeof(irq_names));
>  
> -    qemu_fdt_setprop_cell(ms->fdt, node, "clocks", vms->clock_phandle);
> -    qemu_fdt_setprop_string(ms->fdt, node, "clock-names", "apb_pclk");
>      qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
>  
>      qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);

