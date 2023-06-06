Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3244647ejb;
        Mon, 5 Jun 2023 21:58:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YQdTn6xmA+ww17JypEJ2DYIbZDj8MNFbWJN6dklFdOfZY0up3dy7Vkdp9EB2gUxgug+Es
X-Received: by 2002:a05:620a:2b91:b0:75d:4358:6d2c with SMTP id dz17-20020a05620a2b9100b0075d43586d2cmr1151746qkb.32.1686027529032;
        Mon, 05 Jun 2023 21:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686027529; cv=none;
        d=google.com; s=arc-20160816;
        b=wDxMbvKRz7ZZXS3FPBnjl3zcXP9xSX6uL9/nKKGc0NhSTBDSLjWpY0SDC1IVGsKTKD
         C3E54MgdV71DJKcy8W8Q5aTitB9FwRWNtTKd5WCkXMkbExCNkwC/t1oNo5nrjtKrkdjN
         s0Qd+3f6HZ02R7egYjhE1prWewv2MIPrs64FAOzGS0vOHcQOa65TOSUlwz67azcmXjRk
         XVcQzd5RFWI51nJMvqCAZkCmLhWBV6AcSE70yXQ3vSmjujqr+mMODzjrozkEz7zT2vea
         3g0Qrb73wjshh+7xjLpgOOzI0R7BcuBogEfieGoLw2E72HxPFpe6LuqZ3+6X9aLmhSQg
         C/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OOoPiPOLO5Fo4+hZ/WfUOHJjTYIpHVqCk20W2RE8MRE=;
        b=BVXXVzdI2xHAPu7jSO7vDm9nC7x1E5zI0wW3OAu6bOJPCaCg0ozocGr8sYI/Ir/F/M
         nYYzhR1SItvQ3unK4ghkHuPUGKJ87kLzLuoaDGkcYlfxuuEPn/6PBMKEmhVANMXIGP+1
         5gcpT7t+a1zD5Tbm9dEDsXA+0zgAUtLrL06/lafUQDslTIg+qr0e3xYAmlTOrZC9KZPy
         2PYXDvFrHB3D1wy4hZL/SqBNty2/rI0L2qjVmwUyXJVU4gCUs29UpmJeUoWG30zCjBfA
         5bfFeytSVbf/H1i9I/w66yEmteZ3ORexW7bkppEozLmE7iA+7d75GPSep7IF+fBTJTJ/
         ZREA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hTtswFGa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi2-20020a05620a378200b0075785c1637bsi5300656qkn.565.2023.06.05.21.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 21:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hTtswFGa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Oly-0003hF-4i; Tue, 06 Jun 2023 00:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Olu-0003gf-Kg
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 00:58:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6Ols-000414-Vu
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 00:58:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30e407daab5so2036093f8f.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 21:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686027495; x=1688619495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OOoPiPOLO5Fo4+hZ/WfUOHJjTYIpHVqCk20W2RE8MRE=;
 b=hTtswFGal3f/ULly/6/pKAvliSmjAFZKJYcXSO4JxRfMdpGKqPZDd+k4K6xCchBhDB
 ZZdnavTzv1KdewNx5bIGbCU7C9vZdlLZvB9un/wF+9HbTpUHDjSHMQBMafiSt9yBEgYQ
 Asd9L/HHX/b8mqBTWZIev17u5I8Ls+iJB6/Wi4y1gQUmNGD/m2xQjHA+2UroGyvIJze/
 pD2BGgCnadGg2OAlt+6hdjHCB4wbgVAgVoOmiisA4sFFJzR5KpO66Avh1wX/7pInjfqQ
 PSmk4tMS2Ncpm+Ld0kFlcF9eGY37mqVrnWvHOhg8RjaO4w8ug8NTpZI8Jm+qySDxZO/F
 7URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686027495; x=1688619495;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OOoPiPOLO5Fo4+hZ/WfUOHJjTYIpHVqCk20W2RE8MRE=;
 b=jA63Ml9ZnOvof5Ya072IwtYYczHPZUuZ3GRbBYONd3DgRDJmC1ozDeJtDmLI8IfVFr
 1un9q0CdIReDnYfyXOnJkVsJ9ZYoqZv0mi368EaQieT0kqEJDD95TMc+v1gTeuKtR64y
 d2bjzH9IMVqPxljKKu5vy014ROgwkDXpX75GjOGySX1+snkm8zhZvEL/MlXr/q7gdnbB
 L+e9azXHFCOLYCjik9tB0xNxAuh3yuY0Pkylglk9J5e415TaDqaWN1xdYoi6vosuTXqj
 ttDCrePzH1epFSr3yKpmrN17HMoiwdxBEwVzqTuDUBEekOqkDV0uzqPspeZtzUBchrSU
 P4Pw==
X-Gm-Message-State: AC+VfDz3h2ftQ2QT8pvXK9/VBqNKa2rQLvSy/eCA9wIZKU5OASnmZmWM
 ojqyuzufCI8CuGTgdz4QaWRZJA==
X-Received: by 2002:a5d:40d2:0:b0:306:3f97:4847 with SMTP id
 b18-20020a5d40d2000000b003063f974847mr897306wrq.65.1686027494953; 
 Mon, 05 Jun 2023 21:58:14 -0700 (PDT)
Received: from [192.168.69.115] (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr.
 [176.184.50.104]) by smtp.gmail.com with ESMTPSA id
 w2-20020adfd4c2000000b0030aeb3731d0sm11335140wrk.98.2023.06.05.21.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 21:58:14 -0700 (PDT)
Message-ID: <2022d199-3de9-fd34-11ef-bfb11a62a7e1@linaro.org>
Date: Tue, 6 Jun 2023 06:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [RFC v1 2/4] qemu: patch guest SRAT for GPU memory
Content-Language: en-US
To: ankita@nvidia.com, jgg@nvidia.com, alex.williamson@redhat.com
Cc: qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <20230605235005.20649-1-ankita@nvidia.com>
 <20230605235005.20649-3-ankita@nvidia.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230605235005.20649-3-ankita@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: OhyTDOYAuEFH

On 6/6/23 01:50, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> The guest VM adds the GPU memory as (upto 8) separate memory-less NUMA
> nodes. ACPI SRAT need to thus insert proximity domains and tag them as
> MEM_AFFINITY_HOTPLUGGABLE. The VM kernel can then parse the SRAT and
> create NUMA nodes.
> 
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>   hw/arm/virt-acpi-build.c | 54 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c


>   /*
>    * ACPI spec, Revision 5.1
>    * 5.2.16 System Resource Affinity Table (SRAT)
> @@ -568,6 +620,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)

There is a x86 build_srat() equivalent.

So some abstraction in hw/acpi/srat.c is possible.

>       }
>   
> +    build_srat_devmem(table_data);
> +
>       acpi_table_end(linker, &table);
>   }
>   

