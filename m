Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4746282lfp;
        Tue, 28 Sep 2021 03:52:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAnTnpR6J3p14jUeV1TDBk1yzLs3QgjJP4Donid50pJb0zWnFFg1RCnNZEl1MayBEuGgie
X-Received: by 2002:ac8:119:: with SMTP id e25mr4820151qtg.355.1632826365273;
        Tue, 28 Sep 2021 03:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632826365; cv=none;
        d=google.com; s=arc-20160816;
        b=SYkDlQqF3Ak2oFW6NU7mi8jP+wq5Qomgt8K/+F024LJJcEuc+mPoB8lm0TYj93mA18
         2t7Zr/351+hkG1Tf7EApom7y4mk/gP6Nhr0hwi79bCkdv2KAdyErS5kTBlnofqvKJmMX
         scWgE/LdDpfI2xTqvv8SFnqERJWCnmrKzrmXorr6RrKJCTf0s3iBTXRWt5cfaCyw36yo
         BlNWmvP+Mwu7lJj63dq1GB88YF9qXkGVT9D0iOM3Ib2+esKCDnhygwqUHI4D22Z2Bkks
         Fxv7n2O3rLPK52txNl4nOkyUwpwgR/59X97qB4n17spRsvJa+imnkJWeEM7PfAYp5hSZ
         fmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=B4QN6ffkNwssEPSKL8eMRkp+TnFcUhVX73cjOE6tgSE=;
        b=DojYMxjpVevS/3Z163U7VpNApr/LmejvkXOq6jVtBltXy28Lt9uzuHREFANtti7o1O
         mM1Rf1ZwSljE3vTH3oAeItGt7MpRB6OwwubEZaRfx2XzZq8SEpz2Qz8S0Hl+WmvjUVbv
         iH75W8XloLjGuouRjGzOc2v1ULKpqmt7WgpgF+aRpmlG6nghm1Emk5lpA+4JvLuful/D
         LxPWF5vAw4O1oblG8dQvh5sjXXAm8D9U4c32bUzSV8byAHK+LKuS2wMySzppvs22UArC
         Oq7NhoHXXomT3uutLt8sfooT9jcFgAnp9F7OlQorSJUdZQu63xbV7T4PXlX7dws5LB7m
         O1GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TFLzB+PE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si31232qtw.214.2021.09.28.03.52.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TFLzB+PE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAj6-00008t-Ks
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAhY-0006eo-06
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:51:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAhW-0001yU-Ig
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4QN6ffkNwssEPSKL8eMRkp+TnFcUhVX73cjOE6tgSE=;
 b=TFLzB+PEcEeGM/wFSwoRhXGnTjPf5cBA5IA+3RyCiNhWcVTUCdiqawjnc0xdClZJvgUgMp
 lH4tn6Z3izozjOW3IFRkrmFYuyzXAvczuhbagCDeKlNkGoWrqZYs3oj1mzUoEP6tTg/zAj
 M5GydfOR0htPY7//CWCNwX/3OptrBuU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-ta6NS4_8Mji443Ub6PYeZQ-1; Tue, 28 Sep 2021 06:51:04 -0400
X-MC-Unique: ta6NS4_8Mji443Ub6PYeZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so1817774wmc.2
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 03:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B4QN6ffkNwssEPSKL8eMRkp+TnFcUhVX73cjOE6tgSE=;
 b=gOiudTd6Dx7eMxLN7nMuHk32dRyQ0mrZn3sAILKWwghUZ5uH15iDlDGEMIoZATEXGN
 1Kmxgw19IDwHDgU87F6JrHHKwmMElkwYfww9X74uWMsNMVIvt2CSocgj7DkIYjd5iBcY
 a6E1D9QRe4WMjuzlrqUOE2+3z8/ZxEVDgAu6rfXoLxk8oJaGoLt3bODUT23faKh+Tw4l
 fihmM9MeZVrqMT47pQW1gliayh3afB9nNUa8zWTeKxgmExKbqPWcvemArvwi4RJRIU6l
 bm5EM15Q0na0tul7RxHYJkg9ZYVUlMqZoICs5LI7BB+r/Ke4gP8cieSRiOLmuv70OzDI
 fbgw==
X-Gm-Message-State: AOAM532gJ47StFWgh7QNj1rYMn0vq3Ga6tlAbeqCjBCQ9470eiBq+b5e
 XrkIjHWV5QBXd9jB8oQayV+KJok384WGCvjudrmmEGHlEOtJj44AEYJp1Jn1ROxVxUbKWKWATHo
 YqzXZPjpi3aE4
X-Received: by 2002:adf:de02:: with SMTP id b2mr5832910wrm.42.1632826263355;
 Tue, 28 Sep 2021 03:51:03 -0700 (PDT)
X-Received: by 2002:adf:de02:: with SMTP id b2mr5832891wrm.42.1632826263219;
 Tue, 28 Sep 2021 03:51:03 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y11sm23401304wrg.18.2021.09.28.03.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:51:02 -0700 (PDT)
Message-ID: <643d326d-ab10-9ea0-f9e0-5cca32a8fbc5@redhat.com>
Date: Tue, 28 Sep 2021 12:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 06/14] qtest/numa-test: Use detailed -smp CLIs in
 pc_dynamic_cpu_cfg
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-7-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-7-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 51k6nsRzt4y6

On 9/28/21 05:57, Yanan Wang wrote:
> Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
> the preference of sockets/cores in -smp parsing is considered liable
> to change, and actually we are going to change it in a coming commit.
> So it'll be more stable to use detailed -smp CLIs in testing if we
> have strong dependency on the parsing results.
> 
> pc_dynamic_cpu_cfg currently assumes/needs that there will be 2 CPU
> sockets with "-smp 2". To avoid breaking the test because of parsing
> logic change, now explicitly use "-smp 2,sockets=2".
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/qtest/numa-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

