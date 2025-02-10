Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1965276njb;
        Mon, 10 Feb 2025 06:15:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXZa8sHTHK7Ga2Qv7Iz4UBCk+gQpEa8UROjlB3fChQSsUQSnkRtJ0+TDvXjAVe8w/yBSTWJWkAAfQrM4A==@linaro.org
X-Google-Smtp-Source: AGHT+IEsRlV65Meesyo2BnbamlCxCEGsRFWfvcO/g8vCWgq3Zd28KIlHmW2kB10/RuXIBrsi0PWJ
X-Received: by 2002:ac8:5dd2:0:b0:471:8f5d:217 with SMTP id d75a77b69052e-4718f5d0541mr66426881cf.39.1739196921644;
        Mon, 10 Feb 2025 06:15:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739196921; cv=none;
        d=google.com; s=arc-20240605;
        b=JBo79u1w4EWdeC4aLkNKt1lx2ySXs2Byw83s603N15SokV7lriVJzGINixsH42ubQq
         0dRZaRZk9LeUcfb0K0X3u/5AplzLdajPdlFlvgjtEW/1ehipz03cf6STqMrVtBLojueo
         cbpp3+KhQk0ku1kGJdKZt+dKh7Eb5zpB5BDOTATwNfFvFAiYleO9yTJVSYa9WXXbXfmk
         8wxrf11funEyMwX0DUE9PwyTtIRNuvlkECVj9DzAWdJYqEEtIi0EUaCa1XI9rgqztgm6
         6QPETQihAH58x9olXICaQyFsj2Lo7j9mZSP8E9NGlRehGN2To8Fw/0FPSW2kQECuyme4
         WnlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2PMBRrivkjfUaWhRN1bT2/4VqOxJ9LmWyNMlDVwIqek=;
        fh=WTLB7ZFwqEBwvM5/RhM1CLcI+rl91y9DaaJ63trwD58=;
        b=S/o0lYXTW2oaPr4ghq5Ry8SIHWW+5/hTTRUdLs9sm7Xtg1mIDQ2EJtMYQpp+cPiL5O
         ZBiVz7C4wT8I+6hUumgC0N0XRWaTIGALfLvfdp7NEe+8NdxVFCJzoAYEvhl8YsVC7D/2
         kpmP43EQ6CiWjsuENgerZC6lbV8dnygSW/P9IpolEsqF5T5UIlpNhVY2N5mVHZYNBTPP
         VSlIwKgJIIkXosXpRt5CNIKtAgCRO1YOP4R1VOPutKHu6nsw+47XwPRCiNImUgUK6uQL
         rAI4b7MhzsJKfg4HjeOlUt4de0k/xSmDQwh/vCZqpjFYTo0hkyp+b/i2xYqMsv9g5LIp
         JIPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HQanrLH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4717c48f4d2si46785831cf.445.2025.02.10.06.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 06:15:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HQanrLH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thUYq-0008Hl-AD; Mon, 10 Feb 2025 09:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1thUYo-0008D0-Cm
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1thUYl-0005Hf-Dn
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 09:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739196887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2PMBRrivkjfUaWhRN1bT2/4VqOxJ9LmWyNMlDVwIqek=;
 b=HQanrLH7/DeSCEA0mbv/2YkjBiVe+r4enilHwxUAgIGgxVCJ940BUuxvnIHm6/8l8Lm9gK
 3EKDbHeewPlhrbPDgsLn8YRSQiVhhKVhFS+KXMbwwHRCoRh2Uq9BA0GL3rUc/qd1YSikQy
 /YHeZIlPEGOXGEkVFJBB9IHGibF+X6U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-0cVGA1DkPCmwHlYS-fxm3Q-1; Mon, 10 Feb 2025 09:14:43 -0500
X-MC-Unique: 0cVGA1DkPCmwHlYS-fxm3Q-1
X-Mimecast-MFC-AGG-ID: 0cVGA1DkPCmwHlYS-fxm3Q
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e1b8065ed4so77706886d6.0
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 06:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739196882; x=1739801682;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PMBRrivkjfUaWhRN1bT2/4VqOxJ9LmWyNMlDVwIqek=;
 b=Qwy+b/jk3qlKtoLrY8WW6U+PcgRY79xfo95fzbfT6ZXmex1QmFiL9UXtm4g5fzAktf
 MWXgMfGOXw2zeCiY2onAprrNTWiqhARZnfFO6r3FniuQdTUxA7erc/uJraa/MYzlGQ0S
 8E/Wm/SP3aTCwKgATRq2iOwZun/CtO5H+Ze8J5v+jLexHq9wDddb0zfCboWclqeomJY0
 MQ9x/HIG7T7AzGOVgjJ2mDslGekOOAsewNtl2p9gjrpKk+twUP/R8fAsJ31tQvXMYwqW
 vurFAxgyLdNL3SO+29mAiX2no8l7evC4rDutWXHSIG4ozsx1S49+v8iON2LBrQ+MpoKw
 1A0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWAqCfNUXrLBFiISaafvdKlxRW8tR4i7d457cDtCPW2lELRZILJR/8JnVQZkDiNpTcvn2ANYzSNQ==@nongnu.org
