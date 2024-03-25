Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp719808ejj;
        Mon, 25 Mar 2024 07:04:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0U+LiaXH9BJBDRbIz/wC824Jg/JpVstcUbkT/vJ7wA3pcEho1J8K+Y5dh+ebLFWU3d3fQpv3F5b/JMRrh0ju+rDvqRpw2
X-Google-Smtp-Source: AGHT+IFpdXKsBVy7hUNF3iIyRyYRpgPpCUNCHxYNyz5zSwfi6ACEh+v6WnAAE/ZvrPpBkt323aiw
X-Received: by 2002:a05:6102:3592:b0:476:c65b:10a1 with SMTP id h18-20020a056102359200b00476c65b10a1mr5899653vsu.2.1711375475723;
        Mon, 25 Mar 2024 07:04:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711375475; cv=none;
        d=google.com; s=arc-20160816;
        b=BGCqfZEsnHTVR3UjkHNhQMf7xvtw62LhzH8busRLtTnoFBHmY1pKN0tCObM/RoDuJJ
         fOb6ZSYbEaPRkTtzdPPBjXKjhkeEwXD3/c9Fwu4Yf+2gPCYUnkocR+TwqRz05oaezCfI
         7AZnq42TvA5ICJupW1De6I/YzUrvZ+z0IGsRKQM52IFPFDQskkOlKVAJxCRfW1uIc5lN
         S8B8Dl97sSWmpC6wR4Xgns8UToPZ0P4Ysc/V/lGLCOb21dUgrmiks+c9InJMbxzt7nPb
         obmOSRcrJbFid3M/6scb52RW8YSXdfenA29UsZaiR1zEUztl4pqSVxtzjuldI4xrYICS
         /XBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=/6lLN9ZTXd/Wo2XoE5NwtPmRKNtG8azFkGIpKl9RGyY=;
        fh=KWB4HA5McOiKGxiuPbYcjm6J2Te724EjOLxXluDgf+U=;
        b=ogq19Dsn5BLFXx0mQqGNUHy/wxui5BinH1GduVWGrEK4XGA/sgzUjy90P6sYBKIeqT
         D1bp7fBb2nIoUdfg32aS9yRty1SVhsYdzLLybqYEVzg+8wmcT292BWmwpnPkn01X2xij
         d9jZDSzq0PUtUsgB1glEP3hd/gKCdMREz3s9q3TX5xZE7+hDEuXFlI4KtI25DhqO+MM0
         gxKJDoNgWsSuKDcrCyx471xttdro1jYa/En9LedUZv806mm0fYeNzDHfOZMWhu/pre0Z
         c8JJRegPoLdA7xXWCc1Y0JDSYYf/QyuAOUIJ6VHHEhARU127bPCB9Xq55o47O0kwXWAn
         hOGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=esY5LQZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020a0561020f0800b00476fb72642csi172509vss.274.2024.03.25.07.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 07:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=esY5LQZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rokvz-0000Fz-Vw; Mon, 25 Mar 2024 10:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rokvy-0000FY-JR
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 10:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rokvx-00047L-BH
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 10:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711375456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/6lLN9ZTXd/Wo2XoE5NwtPmRKNtG8azFkGIpKl9RGyY=;
 b=esY5LQZc5+lK+9MalgKne8D/3Hk3NiisH7WKVd/B2D8x8dgIwIIO3GQyu8pgIG6KQWJQK4
 7YWJ8K7U8gARvWdM2HT6vBvufUNH+9MsAH/8vMmGDtSCk1cnWKrtTo7Y5LEjkvHTQjJZOU
 RvHK7tSyL9syjKlGh59vrKtTBS2zCkY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-wPuUiEqrM7-qUCCMregghg-1; Mon, 25 Mar 2024 10:04:11 -0400
X-MC-Unique: wPuUiEqrM7-qUCCMregghg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4147de378b9so15595905e9.3
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 07:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711375450; x=1711980250;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6lLN9ZTXd/Wo2XoE5NwtPmRKNtG8azFkGIpKl9RGyY=;
 b=VTWyBmduHV+gQTlEXZJKNvIVB9T97MDme6DcR9wWoA71qUsjdazvyC+sMS3qzpLu3a
 0AymZ8ed+qEbJ9zSLsfCnRKMZhrNsGZtqfS4FC2EZWO+RADnQfQBTit0aSPQh0eoYecq
 nkxIa6Ov2lQo8yv2j6pHPX0cDcD0BrsacFN85az/rutWm7/fChRtIy3oxHhWsKuIq0rP
 6wLnOShF0BnXDWzeRqx4Sn7Uqbk5H0Imw0m9f9xdsoAJJMpHDrk7Nh2y5McBZFh8JRno
 08FC1BXWm8jdHuzDdUKS0XMRmsn8n0/GQBObsh3vs5YfoJiO3chLt5hpWzHuWGLcTtu8
 FJuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2JHybNIfYMG2cp3nqVqs++FlNjkpRic/7p15qyGI9kNv+78ZU5S3iUFPcKBUlwbc9mjJ+Q2x8ysIWKN7ieT+HNATe
X-Gm-Message-State: AOJu0YwmC//0MFspeFnajj6yRlAKkbzvgKcvWuR8uMav2siHBo8gYKy1
 3OwoywHB5rtlF0ucLopqxmGQUvxu4BeDOPZ6rz1aXYwr780cqwQ0dfULQvZXdASQ5nvtUkB3FJK
 vIPZyO+5/Z1ZBNSr3qhVMOmYQseR05tvoNVu1WaZK4+qNtNkHrw==
X-Received: by 2002:a05:600c:4f85:b0:414:ca1:650a with SMTP id
 n5-20020a05600c4f8500b004140ca1650amr5033704wmq.30.1711375450799; 
 Mon, 25 Mar 2024 07:04:10 -0700 (PDT)
X-Received: by 2002:a05:600c:4f85:b0:414:ca1:650a with SMTP id
 n5-20020a05600c4f8500b004140ca1650amr5033680wmq.30.1711375450467; 
 Mon, 25 Mar 2024 07:04:10 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-176-158.web.vodafone.de.
 [109.43.176.158]) by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c450c00b004148619f5d0sm5696322wmo.35.2024.03.25.07.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 07:04:10 -0700 (PDT)
Message-ID: <7ce93c0d-fe4a-4333-92b0-16c8efa53dad@redhat.com>
Date: Mon, 25 Mar 2024 15:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc/pca955*: Move models under hw/gpio
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Glenn Miles <milesg@linux.vnet.ibm.com>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?=
 <fbarrat@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20240325134833.1484265-1-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240325134833.1484265-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.065,
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
X-TUID: Vf+mbEQp73fG

On 25/03/2024 14.48, Cédric Le Goater wrote:
> The PCA9552 and PCA9554 devices are both I2C GPIO controllers and the
> PCA9552 also can drive LEDs. Do all the necessary adjustments to move
> the models under hw/gpio.
> 
> Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>

