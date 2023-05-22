Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1035945ejb;
        Mon, 22 May 2023 00:31:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pYxYSnikWEPrrVgl1nPpdROMYOoOXMchXl1fs0up9nK2MCLeZrB3zY1H/wgY2V9MezUt4
X-Received: by 2002:a05:622a:148f:b0:3f6:9184:9968 with SMTP id t15-20020a05622a148f00b003f691849968mr17141661qtx.16.1684740691622;
        Mon, 22 May 2023 00:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684740691; cv=none;
        d=google.com; s=arc-20160816;
        b=O83tKXKYoTXrDTqXVokCjOyg9Z3RCumyxAmT2/BFuEyF4Isl+FN6OlbyF8US1BDXQw
         LobjY4SOdVEAb98u2LCckQTxKsoc/5yrsE42co4IPvV7jee0KQ28mImv4TxUzgOYsBof
         aH4SQxETnPj0WLTQ7CjAgNLVq+SgifezJhMUITrLFNXuenQkep4k5y9nk0oXq7/cc3Jv
         PGC+E152ASvBOhL/z80d+ROiIa0KjHWZIUF4MAo3mnigk7Xr0AQgxEFjXE+FDP4vFHic
         S9MxQn19Nu4Cn2g24PVuMhHeyluE3pa7KjkiDonnx9Ed9ubNVW+3+lKNvoXQ0ue/yr1K
         1wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=W8kuLNohnKOx3ExNVEfyvrydeQ45tZ4mo/9wrXAhEKM=;
        b=lTIbluM3+S/LNO2UiURY5wvLRpd5pbeEuHGptDFZEWgQ2dAkr5Bodh+85eLpxqYset
         0NMznGf1NHKqwUKowZX9wPjfcDoT/SmK/AEmMVfTnD6Z1FR6P5Z70W2zfx6JJXrL+3Z5
         yFXfGkAPuykwwTuAl1Nv7cdXO5/Mi2PC2n8VnHybTCQZ9vJ62TxkomQUs0gLhuWQLVnO
         mF5WX6eUpZbYDshvS3L8FJqdsm23YpSCASuQlTkfD3AcReyxtZPDLpfG9OdXE6VosCbk
         wtb1BD/Ke8rQu047iRnRmw8vbZ/95kWrb2c4ARmKNya653TsHjDhsWrO9eK4IH9x3Zy7
         Lf+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dDwWdNAh;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id n9-20020a05622a11c900b003f6a607faeasi2589253qtk.194.2023.05.22.00.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:31:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dDwWdNAh;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684740691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8kuLNohnKOx3ExNVEfyvrydeQ45tZ4mo/9wrXAhEKM=;
	b=dDwWdNAh1agdHspjhpT1TVN3w8Egtdl+G3mboBmXioC5YFpRrxaqVzjjDAzLKYVCmHDSio
	JF7lBSI5uIa53ZX5aiZJK75apdKH4cudX8qwxUbkFGf7H/MIQfeH0QOyXx1aLxhZpAJQ1W
	NKmpn1bgmIJEN5+CHkKDQ5PWXoDUf2o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-XMq0lE9CMmmNCzCkJpVnrg-1; Mon, 22 May 2023 03:31:30 -0400
X-MC-Unique: XMq0lE9CMmmNCzCkJpVnrg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f5fc8581a9so4788665e9.0
        for <alex.bennee@linaro.org>; Mon, 22 May 2023 00:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684740689; x=1687332689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8kuLNohnKOx3ExNVEfyvrydeQ45tZ4mo/9wrXAhEKM=;
        b=fPF3G50ffjcML1eyhZkXrWk2Eto8Rbk6bdl+5ZcO6frVrfRJQRLzxnujESx6AO99bR
         1ZyzTVZIx9DMwjwzZh3yae1Y6fil1E99Lx55Max3OpOOsw/JwU+XN+Lar7O0gJfWsc4E
         uczvan2YEDki3wAYDRKVAeP162iKvALffDRwNp8M70A5OIGgnKoGyJ9S8yMD1mhdbJ+y
         BnHcEq5Ppp9udVTY2/1qIi2hKKFUMRKFK6kI2oNWK7PxQYI3p0qqTO3al7NxTqcCcSF5
         F3f2qvM/D99Eu0AUnXBN15WdwRFPDNBKSfrIKMQZYhJOArxky9MNsQvep4PR0KolMGu1
         Wy4Q==
X-Gm-Message-State: AC+VfDxf6U1k8YDaezTWmR0Ond7Cun4fmV7xGMMTxwA5ss6eSvnahAff
	BlnlNncJ/SCURoGUz8nw4QzC4EQy06H3aUjqWIoBMqjAyLhIolLZJpJ0X8hPgdwRUHm9UI2a7Xt
	lwi5qUdzVCTqI3eLrYeDzr9VmUliOdRu2Ib7Z4UORiHTgpGMzyJijA3WFeXPio35zPuZfrXxZ
X-Received: by 2002:a7b:c7d7:0:b0:3f6:514:bddd with SMTP id z23-20020a7bc7d7000000b003f60514bdddmr1015882wmk.2.1684740688986;
        Mon, 22 May 2023 00:31:28 -0700 (PDT)
X-Received: by 2002:a7b:c7d7:0:b0:3f6:514:bddd with SMTP id z23-20020a7bc7d7000000b003f60514bdddmr1015850wmk.2.1684740688627;
        Mon, 22 May 2023 00:31:28 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-178-148.web.vodafone.de. [109.43.178.148])
        by smtp.gmail.com with ESMTPSA id o5-20020a1c7505000000b003f0ad8d1c69sm10508880wmc.25.2023.05.22.00.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 00:31:27 -0700 (PDT)
Message-ID: <617135d9-8c69-8a1a-0018-93fb52015ea1@redhat.com>
Date: Mon, 22 May 2023 09:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 5/8] qtest: use cpu interface in qtest_clock_warp
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>,
 Mark Burton <mburton@qti.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230519170454.2353945-1-alex.bennee@linaro.org>
 <20230519170454.2353945-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230519170454.2353945-6-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jN2NAhe+dC2x

On 19/05/2023 19.04, Alex Bennée wrote:
> This generalises the qtest_clock_warp code to use the AccelOps
> handlers for updating its own sense of time. This will make the next
> patch which moves the warp code closer to pure code motion.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/sysemu/qtest.h | 1 +
>   accel/qtest/qtest.c    | 1 +
>   softmmu/qtest.c        | 6 +++---
>   3 files changed, 5 insertions(+), 3 deletions(-)
Acked-by: Thomas Huth <thuth@redhat.com>
