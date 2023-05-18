Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp796449ejq;
        Thu, 18 May 2023 14:34:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7V+pIWSm/+nRAY3fsHXs4nDO5SShcO8FjZeJN7KkUKcXEoQh0UvIKTgF6lW45RZRn3khfZ
X-Received: by 2002:a05:622a:118d:b0:3f5:3991:97a5 with SMTP id m13-20020a05622a118d00b003f5399197a5mr2278796qtk.54.1684445679789;
        Thu, 18 May 2023 14:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684445679; cv=none;
        d=google.com; s=arc-20160816;
        b=niNiETzwW9S20Gym7/7fIj1sN1EwOyIuin655hZCg7vtcm63JucoOV9MgzbuPzdkgc
         Rr9D1rlVHULBNaOErJ+M+k9vAkbUHRFXiqgRqM0ICPFTN8//9HzHYYSXVTJ7CWnIfrD4
         B5xTI1ZgoQ06qgoduRi2XJ21ijBtuebXsVzDfk0uGykFgSqp08nxuH5hNPy97UJqe6YG
         zN8Qc7iCSDHjDyt8Qer8xRrB1ZTw0WJ8kIDzhSRKFeuSwD2GA4Q5nh129aDPBtxeCLgt
         1msXcaTO0WwSS+cJ/Ah+M87YZwP80f0jbzO5r/FwABPK8O1qWWFZXFnSuiV8zESUbbRU
         Ba+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7s09xnxpexVz0QYNy4nSoOKMhOyh8D0WhQK8jBI3lIo=;
        b=IT/0U2P9p4o0p9dsNimSYsdZU1wKWwHDtgkITazCYgNhXjItoclckWsSj17fQzi5/N
         dpAvZ55AgMjwqMx8dy1tOIgHUCG1jVC8mgkey1f7f6/VDknEYvlFF+OF5G2wFKul8Mec
         Qbb+XwzDcKS988l9e6D7aCrJLIJViFyewVCPwl62VmzTU1T5ObmfV9jqhLjTAT5yzwir
         QDqLEfe4MtzMSxN0bBOPaVIj3I1aY6horgXCZOnlDFzqZlb5XzN9yEhjDepFcMKiahWW
         PXg6AwjLqZD6zsgI0+xutasWcVYQ0vaDagsymi4Gaba7Wd5/yb1Yj9zgIK9iUMy414H+
         xBMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RD+jN+2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17-20020ac85cd1000000b003ef3204c658si1713924qta.490.2023.05.18.14.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 May 2023 14:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RD+jN+2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pzlG5-0007IZ-TW; Thu, 18 May 2023 17:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pzlG4-0007I7-63
 for qemu-arm@nongnu.org; Thu, 18 May 2023 17:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pzlG2-0006ha-O3
 for qemu-arm@nongnu.org; Thu, 18 May 2023 17:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684445638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7s09xnxpexVz0QYNy4nSoOKMhOyh8D0WhQK8jBI3lIo=;
 b=RD+jN+2pwHYhtcak0mbTtNDSciIosanOkmV86fCNUa/+S2IQelOG/KB+PxZGzNIk9RdPRr
 aEA//TgCJ83A+gv2KSpGx9BUUaTVyUFVaGslz/V1mn3hjj0k2UdOEgJVBzl3zi3PoOyCRD
 ywBUBc5BSQvZj7tC3bVP631UoLpGRe0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-LsbmThUpPD-k9bEknbUVgg-1; Thu, 18 May 2023 17:33:53 -0400
X-MC-Unique: LsbmThUpPD-k9bEknbUVgg-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ad8df9f9a8so14146631fa.1
 for <qemu-arm@nongnu.org>; Thu, 18 May 2023 14:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684445632; x=1687037632;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7s09xnxpexVz0QYNy4nSoOKMhOyh8D0WhQK8jBI3lIo=;
 b=igAUjeI3ryN6MRI92APKWNcvvB88nUmnKamvRAK16pYA7s4E7PVpRXaXye72FLmpCf
 gVe+qHC/AI1eDmTX+owg5dX02i9VRjuY9fkPK10r3MYmvwEleKI0+zlcLMnXFWeByR0o
 BKcyhXPJSpB2V+JjH5ch/uSTSAs5JqJ5Q/Bbyk0VMSn8wEuI10XNJULcje6RJ2BHXAsw
 lNa311IREyo5QcN1q8oslk8VOzZuNellK7gHSYcrKV/uXGbm6j8iEPyv9Bdn5vTe8z5I
 sdc8AZBV81YdnHARgMNtMEgFoGdytPP6iv2JGH5a3/+TH/UjeyesMt4IOJrXFod3ldRK
 VLSg==
X-Gm-Message-State: AC+VfDwLzGX/JHceNuHC02WJ9pOFyzWBF812C0Pu07CsuriDIhGh6GzU
 kRMRhY5KBOEuPbxl57JvidSYrpXgWWHN06mmZJ3BuEyaZOzM5pcGQ8MkJOsbCa91GLN2/MnD+Ml
 ayDjEtp65I/rF
X-Received: by 2002:ac2:5973:0:b0:4f3:98b4:e45a with SMTP id
 h19-20020ac25973000000b004f398b4e45amr84466lfp.21.1684445632284; 
 Thu, 18 May 2023 14:33:52 -0700 (PDT)
X-Received: by 2002:ac2:5973:0:b0:4f3:98b4:e45a with SMTP id
 h19-20020ac25973000000b004f398b4e45amr84451lfp.21.1684445631892; 
 Thu, 18 May 2023 14:33:51 -0700 (PDT)
Received: from redhat.com ([2a02:14f:175:3e4d:6703:27b9:6f74:5282])
 by smtp.gmail.com with ESMTPSA id
 s18-20020ac25fb2000000b004edb8fac1cesm363730lfe.215.2023.05.18.14.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 14:33:51 -0700 (PDT)
Date: Thu, 18 May 2023 17:33:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/4] Trivial cleanups
Message-ID: <20230518173332-mutt-send-email-mst@kernel.org>
References: <20230513100906.46672-1-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230513100906.46672-1-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: ayxCiEjRQYuU

On Sat, May 13, 2023 at 12:09:02PM +0200, Bernhard Beschow wrote:
> This series:
> * Removes dead code from omap_uart and i82378
> * Resolves redundant code in the i8254 timer devices
> * Replaces string literals by macro usage for TYPE_ISA_PARALLEL devices
> 
> Bernhard Beschow (4):
>   hw/timer/i8254_common: Share "iobase" property via base class
>   hw/arm/omap: Remove unused omap_uart_attach()
>   hw/char/parallel: Export TYPE_ISA_PARALLEL macro
>   hw/isa/i82378: Remove unused "io" attribute


Acked-by: Michael S. Tsirkin <mst@redhat.com>

>  include/hw/arm/omap.h      | 1 -
>  include/hw/char/parallel.h | 2 ++
>  hw/char/omap_uart.c        | 9 ---------
>  hw/char/parallel-isa.c     | 2 +-
>  hw/char/parallel.c         | 1 -
>  hw/i386/kvm/i8254.c        | 1 -
>  hw/isa/i82378.c            | 1 -
>  hw/isa/isa-superio.c       | 3 ++-
>  hw/timer/i8254.c           | 6 ------
>  hw/timer/i8254_common.c    | 6 ++++++
>  10 files changed, 11 insertions(+), 21 deletions(-)
> 
> -- 
> 2.40.1
> 

