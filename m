Received: by 10.28.71.155 with SMTP id m27csp123648wmi;
        Tue, 27 Mar 2018 23:51:12 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48E9QG53WbvJpM9yKwMTypd3AwfRlsvK6NNq+7Ugv2Ssz9nxgXWHq5ijA6bbnmdHSn7gUTM
X-Received: by 10.237.50.196 with SMTP id z62mr3602712qtd.72.1522219871934;
        Tue, 27 Mar 2018 23:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522219871; cv=none;
        d=google.com; s=arc-20160816;
        b=G75FoZ/Fwxw+7fG9f/X/jFdaahYxDRgwWVHJYV7rOKOGlw/EFylXoRNetjsmf+x2/I
         vTdxzUtOMMnnBzYJaRoSksGCllev/qClqTqaccYFhRfdzpoaron3rwBLR3ZV/ozWkjTe
         wA9GSRhpdDW9jySM3JSthVRhIKXwoGyLHMzmkF11vUMo/Uo+v7SUydafbNL1tFu3UJ8Y
         8uHcytyCFzYsenJTRMJrnxMFEf+zGxarH+xbypkaQ5CwWq1m5iY9sWhjQ+lwUu4SUYvn
         qHT7C1nwLVrPsWwVphvqUwCttDCatLo+LXKWGCX5F/jgF4hCd4XZkJFjK+gVFiliUpg5
         ReUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=sqCU2go3dj4LNluVS0IZsT6MnLtlS77b0SKw+jW5McA=;
        b=gOhQ+nDWBnHGVuesmhKGYoSRZxr/44Yrbf/rpo9D/fZTuubE+9bIoDOnjDvRyKCDE1
         dn8AKaVs5BBNAK+ZZ9qpqZOQh7J41LWNghfq3eT2cLOGQaLH2hUvhUDRTDggCGL2sd70
         uZYrukJuEcVH75c2FIbZB52OqV5bJ12bznZ5GXSyWda9DXqnuFIWYbjQvpKknD6xYF9r
         u/2MpGnJAmxcVunM/ais+Um+aBlsZplqGIU6j24bRBw0Ucdj4Ttb88lMxttjs9SKpn7g
         YRDLQ2MTiaK5SQh65orNomECjXjsmXGoEtMFdOJllBhuJP0Dsv4a2iuUfyYrZNG8fCAw
         rg5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9si3310960qkl.157.2018.03.27.23.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 23:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37672 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f14vP-00087p-Bs
	for alex.bennee@linaro.org; Wed, 28 Mar 2018 02:51:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f14uN-0007P3-Dv
	for qemu-arm@nongnu.org; Wed, 28 Mar 2018 02:50:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f14uI-0005qW-V5
	for qemu-arm@nongnu.org; Wed, 28 Mar 2018 02:50:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40558 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f14uI-0005pO-P5; Wed, 28 Mar 2018 02:50:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4449D81638F0;
	Wed, 28 Mar 2018 06:50:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ADDA215CDB5;
	Wed, 28 Mar 2018 06:50:01 +0000 (UTC)
To: Peter Xu <peterx@redhat.com>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
	<6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
	<CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
	<0d6f5f6d-bf28-ffc0-4d7c-b2c73912057e@redhat.com>
	<20180328020322.GT17789@xz-mi>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <99129f71-aeb2-6d8e-ce7e-8bd81d39c87f@redhat.com>
Date: Wed, 28 Mar 2018 08:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180328020322.GT17789@xz-mi>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 28 Mar 2018 06:50:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 28 Mar 2018 06:50:02 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, qemu list <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Opclm5rsQMuQ

Hi Peter,

On 28/03/18 04:03, Peter Xu wrote:
> On Fri, Mar 23, 2018 at 01:36:36PM +0100, Auger Eric wrote:
>> Hi,
>>
>> On 23/03/18 13:11, Peter Maydell wrote:
>>> On 23 March 2018 at 12:01, Auger Eric <eric.auger@redhat.com> wrote:
>>>> Hi,
>>>>
>>>> On 23/03/18 11:26, Peter Maydell wrote:
>>>>> On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I observe a regression on KVM accelerated qemu-system-aarch64:
>>>>>>
>>>>>> Unexpected error in kvm_device_access() at
>>>>>> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
>>>>>> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
>>>>>> failed: Group 6 attr 0x000000000000c664: Device or resource busy
>>>>>> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed
>>>>>
>>>>> Can you get a backtrace for this? (I guess you'd need to fiddle
>>>>> with the kvm_device_access() code to make it assert rather
>>>>> than passing back the error).
>>>>
>>>> OK. I will try to do so. As I could have expected, I cannot reproduce on
>>>> a standalone qemu command line. The problem observed above is seen with
>>>> libvirt launch which may be doing some other QMP stuff concurrently?
>>>
>>> Hmm, that could be a bit painful to debug. I dunno if libvirt
>>> has a "launch QEMU under gdb" option. If not, you could try
>>> something like:
>>>    if (condition we want to get a backtrace on) {
>>>        printf("hit condition, attach gdb to process %d\n", (int)getpid());
>>>        for (;;) { }
>>>    }
>>
>> Thanks for the hint. Here is the stack I get.
>>
>> #0  kvm_device_access (fd=31, group=6, attr=50788, val=0x5937c88, write=false, errp=0x16984a8 <error_abort>) at /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164
>> #1  0x00000000004f8ce4 in arm_gicv3_icc_reset (env=0xffffa1fc8330, ri=0x597f910) at /home/augere/UPSTREAM/qemu/hw/intc/arm_gicv3_kvm.c:632
>> #2  0x00000000006351ac in cp_reg_reset (key=0x597f730, value=0x597f910, opaque=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/target/arm/cpu.c:78
>> #3  0x0000ffffa47edce4 in g_hash_table_foreach () from /lib64/libglib-2.0.so.0
>> #4  0x0000000000635394 in arm_cpu_reset (s=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/target/arm/cpu.c:130
>> #5  0x000000000090c888 in cpu_reset (cpu=0xffffa1fc0010) at qom/cpu.c:249
>> #6  0x00000000005793d8 in do_cpu_reset (opaque=0xffffa1fc0010) at /home/augere/UPSTREAM/qemu/hw/arm/boot.c:665
>> #7  0x000000000073095c in qemu_devices_reset () at hw/core/reset.c:69
>> #8  0x00000000006976e0 in qemu_system_reset (reason=SHUTDOWN_CAUSE_NONE) at vl.c:1731
>> #9  0x000000000069fd60 in main (argc=69, argv=0xffffe877d1a8, envp=0xffffe877d3d8) at vl.c:4697
> 
> I think current master should work fine with ARM KVM now since OOB is
> now off by default.

Yes it works for me with the reverts.

 But does ARM use postcopy, and will ARM need the
> coming network failure recovery feature?

I assume it does
> 
> If so, maybe we'll still need to have a look on this single problem
> (this is the only non-testcase issue I know now with Out-Of-Band).

OK. I need to have a look at your series to better understand what it does.

Thanks

Eric
> 
> Thanks,
> 
