Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2540141lfg;
        Mon, 23 Aug 2021 23:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9w7XRIaUoqF0dgkTPqhHKQqn+1VmDzfgrUhzvwn03KF8ARkjU/cw8lQ27x+2HQXNSzBvZ
X-Received: by 2002:a05:6e02:1d06:: with SMTP id i6mr25876246ila.113.1629787686520;
        Mon, 23 Aug 2021 23:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629787686; cv=none;
        d=google.com; s=arc-20160816;
        b=DPrVrM0RwrTdy9LeVZLuHvbgVMIXnq57NaVTblp91ZfJVKtHLELi6d9vAIO4VBSC6S
         5GhjnXLywYopWfyQ3ephHmIUfdG6Il3lr4BhyMhnS5+fY2Ny0SIWMSohDJ2UlhSGYoR2
         F7j4nbljXLZDfbM0fY9ld8nzjDPxb5q+LH6rPkxw01Up3DynnallZDbaWKw3ETgY8lOU
         pLmIff+VOV57n+PRDJTJxoDxMrALthgeKzRdMZyST5piaLh8UeHknfA7xkjxT/LpsYdt
         D5h5W25qtza2ZAL5KkCi+KRSWBRnnmAs5y7HDKJHgNRxvoYKEMp8tTkFne3mMoYzsfJ0
         e2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=Et3R98mtZeS6mSvAta+hCk0i3R8NtrI18u50oFIQmq0=;
        b=nunKlQQtsEcnWAIBr2lpIH5PsfXetQj6OZcPL5Ns4Lr4HGu5BZnWDOjAtvZ34oiSd4
         ae2Nx036bDg7Bvu9csryEOVjtWEnLVUzry0T+4akKfeEntzSH9VvhDr2lDhInl3/TwhW
         /1Jqs+8wg38W6BQyUoZ990HObkQ4JehWbOSA+Gd6U0ik0CfEuEsh1VfdvRP2Fhepdrvh
         UHyiAHYnY4Mp44ys/h1ocEONlNn4H3IIj4k3j3JWECAVeUoPLK16rutbuTIqtwc428Va
         9gJrOAEdnUnajR9q0x+ZO8N2nggwKnAN2XVDjSpnayU/FGVH/8eiGXqlZ56af56Jb1aR
         a6Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GjLdlpsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si17244569ilq.43.2021.08.23.23.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 23:48:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GjLdlpsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIQE9-0001BE-Qk
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 02:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIQDr-0001At-4H
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 02:47:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIQDp-0002TD-M6
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 02:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629787664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Et3R98mtZeS6mSvAta+hCk0i3R8NtrI18u50oFIQmq0=;
 b=GjLdlpsdpwjT9byaydCSdudMNFIRj9aqTgU1wxpmQlJcw9Zt+upPXy9Ijbwux1SQFPhkUl
 vNLw1t2A8y+i51dgRamNPycO8Ga6Mx3ECd6ys79CJGa+RUPAIQJ/22LAazrMOiA3/hLiva
 qTCVq2pw+J8ICPT70yPH4oCGzXSUd8g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-IZM712MBPeGrAEo6rYoI-w-1; Tue, 24 Aug 2021 02:47:42 -0400
X-MC-Unique: IZM712MBPeGrAEo6rYoI-w-1
Received: by mail-ed1-f69.google.com with SMTP id
 s8-20020a508dc8000000b003c19f7fe952so4581403edh.7
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 23:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Et3R98mtZeS6mSvAta+hCk0i3R8NtrI18u50oFIQmq0=;
 b=ISOg3sol3T8+uu+KDhsfyoJBoExwMXyqO9FcYF4LwzznAO1Rcs3Z57wYMeEZ+2ANOk
 pZzUE+zGLeKuyVgQyU7lairgKqtEJ85DCmaV/pdySirLUzvmnPItg0W4+4I4EYR0FYc9
 Mg3rtFNegJzFUtpvfrg8Akork57ChwEh7NOaVNU7IT5TtDpsRw/nbljNmunq3M9xSbNn
 5K8yqSQLJfiX6j5My+75zTka9YkyXEGyLOVgBCQOsAchHDTUQE7/9x7PeeH/5SXBvT53
 fcNmQ24B0/6MNR+xH0fzRy53gQIX/5gDxpDAa9Y44OFaLCijv5rXOyAwcQ3q3bw4wZFk
 Cn6w==
