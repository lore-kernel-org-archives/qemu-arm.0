Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp60762njb;
        Wed, 4 Sep 2024 03:05:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+UqepTdj+up2o6ZL94xu8cM87K7w4Wdu60790Zp9yXdws9uq3+eDHrRrXIbARcDNZLsqx4OqYn+p/Sg==@linaro.org
X-Google-Smtp-Source: AGHT+IHFIbGd5kt5Cgbg/9HS3CT1w2uVYPayGQ24yhb7OpjIj7GjRFjenr4FUS5+ECxvuPdzi78x
X-Received: by 2002:a05:620a:370e:b0:79f:556:5f31 with SMTP id af79cd13be357-7a8a3f75175mr1662026785a.37.1725444358244;
        Wed, 04 Sep 2024 03:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725444358; cv=none;
        d=google.com; s=arc-20160816;
        b=JZdeK/EVV0nFStz/rI0wzRD+yJAQ1hErSnw7V/2xKMkqLjjT4Xq2qzsyEUub4NsVbr
         54S/8+JRV3ZAsvrGLsarqT4CMSZ9XBb/cQz2lGxgNDm7U6Kx3+o+bBFC3mfIVJIwCvKU
         wJzukqoyFsjGFU0X6zdtOh52UWsKnokuYmPDPyyaXiAep8X1KJ67x7N79ZjhpxAxg1V+
         QKzDljP3apW+0tJLsqQmH77lVLaKkVOtv9AjZNDljeCjolu0Rv572raDeAQ4I0UEaQS8
         ppNSLiKZRaCm6wO8KcCQ4V2NJVeQaWxSnCVXivvsUTOUorw12kb5zOVEien904PtuUjj
         cYrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7lSGydRYXFCmXlYXF6vh7kwKzllp4zk8QKaHYt0pgso=;
        fh=Ucek8M6sg0TSm0TrkPsE5QAMridqv7F0z0+NnFWvSwM=;
        b=k6A9CcgxL1s3ZACaNZpXT9cmEz3HOP+SUjaiUwvSvIsylwZRCzK1qy+mUaDof0WtTI
         63j9fnUyuR4LpMee69OXw1QcyJgusN7ps3ZTV28ob7MXYYyeGCjgPYJywHlvQGw8DVdX
         jyXZbFWJ+c/ZsXqEpGXZmGD7lzX1qv7WfQ23Pn+L+lMqWBDIUxOP2fVYN21P4mt3jWcu
         pPpdwZITxO8zm0nhT1+UuK1Ga/c1quP77WRwm9ytmYw4KUgbHSGtsiBIy0ZtH3io0XNU
         kVJH2mhBZAeOGu1wTQs2OZxJI7VB1hnNYZSfYEZorP48GlO0QQW/KcoAMzmkdJR6rsJH
         IeMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FXbEqugc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806db68besi130435485a.570.2024.09.04.03.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 03:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FXbEqugc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slmtb-0000T1-Lb; Wed, 04 Sep 2024 06:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmtb-0000QI-0D
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmtZ-0006lb-Dt
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725444348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=7lSGydRYXFCmXlYXF6vh7kwKzllp4zk8QKaHYt0pgso=;
 b=FXbEqugc0HSZdKO32ljazeyTqw/3Sf5UnQyAjsDArWxwWRiKvIqO2JbMSoZYp0TJl3VGXD
 qunT6LMWBrT6X8k40z0qCCihI0juPpHUtTW45JN2+I4uR2+kcdh6YvXqOqptPa8//iOWvT
 5CizEfTsk2DhZTcNr86TRnCcLymSuQg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-8kRWv-CSOsmBfd1OjCi1Mw-1; Wed, 04 Sep 2024 06:05:47 -0400
X-MC-Unique: 8kRWv-CSOsmBfd1OjCi1Mw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7a977382875so269855185a.1
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 03:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725444347; x=1726049147;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7lSGydRYXFCmXlYXF6vh7kwKzllp4zk8QKaHYt0pgso=;
 b=SdF8tNsLXruU6vvGKrtaqAZ6n3gmxWk2A4H1g/D31ekBw4Zurl0DOiXnFKW+sxONO6
 Bq8uzc3fVvXLjbGbktXKMhAkhl3FrVR2EHORWoVOYYmSel5RzccbgUfsCQiWBgCwaRaQ
 5eDeSklTGuNm35OatdipjrMlLbHnimmVJ86tE1X/UahfjgebeR2cZFH/bT6fbb5aZ1nR
 8mMJ7tcriMPnpihW5iCxANVj2XGKJar0KYBt58upt476STxE4oE2+dis6chfCC2mfyWT
 YR9ppfr3qcFVAeadkwZk/POqXblUw8KKU0jf/TVLsHj88aEIiVtOZX7GTgM5uFfbe1hU
 Wijw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4PHbaXDcTLT+U8V/BMrxaukh5Q00STfEauoJ5iW+DGAjNjAaeG0P511WkbYr2BpVKA7c4SbNEMA==@nongnu.org
X-Gm-Message-State: AOJu0YyCC+20R/BdanB+4KH4lyrbBBYZnd4QeWoHXTj/SQjZXAtLy5Mm
 3ZBv8pJdlk4eMiDXuGj20ZRH174mHEOyx87qTJpRebOwr7uEMuhizmOmTxRSGOd4ZuS4D3O96Ir
 nSJfoMTOrr+wD82TAaCokQ/fkwQV7Kp0G8xqTNDEYjIjdrs/aYHvyrOFDBg==
X-Received: by 2002:a05:6214:18e6:b0:6c3:55e8:e291 with SMTP id
 6a1803df08f44-6c355e8e3b3mr116852256d6.1.1725444347148; 
 Wed, 04 Sep 2024 03:05:47 -0700 (PDT)
X-Received: by 2002:a05:6214:18e6:b0:6c3:55e8:e291 with SMTP id
 6a1803df08f44-6c355e8e3b3mr116852116d6.1.1725444346809; 
 Wed, 04 Sep 2024 03:05:46 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c340c967d8sm62229996d6.91.2024.09.04.03.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:05:46 -0700 (PDT)
Message-ID: <3efe0231-2df1-439d-ae50-84a510c5fcdb@redhat.com>
Date: Wed, 4 Sep 2024 12:05:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 31/53] hw/input: Remove lm832x device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-32-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903160751.4100218-32-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: VnxdtnWVYx5i

On 03/09/2024 18.07, Peter Maydell wrote:
> Remove the lm832x keyboard-and-pwm i2c device model. This
> was only used by the n800 and n810 machines.
> 
> (Although this is an i2c device and so in theory available to create
> on the command line, in practice it has an outbound IRQ line that the
> machine model needs to wire up, and the only way to inject keys events
> into it is to call the lm832x_key_event() function, so it isn't
> in practice possible to use it separately from the n800/n810.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS               |   7 -
>   include/hw/input/lm832x.h |  28 --
>   hw/input/lm832x.c         | 528 --------------------------------------
>   hw/input/Kconfig          |   4 -
>   hw/input/meson.build      |   1 -
>   5 files changed, 568 deletions(-)
>   delete mode 100644 include/hw/input/lm832x.h
>   delete mode 100644 hw/input/lm832x.c

Reviewed-by: Thomas Huth <thuth@redhat.com>

