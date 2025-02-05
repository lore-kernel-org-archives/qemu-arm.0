Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp97569dlb;
        Tue, 4 Feb 2025 23:15:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+OtTVV5roA/oZlyJ4wLV4qnpL3Mmv4lP05D9p7YY4WSP91qqdogLiawFelbqKtdd8y2JH+ys97JS6Nw==@linaro.org
X-Google-Smtp-Source: AGHT+IEHcAA9OWKwBN3MtHJFROHLL0fXbwPl9oy5E8gSU/+A4PC77Q1H/Fa8ni5+ZiMS/9JdyAHl
X-Received: by 2002:a05:620a:26a9:b0:7b6:d237:abfa with SMTP id af79cd13be357-7c039b3ca36mr304216685a.21.1738739734554;
        Tue, 04 Feb 2025 23:15:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738739734; cv=none;
        d=google.com; s=arc-20240605;
        b=A4/hpK6coT6lxwcLdfZTgbXMgco6iLE50yTA60Q+m1bYipP9C4bLQOc6FFO4db55Ll
         Y3FMJJKw/k8c+dypWkkD3iK1V88H7pfgyN/4JxPURk2r4IZJUEX3dhttQfsnxu85gvtg
         y92UJTT1WV3kl1yqaS1R2i2V9/HnG6btj8wSJeW97Cbc5y6OXKNbuTBlUCV/FD50mcQ9
         oFj3pEvAPuIjf8H6/HQr4BKYDbsflVPhuiDTR1MLoFmPCL7JX2PMr181horw8iXlOXpx
         euwYmStiP0Mez2i/KPGEPZg614wFMt/t8MUa7+34o8Meid8mTY3r8TAahyioJ+h2cPqR
         QciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=q08gyaOL1JIzvZPs/Oftw2VLYpHf3NNC58+jxMltE20=;
        fh=BYPm7e6EUtiPtt7mF4vBWeaNiyMOzH+1l+FbfB8qSIM=;
        b=f4WfEH0UNHFG3PbvkRv1sB6ml3w2njSrTaCSauDK8+MBaQz5ugEAP6SKgSE4/5Trk4
         gSCTolhcrvvHHDS/agBucWGCbIaq3i4z+40OVnXlNLNdlXMiSoDioAcSenuuF4yvXIL2
         Pdfe5qgbhAsqdXR1GtMuuGPa+1CuwoiMzkwe7osWGNQbFtK8gLGoO8XehUeeLHx0jGbe
         cVM/LPM48yUZVpWfrH4dqDoyQ/pkFXrRCojwvIMTySNAZUJNFotBPF41dsCFppyeRpAx
         6XwvV0QAxgMHfNHwP3+vm/Cp3pXwQwEWryM06UeWpJCMTrhKNCsBpsGI6tR1KmeX7h6E
         pbPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JG9efrBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db62f4asi505731285a.153.2025.02.04.23.15.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 23:15:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JG9efrBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfZcd-0006CT-43; Wed, 05 Feb 2025 02:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfZcb-0006Ao-O2
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 02:14:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfZcZ-0006Y0-0c
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 02:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738739689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q08gyaOL1JIzvZPs/Oftw2VLYpHf3NNC58+jxMltE20=;
 b=JG9efrBb6weY9Rb9k6qaF6W8kV+NvgPQy5NpLd/O8PG6UkNt4FNyV90BXn9WbDyTA2BDWO
 NWcnR9AQ3klplGQOdMjbjF+y2GYei8uuEStWjxm8s1lgf5Fe6znmwRZxQXtv5O7by0q9uK
 DvouVCM+ch06aPUv0Qhe0Y2dp5wzqCo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-RwWWZiU0Og2uYRfwoJjsCg-1; Wed, 05 Feb 2025 02:14:48 -0500
X-MC-Unique: RwWWZiU0Og2uYRfwoJjsCg-1
X-Mimecast-MFC-AGG-ID: RwWWZiU0Og2uYRfwoJjsCg
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab2b300e5daso724688766b.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 23:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738739687; x=1739344487;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q08gyaOL1JIzvZPs/Oftw2VLYpHf3NNC58+jxMltE20=;
 b=dOcqXbuH4zFHkHA0XES11hLJrsnuvWNC13T1Aoe0IAtVNeehUtnnADdvmdqEFIblsZ
 1diUfBm8RKmyHznf9BQ83fnh9D98wPz+/GCEkcGZhcOX5ssPSZlyUNyh+va/KK420QRn
 k/MjdnDf3KWi8vZQtkneQ4tMy8TPxqZd7hWHYQer3yi7Us9S9T+5In/0OYH28i8CV6ep
 8S9bMG7VEpVCor0OYuGRhNu1ioA4mT+1tAlLBOhd7+goJj5bITXDhaenDoih/TfhcHuB
 K8WSRe7GTxXUKsbB/lxtQ50rbjNSOqa8fbwOa2TyA83jElE2WLCn0qisbDZ+s7h8D9d2
 sigA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW35Br6EGDWKQPiz3rs85xXr/56u5aIwS6BZdKn2bzq3dLSc+PNDnMEfy3RC0FhRfx195okCfRNQA==@nongnu.org
