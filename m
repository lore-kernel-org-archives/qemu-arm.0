Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1125698ejy;
        Thu, 2 May 2024 05:12:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUW8pAjAZCVQSUlT8K9vCrbvHjWqCKV5natPyd+V1OGxCGnXvOUBNtn5eEZsldlLSXMgHnNq7Ya3hsbNV5RzTSJCblcI2R4
X-Google-Smtp-Source: AGHT+IF6wPNjjlmYjgz9jEB7OB1oqY8aK2iQyJiCZdl7pPdylBRQaFqirtw2AUQiUl7dePDY+J5V
X-Received: by 2002:adf:e48f:0:b0:34d:9d2c:8ea5 with SMTP id i15-20020adfe48f000000b0034d9d2c8ea5mr2069342wrm.28.1714651965707;
        Thu, 02 May 2024 05:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714651965; cv=none;
        d=google.com; s=arc-20160816;
        b=BMO+JF4HZuJ1/jFOxJ0uMnfw8z1uy/nvKB3OAwq5Ay0z2R0vxLVUD8zT6QpHbh6KXq
         fnkXr4w/KrwqbBGnbOm3AzUrjRxRqSawsKFsWjTYMdmHwxrBl926Fig6TOn0zrVcUuhu
         7krY4dHXsfGynqYuVeKNrQKw2FggJ5pAaIBRJrGIbNkxyBeg0N3Vxp3SC4hNIk/DWKZa
         U0VoQumRcZ9H7EYdN0JK/dASrNoITdNnIuV8qKxihooiDbp23oS+ZMoZAqtQJl3bavYL
         kswcZLxy+XLs6BVIRpjgOVQDUDyTCWWvln9hB+6065QTVMqaBSliZFvxArIi9c71tZqi
         ogEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ikWj96zlpFwVj6lbjx7McjofJxQ6Bw1ZvC4+k1yCb8g=;
        fh=6ciMO2W7ufIO4RuxFVAGjGf208hdhzoBSytoDPYbPl8=;
        b=niTYLzseLR/tv7dLD9flfU6zvKK46LGNIP83VTdVzB6141Py2Wt4nGpBSHnsmgCQer
         DCekpRJaWKne+Xz2+AJwsQeBGgtGqrSBfP5G3ZfQvpBiD55r2Ww4/8/gS87G8IzPbMyB
         g/oazSyWUyKpZgWDZHma/n1XnUygYYHuSbEWRscYqCkjTLMZF5kGo/rHjBMmzhCx87nW
         IpiCx0yNKNKiWd02Is0jm+rS4LrgcHD2hvqAWHbEIH120G8sOCyEjXJdzOkEpoekkjiW
         4rzqwQ/FpoR30ZoPS1Gn7qPkokpav+qX/dq8+eLSPinRhr9bCEa/OJtiJBpTF50QW+z2
         dd/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CtUDm02A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a5d54cf000000b0034770ded2dasi586562wrv.863.2024.05.02.05.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 05:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CtUDm02A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s2VIY-0004zB-1D; Thu, 02 May 2024 08:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2VIB-0004pa-Kf
 for qemu-devel@nongnu.org; Thu, 02 May 2024 08:12:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2VI8-0000sc-Ul
 for qemu-devel@nongnu.org; Thu, 02 May 2024 08:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714651915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ikWj96zlpFwVj6lbjx7McjofJxQ6Bw1ZvC4+k1yCb8g=;
 b=CtUDm02A7XCn9mHwo2oZdY2M2AKGWRkdrfZCQ35Qy9GjUapF+OfDmad92ED1okxIsJqSPR
 Kqqlk88v39KVPIP4GMB4mdC3Ozytp4RHpiPyFJ3K6oDHsyUodJzUDpMFlBtbhDoM3k1/IN
 TuQg+3bGkzuvzqvXdsEq5+62x9gHuY0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-mWah9CdfNfmflhI00zDUIw-1; Thu, 02 May 2024 08:11:54 -0400
X-MC-Unique: mWah9CdfNfmflhI00zDUIw-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6a0e2e00bddso25810476d6.2
 for <qemu-devel@nongnu.org>; Thu, 02 May 2024 05:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714651914; x=1715256714;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ikWj96zlpFwVj6lbjx7McjofJxQ6Bw1ZvC4+k1yCb8g=;
 b=J8ji7CLp4OW1HXHcWpBuVgPhSoR2uDg4nd2Wu66oEBd/nzI9yjXUOvtAnVWsjyuic2
 smYpqPdSOjVRHVcFe4O2hFs0HnLRTiqdMechasN/sb6Sn7dB9fWI57JClRtFPGNP3NnI
 jRr6NoZJO5yrQebKv3ZnEb8U9CteAQQOElqC1QQlRsMFnsADFIOm9V3J4g+IQKUZjbGr
 XxZP8MaOmNw6zsbg6nTH99QL8cL2Ah3q+c39egEd4NTFg+03WBylOn6ZM7cidk6UfL1j
 xHYeOWB5uTHdqH75k0Fdo73ERU/d0phBJpnIgFLmLzIklbcjp5s34rgx15CpZUE0QdCP
 5NOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv2QeRsU23WEuzUQttrl2XO17Cm/PgtyUa7nFNrEPSijdkzQD4xRGYKkaHe9EpSdinQlI+7i+E2oJlIBT2FU4YkvdfcUc=
X-Gm-Message-State: AOJu0Ywlsq1tz23cKG/PkY1jn1DKvM/ce147yAKg2sRYMirnR8ZicuDC
 glCezQNTwg3n+RglIuDorVJ0orG/M0dQzLDmX6bppEDZK8z+rS++qn9gom8SH/UgmQ8vT/ufxef
 4LGlmrCRsnu8ZGzDYWO4IW3n9WAn8n1GAi3VbXfb+a0fGXxkGHErf
X-Received: by 2002:a05:6214:1bca:b0:6a0:6e36:c821 with SMTP id
 m10-20020a0562141bca00b006a06e36c821mr6105741qvc.27.1714651913741; 
 Thu, 02 May 2024 05:11:53 -0700 (PDT)
X-Received: by 2002:a05:6214:1bca:b0:6a0:6e36:c821 with SMTP id
 m10-20020a0562141bca00b006a06e36c821mr6105717qvc.27.1714651913323; 
 Thu, 02 May 2024 05:11:53 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 n15-20020a0cfbcf000000b006a0f99f884csm309013qvp.54.2024.05.02.05.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 05:11:53 -0700 (PDT)
Message-ID: <8aa16590-5a6b-4ee9-a8c2-ec6a2d20093a@redhat.com>
Date: Thu, 2 May 2024 14:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] hw/arm: convert 'virt' machine definitions to use
 new macros
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
 <20240501182759.2934195-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240501182759.2934195-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lFtNEgvNIUKr

On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> This changes the DEFINE_VIRT_MACHINE macro to use the common
> helpers for constructing versioned symbol names and strings,
> bringing greater consistency across targets.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

