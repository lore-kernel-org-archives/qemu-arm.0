Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp61458njb;
        Wed, 4 Sep 2024 03:08:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQfHUKSTW+qGUX+hdqyzrWSUOjQJaaF+bjKOTBT12vZ4iUXfuu3j+lNosYrBPFdXFMxNvWifRtyj29lw==@linaro.org
X-Google-Smtp-Source: AGHT+IHuOyEfSdCk0RgpjNbY/AqFP7yXla5esSVuLcQRJTGa+gSQnSNNLFjgw2jjNyNdYtk2iyKH
X-Received: by 2002:a05:620a:1728:b0:79e:fed9:7937 with SMTP id af79cd13be357-7a9788c444cmr737089785a.43.1725444512869;
        Wed, 04 Sep 2024 03:08:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725444512; cv=none;
        d=google.com; s=arc-20160816;
        b=l4NjJeezITlcXPMZdY37ubQETG2I89Df/hjxlMajehhSgIKrjNilmMacX9lHF5RNGE
         us2Goi8KK17Qk40X7rYvXDNLRRllQPkx4ehArIAxzoQm3Gb2n2WAupF8MaOrovYS9+a2
         19mCM0mW5tXA8zq2i1ssM/twQQvhkMydReeBWzKAhQgJ+6Nqde9A0bluAwVlKVU3c5Qp
         PguphAKNkXeruknz8uXbKZjIbjp9Q242+Bx/rZGDmKFYpt0BUA2B3csgBTrqbfnk2nzg
         N4hK++xO7IIRV8SDm2RAA3jgJ3ay4GFWO83J+5mLlylxuE6vAA2A59WYQQcE5r5UEquM
         S0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Y4X22Kb7WFUp6Jn1fD8mlHLZx7usSXci3bTjbeK99O4=;
        fh=atPtS8dLGG/JmbTshFAdCFxvfHneUI7Uno/ZMyuHAq8=;
        b=sGm6desgVTA6X5qPauk/VdbucT9OicDHBsV5oC8LVgUf4AP7luWUjtH9jUEBpxoOYm
         5B+3+KurfToixrYWPyDMGR0HEsohbnId15L1h5fjlO3WtQbbCdwQDR8mjXNz3LXHrpNP
         H9pspWKuTGkc+Cwt9Wtgv0hlbWnpkzMzdP3Jtq28tSe6EPiUN/A8knU4Qbn0woJ+5819
         GLs0gAlo/NxIX0dcDpFB8p0JtQ/F8rgcE4Fnl9Fd7XnIyeE5m4XGC+rHY3KuJfozu2D9
         9Kc85TQSvyO1W6E9s16FRKldHb2asjP8hU49JMu3W7e3k3Kakv/Roid0jkiCbbjeuVII
         psfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CfGdWP7w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d54386si1479791485a.241.2024.09.04.03.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 03:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CfGdWP7w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slmwC-0002ls-1C; Wed, 04 Sep 2024 06:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmwA-0002ff-Gs
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1slmw8-0007iT-Vs
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 06:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725444508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Y4X22Kb7WFUp6Jn1fD8mlHLZx7usSXci3bTjbeK99O4=;
 b=CfGdWP7wexQ7hdnyCI53O1HllERPFGmlN2I/d55RFf6TAwcURy6kR3zhXnDjRR513ZQhd/
 0mOA9sg3TAaMndQqK5Bi7FebDw2KEotbcwb6qrAJKcgLAvkwxj2O60rtv0T4FJ3z0Zg+bd
 2soEaKlTZqhy76edAAnc0KQ1UHL/yLc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-GW3kuO6uNum-MB7PSYi5LQ-1; Wed, 04 Sep 2024 06:08:27 -0400
X-MC-Unique: GW3kuO6uNum-MB7PSYi5LQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42ba94a0555so6223885e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 03:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725444506; x=1726049306;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4X22Kb7WFUp6Jn1fD8mlHLZx7usSXci3bTjbeK99O4=;
 b=DYeAod9uSM6qSiqIA0ueOqjdIKOrgLIyE0rG+3OHkyvVfCdgnepPfEc+ZiDWbZD8N3
 rAD5I9y5TbeoSxPkKYUUHW2i92Pg94SQQ6ACR6ImUY9hm2SGE7XbKMYxjcrkHLF/XndQ
 Eq8W+ge5S+h23U4Fa22W1NdU89T/ZDERZENdJo2ExdE+fXrPT/OZAvlM4YDoopADRlTJ
 zGaRt757KHRwV5B6IVzo+KDBaSEq7yHqIBtz44E+TuOxvVJv5omWXzd3GfXlotoRqujN
 pbyvn7GBdo560dlacJlo3qirZpQMQezaC9cZZzHAo2U9xOeSIOdCm/yBP2LhWUqA9H0v
 CXgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgMP3T7d3x8bBmMgKmoaEqXWOilfiUx7dQDJ46xB4u9au5XNSNBxnVvAk4GYb4K1Om0rQlbdyipg==@nongnu.org
X-Gm-Message-State: AOJu0YwyXXmlPFwU9zrfAleDd39t4OohD1WDBCRdwrB8XnOsXIpPupi8
 JOupl2HjKyj9dqWv1ibwbm0Byio1HchtimXMyzyqblEDESb+6UFPtW6voiPdETx74A/UMlMSIYC
 wHyO+yir9tBF225sPTZ9DVDy7X5gqmaj9Bi+opCQtfHuMZ62pLw==
X-Received: by 2002:a05:600c:3b1d:b0:426:629f:154e with SMTP id
 5b1f17b1804b1-42c95497b1emr13895825e9.30.1725444505792; 
 Wed, 04 Sep 2024 03:08:25 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1d:b0:426:629f:154e with SMTP id
 5b1f17b1804b1-42c95497b1emr13895685e9.30.1725444505330; 
 Wed, 04 Sep 2024 03:08:25 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6da24bbsm199719045e9.0.2024.09.04.03.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:08:24 -0700 (PDT)
Message-ID: <db847fb1-7af2-4383-bab0-a5320eeedd07@redhat.com>
Date: Wed, 4 Sep 2024 12:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 32/53] hw/block: Remove OneNAND device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-33-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903160751.4100218-33-peter.maydell@linaro.org>
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
X-TUID: n3A6luxcQLJ0

On 03/09/2024 18.07, Peter Maydell wrote:
> The OneNAND devices were only used by n800/n810, so they
> can be removed now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/block/flash.h |   3 -
>   hw/block/onenand.c       | 872 ---------------------------------------
>   hw/block/Kconfig         |   3 -
>   hw/block/meson.build     |   1 -
>   4 files changed, 879 deletions(-)
>   delete mode 100644 hw/block/onenand.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


