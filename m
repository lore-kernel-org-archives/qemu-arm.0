Received: by 10.28.71.155 with SMTP id m27csp396227wmi;
        Fri, 23 Mar 2018 05:16:12 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtObSQYrojo3CXN8+rFpS2hLLmSZtwiDoH86WJDvwXT66F10XwFq4VkPuxWIYiy56qr+1HV
X-Received: by 10.200.58.38 with SMTP id w35mr42780206qte.76.1521807372694;
        Fri, 23 Mar 2018 05:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521807372; cv=none;
        d=google.com; s=arc-20160816;
        b=fId7wO4PbCPMaTTwLZcqnMlyAX4V+d5J0R+qG5549TIfMoGWmmw0D0IsFOGNwXRsSs
         TAnkFzrAPLY9X4Kq2iFQYLGWI1UcYC+Fax2YYyqljmTJbS+KlhwnSxp4DD0xWikzxkQe
         uUNuI0xMKT7ETjYXoUofB+jgolWM0D6TMaWruAcHick1QMagrsLu889MY7RnJdBB3q0H
         7B0Lr0+klsinW2j/LVc3L5NYTS7WwAypjNmviPp/PBm8cjqSuL8fsK2NbIJn64KzLWp7
         7YZqztEenci9Wa6KFgEqMrpFGw9iQyt6+vaxQDPEBC8fflpetXvjofQIikQi8GDU3Xl2
         c49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:from:references:to:arc-authentication-results;
        bh=5dMe9g8wN+YaMVYlC2DttBVE/CQtJ7OqmSGc1FtHQJA=;
        b=CvKQysl9633Yq7wmQpalPXPGODeX83KoAw6YF3SNuTo6mD37oYdQ7YU863AjG3+YLX
         5Z1mV6KQquwfJyqmLWcrTO4u49HyPRP+BaPmLrG2WucaMFSX1pgWfN/5nqLKxu3NZ4av
         hDLM3051vKejvD/I/kc6uYPwLWzqL394qRP5NTndV7tukWjvLj2bg/Lx8nY6lQlvXBDY
         qYrrPv3DjIGHFQXwV0He+UwKJDHvciqmx0Q3fmbnpUji9SThxo7rD8f3nSQWH7qD9hKr
         3hMiB6Q/SjuChNzYpyPkQd8VmXJ9pJ46aAbaDJqZumBemdhDFQPLuM4ohLHA+xBfphtJ
         7hZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 26si4054800qtd.337.2018.03.23.05.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:16:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:37675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLcC-0007Cd-5Y
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:16:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1ezLc3-0007BZ-7N
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:16:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1ezLbv-0003O1-0u
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:16:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52696)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1ezLbu-0003NG-NU
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:15:54 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w2NCEThm096440
	for <qemu-arm@nongnu.org>; Fri, 23 Mar 2018 08:15:53 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2gvy66dmfv-1
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Fri, 23 Mar 2018 08:15:53 -0400
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <borntraeger@de.ibm.com>;
	Fri, 23 Mar 2018 12:15:50 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 23 Mar 2018 12:15:47 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id w2NCFl5e55771224; Fri, 23 Mar 2018 12:15:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7417A4069;
	Fri, 23 Mar 2018 12:08:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9084A4057;
	Fri, 23 Mar 2018 12:08:27 +0000 (GMT)
