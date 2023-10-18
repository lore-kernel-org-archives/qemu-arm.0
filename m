Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4770464ejc;
        Wed, 18 Oct 2023 09:40:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZqFgO1k/OZITQKuQRgN/bTdQG95HFt86S1jWjIw+L0E+2S1YAsfU1z2SH9wbKtkFeKnnY
X-Received: by 2002:adf:e792:0:b0:32d:cb21:4e99 with SMTP id n18-20020adfe792000000b0032dcb214e99mr4545140wrm.13.1697647234615;
        Wed, 18 Oct 2023 09:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697647234; cv=none;
        d=google.com; s=arc-20160816;
        b=ITK03R57/rPDH5jm+cIHvo+RhFcfngDpadwodnWWrOJMmcaGHoJ/+oFSXiPqgUcR5Z
         bIJ4edWVoc4P6mr49K0ofxeKB7gjTAxGf+uXjRVTSpw7SIBMJ5CchYYN4WMUlq8f+sfE
         Fd9ureIxmhgZNhVK1yvDCIN/43ekPmnA6FefMNu/PbgtZf/ruvWGMOhvqmdd/9+1tS2g
         y3fwdeSnGDdocZYsFUSo8IDJEneXTWfS7ZHsKvhvLj+xCHxTaUHGHVKiLPb8BWjOXFlo
         6b8sjTJMZnoGK+DblHFVQ0GaUvzy/Cf0eLQENwMPiP/GoJeWgGbXdntR21v7w5yPLSBX
         5GEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Cw6Ww9qVFu18XScQbUYySkVA3mm9ap2DhaKeIlogz3Q=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=Inq7TCscQlj3IQnA9cxeezET/SXsFhZ//91FG1Rnvp4L+anakruLHbzCirVaONqbKL
         tVWp0ixxV6PTBKQE0qff0LPXGNO6CtjCR8dwqbxJO1p//FquzI47VO6Fyq7tP3BhjOy4
         4poLFcyeJgYJD9DZ6hARopsOvOr0xpVlcU5WeUArAY85n5GAf1aSCO+T8H9p9f27ITBr
         bzgEFF00soVdfH5NowkowaW61i4tR0J++HdPsXJ6GraO8NZZ1jN7O4EbT7oW4y14yLH7
         h1mou46QYF0xJpGNNGY/7XgqA/8v0Fqv58UFZJxD29w68jpkE1dvkuffbPQBJsCGB0M0
         ur2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bn+8uKhc;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w11-20020adfee4b000000b0032dafee39e1si1492142wro.330.2023.10.18.09.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bn+8uKhc;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697647233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cw6Ww9qVFu18XScQbUYySkVA3mm9ap2DhaKeIlogz3Q=;
	b=bn+8uKhcpLrJEeOGMwHuLM83g1Y7mWC/W7FgepCU1tnHgNfl7h0lwu5O2yRALf2EK/XOVh
	3sGkP3r5okePI3lX0kDCY0NOcsPyMb9TT1XiFy8I1kVGxzSnQnFPUORX3QwuDnhGfRGrit
	NPkbcMDeZr+mt1nW4etQq6gwrK+2bvE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-ybqIBroDOquwR6A6NW9C4A-1; Wed, 18 Oct 2023 12:40:31 -0400
X-MC-Unique: ybqIBroDOquwR6A6NW9C4A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9a9e12a3093so778709866b.0
        for <alex.bennee@linaro.org>; Wed, 18 Oct 2023 09:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697647230; x=1698252030;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw6Ww9qVFu18XScQbUYySkVA3mm9ap2DhaKeIlogz3Q=;
        b=SHLpnl4S6wMk/wPCT4jEMXyKro69FTTjuEuUyiZazYrv1VfstEPAwZXdWoY0se7GzJ
         pWTL9MbRmTuEWHUQJ9ixjH+jyPInQ2pyzRGAeFax7l3aZWAR8UTcR7iSdup1aeJ579Yl
         twVUQ3DwZwTggHNMueBHmH42ZsAt3TmG93rLFBFGJgbO4K7XorZlgqW/5m/gG+xigw3N
         YzgSAW7WY4MxvkvBYoHiSVJlV758EsHpi9F7XhPfcjBVbtNHd6E6dCRyBzOigqYHm13B
         8aEo2f9fUVEf/JHT9eXF7L+fS3zBlMwj7ZsixpuSspVCdNd8TbeMzP2u4/7sgtOZ+oZS
         YEAg==
