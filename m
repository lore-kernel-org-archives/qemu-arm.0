Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1210596ejm;
        Fri, 21 Apr 2023 08:00:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bAx5278L7qFmXQsrXzKMxOMdKhjh78+i4IFz81E3Hz7hY5ZotOJJhsAVDVKHH6/vDPV8Sq
X-Received: by 2002:a05:622a:1a88:b0:3ec:493b:a909 with SMTP id s8-20020a05622a1a8800b003ec493ba909mr9513109qtc.29.1682089221460;
        Fri, 21 Apr 2023 08:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682089221; cv=none;
        d=google.com; s=arc-20160816;
        b=KwsdBADKVaHs8Z+MiEmSpjj9hXop1OyG1yC26IoPaf0fQLZ2uuLtIh+2powcBRV2Ey
         /bSX8+dJzzHhBl8fHkNHHV2UQK/v750R0MRk08n+pOC/hs4PvfvVoyyJrRRitUGg+60T
         U0tyFWy1mOQ1txVUL5+8g49eVRQg+oUSr6RXC3c0rQqhDEZ2kzfQXkVnhkCPDLM1vyvr
         fELYizHyHlJYHfMtmjyObeIuTYWe1PzVBMB35HmOTApfUuYpelgnNf0emRYjhDmZlzC9
         QtKUKYdfbqoE+zFNiF1KGtSqe/e/oUAb6sMqnhzCDOuQ7PFMO7pC1zTYtbQ9uBSLvCyo
         jIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6gCuqahjHcRqLRfmClAcpq2puGif5QpPWvDeidLRxDc=;
        b=QGMnpVln6f8PSHm4RLInq4sXouWsXw6xixy5EsvQ6NoEn8NqQN80/Qm6k8vqagJcoW
         +wbAfG2yDLYFpZkGDbNNxtLL4ehy/YYErtPPS6Mbmn0rLly71q7nEydANMNbcQeFkzHK
         pBJ1GviobiSAMT8yaJ8h4UnSntGNdkrHSkvqAz/n4hwS7995javmknfq9vs4cDTQD2Vi
         eZKepKv5JCUPENNTirXz2WZIyoW7xbP2And9EpcV/T+4fYoF/4pRH+QIV92DaM8+6MC2
         VixMN3IVFRYsFMM7IaXfgQTNayJ4H0lTic5n7UR9WN2Q5e1SuPPDjyi+AjnbGLlkhTiI
         cchw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=azqwmDqY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id f13-20020ac87f0d000000b003bfaa9ae3adsi3151264qtk.31.2023.04.21.08.00.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 08:00:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=azqwmDqY;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682089221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gCuqahjHcRqLRfmClAcpq2puGif5QpPWvDeidLRxDc=;
	b=azqwmDqYlsx3HtP/PMiT2+pzJTCKgKp/WEWwmnyJgX/T1Ppsk4/MQvz7FZND46C9Xo+ZOj
	WXoGIA3B/fbLZWK4qbC564X8lbDD6W93coHcBynSwv5auwyX9rF7GXtVmHcmeZ2m+CpXWb
	ouUfwqo2Ck3pfFTF3FewM5EpM3dTR2M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-PMU-QS1pP3Wi7zvbeKgFAQ-1; Fri, 21 Apr 2023 11:00:19 -0400
X-MC-Unique: PMU-QS1pP3Wi7zvbeKgFAQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f065208a64so11290005e9.3
        for <alex.bennee@linaro.org>; Fri, 21 Apr 2023 08:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682089219; x=1684681219;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gCuqahjHcRqLRfmClAcpq2puGif5QpPWvDeidLRxDc=;
        b=jkbd5l8cvOHTXVNji24VXFIB1BR8Zx3x+LEdhyQ+xgu4c5WODDknD9ZgHQe25L7fkP
         HTvC/U8ju/zDWz3em1RXFUaaOnfWe3gnONXUbyAEX1DPn/ztBQeHnaYpR3U2kRTirME9
         T2vFn4XoRb13z32B5Xcfm1YyGEtR3Yqc1AkRTEYLGcHn3o9m50+Ka8wobtJ3dW7SfXQg
         ElWHzXKVAkZ/xmxNgqHmHsuLQDFc4pUtJqpLJDCK+h9+B3od30qfoNdXhPaPWaJhDvhL
         59bdolynbL2m22g7Ii1y8ZX8TihJIi6eX17E1jIK3laYS8wo4KmmddEdn0l1RzpBx5H6
         huZw==
X-Gm-Message-State: AAQBX9dFl5qBTdMWIsFzJadd4G+dtkKjO4/2GUzcOKbILI0Q9K5JiJhI
	KsFYWlZAe+mTuuRD5eDWcHsEfptBQAmuPPd8RkYi0BJHoWTpAx4pTx6xvukQ2ohrUOBHUOJgnpQ
	ygOgpjDoWms41dZJu
X-Received: by 2002:a05:600c:2201:b0:3f1:806d:33ad with SMTP id z1-20020a05600c220100b003f1806d33admr1871253wml.6.1682089218704;
        Fri, 21 Apr 2023 08:00:18 -0700 (PDT)
X-Received: by 2002:a05:600c:2201:b0:3f1:806d:33ad with SMTP id z1-20020a05600c220100b003f1806d33admr1871220wml.6.1682089218407;
        Fri, 21 Apr 2023 08:00:18 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de. [109.43.178.20])
        by smtp.gmail.com with ESMTPSA id q13-20020adfcd8d000000b002d7a75a2c20sm4511568wrj.80.2023.04.21.08.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 08:00:17 -0700 (PDT)
Message-ID: <48389ddb-3c59-3bce-532e-012d5f92f493@redhat.com>
Date: Fri, 21 Apr 2023 17:00:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 07/11] tests/qtest: Fix tests when no KVM or TCG are
 present
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Laurent Vivier <lvivier@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-8-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230412121829.14452-8-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AOcsVAkDPM+O

On 12/04/2023 14.18, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Skip tests that crash or hang in the above scenario. Do not include
> any test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 11 +++++++++--
>   tests/qtest/boot-serial-test.c |  5 +++++
>   tests/qtest/migration-test.c   |  9 ++++++++-
>   tests/qtest/pxe-test.c         |  8 +++++++-
>   tests/qtest/vmgenid-test.c     |  9 +++++++--
>   5 files changed, 36 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
