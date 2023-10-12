Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp551686ejc;
        Wed, 11 Oct 2023 21:43:41 -0700 (PDT)
X-Received: by 2002:a17:907:2724:b0:9b2:8c37:82a with SMTP id d4-20020a170907272400b009b28c37082amr19123439ejl.35.1697085821656;
        Wed, 11 Oct 2023 21:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697085821; cv=none;
        d=google.com; s=arc-20160816;
        b=Vq8LLq5JykgwvTOK/Nn3a4iQxSn6T7Do83yLStAafiCXbyEAAIBAhiCTZRjc6blSMF
         Isql8LATFOw3Phff28+U55xUUM8V8SLoD+w/qGgNjoe3e3NLX24lR43Ec8cpu8yFR3gB
         3NHM8l3+g6f0CV+wWb+/gujACFBgWe84gVD+93bQRusdcdW8R0CfeRUYq0oetBrUjFSq
         IaRqXzpaCDpPh/CLTivU0UnTrBps5I00gItU4uoXRqunF0OUg2SohW8kTymcqBDvFaCX
         z+AySLKeTr0ngDYzkCHroIrhtGGTmpEjp2BtNuvlUXB08P1M97TFW66VMxGLh4cHhipb
         0qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NsQdNAt772Lk3sYaY/eE2FLNruWxHL/eoU/amETLWU4=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=cZwunrR5DJPX9RBBw36PyD+ceE3i05fSoM0xkMUqs58Qnn36e8QSuafMh65eow8Lee
         OxAYXCQAL9kWwAMI5zq4nQxyhbnQNzlIrbmbj7St6J2qtZpza8d4HREM//BkCgDNQo4C
         p9wWRa/DIaaBFVnoNA1Cp+hfDB59nfDb+dFN6RpPZT6XoUhHMyPek8TR84clah5AKkgx
         qNRH0J6ik2LAIqZKgXiFRilCjW7+goDuqYxSdxrgMI4+Owx+1pOEWkrnsodhJnD32i2N
         /rR4V+v/WhT0Ur+9y7Flucs81h8C/lS+DPYxPmrWp6J0sxge8g5DSPHwv5mfXzYNxg8/
         NaxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CeWzz2RJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ci17-20020a170907267100b009ae614ebfd2sor5572563ejc.1.2023.10.11.21.43.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 21:43:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CeWzz2RJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697085821; x=1697690621; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsQdNAt772Lk3sYaY/eE2FLNruWxHL/eoU/amETLWU4=;
        b=CeWzz2RJ2ubsXAk+Ti2DHNiH8rje241l+AxHCphID5RdYe2wotyy+/xHmcFnLbOmNF
         c1CxYf2FutHLxiAkbGAjqST4jZZm5sApHQzvXWTJqvEQiroAKUOBb7+3gcqpjcoMNj/A
         VT2CNGfKXHfGs0wDbia41ZtqPEhUBtIxTXoygdebILQazyYzLU7vjuGgYH4Ew2/Il4pe
         yEiRJHJyX8n0OSNwrVSqVKc9ey12dChaB8f/iSbD3oSowDgXUNio9ES1PYlV/576bgeQ
         mpsYNuczFcOs3nRvOhn4SdsXHn7cH3F9zlmzApbp/zCSri3iwW2o1vJD3itqJYbVwioe
         79Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697085821; x=1697690621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NsQdNAt772Lk3sYaY/eE2FLNruWxHL/eoU/amETLWU4=;
        b=ruHInWi/7yd6MT/u5It1RpVIEpIVhEjkj85jJPf8QNT7zShgWLssRFryKF3ZT6cCxn
         BIoxNMHZQeoBcJHAXtybI/ygUNqfXSHa60qXYl9cd85DH5fiqCE9Q91YfiO/sX4ynxAG
         x8ox1+3iZym9pCaAmPcjwVQbg847iTth72xQR8A3+zNTTsv3s5vn6zvwT7jwaZc3Oodx
         9Frrlc/QMQxgKvIzrFKRfpK7SN93A0RIIQUXM3Fg1bITrPwyzVIFy7exqtQ/PndrBhbK
         7f6fYnk+Gwam0mMy2vAy4Ql7U+OgFAXfuLDQ6UtEZehcEvyR9Cb4DQN9iNyn0mq9sDYj
         D9Gg==
X-Gm-Message-State: AOJu0YynWRIdwMX7jKqSWmN3JumIaZffNvKFf3BOdpcfWhcIIy8FF7wt
	QtZSlUMa/jKN9BPpWAz4ua4SiWxM
X-Google-Smtp-Source: AGHT+IGIlo5zl7YzfkbZUbUX0S0sbo88NwmvU+qedr6hKf7evlCiDKmmKb8Mi9eP7OZWl4Pecf8n5Q==
X-Received: by 2002:a17:907:1dd2:b0:9ae:406c:3425 with SMTP id og18-20020a1709071dd200b009ae406c3425mr21222384ejc.0.1697085821305;
        Wed, 11 Oct 2023 21:43:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr. [176.173.173.31])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170906ae4800b00992e14af9c3sm10706076ejb.143.2023.10.11.21.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 21:43:40 -0700 (PDT)
Message-ID: <d2287b37-cd40-10ec-e20f-135a9d27e3fe@linaro.org>
Date: Thu, 12 Oct 2023 06:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFC/PATCH v0 10/12] gunyah: CPU execution loop
Content-Language: en-US
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-11-quic_svaddagi@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231011165234.1323725-11-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1ixq0PZfbduf

On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
> Complete the cpu execution loop. At this time, we recognize exits
> associated with only MMIO access. Future patches will add support for
> recognizing other exit reasons, such as PSCI calls made by guest.
> 
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   accel/gunyah/gunyah-accel-ops.c |   1 +
>   accel/gunyah/gunyah-all.c       | 216 ++++++++++++++++++++++++++++++--
>   include/hw/core/cpu.h           |   6 +
>   include/sysemu/gunyah.h         |   1 +
>   include/sysemu/gunyah_int.h     |   3 +
>   target/arm/gunyah.c             |  13 ++
>   6 files changed, 229 insertions(+), 11 deletions(-)


> @@ -110,17 +125,6 @@ int gunyah_create_vm(void)
>       return 0;
>   }
>   
> -void *gunyah_cpu_thread_fn(void *arg)
> -{
> -    CPUState *cpu = arg;
> -
> -    do {
> -        /* Do nothing */
> -    } while (!cpu->unplug || cpu_can_run(cpu));
> -
> -    return NULL;
> -}

This diff could be nicer if you define gunyah_cpu_thread_fn()
in the final place in previous patches, so you don't need to
move it here.

>   #define gunyah_slots_lock(s)    qemu_mutex_lock(&s->slots_lock)
>   #define gunyah_slots_unlock(s)  qemu_mutex_unlock(&s->slots_lock)

[...]

> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index fdcbe87352..b3901e134d 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -240,6 +240,7 @@ typedef struct SavedIOTLB {
>   
>   struct KVMState;
>   struct kvm_run;
> +struct gh_vcpu_run;
>   
>   /* work queue */
>   
> @@ -443,6 +444,11 @@ struct CPUState {
>   
>       /* track IOMMUs whose translations we've cached in the TCG TLB */
>       GArray *iommu_notifiers;
> +
> +    struct {
> +        int fd;
> +        struct gh_vcpu_run *run;
> +    } gunyah;

NACK. Please declare as struct AccelCPUState in gunyah_int.h.

>   };
