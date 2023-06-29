Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp344642ejy;
        Thu, 29 Jun 2023 06:41:23 -0700 (PDT)
X-Received: by 2002:a05:600c:2054:b0:3fb:4041:fef5 with SMTP id p20-20020a05600c205400b003fb4041fef5mr7467077wmg.23.1688046083439;
        Thu, 29 Jun 2023 06:41:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688046083; cv=none;
        d=google.com; s=arc-20160816;
        b=oDaS7/kDpwSpz+F2CZjV2IDJbqMqAIi1vbo1XzNpu9+xPup0GwgOxc2bIBOw6/PJ7M
         zrdfddtU0AaLxILUPtb6A0m0WoCHU0RjzGBrQg5UlS/dbAX8XZvNQPrPe8Rt2JT9AdV/
         XnSM/cHZefExN3TEVtRtqCS5JgNMRMqhz+9ACAyCrEqddI4G/oPewZt56VTFg7QqZ3hm
         SZuAHxzI2POp8YEyJck+P3f+HGTEm7ff0L7qk4GSvz8YR5G0/AxlY8AAwb1MzKR32UU+
         BO/Dey777V4Oxb1aBTHt0rHgMCksZkw6pDBroYJWUFoJa8BGk/U+IXQ9zNfSMWxq4fMj
         qU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dnZTPLoaZx8Nk2z2XqVUeu3zBMJ+VXgYU2pI3EyyALU=;
        fh=Tti5iY6tdwKQ6vxlTSmZ6v2Y0jcLETgPWS1w/ieRBfE=;
        b=u9U+C1xGVBhJOr7IGlGB3G/Ia44ELkHACJ1jAf7arE5qFlQYXIr8M/PpFt2n7UNKr1
         NShY1SjxiXtQsRByfradWKNO31GI23PL2skraRHFzvfMd82mWeR+5g/tfaMfcjdE4Vwi
         jnZe59Z43R63MQfy5dC3VfyBSH1uQR8ghx0DygXGneBywLkvmdf7HVs5Yp1eeMMWVKm+
         /ftAAoawXA5uVD1SvvFP7FGhDY7nez+mp1LNmrEXnAQnvpFEJc7sCg4Cucl89z1dLor+
         cmhz66hdtnGanp5dK3i2USJlSZ+aHn8NRNpOTr/mC6F+kwlV5fXUgOFq5llMBKIlgH+R
         4dUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lVVQRlI4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s24-20020adf9798000000b00311149366easor3248345wrb.8.2023.06.29.06.41.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 29 Jun 2023 06:41:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lVVQRlI4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688046083; x=1690638083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnZTPLoaZx8Nk2z2XqVUeu3zBMJ+VXgYU2pI3EyyALU=;
        b=lVVQRlI4e7t+vBB9rVzKojGN4kU25H1f+xQzkHR9TAFmif2DiOHOXPyqVsiWoO1grG
         erukjuPHPaOh4EWH25N2j9lcjBfjHAmTGYMaOn32lLyI4EeOkCnNddoDctNEnZfLPjEz
         NQ5uzh+na9ythm12pnYZGBIT6RnmsAxiQJDOu3VcQePwXgtCdCHOd2itFwxWVUbK3Gi/
         L0sl/Lh3H3xkE3WUUudvcaW/EyIaeO8ewP4HjEqzzhnPGktTE6DrvfDiCuDUdYH3ilt0
         WYalxOVLVkkqsmRlyuL/ZI0lxWMVq/M2k46TrUfQuuRY7L4NHU8jQJ2sI0YtkBl5IF8j
         jIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688046083; x=1690638083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnZTPLoaZx8Nk2z2XqVUeu3zBMJ+VXgYU2pI3EyyALU=;
        b=Ij6SUTSKcsMyXrnQM7NrKWc0CtWq8FMQI1e/E0A9OjvA26N1IQxMK+qj9KhkcfWUHa
         GC+7CT78FEJVB83M1ubLqq3Es1Ig5yBf9aQPLEJX7Yf5FG4oSG0h7mPbj/nDclN4DXBR
         rlLYBoaJ5rx2zIHgX9/SYjqGvOJpyoDjypUTw3WPNC3FXi4ffMl19VbSRcAXEQdIEj7f
         yvVYHNKI1i/kXx0OR/VH/nfv+fioENHcOUpcNBfKz76V/DBuGxMPGURvCYud+xKrX5FB
         ad3Dl9GjaHkM47UM1dOyD7QfHMWxdrU3ipzArFuoGsznSp7FuLVylfkV6Ad/WUls8GZW
         uztw==
