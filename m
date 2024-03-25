Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp501422ejj;
        Sun, 24 Mar 2024 22:36:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfH4rI2fnDZwiSTURlKdIAc6kS7b1Sxd/Xr9MHWHt0sLD7MS/1erJbPvwuE70VLEgUF9Na9vHZ+423XRiCC5TxgYuynM9r
X-Google-Smtp-Source: AGHT+IFS1wbTVN2uwboBAa7aVc7ofPEI9UVRq9Pdvvl58Z9jsM00M99SlMZdsij0+1LdRaZKNv9h
X-Received: by 2002:a05:622a:410:b0:431:6208:82bd with SMTP id n16-20020a05622a041000b00431620882bdmr25462qtx.28.1711345014176;
        Sun, 24 Mar 2024 22:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711345014; cv=none;
        d=google.com; s=arc-20160816;
        b=czOQ6LziCEsEvxeuISt6sZi9sd9FWw0/YH5R8uQro95Sz6J2571OHj1wXWltm617wl
         vP0fhgwVHbvsmVmoC+QeJVDVVzVSgqbtbZR4J03mrHuRtiA9TaJow7F/PQXOpGlkrrRp
         K4yB6pV36pYT8FHzg3JkeEGvzG077yf/aZFvPA2qXuWU96P9mNYLQAP8L/+bDjEe39ET
         Uf0YHZLurfxL5N9ql7NkkByVnvcDwkKS5mhoDltJcWM4JE5Ea39kB0zcB86HyXuQ+6R7
         hdadpBtntV7X6hl9TF1STtXOUTRU6r7Nh+vj/trHJff8ohRLcuUfUv74DlIDmSnBpwty
         E3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8TgtQ+DMtiPQkrYAgbAtmlSjXgOjNaIxWS+xe0Zj6hc=;
        fh=jhctn7rjf9SltVMFBe4C0lxnuTsVRZNOMX6T2xrgM2A=;
        b=emP/n8VXSKcY5cjRg8prcaL3X5ph02TtZ6eyvd73BRuDRKdWjrVgyedzyUF1287/8w
         mWSG4CHmtuLPnm1fDI07QgLgx2p/7w01DdmOdOvBkOQhhIpNXb/hVGBw+QeVTyAlpEDq
         MvwbbdjO1Q1l0B61gBIUhbWy6pu/LdVCsO2C31IH4Zc0uo7Uxon205YZTKroTJ35RKe5
         eRL6YtIa1GqqTsn1d5LUy0iP1Q5qlRGkD8bpymSsx+rcATghe4z8Bkv1+J++ibr24Qzp
         2UgpwKMKDUHIlHAEagnjbbY/ZBdl4b4A+dfL0impAttxvqY+QCxAI6QGGzBSsYzEPZEk
         ohZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JlPbLZl+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd14-20020a05622a418e00b00430e5534ca6si5183271qtb.570.2024.03.24.22.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2024 22:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JlPbLZl+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rod0O-0005Ol-2S; Mon, 25 Mar 2024 01:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1rod0H-0005Np-PN
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 01:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1rod0G-00010T-5H
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 01:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711344970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8TgtQ+DMtiPQkrYAgbAtmlSjXgOjNaIxWS+xe0Zj6hc=;
 b=JlPbLZl+bLZy/AUC0v04YElfLwHOl3lvsSfG0liYHw6fyPNDZtxFstAAd0hMLN09g84mZX
 XXHBazTdJ/djxRCcKcQ0AbIROfN3i/3ePyplhi+l0Dm6VnV+Eth7s24lMMmRXXuFOdrF8h
 BAdPLAYtMrLblRpj1GhfZuM9glvPPek=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-EmrCc6YrN1OJcQxU1ob6cA-1; Mon, 25 Mar 2024 01:36:06 -0400
