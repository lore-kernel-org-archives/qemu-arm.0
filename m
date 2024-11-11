Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6467183njc;
        Sun, 10 Nov 2024 23:56:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXaiBnaB50K5EZuKKOjIrpXsK/x0aprlNY+h8mNiyyCw3Ahvq1oJgeCPQpPDXl5Khsr8dFOT4GlMMflvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGxVXM06uawS7sZ/WUjDkpGBW4DoXQum0Ld2VYOfzeNrGQaq57sGIs7LpqBvXViBCY0kp2L
X-Received: by 2002:a05:620a:c4e:b0:7a8:554:c368 with SMTP id af79cd13be357-7b3318c7d76mr2097029885a.6.1731311819396;
        Sun, 10 Nov 2024 23:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731311819; cv=none;
        d=google.com; s=arc-20240605;
        b=MSv6sy40irhZ2zpxfqDfpgGP+CuNmMfUXFFnQC7MEchb+ym+C57zKDq4SsT+NtKoIR
         ZlWIErVWIf0K06e50+V3DGm74+VmdRpZacY8kWvYoaerGGxx2mrvtvKbLmP1UWGHtrYj
         4UGyICaR4Uy9Er/rDKfRrv6Po71NeJMPUmsyuR3mLE1Ervvul4PDq+fAdPikP8f3gFuN
         yh26efebtaNg28DfleTmui1Qzm6T6kfq1W3BfkZX216Un8wrfjRhEo4bqMQYzIJBfWoU
         AeZj509AULE9AyUKOenTg+KGM8Ti4SLxtnMOFbkZrobvJuoPy7Xdcm39x2sNCV938NUk
         UFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ow3FUGyStw/kKVci2B4aoXvUXvaaEUJf+4x32Fp7ekk=;
        fh=DGsMngpo/1ldU+B2krjFo6WW8194bc9zeyjPt6lBn2I=;
        b=i1GWbQ1pHpZsbMqEurgiLn5K9vw/RpTXDwZ72n2jGOFDdQXGQmuvEUr4t35c4VR/Tv
         O6TCfKwSEjUVzCHDckLNOpU/YWKafv5pYzENvM3ju90QUpkbk0aTistKfBcv+3pVbUVU
         r0wWzrxY+5KFp8cjNcTnxjb1fTNe6jwbh8ifO9Dz5T6qcu+qIGv+fxnDxpyP2gFwsoWd
         9tWDHiWKpIh6zKjHNrT6W0z+AGfd+5GBiaRm/o/j/NegsjxGIKBEhGlzMbUh0e6TuRha
         7czE0sEKCPSgb6tLnSKMJyLgozNZX7K95HVNNRkkATejpZtyz4LT0GA1df8B9s1eVj2R
         MdBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZOWwYCzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac58263si1067400985a.181.2024.11.10.23.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2024 23:56:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZOWwYCzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAPI5-0007Rt-6M; Mon, 11 Nov 2024 02:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tAPHg-0007Ei-VC
 for qemu-arm@nongnu.org; Mon, 11 Nov 2024 02:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tAPHf-0007sO-EG
 for qemu-arm@nongnu.org; Mon, 11 Nov 2024 02:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731311786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ow3FUGyStw/kKVci2B4aoXvUXvaaEUJf+4x32Fp7ekk=;
 b=ZOWwYCzPB3MQlJRYfehMMhXtgeliD0yQvTqpMvBzyV+Wdtku5DzgQheN/q46xHymxFh6GL
 JT6Rc7az3y1l52vURpaAlxMfw/vdijXXWMbiEQTHnvPVBebe6KEmpN/su2cd0cIU0GzLzT
 r4Ob6UbwmSwk2yvi+aNcGGLHmgLNleI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-gKTwbER-MmyX9O5LhZQ0kw-1; Mon, 11 Nov 2024 02:56:25 -0500
