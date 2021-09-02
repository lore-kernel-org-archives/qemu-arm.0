Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp395408lfb;
        Thu, 2 Sep 2021 08:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgxLVMxpGji9TnKEYc6B6HiFcNGDN46czRobTuHWPFmA+8Zpt7Kp1EJAtQPY79wc9PiQBu
X-Received: by 2002:a9f:2661:: with SMTP id 88mr2498282uag.62.1630597938750;
        Thu, 02 Sep 2021 08:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630597938; cv=none;
        d=google.com; s=arc-20160816;
        b=MjSiTWUFLpIfAKFgiq/qBIVyVlylG58Njaq3LY24sVDX3Fzy+6wc5j0i0Gtb/40vvH
         ziSM+4xhcINnHVKE3v43WaNQSt9GsldUC2lII/mmG2L8pl7o+h5TVVVmI+G9z03d753g
         8VilmBv663XblEP3lyhRNmgO7xfEAIXkQX8v9o8qKKDUcEY/8GBIlSxG5ng2QdZkyTES
         Hz5/qBKaz/DZuOOydHk5VOjvbN1scEv0n/lNq1uMss8U+fV6eAkYcJxzbePkQYznqIYm
         o4LMJWBNWTKmyheR6wsFvempdrEW5OiKI0zjPblY6oTdwlF9xj3Phhl8DXZI2wjeZb2r
         OlWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zzmyjxl2fURor1msLQ2OsJ9gkwOPAMYczafXgfPcr+E=;
        b=x/+4tXLRmTQe6YlkSNaEnvkf0HV5WTKVDsig3bve38wFmSSSOUhNNR2c1diCO0yG7L
         qe6XCecYNjyoFSCkyEjmfolCUKbt2LwCHSZmc4BeRTTe4CgseT7enwVTB0+clFTbuLoV
         KqUTM3WyGdN8lOqIYkUMCg8VPSrQF3w7fT40Vuy8Oelg643sDR+RgjFNORaebBqBAOAa
         qZpjMQf67bgzFi+AsvOJ97b6EsC5teCCWbkACbAL2ivg9P36lWaFPEowx5JoNtrofvvT
         L/k5PsntjzCJvMVmqK2i+U/H4JxzX+GpNIaiqwwcMxB8fr2wKLogYH9I+pll587acTIb
         5DAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pm8DcQ4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h140si920322vkh.21.2021.09.02.08.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 08:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pm8DcQ4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLp0j-0004Lb-WF
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 11:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLp0D-0004JN-6D
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1mLp0B-00050J-MS
 for qemu-arm@nongnu.org; Thu, 02 Sep 2021 11:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630597903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzmyjxl2fURor1msLQ2OsJ9gkwOPAMYczafXgfPcr+E=;
 b=Pm8DcQ4GycCvI5VQLmaGZYB+BGuy+Dr5L9svY5mmiHxTKEBil10L9SafmsesXlog/YgLsD
 Uz+/mifNIqHeXXKaABANk7sE7n9FZVqWQxuVxDCZzMQenZZAH8Pkg4BL2xlr2zDFTrXZCc
 5aUI+dPz46Vee9zYejnMplpVOImRVxQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-3QmpLbulNYK1aTZ8bDR_NQ-1; Thu, 02 Sep 2021 11:51:42 -0400
X-MC-Unique: 3QmpLbulNYK1aTZ8bDR_NQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so699483wrr.2
 for <qemu-arm@nongnu.org>; Thu, 02 Sep 2021 08:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zzmyjxl2fURor1msLQ2OsJ9gkwOPAMYczafXgfPcr+E=;
 b=uJzwREWHQz+jTeRZBTYYPERZeTu9wEU5Fq7Vvdxib1D3/fsQN42t7mUDqod5nL/9gk
 kMyv2zi4haNGSeZiugyUR15MxHWJarKXLFV47/NK75SQeTVMD5IkyMopWLbaRZFngq6G
 vmsvqeIRqKgxliq6YmaYN64aPmWmoWQiTbA6s76hSdQAB9s5pbtnunjpgmrofNyM3Rbo
 z6m/uGAufvTnla5z7pQ9MjmNyJihceezGlHdd/SZ8Tmk1snL+sPUOJ75VL5QL3n0/SMv
 2af2kiJLmIDMMjw6spZ1V81pkNzPUBY3nQ3KOvy/1ks/0RLvyO+jAo401lVZdxvSyNcg
 F3rw==
X-Gm-Message-State: AOAM533zDeTBtR2AsqEKPoQxi+TL7P4ajgqdLflencXYOOw6jOs7q5FA
 QXPouCvvEnjKyjAjtkiTqJc+VjWI0oF7yZfLpc5WN+uVfwUPqjc+Mh0vOS4eW6wzct7+FV1Rfte
 UXmAX3EvpjfEl
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr4583287wrk.407.1630597901107; 
 Thu, 02 Sep 2021 08:51:41 -0700 (PDT)
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr4583265wrk.407.1630597900913; 
 Thu, 02 Sep 2021 08:51:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id e2sm2068791wra.40.2021.09.02.08.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 08:51:40 -0700 (PDT)
Subject: Re: [PATCH v2 30/35] acpi: arm/virt: build_spcr: fix invalid cast
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-31-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <bc3aedd6-854a-41fc-1072-7c87dc0084f7@redhat.com>
Date: Thu, 2 Sep 2021 17:51:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708154617.1538485-31-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
 mst@redhat.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9nm6Py+Dm7LL



On 7/8/21 5:46 PM, Igor Mammedov wrote:
> implicit cast to structure uint8_t member didn't raise error when
> assigning value from incorrect enum, but when using build_append_gas()
> (next patch) it will error out with (clang):
>   implicit conversion from enumeration type 'AmlRegionSpace'
>   to different enumeration type 'AmlAddressSpace'
> fix cast error by using correct AML_AS_SYSTEM_MEMORY enum
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

> ---
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: shannon.zhaosl@gmail.com
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b88ea4b70a..a07540affb 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -361,7 +361,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      spcr->interface_type = 0x3;    /* ARM PL011 UART */
>  
> -    spcr->base_address.space_id = AML_SYSTEM_MEMORY;
> +    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
>      spcr->base_address.bit_width = 8;
>      spcr->base_address.bit_offset = 0;
>      spcr->base_address.access_width = 1;
> 

