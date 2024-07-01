Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1239634njm;
        Mon, 1 Jul 2024 02:14:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXogIrRrLf5X74U/wkQyHd7C7aB9tOO2D0nHHPJtlhqgNH89rtQaW9fJLed5n2Jxz0B2jwBUo+euM8aFdRHL4Mag+ooGGa7
X-Google-Smtp-Source: AGHT+IGaaOFyeyC3Sc5P+qsoy/lij0EvASVV09HZ8WYvEJQwkuBlszHK5MRRR0rIpSh0wOSv6/aW
X-Received: by 2002:a05:622a:48f:b0:446:5b1a:da8c with SMTP id d75a77b69052e-44662e3c538mr68394921cf.30.1719825267570;
        Mon, 01 Jul 2024 02:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719825267; cv=none;
        d=google.com; s=arc-20160816;
        b=YKUfo1fyh5BOV8p8dT+AyEyQ1auWNtkQdtWJ5SAEalWDMW/lCM/G4hEhyRWnSr3FRv
         3JOsiKEvsf+bO52GlO6I5Zz7Iu6z2eJKpjAt6F27iskyKRzStqmJRTW1sHfOpnGztcVb
         zsO66XJqnk06GDvAloob5KEwEM7ZTrTRjpL7mmWN8sBJtYBTSBaGvZo/+oROoH3LpaDA
         +jIQY9oG8c8aNc6YBH8G9p4iBj2Noq9/leELv1Ev9J+w845x4viBTirWpBMCBC6+LfW3
         wy+PGmc6TcKoqbVNw9prsTfS2EzqdJJqc+mrRKPzr2Hq7S4TyrsdI7Tm15hSTmK5D/Ot
         IpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=l9nPlifQxAJAPXjflz6SlB0mkVAD2ofRBOUMpsubJ+w=;
        fh=JOZTixXVTWQW17i1CprCP7y9PPB9UslcazxuW+vG29s=;
        b=XmQ+FBJkTrm6PR8Ax9E1UxyVylw4GphWcx1gPm124IYrxXtFb8GiI2KBfEhczBobc1
         qir1jXMT8le8qW994A4DnQHQRxYbZ+JSXVf1+74X7+uWVWMvFw9RXHfPVs+bQthE/87v
         XOkCgj3hg2dcZEwxAiBKtJOjN6eLId3WIZG637qYQONuIO+w9bTqSbYpODbGohqh/Wr4
         9mdxVagyT2J+R0QTNu+AvoPOoIzqCdNP/GSmhOM18fiRlMFNm8Suv1mA+VY1zgiKPeRI
         fIUH6ssdkONM+XyhoWhc4QN8PSIY9qCzq1isYzjw5ed/xjuZFOHkWFyghQzc0hkMryn1
         kIiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bgdh4Ab+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514e4d7fsi75856351cf.742.2024.07.01.02.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 02:14:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bgdh4Ab+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOD4t-000503-1O; Mon, 01 Jul 2024 05:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sOD4q-0004v4-Aq
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 05:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sOD4n-00082k-8Z
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 05:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719825116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l9nPlifQxAJAPXjflz6SlB0mkVAD2ofRBOUMpsubJ+w=;
 b=bgdh4Ab+Daiq7ASBIOdurU5x0n4ukAA0C8Tf/uKxdig883ctHhOFWwa7TJLkMV4pRpIOWS
 3/JTRA/FN4sZGzPStMdry26ht2yEuqHeTttYFYvxz5BBsJxTQUYT31q2aA1wx/8aPC+KXi
 Kjalu3cO4LRy1mHiKEyqOtdYxlHmMBs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-GLZcKrDLNR6BkReujk3Y5Q-1; Mon, 01 Jul 2024 05:11:53 -0400
X-MC-Unique: GLZcKrDLNR6BkReujk3Y5Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4258675a4f9so2685595e9.2
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 02:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719825112; x=1720429912;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l9nPlifQxAJAPXjflz6SlB0mkVAD2ofRBOUMpsubJ+w=;
 b=iHvM93ACdPQRe9C3eSe7hxgKQjB71ami3b3FGUJuyg7XaKFq1e1PGXHWnnfJ6Xr8H5
 rmq5sj2XM6ea3FSkJiUtAUThB6589GKEvQXTZ9OfE2KV1SgW9tAMg+QTg3H9JIkc824R
 CxYlCUOjIltqXpbBjAWVAF0Nm5BuSeqCJ5PrnnXqAtw8BcMSSAZcAm+OW7YDjmPeTmnK
 LLQt7Qfw7Ul+Wnqu6C5DVV3ox11bEVUuoZP9Wu9SJcgZvY46slVfHsgeZpuv2BtVhxtg
 4qmO99AnkJhrHtBeB4QaTwF9677XMF2ScKwdLDL04M2kEkuSliUKJcce+YL1xkaVREBA
 3ktg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBUTyCtRJj0jEShXxDk5De1gU9iPmMIkSae74gCzQD5+HTpBK2zyHi7XZCf2+VCm85EaarvJuRLAfsHP3PBQC0iLJw
X-Gm-Message-State: AOJu0YxrVjmz00oLh7GNSL/rMNY8vYfrGh3BjgmY1eBlajXVqsh2Ivvl
 XiqvX5d4pl20Ss21/U/70G2adgK8iFrtvGQ9cmHBRT6nlZu5A5YlAJPkMsK0wwcCucKt+XHLmUw
 tdwk3SI88AJAb3HtZPOx5YtFI0LhGN0uLhaoEGiax81qUuWMoCw==
X-Received: by 2002:a05:600c:3204:b0:421:f4da:f4b with SMTP id
 5b1f17b1804b1-4257a0282b9mr24079835e9.40.1719825112150; 
 Mon, 01 Jul 2024 02:11:52 -0700 (PDT)
X-Received: by 2002:a05:600c:3204:b0:421:f4da:f4b with SMTP id
 5b1f17b1804b1-4257a0282b9mr24079605e9.40.1719825111740; 
 Mon, 01 Jul 2024 02:11:51 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-177-66.web.vodafone.de.
 [109.43.177.66]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd6d9sm9417605f8f.12.2024.07.01.02.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 02:11:51 -0700 (PDT)
Message-ID: <b38d3f31-fad2-47b1-bb9a-6393456fe979@redhat.com>
Date: Mon, 1 Jul 2024 11:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] hw/i386: convert 'i440fx' machine definitions to
 use new macros
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org
References: <20240620165742.1711389-1-berrange@redhat.com>
 <20240620165742.1711389-7-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240620165742.1711389-7-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: yT/b33MdQYLd

On 20/06/2024 18.57, Daniel P. Berrangé wrote:
> This changes the DEFINE_I440FX_MACHINE macro to use the common
> helpers for constructing versioned symbol names and strings,
> bringing greater consistency across targets.
> 
> The added benefit is that it avoids the need to repeat the
> version number thrice in three different formats in the calls
> to DEFINE_I440FX_MACHINE.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/i386/pc_piix.c    | 219 +++++++++++++++++++------------------------
>   include/hw/i386/pc.h |  26 +++++
>   2 files changed, 122 insertions(+), 123 deletions(-)


Reviewed-by: Thomas Huth <thuth@redhat.com>

