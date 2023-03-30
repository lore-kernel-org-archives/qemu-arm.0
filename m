Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1273829ejb;
        Thu, 30 Mar 2023 07:11:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set8zfpKKL+8EKyEmEpMR60P7hUf3WjH+cxAmydLeQTWVqdoDDOxm47YmvR08y4k+pzN+bmhG
X-Received: by 2002:a05:622a:1109:b0:3dd:2a03:63c6 with SMTP id e9-20020a05622a110900b003dd2a0363c6mr42160145qty.56.1680185510317;
        Thu, 30 Mar 2023 07:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680185510; cv=none;
        d=google.com; s=arc-20160816;
        b=LE4N/dwRcSHVmUboKoDOL9Db+2R08sONsK5kkxa1auXczZ+jpCbCjxzl57VPVrdimc
         iQzvYTQCrY5mmqhJ2a5DS3ijsxnxDhaZBGpq0z9UI33FV/a2qRPMYIuS0hwD5VeRV8vu
         UcvRAkmuiMc7AhyHldJxqKfli+A7zwgD9d0yWE9gZipFAm2VBaBbzDW4ghKJ7sGkr5As
         JsDdyh41o2t1MxnwizcyGrN2Up6tTdrBE89dcr726KMlrttWmatTlOb1XGNpVw+a+pDU
         XuXCb7FAEy3GSa2vuejMo/8I9KdxM0Ivx5eecCVcGS8wJIwwQBLvtg8L2e5ESrD+DOuq
         KIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Q8Oxxlisc2op1A7/MGmyhDOusAtAga3utK3yR7JXwBk=;
        b=U6QW467gQX9hgpVsdAUTrRJh8MRbGrQ0gEzBh8Ilzjapsb8vvFbetb9+pQS1G6kE3q
         OYblkIT5pRXXwvB+1+6ONHxaLPlxWeVMbnT5Jr+JJ8OKmkIlSP3zVWermfWtQVHU7YhF
         nBLjykYFdVdZPiOoxhaVmDEp5KodrPlQpCGqPbZGRCLuo32s/Yd1o4w2BBGc7iqXLb4d
         Gk65PeyCP0w3qgZyMH4IMIMj1lyIzjI0WxDZd0OLrZGq9OkNqxpXkfzlwAaNu0rm08no
         9pGlDBf0RnaG55XvXwX6EWYELbkivXjH/l1+l/U3hJd3x0N6gwx/8sM/KsklkzSr9D5H
         RYCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9OW3Pgi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1-20020a378701000000b00748534ccb3csi9590837qkd.212.2023.03.30.07.11.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 07:11:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A9OW3Pgi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pht03-00051t-7T; Thu, 30 Mar 2023 10:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pht00-00051g-L8
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phszx-0000vY-UI
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:11:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680185489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8Oxxlisc2op1A7/MGmyhDOusAtAga3utK3yR7JXwBk=;
 b=A9OW3PgilDAMuOQczJt+rBbajWzG+UuzjlxW04FH7FF7v/2c/Kt0xwb3afKvOf3RUQFfNE
 GiU/3j32KOgOjFtI7yG+NYQZetPPQu39EZcggNku4R74T4Z8OU+kiuN4Z8B0ms/oSZsSKh
 zK9BGclGTh/1Lf/P/MyXLjuEmyQoTuU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-l69ltTj5Mrqj734RXUxAIw-1; Thu, 30 Mar 2023 10:11:28 -0400
X-MC-Unique: l69ltTj5Mrqj734RXUxAIw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o28-20020a05600c511c00b003ef69894934so6525708wms.6
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680185487;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8Oxxlisc2op1A7/MGmyhDOusAtAga3utK3yR7JXwBk=;
 b=B7h97sCEMc8cR5GEcdyijCxFjfdMYtI+14WBGFL1n3BMpW4bQbgaQl0p18exQmGG5x
 4QDX/O6K/VdRxfO067G4FNV1b2VCKqMFQSpruqsN5AgSKRqV+wApCp0IJ1ycHXKfrB4q
 gasegoIDNDMzfJCpPABW3ariXl3VeZT/EinpfnDQusy1K56PoQgq1SSXVjBkAJ8X4LkR
 a5ae/JMsvn1BJviRKk25U/DomO/iTTHYOzxtclmWIIDnKQxtV0pkCuYF9omoFaxItznc
 pAidQ4kA+qErAR2wsdVfsMhlSH5uMxdompegkp2xaxjFaR0L/bSt0Vmm2UGvziAzDBTK
 pxCg==
