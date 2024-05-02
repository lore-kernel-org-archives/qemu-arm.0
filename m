Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1116521ejy;
        Thu, 2 May 2024 05:01:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpR7Us32sBABrT15hLybh0xI1iiDNeggRnebdolhMD1UgqUFw0U0bROOACbjQezxYk/NHP5Wp9LGT9XpJpqz1luHKNM+MZ
X-Google-Smtp-Source: AGHT+IFhzpBjb4C0leHZWbS8vYBnuMAtx1j8ZoqNST7lICLIMNq362hXWAsA0VRfRPlLGAicyKea
X-Received: by 2002:a05:600c:4f84:b0:41b:82ba:7997 with SMTP id n4-20020a05600c4f8400b0041b82ba7997mr3611661wmq.3.1714651284001;
        Thu, 02 May 2024 05:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714651283; cv=none;
        d=google.com; s=arc-20160816;
        b=jA5rB6SHa13Xg012+EvvlmS8tuu+Yx45sqqq630cQ2az4sC7UPjq3duvVcgciff4qd
         Hp/V7fG1jKYeOeYxZ7AHTgfXYS39lsACS48KtrGm5WXDb5FpnO/5g7MjlbvsLMubqiPL
         mIVn284SmeHhLlVyTzlo+H6FoMSNj126E9GhdaoF6r/dnfE4xCYn8OgkmGPctOTgBHrK
         OhJkG08NWKPT0icj4DnbD5CbOrV5pUnxACjOeFw5Ca6SsUmLqGGvPt41qsOxFTcQbtt5
         OeEI5B25YhnWqvN6iXaJNiNQItLvgYG1bJYojnYpMwFJiFLtkmgo7VU/+NEB/ZCzWesE
         bATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=vbD6IhTfoN8vpOu/3tBLDauAxSNQNcFELCBXYOEbW78=;
        fh=frMJVDFkStTIa09sdmQ+fv5cUJoVkIeX3CcntAO6UQg=;
        b=jh8Thxf8bnupJdwTUcBHIbJNgtkysV0D+uDyCYyuOOBiCdEe8qojo4n/eEl/3yUybN
         dQIlwB3Tho3DkZ/Rnz8Z/hpGWo7aNesZo29gKtW8jaAxsFb4aI5qXs7hmPkq1FKDquje
         pxF4G3C1J20BWOWczBfng/wnMCqSJgm0RbYxZcL6VGeaXGkDQaHJG/7/h4cRrCJ3X8qN
         szGtoVDnseX+LAOV5eOuagY1qclmWlC6F4lYFP6AIZ1ZL5oiTHbCPQ/hCM5ZR3gP0fTW
         fhE+invNRtvBySbCffdi9qACTZ4wG3EC6pb44l3hzcOjoCVW8Fv2EH/Lvn+M5SJRYiGp
         QA1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RxJKvgNI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a5d648f000000b00343ccc8efcasi600922wri.341.2024.05.02.05.01.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2024 05:01:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RxJKvgNI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2V79-0003T7-Fu; Thu, 02 May 2024 08:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2V76-0003Qg-Sz
 for qemu-arm@nongnu.org; Thu, 02 May 2024 08:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1s2V71-0006gy-Om
 for qemu-arm@nongnu.org; Thu, 02 May 2024 08:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714651230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vbD6IhTfoN8vpOu/3tBLDauAxSNQNcFELCBXYOEbW78=;
 b=RxJKvgNIUNkDfn4WI++9ajjiouo6PRbvDeLgLsMZdmxYFhgSchFsOSqCYrAKTs/tW4cOQ3
 RD1i1IBnOnnyujVmJlKvpsoAOwvx9uFk5a5sUwyBt4bumn5Rnl0lXks9xNGUFcaup5m7Z1
 InnqY60sbVU/beeBWRCoBCpLMQYo3FM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-h5X5vqb4O4GZjIjnsWw0SA-1; Thu, 02 May 2024 08:00:28 -0400
X-MC-Unique: h5X5vqb4O4GZjIjnsWw0SA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-418f5e7b9b2so33052085e9.3
 for <qemu-arm@nongnu.org>; Thu, 02 May 2024 05:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714651227; x=1715256027;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vbD6IhTfoN8vpOu/3tBLDauAxSNQNcFELCBXYOEbW78=;
 b=gxkj6HTeK/7pHAD5OD0SCgQObNU9JCZwvLbYo57vLhLJjmjKdbRXXzZDNUCbZKToJk
 tK72TozZbL9jnih3fVuunxYVOdVUezYmFeqYB4akfkJUkSGISyx8s8LvP4WZhWUFF6pC
 62bT6rOhe6itFsYYbjvx8ezahPHjH0RU2Qc63R3Sn+SgpGW23Ryamp7gwBY542MNDesw
 mpf8W91K90DfarCkr7FrFjv2FZE1SqMW6vMkJua4XqnEZAREfl0BCZ+rjQPlEFBytYeq
 8753P1nQoyzrlJT4LbBQO3uQqYvbGDa/uqOjuev8WIA6h9HQgoMKEbgwptt9lGB5X2DA
 17cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzI0DfIfPY7hBVRKFDCWUNxgbWEqbP/DHnrZB1Fn8kF9Su9ITI6E/Iod8MrQ7XgvEcR1cyIVmSBwCvU47Ay3wG08xy
X-Gm-Message-State: AOJu0Ywoac4/s2m4Fg+3lolPmWoEWxxBeiwe5L51jVOuTUWxEwwBU/d0
 bOJhOqqa6m1U60COt8Q3GKVZYEAejl0PowuKyVeomQ/7majerrQJznZ3FPkSTbVUe6/fWL0WhB3
 oMPVixmkP6nhqylecXHGDdSKEwDztOUAP54YxsXzyZHOuMpV1bQ==
X-Received: by 2002:a05:600c:4e0f:b0:41c:8754:8796 with SMTP id
 b15-20020a05600c4e0f00b0041c87548796mr3695920wmq.30.1714651227318; 
 Thu, 02 May 2024 05:00:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0f:b0:41c:8754:8796 with SMTP id
 b15-20020a05600c4e0f00b0041c87548796mr3695890wmq.30.1714651226959; 
 Thu, 02 May 2024 05:00:26 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-34.web.vodafone.de.
 [109.43.179.34]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c469400b0041bc41287cesm1739412wmo.16.2024.05.02.05.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 05:00:26 -0700 (PDT)
Message-ID: <efe51df4-68d5-48da-bf0b-631594f603e7@redhat.com>
Date: Thu, 2 May 2024 14:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] hw/m68k: convert 'virt' machine definitions to use
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
 <20240501182759.2934195-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240501182759.2934195-6-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
X-TUID: UbB7ywuT+ClZ

On 01/05/2024 20.27, Daniel P. Berrangé wrote:
> This changes the DEFINE_VIRT_MACHINE macro to use the common
> helpers for constructing versioned symbol names and strings,
> bringing greater consistency across targets.
> 
> A DEFINE_VIRT_MACHINE_AS_LATEST helper is added so that it
> is not required to pass 'false' for every single historical
> machine type.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/m68k/virt.c | 51 ++++++++++++++++++++++++++++----------------------
>   1 file changed, 29 insertions(+), 22 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

