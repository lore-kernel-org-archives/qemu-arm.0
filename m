Received: by 10.25.0.6 with SMTP id 6csp559845lfa;
        Fri, 26 May 2017 19:32:44 -0700 (PDT)
X-Received: by 10.200.45.247 with SMTP id q52mr6409793qta.177.1495852364576;
        Fri, 26 May 2017 19:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495852364; cv=none;
        d=google.com; s=arc-20160816;
        b=0UG8QyrjLkYOXDw3i1UsYn1WFeWQGyrANqYjQlKChz8aRyoAoUvOBL09P1VjIfCG+R
         ZIkwLS5M0bxugTezHkIlCCAXIcAhANwG81q7CtA/RVXNv2NKw75xS0OdwDy5AR2QOB2V
         eaHkg5dgCo8a+V3DxQU+Q/+INTTgy7j4cTq43fVnRMl/6wxZOjCik/ULcNLKKx4y19lk
         ja6S8zGK+eLdqcLTtuqOFzGtXPdc8b9jJVHN+UWGQX80mG4y8O6Gma+jptxSpTzpfq6M
         GsKd3xXj5z1RVyH98IcvbSS/Bqr0ngOMk25yB5bp2yb3uQcEAd7QjVCbCp5pds/txQ22
         IO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jtr+igeV/hHu8+ZSfF8KcXGjTlMy5nR8D0FoLmT1ex8=;
        b=XfARnq+ETnXJhM03AOwP8+eBKMzLDwQF59W0V88A3CVJ85QGAXNtGlxJpjK++KzO1B
         22cOnmKfNtAS0yetj0t3K3ytEx8HsTtcXbwsYeGlB4Ey8I/iv4k6hAu8xKFPkl1hVnru
         7mu1NwC6Qk3pyFaGHtHPjsmvbEyU/VzBluYR5C4q1PS8vPxb+6YgJvyroVviKtkYDxHn
         Gb+BXyiP8fkLSsxgnK1aFQfpU1CoS0b7CgrCFMciAO7iXJET7CDh/G1CkmB7gQ8Mnfso
         a5hVgN6fkG2VEi5FDQ2Q8wqEbbU/VzLqYAScfUIO8TJE1jiv9BTQFaL3yuFy5+NX/5QF
         sARQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l64si2539535qkb.277.2017.05.26.19.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 19:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dERX2-0001jH-2c
	for alex.bennee@linaro.org; Fri, 26 May 2017 22:32:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dERWu-0001iy-LH
	for qemu-arm@nongnu.org; Fri, 26 May 2017 22:32:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhlcindy@gmail.com>) id 1dERWt-0003YL-GF
	for qemu-arm@nongnu.org; Fri, 26 May 2017 22:32:36 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zhlcindy@gmail.com>)
	id 1dERWt-0003YC-8a; Fri, 26 May 2017 22:32:35 -0400
Received: by mail-wm0-x244.google.com with SMTP id k15so6625215wmh.3;
	Fri, 26 May 2017 19:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jtr+igeV/hHu8+ZSfF8KcXGjTlMy5nR8D0FoLmT1ex8=;
	b=a1t8Cc5WpmwBu9Gw9WSY7P+AC6ZxqrLjBcdz3r/DN70xNFpwxlyahDmFjy6L2maLC5
	X4ei3OePseccjBF/mNx24Cjl7RdSz7/5HGXNqckBmzy2+f6EydSa4QxOUDAn07XGWfLQ
	262p1Y2DL78xraCAHZg/FqcKNWAX16a7U0yC8o0FRUVTd6oD3MKG16BXoHOV5RJ/SrGZ
	AgyKgL+SGT5dOVuTwVbDNXM8yfCsQ2KsBDBRDuEap05bZ5UEaSY04WdJ3+ujkFXxitIO
	pGlFMethlo9GjADMfyA3R7j+OXb1aaxpTQUEfkc6s5bJdYlaePEKH75bLHwf253NPzUh
	Idtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jtr+igeV/hHu8+ZSfF8KcXGjTlMy5nR8D0FoLmT1ex8=;
	b=Edy43dXzAU6sQkEe37Dc1yWT1Ye3VoXlTrdM4CoqDzhhyhMfya5mFbpRkF1l7yCaG0
	28XyChSyGVknwNricQwx+Dozip4cbFEmw9TBdcALOOYNFYOzOdRpmheXc3DH5XuLw2Xq
	gCLIF4I+1mI5LbKFSA1Angb6vh1boxJn4g7mbWdLJ5QGqBjKCzGxtmnIiuzkMljnhR+R
	diZVbLWXrdd01r6xlPgX6Y1Ulbt+7YDcHg3TMPSTjXfx29UdI80TCZzCBVdGJ/Q7POmS
	xlMRQ0NZa/TKofyUMWiy7YbqYRrSCccH1whFys2f22qDJdG5dnuDUNIFwAzVJUlvONrY
	KY5A==
