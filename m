Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1462551lfp;
        Wed, 15 Sep 2021 01:38:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPxmlZwDncM6N3CNmx8VphXLXTu4RILSwE+E4NZI0KftBhp9WhShCdzlmK42MsMKqylr8S
X-Received: by 2002:a25:30c2:: with SMTP id w185mr4700423ybw.321.1631695109932;
        Wed, 15 Sep 2021 01:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631695109; cv=none;
        d=google.com; s=arc-20160816;
        b=TGVCjyOhlqs5/6o82jMOFeIeMrQVf1zW1STnt/X9Suta/Leaio1+T6gtyZ2PRVT4Wk
         tT7AIGJASb+cVuriU7cpbtRSQjUnJuh7BpkLmP9NYFrNtB6QkVGRhOMaMoyX25uLhgN2
         qcp8vAfU9Ay/ZgR59i3nrQGD5/KKRCSlq3M4DH7S3I9P+D1b+kbXlhQZzBQvoNi0DwUj
         XuLDrQh2ENMoSs0UFebX60vG8LP2/W2G+fJ/80xzpFC7jYByarx6uxHHY7FYygvyv7zo
         /QkPsyg+1lX0x89637052rPyMTOv46GrwnrVzyy7UZd8FpAGiY11wgUmswaarKYhF8DX
         AUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=SByZigJwyPmdwiTi+mf4/Fr1+UHRFaJ9yDMF7YBqFnw=;
        b=rOmxsL9LX+w+9jM2w4V8u2/EzuDtYFRWTs96adXsMyLNgWhZpQ4SH34HAhUgW0FjRg
         3/xAbXbATbqvVJ2N6ofXBv7xMnmT5TUwHjE1o+iNXjNtzDZdb/ojJqYev1/R7KVVONS3
         Gg5Uvr8EuMZyyeBVG07kUe26o53q1CGUA3Yn6i9DNqYdlJJCQUw3OhMRQL+hMRYjrQRc
         2s13YpkYJzLwmf6G4hrX34x8IV6xT33xTBe2AVjtMB6U3jm5+TbCsUn3/QvQx7MS0LTH
         azyXmUbuvGt1M2RjZHAEWRcBIwVoyAvlvbnulnbI04c3hZkDePj0UOvmxGGXFGlwzb09
         D2ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V4zocb7a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m66si17828303ybm.109.2021.09.15.01.38.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 01:38:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=V4zocb7a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQQR3-00064i-AP
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 04:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQQn-00062H-4B
 for qemu-arm@nongnu.org; Wed, 15 Sep 2021 04:38:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQQU-0007Yr-VY
 for qemu-arm@nongnu.org; Wed, 15 Sep 2021 04:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631695073;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SByZigJwyPmdwiTi+mf4/Fr1+UHRFaJ9yDMF7YBqFnw=;
 b=V4zocb7aw/HKRvcci4n8H/IVFejCo5IXEjP9vDFvOfFdEsldCgyly5Gc6GGCAEXvBcmqId
 VNkEi8RcsnBdrB2rdsrnwxlkGIb0Jp4vtv7qIprS7zBOkj325L+3f7HVLBVovLJlSTR3+q
 d/dBifsOJ/iXDYj8RfW8GkU1qePARJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-oWg4v2lYOc2yb6fBYtd2Gg-1; Wed, 15 Sep 2021 04:37:52 -0400
X-MC-Unique: oWg4v2lYOc2yb6fBYtd2Gg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3F09835DE0;
 Wed, 15 Sep 2021 08:37:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6D7A60C81;
 Wed, 15 Sep 2021 08:37:46 +0000 (UTC)
Date: Wed, 15 Sep 2021 09:37:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate 32-bit hosts? (was: Re: [PULL 14/14] hw/arm/aspeed:
 Add Fuji machine type)
Message-ID: <YUGw1v20jNRxq2zH@redhat.com>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
 <ee5d379f-a792-aae1-370a-b5f21582ae58@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ee5d379f-a792-aae1-370a-b5f21582ae58@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IpUcybzH4k7a

On Wed, Sep 15, 2021 at 09:42:48AM +0200, Thomas Huth wrote:
> On 14/09/2021 17.22, Richard Henderson wrote:
> > On 9/14/21 5:26 AM, Peter Maydell wrote:
> > > (2) RAM blocks should have a length that fits inside a
> > >      signed 32-bit type on 32-bit hosts (at least I assume this
> > >      is where the 2047MB limit is coming from; in theory this ought
> > >      to be improveable but auditing the code for mishandling of
> > >      RAMblock sizes to ensure we weren't accidentally stuffing
> > >      their size into a signed 'long' somewhere would be kind
> > >      of painful)
> > 
> > Recalling that the win64 abi model is p64, i.e. 'long' is still 32-bit
> > while pointers are 64-bit, how close do we think we are to this being
> > fixed already?
> > 
> > > Even if we did fix (2) we'd need to compromise on (3)
> > > sometimes still -- if a board has 4GB of RAM that's
> > > not going to fit in 32 bits regardless. But we would be
> > > able to let boards with 2GB have 2GB.
> > 
> > I'm not opposed to deprecating 32-bit hosts...  ;-)
> 
> I think we should consider this again, indeed. Plain 32-bit CPUs are quite
> seldom these days, aren't they? And I think we urgently need to decrease the
> amount of things that we have to test and maintain in our CI and developer
> branches... So is there still a really really compelling reason to keep
> 32-bit host support alive?

I think it probably depends on the architecture to some extent.

i386 is possibly getting rare enough to consider dropping, though
IIUC, KVM in the kernel still supports it.  Would feel odd to drop
it in QEMU if the kernel still thinks it is popular enough to keep
KVM support.

armv7 feels like it is relatively common as 64-bit didn't arrive
in widespread use until relatively recent times compared to x86_64.
KVM dropped armv7, but then hardware for that was never widespread,
so armv7 was always TCG dominated

Other 32-bit arches were/are always rare.

> Could we maybe also decrease the amount of targets, i.e. merge
> qemu-system-x86_64 and qemu-system-i386, merge qemu-system-ppc64 and
> qemu-system-ppc, etc. where it makes sense (i.e. where one of the binaries
> is a superset of the other)?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

