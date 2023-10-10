Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp2964ejr;
        Tue, 10 Oct 2023 02:38:26 -0700 (PDT)
X-Received: by 2002:a05:6870:fb8f:b0:1bf:1a38:283b with SMTP id kv15-20020a056870fb8f00b001bf1a38283bmr20928509oab.9.1696930706139;
        Tue, 10 Oct 2023 02:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930706; cv=none;
        d=google.com; s=arc-20160816;
        b=ZnThufk47rkLg/gDfKJToeai51AcGVzjwMH28mGIL5u1juG+H3pON7M5i8D0HenUiK
         k8/HSmQwFq9iCIX8fmCpbo5QmP/aKwjhuzXk+DJqmOzjWw2yT0/T9b92R3G8GkJReslp
         hda4zJ2VzOw85cE/LWzTzgtKThkkec4CRUar9HVC4r0TcoOnO06BTZ9eL91nHs/C4DTe
         Z4ObQRF66OsLsN+DMuCz2/eKBEgEPayMEpYfIRbv3z2pxEnXo+mPyYwOb5FFP2fuoBb0
         9/y0FWOPnSh0SdTwucswa9YzhhbLZDoztmR/TgvvDkj73NRhYqiFhkGc217W1IHMlgZG
         5MIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HoAO4MU3+HX/pu5nZVUw6NryiBkQ92zJRW3EbT9zs2M=;
        fh=9PxMPZdVNxY5Pjb2mL9IWu5a/nL69N54g8iecvJMhvg=;
        b=ZSI8NyAEJIvxugrj4J81VMd3QHpZrWQs2/XZ/J7jA646Qg36Y/YNvl6qYCW8J67d0k
         aY18f1hrZ++YQY7YPmW272AiFc9F0zmuQ7Mk2rcvOLg8W0Rau7h6HHOZo9YmAQ6hxf+V
         zGUejDV4EV7ygNj0Ikpm5KKTj8lO7uYsGH8mOk6Ak96fuExvFsOQBuuHp9FddemxIzHv
         /1pZe4ikKfIVN9OUoirxWjfwKNZnpmS1GoYMbtLX5Co/gKVgoXmmJ2ves767n+Rdn9GV
         JGyJjzfZCfKV9h23iS9uMsv/Lp6k9sh+9yY/LfKQb9cRuLAokyGvhJNYUim+epfB1v6M
         GQMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=gn6Qo0JY;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v13-20020aa799cd000000b0068ff049a543sor5851900pfi.6.2023.10.10.02.38.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 02:38:26 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=gn6Qo0JY;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1696930705; x=1697535505; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoAO4MU3+HX/pu5nZVUw6NryiBkQ92zJRW3EbT9zs2M=;
        b=gn6Qo0JY5bEXK0+5/Y+etH5tOtKxk67G4GyxbMlpbLr3dRrRcizx5wYQ5tYkS0QpdM
         RfIupDzHxkDsRY1kSIBw+MiIsmoe8m/zp3Td3qF1SNApJATA9uaml+mwsnMlolCtw8XA
         nYUvDAk3fWFnvkzp82sjyndKdsz6wJkr8Azt0tOnzTMbSgYv3Qenv7aOd0TFp3JzQBjR
         5CafRAF0KvarmOLSTQhSYvBxfcmrXes//zJdOWDThGiZSuPpED9JAd0hNirqMM1bY70J
         LvebP1mlop4hYSsnd656JdLZr7Pa1neA8XVrIiaoaw87wWXhMV4u2LEZHV8fH1UmcoMh
         j1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930705; x=1697535505;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HoAO4MU3+HX/pu5nZVUw6NryiBkQ92zJRW3EbT9zs2M=;
        b=g2cDEGAste4HcoUorxf+xttO1STem6MTF4BYaFSWOHMd3SUWzSgAhKD3CsF31mFZlk
         i2P9JYuHBE9PXU0ii44WYZBvYuYOSNWvjFOtnBRkybiET13yh8AyHYSoWdN58RIqw1Wf
         sRjqWy5spjlIwnPKZpGPnkPAFvFT8/4GSQinR48fk9ww+ZkwqSB7lzXcgXv3HSDCNWUD
         20NqmPvmb/DLx2wkkTI/UO2aDUouzw5qVnehBqsQ7jDo+e3NKo0O6/hL/U8zC85EeA5D
         AzqSc0wtFPZ5GB0ssxRRjAA1votAq+FU7ghNgfAGP6/JfvjyEK6XzQShwtwToLRj3xmZ
         B2zg==
X-Gm-Message-State: AOJu0Yx7Gyg5ytsOAHyzIvgEmuftzRASmofY3wNvqWIU/R378PO59WJe
	j+3pUfOSrXgX2V4F+KYW5enBpw==
X-Google-Smtp-Source: AGHT+IFLaMgQENjLvJkfk7pzKNhxG7HGIKa0urAQS112N7v4/1GLtegSoR+l/iVqe08cbr+zzgP60w==
X-Received: by 2002:a05:6a20:ce8f:b0:152:cb38:5b47 with SMTP id if15-20020a056a20ce8f00b00152cb385b47mr17028892pzb.55.1696930705544;
        Tue, 10 Oct 2023 02:38:25 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.206.10] ([157.82.206.10])
        by smtp.gmail.com with ESMTPSA id it9-20020a056a00458900b0069346777241sm8066145pfb.97.2023.10.10.02.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:38:24 -0700 (PDT)
Message-ID: <ab7ffc78-fe3d-4e99-b3c6-e66f7b0c7e18@daynix.com>
Date: Tue, 10 Oct 2023 18:38:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tests/qtest: Use qtest_get_base_arch()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Jeuk Kim
 <jeuk20.kim@samsung.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-5-philmd@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231010074952.79165-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ojFvOo0JTXqn

On 2023/10/10 16:49, Philippe Mathieu-Daudé wrote:
> Additionally use qtest_get_arch_bits() when relevant.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
