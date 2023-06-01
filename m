Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp495234ejb;
        Thu, 1 Jun 2023 07:37:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7YcrnT8U5WfZGzFURBfbBsC9SRs2FvdmdEuQlaKrZQ6EohvhXiMbHzXa1+lUYJm768svvz
X-Received: by 2002:a05:6214:e63:b0:628:335a:174d with SMTP id jz3-20020a0562140e6300b00628335a174dmr5252973qvb.36.1685630255682;
        Thu, 01 Jun 2023 07:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685630255; cv=none;
        d=google.com; s=arc-20160816;
        b=04H+R3dqYjvgS5fc493bRREjzmTtTH7tdD87d5JF0lbY2KtlXFEH2La5ntAXs/CFCm
         KJQmCUk8MneNxlufZdZE3s5Kt3nbID++HrIX2EjOLMQfDR3/lqtnKc9TQO6/+M7Y84nL
         RETgnFNOFsk58w62SaUrim9sPv/RVmE7w1/rC9pQWjAiEN/4kl+KOHfL1kY9nDcw9SvS
         Lw3G7qsXPT4OGdh2rYwl+SbZxqXBIsvLRBXsFM05uN4aZ0v/oLRNR4oiGJwSSebYUzER
         97HuFMNV84z36gsk+lfI4Xv9rucK3NjOW9xpKZNLR4tU1018Pya6SLKcGd2oWaBLv4Ig
         Yo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=CjWPm8/seOc+I32CVwyLov08i9XEn5i9AkTXXoaVIZE=;
        b=KaE5q9I5nTjdO+ZNus+0xoe5FWxXvTCzwPYVU7Hc/m1PLwGCERPU7+VW4QgNz6qg+B
         xcDr/Vy1HCq/WK/C+XrAxGoQuX9HXmIIr/r1Y7CPuK+VxT00ekmNro9ZKBqgBayFKCoa
         og7ofAkSiY+nnyOXWUBdoM6jZCpzrH1QhXS5TT27hEqLyX3+qq4g+VBcSmcQQ4D9l8Kt
         BwjyXRD9xXT+2H7JcJ1MlziIh3LsrA2VCZWq66wufIEl8WvqICUdwcrsAN/qgHxTFtrm
         wASMbSXRfb1dYfZDIplHjPaV3BFVQlwHMlBltbjA8EV6pa7tty5J6/AsmaD71+UJRG9b
         +hhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nspn7Rpk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5-20020a0562141bc500b0062388040b4csi9864052qvc.203.2023.06.01.07.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 07:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nspn7Rpk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4jQg-0001oA-Ci; Thu, 01 Jun 2023 10:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q4jQd-0001nH-N1
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 10:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q4jQT-0001Yc-7D
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 10:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685630234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjWPm8/seOc+I32CVwyLov08i9XEn5i9AkTXXoaVIZE=;
 b=Nspn7RpkR64JxLsD2tfTpiVORLy1gQ+NC9hani6295x6qvUdwcE9NkzIzCj48MhJhdVLDU
 P4Tzr7aZBc21+FvOg2OOGu8P8XvH2yQYUbS3SfzwcrJbq/QP30/EHz56Bz202SqKP9wgYV
 SfQ0zByU1/JKdrcE50xZPfqh9oJHKlY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-7VKqzqYHP_qF-WII2jG6nw-1; Thu, 01 Jun 2023 10:37:13 -0400
X-MC-Unique: 7VKqzqYHP_qF-WII2jG6nw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f608ea689cso5605115e9.3
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 07:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685630231; x=1688222231;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CjWPm8/seOc+I32CVwyLov08i9XEn5i9AkTXXoaVIZE=;
 b=VTr+FT0+Q6tHwKtNzZFkQCIyn8LnPWDFKxFKhroXk9OXJMhSfxoaYAaRHSdV11RhEB
 hO+yZCmEIUB+VkUnaP9eXhNpwrOQhOrN3Di1RlswODE31SbrQUXaez0SJ35Jhayi1uAa
 Z9iT1drHtQ7XUOEJ+e8V5t3uDbGCGYM7SmWo2V6YSoK5lrawhWRXgKhdiHfDfsJyST7P
 iYgyjpXU94O0yTkUi2dtGBzLz/K6wURFk7k8exRN3npoH37Yq3yeaVQf42MVmz4b7OWY
 BzQKButGC0vyfxjwp4YOJqz4Vo63b1XBnOCNsviNLAsPH5jyLJT+v9d2Lp007xXXURf8
 PFFg==
