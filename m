Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3050404lfc;
        Wed, 13 Oct 2021 08:27:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2mfpc3HULdQ70OMXR2yR3sDjxODNKDHPGsbNGpFg5cDz5ByasH8H75QeKHrgYVkmrSG/f
X-Received: by 2002:a05:620a:49d:: with SMTP id 29mr3772021qkr.499.1634138870962;
        Wed, 13 Oct 2021 08:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634138870; cv=none;
        d=google.com; s=arc-20160816;
        b=hg0Ivwky75DjwCYTUb5Luk26SZvs8SpFXEcPU8Me4JWItYh7GHxwB+tCKakavKRPJf
         y9CN96LU9omkNp3xBGi17A7nULcimQ1lvCjCwUbn7Ne5ZCdMFpaeMA9Qu8rXIZA7EDEn
         jTOocMBDDlJ0uNGNlzKHLULb11jB/YtqddjHyKA2D4jbDweUit4G+rg7spEC52JDR4Go
         oSmAnAM+D3LL8DQI+/UL/8IKjPYXVNkYJ/Zc16aKN7i31ohANCPxHfFphiYJYuZxQsaj
         SMGXM23xvpQP2Q2D9E/ctXlfedTBOkdvYdaOT/l9Rkw/z5ba9s3xzDVd2a2UUBJ9YTNb
         JADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=bfgnOdbwJRp0NIxxPBNQWrnxn9WFX0mV0Q4/AkhcGgY=;
        b=JIQI+3X/PvFQJ8S9zEXuSqN0wzH4aqAW9y1qoJjdjGa4jyogKKTs642tw0xLvtf8sU
         NV3ozN4Jw4hRlVkwcee2hQcXapU3L3lG+kAQvi95fLEbuj3cdVKshoeDKPakaP9PToxZ
         f4XUoG3mBkfcyhtu79iy5RNGQTppvwTDd5xu9TVhgrqw+NBBfZIA5hA3ywAr4iJsxejZ
         cy8fR2zthp1qDDsyqJqaFvqbACAoRabKVliov+saIZOHN1wTiQvcsV8+h1fwW1IZcbuC
         16pRNGPUgvpE04kO7Yg6PJTKVxvXuQehI3UyBAD0oObUCgcrOJdgJpECqmZnzuhZ45Dg
         7btQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dEkFHyEM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21si7979312qkh.260.2021.10.13.08.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 08:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dEkFHyEM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1magAY-0007Ld-Dp
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 11:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magA5-0006q4-NE
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 11:27:21 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1magA1-0000P3-Lb
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 11:27:20 -0400
Received: by mail-wr1-x431.google.com with SMTP id e12so9707532wra.4
 for <qemu-arm@nongnu.org>; Wed, 13 Oct 2021 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bfgnOdbwJRp0NIxxPBNQWrnxn9WFX0mV0Q4/AkhcGgY=;
 b=dEkFHyEMLElRG4rt4Swk8+P/WDxvIHKoZ17p7wf756XDPR30Fhyplz4ng3WxzSEQN8
 7aNoE6MadVLjGvqjMOtInyMKguwaQXyH2CwPCragnLn1Jx+24fAm794lzxWMG8vduEUt
 xNWfwVbUY/xxi/j0IcIq7I1938jhL2rrmKzz/qeaIav8MpIs5WsKhqhEBoMIWWY30jkH
 iZss1qy08PImYdN4qGL8tyi8XKHiK9lFa0DiggY9uUwjEVQ7FtI11giLlHpaitZoopgB
 EtLvSCL5cJfZEnmdrWGQCoOX/hhc13MhMHx/uEGDsU5VeNKAIkAvl0Z36qhDuqRTyhat
 qDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bfgnOdbwJRp0NIxxPBNQWrnxn9WFX0mV0Q4/AkhcGgY=;
 b=lLMVmxb3GJaHPGa22lUa9LyodQVGPmiak4GcBmwIgm66dS8iOQMgCGp9KkpCth2VBN
 JgOLYFVl0dDiaRPgcR2G6aIRsn/RGPDrerEiK35y/Q8IEabjKxAHFEhJfU31FpTEfQMa
 XACb3wHCcvG3sDpuYzFGyj1s7XCAepSSie160qTe6RNBChi6WOl9zd5j2RmnNFnfyaYK
 kFrSUHk+4JMsYkeXLyBSN3RMt28RCQSnp8NCK6kvxuTWXPcCMSBMm3PcZsxVwu+zYmmf
 46xeU910wYRJ/JX006+SLZ5/bf3ie9cTb/ExLdL75ZaesrvS+7ugHQTDYpDWXFosQzkR
 vapA==
X-Gm-Message-State: AOAM5320U5RJXwMg9Le8wWcmtu0h/RbkfZkBJgyr6bk0tGMRJa501O9n
 Mb8BSdffZqz69MYgk7BuHEDbRg==
X-Received: by 2002:a5d:4310:: with SMTP id h16mr41506973wrq.424.1634138834229; 
 Wed, 13 Oct 2021 08:27:14 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id d3sm14051328wrb.36.2021.10.13.08.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 08:27:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:26:51 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/3] hw/arm/virt-acpi-build: IORT upgrade up to
 revision E.b
Message-ID: <YWb6uz/tGABul80g@myrica>
References: <20211005083805.493456-1-eric.auger@redhat.com>
 <20211005083805.493456-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005083805.493456-3-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O8MsMiPoJ/Yv

On Tue, Oct 05, 2021 at 10:38:04AM +0200, Eric Auger wrote:
> Upgrade the IORT table from B to E.b specification
> revision (ARM DEN 0049E.b).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Two nits below

> 
> ---
> 
> v1 -> v2:
> - Fix Revision value for ITS node and SMMUv3 node
> - increment an identifier
> ---
>  hw/arm/virt-acpi-build.c | 48 ++++++++++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 257d0fee17..789bac3134 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -241,19 +241,20 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  #endif
>  
>  #define ID_MAPPING_ENTRY_SIZE 20
> -#define SMMU_V3_ENTRY_SIZE 60
> -#define ROOT_COMPLEX_ENTRY_SIZE 32
> +#define SMMU_V3_ENTRY_SIZE 68
> +#define ROOT_COMPLEX_ENTRY_SIZE 36
>  #define IORT_NODE_OFFSET 48
>  
>  static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
>                                    uint32_t id_count, uint32_t out_ref)
>  {
> -    /* Identity RID mapping covering the whole input RID range */
> +    /* Table 4 ID mapping format */
>      build_append_int_noprefix(table_data, input_base, 4); /* Input base */
>      build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
>      build_append_int_noprefix(table_data, input_base, 4); /* Output base */
>      build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
> -    build_append_int_noprefix(table_data, 0, 4); /* Flags */
> +    /* Flags */
> +    build_append_int_noprefix(table_data, 0 /* Single mapping */, 4);

The comment is a bit confusing, seems to indicate that "Single mapping" is
enabled by value 0

>  }
>  
>  struct AcpiIortIdMapping {
> @@ -298,7 +299,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> - * Document number: ARM DEN 0049B, October 2015
> + * Document number: ARM DEN 0049E, Feb 2021

0049E.b?

>   */
>  static void
>  build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
