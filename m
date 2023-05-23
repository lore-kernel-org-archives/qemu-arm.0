Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2028856ejb;
        Tue, 23 May 2023 10:12:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qhCQlGGu4ChNsxi/hNq0uuZYKr3cqi/0wtoMe9yod1zy5QKNES2NzysyNf4/XiBjnwa0j
X-Received: by 2002:a05:6214:1256:b0:5ef:5049:f49a with SMTP id r22-20020a056214125600b005ef5049f49amr27083574qvv.32.1684861952967;
        Tue, 23 May 2023 10:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684861952; cv=none;
        d=google.com; s=arc-20160816;
        b=xiL3jO53HyfbjKmZk3aUzPRacd/3tyiKOdIegVJFEaZ2bGjWmRTNECnWTABDnrCayZ
         3GRlLnLaT1EK4gdtC31DTM1xNXiHr/F1mm4d5pDBGRA1ETa/94g0NrCrLlHLNE+7hLuD
         pxbp8TCFkOITd6Z3GHgRHftJrMKLQrOk8o01ZbjAS7vH/yVinzV4yHfN+T5fprGEcrv/
         pIgYNfkvahVJbzuCwDH4/YgUGnaCkdW3AbsUkwfr0wDDKmvNs7VpR4DxNFpx6LgA+Ixp
         seU3znQYxokp+Bm2v9lpOsxTnI1ECFg03RcijZQmdrXECsUtXK8bDNapsUPCEzSpczFB
         vgyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=chhc2T97NrMu9FeMjIRL2KxcIVgjY5/38Lo1CPig6YE=;
        b=oyAIjhUmojoj8U6YVqASJcwW8Y6YvZmA9HLAAWpAYFrtKPjOrrk9wTsKAr00/qNoVk
         7UpOCOHyiQp3uxJObbzCz3CGxS0dMhpieYKwP6Nyq9IxwBjQHs8laDKJGqo+a4NkJm1c
         2JCsKdfWyL6Bq5Suo6YMLZivJitjGUM6SmZXiAb9lldXMXiQHlcLPLHuxD8vsphmjLSr
         10SSgn9/6EIOhzeNk29GyI5dU1SMjv5+raVdAGFLrE9W7l0KICpzcNP4txcXmTtjzUs6
         qQjdzvsL3tIlhAKhGLz1fJIj1KffuHohORLGNHN3X5JulXQ2pC/qnRYstKQ3jpyKXqI6
         5URA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H1oEGbKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a0562140dc400b00620cb906a49si5451522qvt.281.2023.05.23.10.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 10:12:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H1oEGbKM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1VYG-0003mf-Hk; Tue, 23 May 2023 13:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1VYF-0003l1-Hb
 for qemu-arm@nongnu.org; Tue, 23 May 2023 13:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1VYD-0002jD-R8
 for qemu-arm@nongnu.org; Tue, 23 May 2023 13:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684861916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chhc2T97NrMu9FeMjIRL2KxcIVgjY5/38Lo1CPig6YE=;
 b=H1oEGbKMOAHpQsohAmvbKoYXrW4KC4DOgO+UGua6YhjCtJ0fzOKGN/5pI8fJ1axXnGUbzW
 xy3zcjerZO8tZLUJtTV5iLrnnd/gXC7DOGO+q/tAQhH3RTaieaT01enQu9wfDhaRQuYS0f
 azOkRcad0YCMAWIkL8nijlZ0ERbr+t4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-9RmLfU6jP8miJQCjHptNMQ-1; Tue, 23 May 2023 13:11:54 -0400
X-MC-Unique: 9RmLfU6jP8miJQCjHptNMQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f60162f7fcso343425e9.1
 for <qemu-arm@nongnu.org>; Tue, 23 May 2023 10:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684861914; x=1687453914;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=chhc2T97NrMu9FeMjIRL2KxcIVgjY5/38Lo1CPig6YE=;
 b=ewrKWl5sRodyj3pMDjyiE1nX6T5/ctbryzIAYNO2k1z8rLtzyBYtpWJXqTSRRe5iU8
 okU2j/42m1yiMhiYlo9tUe+RBj6Oxf7HZwLetE58ZwAm8oVc5JtfIdHYZe+VfULN3nZN
 lIZOPVK/mCTuahg2+9MV0kr95+J7lKRxAsLWPJidsXIRrQ7O77pgVYZMUbvved/Wjvcm
 icEWiyIf9htwCqmHkpnwN1Q52104z5BWHJ9SIzjAoEZokvgXQI0R/f4KQ3qIHqXNNKel
 /fbFsQJwkkYjlxLMRg1DNEeLdesK3VhfBSpldxRi85cg02kfLyU0SKeTCY9wyl/aj9zS
 Kj6g==
X-Gm-Message-State: AC+VfDzUYb8F/IcXDgiJpOzpD695OadnsBNbPIziHgchrCjaIlbUJKaH
 7FIBRQvw0orckF7hwcRv6PP8aDVFOATSVPwkQ8pD7cI+narPRQQCvQVTyudwRjgmNjFPDZ5eRsM
 Y7hr6BQ7ZzeAYJAawLes1
X-Received: by 2002:a7b:cd8a:0:b0:3f6:a66:a372 with SMTP id
 y10-20020a7bcd8a000000b003f60a66a372mr2318081wmj.1.1684861913893; 
 Tue, 23 May 2023 10:11:53 -0700 (PDT)
X-Received: by 2002:a7b:cd8a:0:b0:3f6:a66:a372 with SMTP id
 y10-20020a7bcd8a000000b003f60a66a372mr2318073wmj.1.1684861913650; 
 Tue, 23 May 2023 10:11:53 -0700 (PDT)
Received: from [192.168.8.105] (tmo-117-143.customers.d1-online.com.
 [80.187.117.143]) by smtp.gmail.com with ESMTPSA id
 f4-20020a1c6a04000000b003f1978bbcd6sm3659131wmc.3.2023.05.23.10.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 10:11:53 -0700 (PDT)
Message-ID: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
Date: Tue, 23 May 2023 19:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
 <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] docs: sbsa: correct graphics card name
In-Reply-To: <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vtmWjXq4+8Dj

On 23/05/2023 17.56, Marcin Juszkiewicz wrote:
> We moved from VGA to Bochs to have PCIe card.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   docs/system/arm/sbsa.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
> index b499d7e927..fea4992df2 100644
> --- a/docs/system/arm/sbsa.rst
> +++ b/docs/system/arm/sbsa.rst
> @@ -27,6 +27,6 @@ The sbsa-ref board supports:
>     - System bus EHCI controller
>     - CDROM and hard disc on AHCI bus
>     - E1000E ethernet card on PCIe bus
> -  - VGA display adaptor on PCIe bus
> +  - Bochs display adaptor on PCIe bus
>     - A generic SBSA watchdog device
>   

While you're at it, I'd suggest to replace "adaptor" with "adapter" which 
seems to be way more common in the QEMU sources:

$ grep -r adaptor * | wc -l
5
$ grep -r adapter * | wc -l
385

With that changed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


PS: An idea for another patch: I think the "config SBSA_REF" in 
hw/arm/Kconfig should select BOCHS_DISPLAY now, since this board seems to 
always require this card now (is there a reason why it can't be disabled 
with "-vga none" or "-nodefaults"?)