X-Gm-Message-State: AC+VfDwSYB2SO6m4clJZIWRHEo6oRbpRtLNFCAN+wVKyv4cfc0tgcWDV
 WliPkwPJLSfNVBSVR1z2L+BTL60bU4npHl7zyfG7xO1ZZj7nrsIbGFiOjValSASS7RLl4XbX7LC
 OTRwhVSBGcpOT
X-Received: by 2002:a7b:cd8a:0:b0:3f6:cfc7:8bd0 with SMTP id
 y10-20020a7bcd8a000000b003f6cfc78bd0mr2201303wmj.36.1685630231797; 
 Thu, 01 Jun 2023 07:37:11 -0700 (PDT)
X-Received: by 2002:a7b:cd8a:0:b0:3f6:cfc7:8bd0 with SMTP id
 y10-20020a7bcd8a000000b003f6cfc78bd0mr2201276wmj.36.1685630231361; 
 Thu, 01 Jun 2023 07:37:11 -0700 (PDT)
Received: from redhat.com ([2.55.41.2]) by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c214400b003f42328b5d9sm2558657wml.39.2023.06.01.07.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 07:37:10 -0700 (PDT)
Date: Thu, 1 Jun 2023 10:37:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/3] Trivial cleanups
Message-ID: <20230601103652-mutt-send-email-mst@kernel.org>
References: <20230523195608.125820-1-shentey@gmail.com>
 <c138717c-5085-3b4b-5a46-0fa93179f6a8@ilande.co.uk>
 <20230601080655-mutt-send-email-mst@kernel.org>
 <5982629b-0ff1-2525-e16a-309257710a20@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <5982629b-0ff1-2525-e16a-309257710a20@ilande.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: DbaYPfMpUvvx

On Thu, Jun 01, 2023 at 01:45:47PM +0100, Mark Cave-Ayland wrote:
> On 01/06/2023 13:07, Michael S. Tsirkin wrote:
> 
> > On Thu, May 25, 2023 at 05:03:15PM +0100, Mark Cave-Ayland wrote:
> > > On 23/05/2023 20:56, Bernhard Beschow wrote:
> > > 
> > > > This series:
> > > > * Removes dead code from omap_uart and i82378
> > > > * Resolves redundant code in the i8254 timer devices
> > > > 
> > > > v3:
> > > > * Drop TYPE_ISA_PARALLEL since they became obsolete by
> > > >     https://lore.kernel.org/qemu-devel/20230522115014.1110840-9-thuth@redhat.com/
> > > 
> > > Oh I didn't see that this had already been merged :/
> > > 
> > > It's not a reason to block this series, but I'd still like to see your
> > > changes to ParallelState and ISAParallelState merged separately since they
> > > are a better match for our QOM coding standards.
> > > 
> > > > v2:
> > > > * Export ParallelState and ISAParallelState (Mark)
> > > > 
> > > > Testing done:
> > > > * `make check`
> > > > 
> > > > Bernhard Beschow (3):
> > > >     hw/timer/i8254_common: Share "iobase" property via base class
> > > >     hw/arm/omap: Remove unused omap_uart_attach()
> > > >     hw/isa/i82378: Remove unused "io" attribute
> > > > 
> > > >    include/hw/arm/omap.h   | 1 -
> > > >    hw/char/omap_uart.c     | 9 ---------
> > > >    hw/i386/kvm/i8254.c     | 1 -
> > > >    hw/isa/i82378.c         | 1 -
> > > >    hw/timer/i8254.c        | 6 ------
> > > >    hw/timer/i8254_common.c | 6 ++++++
> > > >    6 files changed, 6 insertions(+), 18 deletions(-)
> > > 
> > > Do we know who is going to pick up these series? I can send a PR if no-one minds?
> > > 
> > 
> > 
> > Go ahead:
> > 
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Thanks Michael! Is there any objection to also including
> https://patchew.org/QEMU/20230531211043.41724-1-shentey@gmail.com/ at the
> same time?

I don't know, I wasn't copied on that one.

> Bernhard: if you are able to submit a rebased version of the ISA_PARALLEL
> cleanups at
> https://patchew.org/QEMU/20230521123049.312349-1-shentey@gmail.com/ I think
> it is worth considering those for inclusion in the PR as well (note the
> comments re: an updated commit message and register definitions, but I can't
> really do this myself because of the missing SoB).
> 
> 
> ATB,
> 
> Mark.

