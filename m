Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1043670ejy;
        Thu, 2 May 2024 02:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPlY6H4WfI+/2LMxe63kbwxojn1f+Qc45kf38W5hTnenMzYLsE40Obg8ez2ko4NFQE7cbccLMkxUBnsVGqTlyL1YbDihEm
X-Google-Smtp-Source: AGHT+IEEzVxhBiIemvmPOIkAf2MRsnL86w1BCtrlMsuduLPf8X28EhvbGAFFUODjbuMyqQOg/uhq
X-Received: by 2002:a05:620a:562e:b0:78d:67aa:6a04 with SMTP id vv14-20020a05620a562e00b0078d67aa6a04mr1716740qkn.17.1714643308139;
        Thu, 02 May 2024 02:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714643308; cv=none;
        d=google.com; s=arc-20160816;
        b=U9jbswb79amdo7VZJ1A8nVyYmwknvQjBWubKWCnmE+BJa94XjmQC9GsP8YOLcKMncW
         OPGaII6E5kiZqlRfTSkwVUpL0Nt1TfNoAXxNyTyaYOevO3jYeeOK2SKeTKQavMc6Kcsz
         HEJHTTJn6Qkrq+vaIfcI+NfUPoYWI2HukEVHpOTeUMdHHUKtnQGan9LeU28bXjDkchXz
         2tyLT1D5jeNKW+H3A7A3VQ/RjyORf+oGg5vAzFc544pwuW7VctWooiMBKCIOUCjLs06+
         2NRKBDXPVNjsYAvfTvKj3nGLTa9GtYjMfUUGpPKcOmAvgsh4R85PrgnaoVCYtr3DMdNr
         9xog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=R/r2GpihB/6k5xxAAg8XbIHAhF2MO3HzzKnxOnu47Lw=;
        fh=ojuycBIOElk6h9Udvy1wN7o70aVHr43t2cHI3UCVgew=;
        b=FZw6GdtJTub+7gkzhfF1i6OMZpTaB7c7bmff8CcHeTimL0nbAaL4DfJKw6PmwPUPsq
         jV9hl+WPcisOdvM3vjpUntkceluqs0cv9wIQEgkS3bDuCADEnnuihSmgJ8MPiOLtYQBI
         THLqJxN3crC3igff22vuZEbtKhBM9P9LiOTlslXuP47AxoqXRsyLde2Je+YIT8XuZenb
         EFijQmZFbDu+xaA3z5kT4qhFeJmukk2mXnZX34HIb6OuCKr79ILXkLtqNq6U5P15VL2i
         9zsegOQDHXJ7fu2jXqJ5GwyDbA31dayiOTFEoMNtnF3amzAerxZJhLi3sCAzg50vJSA0
         5lOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XnMx8om+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020a05620a260700b00790efbcb869si570663qko.504.2024.05.02.02.48.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 02:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XnMx8om+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2T2w-0003Lf-1i; Thu, 02 May 2024 05:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2T2i-0003HB-J3
 for qemu-arm@nongnu.org; Thu, 02 May 2024 05:48:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2T2c-000811-3V
 for qemu-arm@nongnu.org; Thu, 02 May 2024 05:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714643269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=R/r2GpihB/6k5xxAAg8XbIHAhF2MO3HzzKnxOnu47Lw=;
 b=XnMx8om+bAI1IR95peadEAD3Pttv/sX57CIAeiGxTi1a37SqDimfuuXyAf4oVVFI4oZQCy
 pfJ9/j6XWeoZ8g/tpvOaS7reIfDkap6RmwIrHAoXUhjpd5an1WlH2+0ruiFwXCAcOZjw26
 NvdiRYtBHfZYhwSIHSAF3Y5vYMwu5Vg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-4wZngJUIPWaUXlbqHWiYMg-1; Thu, 02 May 2024 05:47:47 -0400
