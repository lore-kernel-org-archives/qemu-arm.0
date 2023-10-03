Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1719860ejb;
        Mon, 2 Oct 2023 20:54:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7ZpwbqxcGRvSacVhZ4KMHQguKmDY5f4L52ZDKgMrAyyqwjj9geHoV6/4o7jJwfGY9szjM
X-Received: by 2002:a05:620a:400a:b0:775:9bc3:beb7 with SMTP id h10-20020a05620a400a00b007759bc3beb7mr9521490qko.0.1696305283004;
        Mon, 02 Oct 2023 20:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696305282; cv=none;
        d=google.com; s=arc-20160816;
        b=Kv23LvLHonkqJamslgMc9vk8Gk+M8rW1te2Yy5JFAic773sqxTBqza6Zlo5esLXOpO
         SnbW3GtvoN+Fh7dO44b6BrsJRGxxICBVY1m0NlwmkF9O2k/GuQLawAKqvus+K8GfK92F
         2aB5q8eFLw6TlijV7izNkFk/a37KPPIf9KV0ZekojpAoSySZTkviFr5W9urkSrCwn5QI
         uwFpaGLdLF/AwkzpaNPDmRMR4COOIe38q7tFCisk+EA5zpNxl1ai32c2n2WvC+tcugZi
         cR24Ti0WRHsupFnQkP0alG67PT3GaKU2Dk8GliAhzPN5M5EpKso8m3vCzss9VrPOVRnk
         fJiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hrYrDxi+S+gVlha9sRw3YPioUlNo4RlyvOryR9oApwo=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=eXy6vrqo6C5PExLPM8a4vdnWdzIovF62tI3lw9O1f7FsFurAcTaI3dfmIP09Gz/i1V
         16iByK3En29NBKz26FvFXD2+DVeUbM2xgWXNOyhHJgj2ijKlypPUsffyDZrVfXFOiQzM
         oHjqDSGicEbft+evNnvNmLx4Stf8W7E7TEXHnpr9Qa2GQkw7B0Px2uJ7j19xAlj7ecaJ
         9Jc8BOX278cOW4Q07oR1VDBhhbGNamFp5fZ3uoNVCvfAVOA7Yez/Qv7ojy5XX3iXhM9W
         qGhbHxHD61Wh4zSF2fmunRjjCTGHRSeL+ZxnXlzky0w38+CNfMn7rvHqowYCrzlo5HLR
         dIdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EYUrntJ/";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q5-20020a05620a0d8500b00774373352b5si143381qkl.769.2023.10.02.20.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EYUrntJ/";
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696305282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrYrDxi+S+gVlha9sRw3YPioUlNo4RlyvOryR9oApwo=;
	b=EYUrntJ/oOlcLXVvcx0kKtf3WFyn3uV9l6SGiq9VkPse1S+PCgIZxFnGWut62pavMOfLEU
	JL99tGVx9KbiQT8Dk0rG/MFudHE6Y+WcJA7YmR/eitA6A4h+EmRL1yjxGwogQoZtADBqLI
	mVB5ZCjAIfYJFBPUx+PkDfsHpsid8ew=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-qxnBmLAdPR-z_jrn-FggyQ-1; Mon, 02 Oct 2023 23:54:31 -0400
X-MC-Unique: qxnBmLAdPR-z_jrn-FggyQ-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-27763c2c27dso371876a91.2
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 20:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696305270; x=1696910070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrYrDxi+S+gVlha9sRw3YPioUlNo4RlyvOryR9oApwo=;
        b=Ssq66n1etNXiwZm12kMLEBOLr1qqya2S9iyLdxSsIP1Z56pttmoys730M1JHM1+XoG
         eT4zGK3CzCsv9YVZOrpdkVBeNU7kWdZrIi1U0S702vVCM3FUmnCwEXurFGGRkLMVBvFZ
         mhaz2MmsXO0GFzM+Vmd8ebm1h6gJSdODEKKPGdX9+xPpsgPo7b1V6pGQBYr9JZjKu8Go
         bqgcjoFgd7SDRVg6YxO+YE6kd4IFDuiOzUMkuWgmuH+ps89/Az72HJE43gzFB9JHzOtl
         Jq0l0yB+brov1u6w3JuWqFFmCfUnmFUZRQdVeJmf4fi9YsUedhXrfbRrR3a57t68sXXW
         K93g==
X-Gm-Message-State: AOJu0Yx5VD30iLmctAwPq/D97oW4QH5C9afBBGDnznMhjAbdlgPdY6sU
	iCOguPwxZTR5cHpklXJf66BmILWMaGADLQdWjHi26/IDivbmS0rXySM0KO74A9TX4MJH2BRS/PD
	3Z4ej4W/DQKODLUpKrxTwNHx2
X-Received: by 2002:a17:90a:bf93:b0:26d:2b1d:1982 with SMTP id d19-20020a17090abf9300b0026d2b1d1982mr10022936pjs.24.1696305270111;
        Mon, 02 Oct 2023 20:54:30 -0700 (PDT)
X-Received: by 2002:a17:90a:bf93:b0:26d:2b1d:1982 with SMTP id d19-20020a17090abf9300b0026d2b1d1982mr10022925pjs.24.1696305269814;
        Mon, 02 Oct 2023 20:54:29 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090acc1500b0026b6d0a68c5sm248072pju.18.2023.10.02.20.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 20:54:29 -0700 (PDT)
Message-ID: <17e7d901-be4f-bb62-0c05-9e2c432335e5@redhat.com>
Date: Tue, 3 Oct 2023 13:54:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 10/10] target/arm/kvm: Write CPU state back to KVM on
 reset
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-11-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-11-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1AX2nFiDMUmA


On 9/30/23 10:19, Salil Mehta wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> When a KVM vCPU is reset following a PSCI CPU_ON call, its power state
> is not synchronized with KVM at the moment. Because the vCPU is not
> marked dirty, we miss the call to kvm_arch_put_registers() that writes
> to KVM's MP_STATE. Force mp_state synchronization.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/kvm.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>
