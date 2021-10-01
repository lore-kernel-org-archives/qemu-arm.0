Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1102435lfp;
        Fri, 1 Oct 2021 02:45:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGqp7sU9svCMQa3wwBvWo5BenirA4ziVyREXcH+S+ZzTk+jH8s/98LvLE0tZXa8v7BuRid
X-Received: by 2002:a25:4016:: with SMTP id n22mr4804022yba.309.1633081505836;
        Fri, 01 Oct 2021 02:45:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633081505; cv=none;
        d=google.com; s=arc-20160816;
        b=tIp4rD2ornirNN2QCwyedKvmBl2oahWiLmX59J5457AJYEanxv78IDCRZHRDlMuhZw
         H5o3y6VnrDWogC+1VqMr2y/YcS0PZTyhj/3EDzRsOprc5HamDjB6WLLRYHIq5NwaSIj5
         cs+2Y4RR4OKAyjmWqQh7L7z9LvUhCuDKVBVKh0fF71ZS3lBorsCGuAIqrgkHHhxIp1fl
         nEI7MMnctABA9B8sM0jIiSbFbMDOhoEnxEHAwvwnEGhYeydbp4ulGB9f9chIKYvVY/cB
         Mjh24i8SdBurwR++VqDQjAuOjn+K3Vmwz/DJO2DRD25LxDYwwVyUyjkW3OO6oNrylOmp
         6XjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OSEoB9K9vEvT7iR81jAXZmhqf9MlJ/0ecGjbi2+hd1Q=;
        b=sSN6YWD/Bw7Fz3/0/PpYJsQv9tyf3YLto8/0pg9WWWhuk0tnEzeR7QlA1J2K3pGl0s
         I5cCa64F+K+3IUlNDpVrHdF+7hqEUaaogjbQRu3izjEYS/0ocd0BKc+XTVuo4vPHEImM
         deIpfAlIe7lxxRDHCoMmi44Nfl50zF+PpEAbBg+LS4CzZPmLPiFQN2vT9ItkUliSvPpQ
         U9mejJNhAAJyZohkiJQJlSSItkFyLPiZQTlcZ2ZgpyYUKSzIHOpqjVgVYP2sx10tilCW
         UUb2Lee+AmUXWN4xjKBCpdGiRpaaQZFd1a07fOAZ/IIHg7+zp6PwucyHPuUd2z0bbEUs
         GhAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HAIBmpgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c83si6144826ybb.224.2021.10.01.02.45.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 02:45:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HAIBmpgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWF6H-0004jN-5E
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 05:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWF5o-00049W-HR
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWF5m-0007zi-Q9
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 05:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633081474;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSEoB9K9vEvT7iR81jAXZmhqf9MlJ/0ecGjbi2+hd1Q=;
 b=HAIBmpgmb44Y1WL68P915MNjbzsG8XduZVS1gw3C+KMSVwaC6CoQeBKbd/ilGvwICcCPnu
 2uo5Nk4ksfV1naA4kZLqkhekAKi/KVJwdca5PlJZ9l5GID7JjGUGTjK0wSdC1vP9HelaPP
 JBKuqVJ7+i+3ILq5lMXxyKgM/XdffGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-oYaafS4MOnqiW5jZds8P4g-1; Fri, 01 Oct 2021 05:44:24 -0400
X-MC-Unique: oYaafS4MOnqiW5jZds8P4g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D9101015DA2;
 Fri,  1 Oct 2021 09:44:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 013495F4E2;
 Fri,  1 Oct 2021 09:44:12 +0000 (UTC)
Date: Fri, 1 Oct 2021 10:44:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <YVbYavVeV/OmYON6@redhat.com>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
 <YVbQERWD9fY0kxxW@redhat.com>
 <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8PdNEHU2YMGT56bCwezf9i+BGxijwevLJakrR_N1Yjhw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: siwjKdWTWsZX

On Fri, Oct 01, 2021 at 10:37:51AM +0100, Peter Maydell wrote:
> On Fri, 1 Oct 2021 at 10:10, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
> > > On 27/08/2021 14.09, Thomas Huth wrote:
> > > > The dtc submodule is currently pointing to non-release commit. It's nicer
> > > > if submodules point to release versions instead and since dtc 1.6.1 is
> > > > available now, let's update to that version.
> 
> > Most of our supported platforms don't have version 1.6.1 available.
> >
> > As a general goal IMHO we should be seeking to eliminate bundling of
> > 3rd party modules that are commonly available in distros. We've
> > carried dtc for a hell of a long time, and if we keep updating our
> > submodule we'll keep relyin on new features, and never be able to
> > drop it because it will always be newer than what's in the distros.
> >
> > So personally I think we should never again update dtc and capstone
> > modules. If we want to take adbantage of new features, then do that
> > through conditional compilation, as we do for any of the other 3rd
> > party libraries consumed.
> 
> I agree in general, but (per the commit message here) our dtc
> submodule is currently pointing at some random not-a-release
> commit in upstream dtc. We should at least move forward to
> whatever the next released dtc after that is, before we say
> "no more dtc updates".

Yep, if we want to fix it onto an official version tag, that's
OK, just not jumping right to very latest version. We might want
to move it backwards to better align with what we're targetting
in the support

Best I can tell the distros currently have these versions:

     - Alpine 3.14 - 1.6.1
     - CentOS 8 - 1.6.0
     - Debian 10 - 1.4.7
     - Fedora 33 - 1.6.0
     - OpenSUSE Leap 15.3 - 1.5.1
     - Ubuntu 18.04 - 1.4.5
     - FreeBSD Ports - 1.6.0
     - OpenBSD Ports - 1.6.0
     - macOS HomeBrew - 1.6.1
     - Windows MSys2 - 1.6.0


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

