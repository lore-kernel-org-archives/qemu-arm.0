Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp625029ejb;
        Fri, 17 Mar 2023 01:23:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set8U/akDPyj415SNRXsz7/Epvw8EQeK2+7obYOUXM3s/AnBg060W/oQNUMAPeXRa5JYGzYfU
X-Received: by 2002:ad4:5746:0:b0:5bd:14f9:650f with SMTP id q6-20020ad45746000000b005bd14f9650fmr2775221qvx.45.1679041432084;
        Fri, 17 Mar 2023 01:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679041432; cv=none;
        d=google.com; s=arc-20160816;
        b=ypaYICgmtK2Y9wYtn48onPWngU7l+X/AiQdbVU8IE6/0eYSty5jXyARZBI9sjcBmgs
         205SMHmIXfld9+Ct7n/FLxeAIc0+8ktznbAnfKUKHLreC8W+Ed5IWu2XgcQOPgr2wPL5
         EqzW6fAg+A0jzQIyGgSLju7A8YAEX8VbQWkz2XXmcV4oudEq6DQEsQwLULi6JFn2BLlo
         Ejrfed32jdRzy3IXhfM78Q8Y/dewJo0k/XdNZjNuek64KwnJAQDU/RSAjI9ybmognZE9
         3IqlzSYe7q+fkE5aXyfp+ta7tJq7duPbastrsqIAAU5ai1/cI2HzkEwh3Fd0I0VQn0CC
         c5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iHgsqgsO5E6o6hDzqRYeUenlEPvFvFjVdUIrfaRUMC4=;
        b=aYI7sPpvDgHCfMnJxIxPc3pi+QoyF3chPwMF+ZCkZvRdLt0WagoXdewyZobQFrkv0u
         Xdna/nWhqVFxuip7HWArbAXnpFKLc76TWRqqQvCb+mKk+i5blZu7fQU3+HkRE4Io/hw8
         rKryuLoPyzBWhtMJQYbvjCid2krVEM8KTZcnwGXc9WEOpHPstPm6qQaziUndoV7F16Ei
         dP/asDi2VfEB2r51N0H1oYAEdavtuhJJVN6jC76powIDCMFXDwy0Z+dRrip2pU23hlC7
         tg9sDKRVQCAAm8SxnSojk4BodE4uuNlrup3ZOWtbDDs0ph5EljYpWvqjaIHJfVO6Mrq7
         uZuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KuyHonG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de6-20020a05620a370600b00745cf87f916si1234218qkb.534.2023.03.17.01.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Mar 2023 01:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KuyHonG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pd5N4-0003gr-Ul; Fri, 17 Mar 2023 04:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd5N3-0003gU-W0
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 04:23:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd5N0-0008Qx-P7
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 04:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679041405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHgsqgsO5E6o6hDzqRYeUenlEPvFvFjVdUIrfaRUMC4=;
 b=KuyHonG4oCZ1Wr/D8QhDatUpqu4acRj9w6KmYxuynePsKqShyMGM1nIWZmhrF/CMeMB6lB
 bmia/381CeS2SVXG7u6RksQKL1+VnSUuE81U3aOFnGnO/qqaR5qxl2CXbf92jUBS0bFrro
 h/g1TxeI0/LvfwY+HRAHhfg14Se3RT0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-O2tgDsL9MmeiQ_wd5OUlLg-1; Fri, 17 Mar 2023 04:23:24 -0400
X-MC-Unique: O2tgDsL9MmeiQ_wd5OUlLg-1
Received: by mail-wr1-f71.google.com with SMTP id
 7-20020a5d47a7000000b002be0eb97f4fso650138wrb.8
 for <qemu-arm@nongnu.org>; Fri, 17 Mar 2023 01:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679041403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHgsqgsO5E6o6hDzqRYeUenlEPvFvFjVdUIrfaRUMC4=;
 b=y5LqFQTlR29Ik6KmbeLyRYkAyccZTVspvt4aQQGZBXsaIqULNtwIPsH1cj6Pr5sope
 odyavNJMgh7TNvEA1oS/tZpFJLSvKFd06rOSAiT+nsfBM1D5m1veq8kQR0mkHvrwWYEO
 98ce1mO9hPy8P/kPj5yMeFCggvM2BkyqifG6Ub47KTsVRdnNeJrCzgXm0qjxalx6pH00
 6SFx+R/6iQpZR/D0K4gs0dA+rV5nhr/1Ypw6wSbMsP5iMsPzIGQ2Nva6mJXkhQTW55Tp
 mSbjJ/MkYCWbQunPpDh3PijLs+9tkbYVE/SZvC0yusv4dEjA0kLjFcM8QbYIiqusA+97
 RDqg==
X-Gm-Message-State: AO0yUKVcWe12ECRM/CR09ZSapHj7CgNAcbk20nNFqxr87S9SUw78Yq+8
 Tzlu3yNCkWAeOe1BongArt7j74jBqDc7vOBBX5ZLgL9NnJI/KUpUcQEx5m+sp7VivRHE2YXMX3y
 8p8PCg86qlT1z
X-Received: by 2002:a05:600c:3b14:b0:3ed:29f8:3ff2 with SMTP id
 m20-20020a05600c3b1400b003ed29f83ff2mr1624937wms.6.1679041403433; 
 Fri, 17 Mar 2023 01:23:23 -0700 (PDT)
X-Received: by 2002:a05:600c:3b14:b0:3ed:29f8:3ff2 with SMTP id
 m20-20020a05600c3b1400b003ed29f83ff2mr1624903wms.6.1679041403150; 
 Fri, 17 Mar 2023 01:23:23 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 d12-20020adffbcc000000b002c54e26bca5sm1375468wrs.49.2023.03.17.01.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:23:22 -0700 (PDT)
Message-ID: <63a4c7f7-052a-e388-7938-f1a85edbed7b@redhat.com>
Date: Fri, 17 Mar 2023 09:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.1] hw: Add compat machines for 8.1
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230314173009.152667-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230314173009.152667-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: khcqnvZ+s7S3

On 14/03/2023 18.30, Cornelia Huck wrote:
> Add 8.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 16 +++++++++++++---
>   hw/i386/pc_q35.c           | 14 ++++++++++++--
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 79 insertions(+), 10 deletions(-)

s390x part:
Reviewed-by: Thomas Huth <thuth@redhat.com>