X-MC-Unique: EmrCc6YrN1OJcQxU1ob6cA-1
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6e67a83e7efso1089416a34.0
 for <qemu-arm@nongnu.org>; Sun, 24 Mar 2024 22:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711344965; x=1711949765;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8TgtQ+DMtiPQkrYAgbAtmlSjXgOjNaIxWS+xe0Zj6hc=;
 b=VgnMmcAGPj+TKYUdIONbfHYiUzcgCCcX1MrPQ53VIOFAlXuXaDKCNd6qisNG92wB6h
 v0lXEf/TL0jtHhkxad3KG0YC0cg3U5VB5uysWfz0H+KhgRUTRx/2I2QLCx4f/o3k2HsN
 kP11J3+kfKfLkjgeqmpSdfUn3e4qxbdaqRU5U5nJiWy22OLphuUSgSMkDGAUsiBrG3xT
 0aO4eX1KiM5X9Nk+kqg8t7p6bI3opOrgvrbKDPWn8V7FrPbcuJYMrhPIZNY85s03VF7I
 gCF2yNLAcynVkxr8y7ns1OBNS6Uh3ATaZ0CCDVcHVntMZJDqqWhqR/B6FoaFIR0RhXCL
 fO2w==
X-Gm-Message-State: AOJu0YxkDbXlCop61x96ADo3mxfE17y5DmIbko5nJdxNtjrdNhSOZ6ey
 OXY84fAGoTgRaQVELFgHQXZNwop863Rn3X0U804DxwcaV4V9aqo9w/YyXy90oUyNYhvnhBZJ+qA
 KHobYWhhhGg3+ET/KCjjLG6bqA+A8TwHOhreWFAv5r4BynlmtCQ==
X-Received: by 2002:a05:6808:1588:b0:3c3:cd59:8bca with SMTP id
 t8-20020a056808158800b003c3cd598bcamr2572143oiw.1.1711344964751; 
 Sun, 24 Mar 2024 22:36:04 -0700 (PDT)
X-Received: by 2002:a05:6808:1588:b0:3c3:cd59:8bca with SMTP id
 t8-20020a056808158800b003c3cd598bcamr2572113oiw.1.1711344963897; 
 Sun, 24 Mar 2024 22:36:03 -0700 (PDT)
Received: from [10.72.116.135] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 z3-20020aa79903000000b006e6b4613de1sm3417819pff.104.2024.03.24.22.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 22:36:03 -0700 (PDT)
Message-ID: <1881554f-9183-4e01-8cda-0934f7829abf@redhat.com>
Date: Mon, 25 Mar 2024 13:35:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-arm@nongnu.org, Eric Auger <eauger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20240312074849.71475-1-shahuang@redhat.com>
 <Zf2bbcpWYMWKZpNy@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <Zf2bbcpWYMWKZpNy@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 96NIdCL7KPQ0

Hi Daniel,

Thanks for your reviewing. I see your comments in the v7.

I have some doubts about what you said about the QAPI. Do you want me to 
convert the current design into the QAPI parsing like the 
IOThreadVirtQueueMapping? And we need to add new json definition in the 
qapi/ directory?

Thanks,
Shaoqin

On 3/22/24 22:53, Daniel P. Berrangé wrote:
> On Tue, Mar 12, 2024 at 03:48:49AM -0400, Shaoqin Huang wrote:
>> The KVM_ARM_VCPU_PMU_V3_FILTER provides the ability to let the VMM decide
>> which PMU events are provided to the guest. Add a new option
>> `kvm-pmu-filter` as -cpu sub-option to set the PMU Event Filtering.
>> Without the filter, all PMU events are exposed from host to guest by
>> default. The usage of the new sub-option can be found from the updated
>> document (docs/system/arm/cpu-features.rst).
>>
>> Here is an example which shows how to use the PMU Event Filtering, when
>> we launch a guest by use kvm, add such command line:
>>
>>    # qemu-system-aarch64 \
>>          -accel kvm \
>>          -cpu host,kvm-pmu-filter="D:0x11-0x11"
> 
> I mistakenly sent some comments to the older v7 (despite this v8 already
> existing) about the design of this syntax So for linking up the threads:
> 
>   https://lists.nongnu.org/archive/html/qemu-devel/2024-03/msg04703.html
> 
> With regards,
> Daniel

-- 
Shaoqin

