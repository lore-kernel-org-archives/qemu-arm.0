Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp356849njb;
        Fri, 7 Feb 2025 09:32:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUgOQCJtXXFo6RKgO0V9qJehDMJ9FYjNTRoUnbKU+XqYLNuMN4xTZ6CK6zw/gmqS48WI3KzSQNblanJtg==@linaro.org
X-Google-Smtp-Source: AGHT+IFby2P8HZndfEYGbC9EjNfvEPF2Evv3iXw3qnNEtOYOl8Yg9etFhikjhqOILU79qepK42eX
X-Received: by 2002:a05:620a:4802:b0:7b6:773f:4bd5 with SMTP id af79cd13be357-7c047bbc59emr606810885a.20.1738949529174;
        Fri, 07 Feb 2025 09:32:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738949529; cv=none;
        d=google.com; s=arc-20240605;
        b=Ej3hocBDAHtcVRt+91GvtgjVl49RceOrM/TLGGd7U4bjS6F7mk3Ev+ZE4Nwqp0wGOJ
         brRa8cJA06kUjspztwZcy/4xI4BvjtrhcYXBM4LjOT99Y4tHg8r1yrPOtisM9NV9//vx
         QN1zIw6crlCOhoqRn8c0KvtteuoEAk6/kBZLPWJz+JvnE6KdzDWGnJlHC9eiEJvtph3f
         pag/sAbtZv4Xp3nDcZe/ssio7CaeqWdRrjsGfu6uQ7P3flw8RV50RPVDqFr+Ol1AV+CU
         tvKTAEED/0NPe6B6oEL8KGs2E8TnfjrOEK2hz0vRq9fVYEpwssefIzAmLhxRTxJgvF97
         RSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=A+hVGKphc923ntstltAqx5jv6k2i5+FfJvtJtSEAHpU=;
        fh=kZo7LC7E0jxJgYfiQAMN+N+giSo2+6alEn7O3xogzAc=;
        b=fulsFd0B5Rt0p92Uox5z/porjjGYMv19Tw+S4jOpuZRCbSFP9pw2hTi8hgHUK85X/+
         fc4P+09vUsdO2OITD5BwnymQwnChXgxCu7fLZqKfDe6UjdAE6JFcFyQkRYW17dZGIAb6
         NS8U2e6Hwuxrd2CchOUFUApYFNcSC+6ubX9ULV/RJw2nQOqjev5ryU4vuhVc+7DW2FMY
         BMrwGJ9iBEuKTN8CF0mKZJhEEduyRFp1PRHxH+34WaIYgfwnR7trFUxIj0B1r2Jf+HIV
         uJrFiIHeOTznaxkkFG+AwTQW+6A0CrN23kzru7tsC32j9P7iNijjHLfh6gjz2Cwul4nw
         ccvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AFwR2bfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e95730si387364485a.267.2025.02.07.09.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 09:32:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AFwR2bfV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgSCx-0005Td-JP; Fri, 07 Feb 2025 12:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tgSCm-0005Rz-Fj
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 12:31:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tgSCj-0004U2-TE
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 12:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738949508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A+hVGKphc923ntstltAqx5jv6k2i5+FfJvtJtSEAHpU=;
 b=AFwR2bfVX5wD1wrqJFFxQdxJ0FRTu/qWwLUonPDgVeAdL2YnTAFmBB5RdAZ3JCNrHR9T7q
 j6vbtgMmAjiZNbf7IYRl2JwqeDmXSHNHL176ocmtAlHyJAQ0eVldFG0xmeBKGMQMS07W7f
 gWZja2V/ISvP+eZzyqiuMjHinjdFQwk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-MClsIkj3MbqgwF7hiBn1Qg-1; Fri, 07 Feb 2025 12:31:47 -0500
X-MC-Unique: MClsIkj3MbqgwF7hiBn1Qg-1
X-Mimecast-MFC-AGG-ID: MClsIkj3MbqgwF7hiBn1Qg
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e430401b2bso25256756d6.0
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 09:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738949506; x=1739554306;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+hVGKphc923ntstltAqx5jv6k2i5+FfJvtJtSEAHpU=;
 b=D2bKo97LGe2Usbphl7KoxdwANsOsK4mHeJSWAVGK4R/nF8x142+9dkH7YRXiZ4GijC
 z/IVFqiVBDjMpXkiZRpMM8WBxqOgvcunm/J54aU9lEvExDJ9DyOD0CQRRpYaA0M3764j
 iGbk/eunRyXpNh5B9UUrAxqaNIR67yVSdC4Uoy5cweVbr/zn4rQ1+1BPZm1EsRg8k43j
 t74oRhsM3qF8Rw0c2+42QjnQhVOagKUhrV7Ht09jqeErevTB98ZuNnM3jgDA+S8F+aRE
 nML7Sz5FjUY1HW53+B12ifxEFN5YWzCIXRSdw8DJVjkad23apDQzpR7Fo0EcZkY8hm7i
 Sxvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZPknff8nVzm9kecpKJzF8l5UF2H1xT+vm4wv07L4uciWsvRg4TuikqnDHf0UuKsWaKt8slgL2SQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz0mDylOxWj42uLHkMWxTSSos8aZCQ7h/WzO10Fd3DO89IRCCMD
 4JjYa+ws0wPvk+Ug+6Kk5i1eJbIOm+bRHHn6/MFR2+/L1eiJDEs1GTRmjfszf8TIYKMZOXT8JFr
 2xLUgvx84eXZi1mOcVwGiL4WQcykjD9YKd4Fip16ZDgiz3VQYdw==