X-Gm-Message-State: AOJu0YzXXBMdWVSyQaS+aN8OOVRPe+8D/bykR+X7/wWU5OuUX3PGZFfo
 ZBubEpLhepebP5WYyz+MrbyfRH7nNJYGy5s3klkk5FQBL9ILdKn76N97Y1umfYv1qVPEmD9X1XX
 f1HOtv4eaVl0yXVYP2p7DqxtJ6Ga4o2hbUwhwG/v+T6CqTGO8Xw==
X-Gm-Gg: ASbGnct7KddT9n8rEn//0wz0cnCejdtc3Beac4xgKeNPM3Q21Nwfi9Ftr/LH+RTTGfz
 ZH6+RpX/Oq+XJi2v45JaORbLB0SI24bMk5fiDELJfafFcJF0jRSg0NoqHsmrd6eaEkthTKr9anM
 +CTXfiduHGNeKDzL+mZHKYHy2KJ9m+GvyW0zAS9f3FPhrbP8EbJPzLxGEy5NSYSM9TrglD8TqVa
 BikL/zEPTaQu2/vfmzgsEh5oCS/ETvFeocs9K/BIXASzZIZgRuWrQxZfWY=
X-Received: by 2002:a05:6214:da6:b0:6e1:a51d:e96f with SMTP id
 6a1803df08f44-6e4455d8764mr191864966d6.8.1739196882650; 
 Mon, 10 Feb 2025 06:14:42 -0800 (PST)
X-Received: by 2002:a05:6214:da6:b0:6e1:a51d:e96f with SMTP id
 6a1803df08f44-6e4455d8764mr191864556d6.8.1739196882208; 
 Mon, 10 Feb 2025 06:14:42 -0800 (PST)
Received: from x1.local ([2604:7a40:2041:2b00::1000])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e44da75f46sm32473116d6.58.2025.02.10.06.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 06:14:40 -0800 (PST)
Date: Mon, 10 Feb 2025 09:14:37 -0500
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 imammedo@redhat.com, alex.williamson@redhat.com, clg@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
Message-ID: <Z6oJzRCt_fJLfkmQ@x1.local>
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
 <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
 <Z6ZHTStx_S9ALdxt@x1.local>
 <CAFEAcA8ovoGsQ9oEco88iw3iUy_3kBOUaYHL+oq5VF-i9xg4+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8ovoGsQ9oEco88iw3iUy_3kBOUaYHL+oq5VF-i9xg4+A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wBQm2zOw6wRHehIysCkygvfMk5l1gZIUz1GxuKBGWdM_1739196883
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7AAJgTxuX+Dq

On Fri, Feb 07, 2025 at 06:18:50PM +0000, Peter Maydell wrote:
> On Fri, 7 Feb 2025 at 17:48, Peter Xu <peterx@redhat.com> wrote:
> >
> > On Fri, Feb 07, 2025 at 04:58:39PM +0000, Peter Maydell wrote:
> > > (I wonder if we ought to suggest quiescing outstanding
> > > DMA in the enter phase? But it's probably easier to fix
> > > the iommus like this series does than try to get every
> > > dma-capable pci device to do something different.)
> >
> > I wonder if we should provide some generic helper to register vIOMMU reset
> > callbacks, so that we'll be sure any vIOMMU model impl that will register
> > at exit() phase only, and do nothing during the initial two phases.  Then
> > we can put some rich comment on that helper on why.
> >
> > Looks like it means the qemu reset model in the future can be a combination
> > of device tree (which resets depth-first) and the three phases model.  We
> > will start to use different approach to solve different problems.
> 
> The tree of QOM devices (i.e. the one based on the qbus buses
> and rooted at the sysbus) resets depth-first, but it does so in
> three phases: first we traverse everything doing 'enter'; then
> we traverse everything doing 'hold'; then we traverse everything
> doing 'exit'. There *used* to be an awkward mix of some things
> being three-phase and some not, but we have now got rid of all
> of those so a system reset does a single three-phase reset run
> which resets everything.

Right.  Sorry I wasn't very clear before indeed on what I wanted to
express.

My understanding is the 3 phases reset, even if existed, was not designed
to order things like vIOMMU and devices that is already described by system
topology.  That's, IMHO, exactly what QOM topology wanted to achieve right
now on ordering device resets and the whole depth-first reset method would
make sense with it.

So from that specific POV, it's a mixture use of both methods on ordering
of devices to reset now (rather than the order of reset process within a
same device, provided into 3 phases).  It may not be very intuitive when
someone reads about the two reset mechanisms, as one would naturally take
vIOMMU as a root object of any other PCIe devices under root complex, and
thinking the order should be guaranteed by QOM on reset already.  In
reality it's not.  So that's the part I wonder if we want to document.

So we must make sure both:

  - All vIOMMUs across all archs must only tear down its mapping at its
    exit() phase, providing the mapping available for all devices during
    the initial 2 phases (probably we could even assert the initial 2 phase
    functions to be NULL when there's a base class).  Meanwhile,

  - All PCIe devices must quiesce their DMA in the initial 2 phases,
    guaranteeing that there's no on-the-fly DMAs possible in the complete
    3rd exit() phase, because any vIOMMU implementation can start to tear
    down its device mappings even as the first entry in 3rd phase (IOW,
    there's also no order constraint for 3rd phase that vIOMMU exit() will
    be invoked before devices' exit()).

I'm not sure if it would be important to document this, but only thought
about it if we want crystal clearance on the choice of this design.

Thanks,

-- 
Peter Xu

