Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp926400ejb;
        Thu, 6 Apr 2023 00:50:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z8m08JDyC1Z+SrvBxbP8RdhjvrE4b4iDe8RuqeI9iQCm0U75ghca5BDk4OgWhjm23oqoFl
X-Received: by 2002:a05:6214:19e8:b0:56b:f28e:628a with SMTP id q8-20020a05621419e800b0056bf28e628amr3477137qvc.6.1680767443433;
        Thu, 06 Apr 2023 00:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680767443; cv=none;
        d=google.com; s=arc-20160816;
        b=lL0+AD5l/MIgvrT6YZDKZJRM7QLAd+VoePSoSNV83WNnU6ViHev3weu7nfG/JHn4kI
         eZ1XtVk0xATfo+mD2qrHVA7V0v9wvNZFi/T+pk3QX8mJooFInmJ6RyNK+0RnP7ndQcwY
         OhckRgzz1YFnBNLmnsDZQpBM90sz51mK14Foi5l5kI0lCbGNCSR2iRivP1yfTGHid23z
         QWxxSeKRRPfquYn7KTIsyy2Ebinbr85V6H9NgiCJV6EwCgidxyZh2CXP/TevazmEeFXc
         8LpWiPE6aigam7jymPVtWqppBH7e3CRxlX7LXSZL1j3Si2g3lDSXluCAkrVD3gzbALzj
         fByg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Zfpt1hWlJeW+De1zXUq58qE//gZcupovgtklglmgOFw=;
        b=oKS/c5/QSyhfhBM4BWRrFG9KIUlxaB1t4XKbjlNM4+T6S6Jt/mUB4mfHruiPD7Y1Dv
         A1EaNxkvtFvyKc34X+L5y/yZdJ6aJJoT7O48LIBOmvO7XQitQN+jqbI03+QHU5F2eWYb
         Dnxs+Siw6rE5yxB5WcppcZWx1/cYOlyWX8Jeh8PUGItlxCOv7A9b08CBzHbPhVpKMmMX
         l9E/grTAUDbBnEHslkrBqbB0NMqRhXYS/FFNQB2USIq8vxxWcgrS5+ftYdGpugkYTb5F
         alvJxcBKdE4KI2E9MvVsdo5WexC2svmSJmp3LhU/hd5UwtdKsjFjesNSkzOpot6Utarb
         WCSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CdXSE1zl;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id gf2-20020a056214250200b005e66a8c31c3si311552qvb.94.2023.04.06.00.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 00:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CdXSE1zl;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680767443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zfpt1hWlJeW+De1zXUq58qE//gZcupovgtklglmgOFw=;
	b=CdXSE1zlSnfXN4yIK3R51Ko5+6TVHy7MPmZ0n1rOtqgtpI7fuSvd26qbCSBnX2+GSlgQGy
	u+GF5W+niaczqLX1HnAM97kpQ3Zhg+qXdI/f3C0/owUDX6pyB5sB9xd55tFwFO0mVgv7m3
	Bb+GmJIlELW7gIjUyH30Qnf1Uo9vfXQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491--4C1HsL6NqmF4USZQ9eifQ-1; Thu, 06 Apr 2023 03:50:41 -0400
X-MC-Unique: -4C1HsL6NqmF4USZQ9eifQ-1
Received: by mail-qv1-f72.google.com with SMTP id r4-20020ad44044000000b005ad0ce58902so17466905qvp.5
        for <alex.bennee@linaro.org>; Thu, 06 Apr 2023 00:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680767441;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfpt1hWlJeW+De1zXUq58qE//gZcupovgtklglmgOFw=;
        b=RT8Jk3I6nd90agtDtNhaTjCiJkiCQBhGyxIyyuIrBdPMUQjWEY/vEKDJ7RXTwFjAc2
         rJsc3A7pBPGQfhr51yZRxnE6DfUWBSHrPR6MVcXTfNMZxNWg1uyOg8n/viYVafJ773Zu
         edCM+YbM7fZa9tGPIm9PhTw/oo0+Ldsi2lR4AE77T46sxccPNX4GFFsKKYKVIvEdafIq
         2kK6Wf0MfjvGHYVxCbNDYVHnv1AzqtaBGl5durcGVzAVxjbCa1QTjcAE1f7aGDyy5f7j
         W+K0vhCP7SfEbUy2kH7r9h1meBEF+x+U2Sen1JOPNqzMGH4EGo/ZCNB1F9kykwV7vC4g
         Pb4g==
X-Gm-Message-State: AAQBX9dsIlaODrWi36E6HaGArCt8VuBkgXbZvud+rD+R9mxcyqbuGeS8
	at6UaW2vjGmbII8wkTkX9s5EDC26tlIfhawoEh0cakALzprfRjIiNTvehvTDYK23DDplhnFLZns
	Pfo9cVzn9XGdOBrT2
X-Received: by 2002:a05:6214:19c3:b0:5a5:b269:bfd7 with SMTP id j3-20020a05621419c300b005a5b269bfd7mr3536299qvc.8.1680767441140;
        Thu, 06 Apr 2023 00:50:41 -0700 (PDT)
X-Received: by 2002:a05:6214:19c3:b0:5a5:b269:bfd7 with SMTP id j3-20020a05621419c300b005a5b269bfd7mr3536276qvc.8.1680767440725;
        Thu, 06 Apr 2023 00:50:40 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-178-193.web.vodafone.de. [109.43.178.193])
        by smtp.gmail.com with ESMTPSA id 65-20020a370c44000000b00746777fd176sm297041qkm.26.2023.04.06.00.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:50:40 -0700 (PDT)
Message-ID: <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
Date: Thu, 6 Apr 2023 09:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-11-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230405160454.97436-11-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Byz9Wbr3ONTu

On 05/04/2023 18.04, Philippe Mathieu-Daudé wrote:
> Protected Virtualization is specific to KVM.
> Rename the file as 'pv-kvm.c' to make this clearer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/{pv.c => pv-kvm.c} | 0
>   hw/s390x/meson.build        | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename hw/s390x/{pv.c => pv-kvm.c} (100%)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv-kvm.c
> similarity index 100%
> rename from hw/s390x/pv.c
> rename to hw/s390x/pv-kvm.c
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index f291016fee..2f43b6c473 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -22,7 +22,7 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>     'tod-kvm.c',
>     's390-skeys-kvm.c',
>     's390-stattrib-kvm.c',
> -  'pv.c',
> +  'pv-kvm.c',
>     's390-pci-kvm.c',
>   ))
>   s390x_ss.add(when: 'CONFIG_TCG', if_true: files(

Hmmm, maybe we should rather move it to target/s390x/kvm/ instead?

Janosch, what's your opinion?

  Thomas