X-Gm-Message-State: AC+VfDwCpfTfdOMXJtB9QC8cRu7xsWqdWzrWJmK1M5l3genyoI2wg4zc
	yJM76We+l0CDNgRuCmyRpwoy5nCCzJHPWXytD3Lcyg==
X-Google-Smtp-Source: ACHHUZ4EYiDqc/h9ZzKwyQN4znT6jHnZB6a8dhdjX5fniQjgQL0MOXirXzXHuRRJTTqWV2h41tWu3g==
X-Received: by 2002:adf:f98c:0:b0:313:f5fd:62af with SMTP id f12-20020adff98c000000b00313f5fd62afmr8204591wrr.18.1688046082791;
        Thu, 29 Jun 2023 06:41:22 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.166.242])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6782000000b00313f5babb18sm9983596wru.9.2023.06.29.06.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 06:41:22 -0700 (PDT)
Message-ID: <b08189c8-38c2-adbf-7bb3-0304f4845fc0@linaro.org>
Date: Thu, 29 Jun 2023 15:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 25/36] docs/devel: introduce some key concepts for QOM
 development
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bandan Das
 <bsd@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-26-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230627160943.2956928-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: h7iqA9cglCMk

On 27/6/23 18:09, Alex Bennée wrote:
> Using QOM correctly is increasingly important to maintaining a modern
> code base. However the current documentation skips some important
> concepts before launching into a simple example. Lets:
> 
>    - at least mention properties
>    - mention TYPE_OBJECT and TYPE_DEVICE
>    - talk about why we have realize/unrealize
>    - mention the QOM tree
>    - lightly re-arrange the order we mention things
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230619171437.357374-6-alex.bennee@linaro.org>
> 
> ---
> v3
>    - moved around as per Paolo's review
> ---
>   docs/devel/qom.rst | 58 +++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 52 insertions(+), 6 deletions(-)


> +Creating a QOM class
> +====================
> +
> +A simple minimal device implementation may look something like bellow:
>   
>   .. code-block:: c
>      :caption: Creating a minimal type
> @@ -48,6 +66,12 @@ In the above example, we create a simple type that is described by #TypeInfo.
>   #TypeInfo describes information about the type including what it inherits
>   from, the instance and class size, and constructor/destructor hooks.
>   
> +The TYPE_DEVICE class is the parent class for all modern devices
> +implemented in QEMU and adds some specific methods to handle QEMU
> +device model. This includes managing the lifetime of devices from
> +creation through to when they become visible to the guest and
> +eventually unrealized.

Good enough but we are mixing QOM vs QDev...

>   Alternatively several static types could be registered using helper macro
>   DEFINE_TYPES()


> +.. _device-life-cycle:
> +
> +Device Life-cycle
> +=================
> +
> +As class initialisation cannot fail devices have an two additional
> +methods to handle the creation of dynamic devices. The ``realize``
> +function is called with ``Error **`` pointer which should be set if
> +the device cannot complete its setup. Otherwise on successful
> +completion of the ``realize`` method the device object is added to the
> +QOM tree and made visible to the guest.
> +
> +The reverse function is ``unrealize`` and should be were clean-up
> +code lives to tidy up after the system is done with the device.

Worth mentioning hotplug devices must implement it?

> +All devices can be instantiated by C code, however only some can
> +created dynamically via the command line or monitor.
>   
> +Likewise only some can be unplugged after creation and need an
> +explicit ``unrealize`` implementation.

Ah, here we go.

> This is determined by the
> +``user_creatable`` variable in the root ``DeviceClass`` structure.
> +Devices can only be unplugged if their ``parent_bus`` has a registered
> +``HotplugHandler``.

TODO on top, mentions the reset() handlers are called after realize(),
and can be called multiple times.

>   API Reference
> --------------
> +=============
>   
>   See the :ref:`QOM API<qom-api>` and :ref:`QDEV API<qdev-api>`
>   documents for the complete API description.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
