Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp936113njb;
        Wed, 12 Feb 2025 03:49:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW4HEQ0dTVHUjTT0O/Qdo/ALPMyr7Ao4vXfpjm2QMxD5UXIHSn8RHIgL22UBYEhLR0hic/9JZMRPQ4UCg==@linaro.org
X-Google-Smtp-Source: AGHT+IHfedkB/JO6CCWwNE9suBgKO31IZ/6aO8LZJ/7G/UaNQ1gIF4WT+Y0Hl0FS7XPhARAUIMmM
X-Received: by 2002:a05:620a:618c:b0:7b1:527f:cf4f with SMTP id af79cd13be357-7c06fcce9f6mr416111185a.42.1739360983194;
        Wed, 12 Feb 2025 03:49:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739360983; cv=none;
        d=google.com; s=arc-20240605;
        b=ZUOBPyL1mH7tZQk/3uROPbD1AdogpWiS/2SewHOGO//QEZ1cIkeSWmI92kZmg8E1Pe
         QarYnpmQeRQYt5Y/kGEI2AOFBL6TmbD2rq0DtIdPSnhxsJ708XaT71dmfSR/E/3DkYnC
         hY1dsScKYVTHgYQkNsTuKzxLD7cXYCOaC5wZqlLvY+oO+XPdXWnPmWr/9KZQt9eUwxvo
         ryeVGlBJfsv/wAZJ3+x2eoYAxQlS0f+cPj6iGeXhM6xPodrbPP4AnaZ1pO+fvirvqi0w
         Tovn4IKf9WAkIelmCYxIfdehAZduPNY9vgyxdSgBwQKekCY7qc7tzNMWlrC06jjlLQ/s
         zsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=PZNpFVnsh6lshbKMRE5Z9zohd8VxnEo1QVzFiZkw9iI=;
        fh=16Os/njb5PrbvwZ/h9wlR7UKgNe5RKNEN0Gt61oVCTM=;
        b=OFDCVFw7vEr6NxutYpfzCCWFrVXb3ciP+Ty+ggtLM4ZcK/GavVHRgQJBbT/t3nL+1a
         Gel+SewyjSrV5626WgMQeZpSv8YhpJVWQew+B6I4Z1cmFUSGEMtr/C1i30z5SflwOvZg
         MbpG3Ku5TK2jUhbdgHkIT36cjIgr6LzzTA6m6feS6Mfr+lqOj2u38//yTOCY1c8my+/3
         MqlV8UvJTjzZj8G2UUn8gb9nOXWC2F6OYIlhKwddweFqmEoAXzfmLwqukDmvcp2Ttf13
         IXh7/d6cEaGKP/360oDoYtg79gSAm6yCcm0PtwSsqGvJ/uvUlsEYfs7RvaoIyCp+3cFy
         JIEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CprXHWiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041eb4df1si1312549785a.387.2025.02.12.03.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:49:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CprXHWiC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiBEt-0002cL-SR; Wed, 12 Feb 2025 06:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiBEt-0002c3-7m
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tiBEq-0002pj-Ro
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739360947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PZNpFVnsh6lshbKMRE5Z9zohd8VxnEo1QVzFiZkw9iI=;
 b=CprXHWiCT1q/vRhsQDcci38m5/XaZpSv3Eqo+kLP3qFaW0qeDqmPDhR3qgUbI14ghVs4sn
 /mqrO+PnmbDQ3gFODLk8xt+AHJntRPK2fyh1aaOrf/jyJH3nlABOajErme3E8arli2J5k1
 1GX7nwo9fiyf2qfGUJYS4i1ooHGbfpw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-kIvAxZu4Mc2SHqit3V_zeA-1; Wed, 12 Feb 2025 06:49:05 -0500
