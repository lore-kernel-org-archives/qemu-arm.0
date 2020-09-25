Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1285569lfq;
        Fri, 25 Sep 2020 07:02:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr/rmuFXF4LP1ERKlcwronALXSidIr3WIbEf+7BRcv3Zn3tg3HKwQOv82VWQKJ0GTRXqM+
X-Received: by 2002:a25:d78a:: with SMTP id o132mr5468960ybg.304.1601042558547;
        Fri, 25 Sep 2020 07:02:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601042558; cv=none;
        d=google.com; s=arc-20160816;
        b=RMG8j173+llZTXpDCQuNQkpvXgU9hVhm9bCvkAbgH1qq7D23nBnF4MqhhavEAOS2yf
         +C4aSlpVfeHXofuI2fcvuKzAnrliRzQjVrMz9lowntM47VTetsrDqC40Lxy5oyVS4vY9
         uV/ylVVEPNMdz/rAyHqtqJjinQForTyIGoNh0jiznwMSzxXuKffe3GqzbV82SV6VFVLY
         YNDjHDdVYqVL+8XLMRwHIciztslL0Ryulc+gvJJIV/hZuuRxvI2T6JLjL2xgcu33wZRC
         pA1noD6lLJwvCY5owPm5+DDsz1CtAWrSRmAb/fuIOxrRa74lohVeHD0fC8dAMGj7GTLa
         9PNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4CHF+ezhis4SAEcMwPb+WVB2eESlhGpYPR87Prfoqek=;
        b=IDLfm53MXNmREkP1eI3D4WydQ14fs4r1SyrpRRgCY8plYh7rSDUhRMgkzcUJmNiQ9f
         ZRGWdo9WSYsvKeuVqBgRLRFf/tFzCkxPakEw+InyuVfP11nxFWFgCundXF+BqD55i4Hf
         lsk6SNK+yrLYUcZrwK29QUSOqaOVKAROy9obJaF4Z6AkBATejgu7hgkgjwrCFHZNgU7i
         wB7yMNIZzeWLl+3lksAiLC9H9lCDtNaVFkR8vCPqQkMwhrVys68R6RjNDUncJ+hZOOCr
         Y9uGuzyGWfYjbVYLtYjIAl6J8O4EZBRb+g/07NPWodgMiB9r97ZngF7R1aKXEVBpSaUa
         G3/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ba4pam1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si2792972ybt.392.2020.09.25.07.02.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 07:02:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ba4pam1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLoJ3-00039v-Un
	for alex.bennee@linaro.org; Fri, 25 Sep 2020 10:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLoHZ-0001WW-3Z
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 10:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLoHW-0002MB-M7
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 10:01:04 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601042461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CHF+ezhis4SAEcMwPb+WVB2eESlhGpYPR87Prfoqek=;
 b=Ba4pam1tBKcXDihlHGFzApTTbnK9BJwb9/jl4pqy1aQPTBMM8G+pAlEYVXxEJPAKxb6adg
 tzu6QQNUJAmJ5STl/JU3WUpYAYBwhDnFkde4Zcz5KXjturh3lXcISrjXdrxBUKcy402t6X
 leZKF/iFebC14YfRVefe232tvpGAQDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-ECgDWX4sNiSW7ehv5S0unA-1; Fri, 25 Sep 2020 10:00:57 -0400
X-MC-Unique: ECgDWX4sNiSW7ehv5S0unA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A625A195D569;
 Fri, 25 Sep 2020 14:00:55 +0000 (UTC)
Received: from [10.36.113.81] (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7FC7368C;
 Fri, 25 Sep 2020 14:00:49 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/sbsa-ref : Fix SMMUv3 Initialisation
To: Graeme Gregory <graeme@nuviainc.com>, qemu-arm@nongnu.org
References: <20200925133902.28349-1-graeme@nuviainc.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f67b75fe-c5ce-8b95-e19b-fc4ce2217b31@redhat.com>
Date: Fri, 25 Sep 2020 16:00:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200925133902.28349-1-graeme@nuviainc.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.238, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, jamie@nuviainc.com, rad@semihalf.com,
 qemu-devel@nongnu.org, leif@nuviainc.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q1gezKSGQWdp

Hi Gregory,

On 9/25/20 3:39 PM, Graeme Gregory wrote:
> SMMUv3 has an error in previous patch where a i was transposed to a 1
> meaning interrupts would not have been correctly assigned to the SMMUv3
> instance.
> 
> The code also contained an error in that the IRQs were never allocated
> in the irqmap.
> 
> Fixes: 48ba18e6d3f3 ("hw/arm/sbsa-ref: Simplify by moving the gic in the machine state")
> Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  hw/arm/sbsa-ref.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 257ada9425..9109fb58be 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -138,6 +138,7 @@ static const int sbsa_ref_irqmap[] = {
>      [SBSA_SECURE_UART_MM] = 9,
>      [SBSA_AHCI] = 10,
>      [SBSA_EHCI] = 11,
> +    [SBSA_SMMU] = 12, /* ... to 15 */
>  };
>  
>  static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
> @@ -530,7 +531,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> -                           qdev_get_gpio_in(sms->gic, irq + 1));
> +                           qdev_get_gpio_in(sms->gic, irq + i));
>      }
>  }
>  
> 

