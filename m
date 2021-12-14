Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5347126lfk;
        Tue, 14 Dec 2021 07:10:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrWaSA40oXnFmb6JzvgxgLTbrnkoYfRjJqfuR8cV6/xFSVBU//MfDgOidsKHSm3+o1p+3B
X-Received: by 2002:a05:6122:78c:: with SMTP id k12mr2189358vkr.25.1639494649367;
        Tue, 14 Dec 2021 07:10:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639494649; cv=none;
        d=google.com; s=arc-20160816;
        b=H3k5gwiMBH2tE2eevQOB9YMAtUWQowr1ZaodVc+DGqmIj1BNcNH8NYqBqFxHFlMO/K
         kqEyM29YiNkj5lwehm+LegC6wOXFe3Xl5YfW+UETVxOTsIKm++Nms88oD9jzaO0ZN3gs
         2debAyGNVHYYA3rNSV4CzJbUJ1RGvssRFAVYnSQHkGAEQSVGmtoHFj8UBSwwKsJLK5Nf
         hKH8aS+UWyzKhCgYD4+z4M35XGYrkcmAu5K/LDhK/zHKoJIFERC6kb02+kr+GnacdzGh
         lX6N0seElexvxa9WcEEMKZ4AcKLDI3347rbmPR8zXjZfwA2DtTnAtpczag2WFi9v0OOW
         fbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=UELiAFa06bqfv3MYs61cRJQVlzvTiqq6BAXaN/4l6zg=;
        b=se1ixlkzLHNaCI+afhL/JuOLj3onrHX48/GwgTDexYaYMcQJVZ/Yv0PBXtD52m8luW
         BkjXTOyDwBkeT0KoBY7e4k+azvKhUbo+ATiBxlDDv+Mdn4IdYKS2ET/tSaoMu8bUAiiH
         lmVFmEDIKIqCDTGMrqGNhkxVto2VVr1qcJicdfmiwbhMs44Vcj3P+1aoLKGPXrs3gSq6
         mOEwYOaYdEQKmUeBkNzpGYSyDHEigNH/wFY/pv1N5h1jvK2vrs/PTb2n7Fps0sHg4Jao
         InFUSJTXGSWuq0DzhMELfq/71i55Ui551ZPS+Nkhj2bfky71qYjQRny3pLWmR6+a70L4
         iVDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ecUPHb6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si129816vka.73.2021.12.14.07.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Dec 2021 07:10:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ecUPHb6V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mx9S4-0006AW-NH
	for alex.bennee@linaro.org; Tue, 14 Dec 2021 10:10:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx9Rr-00060I-MG
 for qemu-arm@nongnu.org; Tue, 14 Dec 2021 10:10:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx9Rn-0002ab-PB
 for qemu-arm@nongnu.org; Tue, 14 Dec 2021 10:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639494630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UELiAFa06bqfv3MYs61cRJQVlzvTiqq6BAXaN/4l6zg=;
 b=ecUPHb6VLP556tIX0IB/zWiZkC/6cvuX6USGaYwCiGdiR9QjbB1w4Os2B4TmMY9XnS4h3v
 XVHV32wRtU1l0j0ogoA+eOGEU3fD3kjmoJ0KVrCaNcvCm+RuGFxWth/tiHCBGLlPEajhEG
 QZ9l5NYjl22WQLjQf5HOWv9UzTqcr70=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-sQRrkUQYPBG3E-c6dncjXQ-1; Tue, 14 Dec 2021 10:10:29 -0500
X-MC-Unique: sQRrkUQYPBG3E-c6dncjXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso13295749wme.8
 for <qemu-arm@nongnu.org>; Tue, 14 Dec 2021 07:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UELiAFa06bqfv3MYs61cRJQVlzvTiqq6BAXaN/4l6zg=;
 b=tcTwg1Q751CIxcH360Em781yy52qvn68KvkpcmYDLzcx8hXZ2iF7gd1TtrlMVeOC7+
 V/HIuaxryWpBjLsa97ZIccN3Qk8ixUGKuwl+Zt12bq8c6hKvJjJkwnr6s5qi/FmcYoW8
 tTkZQumMpMTcqezuWBwDMLzvPQihGJaJ1BuxSbq9tY/L5Y0Fs/zMWgJgtj5RHXvOQlRf
 nRt4RUq+bUoUUCM4/564o4zFcnHP/+r/Dfq07xRcWcrVzOQW1PHrAWFTxaL3KMPJhS5a
 3hZkfv+SiYDD4Tv403SaeSsnraqWh56N+UcGU4M23dR9rS0t325Svm93JR7i+P9u6X/z
 r3Mw==
X-Gm-Message-State: AOAM530Nd4sZaBDapLTAIRq9ADSuzyxhkHaSkP+sO0ZjASWewc1lAEKq
 NskiSGqTppPFBJ7izDdU/DkQQvCDwu3cvssgwqOXfEe975Fp/QD4MTKwI5frZJc3VGr3HRb4lOw
 pZEaI8LxTs2ha
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr7610369wmh.18.1639494627831; 
 Tue, 14 Dec 2021 07:10:27 -0800 (PST)
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr7610334wmh.18.1639494627626; 
 Tue, 14 Dec 2021 07:10:27 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id q1sm127858wra.82.2021.12.14.07.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:10:27 -0800 (PST)
Message-ID: <5e98f893-d69f-06e2-cb20-65a770058d9a@redhat.com>
Date: Tue, 14 Dec 2021 16:10:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20211208170241.110551-1-cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211208170241.110551-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WOr5yZ+O+kd3

On 12/8/21 18:02, Cornelia Huck wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)

This is a good idea to add all new compat machines
as a single patch.

