Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp545808lfm;
        Fri, 24 Apr 2020 05:17:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypJoXxeJTggPupGHAChJXg3/J0Azm+ipkTJHNqK5fqxGJ9xMtLJ2N3QNqkN5CouuNJ+Zt0Ax
X-Received: by 2002:aed:370a:: with SMTP id i10mr4337984qtb.64.1587730621785;
        Fri, 24 Apr 2020 05:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587730621; cv=none;
        d=google.com; s=arc-20160816;
        b=OpXz6YgPmSsBzS7ggJPd2CQotgqV4ipFW7C+B5YdQQXbhcCIszmqzjUMrsbhqYPdOI
         ZT34OO/9zWmEaUTMboICyc7Fz65hxzbhwzu+r9EH1AXfKgCR6ucXf08AmhjKkxOicibD
         RnOLAcCib0197huJr5BXX18FuVtj3QFb+iGv3kCanc3+yb/dqmjX/SBAyx+QL74yGHVm
         dS384vHMRZiXo+J3Eq58RyDzO2XfMtMb4BLoalrnkDaogBH83HyIc+dnwIJOWDODZFMR
         QhZdzQ31wWxWId8mT62pvLuZI4k4fhifECDp4W2WkQpX/UWePg49Yw0RSrHoNffT8rva
         IZ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=1TzLomO8h14pAm92bgy1stZ7GqrTVnoP0QkP4QTyPCA=;
        b=n/4ttEx7J4Ni59TUeJGu+Lzhiu4ZXZ4OuFk79OJFrJ5heZS0ZFCICnipRCktSwgcuI
         802+6GNCdloEPOtf9St/gtCCiDdsDS4QiS2pVtWZopzKKP/rHKjHuQE4R7Xb4OC3mFSf
         +gfu6WSR6+kbAdng94lONUZQoYIDKmYUmZ7Wo4y1ziRgjrKlsnsNqOeMN0afBDY1QJo7
         MXwXSLKwtg2MQ3IUpe3jI5i6c7L8vZYR5pQns1LYnOqH3/guek1tfrVZsstKWZZfwfGH
         c6J996bVq4+cZGWehvwb70jAE8emzHW8FAlsv/ZNy4Sh4V/VkK+HSsEIDLmeCfkEjEQ+
         d1tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OVx4GP0i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r63si3222362qkd.340.2020.04.24.05.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 05:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OVx4GP0i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRxGP-0000mf-50
	for alex.bennee@linaro.org; Fri, 24 Apr 2020 08:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jRxGB-0000mH-O1
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 08:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jRxG9-0001D9-MF
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 08:16:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28268
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jRxG7-0000wp-KM
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 08:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587730601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TzLomO8h14pAm92bgy1stZ7GqrTVnoP0QkP4QTyPCA=;
 b=OVx4GP0i+tcCJLVPQbRGvubNK3G9YsH8CDbEFrhUmBCWWzpY6HKv6+rcYrKWYE2Xu5p0N5
 h5+t9Em/UsOzk73UQaS0iSFgOY3orgDYgX9/JDqAG13HwBIaDxT18zSMMXbvwpVuZZX9ti
 2gBhvfEENNUifBJfI8S74mC7poivMUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-H48BV9i2PQOLzJYN1FfsYw-1; Fri, 24 Apr 2020 08:16:39 -0400
X-MC-Unique: H48BV9i2PQOLzJYN1FfsYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9BE1800D6B;
 Fri, 24 Apr 2020 12:16:38 +0000 (UTC)
Received: from work-vm (ovpn-113-179.ams2.redhat.com [10.36.113.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0537B1001281;
 Fri, 24 Apr 2020 12:16:35 +0000 (UTC)
Date: Fri, 24 Apr 2020 13:16:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH v4 1/2] target/arm: kvm: Handle DABT with no valid ISS
Message-ID: <20200424121633.GF3106@work-vm>
References: <20200323113227.3169-1-beata.michalska@linaro.org>
 <20200323113227.3169-2-beata.michalska@linaro.org>
 <CAFEAcA_uWS+cVRk=BKra8AhsD+B1syVzhXeCMttSKwQDdo=j3w@mail.gmail.com>
 <20200417131032.lcyunbjwofsn2nzz@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200417131032.lcyunbjwofsn2nzz@kamzik.brq.redhat.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 02:57:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, quintela@redhat.com,
 Christoffer Dall <Christoffer.Dall@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ze0/W+Hb+jGf

* Andrew Jones (drjones@redhat.com) wrote:
> On Fri, Apr 17, 2020 at 11:39:25AM +0100, Peter Maydell wrote:
> > On Mon, 23 Mar 2020 at 11:32, Beata Michalska
> > <beata.michalska@linaro.org> wrote:
> > >
> > > On ARMv7 & ARMv8 some load/store instructions might trigger a data ab=
ort
> > > exception with no valid ISS info to be decoded. The lack of decode in=
fo
> > > makes it at least tricky to emulate those instruction which is one of=
 the
> > > (many) reasons why KVM will not even try to do so.
> > >
> > > Add support for handling those by requesting KVM to inject external
> > > dabt into the quest.
> > >
> > > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > > ---
> > >  target/arm/cpu.h     |  2 ++
> > >  target/arm/kvm.c     | 54 ++++++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  target/arm/kvm_arm.h | 11 +++++++++++
> > >  3 files changed, 67 insertions(+)
> > >
> > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > index 4ffd991..4f834c1 100644
> > > --- a/target/arm/cpu.h
> > > +++ b/target/arm/cpu.h
> > > @@ -560,6 +560,8 @@ typedef struct CPUARMState {
> > >          uint64_t esr;
> > >      } serror;
> > >
> > > +    uint8_t ext_dabt_pending; /* Request for injecting ext DABT */
> >=20
> > I was trying to work out whether we need to migrate this state,
> > and I'm not sure. Andrew, do you know? I think this comes down
> > to "at what points in QEMU's kvm run loop can migration kick in",
> > and specifically if we get a KVM_EXIT_ARM_NISV do we definitely
> > go round the loop and KVM_RUN again without ever checking
> > to see if we should do a migration ?
> >
>=20
> I'd prefer a migration expert confirm this, so I've CC'ed David and Juan,
> but afaict there's no way to break out of the KVM_RUN loop after a
> successful (ret=3D0) call to kvm_arch_handle_exit() until after the next
> KVM_RUN ioctl. This is because even if migration kicks the vcpus between
> kvm_arch_handle_exit() and the next run, the signal won't do anything
> other than prepare the vcpu for an immediate exit.

This is a level I've not looked at I'm afraid.
However, the point at which we're saving the vCPU state is when the
vCPUs are stopped; so as long as your state that you save is everything
you need to restart and you migrate that then you should be OK; but in
the end fromt he migration point of view we just stop the VM and ask for
each devices state.

Dave

> Thanks,
> drew=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

