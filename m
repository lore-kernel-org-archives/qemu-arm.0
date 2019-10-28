Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp3413228wri;
        Mon, 28 Oct 2019 12:12:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjOPJiH3LdmqHGUieF+OUFmAohaDYN+0c3X3eWiz+QmG0HZcze/yNvFmvnqbbDt6rkYS2n
X-Received: by 2002:a37:8405:: with SMTP id g5mr5226719qkd.387.1572289973606;
        Mon, 28 Oct 2019 12:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572289973; cv=none;
        d=google.com; s=arc-20160816;
        b=edGSzvIgohEmAdLCZe/3yJ3k5iUG0hLRNxj8VmO/BM4SdoMt71mVASQuvRPUkn8HZx
         epxphzsQU+baO4D+F68jYUF1L3CrUXwUd7aEdxVYnJQzwOL2No4p0MxJkPfzi5SEvg+M
         XyZ+htga3xNpeoMx2U/dyi38Q/H7Ew6Oz/K+3dxz8CiOaO3wiuJWlbALUsTqOvWzVPyi
         3TD2IffCI2mu31b7vZExvMF+EFTjP1Uha6mPa7cOXTACjPHHpecARgKw+zkdMsYb4Ht8
         8NOS+D5lcTRiHXOI4Vuj2ICo5JwAg8ebNWxyfvf+5RSNGmwY0S+ELj+bch/Oau0F/xIF
         xraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=2hmznyP4ZTFQYt5FY266nVXWD/zh57MpnSzDaNjhhgI=;
        b=LVZuobhsXpnUcmT7HleTNRsU9FyfrUStxfJYIHvA1TShqlwjGsDmMZ05UP7E4mhqs9
         sri8VxTjStO24+uKqY4DWxqugbaEGm86ERLClDhhT7MuI72pDFVFcNUZVf+cyk79ghcj
         SmDHfod9AcZqXTVNtGGw1ABsES3tah/8qPW8od4EAhDj/c635gzhW5yUH1DsR8JX9yrr
         9itnSpgaHeDAaMdhCqIvYLx5OG8nEuOET39oCyf0rcJUBkrNXfGnXPiL7gXWrU3DeR7H
         hIQJjXO2ELwfO54FpxgU+6vJLGsVvZN46xHUtR1vWKdj+schrPZu6Hhwe+AbzaqzfBA2
         NLyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aD4Fy6XS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si10305516qtk.223.2019.10.28.12.12.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2019 12:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aD4Fy6XS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iPARf-0007Ft-Ph
	for alex.bennee@linaro.org; Mon, 28 Oct 2019 15:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <msys.mizuma@gmail.com>) id 1iP9vI-0000Go-Gq
 for qemu-arm@nongnu.org; Mon, 28 Oct 2019 14:39:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <msys.mizuma@gmail.com>) id 1iP9vH-0006Sc-CO
 for qemu-arm@nongnu.org; Mon, 28 Oct 2019 14:39:24 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:33607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <msys.mizuma@gmail.com>)
 id 1iP9vE-0006Q5-HT; Mon, 28 Oct 2019 14:39:20 -0400
Received: by mail-qt1-x841.google.com with SMTP id y39so10717596qty.0;
 Mon, 28 Oct 2019 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2hmznyP4ZTFQYt5FY266nVXWD/zh57MpnSzDaNjhhgI=;
 b=aD4Fy6XSaoNV4t6Jewmceuo4gDhsfye4Fx0/F/r+0K3hSZApF2OOckgZ/t9CWl99I4
 0dYbVlYTU8tY/Rh4uYaZSJJ2ydmgnngFGfMMobRxzf/z9UJmSNcgpiWJkLmmU+l1wjZH
 si7UplMflcB+EPG/qJ5RT4yiQLe9cYd6i86411ieBYGHGDPbtMPzOYC53SguatBrdcLm
 Lry5E3UyOQL55uQBMZcpcmuZJAxex0NaG86l3nRyVmINcuwp4QBb1n+vpCQ23KhtL1sr
 b7yz+5pNfu9TiSjbIknMhB/EB+LseYhPWpzTZ3Ne21mcd3mjAYYy6rcNxBDokKnd6QbS
 Qcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2hmznyP4ZTFQYt5FY266nVXWD/zh57MpnSzDaNjhhgI=;
 b=bt4bFBeKziuHz3DebSBPpIl/g1emuDEsVedu9dFl/h8zX5698GkDhp68V4EUwdc4aK
 aLKIdiUdDtfI3kUjkFkvDS6c0NWak1NuzniRmCZLNjykBnKJXzeAGICljkn5SXCMTgR7
 ZtBJMPOIVMTrEPBNlNQa5AkBEDKHMyShhtErLpbZvNKl5QEliG6lJtx74O6tsAqgPqgj
 yzSHJjsHXOJE2mCVJQ+oX5BDczUxPzm7cKenr1M83hwCxp+JcM5RiaYaptFQ1lTS7dyo
 xWqDOng+91w/T3BM/PQbZgw6gcAksVlXK/19q9TqW1jYlAd43VEu1IENiPbJpTIuP/HS
 MSiw==
