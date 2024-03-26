Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1262528ejj;
        Tue, 26 Mar 2024 04:04:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcUBYZCa/JMDV3vwLJS7Uc5IkUCS37l3ETMWpZpd6y6qB+QGOfLQuM7HFei7Mrue/q0m51nPNc1FukbxthI4apX6DB+/Qb
X-Google-Smtp-Source: AGHT+IGfQ8tb/YthaBgO5j3o7b1ljHMVu1T7T5c1H7aUk0+s81VupvjqfEKD2d5tBk1f0nmSCDSc
X-Received: by 2002:a05:6830:1696:b0:6e6:c0ca:1115 with SMTP id k22-20020a056830169600b006e6c0ca1115mr567633otr.15.1711451078914;
        Tue, 26 Mar 2024 04:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711451078; cv=none;
        d=google.com; s=arc-20160816;
        b=YnOZlj1fS04s2eUUjWZxu+qZR/EJNsOUFNbaBLff9ifFDlwgzkRKb5yDm28rDqdaLV
         RdmYvrYMUAW+eRykoNSBU6tLudRjHBhReQE7ee5e+3Pzae6WTFWWUUJvIGxuqYZ6HQnn
         tcImFdkQdr5XZp7hDpoWciLzj+NdPmDSGMlBz0d3B+T/SsVKcRMNTmT4g8sUMJnazPjd
         v1pUV39sb3o8eAUcUDD7UHo4cV6TWq9XlaFSxEX8OIvt5tixe7C5Ur8sTOFTmbDvghX5
         chex4p+mVNuAMF6cmHzYYOPkURAieisl0lG6o+68tF345u++YTdNrIbKdKl4FTMIBHG2
         xYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=f53q2SxPvBYjGYJCIgE6J1ereeB88Gl5EgTBiYMMG8w=;
        fh=4f9i8Fk18tgCY/a7NNs7JQUKWs2BLA5DTI5vBV5Jp4k=;
        b=04Hj/0K+lbI1acMeH3YGP3D/P6UB14I/+7FnMwm1beRseH5bM6xqN9sgEwW8WpZuFH
         dULfCZm46QacYRxniBvSiuJl2AeIfJkou+ljZ7hJ/jnjkI4SLAU/OFlnmhiJRIApWDzc
         fJKgZeSzpF8hl3JKmvvHuYyzzYJkORu+OKXmF/yki2XLoNThwD8BgD8Fki3Qf7t1zw/k
         9EGlyhfihNzHcHn2x12nxzqPYuoTN8OObH2Km6fupi86tE7lHwbMvfgB19eYkJUaLzQz
         u4oJq1lPDMW7FUzlPFS2elt+sp3a7OmoQYdPjfqWQ1ahNZXQbXexIZZDjxf4/tXFfZvk
         6MuA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VBBipx+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24-20020a05620a023800b0078a31cfe24csi164745qkm.292.2024.03.26.04.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 04:04:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VBBipx+x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rp4bW-0004qJ-1O; Tue, 26 Mar 2024 07:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rp4bR-0004oo-IO
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 07:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rp4bM-0004Hp-1D
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 07:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711451057;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f53q2SxPvBYjGYJCIgE6J1ereeB88Gl5EgTBiYMMG8w=;
 b=VBBipx+xcG/EQhihZr2Mm1nOtUDI7stLgMSV2v1zPQC2eLk54qWEe3x+G803FHoXIOHz0R
 f65SoUdW5Ia/0CfjjigRUG5ERulUOvJqfKUqD/p1mzTksvAkoDEweSN7YPd5Pmt7b1sYGE
 Q5Kn9Atbvrqnm02Ua7UvKbEHIW1M3Cw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-PvfUzUUqNIuDMwe-2x8Y5w-1; Tue, 26 Mar 2024 07:04:16 -0400
