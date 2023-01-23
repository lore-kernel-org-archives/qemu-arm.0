Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2766712ejc;
        Mon, 23 Jan 2023 00:10:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuWzzhTcHnCkEZELk0EGpyoLKmH2Mz340WxZJdgmBPpJm68nGzPuuN5e/L5moeMmacoDN2V
X-Received: by 2002:a05:6214:2b98:b0:535:5d43:fa16 with SMTP id kr24-20020a0562142b9800b005355d43fa16mr17281883qvb.42.1674461437301;
        Mon, 23 Jan 2023 00:10:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674461437; cv=none;
        d=google.com; s=arc-20160816;
        b=gxbdY2FC0FNvzS7hF4rmuB2xNBFPkK67fyt3NK9LjbXSOETOwJWSXxOwHMpxaglIzw
         3+sMMIR+eeVXQ5sYTSTDodrs1cmOuhqgMKUzYdKxPm8QZ3QTl3AZkFI+5OP9xS5XpH0e
         MtoP/Dy5uDNdLMiVmQZUtBihunqjbmSFVGv9MsHaL19dJbTK2FjATaviC684JK/xpuMu
         UAFFHmJplfT/vmvXn9/1A/eQxHCXoQxIr9u/jp8DA+EZPZf158r6tWYLAfrA7D2ThjdW
         uI9rfBgyhtsdpND2TfRmWHVGFLZzbYjdi2J/X5FfOXCW3zPg2+9yxfNn4zmo/5cO4gUg
         Na6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FAU0RYKSqDv3e45CVMn7RCXctAKXTPpPnmNhUZwYElI=;
        b=Vx89iwdeRLKSvkxQyOIcNjcqhMpYN2bd1X5OY1owPVmlINZOm+xYYkqFihQ3HTooEA
         SZPdkYK/gOjaBcMPY59/oRmkXvCSC68zCSihqNhySC4yme1wUVc5M9IpCCWkE3Czt7JA
         rWZTSfN7Kcp/g+z/vs+OFXe90ZE6erFNmkRnKI1mIRFlxtPGpxCfYmgqiBLsNVx1yu4V
         grK7jiNB4zD1benDIolyCtlHZHDEGJij2Np1TH03BArwEzC3w5dzITo1RGoGUc0g+V9o
         0D1dYGdT7rV6g1djjAHweUOnxNdlOwToIAaT1rl/8XpwTZcvid70hX+NLCi2KLmWu9zZ
         dCOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cqdfl7an;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id q1-20020a37f701000000b006fa4e67cd78si28093458qkj.460.2023.01.23.00.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:10:37 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cqdfl7an;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674461436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAU0RYKSqDv3e45CVMn7RCXctAKXTPpPnmNhUZwYElI=;
	b=Cqdfl7an+bM4H9dwWVzbDdzcNd0e2Tge6P2OF4gB+5BANrxB+a0NkEu7Nwx/LgyC4uYCSM
	/H3WdVi6MYqzMp10Nbjs/jIUV27eJ1imfrlGh92ZH849FmShrpDgsLWs4jHrRM5ZrtjcWO
	emhVU/6SmFsiM54A2L0rA7raZoNBaPg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-t94_hgu0OzGzZEN75c3ZVQ-1; Mon, 23 Jan 2023 03:10:33 -0500
X-MC-Unique: t94_hgu0OzGzZEN75c3ZVQ-1
Received: by mail-qv1-f70.google.com with SMTP id ff3-20020a0562140bc300b00534ec186e17so5652161qvb.14
        for <alex.bennee@linaro.org>; Mon, 23 Jan 2023 00:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAU0RYKSqDv3e45CVMn7RCXctAKXTPpPnmNhUZwYElI=;
        b=gaYGSu/Dtb9pxtc8vHa/5lnNXrfNg5lkaZxnLSQUxSk+rO8spmAm9rwOC4fIw+fdAO
         ukCdSXARPKi6AnxbmB5/HIZjVn5nk6zKwHcPXoH6f9wRgtHJxmODC6JnWprqv6OKnKRk
         U8yJjRDHycracgJo04KzN60ZqCWmuswbXO4taqfTRy4tRb8PvKYDgcZG9gO2j/ZZbuMr
         t/KUyqlXtMJZaU3TMWl5sD9wFE1T4FoXZ4m2Sjs0/X7wK9v82d+kNZp8V+BOuAMz+Jjv
         arDM8VJFGIx3aIfQFlr2Gu25giVhR32KEcVo5fhDCyVuSoiITiMOEAcKyvAuHcTscg7+
         F9JQ==
X-Gm-Message-State: AFqh2kobCCgOhmNsmz9sywsc8WD5xQGlKe/HrYN14+cHIR3PRjmKzNqm
	sLU5+Z1llt+YKEyFA6fVSaRhm+DIIgLB95i4Pj/oMcXU1m/Fcr01EXPxz9C8y6eir5ZyyT9F48U
	Tz4YFkZDFRXTQYsj+
X-Received: by 2002:a05:6214:11a6:b0:535:666b:b83f with SMTP id u6-20020a05621411a600b00535666bb83fmr17745195qvv.20.1674461433155;
        Mon, 23 Jan 2023 00:10:33 -0800 (PST)
X-Received: by 2002:a05:6214:11a6:b0:535:666b:b83f with SMTP id u6-20020a05621411a600b00535666bb83fmr17745178qvv.20.1674461432911;
        Mon, 23 Jan 2023 00:10:32 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-178-90.web.vodafone.de. [109.43.178.90])
        by smtp.gmail.com with ESMTPSA id m8-20020a05620a290800b006fb8239db65sm31602475qkp.43.2023.01.23.00.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:10:32 -0800 (PST)
Message-ID: <e356ac89-e19f-11a9-141a-0fbfa8dca4f4@redhat.com>
Date: Mon, 23 Jan 2023 09:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v5 3/9] target/arm: Use "max" as default cpu for the
 virt machine with KVM
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230120184825.31626-4-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EbrfaYVBiisS

On 20/01/2023 19.48, Fabiano Rosas wrote:
> Now that the cortex-a15 is under CONFIG_TCG, use as default CPU for a
> KVM-only build the 'max' cpu.
> 
> Note that we cannot use 'host' here because the qtests can run without
> any other accelerator (than qtest) and 'host' depends on KVM being
> enabled.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   hw/arm/virt.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b5c711c919..8091c74e3d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3005,7 +3005,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       mc->minimum_page_bits = 12;
>       mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
>       mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
> +#ifdef CONFIG_TCG
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +#else
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
> +#endif
>       mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>       mc->kvm_type = virt_kvm_type;
>       assert(!mc->get_hotplug_handler);

Thanks for the update, this sounds like the best option to me.

Reviewed-by: Thomas Huth <thuth@redhat.com>
