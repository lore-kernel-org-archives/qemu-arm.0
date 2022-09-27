Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp595607ocs;
        Tue, 27 Sep 2022 07:15:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM70HVTv9i2lPcPs84Uu+Ex9nJNJVRuP7UqztpLhB4B9royOuxKAQwu58HAIIGO8L2dQ1WPt
X-Received: by 2002:ac8:5c45:0:b0:35c:cd2c:c8f8 with SMTP id j5-20020ac85c45000000b0035ccd2cc8f8mr22432431qtj.105.1664288138075;
        Tue, 27 Sep 2022 07:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664288138; cv=none;
        d=google.com; s=arc-20160816;
        b=kiu9Q1u/MRMDYqR5UcANUKvLKEEcpxNXfShFkbkbh75JUWJFKX6Exka+oWP2atoST+
         p/JOGiOYBoa93xwJWHqyrc2/rV6e/RrT9S7PVUkSnshl53Yl67GrfNLgAevhyiSnnsQ8
         X9znOpCLusXZazMiVccsp3WZvFKsvkRXNABqSIlrE4itEzf4SdWcNdvnHPQ/8djw9H+J
         Etg5+i8xttGUKUi5fl7tzW8mGtxEDlZuT9zFv08RfPDjoNx/RBhW/WojoHAhVfkYFfvD
         rZGk07KMOvhZFVAfA7Mr1qDqckG6l1CiJkN+lKXkP0fSd+eSQp5yzsuZkFKGInSJovI4
         L1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZjA06iHvrYEC1gHjlQUHmscVY89zOnX4QqZ39wawjbY=;
        b=Z90/D5G6U8MFV5KNcGcJxmaA1R6/L1Necd2ic6YiJxZ0o1vD2k1Wt5yuT16NRPWrXQ
         h3qbiCuheTZDHmltjFJPl5uuPocy4lk0kpYMSM9vlqq34YfxY7n79uaGoJjdME+RMyzF
         HAxLvIZQi/eIw4DYisFDfsBBVtk7gcnFjo+/4PwNFc04A0DDcvO3Dm1TaTDUv5b75tbB
         GZqPbxKuxNjrFl73cNbxnayo0RLTJMBrIRsMZ3iZcXjFccjbeQ6HxFA/F7yFMTRz2pp1
         i+76pI+vNunDL7OVFEjBFXj7QtthG9AkNEHujPXJt277Q9IsuvptH6s0M7oAkHcvC84F
         ldrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eyhK6il6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126-20020a670384000000b00390e8ea2acesi325090vsd.267.2022.09.27.07.15.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 07:15:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eyhK6il6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odBN3-0004s3-H6
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 10:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA1C-00023P-8P
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 08:48:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA1A-0007Ie-Pu
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 08:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664282935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjA06iHvrYEC1gHjlQUHmscVY89zOnX4QqZ39wawjbY=;
 b=eyhK6il64bBSXrZXxwAAv/8+PqWV3jc8vWeVgf1pKQDawYXBrJzkXTYMyOqU91Ts5SmuNn
 NDnkMMzrsr/heeggfrAzRZhJA+Fbdaqte4RbBSeV872bXxiWaUL1MNfck1LR1wNk398FaQ
 jgmzJIbU5RCYdqlp5Z/QctAiEJbDO7Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-bJhDW9-eO4Cay4RO_64z4g-1; Tue, 27 Sep 2022 08:48:53 -0400
X-MC-Unique: bJhDW9-eO4Cay4RO_64z4g-1
Received: by mail-ej1-f71.google.com with SMTP id
 dt13-20020a170907728d00b007825956d979so3804526ejc.15
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 05:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZjA06iHvrYEC1gHjlQUHmscVY89zOnX4QqZ39wawjbY=;
 b=TmljjM4t4J1rcTwvdcC2bp5FVH4Cgd4KUbkQ/0XqFeJ+Mnbayo2LfV84zjcsUgznZW
 WWmLRpcIerhs13Ps662FSYOSJg/M+fhN0oLgaD2XAMHkbMfg1c+5UdenbMEU2hiva/34
 o3rp0dEfkAA5l/GJeCLg/wRkpCsLo/wO/LkmNwuPlfp9mm+Re0Jqj6oIVUXKpPSj/43w
 hu1PgyQMvhsMzq9fxyGfB7Gw1k7jGxfWcwpBQ/poZ9BG1zeh2E3l61gjAbYecGwfExil
 XABMdyM94jG6PHfS+xLXRcg4j83C7/2G8oF81xJ40cqCJCib0uXDop1+IqdGJmq6WNJz
 xaXw==
X-Gm-Message-State: ACrzQf2Uv4+AM65HvLbhUXyTzyJNtuv3H24ULzQ8VDA+egKCfiF86b8w
 mibJU3JU1/B+N0pA2Yv+5bbMYMNJUR3+QV8NM9l/wtJo5fENIg9UJQzYwqyz/mM/x+duMihceI3
 pK41+aR7Tmx8a
X-Received: by 2002:a05:6402:1247:b0:456:eb22:1978 with SMTP id
 l7-20020a056402124700b00456eb221978mr18513622edw.374.1664282932895; 
 Tue, 27 Sep 2022 05:48:52 -0700 (PDT)
X-Received: by 2002:a05:6402:1247:b0:456:eb22:1978 with SMTP id
 l7-20020a056402124700b00456eb221978mr18513604edw.374.1664282932706; 
 Tue, 27 Sep 2022 05:48:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 kw26-20020a170907771a00b0073dd8e5a39fsm742036ejc.156.2022.09.27.05.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:48:52 -0700 (PDT)
Message-ID: <745ad260-b11b-8c72-8bb6-cc72acbb2987@redhat.com>
Date: Tue, 27 Sep 2022 14:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/8] hw/arm/virt: Fix devicetree warning about the GIC
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-3-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-3-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-TUID: hkOdY8JWR29n

Hi Jean,

On 9/27/22 12:03, Jean-Philippe Brucker wrote:
> The GICv3 bindings requires a #msi-cells property for the ITS node. Fix
> the corresponding dt-validate warning:
> 
>   interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
>   From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml

nit: you may add
linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
says

      "#msi-cells":
        description:
          The single msi-cell is the DeviceID of the device which will
generate
          the MSI.
        const: 1



> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Besides,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/virt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 83ab1a37fb..ed6f1ac41e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -487,6 +487,7 @@ static void fdt_add_its_gic_node(VirtMachineState *vms)
>      qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
>                              "arm,gic-v3-its");
>      qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
> +    qemu_fdt_setprop_cell(ms->fdt, nodename, "#msi-cells", 1);
>      qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
>                                   2, vms->memmap[VIRT_GIC_ITS].base,
>                                   2, vms->memmap[VIRT_GIC_ITS].size);