X-MC-Unique: gKTwbER-MmyX9O5LhZQ0kw-1
X-Mimecast-MFC-AGG-ID: gKTwbER-MmyX9O5LhZQ0kw
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5cbadbef8edso3659342a12.3
 for <qemu-arm@nongnu.org>; Sun, 10 Nov 2024 23:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731311784; x=1731916584;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ow3FUGyStw/kKVci2B4aoXvUXvaaEUJf+4x32Fp7ekk=;
 b=pqpBOOyO3sTGZTbDoqY/JE7XFtIUP7aXKWCWEtuCjtB8bZ/zmAD9OUrC+43ap6/hXw
 gk++hN5nLNR8I8is6x7RAuLd/7wd43+Fj0ML10jYBfGrF5QShdZm815BqL6dIcCYr2Ov
 M/HZOnMsRoiITk9rn7ku/XotoV2I1sxWBa1fSvPurKr049GyiP8OUVbk0tFmBih4SWdV
 dkzCZcX11dYVcbW6fDp0OXDlVyXf7xEfFABAg1LwUvRr24wZiuAsrEBkQKxrwhhKvZV3
 WHmcv1HEsut6iJnxTCgXTRNsbKjk5bHF/nQODk3uqhPbk8ljdmMi+e+0WIspfBKczJJe
 ccmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj/7Q64D9d/dSsa+f1NKPH3CxXCT9bEo2SwHNJkCZQK4vBgNkjKIkGcOHuYhDWsEwYinSzFNGgpw==@nongnu.org
X-Gm-Message-State: AOJu0YxiUZ4oNJSsHDy4slNRvWJgbejwiw4KuP04uDbD1lpWivlz7Hgk
 fkn70871rU+q3qtRQ9frh2KkbaZb8kcAnwRiYWBZ/+5FZhep+uA9nfMlfQ/C2fTJ48E4rqaBZoU
 fyCqgyAyL7BeKMSbirVO6IzmW94uRwHaEa26hqx9dRisFy1bn+Q==
X-Received: by 2002:a17:906:c112:b0:a99:6036:90a with SMTP id
 a640c23a62f3a-a9eeff0d262mr1143452766b.14.1731311784099; 
 Sun, 10 Nov 2024 23:56:24 -0800 (PST)
X-Received: by 2002:a17:906:c112:b0:a99:6036:90a with SMTP id
 a640c23a62f3a-a9eeff0d262mr1143451566b.14.1731311783733; 
 Sun, 10 Nov 2024 23:56:23 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-55.web.vodafone.de. [109.42.51.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17684sm565487266b.34.2024.11.10.23.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2024 23:56:23 -0800 (PST)
Message-ID: <cf73685f-df95-4165-a642-ddbbb5efb64e@redhat.com>
Date: Mon, 11 Nov 2024 08:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20241108154317.12129-1-philmd@linaro.org>
 <20241108154317.12129-16-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241108154317.12129-16-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W_U4kx_fvYeMdxxzpjwx73UNC2_0q2JzLb36YBzGtaA_1731311784
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.118,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qtRrTxc8Heev

On 08/11/2024 16.43, Philippe Mathieu-Daudé wrote:
> Introduce an abstract machine parent class which defines
> the 'little_endian' property. Duplicate the current machine,
> which endian is tied to the binary endianness, to one big
> endian and a little endian machine; updating the machine
> description. Keep the current default machine for each binary.
> 
> 'petalogix-s3adsp1800' machine is aliased as:
> - 'petalogix-s3adsp1800-be' on big-endian binary,
> - 'petalogix-s3adsp1800-le' on little-endian one.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/microblaze/petalogix_s3adsp1800_mmu.c | 62 +++++++++++++++++++-----
>   1 file changed, 51 insertions(+), 11 deletions(-)
...
>   static const TypeInfo petalogix_s3adsp1800_machine_types[] = {
>       {
>           .name           = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>           .parent         = TYPE_MACHINE,
> -        .class_init     = petalogix_s3adsp1800_machine_class_init,
> +        .abstract       = true,
> +        .class_size     = sizeof(PetalogixS3adsp1800MachineClass),
> +    },
> +    {
> +        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-be"),
> +        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
> +        .class_init     = petalogix_s3adsp1800_machine_class_init_be,
> +    },
> +    {
> +        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-le"),
> +        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
> +        .class_init     = petalogix_s3adsp1800_machine_class_init_le,
>       },
>   };
>   

Do we really want additional machine types for this? Can't we simply let the 
user set the machine property instead? (otherwise, all tests that run for 
each machine types (see qtest_cb_for_every_machine) will now be executed 
three times instead of only once). IMHO it should be sufficient to have a 
machine property for this and add proper documentation for the machine.

  Thomas

