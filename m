Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3121472lfc;
        Mon, 26 Jul 2021 11:41:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybL0bGCp9H71OhGnjOM+87qzypeMrIpRSKM+oIuB1ej4vjcgrM5ztFS58Q2uv+1TNiT3ku
X-Received: by 2002:ab0:490e:: with SMTP id z14mr14612431uac.101.1627324872032;
        Mon, 26 Jul 2021 11:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627324872; cv=none;
        d=google.com; s=arc-20160816;
        b=NpcB5fpQFRRvSA0lWB2U6Bhu5UXf8ahKc7Fw1+cVIW+sl0mPKsAHVCrgAFCmmdJ9mo
         OrFqVWRnDk/KnGAvD0Hh5WetzmcV9AIC9pVQEC9E3QkC5IWdytXBROAXBYuHruN5Nltg
         47tJFs1Eh7ZrX4maLsIfy5sqka3PDf8MeSOA7IdSkmF58z5RbwzFqYX0G6qYItHSbWFj
         5O0siX9rxNbdPdejgae22wNvFnEtnd9nMvOUkfXOFPiowsyGaGrN5rbfhVp/iS6aifAd
         B3WD4bAW5JK9VGapv9emr7TYdfkgm6Ari0pxPJoMV/MJiourLnjgWTsKU8PBN1OT0Yky
         b7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=bsVG8cbp21h0uSsz0yACWufxcxeVw9LXGXHttddYjR0=;
        b=E/d9z5app6G5Egqm3HNG/IiXKZ7g9jBpAVlSCLHEXowhsBFQEIo+vXCVZoyYXDNVyU
         75d7Erq9+WAx0ccLkulj6gGyuX0ujicVJx7STJAQs884PEIYqqqa0ISjDc+5XMs9DI7G
         J1eNdzFbL9Z/P9m/X4dB+90bsF7gfjjMNZzhGF8xVle4LrKHWDYKP12wXdJAOOC9yOeQ
         +Qly8OSjVpbew2agUqHJxu/xuTDCck68DY8XN43K7Gb3IsYmTCIoHu1X8cdMiqj0V3Ma
         OZ496SXqAPZjhZiEiXcnC3YsK9CcojovjDeHYt/YmIplRw1yTwOId2GlFWiriaaccGmO
         +iEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eSpt4eik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n65si313663vkn.93.2021.07.26.11.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 11:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eSpt4eik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m85XL-0003wr-1v
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 14:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m85X8-0003up-UM
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 14:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m85X6-0006yR-MH
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 14:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627324856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bsVG8cbp21h0uSsz0yACWufxcxeVw9LXGXHttddYjR0=;
 b=eSpt4eikIwiFtm69fiyMekAAQ6aYNxzopT6ByULc4SNSMddo+oXBiO5Q9bfe9PcOLiOTLS
 Wxt58B+dE+74NCrh8T/39EMbmfIHMRiv4vfn8yD2DFMLi16xgArJTUsMnwaJbTJQaWWDSx
 gw7N4xrX6XuS2eus9B33gdeIuyYWSIo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-DvvzY0V7P3ahDuXHifO3RA-1; Mon, 26 Jul 2021 14:40:54 -0400
X-MC-Unique: DvvzY0V7P3ahDuXHifO3RA-1
Received: by mail-qk1-f197.google.com with SMTP id
 t191-20020a37aac80000b02903b9402486c5so9726946qke.13
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 11:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bsVG8cbp21h0uSsz0yACWufxcxeVw9LXGXHttddYjR0=;
 b=mtqudcYJGZ1cytJ3T0/CAQF2rjLS7ENdP4Zqdpmx5sQkpWCGD7Z81g6H2COWCcNmS+
 mwP4KE1lsLmEU+LwJJOgL45yIhPSS3Yhk/EpHRyIYL7Pw41mQ86vmDUgGS3CAFcWMzDG
 fN0JsJjYVdipyyPy79MWTWby5tqUF46C9EjUlWAuejqQOGgI6OnxCMQTtqCRgjpYMV9X
 rMOOwpelhsk27V7Yc45pI/IJPWlNkhWhHRrhP8xX1xnIvG6IeKP5pvPX9Po3rku+BcuJ
 TdIZpdg/wHkCUDj0xsIDlhVQKcb+Eo4bLLgIp5layvhxLT7IN+f4MGuRI4EbfIYs+JYu
 UECw==
X-Gm-Message-State: AOAM533ThgHVeujRgq/8fQdCtRmTbIJ1iqR0Vk6DQqdCT5dwdwwQqC9x
 DX6nU6QxiUS8+LLeBfauJQwi71Xkxk4mtiZcFbjnbsMpWviJupMg+Wk8fQbMyL1hWStl6+Fv+t2
 Gu3NTnnrmL7nz
X-Received: by 2002:a05:620a:319:: with SMTP id
 s25mr18488306qkm.411.1627324854016; 
 Mon, 26 Jul 2021 11:40:54 -0700 (PDT)
X-Received: by 2002:a05:620a:319:: with SMTP id
 s25mr18488285qkm.411.1627324853768; 
 Mon, 26 Jul 2021 11:40:53 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id 82sm440326qkl.97.2021.07.26.11.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 11:40:53 -0700 (PDT)
Date: Mon, 26 Jul 2021 20:40:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/3] target/arm: Add sve-default-vector-length cpu
 property
Message-ID: <20210726184051.qn4k3ii4bhkmgotp@gator>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-4-richard.henderson@linaro.org>
 <20210726145951.g3ywwhcfstmsi7vi@gator>
 <df4f3bdc-5110-b321-e173-1a911b7e7c4b@linaro.org>
MIME-Version: 1.0
In-Reply-To: <df4f3bdc-5110-b321-e173-1a911b7e7c4b@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jDZkGep9QH7G

On Mon, Jul 26, 2021 at 08:33:52AM -1000, Richard Henderson wrote:
> On 7/26/21 4:59 AM, Andrew Jones wrote:
> > > +SVE User-mode Default Vector Length Property
> > > +--------------------------------------------
> > > +
> > > +For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
> > > +defined to mirror the Linux kernel parameter file
> > > +`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> > > +is in units of bytes and must be between 16 and 8192.
> > 
> > Hmm. If a user inputs anything greater than 256, then won't it get
> > silently reduced to 256?
> 
> Yes.
> 
> > > +If not specified, the default vector length is 64.
> > > +
> > > +If the default length is larger than the maximum vector length enabled
> > > +with `sve<N>` properties, the actual vector length will be reduced.
> > 
> > Here it's pointed out that the default may be reduced, but it implies that
> > that only happens if an sve<N> property is also given. Won't users wonder
> > why they're only getting vectors that are 256 bytes large even when they
> > ask for more?
> 
> I guess adding that 256 is the maximum length supported by qemu should be sufficient?
>

Works for me.

Thanks,
drew 

