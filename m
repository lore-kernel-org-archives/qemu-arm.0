Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2582749lfb;
        Fri, 27 Nov 2020 08:48:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTEyYqPNAMUgkQtnobhha+RaLAeejbHFpMiPZNrFeQ3qHyk0mPY8b4Wsi7daPbZEhNwNP1
X-Received: by 2002:a25:2fcf:: with SMTP id v198mr11415941ybv.492.1606495684387;
        Fri, 27 Nov 2020 08:48:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606495684; cv=none;
        d=google.com; s=arc-20160816;
        b=NAo+NIRUun/NfCy3Vf6dpBxdZe0XitqxrVN4QCPDeo85sakLLoUPH5g6NbdKt3jn8J
         Naftdy41jfASnEwd/ziV6d5zKoLHV50qk7VPEYLHjeziUsTcAAsGrfXjIzUqxCZHzqSO
         j2iBn6zaTjGxIutFTT1u3eGDTr7ky1fgvq88yhHdF7N3L+Yd8IGMzwYlFT5APTajpglV
         JRuHIXUFUoQoRgiJPtNVLTWGrzoJ44K3lA0c95bX3XdhG1xEmAgc2NkJo7NY1b0Dhgqh
         BCy17PYDWaKvQ4IJ++YbU3s70vKJuDTeF/xWWcpw0mEbnCP3sR+Ju3Qboei4TO/gdJTJ
         RSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=epJUUiwpucsbKMF/eZNcKhxV6a4Wjmx7OclHp9TUERw=;
        b=tws5/0MMsN3W3uyV1znTYaDJJhroZLrorzGo0OjCwoR5J5cX5wCJUpS3rLB8qQq2Bk
         83MBRO0hRGeUc0/bKBdc1/aqUk/aLX71li/5ky83lQZ9yVrLHPFy0v2i25L9quaZeGu+
         AGiirapwz3BumnSN711qQF8PIx5xrlL7uCwHIFFQ8iWUU8iJw0lVTuIpW9PI9CYXwZLu
         MEy4bQihENFgK4gyadsvF7XREwAsu8LmgFVc26Frx0zjM51Jcw02oqa1o9fSDoZZYBc7
         dTpcr7tSO4S+hnLEsJYfMFlDh0RiBh30OMgw+O1DiGLSiBXXBZgKM2yxtY5+JzI3ArUs
         Gjlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IWc8EqwH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k139si8835548ybk.300.2020.11.27.08.48.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 08:48:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IWc8EqwH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiguh-0001cM-OD
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 11:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kigty-0001c8-RU
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:47:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kigtw-00057S-8U
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606495634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=epJUUiwpucsbKMF/eZNcKhxV6a4Wjmx7OclHp9TUERw=;
 b=IWc8EqwH2dlGeTrUAX6C5R19qdoycu4We+T7v2GLtdjyMwUCTfhxrU8+fyXpb/SohirNGg
 GRFvuepofG59vC/PG9Cm86+y/3RbnmW9TZ8OELGJH5pwhnLaLe346PrWA//IBo5RajTK7h
 jxwy4h141NyOUzezXuGNMNgCRjPqs4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-BdGrI5biMgy80ITAtz2Fog-1; Fri, 27 Nov 2020 11:47:12 -0500
X-MC-Unique: BdGrI5biMgy80ITAtz2Fog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71EDD107AD44;
 Fri, 27 Nov 2020 16:47:10 +0000 (UTC)
Received: from localhost (unknown [10.10.67.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DE265D9DE;
 Fri, 27 Nov 2020 16:47:10 +0000 (UTC)
Date: Fri, 27 Nov 2020 11:47:08 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
Message-ID: <20201127164708.GZ2271382@habkost.net>
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-9-agraf@csgraf.de>
 <20201126221405.GT2271382@habkost.net>
 <CAFEAcA_Nc0Jp-3PPigt1YdqHfNhGToovCOO16DOPPC9Bt663qg@mail.gmail.com>
 <20201127162633.GY2271382@habkost.net>
 <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-NvSUUJ1GpYP2tCgjD-RNL5rO7P2H63xHmGS7x6ggDBQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YxOALcalRQuI

On Fri, Nov 27, 2020 at 04:38:18PM +0000, Peter Maydell wrote:
> On Fri, 27 Nov 2020 at 16:26, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > On Thu, Nov 26, 2020 at 10:29:01PM +0000, Peter Maydell wrote:
> > > On Thu, 26 Nov 2020 at 22:14, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > > Direct checks for *_enabled() are a pain to clean up later when
> > > > we add support to new accelerators.  Can't this be implemented as
> > > > (e.g.) a AccelClass::max_physical_address_bits field?
> > >
> > > It's a property of the CPU (eg our emulated TCG CPUs may have
> > > varying supported numbers of physical address bits). So the
> > > virt board ought to look at the CPU, and the CPU should be
> > > set up with the right information for all of KVM, TCG, HVF
> > > (either a specific max_phys_addr_bits value or just ensure
> > > its ID_AA64MMFR0_EL1.PARange is right, not sure which would
> > > be easier/nicer).
> >
> > Agreed.
> >
> > My suggestion would still apply to the CPU code that will pick
> > the address size; ideally, accel-specific behaviour should be
> > represented as meaningful fields in AccelClass (either data or
> > virtual methods) instead of direct *_enabled() checks.
> 
> Having looked a bit more closely at some of the relevant target/arm
> code, I think the best approach is going to be that in virt.c
> we just check the PARange ID register field (probably via
> a convenience function that does the conversion of that to
> a nice number-of-bits return value; we might even have one
> already). KVM and TCG both already set that ID register field
> in the CPU struct correctly in their existing
> implicitly-accelerator-specific code; HVF needs to do the same.

Do you know how the implicitly-accelerator-specific code is
implemented?  PARange is in id_aa64mmfr0, correct?  I don't see
any accel-specific code for initializing id_aa64mmfr0.

-- 
Eduardo

