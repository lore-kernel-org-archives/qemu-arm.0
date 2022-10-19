Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp220067ejn;
        Wed, 19 Oct 2022 03:44:19 -0700 (PDT)
X-Received: by 2002:a5d:56c8:0:b0:22e:32c5:d397 with SMTP id m8-20020a5d56c8000000b0022e32c5d397mr4547331wrw.462.1666176258842;
        Wed, 19 Oct 2022 03:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666176258; cv=none;
        d=google.com; s=arc-20160816;
        b=LiKPWc3Asl0tTm+IcNxRVxT1TSWK7zXERMDF/13RRW8CgRkj4T0neawkTYkdZCA/mk
         +hLCop9nnJO1qJg/faCSwwBp59ctKO7XTegYXmEO2c4+VExmgtU+r+p+Wo5lXtTO1AYe
         xei1GYUTGeNOokqJ3dlT1WKXMe73c+aiGOMGxhNx/8n09ViYyymuXErD4WeHf5GOOwaK
         xI3rdIGnikfzClzdCNakgD4cudMa8l4VEegAzYFIm0ZBPohsImrD52OgZGfj6LDsYcvy
         4Ne5VuYE33+pEfMtBvw+xsji8t1qkdlMjZ2COBlQgZAWt6yljlD48RLsTNCjItEWFkcq
         geEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qdeaJX55sH31dG5hyU1Da1POz39+LgsgnxASJcUuNZc=;
        b=iyB0nKws/1bclAFBnbwDJ7QN5T+D0Qf5UpVyDK6Iw0al3qxP+/w0b16COF8/5BkI2P
         H5v/aEPUHIW/4bEIgMh9xmDxX8v395ef/HiiOgs53JzAHfYFVKZmViNBZmqJn96opb+A
         vq6A2fWoOTGgIl3yolUO0OXGTfv0kSx8aR13srk1cqrm/eIISBGhf7v2g8K+GRoScS92
         YuyQfY404ewUupYlrBYKUlyFQ8Ba9+7/H5RhPG20QiIhCzGxhZ786USeOrq+XbbY/cnT
         Dp30CgDocijME9mJvEM/EgDbQOMx3RyC+Wn8/vtH5y6WbkBjzyyxE70ezg8G2UOlOg28
         pgQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yi4ARY+m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u13-20020adfa18d000000b0022ad5626d67sor8334890wru.48.2022.10.19.03.44.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Oct 2022 03:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yi4ARY+m;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdeaJX55sH31dG5hyU1Da1POz39+LgsgnxASJcUuNZc=;
        b=Yi4ARY+mHRWrHOYRqIUS8DQySqkvWtqiwtwhh7E9WKQCkDoii/ldkCt1pxBSQ90iet
         AGrzztLNZUM+l4PmxNx08+uGgRiRBIGE2JSvGX758UDAETXPNck9U35m4grY91KUN9UP
         k45QoTE2XNWSU4gLLAX87sZBzlpuoRGxwBRnofm9ODUGsB640BThktfeC+gwCn+CtxpP
         suAODdD7XMXVecaUnl61dfrSdqdsk8UxPSNtoxUzqpf0N15ZFSVqDYd+C41R0RYJR4yF
         NwZWQUx/Z84J62y5qXu3poZkNvFBoD1bsqMqkE/BRqDDEqjN7KRwKFoAVhjwizCTeWny
         yfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdeaJX55sH31dG5hyU1Da1POz39+LgsgnxASJcUuNZc=;
        b=Huy/vp/jN6jt1EYgzB958rivdKJ93qxGmZxhcimNrbtJu4ENMO8uW80Wv72tvjwC9R
         4LYw3rOLFUDLErPe640RBBwSrO3XizoQoZ5Fav22xeIDLC/rZ/TLh2192RCYA/I8UBnO
         s2+t6+ch6VNCRfAl9Uu+vf+vd1tAUiXEjEJeht7EafL1MiXtwVeWVVOukCR7nubbUDBh
         HYm177Jz/aE6KBkK+yvZ8Yteo5ODa21wBypVg72C2TGcV5ViE5JV5RegTf0XSQ/quand
         FHX8PFTE2mSqRrlmmNEC8XYNaa4nF4/nZtDfYPco7jpIY1BtyV5l5JI36YDw6pzKMNAU
         vxrw==
X-Gm-Message-State: ACrzQf35gfMRtKdpZ8mg1eFpJ1H3rVwQVDt1AuAsk6pPGQh6/HeK7SsS
	WTsKRv7ganQ+evHG3LEZ5l5CY+sqFv02JFI3/rE=
X-Google-Smtp-Source: AMsMyM59jhX1vFGcRAtMphxABbSR7dOtpbpeVT53Gy1hZCktN70biH0Ho/oV4Ep+O6Q9RkpLJ44gSg==
X-Received: by 2002:a5d:414c:0:b0:22c:de8a:d233 with SMTP id c12-20020a5d414c000000b0022cde8ad233mr4806983wrq.194.1666176258215;
        Wed, 19 Oct 2022 03:44:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id c16-20020a5d4cd0000000b002302dc43d77sm13708102wrt.115.2022.10.19.03.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 03:44:17 -0700 (PDT)
Message-ID: <dbcf971a-54c9-7778-06af-16837e8cb1fc@linaro.org>
Date: Wed, 19 Oct 2022 12:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 04/15] target/arm: ensure KVM traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220927141504.3886314-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: clhcG1oEDRJA

On 27/9/22 16:14, Alex Bennée wrote:
> Although most KVM users will use the in-kernel GIC emulation it is
> perfectly possible not to. In this case we need to ensure the
> MemTxAttrs are correctly populated so the GIC can divine the source
> CPU of the operation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - new for v3
> ---
>   target/arm/kvm.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

>   void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
> @@ -1003,6 +1004,10 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>       hwaddr xlat, len, doorbell_gpa;
>       MemoryRegionSection mrs;
>       MemoryRegion *mr;
> +    MemTxAttrs attrs = {
> +        .requester_type = MTRT_PCI,
> +        .requester_id = pci_requester_id(dev)
> +    };

Can we add a MEMTXATTRS_PCI() macro similar to MEMTXATTRS_CPU()?

   #define MEMTXATTRS_PCI(pci_dev) ((MemTxAttrs) \
                             {.requester_type = MTRT_PCI, \
                              .requester_id = pci_requester_id(pci_dev)})

So here we can use:

   MemTxAttrs attrs = MEMTXATTRS_PCI(dev);

> @@ -1012,8 +1017,7 @@ int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
>   
>       RCU_READ_LOCK_GUARD();
>   
> -    mr = address_space_translate(as, address, &xlat, &len, true,
> -                                 MEMTXATTRS_UNSPECIFIED);
> +    mr = address_space_translate(as, address, &xlat, &len, true, attrs);
>   
>       if (!mr) {
>           return 1;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
