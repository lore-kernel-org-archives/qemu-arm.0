Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp35637ejf;
        Sun, 14 Jan 2024 21:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrcSzJ3nFFedQraCc9lmimPGqFvwL7h03bxt41/Qcf+n7ju4KPWSOa38guTIKzDmHdKHSf
X-Received: by 2002:ad4:5f06:0:b0:680:cd3b:c100 with SMTP id fo6-20020ad45f06000000b00680cd3bc100mr7056526qvb.19.1705298012768;
        Sun, 14 Jan 2024 21:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705298012; cv=none;
        d=google.com; s=arc-20160816;
        b=QKLRSXrUQjjqnmYX6EeB1kckl2y0COFaMdJS8ZHaMlr9qGj0SqnmcfgiCNIsr2W4wy
         /BlV2c5HwV0yKXexK/J5ZM2aD//qm1PfmisGv+Q6aE1h+M7E9NZdwwt0Tv71ur9afvUp
         Cw2AjVv31tEbzaKdh4hrwiEupKFUy5Lq2FG5IP7X4rPsn65cGPJsi28AnF3L7wtarbIo
         YHxJmCiLbVCvyzdWEqlyz2XXB/TE0Wt12vHonuDEG6LHDTrv90OCsdRrHj/FPqwE4aHD
         ezIZssw4Tu7+JwvQvmK4/h3zzR+UhlYryRY+EsGRP2bNsQAG6hRW1XEuSY2TxQHfJVR4
         PTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ad5LqbOndgRFjsWqtjVLdopSBTTMpibLsYLxVlS4SRo=;
        fh=UBZJIFyEXw2NEQCbGJtDA1qjVF7HIlYnHNaGWc5dEVc=;
        b=U9LMyQ5cZvPGuHVyQPtJwSr6gv/bBvAtKLuy2S70yycmFQEFQ5pgYCHaJ7qqpnJ17H
         fhyrUyMTHmzfO/id21VlFsmMZGji8EkwWLOQ20OSrNbozZRWe19W5txhoSK7pcxIkQCb
         8wjVFumG3fV9I5DNTn34FAsoObMgJw8pJdH54le3V0gtAJg+5UE17EdEndC1O2+Qji0k
         abLRcZtYO6l1w7UWhCyKTABuqKQd4Q95gOGKqwAHzOKE+x5Pv4jHQOqwiyM5uyNdGPB8
         EGSr9Q6xQGWNhAn8FJKwYqSMNtizUId4xJzZ958Jt3Ka/pM2S91GEcD5Hu1ygYeb2LR1
         wLUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VOczEr7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1-20020a0c8c01000000b0067f8279ac5dsi7462125qvb.487.2024.01.14.21.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jan 2024 21:53:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VOczEr7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPFuL-000747-FU; Mon, 15 Jan 2024 00:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rPFuJ-00072t-H8
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 00:53:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rPFuI-00063X-2G
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 00:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705297989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ad5LqbOndgRFjsWqtjVLdopSBTTMpibLsYLxVlS4SRo=;
 b=VOczEr7k/MHX4b7jSeeTWsJxUxBu3AfSgoI9pnuqKShVPxB1U7tMllYmTNJK1ToiWgcD1S
 GkUJjwsZwSOb0MX4whtleO9L041icUYudIq5mSVkUd5DNsE+hGFW9q+d8eV6fsI5elEDSt
 BFeyw3eL6KrHvHrPdMWobh6wYTuVSVs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-XTJuWuXkOOCDFomORDr9zw-1; Mon, 15 Jan 2024 00:53:02 -0500
X-MC-Unique: XTJuWuXkOOCDFomORDr9zw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-555e8b639abso5206728a12.2
 for <qemu-arm@nongnu.org>; Sun, 14 Jan 2024 21:53:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705297981; x=1705902781;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ad5LqbOndgRFjsWqtjVLdopSBTTMpibLsYLxVlS4SRo=;
 b=YzhFyLaI/E6euu04TJ4Yw8fPJfqFNwaTCT0BvcWW5ayCdxfnbPn6oixcDCvyX8GDdw
 ersHaWTEF3lAbLeqiL7mBHnFANZGYDSGYeRrh1kW3v4uVuCYE2NfnEryFxmN6s4z4/Lm
 LbZUABaouNRT0fh+0BnnnS89cGnis/fmJFbmvgjGhKcJKZq4WO1n77dM9iYsOi7plgKS
 lstfpF2HmdDZwBorm86C+1JjbMDZ3thSr77XCHvvlVF/KrVNfUt+rDZBwsWsy2WA9pin
 WQTkz1oLe8GsjEDL5jG+HTucTEnEMWPk8ZOF1I6tSBNLziZUVPVpWmTvBZUS6SkMxmqI
 Tdug==
X-Gm-Message-State: AOJu0Yw9t+qO0rc5jk81Ce0U1bKz1w5ABBcLKRYv7aWAkfimP4JQ+YiZ
 pbDsly/ktcT9jt/pGsG3jUu5/hvApEFc2VmKONsL4TVZl++KSpfVjnuW4VXIyhbpPhGcrRV1Ijg
 NOkh98Ne2FLYZiwPlAYXj
X-Received: by 2002:a17:906:260d:b0:a2c:72e4:efb1 with SMTP id
 h13-20020a170906260d00b00a2c72e4efb1mr2040113ejc.139.1705297981010; 
 Sun, 14 Jan 2024 21:53:01 -0800 (PST)
X-Received: by 2002:a17:906:260d:b0:a2c:72e4:efb1 with SMTP id
 h13-20020a170906260d00b00a2c72e4efb1mr2040103ejc.139.1705297980748; 
 Sun, 14 Jan 2024 21:53:00 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-232.web.vodafone.de.
 [109.43.176.232]) by smtp.gmail.com with ESMTPSA id
 v8-20020a170906488800b00a27aabff0dcsm4952601ejq.179.2024.01.14.21.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jan 2024 21:53:00 -0800 (PST)
Message-ID: <5200b68d-6b3d-491f-8e51-4a53aca2f3a1@redhat.com>
Date: Mon, 15 Jan 2024 06:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] tests/qtest: Add STM32L4x5 GPIO QTest testcase
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
References: <20240112170635.303226-1-ines.varhol@telecom-paris.fr>
 <20240112170635.303226-4-ines.varhol@telecom-paris.fr>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240112170635.303226-4-ines.varhol@telecom-paris.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.758,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: qpBc4IpizZga

  Hi!

On 12/01/2024 18.05, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---

Maybe add a short patch description (e.g. saying what aspects of the GPIOs 
are tested here)?

> diff --git a/tests/qtest/stm32l4x5_gpio-test.c b/tests/qtest/stm32l4x5_gpio-test.c
> new file mode 100644
> index 0000000000..189083bc4f
> --- /dev/null
> +++ b/tests/qtest/stm32l4x5_gpio-test.c
...
> +static void test_idr_reset_value(void)
> +{
> +    /*
> +     * Check that IDR register as well as other registers
> +     * determining its value have the exepcted value

s/exepcted/expected/

> +     * GPIOA->IDR value after reset is not identical
> +     * to the real one ad Alternate Functions aren't

s/ad/and/ ?

> +     * implemented
> +     */

With the typos fixed:
Acked-by: Thomas Huth <thuth@redhat.com>

