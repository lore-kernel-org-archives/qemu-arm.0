Received: by 2002:a0c:f4ca:0:0:0:0:0 with SMTP id o10csp458784qvm;
        Wed, 8 Dec 2021 05:51:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPB9Fx6Xni197TlYA1VqDgcTdzfFhFiH/Y11MY9+P1avNgjXLCzKkaN6BYBGyKlh1SCzT+
X-Received: by 2002:a25:8746:: with SMTP id e6mr55944105ybn.138.1638971495871;
        Wed, 08 Dec 2021 05:51:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638971495; cv=none;
        d=google.com; s=arc-20160816;
        b=zOvijud2VXXiClSrozwS9QV39g8QNo6aOf87Q1lEKOqPS6kZBsbE6NaAg8o/QM/7nS
         x7BU6BFUrF8HbYTFEK0kwaPY/jRLZtzHd9EGfGAczCVZysWDHDahP7f6RU7w13vgfi6I
         H2o4PSa9OTgeZqpOLwO0foGyVFGvWAwmQNeAi8mlxnwJBDD5yBW+ueRccSI27IFA+Pxw
         x5/wz7GUun8MQPZzM3tJ0KEj4xfXkuu0BA6ePaApJyXvt4x77AxP+rr1shfvOnhG1d+H
         uqCCSRCG83xTqR8gncTRk/IJaTdpIcbv29Vgq2kn/yPe6nMXnfQJthLKtIi3wKn+oyjC
         iR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=e+usbWFBKzTrZ/NWYAXck7e+4FA+lKSUI4CBL5D8l8s=;
        b=CPo4UrDiwMff/Ozi6mWSTWZ50O7OdX0Ym6jK6ZuL3vUEQ2Z2KpwxBXnTxE+Pv1YRlk
         Ubenyz/rcCyByMMW2TvxF0KhZwUjXcGhdWGIoOiZ/KYKQWC5RJUcp0E5vDwbnNMkVGKr
         JxusP+Fs6+k0SdeRrXkOiU66wYMRzi5ethp6J4SggAUEZFISUZgpmphBWj5LNKHLmoc5
         1xgU97Td6SiAzxa/1Aun98VV9N0RbRuwn6H4dAJQv7TA5UfS5HZ4/eUB7+7u9nLTHqhf
         5eIvidIuhge376wjmMmu93T256H2ZPCx0NOsgeapeR5v1/AgsnGIhY1SHlI/IxzB1KEI
         i/9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E7ukAJog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si4083736ybb.666.2021.12.08.05.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Dec 2021 05:51:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E7ukAJog;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1muxM7-00054R-Ds
	for alex.bennee@linaro.org; Wed, 08 Dec 2021 08:51:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muxKA-0003eN-C7
 for qemu-arm@nongnu.org; Wed, 08 Dec 2021 08:49:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muxK4-00064Y-Q2
 for qemu-arm@nongnu.org; Wed, 08 Dec 2021 08:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638971368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e+usbWFBKzTrZ/NWYAXck7e+4FA+lKSUI4CBL5D8l8s=;
 b=E7ukAJog3Dl6O8eWgSe3QWV2SAbRhZRChr9G1k/ORyOQ51r/7qC4ZZ3H1+Hwvap9M5WLlX
 YCH6I2dvfIYsp9HBmjB5YuCTzgRyMPcMR5b/41KkXijCgk/AWBYBZTl4Urxlsl9Pj1ol7H
 wiO9h8kKX+hw6vdfwvl9D3VyHlF53T4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-tiWHvJkcMYGlhA-mFEHzOQ-1; Wed, 08 Dec 2021 08:49:27 -0500
X-MC-Unique: tiWHvJkcMYGlhA-mFEHzOQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 a64-20020a1c7f43000000b003335e5dc26bso1318384wmd.8
 for <qemu-arm@nongnu.org>; Wed, 08 Dec 2021 05:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=e+usbWFBKzTrZ/NWYAXck7e+4FA+lKSUI4CBL5D8l8s=;
 b=evMbgVN6ZpU04n7vorPabnCxiUTRsBqs4WkMopMRYdGTPBkTmmNVcRwciiyQLPJRnH
 qcxmYocUCBrH6SK8+Bozd+QZl2KZstXYLjids9nFgkyAbocJWsML2qkayRxPrGGse6tP
 NG+LRYn1NMIPiJQv/WU03DAP5FRmQnDFg1H9bqUV7Tt+4cyIu0s+mJXsltdrZVsBgxsW
 gwgOLK7wjNu/44t2MBEP0C+iNgWhM+VR/wJbeTd9NPgbOJNPw1kNuyYGoiuCzqdmq2Yf
 ufcN2DpEpse4rHeZ5HYCoNRoniR0guahlPA6y+zvGNOQbKPxPiaaLMwcvpYM6gV+wjvx
 u/tw==
X-Gm-Message-State: AOAM531292x/4ATTiOAMQqKnA+GMwJRBmqBOI82XTXtDwVH96Y+WKg9W
 dH8Nbs2o7mZAnIOGQP8YCied51zWyfsLyeTofk0BTCRRxuFEiljBfJOzc8Z7e54QICkGMpEejkJ
 mrevY4nkI/8cZ
X-Received: by 2002:a7b:c157:: with SMTP id z23mr16107792wmi.113.1638971365762; 
 Wed, 08 Dec 2021 05:49:25 -0800 (PST)
X-Received: by 2002:a7b:c157:: with SMTP id z23mr16107755wmi.113.1638971365430; 
 Wed, 08 Dec 2021 05:49:25 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id q123sm5610519wma.30.2021.12.08.05.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 05:49:24 -0800 (PST)
Message-ID: <ce687dcc-273a-34a6-a0d8-9c1c67b7fe21@redhat.com>
Date: Wed, 8 Dec 2021 14:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 4/4] tests: qtest: Add virtio-iommu test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org
References: <20211127072910.1261824-1-eric.auger@redhat.com>
 <20211127072910.1261824-5-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211127072910.1261824-5-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: glGPfQp98LR+

On 27/11/2021 08.29, Eric Auger wrote:
> Add the framework to test the virtio-iommu-pci device
> and tests exercising the attach/detach, map/unmap API.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> ---
> 
> v5 -> v6:
> - changed the expected value for domain.end (32 -> MAX_UINT32)
> ---
>   tests/qtest/libqos/meson.build    |   1 +
>   tests/qtest/libqos/virtio-iommu.c | 126 ++++++++++++
>   tests/qtest/libqos/virtio-iommu.h |  40 ++++
>   tests/qtest/meson.build           |   1 +
>   tests/qtest/virtio-iommu-test.c   | 326 ++++++++++++++++++++++++++++++
>   5 files changed, 494 insertions(+)
>   create mode 100644 tests/qtest/libqos/virtio-iommu.c
>   create mode 100644 tests/qtest/libqos/virtio-iommu.h
>   create mode 100644 tests/qtest/virtio-iommu-test.c

Acked-by: Thomas Huth <thuth@redhat.com>

