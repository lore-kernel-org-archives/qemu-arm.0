Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6058545lff;
        Tue, 10 Dec 2019 08:41:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqw24Iy9WPpBQWnzHdFb5pJii7JvR//RG/1OXsNg0GKr11bMBwBAnB4+B1Z2rt/AhjCEFhFV
X-Received: by 2002:a37:9906:: with SMTP id b6mr19505365qke.406.1575996100310;
        Tue, 10 Dec 2019 08:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996100; cv=none;
        d=google.com; s=arc-20160816;
        b=Y//Xtpv9Qg04h/86F0MZd9oIbKB4FpOIZ9kOfw8yfHWDZV4Pq/rcPbSqpHo2kM4kT+
         v5iC47wCgz47DeLkYPk7C932pBYvb+LbdyzXf5dmlwoKDZPIlpQz/dPvmFBKR9WLPvaI
         +/hbp6OT8/iURpp8WLkvTZ1Adm5t5wM3dHPjoTgvr3GJK/F0cdkgJ8iBpHQ1Ft5xzKFh
         RYevk8Nq8TVhTpgmJGUfSxKzZEjCOVulQV7LrAwnGQTg6misXmTPwc1orvnqV7SnG5mZ
         uGtaO4vlWUpHTDkSZ9yUMmYFcJEM7VOcym9hpoobfYKlZksAPqZ/vziQrvB6CB9I8Uhg
         RprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=oQ2rGxKgg83OZ9oqSgECS/5VH/LEYzs7CGZjuEUgRUI=;
        b=bhMWBCFUQpnUOpCfBNZGLYwVZsY42puEXl3RBXCjAfphwmfyzA/oP+jxtQlCrmxYaa
         HCjRCPEFCaB+eZQXLGB4jq3ap+2jOChS1IDLo7/6IN1bqOsbJYObcMru9eqbBzNV5ByQ
         NIuRjtVghevSFoqp129WKrsqvA3ApkxZuCzpfnzwvzXDyFuxS2Zl+JbLt/jpvy75eV0A
         D+s5MaN4JnNwI7XstdHJ47pzq5E7aT6INj2EW8S4/i1tI+oSYzqtLCUm+tqiUHvW8Lyv
         oug6XMoOuUWj/g0YpG2utiyq/h74wDfw4tmej3JwR53vT2rgNCCPqFGGoxm/r/sk3yZc
         tUEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U2FuMeKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a198si2123779qkb.38.2019.12.10.08.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:41:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U2FuMeKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieiZv-0000L1-Mx
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1ieiZb-0008Td-FH
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:41:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1ieiZa-0003Tn-Bi
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:41:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27881
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1ieiZa-0003TB-6w
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 11:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575996077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oQ2rGxKgg83OZ9oqSgECS/5VH/LEYzs7CGZjuEUgRUI=;
 b=U2FuMeKaqgxy+iGDpBgo5bCgXw9zQJw2HHyuJ/4Q9+797q+iMJ08+JmFb18wQka96E4XHQ
 SWMxHo/Y/WbAmMZWDHH0kQBvnd5rZa5Plbp5bBT51gnmYx/X/P5V/8eufVyr6Vm0n1gedV
 6acw9wrylReaa1fWfYTu7ZakekpSQwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-fCV5_Z9mP2qvGb4xpFHIBQ-1; Tue, 10 Dec 2019 11:41:13 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71E711010C5D;
 Tue, 10 Dec 2019 16:41:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 227271001902;
 Tue, 10 Dec 2019 16:41:10 +0000 (UTC)
Date: Tue, 10 Dec 2019 17:41:08 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 2/5] timer: arm: Introduce functions to get the host
 cntfrq
Message-ID: <20191210164108.waqpn3wbo75nwqpx@kamzik.brq.redhat.com>
References: <20191016143410.5023-1-drjones@redhat.com>
 <20191016143410.5023-3-drjones@redhat.com>
 <CAFEAcA-a9O88EbKqSNxb_7GLVZzC+dx0daEWyAAe9SS4SRa1oQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-a9O88EbKqSNxb_7GLVZzC+dx0daEWyAAe9SS4SRa1oQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: fCV5_Z9mP2qvGb4xpFHIBQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, bijan.mottahedeh@oracle.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5tv5t6BqaCyV

On Tue, Dec 10, 2019 at 03:47:39PM +0000, Peter Maydell wrote:
> On Wed, 16 Oct 2019 at 15:34, Andrew Jones <drjones@redhat.com> wrote:
> >
> > When acceleration like KVM is in use it's necessary to use the host's
> > counter frequency when converting ticks to or from time units.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  include/qemu/timer.h | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> > index 85bc6eb00b21..8941ddea8242 100644
> > --- a/include/qemu/timer.h
> > +++ b/include/qemu/timer.h
> > @@ -1006,6 +1006,22 @@ static inline int64_t cpu_get_host_ticks(void)
> >  }
> >  #endif
> >
> > +#if defined(__aarch64__)
> > +static inline uint32_t cpu_get_host_tick_frequency(void)
> > +{
> > +    uint64_t frq;
> > +    asm volatile("mrs %0, cntfrq_el0" : "=3Dr" (frq));
> > +    return frq;
> > +}
> > +#elif defined(__arm__)
> > +static inline uint32_t cpu_get_host_tick_frequency(void)
> > +{
> > +    uint32_t frq;
> > +    asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=3Dr" (frq));
> > +    return frq;
> > +}
> > +#endif
>=20
> Don't we want to know what the guest counter frequency
> is, not the host counter frequency? That is, I would have
> expected that we get this value via doing a KVM ONE_REG ioctl
> to ask the kernel what the guest cntfrq is. Are we using
> the host value on the assumption that the guest might have
> misprogrammed their copy of the register?
>

Indeed it would be best to get whatever KVM is using for the given VCPU's
CNTFRQ through GET_ONE_REG, but KVM doesn't seem to allow it. I hadn't
tested before, but to be sure, I did now with the following kselftests
test

 #include "kvm_util.h"
 #include "processor.h"
=20
 static void guest_code(void) { }
=20
 int main(void)
 {
   struct kvm_vm *vm =3D vm_create_default(0, 0, guest_code);
   uint64_t reg;
=20
   get_reg(vm, 0, ARM64_SYS_REG(3, 3, 14, 0, 0), &reg);
   printf("%lx\n", reg);
   return 0;
 }

The vcpu ioctl fails with ENOENT. Currently KVM requires all guests to
have the same frequency as the host, but I guess that will change
eventually. It's definitely best to do the save/restore thing, as you
suggest.

Thanks,
drew

