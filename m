Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1773383ejb;
        Mon, 24 Jul 2023 03:53:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEpcu2Y6XN1X9Y23rwqQxVduC8A2S746lPrtYXUuhTx6YdXBfHO/hZn3MGTPRpLm0XvPbMQ
X-Received: by 2002:a05:6e02:dcf:b0:348:c8a8:1ba0 with SMTP id l15-20020a056e020dcf00b00348c8a81ba0mr3592654ilj.10.1690196013069;
        Mon, 24 Jul 2023 03:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690196013; cv=none;
        d=google.com; s=arc-20160816;
        b=xPJA4iR4+27i+tkVDwFBvy5I4/aSVZhKPn/tflPtp+KwlnVGfSgmR1pqW877N0E+v5
         LqleieoHAgtJDh3wG/G/za4gCD2nOlkzb9I/QND5QpFErQSIkUek1K+Moc7Fw1CaJAs2
         LXJoh8Wt29aBqaXjxtyanQl9T7McbCUzcn7ZCPpxnz8NrHuJNfEDrdIpYFWlXKUr7zpF
         9tX2psasBs6USBUyfDUNlsMjUuq2oKJzCFEiFIrOmBUbJeKjO0gMYeprtvTZ7T9I9WcB
         Hvw94A4xE2BHlIIoaDRp+j4LEncIwkrFAiq4azCCi/y/RFE3bR5Wk1czG9vcPxczJEs0
         vnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=72Vxid4lPGFAPqcNotszz48/hXCNrAO2F4A+SW1VaR4=;
        fh=zlpASWiFX/cotIFAyrriCRJDmFpobIKVCGxuAsr+eCQ=;
        b=xQsvIrWPYzp7EV2AQus99LsaiNYniIRaSXpm8kGYpVtLJY0VAzpgiqZgVNcekaBECD
         suJB/J165MJZhPOsZZ3frHzoleWwU1WUxsJptlJDwmTorOxBEfY4MTHGguO43lByZXuP
         z3sjrdlL7ol5BfWk559DIMhF78G11OWuzxoyZwz5QF2nLX984JUy/HuNA7WDmlx6ZKyY
         JtOIRe9AQcb3S4nkCIxpJ5V/yxT22VyilxpWmKbq+xp02RvmM86SwVyc/bZ+xikR2zR7
         oQ01joNl/Yz5/UBnApVSr4KQ65MiadNcVthROebMl4eRtdxiROWGhTH9keWA+SRHX5tw
         SYdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQOBzZct;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id bs125-20020a632883000000b0055c3e6ada36si8304815pgb.354.2023.07.24.03.53.32;
        Mon, 24 Jul 2023 03:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sQOBzZct;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232859AbjGXKxb (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Mon, 24 Jul 2023 06:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232799AbjGXKxa (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 24 Jul 2023 06:53:30 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D53E5C
        for <kvm@vger.kernel.org>; Mon, 24 Jul 2023 03:53:15 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-314172bac25so2949977f8f.3
        for <kvm@vger.kernel.org>; Mon, 24 Jul 2023 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690195994; x=1690800794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72Vxid4lPGFAPqcNotszz48/hXCNrAO2F4A+SW1VaR4=;
        b=sQOBzZctSBnZ7py40vFsg1unHyBQ9XXalIA/kbqy75KmENsrvk93LxUJ+U29RWg1d4
         xbcitWnMCF0PJpsSerM3TbONu3AK3V7XuvbCUVocEukr4E6aTKshGm4weE6UStiXiHbd
         qFWGlgWo1QwQTjYiwuhMrbIZVYY1ZmaX2CRS/WKKarToYsWIAp1lX2JA73o5ff1Wys/0
         GIelBcTNJRJcEQ4MVFZjZ8L5iSAO8ujPvr4FaTB/QSqpo2clAsf3Dy2OdjLt4mxz8e+U
         /yFLgQTHantouv6/oDPS30wN1cmuqrERK8KddLJeAc8XALVdhzin57D5oiwWwZO56Icu
         jbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690195994; x=1690800794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72Vxid4lPGFAPqcNotszz48/hXCNrAO2F4A+SW1VaR4=;
        b=MKwTaKb0mmrx9SRQ4Dfw+xSOG1Ov09nGZu0A2yHyIwRz1Y9CYES8HIt4JOGvpZVPXR
         x49s0j4gVqZJ1WoUdJg5dF/6AEC9qGgwc0raGWsvsFUV5wkUzs6J1hxTlP9I9U6aTImh
         YIdh/9WQ1zihWHZ8zoleAL20df1oWWhKctDloDQAuOhc6kfK3SKpmX76xxkc7fjneI3h
         a/7uR3AXSd4hrxi1kUsSn8TWnv2vLm8hlrObX8TUb/4qY8quxXZUwW3BX8Cg6o2RxtBt
         DnfBsotMYpdiwIZcT69qewl2wYNH/OZegkDR6NdEnPSQ1LySfukLM9jBZYhRfgxunTug
         RP5A==
X-Gm-Message-State: ABy/qLa8FNJZOtw2/zQxUmo97dvlfLdrKQ7wnMX/J64QvM8c6TsKxzQa
        UM2Esgs2h9nTd1NuTNVyR2Se4Q==
X-Received: by 2002:adf:f185:0:b0:317:50b7:2ce3 with SMTP id h5-20020adff185000000b0031750b72ce3mr3713517wro.51.1690195993963;
        Mon, 24 Jul 2023 03:53:13 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.210.255])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b003143c9beeaesm12673051wrr.44.2023.07.24.03.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 03:53:13 -0700 (PDT)
Message-ID: <da9bf5ae-a61e-24da-9d17-6cfd8bdaf4b7@linaro.org>
Date:   Mon, 24 Jul 2023 12:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] kvm: Introduce kvm_arch_get_default_type hook
Content-Language: en-US
To:     Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>
References: <20230722062250.18111-1-akihiko.odaki@daynix.com>
 <20230722062250.18111-2-akihiko.odaki@daynix.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230722062250.18111-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZUErp7TRYfVm

On 22/7/23 08:22, Akihiko Odaki wrote:
> kvm_arch_get_default_type() returns the default KVM type. This hook is
> particularly useful to derive a KVM type that is valid for "none"
> machine model, which is used by libvirt to probe the availability of
> KVM.
> 
> For MIPS, the existing mips_kvm_type() is reused. This function ensures
> the availability of VZ which is mandatory to use KVM on the current
> QEMU.

Pre-existing: mips_kvm_type() returns -1. Should we check for
'type' in kvm_init() before calling kvm_ioctl()?

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/sysemu/kvm.h     | 2 ++
>   target/mips/kvm_mips.h   | 9 ---------
>   accel/kvm/kvm-all.c      | 4 +++-
>   hw/mips/loongson3_virt.c | 1 -
>   target/arm/kvm.c         | 5 +++++
>   target/i386/kvm/kvm.c    | 5 +++++
>   target/mips/kvm.c        | 2 +-
>   target/ppc/kvm.c         | 5 +++++
>   target/riscv/kvm.c       | 5 +++++
>   target/s390x/kvm/kvm.c   | 5 +++++
>   10 files changed, 31 insertions(+), 12 deletions(-)