X-MC-Unique: PvfUzUUqNIuDMwe-2x8Y5w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4147de378b9so20183255e9.3
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 04:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711451055; x=1712055855;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f53q2SxPvBYjGYJCIgE6J1ereeB88Gl5EgTBiYMMG8w=;
 b=aE0MCk4Kz5XA9Cvll2FzeTtxknUUPRidBq6+8Aisokidm1/WIwtIBseyp0msFz7GRz
 RyxotenMJg5VtjvVAL2IlYkI2u2gHsf/zNQZHedS0KPIuKwloWSmeE5mfkd/77Pu3Uez
 0gaoFrV8DhQT69JaT59GfCuAZaSek8po3uB2lTNylgGx1fqxP/Jb1Fy4EpFMRWMaTLiU
 m6CgQqIzCdDq6dkNXoY/nhOlEAlh4r4+MbRX4o3gM1Qk5bo/vuK18JIX0nrfmIhw1T5P
 hv2hcV7CHlAdm7udQ7NaAKMWkY29Zbjm1E7/xxvMLe1tuusXYBnnL8cz+ubdebh1vXaa
 Z0lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUedIdFtfju2isW1ZCQuyyQNYAZca+y0yIbaskyP6gxPJFqdYnm/9PQRr2LBHyefwWAYbVc6V03qj8ahaUUfJT0kKUq
X-Gm-Message-State: AOJu0YzaA4rNttiEaAvhj4WHLn+i4IoKt3qgFWxhNnwgZGB8SVVmT8Qx
 CVQvo+dtiHyxVTbmDMrOo0brkXAn6JhTtZpM+zIW6jkJ3UmyXKzgagK251GaVkBlVEnfY1dAELM
 fW9UATL63JkTwJTt5JN3Dl4ZzJjpNIu/6CA5M4QlHTXE+6mpvyA==
X-Received: by 2002:a05:600c:310f:b0:414:8fe0:2d16 with SMTP id
 g15-20020a05600c310f00b004148fe02d16mr704599wmo.37.1711451054654; 
 Tue, 26 Mar 2024 04:04:14 -0700 (PDT)
X-Received: by 2002:a05:600c:310f:b0:414:8fe0:2d16 with SMTP id
 g15-20020a05600c310f00b004148fe02d16mr704569wmo.37.1711451054234; 
 Tue, 26 Mar 2024 04:04:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b004101f27737asm11162672wmb.29.2024.03.26.04.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 04:04:13 -0700 (PDT)
Message-ID: <7f3e08db-5c95-4c8d-8b33-857ced740d48@redhat.com>
Date: Tue, 26 Mar 2024 12:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/5] hw/arm: Allow setting KVM vGIC maintenance IRQ
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, haibo.xu@linaro.org, richard.henderson@linaro.org,
 maz@kernel.org, gkulkarni@amperecomputing.com
References: <20240209160039.677865-1-eric.auger@redhat.com>
 <20240209160039.677865-3-eric.auger@redhat.com>
 <CAFEAcA-yLbwPyUxQy2s0CGwcE1z04WQd+EX0xmrvhUepfPR5ZQ@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA-yLbwPyUxQy2s0CGwcE1z04WQd+EX0xmrvhUepfPR5ZQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.065,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a5aZwS72xXHo

Hi Peter,

On 3/5/24 17:46, Peter Maydell wrote:
> On Fri, 9 Feb 2024 at 16:00, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Haibo Xu <haibo.xu@linaro.org>
>>
>> Allow virt arm machine to set the intid for the KVM GIC maintenance
>> interrupt.
>>
>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v1 -> v2:
>> - [Miguel] replaced the has_virt_extensions by the maintenance irq
>>   intid property. [Eric] restored kvm_device_check_attr and
>>   kvm_device_access standard usage and conditionally call those
>>   if the prop is set
> This seems reasonable, but it's not the same way we opted to
> handle telling the kernel the IRQ number for the PMU interrupt
> (where we use kvm_arm_pmu_set_irq()). I guess we have to do
> it this way because it's a device attr so we need to set it
> in gic realize, though?
>
> By the way, does the kernel automatically complain and fail
> if we try to enable nested-virt with a GICv2 or with a
> userspace GIC, or do we need to catch and produce error
> messages for those (invalid) combinations ourselves?
I don't think there is any check of that kind in Marc's series yet.
This may be added if GICv2 KVM device is created while kvm_mode is set
to KVM_MODE_NV.

Wrt userspace irqchip compat, KVM_CAP_ARM_USER_IRQ extension may not be
exposed in case of nested virt.

Marc, is that something you would like to integrate into the kernel series?

Thanks

Eric
>
> thanks
> -- PMM
>

