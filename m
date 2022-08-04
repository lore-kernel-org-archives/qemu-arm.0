Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp418150lfg;
        Thu, 4 Aug 2022 07:35:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR491aB+khSvTLCFVXublY7Vka+a02eR7AM2yNy/ipBFkQsUWOLEveuSdmPX9usq9L96RpuZ
X-Received: by 2002:a0c:da02:0:b0:474:7d95:87de with SMTP id x2-20020a0cda02000000b004747d9587demr1766410qvj.106.1659623737116;
        Thu, 04 Aug 2022 07:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659623737; cv=none;
        d=google.com; s=arc-20160816;
        b=ya9pDwr+8pHqbjlRob3SpMrtSxpPoUaimsykFQRDaHO+95EnfIHm4PAVB6KDCqNn5H
         /Jwkpx0fQAmBJ7grDcMh+ym1JbQKqpGHpJpHc4LSmZbOli0+oq7842Odp0LKA0XL6k3W
         /g5TTqEPzndMEFbeGABIMF9QcLSw2C/cpT25e7qp7WRmHX8quH2mm/iCMFNGcQtd2Tk7
         hjNPMi1zbj10gMIKylKqJJ68b4dngMvkBuV/ps0hKA+PRbMQlO+xQmOoTJFttOGHfsIF
         2QJ6n0/IHFzFIe4yyYbfv2r3lEm6g5UhU716pcQYq3jgLjxW+K45LMDr95XgwTmnBKCp
         hGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=mR3p0b4dslVSWqNTeQ/ZeeZy0imlU8uigWlA4gCYvJU=;
        b=y5EeIf1raSD3h7Uj+ihipYxH/0i1eghRL8hmFa9WNZsNuLvh5k8/9oCuE6kUBJkeEl
         1013xEDYta6qG7eIkfnQ+9CJx3WHJCQzdQVPHWOhLNv5D41G+D5AjdCmLVzRUcePVZzo
         6hkdiR9OGn+HXd5m+WK4c0KmpJfQKPeAHx09kG+c2HDl5b3ZGhM1pk+FEXAAbFjrjYoK
         LILDJvAwGLIzJReS7uXTLD/YyaWQZQJv+s9NprBCB4dZJEN/SmqhAsO3H89GxKaxaSD7
         g5sBr82tpnbXC9NO63d/MxwsEdb4cMk8hh2tV03tOp80UQViKJ1GY4+vcUzL2JtLQrBW
         qURQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TImrZoGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge8-20020a05621427c800b004763e7e7d9fsi565253qvb.310.2022.08.04.07.35.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Aug 2022 07:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TImrZoGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJbwm-0004sp-LD
	for alex.bennee@linaro.org; Thu, 04 Aug 2022 10:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJbvr-0004pJ-PA
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 10:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJbvp-0007bS-91
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 10:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659623675;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mR3p0b4dslVSWqNTeQ/ZeeZy0imlU8uigWlA4gCYvJU=;
 b=TImrZoGl33YH2DtCaRkR7WCPcGGIBKtmJtUPT4NEWN76lmTlHsRIUbjzmrYoGdxAA8519A
 W7+AJNkj0Mi56khWA7HyhXFbb3DNwbKYpAL3JgpqjPboSAbWKslG8Oyh29k5oS9tLrbxyp
 yBEDJlCYVKmjYRjb6zWOISbBoe4Djqw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-fu0u8EACPn2LFRN8n4NIqQ-1; Thu, 04 Aug 2022 10:34:32 -0400
X-MC-Unique: fu0u8EACPn2LFRN8n4NIqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22B473833285;
 Thu,  4 Aug 2022 14:34:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A41531121314;
 Thu,  4 Aug 2022 14:34:29 +0000 (UTC)
Date: Thu, 4 Aug 2022 15:34:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org,
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Message-ID: <YuvY8/WL0Jojv1Uj@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9EmSvDmmkH0C

On Thu, Jul 28, 2022 at 10:46:35AM +0100, Peter Maydell wrote:
> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
> > > An OTP device isn't really a parallel flash, and neither are eFuses.
> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> > > other interface types, too.
> > >
> > > This patch introduces IF_OTHER.  The patch after next uses it for an
> > > EEPROM device.
> > >
> > > Do we want IF_OTHER?
> >
> > What would the semantics even be? Any block device that doesn't pick up
> > a different category may pick up IF_OTHER backends?
> >
> > It certainly feels like a strange interface to ask for "other" disk and
> > then getting as surprise what this other thing might be. It's
> > essentially the same as having an explicit '-device other', and I
> > suppose most people would find that strange.
> >
> > > If no, I guess we get to abuse IF_PFLASH some more.
> > >
> > > If yes, I guess we should use IF_PFLASH only for actual parallel flash
> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> > > be worth the trouble, though.
> > >
> > > Thoughts?
> >
> > If the existing types aren't good enough (I don't have an opinion on
> > whether IF_PFLASH is a good match), let's add a new one. But a specific
> > new one, not just "other".
> 
> I think the common thread is "this isn't what anybody actually thinks
> of as being a 'disk', but we would like to back it with a block device
> anyway". That can cover a fair range of possibilities...

Given that, do we even want/have to use -drive for this ?    We can use
-blockdev for the backend and reference that from any -device we want
to create, and leave -drive out of the picture entirely

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