X-Gm-Gg: ASbGncsIPIEGyVlToeyvWQgSRfyEah5hI7FyadJkWK/eBsuB1hJk4+nPC7BKDeOpjF4
 BaIYF/+roSSLX3zSlRRdUGYWsnTOk8HNWbWGFQ4wbFQofH1B8TBiLOBpQOqo0aX005fLeleHFs4
 21UaHLk3dtf3vXiy6n8TiUNtoSLNoASZUTm2lzN0sUa8bjdRSIkHwXcHvgS9nBHCYBQKGqKK65s
 coxTHK1vpmqo3nSFzC72MjiiDoccXDmi2xUSyF9XW4i2pWVCvjF6M9Y6FZVzbNPjwHIA7u9ZCyz
 vEzM4Ds2M6a/V2QBcqzgk71RBsnA0YamKF2vCpucWBATD324
X-Received: by 2002:a05:6214:1d0d:b0:6d8:9a85:5b44 with SMTP id
 6a1803df08f44-6e4456c11ddmr53841426d6.29.1738949506580; 
 Fri, 07 Feb 2025 09:31:46 -0800 (PST)
X-Received: by 2002:a05:6214:1d0d:b0:6d8:9a85:5b44 with SMTP id
 6a1803df08f44-6e4456c11ddmr53840976d6.29.1738949506188; 
 Fri, 07 Feb 2025 09:31:46 -0800 (PST)
Received: from x1.local (pool-99-254-114-190.cpe.net.cable.rogers.com.
 [99.254.114.190]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e44c1aba8asm5395596d6.42.2025.02.07.09.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 09:31:45 -0800 (PST)
Date: Fri, 7 Feb 2025 12:31:43 -0500
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: Re: [PATCH 0/5] Fix vIOMMU reset order
Message-ID: <Z6ZDf2K0YsqVRE5T@x1.local>
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <Z6Y6sf064FBWT5G1@x1.local>
 <CAFEAcA9ETg2+Xa+e3quJhGG3KsNuH+DW3puuWaJi-q1psUdw6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ETg2+Xa+e3quJhGG3KsNuH+DW3puuWaJi-q1psUdw6A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mk_WwaPuavaHklYQJHEhQWR3Qfr5RansSnBu4iWoziU_1738949506
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: e5KgAF8vERq1

On Fri, Feb 07, 2025 at 05:06:20PM +0000, Peter Maydell wrote:
> On Fri, 7 Feb 2025 at 16:54, Peter Xu <peterx@redhat.com> wrote:
> >
> > On Thu, Feb 06, 2025 at 03:21:51PM +0100, Eric Auger wrote:
> > > This is a follow-up of Peter's attempt to fix the fact that
> > > vIOMMUs are likely to be reset before the device they protect:
> > >
> > > [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
> > > https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/
> > >
> > > This is especially observed with virtio devices when a qmp system_reset
> > > command is sent but also with VFIO devices.
> > >
> > > This series puts the vIOMMU reset in the 3-phase exit callback.
> > >
> > > This scheme was tested successful with virtio-devices and some
> > > VFIO devices. Nevertheless not all the topologies have been
> > > tested yet.
> >
> > Eric,
> >
> > It's great to know that we seem to be able to fix everything in such small
> > changeset!
> >
> > I would like to double check two things with you here:
> >
> >   - For VFIO's reset hook, looks like we have landed more changes so that
> >     vfio's reset function is now a TYPE_LEGACY_RESET, and it always do the
> >     reset during "hold" phase only (via legacy_reset_hold()).  That part
> >     will make sure vIOMMU (if switching to exit()-only reset) will order
> >     properly with VFIO.  Is my understanding correct here?
> 
> Yes, we now do a reset of the whole system as a three-phase setup,
> and the old pre-three-phase reset APIs like qemu_register_reset() and
> device_class_set_legacy_reset() all happen during the "hold" phase.
> 
> >   - Is it possible if some PCIe devices that will provide its own
> >     phase.exit(), would it matter on the order of PCIe device's
> >     phase.exit() and vIOMMU's phase.exit() (if vIOMMUs switch to use
> >     exit()-only approach like this one)?
> 
> It's certainly possible for a PCIe device to implement
> a three-phase reset which does things in the exit phase. However
> I think I would say that such a device which didn't cancel all
> outstanding DMA operations during either 'enter' or 'hold'
> phases would be broken. If it did some other things during
> the 'exit' phase I don't think the ordering of those vs the
> iommu 'exit' handling should matter.

Yes, this sounds fair.

> 
> (To some extent the splitting into three phases is trying
> to set up a consistent model as outlined in docs/devel/reset.rst
> and to some extent it's just a convenient way to get a basic
> "this reset thing I need to do must happen after some other
> device has done its reset things" which you can achieve
> by ad-hoc putting them in different phases. Ideally we get
> mostly the former and a little pragmatic dose of the latter,
> but the consistent model is not very solidly nailed down
> so I have a feeling the proportions may not be quite as
> lopsided as we'd like :-) )

Yes, it's a good move that we can have other ways to fix all the problems
without major surgery, and it also looks solid and clean if we have plan to
fix any outlier PCIe devices.

If there will be a repost after all, not sure if Eric would like to add
some of above discussions into either some commit messages or cover letter.
Or some comment in the code might be even better.

Thanks!

-- 
Peter Xu

