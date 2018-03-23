Received: by 10.28.71.155 with SMTP id m27csp418290wmi;
        Fri, 23 Mar 2018 05:37:05 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvKccxuKwz6vRrFzg1FZht5tj5SPbOYcJq2NpfmCVBT6u37aici97vfCYmBeeNNxoSTb9V3
X-Received: by 10.55.167.23 with SMTP id q23mr25371463qke.329.1521808624984;
        Fri, 23 Mar 2018 05:37:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521808624; cv=none;
        d=google.com; s=arc-20160816;
        b=qedCLprnR0ew3iHQwq4iAPeLtKrhIWgy9NQPE+JSlJVUGYPeg0ic/b1+sACECWEygZ
         k7XVqt1tZ7JV8/7d1NIP9L+ps9XMrJ4hEgQKek15i/SRlbt87Ix2HPZrUXEl2JDTcRPz
         bGWTR954aFdQK/yO3dv2/1XTHZI/LOBpN0914xp/nqMy3YDGQmAz7Eq6ZviVL5wg+0VP
         Jbgrnx30fzP/lG4JylIGyc6KgI0n4kYgxLC/fNWGK4h9W+3wuMGYZkBsxijp0rapeQzA
         2kBnu6HAi5fbeSi3D+TvoAWcGAcl2LaDpZ+tJs4RF6mScoiTyQvFI2I1k8spzsfkwsZS
         lCOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=BfYklO1XNx89CJLz+zDeV1cIBHzTe3YsuFdjxcGTRR8=;
        b=tm4PAhTHxnpWkM8dbk04BCWo63Ub5m05g5dHDCR5kuWNuXymyRZubw3L7dcCnCimnZ
         fmMfwJWP7qp0ISRUg9aAlfCCakjsvHrU0DI+NsIdK4McBbQ80BR3/55tiunJsMpfqPrN
         mBOU/RE62TZirVinswXuEIcXr6K/fivFV6pXlxGUeb6aGLtKCvGBTFvPvqhzGSq7GJXW
         uQqERLL2yKRHX229xhoxYQiLmLP/8tqu/6n6JK+j8dXPUhV3KjxCsWdFMheFZ8zlymy4
         tYNJk/GsKvI6WQYySdKbGfiP52jqbbNv4aNhk9mft2vDTkt+l3xLz60gXffS94Fj0mfg
         OqlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 134si5783235qki.271.2018.03.23.05.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:37:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLwO-0007UA-FC
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:37:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ezLwD-0007Tk-Rv
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:36:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ezLwA-00033C-MP
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:36:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54690 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ezLwA-000332-Gk; Fri, 23 Mar 2018 08:36:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81FAF8182D24;
	Fri, 23 Mar 2018 12:36:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA29A76FC;
	Fri, 23 Mar 2018 12:36:37 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
	<6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
	<CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0d6f5f6d-bf28-ffc0-4d7c-b2c73912057e@redhat.com>
Date: Fri, 23 Mar 2018 13:36:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 12:36:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 12:36:45 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SjouW7lSgbbC

Hi,

On 23/03/18 13:11, Peter Maydell wrote:
> On 23 March 2018 at 12:01, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi,
>>
>> On 23/03/18 11:26, Peter Maydell wrote:
>>> On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
>>>> Hi,
>>>>
>>>> I observe a regression on KVM accelerated qemu-system-aarch64:
>>>>
>>>> Unexpected error in kvm_device_access() at
>>>> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
>>>> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
>>>> failed: Group 6 attr 0x000000000000c664: Device or resource busy
>>>> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed
>>>
>>> Can you get a backtrace for this? (I guess you'd need to fiddle
>>> with the kvm_device_access() code to make it assert rather
>>> than passing back the error).
>>
>> OK. I will try to do so. As I could have expected, I cannot reproduce on
>> a standalone qemu command line. The problem observed above is seen with
>> libvirt launch which may be doing some other QMP stuff concurrently?
> 
> Hmm, that could be a bit painful to debug. I dunno if libvirt
> has a "launch QEMU under gdb" option. If not, you could try
> something like:
>    if (condition we want to get a backtrace on) {
>        printf("hit condition, attach gdb to process %d\n", (int)getpid());
>        for (;;) { }
>    }

Thanks for the hint. Here is the stack I get.

#0  kvm_device_access (fd=31, group=6, attr=50788, val=0x5937c88, write=false, errp=0x16984a8 <error_abort>) at /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164
#1  0x00000000004f8ce4 in arm_gicv3_icc_reset (env=0xffffa1fc8330, ri=0x597f910) at /home/augere/UPSTREAM/qemu/hw/intc/arm_gicv3_kvm.c:632
#2  0x00000000006351ac in cp_reg_reset (key=0x597f730, value=0x597f910, opaque=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/target/arm/cpu.c:78
#3  0x0000ffffa47edce4 in g_hash_table_foreach () from /lib64/libglib-2.0.so.0
#4  0x0000000000635394 in arm_cpu_reset (s=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/target/arm/cpu.c:130
#5  0x000000000090c888 in cpu_reset (cpu=0xffffa1fc0010) at qom/cpu.c:249
#6  0x00000000005793d8 in do_cpu_reset (opaque=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/hw/arm/boot.c:665
#7  0x000000000073095c in qemu_devices_reset () at hw/core/reset.c:69
#8  0x00000000006976e0 in qemu_system_reset (reason=SHUTDOWN_CAUSE_NONE) at vl.c:1731
#9  0x000000000069fd60 in main (argc=69, argv=0xffffe877d1a8, envp=0xffffe877d3d8) at vl.c:4697

Thanks

Eric
> 
> and then QEMU will sit in a loop waiting for you to do a
>   gdb path/to/qemu <pid>
> 
> thanks
> -- PMM
> 
