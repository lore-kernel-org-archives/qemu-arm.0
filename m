Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4148151wrt;
        Fri, 19 Oct 2018 10:42:10 -0700 (PDT)
X-Google-Smtp-Source: ACcGV610y06FrmjHocnP0R5C6yY8XwAQ/IDB7Jtv7P8Ld+tTxUfB8lJkp9ikVXbATNFw7OhvqoHH
X-Received: by 2002:a37:8d83:: with SMTP id p125-v6mr33701595qkd.97.1539970930608;
        Fri, 19 Oct 2018 10:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539970930; cv=none;
        d=google.com; s=arc-20160816;
        b=FtzIuqRTwK9qt/Y8x2rnvt4P5VEvZsSsrV675FKMxxgZmiXOr0s4jYNj6vnLs4n5Ew
         wzbXhcgbCcvXNxpM5yo1GKW+gS2tGFynrTGYVi5naAS8s9H9C3xG9swam2T4wj+ms2K2
         dOVgeOL7oLL9rt6AmK84thF2JlEYdETw5InCjBBcu/7v8sOE1IX836sl8gqYc8h5bEsO
         CDbk7WrYJgrjbPQoR8O5ADFpabh0dmXE9gNF1slhFOFa1JmHCzOVQCQHdoIJ8QYuG+iY
         /QYwaC+VReELCQ5gEsVksWSGFbFH6HUDCOVlrk/bdqqGXDCCEZoK4qHJlYVjwYirV+zu
         m9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=hxhZKUpv2MArS5UW01KHfAOsN/EEZk32ufxHqBoR7FI=;
        b=TqlPIx2Pfe6O7WiXGD/SkQdQfKIrjEl3pndZn89yFa9GZoFqgp/cdP74+jW7G4Pfb1
         rO+ZAH/DuD7ax29TeAwVfGr67jMtNM7tb6eIHEy0kTHxsncTD8yuNnxA7ZqNw2ZprZiq
         zZveXNY2mcYSVaugRLLj4LhJMNG6U2U8p5rGD7lklXq1BOzHOPq5nQnhaTnFoQL9fpHG
         fIsC0SJzC3SxgIZxemgj1mLefUOWlzJ1vNB+nGeAFcgzJb9Zg/Qsq5f8iWhT7oiQjAyp
         Bur0EGFCq8UCkt3bYJu2Ztwfd7h7qSLMGBUKyGgz1vVFpmkMSfSi2xNLK2ersewt6aEF
         UpDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b18si8312910qvb.204.2018.10.19.10.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 10:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDYmo-0002Qo-4V
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 13:42:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gDY8M-0003lP-D2
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 13:00:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gDY8G-0005Jo-Oc
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 13:00:21 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38045)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gDY8G-0005JG-Hl
	for qemu-devel@nongnu.org; Fri, 19 Oct 2018 13:00:16 -0400
Received: by mail-wm1-f67.google.com with SMTP id 193-v6so4323944wme.3
	for <qemu-devel@nongnu.org>; Fri, 19 Oct 2018 10:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hxhZKUpv2MArS5UW01KHfAOsN/EEZk32ufxHqBoR7FI=;
	b=I6LPLvYgb2Zv7wAiQZicqJUW5OuTmUO59oDY6X9EYjuo+Ec1byteBNn3HqfNLpswgr
	IBjyHq6EvetT5aTEX7ownNjVDNNv6VjW0LTpl1P659FJVylFMV+qm0/mh3Kftuw03bqr
	dLFuhabjnxZTpPUAC/Dsmr2vkqMgpt2WpvyK9YM8h2sl9PTcG0sKY7fxU7Ce78uXleb9
	L/Loxcwf0gypsg9DtUxjBteia+dEPertpsGnbMZsJT57YM1zB8jXnXfOLCTnbq13YL29
	w0rKHp6xOLpK7FHaYnTZqD6rUcXSg5DE5U0EuiaACRZQykTkUP6OlbR3clCEUxLVTUAU
	V94Q==
X-Gm-Message-State: ABuFfojQdtK046B9KL0KhP5eY9NV+qHeGvjcqRA/3JrOkaRWkhRk4ZeO
	J3AuybmlKHTkRAy9VtzVr1x1cA==
X-Received: by 2002:a1c:5702:: with SMTP id l2-v6mr5309707wmb.83.1539968415320;
	Fri, 19 Oct 2018 10:00:15 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.29.77])
	by smtp.gmail.com with ESMTPSA id
	l38-v6sm22417643wre.38.2018.10.19.10.00.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Oct 2018 10:00:14 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8db2535c-c44c-ac0b-33b3-d2c2af7de15e@redhat.com>
