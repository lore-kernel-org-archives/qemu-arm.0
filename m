Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5243543lfk;
        Tue, 14 Dec 2021 05:22:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/Gz9JI2sR/8mMFEW1pbuEp5GtrQkoUQuJS5usgXgSVkUONrUK4HAweQ/HGOA0e95a/ylR
X-Received: by 2002:ac8:7fc5:: with SMTP id b5mr5887003qtk.492.1639488141844;
        Tue, 14 Dec 2021 05:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639488141; cv=none;
        d=google.com; s=arc-20160816;
        b=rjTh0eeiqacHgA2g1D4/TlQx+V4O0s5Fc1Gn116sv/S5roXnx9H72ljv23x5E/jJIz
         87A0G7ie1QvlmyzEltb/801UCIidNhvgb4FGtnBp/QN9rr/J1FJzciMTlQQPPflSSHKV
         KQ5yI0CfyE+m5pNsBkBZGEIFOKZBUX8fppkncvdwUKky+jxSaw2sZp4nyWC2TvgZCE+8
         AdamaXX3kRVzbdiVSjvuDcIz9A+htN24SPVaV0aoaWfTmG3Hi1DduJLIQqb5fj6RmfaX
         nxogi+xPHcx3ICsnvaAXd3GzQXXj4g9JSTsrBJJ1l9OJ5pV7oMGyIro2YWEztB/ee5Sw
         5E/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Ea3CbCHcLhDk9o9oK6T8lothLdws7OrRu+ylDCTQ5zo=;
        b=zs2YzsV2MFGO5wbJxmhdpEYOZqOAyE3xlPj0Lgx04pzvwD0WJ6znhTkZF2lQDX4KyL
         +y/pjc1NUJBRNb+ucCGDCu3zlnhVFo38X3imXsXmerkgiTI5bZanGJN5aUjNE0lfNMtu
         Wfb1J/6pvDWOmmDOV23U35ySzxKZ1kBW85BLQIT0x/nn5PdOxSBzGhg99NrfMTIS4rkI
         EylQe8KxORRNR5UEyEroXWRlWz55w13o+N1i6wQ2uK4tsTuTkhmghDjG+EV3o4aOGC4c
         XXcsnz4bwlfZsrCoIDibGPBWjUzVce661ttxFmuKeyfzS37qyPZkJBW+WK+aTMNDnG0z
         FBuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="KH/Uge8u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si16469168qtp.169.2021.12.14.05.22.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Dec 2021 05:22:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="KH/Uge8u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mx7l7-0007wC-9T
	for alex.bennee@linaro.org; Tue, 14 Dec 2021 08:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mx7f3-0001Uv-VW
 for qemu-arm@nongnu.org; Tue, 14 Dec 2021 08:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mx7f0-0001WV-L1
 for qemu-arm@nongnu.org; Tue, 14 Dec 2021 08:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639487762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ea3CbCHcLhDk9o9oK6T8lothLdws7OrRu+ylDCTQ5zo=;
 b=KH/Uge8u6/ex6xSJuyDR14OZMsFe+u1v40z9CeA1OCiIAnVW5ztfPY7D2GioHVpsEZ2rBJ
 jrItKOvPfgxus2ys6OCaJUJD3rgxXG3JrCztuHvj2H+I6EP6VYTnFdnB5lxwL/2PUy91G6
 9e/AXsXZgFSb3ej7FE1IYIDOgN3PsFU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-cTblc2BNOoa7tKfAJ_VcCA-1; Tue, 14 Dec 2021 08:16:00 -0500
X-MC-Unique: cTblc2BNOoa7tKfAJ_VcCA-1
Received: by mail-wm1-f71.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so11286635wma.1
 for <qemu-arm@nongnu.org>; Tue, 14 Dec 2021 05:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ea3CbCHcLhDk9o9oK6T8lothLdws7OrRu+ylDCTQ5zo=;
 b=0TUYqNyIsfXj0ulpMSycq5nyvLxksm0x6f1n7z3Kmodsm87dD++QbFfRNlqKijMiKU
 pz0SD8B19jr8xbuEp86iXe/cUDLvzBM6rKo3HJJ/pzWYytcbXDMlSoRMrCvvwdn+k66g
 HigGkEvA+59n9nFINGKd0F71mvG8AdPa1VZEegZ4YpM7+VbBbLEHkIODP7eCfof5a9XC
 26txczHsksJJU1Q5VZ+wz3eShkEJ2ceylqAh4R79oSLpbPn4RIl4Cl4xZpKualXyR38j
 bHFkbo+ZQ+u+ZvFfq6fRa6dJiH8Ee1I+USE3rxmnNvckqF18Z8eir+NJ/grsmWf5Lzo7
 8ing==
X-Gm-Message-State: AOAM5321V06T3xnp2ffbpwaVdECW0H7vJ/NMj4pNslb9Ifl2ksEWozEt
 xR2WxVJ/o/sDr8QUYvrW1F3P31BQ79WSUnmZau3ya4B2muq7uNVA9PF5AN84wPtZjo4BYtTBh0A
 Ogw/7IjqBW98w
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr5827171wrr.143.1639487759752; 
 Tue, 14 Dec 2021 05:15:59 -0800 (PST)
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr5827127wrr.143.1639487759535; 
 Tue, 14 Dec 2021 05:15:59 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id w7sm13529474wru.51.2021.12.14.05.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:15:58 -0800 (PST)
Message-ID: <4e9fd884-6b07-71d0-d153-3324f2563679@redhat.com>
Date: Tue, 14 Dec 2021 14:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20211208170241.110551-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211208170241.110551-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
X-TUID: 1v9CkAG+fG/T

On 08/12/2021 18.02, Cornelia Huck wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   9 files changed, 71 insertions(+), 6 deletions(-)

Thanks, I've queued this to my s390x-next branch now (since nobody else 
objected, I assume the patch should be fine for everybody).

  Thomas

