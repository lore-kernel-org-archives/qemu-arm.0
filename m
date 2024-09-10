Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1322616njb;
        Tue, 10 Sep 2024 08:32:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6SrKs9UvUeWDK9M+jHoAUPpNN+GvsbLfajdDX+IccFn0JLjbdH2JgJo4eCLYaOqReJmMjmgIK4jFXtg==@linaro.org
X-Google-Smtp-Source: AGHT+IGqbxrSN8s+bZwCXVFwfanuU7UttGZigS15F2IJiY6Vgeol78+4KMpwZO7oymr7I+r7/TXF
X-Received: by 2002:a05:622a:1a0d:b0:447:f7cf:7022 with SMTP id d75a77b69052e-4580c7599bamr199177221cf.40.1725982335930;
        Tue, 10 Sep 2024 08:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725982335; cv=none;
        d=google.com; s=arc-20240605;
        b=FRcY9Z1wZg//JzXmMq02YSzSSysHdl2YiGQVeqxBuczwCVjTVb1ysduQB6WMKqpvIN
         vwqIkpDOfwJJGbA0OBIJw1YMArBNUSUvS1rwkzJSDXJpOmGc4vqHxgFX0qAQW3hTfjSU
         /3MiiOxC57/7TEqs/Wo65ZSgMiiLXwC9uchp582+Klmp7dhqvie7K6lB+ToRTw3LB/A7
         HLaQ2dO/WsUajChcPC/1F53MsmOtaHmCsUM1slNfaetkwWW3ibvYW6CWahprcGRp+LTY
         XxHT9aMRfHnJQO9q4ctrd9+hbAwOPLXYBS3QzeRSMm9eUZer09t7pvHsAAQhU9j1/buv
         9PJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RsuH1VOGmNMtU05AFsSg0wYX3E5lFuAYaleeKgZJu0E=;
        fh=CulT0/WCcphilSYp6GcWcwaHw18lA86FTfu1g2OGolw=;
        b=bYy0GymraaJHICn7A5t6SQHa31pkG5ErVaGcbhHAZ1yVnCOLVEe8eQXkDTw46WFBa2
         kz+Zw/b3K77HWtu4W1iFZE2jmaCTmYcVHdamZJeQ8RAHs7/PxN+Tm7HFAGw0JJW7ik3M
         s0ZYq9U5lgZSm4nA1nat4rW86P0Vm+HlgjJMmtU0EMDXihx39SY9OX7Zu2ejftEWBdpI
         Eld6h0P7DwO27U7xI0LktaZCWnFZRJkP3EibXG+dUFQtONzA33rstXqezq7BMw6gxhvR
         wl/1fSjlXrNiLlXHqp67Zd/Q/Spa5nZgjjQR0yED7pGcHcBVQt6iX6hrBPS4vfKFpUfL
         ozRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=djhMAnek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822faf96csi79893131cf.584.2024.09.10.08.32.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 08:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=djhMAnek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1so2qZ-00080z-BA; Tue, 10 Sep 2024 11:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1so2qX-0007uS-UH
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 11:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1so2qW-0007Yw-B7
 for qemu-arm@nongnu.org; Tue, 10 Sep 2024 11:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725982319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RsuH1VOGmNMtU05AFsSg0wYX3E5lFuAYaleeKgZJu0E=;
 b=djhMAnek+SYNo1llxUQNSMT8LzgWZcUU/YNJDkVx2bRmOBccv+T/97tnITf3+hjsPSz9hc
 6wgdjbwiJ8yOYIGj9X9lhbSA1bHmqKREJHVj72Emr1Nsv0IfFBFf/zu2We/xsH0nqBH59P
 yiVmOUoikDRWC15Q4vBLbVMzZsyWV8U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-AyzHBIiKNn-kKDrKupNGQA-1; Tue, 10 Sep 2024 11:31:55 -0400
X-MC-Unique: AyzHBIiKNn-kKDrKupNGQA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374b981dd62so502015f8f.3
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2024 08:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725982314; x=1726587114;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RsuH1VOGmNMtU05AFsSg0wYX3E5lFuAYaleeKgZJu0E=;
 b=JQX1SzcVKnQMM+q93Q31CjQxquUrVajz5egcLOFcN+9TozaMdTkrCyi2QyeBGiwvMR
 aSBiOVMbGSDzivjrZs5i8CfLpZb6xHHAhD07wr0ToxAtprfn6Tbf5sn6CXpikWG8djPU
 1zX28LX5EmjKVI49x9TNz6322K84sgrmARghn8ndroyn+1vzv7dlhKdQPrbg13fP4t5n
 pQbUsTK4LzY4bTrr1zvWWHWi79lOCp2+RrLlklYSrXzumcMNWCb42fQ4CvcqTuFqaETO
 JCbFeCc+grcKvdGGNuRqAMNNV4I8vmY3xoTnPWChzSLjQ62qWbWl0J8Se5gAC6HuhZks
 KuYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKG5WoCxM5/71swpVID+m9onVy75FxF4iPU/F4ZnHYt0+Ks6eLWw0GB0GtKJK+shBjbpSrI33Gkg==@nongnu.org
