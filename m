Received: by 10.28.71.155 with SMTP id m27csp439638wmi;
        Fri, 23 Mar 2018 05:57:55 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsFNUv3zY+pdS2DPN+H/fM/J2F6v977hDWl0HyzKk3xon4vpN07i7Q7DZPI+vZDYMyWEWl7
X-Received: by 10.55.97.196 with SMTP id v187mr40102972qkb.209.1521809875227;
        Fri, 23 Mar 2018 05:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521809875; cv=none;
        d=google.com; s=arc-20160816;
        b=A0imjrjwE+11NKISpa2ylgpM/ltysK4DqOaq+Rz8MLVwHQ9z6BqERqlCWY4HfWiXip
         kkaJKE2GVmwe4VY32lBTQMV9MZqWOrEbAJkDy9soOzrwSR+aUlvzz37tWglvuc7NIEY4
         Q9Wu0vM4WatD/jbfOx1gZrrwbB9XYizTIcvzxm8BoF4KwQ1tD5n7umSFTufesc6iPxZn
         v5RaFZzEkWWamrOgxwuF5XiTj/J0O0DTDvIUON2ZzxszXuTKndJmXX3iYcNQMy0bg9g/
         HKAAYclbmJjUSIErkewJ2VhUmlGUDBWceHMtdeRamNgTGMgV51pEWuRVKx0h7bFy7ZgS
         GKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=/sIfG90QJYubFlCI5xgbWmj5E9YmWqhV4wa8oHp67pE=;
        b=IOus0vhrXwwONzl4gWLTs7vfhIf28dEK99F8QwIvh7Y1hvgmsM48vtzyAqk5k1fw6F
         iUI16MhoaygsQYxIFWXOci2GHCwzfY5LyOXF2LJDFx1/y0a6tUsDwXZfS3YgH/nu5ZCp
         Qrip0lT8IK9vhVcDIglacOX+dAyW/e+xWk/AUlRvMGp/GxBY4KFqH6YyMt4hSflSBS+U
         qqQ/LJ5EsAYOgz/xk49D3XzloOhpEUaGiQa+rZX6FsheHIrMlLuhvr94gmHfhI6TA1ZX
         DyiDIul8mcQhE50bHFKgviTi8TZugi1ipK/3afzQGW282x8EtxFfiR8L+8EZnAZFDCsY
         xN2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u40si8296834qth.72.2018.03.23.05.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezMGY-0002Ec-Pq
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:57:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1ezMGQ-0002EQ-Js
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1ezMGN-0000iU-Ii
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:57:46 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50922 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1ezMGN-0000i2-Dc; Fri, 23 Mar 2018 08:57:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83AF44068056;
	Fri, 23 Mar 2018 12:57:32 +0000 (UTC)
Received: from xz-mi (ovpn-12-78.pek2.redhat.com [10.72.12.78])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D23215CDAA;
	Fri, 23 Mar 2018 12:57:24 +0000 (UTC)
Date: Fri, 23 Mar 2018 20:57:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180323125722.GO32362@xz-mi>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 23 Mar 2018 12:57:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 23 Mar 2018 12:57:32 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
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
X-TUID: UJtR007Loyaa

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

I'm not sure, but I suspect libvirt has already sent something to QEMU
before this point, which breaks the timing of the old QMP code (the
old QMP won't do anything until main loop).

I'm thinking maybe I should postpone the monitors at least until main
loop so that we can still keep that assumption.  But I'll see what do
others think of it first.

Thanks,

-- 
Peter Xu
