Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1012930lff;
        Fri, 6 Dec 2019 09:05:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqw6gukCOx43nAJt/03AUoWH7kfUobkOSn9V/QNQF1c4eo2ZtqjEVqzGKERfDBSKSvd8YIrA
X-Received: by 2002:a0c:8061:: with SMTP id 88mr13690591qva.62.1575651947749;
        Fri, 06 Dec 2019 09:05:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575651947; cv=none;
        d=google.com; s=arc-20160816;
        b=vEsH0T/aHvhC0Kkk/mCy2x63UozIs6GDO4Q3U/gxMsIPdlMDSVlIgpUIhmehOEOl6+
         vrDfUXVRPnwC8ZGg2nvupOlr1/1FPUCeQ7P+yJ38y6ueuCfnNp1Gd3yiw+hrQ7S0Hlpr
         MjqUZJMBA0ka2+8ndDTiIdMK/z/wJqQaJDOgN9iYMa4Dd4BH7gDSo+FOMIE1rmF5KRi+
         O/FFCfAFz5WgkVOFLy18nAbNZhXjNC/j6AhEqTECJ6/wRaAxgHYa7wLBxcv5rEwV/Fly
         B0b/JZAa1lgDGgU8obdxCu5J941RBFzs5GB3jelWXr5eNP7sj3PPlVfnIdwz1Hr1IRfv
         8buQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=xx+gBQINEfsdCHgzHWk9u1vbTF0umg2qaZIaBUYeVFs=;
        b=0/31VgRp0P3Bcx/eAssANkhW3kzPel225fWVWgJsUBrnupdKLzs16qC/WTNj30FOqZ
         YXms7QFXEAomRXpNgiLy58+5z6CBCKG37pikpOoYrRjNCbxWhVFer02IJbQQsjvtTY+I
         nKGF483/2zaTS5lbA5AI6Ar1HctGgZVME0AjesuE+TWIuL+WkLlgk0eIaNQDRsf2Dmcy
         6mXGEQeumqnai8xdfz3L8bqwigPNdgXQmK+ZfewfUmXj5rSzECzYfm4LUQ6JUcOXmrPz
         tiRX4E3Rgwpts92I8qdXA1Xwtyx30tAwn1s7blsY0DjCBmy6Ig+VgkOGD0n/ZI61K8QT
         oNFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I3fr0R0v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g37si9284340qtg.139.2019.12.06.09.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 09:05:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I3fr0R0v;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idH34-00038A-Pn
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 12:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1idFvF-0001Oq-0g
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:53:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1idFvD-0001TF-NK
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:53:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35100
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1idFvD-0001Rf-Ju
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575647614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xx+gBQINEfsdCHgzHWk9u1vbTF0umg2qaZIaBUYeVFs=;
 b=I3fr0R0v4FYy9x4JfAx8fDj3syXyx9AVruAC8wMYYhG5svmRSuArVbHajeJ09WOrTslS9S
 Oc0s3uyVf2AIVlvd0IIl+OmekIxP3DQuC06tOwqaWIHt6w/sz9g7h/m0GNQoMyp5J8rK1K
 p+y2Wa+/tFIHHp4DrXhGATT6Edsop+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-ZKWUJp0YOXu4ZFKdzCgesQ-1; Fri, 06 Dec 2019 10:53:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28DD0DB22;
 Fri,  6 Dec 2019 15:53:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB325D9E1;
 Fri,  6 Dec 2019 15:53:28 +0000 (UTC)
Date: Fri, 6 Dec 2019 16:53:27 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
Message-ID: <20191206155327.7adiyjjkjh56mg2t@kamzik.brq.redhat.com>
References: <20191016143410.5023-1-drjones@redhat.com>
 <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ZKWUJp0YOXu4ZFKdzCgesQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, bijan.mottahedeh@oracle.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ikxz5K7hbM1/

On Fri, Dec 06, 2019 at 03:22:58PM +0000, Peter Maydell wrote:
> On Wed, 16 Oct 2019 at 15:34, Andrew Jones <drjones@redhat.com> wrote:
> >
> > v2:
> >  - move from RFC status to v1
> >  - put kvm_arm_vm_state_change() in kvm.c to share among kvm32.c and kv=
m64.c
> >  - add r-b's from Richard
> >
> >
> > This series is inspired by a series[1] posted by Bijan Mottahedeh about
> > a year ago.  The problem described in the cover letter of [1] is easily
> > reproducible and some users would like to have the option to avoid it.
> > However the solution, which is to adjust the virtual counter offset eac=
h
> > time the VM transitions to the running state, introduces a different
> > problem, which is that the virtual and physical counters diverge.  As
> > described in the cover letter of [1] this divergence is easily observed
> > when comparing the output of `date` and `hwclock` after suspending the
> > guest, waiting a while, and then resuming it.  Because this different
> > problem may actually be worse for some users, unlike [1], the series
> > posted here makes the virtual counter offset adjustment optional and no=
t
> > even enabled by default.  Besides the adjustment being optional, this
> > series approaches the needed changes differently to apply them in more
> > appropriate locations.  Finally, unlike [1], this series doesn't attemp=
t
> > to measure "pause time" itself.  Simply using QEMU_CLOCK_VIRTUAL, which
> > only ticks when the VM is not stopped, is sufficient.
>=20
> So I guess my overall question is "what is the x86 solution to
> this problem, and why is this all arm-specific?" It would also

x86 adjusts the counter offset by default, and I don't think there's any
way to turn that behavior off. I think it's too late to follow that
default for arm, but this series provides a way to opt into the same
behavior.

> be helpful to know how it fits into all the other proposals regarding
> time in VMs.

I've been lightly following the other stuff, but haven't yet seen any
overlap.

BTW, this series needs to be rebased and reposted. I've been waiting for
4.2 though.

Thanks,
drew

