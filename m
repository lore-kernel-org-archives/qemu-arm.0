Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1079918ejy;
        Thu, 2 May 2024 03:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIhTq/moiXGJcyhnjBJIMzcaNBRSLqjgj6dupqU0OWlt6cicKJlmWQ5bUtfNYGcTPD478EUELR58+rxeKTwCwgjQeAEabA
X-Google-Smtp-Source: AGHT+IFRgC/q0B3csAdAIb9onvGnzxKsLxfhUMsQZDmFpAzWK4TWOXcqQ9j6wdSpTnvFPktW9Ylh
X-Received: by 2002:a05:6870:80c6:b0:222:7000:8b28 with SMTP id r6-20020a05687080c600b0022270008b28mr2044771oab.32.1714647573639;
        Thu, 02 May 2024 03:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714647573; cv=none;
        d=google.com; s=arc-20160816;
        b=qXcFZ8WPO0JDkQCB/tTDQJOcyrNS/IkrDdSvX/gibfWUhyCCwVd2mcN5rC0IRuL6GW
         W0Acu4m6DVNsN3eXbH0E5CaDZC/sKNhvJtMQpdoki+NcwY7bUOvggSmXVaaFqrcXQaLe
         MW6nIY33+wI6cHdeVajW1LfTzyZVkBQ83HyJByQLAf0o3MmM+tOBOFAZ+EpcwxgRuaQe
         +3YOeER5xE9UZRsycGGHXiI05q/PHj8HlbBX7KLg0b9eTuKkz9KljXqPpgj6k/DOCg6a
         2S7AoWogoGn06XzOme95qSCrl5wE7jUuoaL79TupqYRkdENOGOPxbjx9vqL/s2hgGF0R
         gJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=EMx6e38IioNt1LAbYe0rkYAfMHsQHYA4fbzbwZk7bkY=;
        fh=xI5z+Y394CAEq5bKKCJ/wcjSiI43GqJMwsU3Zer5Ztg=;
        b=Nuq2PaBjeFMd2w12xu547cJWnsNoebSjRID05MY0oNePXzC2aNCKogeCCKmTBzyU5Y
         54hQvaJtYxdB8u7YnhreCD60QMk9k7S9YvIOmyIRskoiUt0tKajeOKS9Z9MPp0EXKAvV
         3s8C1RoqpjFBrYv5imiZsK0fGLzSmBAB0ooKjjoRnoH4Z5ycslq+LYENQL4xg9jDgaQV
         O4hb2gbcuHqV28muvDCNXsOFpyQVDgQFtz43KYNLr4GfGieKM6bmgwKTx5wcH7Pl9TMH
         OtuLfpslNgsqn6XFCVgi131KwSPkZenAf4DiaiIzanbx3FZZW2jdYzoIF+rLbRntsjiQ
         83lA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Izen9Xnd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e25-20020a05620a209900b007906785ebbbsi637658qka.716.2024.05.02.03.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 03:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Izen9Xnd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2U9p-0003Bn-Nl; Thu, 02 May 2024 06:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2U9n-0003Ar-7M
 for qemu-arm@nongnu.org; Thu, 02 May 2024 06:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2U9l-0003BQ-Ev
 for qemu-arm@nongnu.org; Thu, 02 May 2024 06:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714647553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EMx6e38IioNt1LAbYe0rkYAfMHsQHYA4fbzbwZk7bkY=;
 b=Izen9XndZ2kwEDHXgywWnp/Tql5osOV+9jS4sHuAxu1Nkuje/gtN0TDhIEXy9Kdr5qprMb
 UX5umX2If3z5VDm4FDj/jWE/CZNnv8YUSzfTCZq+GSHcQEf4c703nu0ocUWAxQD57l3F6Y
 cBqG9LJssLmuB05QxjK0R+QScqKuv5E=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-cjeOCpcwOcaXIQ7s61WOLA-1; Thu, 02 May 2024 06:59:12 -0400
