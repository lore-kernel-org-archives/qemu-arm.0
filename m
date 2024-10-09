Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp657655njl;
        Tue, 8 Oct 2024 23:59:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV79tO0Sxi9rXgGBesrEZ+Nh0zCuhdYoOXIIXJes4HYHYGOmzKPpGiVLWEub9KaLzjzI4mtbmPCmaVCZw==@linaro.org
X-Google-Smtp-Source: AGHT+IHiPGXnv6rmjiwpk4wMxFuFUm2ZJO5xVyqOCWZzvh1n+bXId6J3YSWLKqMwuMoNy7hOm3Yt
X-Received: by 2002:a05:620a:448d:b0:7ac:b1b1:e730 with SMTP id af79cd13be357-7b0874d7182mr249748485a.61.1728457154484;
        Tue, 08 Oct 2024 23:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728457154; cv=none;
        d=google.com; s=arc-20240605;
        b=Ez/mhC4xU6VTL3agIcanzkw7ABDeKZTMene4FkiieYR6oiBa6wpSvy8svYoMqTgjVp
         lZz787vTdL8XhUmXFkZy19zPNayF+vrbQzguNnFvo8lRr4HUM1ntq0/ocaT3hponpm/D
         5yrTjk1A6KgySB5FdoByGud2mdcHYZCB3YKxWprxOLpKANXUzvMied9FLpe1MlaA4x7R
         20ERbANZEqGvHsuOy6+G1U1mV4Ddc6/7xs3G5OIjoShjqQftIL7XxhAbrto9Shfyzl45
         Pb+HpqBBkIglFUfZ8omhJXS64MW7QV+PZ/7zrJieTVsVw38jw8GrfE2z5TZPM+8qYE9o
         A0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2bjpps8q8wyN4AxZ6gK8xYk17I3xUWKFTmCf2QHC7hE=;
        fh=1icVNiRiV8vn69wl8vSXLy+iepI5pGlUdh7NOUps9sY=;
        b=L01QFRAHMlMKMkYf4dGGRfJnAMj6evN/WaMCYw1HoQJ2IN4Omu1rCNgvMONNSlsbZV
         QORkqapSID7XWwi0ZXAGLfdi/BHsVZixkLqtVYDhEOhh7lHOZbWgzI4Y04QOPjUuRf+v
         rc+hHv5+qYxhhl4BQ3kCyHQV3jnbUrJP1bmqFinGrVTraeKGmNLP81ieVl+SSJWIfkPH
         8PIxAjgmvbeuNaesv0PWz+ldLI9LSFkVsnS6iKz5D9jpZUMn1YynGHeel82Hst207NjQ
         zRBXPZZwUbALHJ2k9DAGH3JyPNqF2plDRIBXrgyUzwQvGAScrVBW0TuM51HKTJDTRIVP
         NeOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=alk2QXRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae75616a2dsi1001860285a.68.2024.10.08.23.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 23:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=alk2QXRZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1syQf6-0005GN-4B; Wed, 09 Oct 2024 02:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1syQf4-0005G3-N4
 for qemu-arm@nongnu.org; Wed, 09 Oct 2024 02:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1syQf2-0005Mg-Ga
 for qemu-arm@nongnu.org; Wed, 09 Oct 2024 02:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728457141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bjpps8q8wyN4AxZ6gK8xYk17I3xUWKFTmCf2QHC7hE=;
 b=alk2QXRZipNUdd2E6SQ6YGEj8GSyKyxuBwSvcZCbuE2C1DpbHdcyKaXMRyf13r5+ZYz7D2
 OthHACOxs5ekHtZMx81GSzdG6bJWQGRHvWyA1cpNyDWM+JVfCVhz7mZ5Dl2/AG6n0FKjTb
 b3VC7qCnjaMPrs8Bf0Q5xtxIkBmyZq4=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132--CQRNxvLOlmW4h435b_FHQ-1; Wed, 09 Oct 2024 02:58:40 -0400
