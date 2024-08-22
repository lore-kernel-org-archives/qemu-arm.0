Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp614358njb;
        Thu, 22 Aug 2024 05:34:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5EuJwobTJlz115ej4DheR37sakSpaWHPgRf7VtAmA16MQ1cvXJo2YvgNHtbziS0Tqx2xnbUmrQjTiXA==@linaro.org
X-Google-Smtp-Source: AGHT+IHOXprf27LUGTjgqiJvmoOCsXI0UcHmFWTv8TwGJzWiUYr1spxhF1AQ5hdDW6ydgxjdn1tt
X-Received: by 2002:a05:6102:3913:b0:494:5b9d:529e with SMTP id ada2fe7eead31-498e723e974mr1631521137.26.1724330084369;
        Thu, 22 Aug 2024 05:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724330084; cv=none;
        d=google.com; s=arc-20160816;
        b=e9bEb+XuKYFgva+DPpZ/ILxYh9z9MTvqvn0iiLSjPJO/4ZTSzuu+4EzN6hI2/lJoch
         z/J6tMw5iS8eA1mIbazf/dLLrEnfs20RKP2D5abaVK+WCuGhLA/eqhmG4eRZqOUTHmav
         CCPdrzaRgSmowfU4cV+QFP20imbwOuzp8MwJaza9ERF7OseEluQjXSszd2MBl447m9L3
         DLG706a3FVh4wQN0NwgW87XT27SHX1POz+eRGuZfa5Y51VPygOYhGTgOlj4Z8dHiRh7I
         4kwc9wY9zZo4UE6MwmDMUGsaaO5ERUicVPB8fu/C4QTT63qOWZiiqRr2wtLm0Uec2WeK
         rzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=7f/QnDxUSjTgLu0p4pm7YaTL2f0niU/QqaZO0NXXYq4=;
        fh=xD1hNpCZdu+7wxo66t6tz5BwzQwE1gCNC6tm3RJkO30=;
        b=aiLXQWqg8Ow7xQjBRzZwbGRUknlEuO38GzUtPe9Nw8GWBRQ4C4tN+/NTATr41Mo+1P
         QZwZ00LqRpc08VVA+u6Gr6KQq4Qg/O2XzyKnHKmWHOJth0+TE0BQrodLkG1HDRYiS00z
         WAuuQs9FV7Qyh3bkNQXN7WuaewONAupH/xQxxJ4n4uHdJd0rlZ+Smv5pTw7hpv/I0MzX
         Hr0ZuKlBLrNNgH1mdCzpoztaSk54ZmER8Q0ud6iE4squu3Eb0JJYlYuO1T6IXCihDUMu
         vKACLtCx6UtwUNdyPG1gNBC/7RRwIBCARfim3mbLllf7n0sYES3SXRHCJ+mqpX3nqXP2
         jXVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hmuwzBtq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-844ce4e58e1si197787241.63.2024.08.22.05.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 05:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hmuwzBtq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sh71K-000318-6A; Thu, 22 Aug 2024 08:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sh71I-00030B-UJ
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 08:34:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sh71G-0006Qi-E9
 for qemu-arm@nongnu.org; Thu, 22 Aug 2024 08:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724330065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7f/QnDxUSjTgLu0p4pm7YaTL2f0niU/QqaZO0NXXYq4=;
 b=hmuwzBtqKVc0XZLPoakdjm6o6sgMcKSB0eqyVfMNTO0xpLFpZ1BJ1/t6uuskgqbkncrXuK
 FXqbMLsW1Qnob2l31uue4ivaDC256eCsOnlELhacZORftdXKXrD/BkQyxTxIyOik3QxOLc
 K6JaLsk6ju9kxR0BdNZDmYF4y+Vpy4M=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-Fxwd-HTUNy-oFvckdKFqPg-1; Thu, 22 Aug 2024 08:34:24 -0400
X-MC-Unique: Fxwd-HTUNy-oFvckdKFqPg-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6bf6a974541so7899886d6.2
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 05:34:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724330063; x=1724934863;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7f/QnDxUSjTgLu0p4pm7YaTL2f0niU/QqaZO0NXXYq4=;
 b=peaPbQW9aMYmMu6nJuknx7QvO4BXM9McbSdN5V1FYGaXD4lLp6NwmoALgtwS6qvaiq
 UQ4RIJjZEOB/8k5UnT5qZ3EysEkI/ryfSPKQA94Zhi1tqWDYBCMESFuN4gFclsqRMOhZ
 WSQ7KiEd4LuCgRBx6qKwAPpi+r4A1atfl1Ub3MVT6A5b7ikl7vz1oI/X938b7FVygdq6
 i5ryF4KXrI6yS5isH43OjqMFRkr2jWtaalfR7CC2ZEJOiruQlASBn0vIhhYmzKd/Sn/T
 1Wf8mLt2MsD7ZHD20uOtERX8ik5n0hdH8gu/yBhDlzVYrjGdlAW/63HnIy6cY3Hjpatt
 xDug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhOhgh2GXobSd+PYrY3nHVE1+CD2MTWMGD3fQGClAZ6i2wNKV1kmgB5Qmgw2fdhrVgyWPZXFmqxg==@nongnu.org
X-Gm-Message-State: AOJu0YxcJG6t4tJVTNo+Mdfeou53HD3MlSJzXKTnzAWFK1iqolENLRZ0
 ATw3+IvFeha7XIBdyIuDx7pj/wt+9VjUUvwzS6XBHJr2mLYGwEk9z8mNWT1ncnu252JkhDAiO7C
 gZhlQjFPEobEGPNf6SLcSegtKrf31NibDKPFOZQVWTI+ocqUCuA==
X-Received: by 2002:a05:6214:3d02:b0:6bf:93cf:f80c with SMTP id
 6a1803df08f44-6c164759f74mr21403856d6.49.1724330063592; 
 Thu, 22 Aug 2024 05:34:23 -0700 (PDT)
X-Received: by 2002:a05:6214:3d02:b0:6bf:93cf:f80c with SMTP id
 6a1803df08f44-6c164759f74mr21403466d6.49.1724330063137; 
 Thu, 22 Aug 2024 05:34:23 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-177-41.web.vodafone.de.
 [109.43.177.41]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162db0af5sm7016886d6.84.2024.08.22.05.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 05:34:22 -0700 (PDT)
Message-ID: <588e9b78-8442-4543-876d-81a45b894cbe@redhat.com>
Date: Thu, 22 Aug 2024 14:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional: Convert Aarch64 SBSA-Ref avocado
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240822114146.86838-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240822114146.86838-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5tvO0fKqK2Fg

On 22/08/2024 13.41, Philippe Mathieu-Daudé wrote:
> Straight forward conversion. Since SBSA_FLASH files are not
> tarballs, use lzma_uncompress() method.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20240821082748.65853-1-thuth@redhat.com>
> ---
>   MAINTAINERS                                   |   2 +-
>   tests/functional/meson.build                  |   5 +
>   .../test_aarch64_sbsaref.py}                  | 144 ++++++------------
>   3 files changed, 55 insertions(+), 96 deletions(-)
>   rename tests/{avocado/machine_aarch64_sbsaref.py => functional/test_aarch64_sbsaref.py} (56%)
>   mode change 100644 => 100755

Thanks for your help with the conversions!

Reviewed-by: Thomas Huth <thuth@redhat.com>

