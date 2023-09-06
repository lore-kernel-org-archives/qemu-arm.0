Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2557530ejb;
        Wed, 6 Sep 2023 00:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjPIx63VUgiVhN5sYVSh/OvXv5xF6M6wDFWSoyzE7GeNnPvTaJRXD0dVIq9f6aHisEDnOf
X-Received: by 2002:ac8:57cb:0:b0:410:dc24:7fba with SMTP id w11-20020ac857cb000000b00410dc247fbamr21459422qta.3.1693984692793;
        Wed, 06 Sep 2023 00:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693984692; cv=none;
        d=google.com; s=arc-20160816;
        b=MuoZm9rNlglN0JoJ/MlFg4LuCtzWbxO21IvkDRbUWevHzPmyl5XBJaFi5pfPvqIWmh
         Ei+i2WF97oGSXMttGFJkDNQ2CQl5epZ+M42CO4bNni2970LTG2xxwv2m5fhIx9oSgDlv
         kVTNhAU6CykipnmWzIpyFU75tBwLSLxHNXEEh2WGI6zMljuLDiQ3HVyCYOZSjnKSzhre
         kfOpHP9/P1dp7AGe8cnRB0g8kZ3Y1Z8962tshLeMbyKoOgKcTSvc+c+XRBHUqM+NblA1
         J0oOAHa8dDoV+5DK82Hac6QNnBIsBsCGh5kC6m/VmSfQ+eSLBbwqRHSCYywrf87Zp93N
         /XlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=uRJrPmom2QK04NrHrucVV1tBYurvl/zY3Sr0T3ioW8Q=;
        fh=fv2/EASNYO7KwcwKSBCrRDx0gQA4VOsl5HYkxK5MVEw=;
        b=ObXDWj0Qo6MAZoIDe7aH8AIK2+Hye+8g+s31SOzO93sB9e12r02SpBAhpFb9sB0EiB
         kcpVSxEFEKiJEqbKm1UbWOkEcoPrHjs6ZrfMNiXlGb4KyBSdWnbEptsUNyJtKc3PrMpE
         4+UwGxEPfK3gsq1Xl1CKEQKP3ioOMQUbr3LFUyrR1InKXCLyRQfBK/CURS8IrGyxIrIV
         N7zsW2N2apI875AwwQcSCX7+/XfGj/iz5T4xFOWF/XczMRSd8MfpS+kbaMVtMHZgHeuP
         xdyIggU+APQKRtz4pLS4o341nGw0i3Ym+qc9FN5gstXdytUoyUhrFhCg5Eg00+mCrI9D
         Y9PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dgwgDAF4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05622a05c900b00410a979ca61si9158608qtb.758.2023.09.06.00.18.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Sep 2023 00:18:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dgwgDAF4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdmnN-00079C-2I; Wed, 06 Sep 2023 03:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qdmnK-00078O-6w
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 03:17:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qdmnI-0000EM-6y
 for qemu-arm@nongnu.org; Wed, 06 Sep 2023 03:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693984663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRJrPmom2QK04NrHrucVV1tBYurvl/zY3Sr0T3ioW8Q=;
 b=dgwgDAF4OwwlFzurm2LhvB9zHdkLPYRtZlQTs+4qcd9a5groWbNCh9a3y0qLI2D5xainij
 bToEiVrEziPcTVdkHWY05u5YH/0mJgqbFvk6ysX3uxID6L79bu/aV+imuZYWHIVQ9r2XEe
 T6bwp7BPBdan/ZCw+LFf3XAwR0FS2hI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-Evg7HE7JPeK54U78B2aLHw-1; Wed, 06 Sep 2023 03:17:39 -0400
X-MC-Unique: Evg7HE7JPeK54U78B2aLHw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-401db2550e0so25112705e9.1
 for <qemu-arm@nongnu.org>; Wed, 06 Sep 2023 00:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693984658; x=1694589458;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uRJrPmom2QK04NrHrucVV1tBYurvl/zY3Sr0T3ioW8Q=;
 b=azLZyXuCtVIvxnZ2GtRBOQgGseEed8VggVj5qANFa7y/oD3BWovT3+YDhGNgHXCOpZ
 5TbGNASp/2ek8x69dmSLT1G2lskQvXiMWfedaXTqGwu7O2VRzGf1gpm4/EuB+nrBRERq
 XFSog5nlhIuvJ84yH6k/CmsH2qnoJj2l6ON47xYbXVxUupYhXvoF5UUjx0q5Y6vihCAB
 kI1jGcgcqTnllo6S5Ue/jhYXBVaeAMZRrT5+/AIoZbBEqe1Y7FJJ0MPb9QboBuoI0P5E
 3ozYbIt/fOOcwxtrfZmpDSGIquB6rFP+kTKAD/W9BJDTGVxYyEnpRmNVNVhEogQ+R0TK
 SXGA==
X-Gm-Message-State: AOJu0YyOPlcFigBPR0Cz5TXexpq6xaPsVgVTu2UjrHtPQhUPy4T1AyYU
 +qEg/+pLF58SybxU3eXfZvTBwWfiLitanbzykRGATYdmlwtx20/EwgNeWHOVoB3hI4beaM1y1Xw
 mWB5BAP7dNzZY
X-Received: by 2002:a05:600c:2488:b0:3fe:228a:e782 with SMTP id
 8-20020a05600c248800b003fe228ae782mr1536194wms.37.1693984658747; 
 Wed, 06 Sep 2023 00:17:38 -0700 (PDT)
X-Received: by 2002:a05:600c:2488:b0:3fe:228a:e782 with SMTP id
 8-20020a05600c248800b003fe228ae782mr1536173wms.37.1693984658318; 
 Wed, 06 Sep 2023 00:17:38 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:6c00:92a4:6f8:ff7e:6853?
 (p200300cbc70c6c0092a406f8ff7e6853.dip0.t-ipconnect.de.
 [2003:cb:c70c:6c00:92a4:6f8:ff7e:6853])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a7bcbd1000000b003fee777fd84sm18997157wmi.41.2023.09.06.00.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 00:17:37 -0700 (PDT)
Message-ID: <ebc93bb8-41c4-d983-b7ae-4d56e66c2e91@redhat.com>
Date: Wed, 6 Sep 2023 09:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 01/13] memory: Let ReservedRegion use Range
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, philmd@linaro.org
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230904080451.424731-2-eric.auger@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230904080451.424731-2-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 0CRAS36I7YsA

On 04.09.23 10:03, Eric Auger wrote:
> A reserved region is a range tagged with a type. Let's directly use
> the Range type in the prospect to reuse some of the library helpers
> shipped with the Range type.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/exec/memory.h            | 4 ++--
>   hw/core/qdev-properties-system.c | 9 ++++++---
>   hw/virtio/virtio-iommu.c         | 6 +++---
>   3 files changed, 11 insertions(+), 8 deletions(-)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

