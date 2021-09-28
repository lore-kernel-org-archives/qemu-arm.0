Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4745279lfp;
        Tue, 28 Sep 2021 03:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgD78yYCW1+ZRU3QhwbqZ//qYevpcLWhGGeO8Zv6RzsRrCtVbhHpWKS94ieG/1ZGEn9zNV
X-Received: by 2002:a4a:c119:: with SMTP id s25mr4359797oop.22.1632826269963;
        Tue, 28 Sep 2021 03:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632826269; cv=none;
        d=google.com; s=arc-20160816;
        b=gzzW1BCXMhQ7w726HqNHqIb0vunxMbrjMvxRxDSVQiIwO6BV+dVHQi2UfatxE+G16d
         vZ2FmX0Vf5jfrMDqUjxuH4IxwAWqIV/xpd/LuDsG4YLJEHtts0d3TR1Sabm/gE1jzR/d
         IL3gKepuvUt3ZKGGDzMvZKaruJ67FvePNbr8sCIyhwUMqdPaYHK+4W51ZccgOdH9DqI9
         62zn4S9KmWBpkktN16Vs7dtfTP5pXTKfvLKGeD2niFOAYWGw1qLDpw78r8p/nm9JlBLO
         uk51HV86WNM3KmTqwYD8Z/qZj9fRdKWP+WupaUDS4KCk9nkvqapWAPruTC8m0O15DSko
         QiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=KAwYqDZlugOnAtw9hBaQ/R0okDTCizvJ/y4xT6C3bEo=;
        b=NukrvZzZqnzApAUDuRCoW0zyxLdsC35rEwznM2E6CiPMvhho6WZHmf4Ja4M2lJSCSv
         GUYhM1dU9JguzRpwz7sP+nwXkqb4T6PTS17Ub6ECiRp7IsTueI1y2LhMBq0UupfHYMSO
         +zzgprM1RSg+c4q+xLHH+pWa28EEpmZ6/AVfTei8kABww2gZuK6ZTrmkI6VvryP6BRun
         30GD7Ulm8Ykg0cnbQUN8FTqXaHGRWFQqwlfIC+fcHZZcqioRXYIH1gnu66JOKtK+ZoJz
         4bbnstuoOHkQFGK+Rxgjy1EeT5cdz33I+9/mhgLtO9ZbZUlsSX6e67E6C+2jGeJnoM3e
         yRJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IDgUsYuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si18992647oot.65.2021.09.28.03.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IDgUsYuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAhZ-000679-6e
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAh2-0005xF-5t
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:50:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAgu-0001KT-DN
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:50:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAwYqDZlugOnAtw9hBaQ/R0okDTCizvJ/y4xT6C3bEo=;
 b=IDgUsYukFFZmsHkCiSpm5JneUab8RafJe7WxasDMjR/y+eOtNujdVTeCMjCU9K0+SfSr+/
 a3snmbV1b/ia3+qUT+pVjNg5cYoU8Z3xkR+2P3oBGFCF7wQiPLaUPilb1dTf0ETtTM3sOP
 SV0iCsEIQqVPN6iQov43N/ywK35sqZA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-724cxcp7MHyaW5CTPGfoSw-1; Tue, 28 Sep 2021 06:50:22 -0400
X-MC-Unique: 724cxcp7MHyaW5CTPGfoSw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n30-20020a05600c3b9e00b002fbbaada5d7so938942wms.7
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 03:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KAwYqDZlugOnAtw9hBaQ/R0okDTCizvJ/y4xT6C3bEo=;
 b=xhGbX1s6UexijYquW2ZSENctTlVOglUn36eTLe//EcgnLBAyRZ69IDPMy6hr8E3JuI
 QM6zTr+FZzShTK6FAm7zhmA2SPB//XMGs+5fqre2Qt9GMzzTUmJFzdkqSCA7psDzJ4ef
 7XLkR8GZyCHtc3V95CljmIV7a/x3fS/jNWm6kEa5UFMbHhZoQ9mmfunSYJQs3cMP/Gxl
 HnP/HXAZ3ZzMVdchmxB9bohnHJ69Xh/9NUFqBN2Wm3pTY4ERLdufIl/EitnnzLtOkB61
 IghWNhnmqMM11DNItpCGWfFE8pUd6wcReAKuV/ZJLBApnLHZk+IJsy6wS62IrKQAChq0
 syYw==
X-Gm-Message-State: AOAM533WLNkr0z+hXYZrwjwQ7/ibAVbAl4iaWNxVciHhFNAqBx5NpkXm
 k4wPgF8ECj8IDIqcdQempcYDfyrmOpNLQRmlfb9Jsp/f85eyg6PCfOOy8BebiYuNTUpCY5/1VGt
 Is2nZ66Xo0/sq
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr3949903wmh.61.1632826221394;
 Tue, 28 Sep 2021 03:50:21 -0700 (PDT)
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr3949873wmh.61.1632826221151;
 Tue, 28 Sep 2021 03:50:21 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s13sm2337610wmc.47.2021.09.28.03.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:50:20 -0700 (PDT)
Message-ID: <62d3c39e-5ba5-b608-feb0-c7817de08ca5@redhat.com>
Date: Tue, 28 Sep 2021 12:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 05/14] machine: Improve the error reporting of smp
 parsing
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-6-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-6-wangyanan55@huawei.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3U22XKTahjFK

On 9/28/21 05:57, Yanan Wang wrote:
> We have two requirements for a valid SMP configuration:
> the product of "sockets * cores * threads" must represent all the
> possible cpus, i.e., max_cpus, and then must include the initially
> present cpus, i.e., smp_cpus.
> 
> So we only need to ensure 1) "sockets * cores * threads == maxcpus"
> at first and then ensure 2) "maxcpus >= cpus". With a reasonable
> order of the sanity check, we can simplify the error reporting code.
> When reporting an error message we also report the exact value of
> each topology member to make users easily see what's going on.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c | 22 +++++++++-------------
>  hw/i386/pc.c      | 24 ++++++++++--------------
>  2 files changed, 19 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

