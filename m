Received: by 10.28.71.155 with SMTP id m27csp230189wmi;
        Tue, 27 Mar 2018 19:03:50 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/jMYxZ4+yVX+fRlPaLvDiNamBNdhKdN1SLDr5Yg7NkaCCKPA9oqneK5rfjFWn4d4VPK4Nk
X-Received: by 10.55.76.146 with SMTP id z140mr2759287qka.224.1522202630838;
        Tue, 27 Mar 2018 19:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522202630; cv=none;
        d=google.com; s=arc-20160816;
        b=n8OGwOO75g82IJftXmKhocqWUKN/ibLrsGgu6Is7wHLK0dl141Zsro7RavmWw9FIXc
         VDmc6kLam4y4lU2SV0LceIOQHHFN8C0fjMhGU18ipAszoW51VQd7d7asL7wbtzFZ30YK
         ScG1Wgmc90Oxb8L3LEf9ce5E0lByq5DzVhajl3Svjn6Vh6sD4kBjjPClaiz6KbpZ3vSR
         FBUpG6XnWUU8tPhKZDSUywVu3ks/Oar4vizUtoU4WXkZUPKctCbJHpTJCdnzu7Xo2HPI
         aS8me+UBgKU90C2qxlpJpwQ5f8HngTb+Fxi4X8eAJVygGhXyMGfzr4roWPDgtBY1wc+E
         KiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=kpR9e7ZC/TO4mh6VAL8DNNDuue97xIY5FKxVb5c0Blc=;
        b=bWdR2Nkt+F6sGf0UPRpw1a07ivHjtORaQMtiti0klLblgyUic9JmFDwkBjBXzIXriw
         ufK35f3Ie/wAlqZ/eLAYAMLYogB3J3RzJrFhogcfPQtNbaWGXcdQrpcIFffNIq5ylJHX
         48CldFrD16LogvWDSliFg14akPN4xqvrGPwmCSmaSJmgi9+VsoE4bYnWtzUuBpOVMaX5
         KRzbyVrkIOq020AJCqh7IdWw4mEq8rHWprR/bU8BFl7ETAp3Zd7C8FIEtGo/TBZVWQUL
         Pi+AHIwxDkwiXh2Sn5XOESQHRB6sydSQ789Q5lxpD/HBCJvj6A9a5jmZju4+BstKZDMS
         Prxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n186si2804891qkd.331.2018.03.27.19.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 19:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37032 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f10RK-0007dF-Bt
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 22:03:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1f10R9-0007cu-PN
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 22:03:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1f10R5-00086I-SK
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 22:03:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44074 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1f10R5-00086C-N5; Tue, 27 Mar 2018 22:03:35 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A73F4406E8A4;
	Wed, 28 Mar 2018 02:03:30 +0000 (UTC)
Received: from xz-mi (ovpn-12-65.pek2.redhat.com [10.72.12.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB6332026E03;
	Wed, 28 Mar 2018 02:03:24 +0000 (UTC)
Date: Wed, 28 Mar 2018 10:03:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180328020322.GT17789@xz-mi>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
	<6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
	<CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
	<0d6f5f6d-bf28-ffc0-4d7c-b2c73912057e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0d6f5f6d-bf28-ffc0-4d7c-b2c73912057e@redhat.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 28 Mar 2018 02:03:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 28 Mar 2018 02:03:30 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'peterx@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] Regression on KVM qemu-system-aarch64 since
 "monitor: enable IO thread for (qmp & !mux) typed"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, qemu list <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m+n9c9eH32M2

On Fri, Mar 23, 2018 at 01:36:36PM +0100, Auger Eric wrote:
> Hi,
> 
> On 23/03/18 13:11, Peter Maydell wrote:
> > On 23 March 2018 at 12:01, Auger Eric <eric.auger@redhat.com> wrote:
> >> Hi,
> >>
> >> On 23/03/18 11:26, Peter Maydell wrote:
> >>> On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
> >>>> Hi,
> >>>>
> >>>> I observe a regression on KVM accelerated qemu-system-aarch64:
> >>>>
> >>>> Unexpected error in kvm_device_access() at
> >>>> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
> >>>> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
> >>>> failed: Group 6 attr 0x000000000000c664: Device or resource busy
> >>>> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed
> >>>
> >>> Can you get a backtrace for this? (I guess you'd need to fiddle
> >>> with the kvm_device_access() code to make it assert rather
> >>> than passing back the error).
> >>
> >> OK. I will try to do so. As I could have expected, I cannot reproduce on
> >> a standalone qemu command line. The problem observed above is seen with
> >> libvirt launch which may be doing some other QMP stuff concurrently?
> > 
> > Hmm, that could be a bit painful to debug. I dunno if libvirt
> > has a "launch QEMU under gdb" option. If not, you could try
> > something like:
> >    if (condition we want to get a backtrace on) {
> >        printf("hit condition, attach gdb to process %d\n", (int)getpid());
> >        for (;;) { }
> >    }
> 
> Thanks for the hint. Here is the stack I get.
> 
> #0  kvm_device_access (fd=31, group=6, attr=50788, val=0x5937c88, write=false, errp=0x16984a8 <error_abort>) at /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164
> #1  0x00000000004f8ce4 in arm_gicv3_icc_reset (env=0xffffa1fc8330, ri=0x597f910) at /home/augere/UPSTREAM/qemu/hw/intc/arm_gicv3_kvm.c:632
> #2  0x00000000006351ac in cp_reg_reset (key=0x597f730, value=0x597f910, opaque=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/target/arm/cpu.c:78
> #3  0x0000ffffa47edce4 in g_hash_table_foreach () from /lib64/libglib-2.0.so.0
> #4  0x0000000000635394 in arm_cpu_reset (s=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/target/arm/cpu.c:130
> #5  0x000000000090c888 in cpu_reset (cpu=0xffffa1fc0010) at qom/cpu.c:249
> #6  0x00000000005793d8 in do_cpu_reset (opaque=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/hw/arm/boot.c:665
> #7  0x000000000073095c in qemu_devices_reset () at hw/core/reset.c:69
> #8  0x00000000006976e0 in qemu_system_reset (reason=SHUTDOWN_CAUSE_NONE) at vl.c:1731
> #9  0x000000000069fd60 in main (argc=69, argv=0xffffe877d1a8, envp=0xffffe877d3d8) at vl.c:4697

I think current master should work fine with ARM KVM now since OOB is
now off by default. But does ARM use postcopy, and will ARM need the
coming network failure recovery feature?

If so, maybe we'll still need to have a look on this single problem
(this is the only non-testcase issue I know now with Out-Of-Band).

Thanks,

-- 
Peter Xu
