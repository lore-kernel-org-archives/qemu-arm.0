Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7362DC83F21
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 09:09:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubbey-0001Xn-LH; Tue, 15 Jul 2025 05:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubbe7-0000n2-N6
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:08:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1ubbe5-00065A-61
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 05:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752570496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Z1FTcAaRxrcihRjNxxra+1Krnrhif/bVlHeoLRWDRp8=;
 b=Pchn2pMK3Qt+T5JbdCDhRproG+DPzDbH/cWM+R2XjTKfkWikRA3Gm2ig3VFFNkt+gyDsqj
 wZ50xTkq3HpTU+2Lo+R35NP05lNJDF7QVGqKovqRHWMjaRdsQVO/jUHuFkirhA+0CORk7E
 fdOJJgvj7qHrF1QZpOaemo0hjOM4gLs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-RmQe7IQrMdSLe9LlNw9HSw-1; Tue, 15 Jul 2025 05:08:12 -0400
X-MC-Unique: RmQe7IQrMdSLe9LlNw9HSw-1
X-Mimecast-MFC-AGG-ID: RmQe7IQrMdSLe9LlNw9HSw_1752570491
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45600d19a2aso24622795e9.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 02:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752570491; x=1753175291;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1FTcAaRxrcihRjNxxra+1Krnrhif/bVlHeoLRWDRp8=;
 b=Qg9ckXZryQqj5J6OHXm8zEtI7updguNDHh2ybtOc7/8Etz5xz9eM7DnlLwHdn0nNIA
 raUqYm6vFE8tOqqJo8PoMAwM/ZMWVGaOphej1UGjcCj/u/yrJEQxm8wxF1WpROFrM5HS
 3SlYPmxqQsZDrtAe/MP9F41R29BB8FjpdqYP18sJq5S85FR2yBOKVWW/DMUqgObqNgAM
 UyylHuRuGlhPtfmigkoLrdCk7ck6F1U15ZGQ9wz2Nlyxl+fT7q2d0Ojq8HIx5S2XbBBy
 ncEkmqGxqy3SCsaIbfw+lMqbaY4oCW6PFQWt97dts1RS2TC+GNX3XZeZ8DIngwYCG97X
 w98g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd+4yDZKIHXxFvgIZZ2B8ZZPbOqzcJFcARFD1eq6Xlw/Cx8S5eFjZrBWYf7vkmN3R9J0Xv6ISu/Q==@nongnu.org
X-Gm-Message-State: AOJu0YzYS6OpMjzKtqoCHua+qy8Bgchpk3O4aqWQ6wh7xoH0zGAEaUNG
 WXq2IdkeJDch8Usz0qHDFA3bcjKexOC3SIjNQPCth9TTum2BvsrzG4G4Y0Vzm4UJ3otlbyHhpzP
 lD4+fO2BBT3wNTQ2lI9+iAdVv8e3notwQyvmgSlC8XHWg9cZfJap5MQ==
X-Gm-Gg: ASbGncu6JtJcfQVnt7/Gxyr/RB8Hkwod1M89GYjtj8ipy85Ev9aLRXk5GL2JQmzNkJY
 RAlAoOrd03sFYw1zsFYaadHqqURRFbTEnJNszNxtDGQ17GDwGvGDZtQus+YEKaQA/5YLaS2wmm1
 /vEzbrHRLveI9RDtqr2P3asY8ljp6siS+mcebw5UEqe7hAszfl3OzY4x/gwBpjzEXmw2Xb+mwve
 93jEixIHZZwYrjbY98as8qCQ34jEGWnkQzZOOMk5y8k6SBkAp8RQFF9bVpLsqZHvwuQgrjQYyt2
 +2gEpET8d9BqTI/D65tA0P8ib/GbivtiPzCuDUsm1AEzhkxkS04m71CD1E++TCRqCRxPSJNpmfA
 =
X-Received: by 2002:a05:600c:8b84:b0:456:28d4:ef1 with SMTP id
 5b1f17b1804b1-45628d40fdcmr12094975e9.29.1752570491121; 
 Tue, 15 Jul 2025 02:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6XgWP0ZYwhA0EZz5QwDDfhd0iU6QCeZYfIUuSEK2pF316w7E2SB7V90WcK6pmp79QdA0ouA==
X-Received: by 2002:a05:600c:8b84:b0:456:28d4:ef1 with SMTP id
 5b1f17b1804b1-45628d40fdcmr12094565e9.29.1752570490635; 
 Tue, 15 Jul 2025 02:08:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:165:d60:266c:b13b:afd7:40fd?
 ([2a01:e0a:165:d60:266c:b13b:afd7:40fd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc2131sm14296320f8f.29.2025.07.15.02.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 02:08:10 -0700 (PDT)
Message-ID: <66037870-933f-4164-978e-3b92fa76b508@redhat.com>
Date: Tue, 15 Jul 2025 11:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] vfio/migration: Add
 x-migration-load-config-after-iter VFIO property
To: Avihai Horon <avihaih@nvidia.com>,
 "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <cover.1750787338.git.maciej.szmigiero@oracle.com>
 <22e94f25448f9ff42b84c84df3960c4ecc94cbdc.1750787338.git.maciej.szmigiero@oracle.com>
 <6b85f85b-51e5-4e6e-9c78-788d9118ad9d@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <6b85f85b-51e5-4e6e-9c78-788d9118ad9d@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AmA_4i7SoPuNhAOm8SjzRIL6loDD8nvmv2iZCViRyvw_1752570491
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/8/25 10:34, Avihai Horon wrote:
> 
> On 24/06/2025 20:51, Maciej S. Szmigiero wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>>
>> This property allows configuring whether to start the config load only
>> after all iterables were loaded.
> 
> Nit: maybe, to be more accurate, mention that it is loaded as part of the non-iterables:
> This property allows configuring whether to start the config load only after all iterables were loaded, during non-iterables loading phase.
> (We can also mention this in docs/code comment)
> 
> Anyway:
> 
> Reviewed-by: Avihai Horon <avihaih@nvidia.com>


Avihai,

Have you had a chance to test this series on ARM?

Thanks,

C.