Date: Fri, 19 Oct 2018 19:00:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PULL 00/45] Machine queue, 2018-10-18
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /9649XFburIy

On 19/10/2018 16:12, Peter Maydell wrote:
> On 18 October 2018 at 21:03, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> The following changes since commit 09558375a634e17cea6cfbfec883ac2376d2dc7f:
>>
>>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20181016-1' into staging (2018-10-16 17:42:56 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>>
>> for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e39c700cc:
>>
>>   numa: Clean up error reporting in parse_numa() (2018-10-17 16:33:40 -0300)
>>
>> ----------------------------------------------------------------
>> Machine queue, 2018-10-18
>>
>> * sysbus init/realize cleanups
>>   (Cédric Le Goater, Philippe Mathieu-Daudé)
>> * memory-device refactoring (David Hildenbrand)
>> * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
>> * -numa parsing cleanups (Markus Armbruster)
>> * Fix hostmem-file memory leak (Zhang Yi)
>> * Typo fix (Li Qiang)
>>
>> ----------------------------------------------------------------
>>
> 
> Hi. This had some problems in merge testing, I'm afraid:
> 
> On aarch64 host, warnings running tests/cpu-plug-test for i386 and s390 targets:
> 
> TEST: tests/cpu-plug-test... (pid=12602)
>   /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=12:
> qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (2) != maxcpus (12)
> OK
>   /i386/cpu-plug/pc-i440fx-3.0/device-add/1x3x2&maxcpus=12:
> qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (2) != maxcpus (12)
> OK
>   /i386/cpu-plug/pc-q35-3.0/cpu-add/1x3x2&maxcpus=12:
> qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (2) != maxcpus (12)
> OK
>   /i386/cpu-plug/pc-q35-3.0/device-add/1x3x2&maxcpus=12:
> qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (2) != maxcpus (12)
> OK
>   /arm/qom/n800:                                                       OK
> PASS: tests/cpu-plug-test
> [...]
> TEST: tests/cpu-plug-test... (pid=15040)
>   /s390x/cpu-plug/s390-ccw-virtio-3.1/cpu-add/1x3x1&maxcpus=6:
> qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (1) != maxcpus (6)
> OK
>   /s390x/cpu-plug/s390-ccw-virtio-3.1/device-add/1x3x1&maxcpus=6:
> qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (1) != maxcpus (6)
> OK
>   /s390x/cpu-plug/s390-ccw-virtio-3.0/cpu-add/1x3x1&maxcpus=6:
> qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (1) != maxcpus (6)
> OK
>   /s390x/cpu-plug/s390-ccw-virtio-3.0/device-add/1x3x1&maxcpus=6:
> qemu-system-s390x: warning: Invalid CPU topology deprecated: sockets
> (1) * cores (3) * threads (1) != maxcpus (6)
> OK
> PASS: tests/cpu-plug-test
> 
> (plus similar ppc64, x86_64 targets)
> 
> I see similar warnings on hosts SPARC, PPC64BE, S390, 32-bit Arm
> and x86 FreeBSD.
> 
> I also got a build failure on one of my configs, but I think that
> is caused by some latent bug in our makefiles where we don't
> correctly rebuild x86_64-softmmu/config-devices.mak when a
> change is made to default-configs/i386-softmmu.mak -- doing a
> hand rm of the config-devices.mak fixed it.

bisected to:

23d0571a24559b867fa47410aa8ec0519b0a1edd is the first bad commit
commit 23d0571a24559b867fa47410aa8ec0519b0a1edd
Author: Igor Mammedov <imammedo@redhat.com>
Date:   Thu Sep 13 13:06:01 2018 +0200

    vl.c deprecate incorrect CPUs topology

    -smp [cpus],sockets/cores/threads[,maxcpus] should describe topology
    so that total number of logical CPUs [sockets * cores * threads]
    would be equal to [maxcpus], however historically we didn't have
    such check in QEMU and it is possible to start VM with an invalid
    topology.
    Deprecate invalid options combination so we can make sure that
    the topology VM started with is always correct in the future.
    Users with an invalid sockets/cores/threads/maxcpus values should
    fix their CLI to make sure that
       [sockets * cores * threads] == [maxcpus]

> 
> 
> thanks
> -- PMM
> 
