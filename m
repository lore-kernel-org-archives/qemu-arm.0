Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp44011njb;
        Wed, 4 Sep 2024 01:55:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+sN7HCnCbeQ++wrI4gMKR83p49DDa0xKF3lq+5sOcz+ZKHoDqUTMdlNVCKV6+BIrvbJtdHZYnFnzCdA==@linaro.org
X-Google-Smtp-Source: AGHT+IHYDJ+eHQWIm9135cNA799GdLJNxOtRb0rKKWOzKbdUJxqwIJxMxLQQNg6RmlVcdmcKwfI/
X-Received: by 2002:a05:620a:4693:b0:79f:12fa:e1 with SMTP id af79cd13be357-7a902f2794emr1524772385a.52.1725440109456;
        Wed, 04 Sep 2024 01:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725440109; cv=none;
        d=google.com; s=arc-20160816;
        b=l7nQPEI5RriPj7Sf8x5By55B92U3hzyFWhfNSfFimheGpwZImjeablIojDZe8u8Nsr
         h9w9LuywflVP2+wTLcBKhNV7uqq6eILSRpnWvsB77QluUP946q5W63mUmdJW2L3oXxQV
         cUNzwLeWRQ6eTArHP3aAJBG6E/scjt0il9eTCrWTu8G9hsQWzMOWENZqiVfCNdNfT9BL
         PMay13P30BSFcpP0BwAsILkWvS7NRv0ATASPt7WFUbTXIxm2LWh62ow1ylji14j1RLUB
         gEVDZxqNGL1B7A/123sJUwPvL40fU7bnnV343BiwhEmvo/ag77K6wtQ8Acbz9GcQcobI
         vamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Ezlc8vSu3I+vO523cpu1dgSC/pfyb/IcH/8lA1aUKeA=;
        fh=JgsYCevuglQpK1bc47EELgoZzHi14DvscT5jSv6P1io=;
        b=lX/c/OeBNUfD5EQU9lrwqeMtXhqlXt9xvkCyD1htOtPfPQKfD0aaX6YeY1MHd7C143
         9Uj2PoP0AUsSRwQDGRY6dRWnLEN8nil55hyazjVOcSM3qSyLIee50Z55f8iEKJGMdBLW
         gVD2BWOhkp1RCsCqPVaEvUeP8wPskL6WDvaGMNnPdZGzIWBkfk69fQHST+RVZQz+n5YR
         l4PgNnOQ1r5PwBwdG5uz8Ew2MCOyrB0BHR2P+hSNYq+RcWiQpRtq3vL+Mn1ZDcHjEvzW
         7l4QognKdvwXDLpTUOTzTPzXAQV4SuJbA14kSXykP2OVQu5omhy2LJifVs9s1onR6iT4
         POZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HZOCmiDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806e0db8csi1438216785a.778.2024.09.04.01.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 01:55:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HZOCmiDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sllms-0005T3-WF; Wed, 04 Sep 2024 04:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sllmm-0005Or-HP
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 04:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1sllmj-0003JD-D2
 for qemu-arm@nongnu.org; Wed, 04 Sep 2024 04:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725440077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ezlc8vSu3I+vO523cpu1dgSC/pfyb/IcH/8lA1aUKeA=;
 b=HZOCmiDCTSDpQ8iuJPjpICnvsB1wgAvOq6SNDl94SEKNcOv8osCldMRcCuwfg/+vatxAcV
 yJECK0X5NQPNhAizu3lZ+XWH3+0ImBh4z7LvPggM/qKS71QMoCZvJxh7YOTgYB9LN8sjKY
 jlFji0hPuuBlUcWETAdRVD1nds21EE4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-MRgx7BRwOT-3vrO-8OW-QQ-1; Wed, 04 Sep 2024 04:54:36 -0400
X-MC-Unique: MRgx7BRwOT-3vrO-8OW-QQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a868b6d6882so75267566b.1
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2024 01:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725440075; x=1726044875;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ezlc8vSu3I+vO523cpu1dgSC/pfyb/IcH/8lA1aUKeA=;
 b=ZVbsqJswYDWumsUMhu2m4dBHhPdcpeZuwEIKeWa7LX8eUi0Ju/xh49BK63TyQQEjO5
 +71sS7X3IirbZzFQySzYBD3tdYANO33g/ALmd26ikm8EelHfB0jPVEDzA/OW+TOWplp4
 vl/xQjwh3WqGZXxscwrV4GSc+L1a+nKYFuwEnkZbN3JTHGRltQYfpTiuhCrRTwUDz3tU
 cxocKHhIzR8+wESwfRRDnlE7ts/cnF5ZqNDFoQVh7tspfSrMZpCFaoh3SsaZqxVM1Ino
 j20T/lpu9MDJc+YRr8fTl59CzVU9dXL4/gU62YsFEeZ5QAaleNxqbsr3EUdUUkAT1BUJ
 Y2aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCUDsvNsokkxR2FlpQ4zNyiz+baZfj4uBuFwcVlcq/5keQyAXYJzqid3+jUfBmEg4vLCuRNioj+A==@nongnu.org
X-Gm-Message-State: AOJu0YxnldISFzF2ojMKCUIvSAMeq9lydpK2q2bKm5M6GXnQpypitjRn
 Jy/c9AmJ4K3cXbU4pE3oxIUWbSglM73pxCeNcRjAwDEfOm6PnVsoxvUgtwK55I5ofhZoEWRsthu
 FsK8VWUulqShMBzo5OXh6cgw/2hRnPFo/po2R51qtzG+LaXu/sw==
X-Received: by 2002:a17:907:2da2:b0:a83:849e:ea80 with SMTP id
 a640c23a62f3a-a8a43209d7amr130369666b.32.1725440075193; 
 Wed, 04 Sep 2024 01:54:35 -0700 (PDT)
X-Received: by 2002:a17:907:2da2:b0:a83:849e:ea80 with SMTP id
 a640c23a62f3a-a8a43209d7amr130367166b.32.1725440074599; 
 Wed, 04 Sep 2024 01:54:34 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de.
 [109.43.176.181]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989213577sm785283566b.188.2024.09.04.01.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 01:54:34 -0700 (PDT)
Message-ID: <d8eea4b3-e84c-4844-bae2-4a52ac1d3e7d@redhat.com>
Date: Wed, 4 Sep 2024 10:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 02/53] hw/input: Drop ADS7846 device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-3-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903160751.4100218-3-peter.maydell@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: qCU05tzgOW2u

On 03/09/2024 18.07, Peter Maydell wrote:
> The ADS7846 touchscreen controller device was used only by
> the XScale-based PDA machine types. Now that they have been
> removed, this device is not used in the tree and can be
> deleted.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS          |   1 -
>   hw/input/ads7846.c   | 186 -------------------------------------------
>   hw/input/Kconfig     |   3 -
>   hw/input/meson.build |   1 -
>   4 files changed, 191 deletions(-)
>   delete mode 100644 hw/input/ads7846.c

Reviewed-by: Thomas Huth <thuth@redhat.com>