X-MC-Unique: cjeOCpcwOcaXIQ7s61WOLA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2da2f30cb50so68199561fa.2
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 03:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714647550; x=1715252350;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EMx6e38IioNt1LAbYe0rkYAfMHsQHYA4fbzbwZk7bkY=;
 b=xHJVXy1wtvJQBg77H/Rj4RVc7+Fk0xWV95/8XnTl14qYfAlU+FUMgxr+2tXfdPH8Vw
 rIeazCR94d1+Eg48jGFQCDkTi7ng60w7Wgb3l3pQm3GOaKgT6OwNtBLriNLGlWc5IDnt
 MB6Z7d01FhypAe1pyNEAPMaM+0Wiw0GPWs7+nC2ADdGCkPG79aG345pBqDxAZ6XoQ3Cj
 F9AHKvl4+Z/nkwsJHWFpikgQNKw+wM8D6dLHGnjlKCpDNigaSqkyexlgoG2tjTaGa8Pm
 5x54RBVFv9c2DfIYTGHgWbA8m54zWu2der5p8USRnkXcycAvshPBHLNk7HYrua3I4HkD
 rwsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDaR71Sgu7OjHiSSPhhPtv+oknqLrqf6gAHcD2W9DwXkipYneAR4U5WbsAEYrlVh4y86IJ52qFk6NFwXvp9nFB3m2i
X-Gm-Message-State: AOJu0Yx/qGHnkLzPLASYikXZV/7dxcu4ukvSHIHH4XE2MOyjv9xEcipe
 L+mN8w8jvFTlcTclr/hfdxAjvfSk/mxwbs25j4CeJxoWn5enSwN6v3zPJYzSGit5L76Ep5CI0L9
 z1hLINldUJdVX5pONH0iX/PQywgyj3mPoZ5HG9x82cn4w5SMaqA==
X-Received: by 2002:a05:651c:212a:b0:2e1:ce2b:a55f with SMTP id
 a42-20020a05651c212a00b002e1ce2ba55fmr1353046ljq.53.1714647550710; 
 Thu, 02 May 2024 03:59:10 -0700 (PDT)
X-Received: by 2002:a05:651c:212a:b0:2e1:ce2b:a55f with SMTP id
 a42-20020a05651c212a00b002e1ce2ba55fmr1352983ljq.53.1714647548299; 
 Thu, 02 May 2024 03:59:08 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c154c00b0041be609b1c7sm5272315wmg.47.2024.05.02.03.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 03:59:07 -0700 (PDT)
Message-ID: <b8027831-9f15-42e4-aa52-a071dc7bd384@redhat.com>
Date: Thu, 2 May 2024 12:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] include/hw: add macros for deprecation & removal of
 versioned machines
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
 <20240501182759.2934195-9-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240501182759.2934195-9-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.476,
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
X-TUID: t/ac2iXnXGtE

On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> Versioned machines live for a long time to provide back compat for
> incoming migration and restore of saved images. To guide users away from
> usage of old machines, however, we want to deprecate any older than 3
> years (equiv of 9 releases), and delete any older than 6 years (equiva
> of 18 releases).
> 
> To get a standardized deprecation message and avoid having to remember
> to manually add it after three years, this introduces two macros to be
> used by targets when defining versioned machines.
> 
> * MACHINE_VER_DEPRECATION(major, minor)
> 
>    Automates the task of setting the 'deprecation_reason' field on the
>    machine, if-and-only-if the major/minor version is older than 3 years.
> 
> * MACHINE_VER_DEPRECATION(major, minor)

That should be MACHINE_VER_DELETION instead.

>    Simulates the deletion of by skipping registration of the QOM type
>    for a versioned machine, if-and-only-if the major/minor version is
>    older than 6 years.
> 
> By using these two macros there is no longer any manual work required
> per-release to deprecate old machines. By preventing the use of machines
> that have reached their deletion date, it is also no neccessary to

s/neccessary/necessary/

> manually delete machines per-release. Deletion can be batched up once a
> year or whenever makes most sense.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   include/hw/boards.h | 84 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 84 insertions(+)

With the typos fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>

