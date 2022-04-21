Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp348321lfk;
        Thu, 21 Apr 2022 06:18:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybgmSI+Bam3MRBKASfSCIDUA7sBmPgTXUiddejD2keluQqHPSxkLKMKiux3nENvONQd/2r
X-Received: by 2002:a05:622a:296:b0:2f2:4a5:a03c with SMTP id z22-20020a05622a029600b002f204a5a03cmr11577584qtw.368.1650547115379;
        Thu, 21 Apr 2022 06:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650547115; cv=none;
        d=google.com; s=arc-20160816;
        b=Zm63Vro8WU1glc519NV6hTeZpaOFBVbQjMzHqReQvXVRkWd0SpgSvyKvFaeCd1YNsl
         Z+BOIhaoSU7TRBIuVX+flri6UDKz+oiyPRL6NVQl15OlUYXOvMJ0wO1MYJVVWelGqPK+
         vGng7ItO5B7E1W+KVN24IU/et29OnaO5Hqw8OZOoPWGT6neJUGEMDcIi8ld8SqKLVTM2
         nmeBQ8OGaBr2c0gc9E31+xznd3IGD8IyXQs2vCu6YmLpuqLc0rvl99JeeRh33N4BIA8N
         97Mx1P5ahQdCWdy2xAoVUW1ovzmS97a+SGLCX0VsSISRKY2WfMpD+VARLyEUISHKxiHZ
         9qZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=sZYPE/3NfBln84Dnp4a3wVYonMsaZ0/n0bim+kBydkA=;
        b=dJFfzYNRUkoeAO0JqRI9CzUyTFvBLFbnlk8X2L3G9UvEUn7OB6sjTxyK1kTnzPKAvJ
         gxn6L2FsS/jzTEK7HnSwrGK9J7VhOr7kVyI3m9EgovfSZOj5DXuU/m0/ojgjpWyxp3/O
         EkKc/LhaL61Z+bnmHjpWJ540pR8CXjSqsnfLQzO4jbYwvu0v8/4XdgK1SVTt6uIwqvLk
         I1qfBGGhgzcmrh4cEOvmCNd3i8CpDf0R62t0hVw7SFYSh8vxH9oSX69fLpTNNg5OW+v1
         snkbmrsYSBPGm0Z95TAXPCNyst/eoLYXDD9YDTcYoNswd7VXLXFihAgN9/u+Ixo8FPuY
         koDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aYPz++Bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf11-20020a0562142a4b00b004465de19c95si1409269qvb.234.2022.04.21.06.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 06:18:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aYPz++Bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhWhe-0003xY-JU
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 09:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhWhV-0003xL-Kk
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 09:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhWhS-0008Vp-3W
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 09:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650547100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sZYPE/3NfBln84Dnp4a3wVYonMsaZ0/n0bim+kBydkA=;
 b=aYPz++Bobz/YAC3XIa0dP32+nq1L1AoxzhrndLlsd95IQmEcZThinA/B/Lp6CNr+nQf9RD
 j2vOvdXJXVN2ZRGeDIDzxsic28mwL20o4YyD5WryDsbUocZjhUBKTbf79wxT82iFU6xITT
 hngESpbl8Cj+lkYHDTEFTa1s09YI9vc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-UADTmHNQNdW8JwoNmvnU9w-1; Thu, 21 Apr 2022 09:18:17 -0400
X-MC-Unique: UADTmHNQNdW8JwoNmvnU9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B522B280534C;
 Thu, 21 Apr 2022 13:18:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E21415F4E;
 Thu, 21 Apr 2022 13:18:15 +0000 (UTC)
Date: Thu, 21 Apr 2022 14:18:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmFZlbM/ZAlKM1im@redhat.com>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: b.galvani@gmail.com, qemu-arm@nongnu.org,
 Corentin Labbe <clabbe@baylibre.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +/qfbGDSMWzT

On Thu, Apr 21, 2022 at 01:38:00PM +0100, Peter Maydell wrote:
> On Sun, 10 Apr 2022 at 20:12, Corentin Labbe <clabbe@baylibre.com> wrote:
> >
> > From: Corentin LABBE <clabbe@baylibre.com>
> >
> > The Allwinner A10 has a cryptographic offloader device which
> > could be easily emulated.
> > The emulated device is tested with Linux only as any of BSD does not
> > support it.
> >
> > Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
> 

> > +The ``sun4i-ss`` emulates the Allwinner cryptographic offloader
> > +present on early Allwinner SoCs (A10, A10s, A13, A20, A33)
> > +In qemu only A10 via the cubieboard machine is supported.
> > +
> > +The emulated hardware is capable of handling the following algorithms:
> > +- SHA1 and MD5 hash algorithms
> > +- AES/DES/DES3 in CBC/ECB
> > +- PRNG
> > +
> > +The emulated hardware does not handle yet:
> > +- CTS for AES
> > +- CTR for AES/DES/DES3



> > @@ -48,6 +50,10 @@ static void aw_a10_init(Object *obj)
> >
> >      object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
> >
> > +#if defined CONFIG_NETTLE
> > +    object_initialize_child(obj, "crypto", &s->crypto, TYPE_AW_SUN4I_SS);
> > +#endif
> 
> Don't put this kind of ifdef into device/SoC code, please.
> The device emulation needs to work regardless of what
> the specific crypto backends that got compiled into QEMU are.
> 
> > +#include <nettle/aes.h>
> > +#include <nettle/cbc.h>
> > +#include <nettle/des.h>
> > +#include <nettle/md5.h>
> > +#include <nettle/sha1.h>
> 
> Similarly, don't directly include nettle headers. The device needs
> to use the backend-agnostic headers from include/crypto. To the
> extent that they aren't sufficient to implement this device we
> can look at enhancing them.

The include/crypto/{cipher,hash}.h files should provide APIs that
cover these uses cases from what I see in this patch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