X-Gm-Message-State: AOAM531Lt2pZ1LQdF1yjahMdS5EsO52/QuWzxbyvsShOWPblRXzyIQKs
 9xiQlzReMNh/XCc6tNpDjaLzduNmgoQqmRuhuqW7kpJSdKrreA365/Ay2mMMcpjoL0XwSDk46RL
 Wk2Y6XVLgAbgR
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr42789477edl.307.1629787661779; 
 Mon, 23 Aug 2021 23:47:41 -0700 (PDT)
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr42789457edl.307.1629787661575; 
 Mon, 23 Aug 2021 23:47:41 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j11sm8579891ejy.112.2021.08.23.23.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 23:47:41 -0700 (PDT)
Date: Tue, 24 Aug 2021 08:47:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 3/4] target/arm/cpu64: Replace kvm_supported with
 sve_vq_supported
Message-ID: <20210824064739.otu7wn6jn4tfbk4g@gator.home>
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-4-drjones@redhat.com>
 <b06b7b44-1021-d2f6-5d22-767fc8422507@linaro.org>
 <20210824062855.3xmc3xk5ijfrptwt@gator.home>
MIME-Version: 1.0
In-Reply-To: <20210824062855.3xmc3xk5ijfrptwt@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Qc5uaqixxeD

On Tue, Aug 24, 2021 at 08:28:55AM +0200, Andrew Jones wrote:
> On Mon, Aug 23, 2021 at 10:53:48AM -0700, Richard Henderson wrote:
> > On 8/23/21 9:06 AM, Andrew Jones wrote:
> > > Now that we have an ARMCPU member sve_vq_supported we no longer
> > > need the local kvm_supported bitmap for KVM's supported vector
> > > lengths.
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > ---
> > >   target/arm/cpu64.c | 19 +++++++++++--------
> > >   1 file changed, 11 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > > index eb9318c83b74..557fd4757740 100644
> > > --- a/target/arm/cpu64.c
> > > +++ b/target/arm/cpu64.c
> > > @@ -265,14 +265,17 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
> > >        * any of the above.  Finally, if SVE is not disabled, then at least one
> > >        * vector length must be enabled.
> > >        */
> > > -    DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
> > >       DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> > >       uint32_t vq, max_vq = 0;
> > > -    /* Collect the set of vector lengths supported by KVM. */
> > > -    bitmap_zero(kvm_supported, ARM_MAX_VQ);
> > > +    /*
> > > +     * CPU models specify a set of supported vector lengths which are
> > > +     * enabled by default.  Attempting to enable any vector length not set
> > > +     * in the supported bitmap results in an error.  When KVM is enabled we
> > > +     * fetch the supported bitmap from the host.
> > > +     */
> > >       if (kvm_enabled() && kvm_arm_sve_supported()) {
> > > -        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
> > > +        kvm_arm_sve_get_vls(CPU(cpu), cpu->sve_vq_supported);
> > >       } else if (kvm_enabled()) {
> > >           assert(!cpu_isar_feature(aa64_sve, cpu));
> > >       }
> > 
> > I think this whole stanza should now be moved into
> > kvm_arm_get_host_cpu_features, where we detect sve and fetch
> > ID_AA64ZFR0_EL1.
> > 
> > As a separate patch, since this one is simply the variable rename.
> 
> Good idea. I'll do that for v3.

Actually, I'll post an independent series for this idea rather than
a v3 with another patch. With enough changes we can avoid several
scratch vcpus, but that's getting too far outside the scope of this
series.

Thanks,
drew

