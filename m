Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4713200lfp;
        Tue, 28 Sep 2021 03:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3wlX2gAXsujMFVD5PTj8EAPRVj/8uBJRtcyla5a9N4Z//36/L0qJ+BvG17uzgh5x8Cphn
X-Received: by 2002:a67:ba12:: with SMTP id l18mr3984897vsn.17.1632823608424;
        Tue, 28 Sep 2021 03:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632823608; cv=none;
        d=google.com; s=arc-20160816;
        b=SHnjmnu57vC200m4VLvUVRCR66+Y+lk26nwDni4HWP6Y2ubwwBbWFlGf4bXInMnaW9
         eAO6BVGhsGsw6pEr4XCUfEeCURnpBhDuNTfa79BWN55puMjW4GMhs2aWAVFet7b0CglI
         3COYKlO6u0FueWRl+pEZzJFA3WDkgssFgEchnLWOHyL8YVYd/lce3efb+52kFkWl/Ns4
         9ReIw7tM/5CtcptHKNmEfgWnVAoMtuU6awu0pzHhseK4QZoDkFPT+qlO+94sTmmTN1rF
         K8lTr2IkfCOiVhVsMb1XD2XEt1d+3KYbq/lvEa0k3+rspq7/Y6mwQxEraubdV2o0rhno
         9jZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=YBeOBbox1HwsF8JTwhOk9KD3iyUunnJtBddX7znXmGY=;
        b=Qz0L0+QFzIySjZ2k2bHN9OnlTDjp3Q8l8panL8mB1ccXHxRcCNfgXT36xh3Wq6ERBC
         OjlQYpztxk/gm6GJgfgMEl/XV01KypW0JBjAxTkWq/5unzqGvwj7Z4ye0V8L3kjpC6ct
         CNBAdveJa8nD4N9766erhSKJ3x59endT3et5wXTAJ8B3P5iHDHVaH07m8FyO3GxrG6FC
         n2cBW5/JottPCgg4Oqs4Vt4ldZx9Geu95l9xmRytYiOSs3GdaKCihmrz311338zGKxEI
         S0pKRKoC19B56a54KqNRpXwtUeSxr74UJ7YkVHjPxhjOnk6+yeeA8WEVJSJmTMojfeZG
         6c7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PALiaayF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si1874684vsm.253.2021.09.28.03.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PALiaayF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVA0d-0002Bs-Pn
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA0Q-0002BL-Ka
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA0O-0007Br-38
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632823590;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBeOBbox1HwsF8JTwhOk9KD3iyUunnJtBddX7znXmGY=;
 b=PALiaayFimOr8o47i+IaJnHhIhBgYcwylZIlYWnIfughDtxYAggNia2kN4NDNpIpLqzaJL
 WOLp46eBdyIcp5fPq/eA1ZgIWSsLdBHHdDFx/Nnay6hC78AiDfGUiSOYS4QEXTJrqyf30D
 h6TdqaoUT6LJftBO0Pr5stNuoH829qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-6om5TrKuMRmbbeGAA5zrYg-1; Tue, 28 Sep 2021 06:06:29 -0400
X-MC-Unique: 6om5TrKuMRmbbeGAA5zrYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8AB6180830C;
 Tue, 28 Sep 2021 10:06:27 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E07EF60871;
 Tue, 28 Sep 2021 10:06:17 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:06:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 02/14] machine: Minor refactor/fix for the smp parsers
Message-ID: <YVLpF6YlTWjjS3wE@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-3-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-3-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tUJUifPY3tmr

On Tue, Sep 28, 2021 at 11:57:43AM +0800, Yanan Wang wrote:
> To pave the way for the functional improvement in later patches,
> make some refactor/cleanup for the smp parsers, including using
> local maxcpus instead of ms->smp.max_cpus in the calculation,
> defaulting dies to 0 initially like other members, cleanup the
> sanity check for dies.
> 
> We actually also fix a hidden defect by avoiding directly using
> the provided *zero value* in the calculation, which could cause
> a segment fault (e.g. using dies=0 in the calculation).
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c | 18 ++++++++++--------
>  hw/i386/pc.c      | 23 ++++++++++++++---------
>  2 files changed, 24 insertions(+), 17 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