X-Gm-Message-State: AODbwcAKuhWqUCnTYQQsqVnKQUkMJkAOXkswZyrS4sG5954f+ML7EANP
	DGncavy/C3rc++k0X8B9LuFkbEJ02A==
X-Received: by 10.80.185.3 with SMTP id m3mr4426196ede.41.1495852354114; Fri,
	26 May 2017 19:32:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.13 with HTTP; Fri, 26 May 2017 19:32:33 -0700 (PDT)
In-Reply-To: <20170526132114.6edc006e@nial.brq.redhat.com>
References: <1495790468-23862-1-git-send-email-zhlcindy@gmail.com>
	<20170526132114.6edc006e@nial.brq.redhat.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Sat, 27 May 2017 10:32:33 +0800
Message-ID: <CAD8of+pw5Nh4oSkTuYX4fbJvA8=-CTmn6dgdXHPLERAcQM+Oyw@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/3] arm/virt: refine virt.c
 code and implement hot_add_cpu interface
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Li Zhang <li.zhang@hxt-semitech.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oaVVqaQvf3gb

On Fri, May 26, 2017 at 7:21 PM, Igor Mammedov <imammedo@redhat.com> wrote:
> On Fri, 26 May 2017 17:21:05 +0800
> Li Zhang <zhlcindy@gmail.com> wrote:
>
>> From: Li Zhang <li.zhang@hxt-semitech.com>
>>
>> virt machine doesn't support hot_add_cpu interface. This patchset is to implement
>> hot_add_cpu interface. A CPU can be added by QMP command with QEMU monitor.
>>
>> Here is command to add a CPU with QMP command.
>>
>> * qemu-system-aarch64 -machine virt -cpu cortex-a15 -smp 1,maxcpus=4 \
>>     -monitor telnet:127.0.0.1:4444,server,nowait -nographic
>> * connect monitor:      telnet 127.0.0.1 4444
>> * execute qmp command:  cpu-add 1
> cpu-add command shouldn't be used for new cpu hotplug,
> pls use generic device_add for that.

Ok,  I will drop this command and look at device_add.

>
> The last time I looked at it, virt machine needed quite a bit of
> re-factoring of the way it creates/wires up CPUs.

 Yes, I am looking into it and see if I can do something:)

>
> Pls see usage of following callbacks for example on how to implement
> device_add based cpu hotplug:
>
>   get_hotplug_handler
>   pc_cpu_pre_plug
>   pc_cpu_plug
>   pc_possible_cpu_arch_ids
>
> and pc_cpus_init() for initial cpu creation with above callbacks in use
>
Thanks, I will see it. :)

>>
>> Currently, when KVM is enabled and add a CPU with QMP command, QEMU
>> reports error "kvm_init_vcpu failed: Device or resourc busy". KVM can't
>> create a new CPU when vgic has been initialized and irqchip_in_kernel in
>> function kvm_arch_vcpu_create. It needs to change KVM code in the future.
> if KVM isn't capable do it yet, then qemu should refuse cpu hotplug if running
> with KVM accelarator and allow it only in TCG mode.

OK, I will add an assertion to allow hotplug only in TCG mode.

>
>>
>> Li Zhang (3):
>>   arm/virt: Refine fdt_add_cpu_nodes code
>>   arm/virt: Refine code of machvirt_init
>>   arm/virt: Implement hot_add_cpu interface
>>
>>  hw/arm/virt.c | 344 ++++++++++++++++++++++++++++++++++------------------------
>>  1 file changed, 202 insertions(+), 142 deletions(-)
>>
>



-- 

Best Regards
-Li
