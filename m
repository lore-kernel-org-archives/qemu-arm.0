Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp981008ejb;
        Wed, 6 Mar 2024 23:33:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9fZP0x5ak3dMOavh71xnICpRklETf7WvPVKl3BnRp47N1YkJ0lz0EseNXHXopluqvEzngMgzoRU9VKkgmgPA2kMm6jMW/
X-Google-Smtp-Source: AGHT+IFFZYDzxb0Fku5xAqJWoP1Xh1z4yXeLhi7BQ6EBNlHZJdIwMfMB3SinUUdA/QYyicjTZeHG
X-Received: by 2002:a05:6359:4294:b0:17b:86a5:6878 with SMTP id kp20-20020a056359429400b0017b86a56878mr8719482rwb.20.1709796797782;
        Wed, 06 Mar 2024 23:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709796797; cv=none;
        d=google.com; s=arc-20160816;
        b=oGLktW1T6icZuerCE1sN9nWUN0GMd4DsmWLInSfSNnIdw6I39U+5dsFHreV/QWfIQ0
         Cs4mb8qeTsEVQ0/Ypehuqofidd764/wMhtl11jKQ52XiShen5lLjtpRH/qfydXRWOYz8
         Cl+vkMDo7dHQdr5A299p04yQWxGbt/QRfsrinnp/ZkodrB7wJ32EYw653yDElj15S27h
         0KL6GCeNlKIYgySSU7YHhTnm/UodeCYzpXAUK5hePgd0EalslM8gsLfgqSVMJsREw3pF
         xacxNXzdveSnSUuXo2Jx18H+H5pAUF6Ran0SkE8wfdN5unkOGnegjjaQtYtbhUTIX4ZH
         qQBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ucxwlMHUiD30hPQAXtYZXvvoHVuX18aAqzgAW+oZSTA=;
        fh=KTcxZDz7aZ+Xzqdy3J+ZekF4blOIU1FdjvyJB+VilM0=;
        b=Cpxf+KEb++91emUeyqIvcV+Lq9N3csrnV4qNvJHGhj1uiBLo0tkhGfInTvDP5ojiE5
         GAQJCMY5Eed5y+jd3w2oksuLnbUo60QLqb8EB7S21qZlO8f02SouAnazMg7SaGdWNGXn
         GdxAW14/l6uOl5caXWWLIgZE1w9M9nWF6BY/cMWVTVl9KJ7noCp5C336UHb9uxwU+84u
         aqz4qFxzwS5/B80SNLOxTTB2n4wf9LBc2E6+llJQKMgwh12QUm68QkAA3DRDL+nflNOe
         nHRUrKmQfXrpbL1O2rw/yhcYq6/DcbTNR4sfGIRb2nKg6470Xzq/wR5Vcu2sCRMK1C93
         H+Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V+ca42vk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke25-20020a056214301900b0069048320d8asi15674598qvb.426.2024.03.06.23.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 23:33:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V+ca42vk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ri8FT-0005NW-Eq; Thu, 07 Mar 2024 02:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ri8FR-0005NG-BP
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 02:33:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ri8FC-00020C-MC
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 02:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709796765;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucxwlMHUiD30hPQAXtYZXvvoHVuX18aAqzgAW+oZSTA=;
 b=V+ca42vktYCWVO0HaBHpByKxomTALeQB+Nkm/3f911euXbccHRLDJPcsEm0IR4/FeEmR6j
 kgsBmEpnPe2/wgjR8d41BD/gpvU+B5laeB7Wrklrpo/9GB1Sbicnikm8CMQMgJ0ARk1oke
 0a9lGhkVtQmxBdFk7hq0nsZdVsZDI18=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-8fF-v_paON2ZWt6miscaJA-1; Thu, 07 Mar 2024 02:32:44 -0500
