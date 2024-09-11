Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp42425nji;
        Tue, 10 Sep 2024 22:42:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaVFPTn+GA4qVVDw/zQwFDClgoN25mcvsgE/cf/mQlgi45pGx2ABk/u+L0tXZIAgll2GzRSf1KAW4UNg==@linaro.org
X-Google-Smtp-Source: AGHT+IGx0wNEFmfznrcNMIPxPao8SjpsLEFsKM/APUSB4FOW5D1bdHKvFF5Ozk3qpaCDgQYBTXaW
X-Received: by 2002:a05:620a:191b:b0:7a7:f8ae:a511 with SMTP id af79cd13be357-7a9bf960228mr1018685385a.4.1726033352262;
        Tue, 10 Sep 2024 22:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726033352; cv=none;
        d=google.com; s=arc-20240605;
        b=PE7AK/rr/g69sTYLOOJ226nRt6rexVYgeYGW3LwLvZnrBmg5Ba4jDA9zKPuIqGlkx1
         HF5LkWdIxjqQaT241m7+PS+J/IATZdzp5UQfx594Ed/4Psmy+oDx5zADrSRMgkzOTHuC
         Bq9qvXPvVZtKiP3/2MY56sesNzZ1V8J1KCs+lMr/vbr9jQDWwHQ25xioM2T8agVW4Ymy
         HEe+BpUT7bAjEIhpA3Bg92hicmmD953jI3c2NHyiJ8gEah1mJ2VdML8lVrvFBmMLUZ7c
         htYcJWGD5ddvIwP7zWeeJUs7HIzKSKHA75Ca8puxqBRQGnkWxl64thb14iw7HV3Gc5wA
         80dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=x4348nCbIlGLxEQjv+PoBelfS3/wjA0ch8jReP02Bw0=;
        fh=N8MFtdv8Qg3aTAHatxX9lRYKcKkab507jzehxZtg1QE=;
        b=HqM95L6KxofAU19lY6OevYdEVV9y54FvtnSH8ufFD+q6WfzKtnr9OOd6dUOTvzzybn
         LZOe9PLDXReBK21XHOBQu0LfBRQ8U8mnGyxT/yLjtwtF/HeijtZZoGshvcT+I+HHPkj0
         oWONe/YTmw2oA4VgsoRrsfIeU5sRGvVr1/i2YODy5WByvqGypnUNXc3Pbg93A5SH1G+m
         ylKakCdukSuFkBmyoD1tMRDBW1DDEeKqESPJg8jANsijmA5srkoZf3MsmK7931qMTaNV
         78+J5KZL3lpRr5elP3fLv++fmZ0iVU0oUJbGY+PIQPv4dyBBLX57auNBaqpBgpkhSxly
         U0aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lu7f0Rw+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a79f1048si17309985a.191.2024.09.10.22.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 22:42:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lu7f0Rw+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726033351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x4348nCbIlGLxEQjv+PoBelfS3/wjA0ch8jReP02Bw0=;
	b=Lu7f0Rw+aiFDqrt66I6y8PjJwsyF6Co+UkXxAbwZ4zE1MVO4X4jJQ4ZB9wxmXd816Tzp5v
	7nXzqTDJd6ia5WhT/fafRBQ4B9+HGIVoMGh1vm0VYEEDltbaS4ylv7O0OZboZzIsKujTeV
	gD3W+DYNLhk6YyEPib6wRJSEbN2edAw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-oASAykWtNMSx1X2Tgc7vMA-1; Wed, 11 Sep 2024 01:42:29 -0400
X-MC-Unique: oASAykWtNMSx1X2Tgc7vMA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a8ff95023b6so74823366b.3
        for <alex.bennee@linaro.org>; Tue, 10 Sep 2024 22:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726033348; x=1726638148;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4348nCbIlGLxEQjv+PoBelfS3/wjA0ch8jReP02Bw0=;
        b=Ah/X+pUn3egba/3jfbA1fuTqsEeI5FEhcqG7uezRIM1K7jYLcaSyvj9OvxhERm/XVK
         qjNQMLNibpiJYHNJv+/hbzStTf1bNwL4IAR7N3Q3Ln1VIDsS1AXrKJyJJ8OuEddpgRpB
         kbHz1vq8sKTlLcUi4sb/uNwKg9dxhUqdhTyl7JOD/O1qTSmUtq1UxGtY85qn15T6Ssv/
         z5hQg1fL9kJXyZCI405XAAuIsf8Nc3ZlS0i+unshvJT3r2jHv/tt1BlzDsrtkiISfjUo
         0ighRbj/kJ4+KU8hg3NNFiNeavCY6vOeRu2m6iE13VCp6uZaAIrEk4qNYqecx3kw3XAd
         zFuw==
X-Forwarded-Encrypted: i=1; AJvYcCXYKEU80aJ08iLOFSaRK6RMlOBt5qBu7wKZ3lf5skXS8vxkuE0ZbFQX5RZxexOuuSivyFmZ1A0G+GhFIQ==@linaro.org
X-Gm-Message-State: AOJu0YyInUNeKooVpEyUY4j3ixRALbQrM/JI8YO6CbkpYhSAiAvpOYJO
	49YTryaOGyj1D/eJfS0ft9c2zW9KHE0UTcb5EJcoyhjLqud4Hs2dTROTH70DqWMpQHQFvvIgnKE
	kixi/is/WuQ2wZabuoKcNH2JpDODaZ++xJv3axUtW2/pQNAT9cyTWtA==
X-Received: by 2002:a17:907:3e86:b0:a8d:64af:dc2a with SMTP id a640c23a62f3a-a900481b979mr174455866b.25.1726033348385;
        Tue, 10 Sep 2024 22:42:28 -0700 (PDT)
X-Received: by 2002:a17:907:3e86:b0:a8d:64af:dc2a with SMTP id a640c23a62f3a-a900481b979mr174453066b.25.1726033347826;
        Tue, 10 Sep 2024 22:42:27 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-122.web.vodafone.de. [109.43.178.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c624efsm569273666b.114.2024.09.10.22.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 22:42:27 -0700 (PDT)
Message-ID: <1a675a19-27ed-44a8-a19c-4ae3a6452e49@redhat.com>
Date: Wed, 11 Sep 2024 07:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/39] include/hw/s390x: replace assert(false) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Keith Busch <kbusch@kernel.org>, WANG Xuerui <git@xen0n.name>,
 Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov
 <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, qemu-s390x@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Laurent Vivier <lvivier@redhat.com>, Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
 <20240910221606.1817478-15-pierrick.bouvier@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240910221606.1817478-15-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: jijj0rKrve85

On 11/09/2024 00.15, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   include/hw/s390x/cpu-topology.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
> index c064f427e94..dcb25956a64 100644
> --- a/include/hw/s390x/cpu-topology.h
> +++ b/include/hw/s390x/cpu-topology.h
> @@ -57,7 +57,7 @@ static inline void s390_topology_setup_cpu(MachineState *ms,
>   static inline void s390_topology_reset(void)
>   {
>       /* Unreachable, CPU topology not implemented for TCG */
> -    assert(false);
> +    g_assert_not_reached();
>   }
>   #endif
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>