X-MC-Unique: kIvAxZu4Mc2SHqit3V_zeA-1
X-Mimecast-MFC-AGG-ID: kIvAxZu4Mc2SHqit3V_zeA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4393e873962so18755205e9.3
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360944; x=1739965744;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PZNpFVnsh6lshbKMRE5Z9zohd8VxnEo1QVzFiZkw9iI=;
 b=picFoV1JcL6BlDVXjArdYtpG21P0mm+CEALl9Me/QZLyJQ+gCm614jdaPVkBKZiSPe
 4X5muM8om6f1BOKk5DXWbFkupvk8aU4LJPu2hsNoR/0jAupyU1sVRCmqlko0+9TdHwFU
 9MwizKU3Yz0ULlNWZZ8Z8npDxt/OJ+1I/3VAAgnudpdisPi3ZsmUC6kBsGbKCSnS4Uxn
 hnzoKWRxGHtZ2EfwMfyGsHcbxfjYlPM8e1ocstGtKFARJ3EAzjoONs0G9GH5tFVVGYZN
 o5N06Z86KVU7RahdibtQSFNB8GdPet6MXJ48xxc8y/8Xqq5ZOnb4GYFMYLw3QINDSNy2
 IGhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWamNuK33+tvAa7BxluMQ/Wf+hIhn3H7COKmZWEYKD1lR22wK5ZY4oyIhY1OktM7scrkV2uWcNMVQ==@nongnu.org
X-Gm-Message-State: AOJu0YzykGf4cfsfs8PLc4lXkWp+DdtiQaJUm/iljS09tXOsDXAAwKmc
 5WcHLLBc0H0OwXC0+/UxnQDIR6wmVPU5KDsIXVS2Jv771xHLIA3P4tgKHdQ2LX7/Cdg5SYzxXJD
 nMVrRm8nmYI1p+p6ROh9tOHCHvDyYhScTLsmx9AzjFP56Kc4TXw==
X-Gm-Gg: ASbGncsWBQnoTQFDLgpRyT79WD0pzM6oYdMnulEEJ+ycxkMw6XU08qHEn+8Qi86Ag1+
 E+hBVkPEI8zqRQAk/O8b+wDJb7w/0AxrDW6AyBI5QRR4py9XNL2DaMsHnddh6n2C2Vpf7tc0tlR
 POjUE5/W6xN8CtIrvM8nnLswixt3C9hR1KWxyT4mJisOCuMyYE8qRRj8DPg244h9pGN2IBN6F1o
 MzP5BDEV9D7fb8EMsjaSLas/McQWIsbzcHjciLQXf4hwf+86VMqOdIrozTc8v7a+jG2GuqjfY9l
 uhQSZGS4TBiHmZs2ZiIbu15ZFPCBLQrqnw==
X-Received: by 2002:a05:600c:19cd:b0:439:54a5:dde9 with SMTP id
 5b1f17b1804b1-43958188eb8mr27738295e9.13.1739360944609; 
 Wed, 12 Feb 2025 03:49:04 -0800 (PST)
X-Received: by 2002:a05:600c:19cd:b0:439:54a5:dde9 with SMTP id
 5b1f17b1804b1-43958188eb8mr27737985e9.13.1739360944207; 
 Wed, 12 Feb 2025 03:49:04 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-37.web.vodafone.de. [109.42.48.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a04cd53sm17806975e9.6.2025.02.12.03.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:49:03 -0800 (PST)
Message-ID: <86753d5f-c9f8-4107-91f3-4477fe44cc73@redhat.com>
Date: Wed, 12 Feb 2025 12:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] tests/functional: Avoid using
 www.qemu-advent-calendar.org URL
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-8-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250212112413.37553-8-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J8O900KcJ4xbufbrmQqt15Az4oenU5_NUq8keVtcnLk_1739360945
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: DqRO4gXu4lW/

On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
> Avoid fetching assets from www.qemu-advent-calendar.org
> website, prefer fetching microblaze assets from GitLab servers.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/test_microblazeel_s3adsp1800.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/functional/test_microblazeel_s3adsp1800.py b/tests/functional/test_microblazeel_s3adsp1800.py
> index c382afe6bfa..5bf94d88dd8 100755
> --- a/tests/functional/test_microblazeel_s3adsp1800.py
> +++ b/tests/functional/test_microblazeel_s3adsp1800.py
> @@ -18,7 +18,8 @@ class MicroblazeelMachine(QemuSystemTest):
>       timeout = 90
>   
>       ASSET_IMAGE = Asset(
> -        ('http://www.qemu-advent-calendar.org/2023/download/day13.tar.gz'),
> +        ('https://qemu-advcal.gitlab.io/qac-best-of-multiarch/download/'
> +         'day05.tar.xz'),
>           'b9b3d43c5dd79db88ada495cc6e0d1f591153fe41355e925d791fbf44de50c22')

You'd likely need to adjust the sha256 sum as well since I repacked with xz 
instead of gz ... but according to Eldon, the original download should be 
working again, so I'd suggest to drop this patch for now.

  Thomas