X-Gm-Message-State: AOJu0YzFvB6/h585GJX664O4DtidJHUVTFUl962MIuKcMyM+lIpZJLQY
 krfdKOBZrsckObMBROyoww3QQtgEv4m1ofZHiM0TCABha70ODlNnBZjhuERu8pJCoYXTqHr6Cw3
 In8nL5ZlyOMx5kbKf6MpNSKSckcnrqFC/kL5n5V6k3EZZDbok4A==
X-Received: by 2002:a5d:4309:0:b0:368:48e6:5056 with SMTP id
 ffacd0b85a97d-378b07a4f33mr41619f8f.22.1725982314103; 
 Tue, 10 Sep 2024 08:31:54 -0700 (PDT)
X-Received: by 2002:a5d:4309:0:b0:368:48e6:5056 with SMTP id
 ffacd0b85a97d-378b07a4f33mr41587f8f.22.1725982313432; 
 Tue, 10 Sep 2024 08:31:53 -0700 (PDT)
Received: from redhat.com ([31.187.78.63]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956dddacsm9155172f8f.107.2024.09.10.08.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 08:31:52 -0700 (PDT)
Date: Tue, 10 Sep 2024 11:31:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH for-9.2] hw: add compat machines for 9.2
Message-ID: <20240910113131-mutt-send-email-mst@kernel.org>
References: <20240816103723.2325982-1-cohuck@redhat.com>
 <Zr8uNB8gaJTroMBU@redhat.com> <Ztn21z0ZR3_MiVQJ@redhat.com>
 <CAFEAcA9ToJuZwGkJr2gCRf63uJom0b0QpdVv-OrAVVUGwB_2wQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ToJuZwGkJr2gCRf63uJom0b0QpdVv-OrAVVUGwB_2wQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: M66hm9/SFxQ/

On Thu, Sep 05, 2024 at 08:05:14PM +0100, Peter Maydell wrote:
> On Thu, 5 Sept 2024 at 19:22, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Fri, Aug 16, 2024 at 11:47:16AM +0100, Daniel P. Berrangé wrote:
> > > On Fri, Aug 16, 2024 at 12:37:23PM +0200, Cornelia Huck wrote:
> > > > Add 9.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> > > >
> > > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > > > ---
> > > >  hw/arm/virt.c              |  9 ++++++++-
> > > >  hw/core/machine.c          |  3 +++
> > > >  hw/i386/pc.c               |  3 +++
> > > >  hw/i386/pc_piix.c          | 15 ++++++++++++---
> > > >  hw/i386/pc_q35.c           | 13 +++++++++++--
> > > >  hw/m68k/virt.c             |  9 ++++++++-
> > > >  hw/ppc/spapr.c             | 15 +++++++++++++--
> > > >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> > > >  include/hw/boards.h        |  3 +++
> > > >  include/hw/i386/pc.h       |  3 +++
> > > >  10 files changed, 77 insertions(+), 10 deletions(-)
> > >
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > >
> > >
> > > > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > > > index d9e69243b4a7..746bfe05d386 100644
> > > > --- a/hw/i386/pc_piix.c
> > > > +++ b/hw/i386/pc_piix.c
> > > > @@ -479,13 +479,24 @@ static void pc_i440fx_machine_options(MachineClass *m)
> > > >                                       "Use a different south bridge than PIIX3");
> > > >  }
> > > >
> > > > -static void pc_i440fx_machine_9_1_options(MachineClass *m)
> > > > +static void pc_i440fx_machine_9_2_options(MachineClass *m)
> > > >  {
> > > >      pc_i440fx_machine_options(m);
> > > >      m->alias = "pc";
> > > >      m->is_default = true;
> > > >  }
> > > >
> > > > +DEFINE_I440FX_MACHINE(9, 2);
> > > > +
> > > > +static void pc_i440fx_machine_9_1_options(MachineClass *m)
> > > > +{
> > > > +    pc_i440fx_machine_9_2_options(m);
> > > > +    m->alias = NULL;
> > > > +    m->is_default = false;
> > > > +    compat_props_add(m->compat_props, hw_compat_9_1, hw_compat_9_1_len);
> > > > +    compat_props_add(m->compat_props, pc_compat_9_1, pc_compat_9_1_len);
> > > > +}
> > > > +
> > > >  DEFINE_I440FX_MACHINE(9, 1);
> > > >
> > > >  static void pc_i440fx_machine_9_0_options(MachineClass *m)
> > > > @@ -493,8 +504,6 @@ static void pc_i440fx_machine_9_0_options(MachineClass *m)
> > > >      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> > > >
> > > >      pc_i440fx_machine_9_1_options(m);
> > > > -    m->alias = NULL;
> > > > -    m->is_default = false;
> > > >      m->smbios_memory_device_size = 16 * GiB;
> > >
> > > Feels like we should be adding an "_AS_LATEST" macro
> > > variant for piix/q35 too, so it matches the pattern
> > > in other targets for handling alias & is_default.
> > >
> > > Not a thing your patch needs todo though.
> >
> > I've just a patch that does that now. If it looks good & you want to include
> > it as a pre-requisite for your patch here feel free to grab, otherwise I can
> > rebase it after your patch merges.
> 
> I have this patch in my target-arm pullreq that's currently posted
> and pending merge, by the way.
> 
> -- PMM

Ok feel free to tack on

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