X-MC-Unique: 4wZngJUIPWaUXlbqHWiYMg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-437cb66a391so96430271cf.2
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 02:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714643267; x=1715248067;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R/r2GpihB/6k5xxAAg8XbIHAhF2MO3HzzKnxOnu47Lw=;
 b=H5bBsWNAK/KPX8QykYtZaqn0rj0TATSrggYASSfRjvhAWbDKd6l/r/jpWAQR5Ep+3a
 Jj7zNiK00zxXFV2hYpXyHseFTWDBhKJJ9AYLCug4j94Az3SPj1pEmShRMyfi0kTLOYJw
 a775XeV5DjZ2PV3SBiWeCLq3mE4PxYuvvr4a1nWb4wIN2T16Pc1X86SoRXJpHm0S8gQU
 j1oQSdrckponinElAJ5j+gM0i2HMbA2Z1SgrbdAe35MfLC3yptftlRheU/YC5n3vhDJc
 TlZyl4xGwHVBr+zcYKiMYaL1/50zEX2KYS4oYGaANdwOJ7gSe3NAC/ApS9d3PTRXGg5m
 BwJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjXlaVbJmP9bYE8FIrH41vE2tJE4TWgTi8jvgPavJqUo/mInLxNnBTRRxU5kski+sFNsBOlVyQVhdWCRRt8EkWMR+Y
X-Gm-Message-State: AOJu0YymU/b3SbfF6LFBhdw8PvWU3H/cDEuOEw71rxKhTCj1BWSPhpyo
 4q0XNvmnJsA/TR8Nw5TLHUTJfkuJxB5605XCDjntaNnfNbM0x/k1hZzpURoJ06p8HVsWp2AI7Bq
 6ZbBeNCYJWe6qQw5mzHAuZipaJO4BjPg1L7ZRzKyrk6Y4gkvPKA==
X-Received: by 2002:a05:622a:648:b0:43a:bd5b:3e0b with SMTP id
 a8-20020a05622a064800b0043abd5b3e0bmr1758282qtb.57.1714643267262; 
 Thu, 02 May 2024 02:47:47 -0700 (PDT)
X-Received: by 2002:a05:622a:648:b0:43a:bd5b:3e0b with SMTP id
 a8-20020a05622a064800b0043abd5b3e0bmr1758252qtb.57.1714643266888; 
 Thu, 02 May 2024 02:47:46 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 b10-20020ac8678a000000b0043718726f76sm307208qtp.90.2024.05.02.02.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 02:47:46 -0700 (PDT)
Message-ID: <8f301d1a-06ec-4c78-9924-a4379f56d0fc@redhat.com>
Date: Thu, 2 May 2024 11:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] docs: document special exception for machine type
 deprecation & removal
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org
References: <20240501182759.2934195-1-berrange@redhat.com>
 <20240501182759.2934195-15-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240501182759.2934195-15-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gVKzINBXHJAc

On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> This extends the deprecation policy to indicate that versioned machine
> types will be marked deprecated after 3 years, and then subject to
> removal after a further 3 years has passed.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/about/deprecated.rst | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 7b8aafa15b..55120e774c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -11,6 +11,18 @@ releases, the feature is liable to be removed. Deprecated features may also
>   generate warnings on the console when QEMU starts up, or if activated via a
>   monitor command, however, this is not a mandatory requirement.
>   
> +As a special exception to this general timeframe, rather than have an
> +indefinite lifetime, versioned machine types are only intended to be
> +supported for a period of 6 years, equivalent to 18 QEMU releases. All
> +versioned machine types will be automatically marked deprecated after an
> +initial 3 years (9 QEMU releases) has passed, and will then be deleted after

Should there be the word "period" after "3 years" ? Otherwise it sounds a 
little bit weird to me - but I'm also not a native speaker, so I might be wrong.

> +a further 3 year period has passed. It is recommended that a deprecated
> +machine type is only used for incoming migrations and restore of saved state,
> +for pre-existing VM deployments.

Should we maybe add a sentence that they should ideally be updated to a 
newer machine type during a service window with downtime? (well, it might be 
also obvious, so maybe not worth to mention it)

>  Newly deployed VMs should exclusively use a
> +non-deprecated machine type, with use of the most recent version highly
> +recommended. Non-versioned machine types follow the general feature
> +deprecation policy.

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>

