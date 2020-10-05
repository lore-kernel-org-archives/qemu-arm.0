Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3904096lfq;
        Mon, 5 Oct 2020 03:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+HWpVjKpod4WQQEE8TnEVknEkuBCcZpakaPxaQnCIeZc0P6kwStPCRjNOckFZd1Qe6R1i
X-Received: by 2002:a25:b98b:: with SMTP id r11mr19094992ybg.70.1601895189712;
        Mon, 05 Oct 2020 03:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601895189; cv=none;
        d=google.com; s=arc-20160816;
        b=zKpK9qZAA+UESu/yKdrkzJYGkxL/AeF5eIBAbm0RT1FuZTZC45UjOcmNqVAoFXmeT5
         IQMeCQWiSKqUdbjtKthGsv/X/SL8J6VaJhzlYGlCkaVRfhxxCqjP29XlCniL3p4Bj8hT
         txhxAyfYqRh9UQHKBsD30z4EZbL5mEJrlMzoREQx5zhPopMsRLj4lTmXgDFJC4NLSVQ4
         bTNEF89+7atDkEw+jZd5+2FvluLKsq7gK5npiGnmSQBS1FUZeoIXRuUdkvQczEtjKL5B
         YFXxTZJHDwJFAzDd+EynWbYzn74e35mJNumBch3lR6X0R4Cshr/ks3eZqxYe+ZFP5T0S
         AKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=kbiHNjQke6HODK9Aq4q/LEwhaKtx/GjpAuwA6iwInj8=;
        b=ifBjFQ5CwTklFFrAvyrW7C3RYKXyp6c7VZKs160p2/wiBTShjrbXmX/Lyl9TKrzWvF
         CCW4bPGXsbEFIxZH1rRM6Sk2dMo7pkLl9zRnQxXkd36wI5Q8754JfJthrc7ou9v8Xeiz
         R8rO5K9w3VBSrS2jBdvwb2wCsAE9kS3pMutPcC8OIuuxh463kpyXPpMln+miUUCn+J6X
         yCFA6aFrhddAQjaswHGUjNsxjBcftWh32s3fQhQqu2Wpc27FJ4dZ7O7yn3Qa1EFteytj
         vapVLKK27XozXkFDahhCF+jLyUtRFAN2RugcV64Jlf7WPe/IX9zKEBD1zTn57GfxpQw8
         LhKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ErtRrO9g;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id 10si11406402ybn.21.2020.10.05.03.53.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 03:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ErtRrO9g;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601895189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbiHNjQke6HODK9Aq4q/LEwhaKtx/GjpAuwA6iwInj8=;
	b=ErtRrO9geB+aYFaH9ydl2ZdcqWaAtXKOlYzWrmYF+HdXtDXQiJymwfW5jMVPc7iwcgyPGg
	P00zWoqRQIwiEh0zdTNAf9D/xdZdNE3FHbIfFhRG9lyNfQi+G71qOtxKhabk4AjokktKMP
	lQcI2cm5BBLrIzdcy2NxlEHRj7f2jto=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-yv1wWA9SNF-5-i7YtWOSAA-1; Mon, 05 Oct 2020 06:53:05 -0400
X-MC-Unique: yv1wWA9SNF-5-i7YtWOSAA-1
Received: by mail-wm1-f72.google.com with SMTP id c204so2291866wmd.5
        for <alex.bennee@linaro.org>; Mon, 05 Oct 2020 03:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kbiHNjQke6HODK9Aq4q/LEwhaKtx/GjpAuwA6iwInj8=;
        b=PCtDetagKPXjzEqf9ZKOfun7c7H23+0kmHV3GhWdHO0P0VNzagQKqRDNMRREYTA89i
         9b4dY6XH34ZMFa8GsE7u0tkdU+xMbGhAWdsxrM5s/lwGTtKxyRIaBYLDc+PtUJGCG2sG
         R+YpOFv00VL/Ruf1sOe8jtlVmeWC0zDsdWUshsQOKQMURXCY7c/WzUAWPYgSj4384Ahq
         QPfSaVGyWY8rBck/2vR8uP2WVPbufsbs2u2/VWQP3OVa/P3GyhtQkSEKDtJtu2G4axXx
         /UmEuu4zdEqGWnikCCngI+kLTen4xrE3962e4JVBHVtfq+4T+6erwthGq0jTxDURad85
         7BlQ==