X-Gm-Message-State: APjAAAVfrgQXUL6WfKqqsJNFdnEmc3/nds4yyMIZU95K0xM5Pl31TvI7
 VeazkkLiIZlVEpExLM7xcA==
X-Received: by 2002:aed:24af:: with SMTP id t44mr18314531qtc.57.1572287957239; 
 Mon, 28 Oct 2019 11:39:17 -0700 (PDT)
Received: from gabell (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id s21sm8376130qtc.12.2019.10.28.11.39.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 11:39:16 -0700 (PDT)
Date: Mon, 28 Oct 2019 14:39:11 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
Message-ID: <20191028183908.7ss3o4guvfff6lxv@gabell>
References: <20191016143410.5023-1-drjones@redhat.com>
 <20191017211758.ownflk2c7mzv3poh@gabell>
 <20191018120252.sdpi4t7jlectnspu@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018120252.sdpi4t7jlectnspu@kamzik.brq.redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
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
Cc: peter.maydell@linaro.org, bijan.mottahedeh@oracle.com, maz@kernel.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZcKnyE7RPVdo

On Fri, Oct 18, 2019 at 02:02:52PM +0200, Andrew Jones wrote:
> On Thu, Oct 17, 2019 at 05:17:59PM -0400, Masayoshi Mizuma wrote:
> > Hi Drew,
> > 
> > Thank you for posting the patches, they seems to work well
> > because the softlockup is gone and the timestamp jump of
> > dmesg and ftrace record also disappeared after the guest
> > is virsh resume'ed.
> > 
> > Let me add comments.
> > I think the kvm-adjvtime behavior should be the default.
> > How about introducing 'kvm-noadjvtime' parameter instead?
> > kvm-noadjvtime is to provide the old behavior.
> > 
> > That is because the time jump occurs timeout for timers even though
> > the timer doesn't reach the timeout in the guest time.
> > 
> > For example, below flow shows that user and/or kernel sets timer A
> > for +10 sec and B for +20 sec in Guest, then Guest is suspended and
> > it passes 60 sec, then Guest is resumed. Timer A and B go off because
> > the Guest timestamp (TS) is jumped to 63. That is unexpected timer
> > behavior for Guest.
> > 
> >  Host TS(sec) Guest TS(sec) Event
> >  ============ ============= =============================
> >  00           00            Guest: Set timer A for +10 sec
> >  01           01            Guest: Set timer B for +20 sec
> >  03           03            Host: virsh suspend Guest
> >  63           63            Host: virsh resume Guest
> >                             Guest: Timer A and B go off
> > 
> > I believe kvm-adjvtime behavior is as following. So Time A
> > and B go off as expected time. So, kvm-adjvtime behavior should
> > be the default.
> > 
> >  Host TS(sec) Guest TS(sec) Event
> >  ============ ============= =============================
> >  00           00            Guest: Set timer A for +10 sec
> >  01           01            Guest: Set timer B for +20 sec
> >  03           03            Host: virsh suspend guest
> >  63           03            Host: virsh resume guest
> >  70           10            Guest: Timer A goes off
> >  81           21            Guest: Timer B goes off
> > 
> 
> Thanks for the testing Masa. Your timer test is another good example of
> what can happen when a guest is paused. I'm sure there are many other ways
> a pause could be problematic as well, especially if the guest has devices
> passed through to it that it's actively using. I also don't expect
> kvm-adjvtime to solve all those problems (like, for example, potential
> problems with passthrough devices, networks, etc.)  This means that guest
> pausing should only be done by host admins that are intimately familiar
> with the guest OS, workload, and network connections. They should be sure
> that it can tolerate and recover from the pauses. Since the admins need to
> make the decision to pause at all, then I think it's fair for them to also
> decide if they want to try and mitigate some of the issues with
> kvm-adjvtime, i.e. require them to enable it, rather than have it on by
> default. 

make sense to me, thanks.

>          Also, if we choose to enable it by default, then we'll need to
> deal with the compatibility issues that come with changing a behavior.
> That's not impossible, as this feature could be disabled for older
> machine types, but it's messy.

I agree with you, we shouldn't add such messy codes to resolve
the compatibility issues...

> 
> All that said, I won't argue too hard against kvm-adjvtime being on by
> default, but let's see if others like Peter or Marc want to chime in on
> it too.

Yeah, I look forward to their comments.

Thanks,
Masa