X-Gm-Message-State: AOJu0Yyu6af1YL9VfEiabdPOPJKcDUIvay4Kn/kyc4j2JmVrWDDkqVpD
	JHAZVlrzdvmd1PN8s8NZyFLUG2hrd758S0aZuYH9yqUODz5z2Z6QU6OgQC5rdARJKC1+FWDJGjD
	yoaKGTnWipAb6GXcC
X-Received: by 2002:a17:907:1dd4:b0:9bd:bdfd:e17a with SMTP id og20-20020a1709071dd400b009bdbdfde17amr3968797ejc.6.1697647230363;
        Wed, 18 Oct 2023 09:40:30 -0700 (PDT)
X-Received: by 2002:a17:907:1dd4:b0:9bd:bdfd:e17a with SMTP id og20-20020a1709071dd400b009bdbdfde17amr3968780ejc.6.1697647230048;
        Wed, 18 Oct 2023 09:40:30 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id m8-20020a170906160800b009ae54585aebsm2030807ejd.89.2023.10.18.09.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 09:40:29 -0700 (PDT)
Message-ID: <244c53a4-e727-44a8-ba30-598a1e43c1a8@redhat.com>
Date: Wed, 18 Oct 2023 18:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/PATCH v0 00/12] Gunyah hypervisor support
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IlYhI1kuNoUz

On 10/11/23 18:52, Srivatsa Vaddagiri wrote:
> Gunyah is an open-source Type-1 hypervisor, that is currently supported on ARM64
> architecture. Source code for it can be obtained from:
> 
> https://github.com/quic/gunyah-hypervisor.
> 
> This patch series adds support for Gunyah hypervisor via a new
> accelerator option, 'gunyah'. This patch series is based on the Linux kernel's
> Gunyah driver, which is being actively developed and not yet merged upstream
> [1].
> 
> This patch series is thus *NOT YET READY* for merge. Early version of this patch
> is being published to solicit comments from Qemu community.
> 
> This patch has been tested with the open-source version of Gunyah hypervisor.
> Instructions to build hypervisor and test this patch are provided in this
> patch series.
> 
> Limitations:
> 
> 1) SMP is not yet supported. This restriction will be removed in the next version
> of this patch series.
> 
> 2) virtio-pci is not yet supported. hw/virtio/virtio-pci.c seems to support only
> KVM and would need changes to support other hypervisors. If there is any ongoing
> work in this regard, would like to build upon it and add support for Gunyah
> hypervisor.

virtio-pci does support other hypervisors; what is not yet supported is 
cross-hypervisor support for IRQFD[1].  This is more of a QEMU issue 
than something specific to virtio-pci.  The way to fix it is to add 
wrappers for kvm_irqchip_add_irqfd_notifier_gsi and 
kvm_irqchip_remove_irqfd_notifier_gsi to AccelOpsClass, and move the 
stub implementations in accel/stubs/kvm-stub.c to the abstract 
superclass.  Then you can switch the users of these KVM functions to the 
AccelOpsClass wrapper.

By the way I've just posted a series to remove support for really really 
old kernels, and this should remove more KVM-specific code from device 
models.

Paolo

[1] a Linux eventfd (or QEMU EventNotifier) that triggers a guest 
interrupt when it becomes readable.  QEMU writes to the eventfd and the 
kernel responds by injecting the interrupt
