Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7342746njc;
        Tue, 12 Nov 2024 05:53:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIWaO9Sj3FSadQ5rsu1WoBNILl712IJJvxVvdOXouMbJcZefPKpNkNKmLEbjtDJZEG9cryGyO1JSQ7uQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGzYfs94oftWNTZaLcEoLvUVVOAWuKxb6bJsNd4fAsUyudRp6JxA3b+hDB/P89OzhcpRSNM
X-Received: by 2002:a05:6102:3f41:b0:4a3:adc4:1f31 with SMTP id ada2fe7eead31-4aae139c9a4mr15585598137.11.1731419584228;
        Tue, 12 Nov 2024 05:53:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731419584; cv=none;
        d=google.com; s=arc-20240605;
        b=IPNQ5geEhJZtocfD5anX6vkcdyHi63v9HcAEWiaqyO2hPG6Jz6YRzhxNleKvFXC4tq
         uc5j1lELJF2jCNGqF58nDkqP2BhwiM70PXJugDKSpH34v2kXEgvSDhvb1PnlgiI5wxf7
         RjEcBb2JPKZZY+8JCZ5vSS8XZhPc9KMp6Vpf73SQxizMYNkClW8LjPIT2KIwkioKQQOG
         mrCp/jBtAsYuB32Hw2aO8obzHU4BRjQ7psRChSPhvlg9BR9hfRPLCngiNUofJFFqgpAF
         qqZdQyFROshq35XRG9T5Ij/NeJu7n+sJQycSud9g1H5Uq0WvR/uGg2cMvLRam7JQJ5y6
         oC+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Rzs2/SUbiDnH95pGMSFr6jIXla9Q3U5sVZiiVlglY5g=;
        fh=x8dBJoQ4pcWHePK9g5BWV9J+2lwuclQvba9jfx0/b4E=;
        b=X6eQiZ7jqBQkVX6v+6DVLKpIWban1de9zs9ddAPcK2DRhh0ptbN/NADbeKTzWSRcXK
         YEPY/1YHeQdOWeDz3On/OJQ+qJjcvwGk5TI5lekU77+mqOJnS3DJjMSvQdqlzWGvhqPk
         kTZK50MjHM4Z9SHHdfmfkNCTMVptsNbmuZJ9SWZGfIP5WFaHRFUmAoHJxTKEmvXXklqt
         b4kDcZkdf2V7gS7bLkLvcn55p6LK+yytqgIp66FxnUok9XZYyaNLaq7rxEYW4N+A5SdA
         LXNazFcOkOqYf1ExGXldNMVxGuSctYtEApWmZH8V3I93Cdts9dorcy4n024cpQNThDOm
         85XA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bsirAvPS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aa9f02f3easi3010925137.231.2024.11.12.05.53.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 05:53:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bsirAvPS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tArJy-0003Qi-Bm; Tue, 12 Nov 2024 08:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tArJv-0003QH-PL
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:52:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tArJu-0003OP-8R
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 08:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731419556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Rzs2/SUbiDnH95pGMSFr6jIXla9Q3U5sVZiiVlglY5g=;
 b=bsirAvPSLl2ZcmBkWYx/URKAfHQE1gAGvHFS7EIzgSvRjcijDoYPQh/Q7GySKous+3Nv/H
 mbiCgH9Xc30EX9FUaDDUidNmQjuKtDpEdouZxAt7NB4+6GY1wJrVCK2f5QIh/XHd0mofKi
 ard/phNms4xyl5uq1eyFwJlqFovg6JI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-RsNpyWcYMXeL12O7nk8MHg-1; Tue, 12 Nov 2024 08:52:35 -0500
X-MC-Unique: RsNpyWcYMXeL12O7nk8MHg-1
X-Mimecast-MFC-AGG-ID: RsNpyWcYMXeL12O7nk8MHg
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-539f7abe2e6so4367260e87.1
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 05:52:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731419553; x=1732024353;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rzs2/SUbiDnH95pGMSFr6jIXla9Q3U5sVZiiVlglY5g=;
 b=FxEZR5IwRCh/6syHBn3uJVHeLiZdnkw96T5UUAWSUq8sCptPQbbP3E88oedwwaeHU4
 05RKap3J5DCmxgGcOSvQKJfvjh8oq8IEWeNw2rwP8AwYBvHN616gUtgGbd0svJ9ubp8Y
 zxG9WWR/QnW01jULHQd/ZjNI5p7FobVBCJJwgjjfpRkfd87qJHVBfzKVi8QPezw/UO3c
 PNdwWjxxgy8qcL1TsAg2DoXt0yGnYi2A1ni+bCfk+dz3fZoHP6aem4vxcpNJQZLeYr/F
 +dQ8TMHfGWVDshYfWxwIutX2ch+q2htxdapPvetRCLuFFJ9eVZt+uJ0T5+FO+KwCxjlO
 s/JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpOvY1aA4YX7d1mweRYMnfwWDR48DdCoXA+hrcem/+/S1++qDyJ8sBuyBESH8tvUUKtLOWp4MWKg==@nongnu.org
X-Gm-Message-State: AOJu0YwZw/Kh8S3MZuhhjS8sp25DpMRSaWbq+kx9eHYS/t2DcCBop2hM
 YYTFz4R6dxbHSPaflzX0cLpMn3FNl8kDHxw6CJLzJdQetfRPDGmvjNqGuasvK3Kvn1ahUFj1NsT
 3mMaEwFudF+yzdBU3bix6/rC3HD61yF6xH3jfW2len7/39dsemg==
X-Received: by 2002:a05:6512:1313:b0:53b:1f7a:9bf8 with SMTP id
 2adb3069b0e04-53d9a43c081mr1504795e87.55.1731419553475; 
 Tue, 12 Nov 2024 05:52:33 -0800 (PST)
X-Received: by 2002:a05:6512:1313:b0:53b:1f7a:9bf8 with SMTP id
 2adb3069b0e04-53d9a43c081mr1504771e87.55.1731419553049; 
 Tue, 12 Nov 2024 05:52:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa74abb9sm253212115e9.42.2024.11.12.05.52.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 05:52:32 -0800 (PST)
Message-ID: <ddb6fa9c-30a0-4fde-bc44-65971906a7ba@redhat.com>
Date: Tue, 12 Nov 2024 14:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] tests/functional: Introduce _console_read()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20241112130246.970281-1-clg@redhat.com>
 <20241112130246.970281-2-clg@redhat.com>
 <519d031b-ed11-4fed-b25b-e73dc28a9e9b@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <519d031b-ed11-4fed-b25b-e73dc28a9e9b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J6AVSzcoFLFE7f-MNLHEU9NANBLC8guWxV149nlQ95k_1731419554
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
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
X-TUID: Xp3dkNcoIwLQ

> Maybe we could use some funky unicode character instead? For example:
> 
>          console_logger.debug('🔎 %s', msg)
> 
> or:
> 
>          console_logger.debug('✅ %s', msg)

How's that ?

https://paste.debian.net/1335303/

Thanks,

C.


