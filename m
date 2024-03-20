Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1799335ejb;
        Wed, 20 Mar 2024 01:49:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNckzVbmNuZNiirgvBWz5Cs+xTK7n3deb8CKSlHq7kHlQ5yaz4EKunSJUm121axfLdVLrQRLiokO6GAjzTM9Lik3pBb38m
X-Received: by 2002:a2e:9092:0:b0:2d4:8db2:f79c with SMTP id l18-20020a2e9092000000b002d48db2f79cmr3149078ljg.50.1710924571592;
        Wed, 20 Mar 2024 01:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710924571; cv=none;
        d=google.com; s=arc-20160816;
        b=WpKMCHpxGzYBBS37kGFmvydrm9eX2HsUX5p4alaWBqS5Y4EOHGoZ24w2RxNflVeRDy
         mTH+Nyow9y5zALyKem/GpsdCt7EkaZxdjKZpwUCQGun4ld5EgT3ORYSE6aURJQL592fI
         QG0AW1WTZEkTCrapxkbohTtNxx1Gt2EHWw/NhFTtgGAA+i1PjVjU98Cs6QeW1I4DMZ4Z
         ay/J9vgetShN/eMltjcl86mz89QrhsKcWy/Q6CUtkvzJQ6EV7rlGTrM8txNoJn0JFPck
         XzxAWu6JZZAMT1FPW0wjLWb0cPDsZMgM4yDrW2svHQKL1INW5x5fC7XhrO0RkntwVOrS
         kZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kwuMerZlqcLAvNCnbAMlpvDC6HUJgNIZLa8N/0Eyd9A=;
        fh=IhemGSYO77ujpV7lX+Ko1c84rEr+dmWk6q67t6eVuHQ=;
        b=oha+FKrxYwxDx+94VSzYxAu9V3kDUh6WNFMSuJb9ASZyaTTXRmw6nwUSwX7cyYJ79I
         20DzNG/qlxJQGIAae6gazg+m8ZahvwIsHdTu1v49uU6zmAJD0+RKvf6HV/dqgGsvRAFi
         k9HsibgOlLl5aq6Vqo3nqTqmLFTVabCcIMmENTRO9S7RtzaKEn02DsJxMMMuuOFmUr8m
         YJydoEosR5vWGruechXi9cm5Nj4QYxViBdTriBjisWmr6s7UPhgegmNz0mPurlDlJ/IE
         tWDNL00QcLJidA2m4TWm+QaiPL1vvPj5cL+NMximwqcAcQr0+zXvAr5WaUkdszOnm1MO
         cf2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpfxWzMK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b3-20020a05600c150300b00412f02c35b4sor3798097wmg.5.2024.03.20.01.49.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Mar 2024 01:49:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpfxWzMK;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710924571; x=1711529371; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kwuMerZlqcLAvNCnbAMlpvDC6HUJgNIZLa8N/0Eyd9A=;
        b=dpfxWzMKPQnWUeew50EKNk7hY6ARWZX0zmJenNaGvGwx4w9kwlpJtqflGh6ziI5TTE
         Bxxy8pWqYyTmXgMiRsbq75mCC73tguRRY+pW+BFNsj4qWBfC8tPfebIpKSdvlYlfydgk
         jR4BkEhCNV9fj7WO0ZvghR1WgKcyaKFW88fm2Z0bicCnUlfK7RJo4DCO5R/p8d7zaig7
         pV7ZWYfUqtnRZRESZ32zNUAYnPdX9YgXpkfEJDx1o4DBND/klZnIgQ3P1v44/qFzu0Wo
         sIjD5pllk5hMPjq6OFA3kHj/HhDDLRMEhZ0priT4ftiGBKqFvBomreqpEJKRYmkodhDZ
         PlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710924571; x=1711529371;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwuMerZlqcLAvNCnbAMlpvDC6HUJgNIZLa8N/0Eyd9A=;
        b=Let/oXq0zzOjie45Jah9XOpGQN9W3C+WWLlHGqkja4I5IZgzeUeettI7IOTrvkYfYX
         VkQ6xW/MSNukeDcApww+CFhfnfhbbHkVVU6cVwQwnzsyLo0rx3CPSPs2jsOkGDrCTGeZ
         c9xEteCT8hHdZFz8pJR0pXPyuaqefm1KpukXPFM1sxmwhpqDWt5jjGL53ChgupYuptCD
         1GQyu0QnKdA4hWkPrkM2QaxVfV1Z94VpA1Z/sPiuX9vjJxy2GcpSGJjiiqfEqIwbdJjQ
         HsU82PYWSDfx2mSFpYrjtUAZSDOrft85+vftmzDvO6B4wThLWFb4B9OJ98/21X8ju4J9
         2jyA==