X-MC-Unique: 8fF-v_paON2ZWt6miscaJA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-69078fb1cd9so7297776d6.1
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 23:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709796763; x=1710401563;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ucxwlMHUiD30hPQAXtYZXvvoHVuX18aAqzgAW+oZSTA=;
 b=ee2JSWuVwaTjICrwVjTOLD8we2zvKwOOlJ2lePLNUhm7CKnJCfYHNEq9zItYnOvZU7
 RQt0nqRdoCSwHwGk2PxkDo4O2o8eUGqlboqBKHV8KvRJPGXAUu4DYVXyZ2xVrx8+vgAi
 mWH5h8Rpp/6aWWqtMPI5tLs7DCXVE9NgnqyAH/H+DEO0J7dl0YnrDXF+dloQaEKD6Q98
 vkkgHKq0xjdZf4jq+Ib0HBpkiNqwo3D6YpHfNfsoWyKqaqyBmqUEs5TdQCM442j6xefG
 9CveahPgGzBnEySSyETFWOpba17qorGucNllgkmdHFxdxkTznnwCAoNj8azVRb7uHxUs
 sWNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlKILq8WfBeRlIlOtk3P/R8/bsqciUPjO+g/1c3k1Mw6OVkFShC4wsTnKxWk1r6ZquY58w6aFpUBAb7gcypK4+ej03
X-Gm-Message-State: AOJu0YynMLrdyl8O0nY1JBIMhjPApdd2UHBxiN/CQYOi/z5fAAA2BYKO
 X1MsSJ65Wu1xrxKOYPdtO7bmAllUQOjr70uORDqGF7Msu8dMjjaV/Chj42rPgO7vN1/uFWYAcZ8
 IzosplcLGuYWCGGcVknnOcC4T/RRP3CNCAR6sxgc8J4gf+w4zaQ==
X-Received: by 2002:ad4:5685:0:b0:690:7a5e:b321 with SMTP id
 bd5-20020ad45685000000b006907a5eb321mr7864529qvb.17.1709796763670; 
 Wed, 06 Mar 2024 23:32:43 -0800 (PST)
X-Received: by 2002:ad4:5685:0:b0:690:7a5e:b321 with SMTP id
 bd5-20020ad45685000000b006907a5eb321mr7864499qvb.17.1709796763261; 
 Wed, 06 Mar 2024 23:32:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 qj22-20020a056214321600b0068f73372424sm8415701qvb.90.2024.03.06.23.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Mar 2024 23:32:42 -0800 (PST)
Message-ID: <07478583-ce74-4de3-8983-010c6617e4a8@redhat.com>
Date: Thu, 7 Mar 2024 08:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/9] qemu-options.hx: Document the virtio-iommu-pci
 granule option
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jean-philippe@linaro.org, imammedo@redhat.com,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
References: <20240306203348.65776-1-eric.auger@redhat.com>
 <20240306203348.65776-5-eric.auger@redhat.com>
 <fcaf95d2-bb09-4c55-a333-21a93a707ad2@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <fcaf95d2-bb09-4c55-a333-21a93a707ad2@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bOJi1jBWsrqs

Hi Philippe,

On 3/6/24 21:44, Philippe Mathieu-Daudé wrote:
> On 6/3/24 21:32, Eric Auger wrote:
>> We are missing an entry for the virtio-iommu-pci device. Add the
>> information on which machine it is currently supported and document
>> the new granule option.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   qemu-options.hx | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 9a47385c15..757df3eac0 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1172,6 +1172,14 @@ SRST
>>       Please also refer to the wiki page for general scenarios of VT-d
>>       emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
>>   +``-device virtio-iommu-pci[,option=...]``
>> +    This is only supported by ``-machine q35`` and ``-machine virt``.
>
> Don't we need to precise x86 and arm here?
Well I got inspired of intel_iommu doc. I think this is sufficiently
precise, no?

Thanks

Eric
>
>> +    It supports below options:
>> +
>> +    ``granule=val`` (possible values are 4k, 8k, 16k, 64k and host;
>> default: host)
>> +        This decides the default granule to be be exposed by the
>> +        virtio-iommu. If host, the granule matches the host page size.
>> +
>>   ERST
>>     DEF("name", HAS_ARG, QEMU_OPTION_name,
>