X-MC-Unique: -CQRNxvLOlmW4h435b_FHQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-20c5bcbc603so15466285ad.1
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2024 23:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728457119; x=1729061919;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2bjpps8q8wyN4AxZ6gK8xYk17I3xUWKFTmCf2QHC7hE=;
 b=VMCAvJEi7pgrUlmczaO3aWW2ASHaalaxOIMtGDaH1b1Jm7/8fAaf+YGjMnC/tZLeAe
 1hmgafch0UZTWJr2fjQCk/OETQeldsuK7551fYjnClQiZ1EixsaMjqrwB8Rg3TD7K6Se
 CunFEIzuqDNhnwR513BGZOqaeDis/dnmEQpWxpkLiVXomTsQRCOtgDzLtdLJRx8p/83i
 8EX1b1CWpsOfVQlesDoalSuiJowJN31yoCjaOiikVScGNyzZtMlXsiDyW2RH/zlNbRRI
 dbQCtEuUdgQ7facq35UtHHGRyuQQpHwaveXOf4KdEIHsqg4M+Xsyz8p29Ke/747jr+vK
 k85A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU06rQFy36k1JGBhxNJEyfipM0ferh016ji9OvLZpLrYcK5+YjJSRp4FvyEam6TjeZ6GfDbi6DGjw==@nongnu.org
X-Gm-Message-State: AOJu0YzDJiEGyi6kvOBMv4mFJ8DG8/WQkstLjtp6z8KcIA5ewjOKiVgl
 Hk0i/oUZD2JQLjYqSTrhPRPQF81CwAuButpQz2TvExxbb9aG6aiQI+UfwvARRjvMv/3h66atFUv
 QuLCWIpew5eHggAPVkqhWTi6SOiuz4G9Qg2zJSyEC2sSJGkFCtw==
X-Received: by 2002:a17:902:d4d0:b0:20b:5351:f6ab with SMTP id
 d9443c01a7336-20c6378eb2dmr21798845ad.53.1728457119650; 
 Tue, 08 Oct 2024 23:58:39 -0700 (PDT)
X-Received: by 2002:a17:902:d4d0:b0:20b:5351:f6ab with SMTP id
 d9443c01a7336-20c6378eb2dmr21798665ad.53.1728457119368; 
 Tue, 08 Oct 2024 23:58:39 -0700 (PDT)
Received: from [192.168.68.54] ([43.252.112.159])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c13930b92sm64518385ad.128.2024.10.08.23.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 23:58:38 -0700 (PDT)
Message-ID: <ca04ffc9-df13-423d-b864-71e0395ce509@redhat.com>
Date: Wed, 9 Oct 2024 16:58:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/char/pl011: Use correct masks for IBRD and FBRD
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Zheyu Ma <zheyuma97@gmail.com>, qemu-stable@nongnu.org
References: <20241007144732.2491331-1-peter.maydell@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241007144732.2491331-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: i2gOXGh7mf72

On 10/8/24 12:47 AM, Peter Maydell wrote:
> In commit b88cfee90268cad we defined masks for the IBRD and FBRD
> integer and fractional baud rate divider registers, to prevent the
> guest from writing invalid values which could cause division-by-zero.
> Unfortunately we got the mask values the wrong way around: the FBRD
> register is six bits and the IBRD register is 16 bits, not
> vice-versa.
> 
> You would only run into this bug if you programmed the UART to a baud
> rate of less than 9600, because for 9600 baud and above the IBRD
> value will fit into 6 bits, as per the table in
>   https://developer.arm.com/documentation/ddi0183/g/programmers-model/register-descriptions/fractional-baud-rate-register--uartfbrd
> 
> The only visible effects would be that the value read back from
> the register by the guest would be truncated, and we would
> print an incorrect baud rate in the debug logs.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: b88cfee90268 ("hw/char/pl011: Avoid division-by-zero in pl011_get_baudrate()")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2610
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/pl011.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

