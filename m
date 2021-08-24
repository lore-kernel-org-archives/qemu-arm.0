Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2529607lfg;
        Mon, 23 Aug 2021 23:28:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/9QxgVzkhKPjfyaSZwv6lO0wX32qMKODla8sHy9vpRO640o2e2j0iTQBIfS8dYrGgf8K6
X-Received: by 2002:a67:2c88:: with SMTP id s130mr5405591vss.57.1629786511291;
        Mon, 23 Aug 2021 23:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629786511; cv=none;
        d=google.com; s=arc-20160816;
        b=UGDQboarWDDS9qOneaWaK5weniJbKUnC+9u8PxiSbHbBHFKMkPdgVRWCvl4xyQ4e7O
         kW8DE6UNjFM+JZmnE+QKqKVVh/Psc04VdtlqcQA3Qczgynb77AtCutEkjMStR47327z7
         7LAvaSYwhECs/DV6qurUUyEeXUM5Ryul+cTcSKIIlUBLIwNu8H0BYiPQB3zg3hgfvFzr
         FrA6zY26Vy+EFZDaWDinGeUD5u9qJEpS2hGJVp1NWg9Iql3dLFN4Jp8f9TDun9jPdvea
         haXHslImVQ7onywnv4gBcd7dltZU9R/qLy5v0KCiEJpjta0x0HfjyG7Lusk6W7iNilAk
         rwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WjXxN7ar6YtQgntGRH+UhKS+oGpF1B2cVqu5VNaZuLM=;
        b=TsBNlOoUqTG0vhTbNu3ftSjWfLs8DGHCNffcG6gMm4o0us3CuCfvTwsdd7LAMpC+zm
         8q3PzcaKFelwRlTVgPKqKF42smdi3egHgKoHJsH3C3iFQylt8Bd38n09j91tnbyLHE4n
         E/Jpp4H8ya24BS3OU9BWbJdddeFCKNr7YrVq5HeccN2vLCIR7ZHrfh6gldBGp5zt/nZu
         YOAOIrwiTTD4esZDgGqELLDraMJ3ujMojjZ88OSZRTOl4FkRTTc+upY2SU9FFlTUBBKJ
         SvwTHMul/7nDuooXDeburHkGI5NsCWWrn9OCuekmv7CA1C0UeLkxqYdpNhZHyZwhL6Gd
         f0Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gTAAmGMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si6398353vkc.45.2021.08.23.23.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 23:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gTAAmGMA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIPvC-0004se-LB
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 02:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIPuv-0004rr-Tc
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 02:28:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mIPut-0002sk-7s
 for qemu-arm@nongnu.org; Tue, 24 Aug 2021 02:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629786489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WjXxN7ar6YtQgntGRH+UhKS+oGpF1B2cVqu5VNaZuLM=;
 b=gTAAmGMA2VTXYeCOfwlkL9HT6dAmIXrkMmX1287Ka5Qnsy8UMHo0lHTegnzAX8d7UXb4Gk
 HzardUJQlcX+3BahpJQ+adAgAeMoM5QIY4DRTgXpkgxQ1Kubwn3WqolNL3b7UoJIvzSkW2
 8qy1tho0JUZP2LiZrrHvhq3epH5dVqM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-9fRDmC9nOtaXrTydVHi-Cg-1; Tue, 24 Aug 2021 02:28:07 -0400
X-MC-Unique: 9fRDmC9nOtaXrTydVHi-Cg-1
Received: by mail-ej1-f71.google.com with SMTP id
 o7-20020a170906288700b005bb05cb6e25so6657138ejd.23
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 23:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WjXxN7ar6YtQgntGRH+UhKS+oGpF1B2cVqu5VNaZuLM=;
 b=UQQukudqg+dWjw+On6k3Svb7FeDyiFisntscNyO27Pw731cZno3lI+d1lDbnZa6kdw
 GsFofvC/yBKVY7/Fg/MQoGrY8mnBtIZn/ih9GnvT3nX1MTMDv1t+kOh7YiIX8m/P/E0b
 cxcFtw2jz87td1aJQIEA72Lb6UauRcbKMLVirckZvH4Lyusb8jRVoZ9FQRMOSRqqpDnu
 VbcquboUP7Xlc6sfZFojyAWy/yPfJ4CDlv3LTJMAkHdtJhwl2ik3WsX6XDI1rvyBTGgx
 /J26gbwJk37IiZavB1JlZmzkp8k0UA2FzH2xno7DiJSQpMvasaK+kdiU9aAPMc5sG/Gf
 GBNw==
X-Gm-Message-State: AOAM531kwkecA3IJZ/KMsPCOl33k5SBFKD2g0SevjilP7JaWrNyHzqKs
 J7HRHAGMCZs72vgZfOoviQt7hZBDU4exVY3i1a9K+KcLIdfhl5u7OYH5712HWFSLOFxKP06Q9Kd
 qeag2tlyjJJVM
X-Received: by 2002:a17:906:c1d0:: with SMTP id
 bw16mr39670603ejb.146.1629786486529; 
 Mon, 23 Aug 2021 23:28:06 -0700 (PDT)
X-Received: by 2002:a17:906:c1d0:: with SMTP id
 bw16mr39670573ejb.146.1629786486184; 
 Mon, 23 Aug 2021 23:28:06 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id j24sm2227720edj.56.2021.08.23.23.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 23:28:05 -0700 (PDT)
Date: Tue, 24 Aug 2021 08:28:04 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 4/4] target/arm/cpu64: Validate sve vector lengths are
 supported
Message-ID: <20210824062804.amut2hdve4x6ldsw@gator.home>
References: <20210823160647.34028-1-drjones@redhat.com>
 <20210823160647.34028-5-drjones@redhat.com>
 <31e867ec-d122-d45f-3e17-ba12d7d840ae@linaro.org>
MIME-Version: 1.0
In-Reply-To: <31e867ec-d122-d45f-3e17-ba12d7d840ae@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +HNjiJhz/HRK

On Mon, Aug 23, 2021 at 11:04:49AM -0700, Richard Henderson wrote:
> On 8/23/21 9:06 AM, Andrew Jones wrote:
> > Future CPU types may specify which vector lengths are supported.
> > We can apply nearly the same logic to validate those lengths
> > as we do for KVM's supported vector lengths. We merge the code
> > where we can, but unfortunately can't completely merge it because
> > KVM requires all vector lengths, power-of-two or not, smaller than
> > the maximum enabled length to also be enabled. The architecture
> > only requires all the power-of-two lengths, though, so TCG will
> > only enforce that.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >   target/arm/cpu64.c | 101 ++++++++++++++++++++-------------------------
> >   1 file changed, 45 insertions(+), 56 deletions(-)
> 
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> > +        } else {
> > +            if (kvm_enabled()) {
> 
> Nit: better as
> 
>     } else if (...) {
> 
> if I'm reading all of the diff context correctly.
>

Yeah, the diff is definitely not easy to read, or even the code
after its applied for that matter... We can't use 'else if' here
because the 'else { if' is part of a pattern like below

  if (...) {
     if (...) {

     } else {

     }
  } else {
     if (kvm_enabled()) {

     } else {

     }
  }

Thanks,
drew