X-Gm-Message-State: AOAM5306thpjKKnoic4GyxqMovIPY1/OEo7HX/OBoV3KvB5dkS8z3ZQL
	WQUEn/Nw6hobLBocxGxWIqqoyau4MtmdjKMzLC+1ZZXQIY8Oz5kMrF4HR0PmroDqvwqVYEUZbYu
	/O/ZL1dzoUdV6p9M/
X-Received: by 2002:a1c:111:: with SMTP id 17mr15948753wmb.126.1601895184071;
        Mon, 05 Oct 2020 03:53:04 -0700 (PDT)
X-Received: by 2002:a1c:111:: with SMTP id 17mr15948727wmb.126.1601895183801;
        Mon, 05 Oct 2020 03:53:03 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:2e86:3d8b:8b70:920c? ([2001:b07:6468:f312:2e86:3d8b:8b70:920c])
        by smtp.gmail.com with ESMTPSA id k190sm8882949wme.33.2020.10.05.03.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 03:53:03 -0700 (PDT)
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Richard Henderson <richard.henderson@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-18-philmd@redhat.com>
 <CAFEAcA-Rt__Du0TqqVFov4mNoBvC9hTt7t7e-3G45Eck4z94tQ@mail.gmail.com>
 <CAFEAcA-u53dVdv8EJdeeOWxw+SfPJueTq7M6g0vBF5XM2Go4zw@mail.gmail.com>
 <c7d07e18-57dd-7b55-f3dc-283c9d13e4b5@redhat.com>
 <8253ddd7-3149-17d9-1174-6474c4bde605@redhat.com>
 <36629bed-9b32-01a0-fdc2-831b10e4bad9@redhat.com>
 <f3b931f5-c785-1d98-edd1-e5fcc91ff0ce@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4c371698-b41a-82ba-9fe9-022a37a86a01@redhat.com>
Date: Mon, 5 Oct 2020 12:53:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f3b931f5-c785-1d98-edd1-e5fcc91ff0ce@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yEofLMZwy4mq

On 05/10/20 11:22, Philippe Mathieu-Daudé wrote:
> List of arch-indep Kconfig using arch-defined selectors:
> 
> hw/acpi/Kconfig:42:    depends on PC
> hw/intc/Kconfig:31:    depends on ARM_GIC && KVM
> hw/intc/Kconfig:36:    depends on OPENPIC && KVM
> hw/intc/Kconfig:40:    depends on POWERNV || PSERIES
> hw/intc/Kconfig:49:    depends on XICS && KVM
> hw/intc/Kconfig:60:    depends on S390_FLIC && KVM
> hw/mem/Kconfig:11:    depends on (PC || PSERIES || ARM_VIRT)
> hw/pci-bridge/Kconfig:8:    default y if Q35
> hw/timer/Kconfig:14:    default y if PC
> hw/tpm/Kconfig:18:    depends on TPM && PC
> hw/tpm/Kconfig:24:    depends on TPM && PSERIES
> hw/vfio/Kconfig:16:    depends on LINUX && S390_CCW_VIRTIO
> hw/vfio/Kconfig:38:    depends on LINUX && S390_CCW_VIRTIO
> 

I don't think that's a problem, and also I'm not sure this patch is a
good idea.

See docs/devel/kconfig.rst: "Boards default to false; they are enabled
by the ``default-configs/*.mak`` for the target they apply to".

Paolo