X-Gm-Message-State: AOJu0YwD1sx/tFI004807rh08ZXhEPS+3qd3CIxO938DctZrpT23HjxC
 AbC0ocY9B5+yUZGG4QgTXVRuMb0I+tpj1+MWMmrh3QBlgN2QA1Ebc7G5lFRkmCEOQvw7gxVnhGM
 nfedXzmlYIoNOzqk6aiIAvVnv//Xl/n5aT1lBjunlXImBXLSN7Q==
X-Gm-Gg: ASbGncsZ5aDRpkbdYo52WkFFg1W+jzGHMGRa1iKLhOBAbkkVxIDovY7ab2LGfoYNqKY
 lqGVQAVNoaEp9a1DF6xy4TtkXG9MVMMFGUJdgSmljccME9DVZp1YE/mOqa4cbFu0uPfYHN5q8o4
 pXBJ2pJH11ntyVxl+lLXXBmJ0Bll0gsgZR9hOafPhS5YneUJ2ewZsKYLQzPiwA94CSSXtSAh9pv
 GgyyRYwoXQ649Kml++3GUmKkGu39zjNY+e7KIOwZ7oefGmp7GBHuyO/Ntz3ETOvy7Ls7fFHziAS
 q/1aYxGbJ/LrrZIm1LKbJvY4Hlw5U5xsq/0n
X-Received: by 2002:a17:907:3f96:b0:aa6:6a52:970 with SMTP id
 a640c23a62f3a-ab75e2335e1mr154669666b.1.1738739687300; 
 Tue, 04 Feb 2025 23:14:47 -0800 (PST)
X-Received: by 2002:a17:907:3f96:b0:aa6:6a52:970 with SMTP id
 a640c23a62f3a-ab75e2335e1mr154667066b.1.1738739686867; 
 Tue, 04 Feb 2025 23:14:46 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7656d5d5asm16241866b.48.2025.02.04.23.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 23:14:46 -0800 (PST)
Message-ID: <9d8874db-b95a-40a3-9d65-a8179bd6f938@redhat.com>
Date: Wed, 5 Feb 2025 08:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] hw/arm: Remove all invalid uses of
 auto_create_sdcard=true
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250204200934.65279-1-philmd@linaro.org>
 <20250204200934.65279-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250204200934.65279-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gRdcbionyQWeFyGxwnHkQjo9SLVO5N6L0b7AjsIYpl8_1738739687
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: +uXEQL6gFqcE

On 04/02/2025 21.09, Philippe Mathieu-Daudé wrote:
> MachineClass::auto_create_sdcard is only useful to automatically
> create a SD card, attach a IF_SD block drive to it and plug the
> card onto a SD bus. None of the ARM machines modified by this
> commit try to use the IF_SD interface.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed.c            | 1 -
>   hw/arm/b-l475e-iot01a.c    | 1 -
>   hw/arm/collie.c            | 1 -
>   hw/arm/digic_boards.c      | 1 -
>   hw/arm/highbank.c          | 2 --
>   hw/arm/kzm.c               | 1 -
>   hw/arm/microbit.c          | 1 -
>   hw/arm/mps2-tz.c           | 4 ----
>   hw/arm/mps2.c              | 4 ----
>   hw/arm/mps3r.c             | 1 -
>   hw/arm/msf2-som.c          | 1 -
>   hw/arm/musca.c             | 2 --
>   hw/arm/musicpal.c          | 1 -
>   hw/arm/netduino2.c         | 1 -
>   hw/arm/netduinoplus2.c     | 1 -
>   hw/arm/olimex-stm32-h405.c | 1 -
>   hw/arm/sbsa-ref.c          | 1 -
>   hw/arm/stellaris.c         | 1 -
>   hw/arm/stm32vldiscovery.c  | 1 -
>   hw/arm/virt.c              | 1 -
>   hw/arm/xen-pvh.c           | 1 -
>   21 files changed, 29 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