Received: from oc7330422307.ibm.com (unknown [9.152.96.80])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 23 Mar 2018 12:08:27 +0000 (GMT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Auger Eric <eric.auger@redhat.com>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
	<6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
	<CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Fri, 23 Mar 2018 13:15:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18032312-0008-0000-0000-000004E18E9D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032312-0009-0000-0000-00001E74BAC4
Message-Id: <2964f298-2a9c-cb47-2280-52e54d634631@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-23_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1803230142
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [Qemu-devel] Regression on KVM qemu-system-aarch64
 since "monitor: enable IO thread for (qmp & !mux) typed"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu list <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kRIjQ9xZBWhX



On 03/23/2018 01:11 PM, Peter Maydell wrote:
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
> 
> and then QEMU will sit in a loop waiting for you to do a
>   gdb path/to/qemu <pid>
> 
> thanks
> -- PMM
> 

This patch also breaks the qemu iotest. (qemu hangs).

backtrace for that is


Thread 4 (Thread 0x3ffa9c3c910 (LWP 171339)):
#0  0x000003ffb9d11a70 in __lll_lock_wait () at /lib64/libpthread.so.0
#1  0x000003ffb9d0a630 in pthread_mutex_lock () at /lib64/libpthread.so.0
#2  0x0000000001557e90 in qemu_mutex_lock_impl (mutex=0x1a63f90 <qemu_global_mutex>, file=0x160bc36 "/home/cborntra/REPOS/qemu/cpus.c", line=1757)
    at /home/cborntra/REPOS/qemu/util/qemu-thread-posix.c:67
#3  0x000000000108ad5e in qemu_mutex_lock_iothread () at /home/cborntra/REPOS/qemu/cpus.c:1757
#4  0x0000000001089c70 in qemu_dummy_cpu_thread_fn (arg=0x3d4f9eb0) at /home/cborntra/REPOS/qemu/cpus.c:1258
#5  0x000003ffb9d07a88 in start_thread () at /lib64/libpthread.so.0
#6  0x000003ffb731940e in thread_start () at /lib64/libc.so.6

Thread 3 (Thread 0x3ffaa43d910 (LWP 171338)):
#0  0x000003ffb730c050 in poll () at /lib64/libc.so.6
#1  0x000003ffb8bd13b4 in g_main_context_iterate.isra () at /lib64/libglib-2.0.so.0
#2  0x000003ffb8bd1840 in g_main_loop_run () at /lib64/libglib-2.0.so.0
#3  0x00000000011f499e in iothread_run (opaque=0x3d2a4110) at /home/cborntra/REPOS/qemu/iothread.c:70
#4  0x000003ffb9d07a88 in start_thread () at /lib64/libpthread.so.0
#5  0x000003ffb731940e in thread_start () at /lib64/libc.so.6

Thread 2 (Thread 0x3ffab743910 (LWP 171336)):
#0  0x000003ffb7313ada in syscall () at /lib64/libc.so.6
#1  0x0000000001558b5e in qemu_futex_wait (f=0x1e9b41c <rcu_call_ready_event>, val=4294967295) at /home/cborntra/REPOS/qemu/include/qemu/futex.h:29
#2  0x0000000001558e16 in qemu_event_wait (ev=0x1e9b41c <rcu_call_ready_event>) at /home/cborntra/REPOS/qemu/util/qemu-thread-posix.c:445
#3  0x000000000157af82 in call_rcu_thread (opaque=0x0) at /home/cborntra/REPOS/qemu/util/rcu.c:261
#4  0x000003ffb9d07a88 in start_thread () at /lib64/libpthread.so.0
#5  0x000003ffb731940e in thread_start () at /lib64/libc.so.6

Thread 1 (Thread 0x3ffba146290 (LWP 171335)):
#0  0x000003ffb730c1a2 in ppoll () at /lib64/libc.so.6
#1  0x00000000015502da in qemu_poll_ns (fds=0x3d3b2720, nfds=1, timeout=-1) at /home/cborntra/REPOS/qemu/util/qemu-timer.c:322
#2  0x0000000001554882 in aio_poll (ctx=0x3d3924e0, blocking=true) at /home/cborntra/REPOS/qemu/util/aio-posix.c:629
#3  0x000000000145533e in bdrv_drain_recurse (bs=0x3d3a6a70) at /home/cborntra/REPOS/qemu/block/io.c:197
#4  0x0000000001455f1a in bdrv_drain_all_begin () at /home/cborntra/REPOS/qemu/block/io.c:447
#5  0x00000000014560d6 in bdrv_drain_all () at /home/cborntra/REPOS/qemu/block/io.c:476
#6  0x0000000001089216 in do_vm_stop (state=RUN_STATE_SHUTDOWN, send_stop=false) at /home/cborntra/REPOS/qemu/cpus.c:1010
#7  0x0000000001089266 in vm_shutdown () at /home/cborntra/REPOS/qemu/cpus.c:1022
#8  0x0000000001208c08 in main (argc=18, argv=0x3fffbcfdbd8, envp=0x3fffbcfdc70) at /home/cborntra/REPOS/qemu/vl.c:4732

