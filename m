Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1079981lfp;
        Fri, 1 Oct 2021 02:10:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJIa7WAi5Jedg+NYiOyeNmlwdPMS/49JSpAyrqCCaJ6mJeVEILwxXe8VE0g2OpM6IiBbu9
X-Received: by 2002:a05:6e02:1a84:: with SMTP id k4mr8022840ilv.146.1633079406024;
        Fri, 01 Oct 2021 02:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633079406; cv=none;
        d=google.com; s=arc-20160816;
        b=qHKoQ6yRr9HQbxJDQ2wgL5pONpioQUHjsfk+Z4TQGNk3yZZJplu34CE1Gz0jYpx8Fm
         hPrzRI7cGA+HXXOlcHKdaQWfmNjn6AHuRjLTxhzJ93m/XWaXlwFItRALbisjoNKINON6
         7WXZ6Dq33fusWxd3Uw32NuzcD9NYte1sBSlxdq8KeSLbkl7op+eTBuG62IxyuNtQAldl
         cRkaUaOGVHGm1MhzeM9+X9BO8eXfEDFM5ZsEGNmwn4dmVf9G+DRHy8/HQB/FKaewzY6d
         KUgU0xvcgwkBRw+JsIJkp+cU6xyxpQsDnRTKNSy0PFaX0f3RsRnomdu7Geck8c8jfpyH
         Tk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=PrVZofCcfa67fs4N3t0NNeTpuNnAl3CeaqnGyhcboqc=;
        b=VRvDFG3vpT7Uv7dWUX9FyDDwwKn2iOPhq2VN1OllL1psZZmtjSl16jzLJq7uTkPewP
         slerhK+Z5wmS87JGvo2GCHW36+9h+wVs0XcRbtmdk3j9AcW3Dhithi+cJZS9hAMEihoI
         uuQt20Z7cPjFLOK3a3QLCyw2cZ107yPzqXm14GGFDul/p04RkH45gqpCdbEyT+nXtIo2
         LVYwSpZ48vAMDHkNDFOEeKHXhYk9YWm7TzVRN5cfzNKwrwAEJrLBpEdr8vLWfq3B8p76
         FtGHFDWbxzGl5qu5TcImvCYYK0OMdCD63vJcVczdt1a1HC72eDEPcMu+wWrDr6fHPCi6
         cUgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OJWqDw3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si5946294ioa.74.2021.10.01.02.10.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 02:10:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OJWqDw3Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWEYP-0006rB-At
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 05:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWEX8-0003sc-Hd
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWEX5-0002kr-Hi
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633079322;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PrVZofCcfa67fs4N3t0NNeTpuNnAl3CeaqnGyhcboqc=;
 b=OJWqDw3Yo8EEteEcLbn8NJ8e+TFpCjkI1vAeXaAWdQ/c07jhK5TC6AaC+ecDwhTnu7Ximm
 30aqWkDD83anva5ifkYajob8VYomHEDw9lnl1PSbYjBn+Cc4lDZGzh4/sZhkFu0Z5XPvLn
 n15KDSl5AVrnps76oV/eczqfpt1oIRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-ce18OlleMiWBEZF-9VqLPg-1; Fri, 01 Oct 2021 05:08:39 -0400
X-MC-Unique: ce18OlleMiWBEZF-9VqLPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB0418414A2;
 Fri,  1 Oct 2021 09:08:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E6560936;
 Fri,  1 Oct 2021 09:08:36 +0000 (UTC)
Date: Fri, 1 Oct 2021 10:08:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <YVbQERWD9fY0kxxW@redhat.com>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y6az4iUDdDcu

On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
> On 27/08/2021 14.09, Thomas Huth wrote:
> > The dtc submodule is currently pointing to non-release commit. It's nicer
> > if submodules point to release versions instead and since dtc 1.6.1 is
> > available now, let's update to that version.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   dtc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/dtc b/dtc
> > index 85e5d83984..b6910bec11 160000
> > --- a/dtc
> > +++ b/dtc
> > @@ -1 +1 @@
> > -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> > +Subproject commit b6910bec11614980a21e46fbccc35934b671bd81
> 
> Ping!
> 
> David, could you please pick up this patch if you don't mind it?

Most of our supported platforms don't have version 1.6.1 available.

As a general goal IMHO we should be seeking to eliminate bundling of
3rd party modules that are commonly available in distros. We've
carried dtc for a hell of a long time, and if we keep updating our
submodule we'll keep relyin on new features, and never be able to
drop it because it will always be newer than what's in the distros.

So personally I think we should never again update dtc and capstone
modules. If we want to take adbantage of new features, then do that
through conditional compilation, as we do for any of the other 3rd
party libraries consumed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