X-Forwarded-Encrypted: i=1; AJvYcCX59BE6c9uTy17rczId1Hrd6yq0obqEMRjx8TVFORupJP5RVFzChUi9F3NsGz4OjLiB5VFdFMojgxDsTKeWn90b8M2saTmq
X-Gm-Message-State: AOJu0YzZ6ZL2cAulmctJi9umIMv7hUbtkvh2eC5Oo62XKiAH9ZiN6m6H
	74eD6w6ZnEr1BmiNViJc+Y9/cXfMxcRFA1kUiOJ8yPl6Eo3IQxFfhwF2XgbOPeh6Bg==
X-Google-Smtp-Source: AGHT+IHSkoFSa35/gO5aSlD16MfDuLfO6YJoD+u/ttMKcTKifS2QAHoCMVymCuyWoM4o9l2KuqBODA==
X-Received: by 2002:a05:600c:3b24:b0:414:6467:34a4 with SMTP id m36-20020a05600c3b2400b00414646734a4mr3648453wms.7.1710924571111;
        Wed, 20 Mar 2024 01:49:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.156.105])
        by smtp.gmail.com with ESMTPSA id fs11-20020a05600c3f8b00b00412e5f32591sm1500432wmb.28.2024.03.20.01.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 01:49:30 -0700 (PDT)
Message-ID: <4d748527-07d2-4cd1-91c8-77042d4d02c4@linaro.org>
Date: Wed, 20 Mar 2024 09:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 10/21] qapi: Make CpuModel* definitions target
 agnostic
Content-Language: en-US
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-11-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240315130910.15750-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: FMLBX34fKz7g

On 15/3/24 14:08, Philippe Mathieu-Daudé wrote:
> CpuModelInfo, CpuModelExpansionType and CpuModelCompareResult
> are not restricted to any particular target. Define them in
> machine.json to generate them once.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   qapi/machine-target.json | 78 ---------------------------------------
>   qapi/machine.json        | 79 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 79 insertions(+), 78 deletions(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index 5f17b25d50..0412400df3 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -6,84 +6,6 @@
>   
>   { 'include': 'machine.json' }
>   
> -##
> -# @CpuModelInfo:
> -#
> -# Virtual CPU model.
> -#
> -# A CPU model consists of the name of a CPU definition, to which delta
> -# changes are applied (e.g. features added/removed). Most magic values
> -# that an architecture might require should be hidden behind the name.
> -# However, if required, architectures can expose relevant properties.
> -#
> -# @name: the name of the CPU definition the model is based on
> -#
> -# @props: a dictionary of QOM properties to be applied
> -#
> -# Since: 2.8
> -##
> -{ 'struct': 'CpuModelInfo',
> -  'data': { 'name': 'str',
> -            '*props': 'any' } }
> -
> -##
> -# @CpuModelExpansionType:
> -#
> -# An enumeration of CPU model expansion types.
> -#
> -# @static: Expand to a static CPU model, a combination of a static
> -#     base model name and property delta changes.  As the static base
> -#     model will never change, the expanded CPU model will be the
> -#     same, independent of QEMU version, machine type, machine
> -#     options, and accelerator options.  Therefore, the resulting
> -#     model can be used by tooling without having to specify a
> -#     compatibility machine - e.g. when displaying the "host" model.
> -#     The @static CPU models are migration-safe.
> -#
> -# @full: Expand all properties.  The produced model is not guaranteed
> -#     to be migration-safe, but allows tooling to get an insight and
> -#     work with model details.
> -#
> -# Note: When a non-migration-safe CPU model is expanded in static
> -#     mode, some features enabled by the CPU model may be omitted,
> -#     because they can't be implemented by a static CPU model
> -#     definition (e.g. cache info passthrough and PMU passthrough in
> -#     x86). If you need an accurate representation of the features
> -#     enabled by a non-migration-safe CPU model, use @full.  If you
> -#     need a static representation that will keep ABI compatibility
> -#     even when changing QEMU version or machine-type, use @static
> -#     (but keep in mind that some features may be omitted).
> -#
> -# Since: 2.8
> -##
> -{ 'enum': 'CpuModelExpansionType',
> -  'data': [ 'static', 'full' ] }
> -
> -##
> -# @CpuModelCompareResult:
> -#
> -# An enumeration of CPU model comparison results.  The result is
> -# usually calculated using e.g. CPU features or CPU generations.
> -#
> -# @incompatible: If model A is incompatible to model B, model A is not
> -#     guaranteed to run where model B runs and the other way around.
> -#
> -# @identical: If model A is identical to model B, model A is
> -#     guaranteed to run where model B runs and the other way around.
> -#
> -# @superset: If model A is a superset of model B, model B is
> -#     guaranteed to run where model A runs.  There are no guarantees
> -#     about the other way.
> -#
> -# @subset: If model A is a subset of model B, model A is guaranteed to
> -#     run where model B runs.  There are no guarantees about the other
> -#     way.
> -#
> -# Since: 2.8
> -##
> -{ 'enum': 'CpuModelCompareResult',
> -  'data': [ 'incompatible', 'identical', 'superset', 'subset' ] }

Otherwise I'm getting when linking:

   duplicate symbol '_CpuModelCompareResult_lookup'
   duplicate symbol '_CpuModelExpansionType_lookup'