X-Gm-Message-State: AAQBX9ezVGYrL8KTPIqrbYvqqon8hhu2YQm9r8Gqte1XJC6Z1CyzjZXY
 mBGPqB4bhoh1kJKhjAFZWWehh10eDJXLilGekyWBwl0vfPX19Q0v1V1zqYkyVY3eXKGYd3zMoZQ
 uLD3o1RnQRTse8NU=
X-Received: by 2002:a1c:4c18:0:b0:3ef:7584:9896 with SMTP id
 z24-20020a1c4c18000000b003ef75849896mr7736798wmf.26.1680185486954; 
 Thu, 30 Mar 2023 07:11:26 -0700 (PDT)
X-Received: by 2002:a1c:4c18:0:b0:3ef:7584:9896 with SMTP id
 z24-20020a1c4c18000000b003ef75849896mr7736778wmf.26.1680185486667; 
 Thu, 30 Mar 2023 07:11:26 -0700 (PDT)
Received: from redhat.com ([2.52.159.107]) by smtp.gmail.com with ESMTPSA id
 l32-20020a05600c1d2000b003f0321c22basm4843075wms.12.2023.03.30.07.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 07:11:26 -0700 (PDT)
Date: Thu, 30 Mar 2023 10:11:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Eric DeVolder <eric.devolder@oracle.com>, shannon.zhaosl@gmail.com,
 imammedo@redhat.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Message-ID: <20230330101052-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
 <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
 <20230330094323-mutt-send-email-mst@kernel.org>
 <366bb156-f41f-e1c4-fc59-3ecca6eeaba7@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <366bb156-f41f-e1c4-fc59-3ecca6eeaba7@anisinha.ca>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3CZr6o0g4Bkd

On Thu, Mar 30, 2023 at 07:32:59PM +0530, Ani Sinha wrote:
> 
> 
> On Thu, 30 Mar 2023, Michael S. Tsirkin wrote:
> 
> > On Thu, Mar 30, 2023 at 01:06:36PM +0530, Ani Sinha wrote:
> > >
> > >
> > > On Wed, 29 Mar 2023, Michael S. Tsirkin wrote:
> > >
> > > > On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> > > > >
> > > > >
> > > > > On 3/29/23 00:19, Michael S. Tsirkin wrote:
> > > > > > Hmm I don't think we can reasonably make such a change for 8.0.
> > > > > > Seems too risky.
> > > > > > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > > > > > revert to old behaviour, in case of breakage on some guests.  and maybe
> > > > > > we want to keep old revision for old machine types.
> > > > > Ok, what option name, for keeping old behavior, would you like?
> > > >
> > > > Don't much care. x-madt-rev?
> > > >
> > > > > >
> > > > > >
> > > > > > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> > > > > > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > > > > > less than 5.
> > > > > > >
> > > > > > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > > > > >
> > > > > > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > > > > > Linux?
> > > > >
> > > > > https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> > > >
> > > > Great! Maybe stick a Link: tag in the commit log.
> > >
> > > If the original bug is in the kernel and kernel upstream has accepted both
> > > your fix and Mario's patch on the acpi revision mess, I see no urgency to
> > > fix this in QEMU.
> > >
> > > Maybe we can address this in the 8.1 development window.
> >
> > Why "maybe"? Eric is working on a patch I don't see why we won't
> > address it.
> >
> 
> I am not opposed to addressing it. I just think it might be too risky for
> 8.0 given that we are already past the hard feature freeze date.

This does not look to me like a justified change for 8.0.
We have rev = 1 for years.

-- 
MST

