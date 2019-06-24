Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3505390wrg;
        Mon, 24 Jun 2019 01:38:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwo79H4aXFX+AnXrClxriYgDLtdZcHdamLwALBd/HSrOC6vOJufFThhsHH6SlpWSjdjNa4z
X-Received: by 2002:a05:6402:609:: with SMTP id n9mr107826856edv.159.1561365485124;
        Mon, 24 Jun 2019 01:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561365485; cv=none;
        d=google.com; s=arc-20160816;
        b=QyryZbcpnASv7GKBDjX94SsRaGxuxyFRJHmAGsohhU3aKX/tkjYW+O9tOhYqMR2RM4
         RFgqYkIi/9v2IJasAhJlR80BxoDGvRohv9F/Nkhi3n/Gck6kiwzyJ1C094BhlgSJjGmD
         Qd7pl9oDzrY0NypFagfrRuUaJRdeaHHDLY4F2UNJ+Fp3dH1pQkddmoTErKVrvZHk4OHE
         /Vnn0YyLtekePwnfaaEbeRNqLPwETShhOSZKDtSZ1BHe7LyGqpIC66tsBY/ZYhGYVhtY
         9VrwGFc6aolJ8DRFFpjbnlyAOvL+IUBF0o82ufXUG0NHCwxtV9YLdUG3b3MXwKjSqopy
         9mig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:message-id;
        bh=f1zcYY5ZUZe8doTfubnvO+Rw5eMe/8+Z5ytGY8I7zB8=;
        b=t6z72338UFvbodf9SYJkQeCtwl05tTLbomgXrbIC5KFVKs2eFIHJ5dnLQjAK/Tt45B
         i6MNfTiwC5BKZfmv28cxIaOLSL6pdyolTJ3foTNqDbpWH4kqUvBoo1dFb/7B4r91lkUP
         jXNzbw6wuk7sDPJPNSvpRa4RWJ9aqwDtKtXRFdDC1VK011XfS1hhVfo67T0QOf4F2OPe
         3xOFxFUMvsVp1fllwHAxW+XGWGG9mpj+/MUPWDzH5TrOVqPK8ILkjzbA4GWbTUE1VzVg
         IhWjJyvaESHoRMDGCRGeSQg5WxXXIZWvpvsfTLKqaar0iFIQe+M6vTtHJsf6kgzGxKte
         ikBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si8940920eda.107.2019.06.24.01.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 01:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfKUF-0004Eg-Ua
	for alex.bennee@linaro.org; Mon, 24 Jun 2019 04:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41215)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <abologna@redhat.com>) id 1hfKTm-0004Bm-3L
 for qemu-arm@nongnu.org; Mon, 24 Jun 2019 04:37:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <abologna@redhat.com>) id 1hfKTk-00049C-Kh
 for qemu-arm@nongnu.org; Mon, 24 Jun 2019 04:37:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <abologna@redhat.com>)
 id 1hfKTk-00045H-4b; Mon, 24 Jun 2019 04:37:32 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74009A7DD;
 Mon, 24 Jun 2019 08:37:30 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66EB45D721;
 Mon, 24 Jun 2019 08:37:26 +0000 (UTC)
Message-ID: <7745c47186278c1b7f1781c9173ef0e2e8a55910.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>
Date: Mon, 24 Jun 2019 10:37:24 +0200
In-Reply-To: <CAFEAcA-x_GSxiULrxvRj7dtCLM-r4YvRpwkVosW+1SutAUJMoA@mail.gmail.com>
References: <20190620222314.2670-1-wainersm@redhat.com>
 <CAFEAcA92m9n7FR2a6=ecnr5bn-Sq97LZRxHRuzWO-OcbdgA4fw@mail.gmail.com>
 <20190621190421.GA679@localhost.localdomain>
 <CAFEAcA-x_GSxiULrxvRj7dtCLM-r4YvRpwkVosW+1SutAUJMoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 24 Jun 2019 08:37:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v2 PATCH] hw/arm/virt: makes virt a default
 machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ai8tNpL9lVV1

On Sat, 2019-06-22 at 16:58 +0100, Peter Maydell wrote:
> On Fri, 21 Jun 2019 at 20:04, Cleber Rosa <crosa@redhat.com> wrote:
> > You can consider me biased (I do consider myself), but trying to wear
> > the hat of a user first interacting with QEMU, I would expect a (any)
> > reasonably capable environment that can represent the given target.
> > That will probably be a different environment than the one I may need,
> > and I think that's fine.
> 
> I'm really not sure what you're trying to suggest here; maybe
> you could clarify? If you specify a target (ie a machine type),
> you get that machine type. If you don't specify a target, then
> we can't really guess what you were hoping to run and
> magically pick something that works.
> 
> The main problem here is that users expect "all the world is a PC"
> type behaviour, ie they can just provide qemu-system-arm or
> qemu-system-aarch64 with no command line arguments except
> a guest kernel (which is half the time something they found under
> a rock or extracted from some firmware image) or a guest CDROM
> image and have it boot, because that generally works for x86. It
> doesn't and can't work for Arm, because of the much greater
> diversity of machine types and the way that kernels are often
> only compiled to work on a specific subset of machines.
> Making the user specify a machine type means they do at least
> get prompted that the world is more complicated than they
> think it is and there are decisions that have to be made.
> 
> In any case even if we did default to "virt" the user still
> has to specify a CPU type, may well also want to provide
> a GIC version (gicv3 being better than the default v2),
> likely more RAM than the very small default, they need to provide
> all the virtio devices, and so on and so on. So giving
> them one option they no longer need to specify doesn't
> really make it any easier IMHO.

Additional note on GIC: most server-grade machines you can buy today
do *not* support GICv2, so you will need to opt-in to GICv3 if you
want your guest to even start.

More generally, as someone who has worked on supporting non-x86
guests in libvirt for the past few years, I can tell you from
experience that you're always going to need some arch-specific logic
to deal with the small (and not so small :) differences in behavior
between QEMU targets: as Peter correctly says, machine type is just
a single example among many.

-- 
Andrea Bolognani / Red Hat / Virtualization

