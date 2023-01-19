Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp272703ejc;
        Thu, 19 Jan 2023 04:03:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvKR8aM4YJFsDOuZ8QvZs4rKH7iAc1/ki8ReRZogLlzHoGmqj43SBbfkFEwv3/hr/5lsuzx
X-Received: by 2002:a1f:244b:0:b0:3b8:7586:c194 with SMTP id k72-20020a1f244b000000b003b87586c194mr6015462vkk.3.1674129835832;
        Thu, 19 Jan 2023 04:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674129835; cv=none;
        d=google.com; s=arc-20160816;
        b=EYlslGVkrFNxkUsUFAcyrZOvDebDs6ezXeJycuweNz0sGPuDD9Xm1TF2UTd6f9IykS
         uBMJYvO9d6kJMp+4x2BxpAUd9+IgcYQ/YHlpQePTmdzjjxPNh76i87KjHevuLTvycYse
         UfIshBOoPNq8TDofS+WQJ1I/i5u8hSB0uV3y6LSf5iKv770mywmoyeZooFWpemrFXt4H
         ZEshVs4K+CapNBjDvCAsrLDMmA5BOi0P6tgGs6+1SMMjGHM6dcQuYA6ACYd38ZkoBN4q
         P9FFwrdK887l5AaKNHawmHB/bzERDaJAsgjIIElDNs2S5YijAcSog3nwkFCOBRgrBiZ6
         FgcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WjF7bL11kEHUmwtj+dctqzKHVoL4fJEuPmXRLjsup0c=;
        b=eJe3p4omGQ0NspXQoMfelDmqZF2Wb08T9gQaOAJSBLnr5/TlgudvkoFJtc8UpDdQsm
         A9/dEyR3QgjizmGXBilzzM4y76E/aUKgygq6l/fVAFH3Ywy+MsOxvd68jLSm8adBx0Xd
         jmT4Jsi+JUlbbPlTGU8DstaJQ70bv/8NWdPhIyCwb4FYdukHCdvYepZDC4b+zqGEaC7P
         CWPog8z9NXi6Jj6y14PaugRt0b+KXatqA0EwVWKTGWv4OuoscXIkht2A3u9ToNta5so7
         qVvv/s5HgkD7GpmkPJHjF95jr/a+WsbnAZz5s/bO3lrfBgIR4MwYOdIjbzl/uSgffULD
         8RlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b=nX4+P0JM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020a1f1e04000000b003bd778d4d24si9561140vke.250.2023.01.19.04.03.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:03:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@crudebyte.com header.s=kylie header.b=nX4+P0JM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=crudebyte.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pITdI-0006cp-QK; Thu, 19 Jan 2023 07:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pITcc-0006Mx-Ao; Thu, 19 Jan 2023 07:02:35 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pITcU-0001Sr-W9; Thu, 19 Jan 2023 07:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=WjF7bL11kEHUmwtj+dctqzKHVoL4fJEuPmXRLjsup0c=; b=nX4+P0JMIHpctmgm+Nnama6bTP
 zpBHG4Q2xowGKfZQfbsiO/aNE0pr8zFNc8EbPxsDg5Kl7ewa6uYFK3rJ6ZDMOMrl9zzoFF54pPoeD
 DIElbamtl153IF607J5gkVVDbBwnoXbHjsTIKr9acKO4rW5jGIkLBVD9fz5s823CX2cJYd/GdF/pC
 4fy48zhFjG+XegVcIu7hsP1BuHGXw8vPUoC1ZASFyVDc1euHTfLr8Zg09eERH1SZeC/es37VJ+KXV
 pF72jo+QoTJkNVzmXn406jND06HzWEDT7LO9tL/W+r0Z7ocdAqPCqgsidWM77Sup+e40SaSfShPGk
 Gm1oxrQMmIA9QwS23UME92QibRkZHkksAnYjwMDCZuwjQaa7jXhQI6VKvmmerE8kbMXgdT9jH4qm0
 ymCQU1MSM+RVcAuSnpFDxhJhTRg5P0o8YwioDWAtcQB/9K0GBtHLstYOidS1Cx2luz0vL9Tpc+83N
 3KwIj2YUw+1FD2pojJE4/b/+MirZINybTVI57JWk/4W9dsArQXvThUQwqQH54OyoTyX1PWZOeZ5sX
 5WHVT8zgEgHSIPYAAXGx7m9KA4OhvOBIXqxTe6GB+SdP5kl2EFyTMSDBQ9M6EsCujLQRPiAPfNNFY
 CaUhVAFr0tkIseqU/ThzZDsjYJgQEsvkFfyZE4GJk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org,
 berrange@redhat.com, groug@kaod.org, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 18/19] 9p: Drop superfluous include of linux/limits.h
Date: Thu, 19 Jan 2023 13:01:39 +0100
Message-ID: <2538017.PJiUfBrKnX@silver>
In-Reply-To: <87ilh2vmib.fsf@pond.sub.org>
References: <20230119065959.3104012-1-armbru@redhat.com>
 <5266030.ICAI56zT51@silver> <87ilh2vmib.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9NWLsqysXshI

On Thursday, January 19, 2023 11:37:00 AM CET Markus Armbruster wrote:
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> 
> > On Thursday, January 19, 2023 7:59:58 AM CET Markus Armbruster wrote:
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  hw/9pfs/9p.c | 3 ---
> >>  1 file changed, 3 deletions(-)
> >> 
> >> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> >> index 9621ec1341..aa736af380 100644
> >> --- a/hw/9pfs/9p.c
> >> +++ b/hw/9pfs/9p.c
> >> @@ -17,9 +17,6 @@
> >>   */
> >>  
> >>  #include "qemu/osdep.h"
> >> -#ifdef CONFIG_LINUX
> >> -#include <linux/limits.h>
> >> -#endif
> >>  #include <glib/gprintf.h>
> >>  #include "hw/virtio/virtio.h"
> >>  #include "qapi/error.h"
> >> 
> >
> > Where did that base version come from? I don't see it anywhere in history. 
> > Last relevant change in context was a136d17590a.
> 
> Current master (7ec8aeb6048) has
> 
>     #include "qemu/osdep.h"
>     #ifdef CONFIG_LINUX
>     #include <linux/limits.h>
>     #else
>     #include <limits.h>
>     #endif
>     #include <glib/gprintf.h>
> 
> The previous commit changes it to
> 
>     #include "qemu/osdep.h"
>     #ifdef CONFIG_LINUX
>     #include <linux/limits.h>
>     #endif
>     #include <glib/gprintf.h>
> 
> because "qemu/osdep.h" already includes <limits.h>.
> 
> Clearer now?

Ah, right I missed that in your previous patch. Thanks!

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck


