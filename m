Received: by 10.28.4.212 with SMTP id 203csp216189wme;
        Fri, 4 May 2018 09:29:29 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpKjK2ODlHMslpHmbcaC07AsjmF1qCJB4o9UNoX5sA7RLYD21qIx0JsShQkYFmXC2nzhwUX
X-Received: by 10.55.31.20 with SMTP id f20mr22222396qkf.391.1525451369511;
        Fri, 04 May 2018 09:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525451369; cv=none;
        d=google.com; s=arc-20160816;
        b=Bif4z5W1njI5VN/B9C1ZhEyOBVOh2uO1wTSNvakspaxZ5LVspygcQKuVngLdDubTCt
         frd60A758wisupbDeOGmzFJLczpBrDqHAxpxNhaTwRyVJSxYXw9a+NlEhZC3fBWwWw9v
         9pk7LZk32u8RwDaRQ7AqvuC0/Ovtq84J4MlBx3gvMI2BEUqmWRalQrBxE69DPw7GlFTn
         Bi2oiwlKC3RN6chNq+ec7ZB9sE+iZFdygsuuzhRbGOdWtmgccihW98w5o4A84UWjO0mw
         JZw11EA81Xz330GgJy9pePj2L5rYlLRhGYkz7CK1Bpqh9rsqK7LZlFvRXAZ8DcnJa/xC
         5P/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gK4Xtrc8BlyNdnJObDxIewTviFkllBfh3aDCiJzxFs8=;
        b=OFdSb+++kbY/SE6nbQaxCavlXoVf8SEVb+LQLQ4mISaET4PMVJvI9Hrmd0nN13Y1k8
         4Okh414CBNeTK656W9BntBackkNafJBI/PvSAFpH7mQff02hGxUZNCVIv+HrtK11fTr+
         mAj5BbmTKbpluI8G4oao6R+jIGujRP6CV4DhJIq54/2+1roHDs1aCtNFWyp3hLEhYGwA
         EKfRGBxt75M25Ad/e87KinLT2aPJMZqZb8CqVql+95bV4WRO7OL+pyUs1ptic8c0Z4rx
         2gvx4HfPa6hJKldUpvj/+L4xmH+5TfIzE7DHU2qLbfrH+E4qseBO3VTQDLmoyeL5ycjf
         MtAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdqYes80;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si11102760qve.259.2018.05.04.09.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 09:29:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdqYes80;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEdaL-0002Ui-34
	for alex.bennee@linaro.org; Fri, 04 May 2018 12:29:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEda9-0002Sc-S0
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:29:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEda8-0006Fg-Rx
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:29:17 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:36754)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEda8-0006EZ-N8
	for qemu-arm@nongnu.org; Fri, 04 May 2018 12:29:16 -0400
Received: by mail-ot0-x241.google.com with SMTP id m11-v6so18953592otf.3
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gK4Xtrc8BlyNdnJObDxIewTviFkllBfh3aDCiJzxFs8=;
	b=WdqYes80ZP5gkJTNgD7uZ60rpH0lNQbTWDrEyVibov0uiSXZtA17OttEHeLogTIn8b
	UrJM7+wnsi1iyawUD7AYeVbMU4OJwf3XIpJkIkXTFRBXseOpCdzQbvwJLAaNSv9vVral
	2AB6FJngiC7n3mW5HXYoscKBjOqzUgZOJ8LdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gK4Xtrc8BlyNdnJObDxIewTviFkllBfh3aDCiJzxFs8=;
	b=uUGKfiFS/3BHGX/B8khVGKfzlVdmuwP32IE3i6O2+2bZRP7pPLFGguWjk1C30MBJFI
	0WyG0LB6F9N7IRFXU7orCNeggJlln9+M7kA8tj8kWgB9GftrGWlJNFnQA2otSwujreLC
	G08JpfBTRjYa7uLCq1BCm4KLXbmUC4ZXofGN/3weOH+4LG2b7IiSF/NGagNKAhAJpeft
	TDA1ukAlnRSZKXr8aT7u9pnKowv7wJphd4U1Dlxh+bKKwS+4GJn5N4lpyozBvZEqsBeQ
	uBtLX/UQJWXPQqnrZ1CwHMQnCXKwHYSfuPq5uBfIKET4KFP8lFzCXr2xCfWZBCKZBrVc
	3DTw==
X-Gm-Message-State: ALQs6tDM7dcjw583xESYbm/aHRFIkbYXarq1qgUSKdNebySL8PjcmXlV
	+j5uOx5H7j9QRUkJJTROjghShu9FViJDNTv+o0JYAQ==
X-Received: by 2002:a9d:5014:: with SMTP id
	a20-v6mr18612731oth.205.1525451355878; 
	Fri, 04 May 2018 09:29:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Fri, 4 May 2018 09:28:55 -0700 (PDT)
In-Reply-To: <CAFEAcA9nG0_Eq1QWsCJMA6TKbZ_tf6mXWCVTrkxrFO5-UkmEvw@mail.gmail.com>
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9nG0_Eq1QWsCJMA6TKbZ_tf6mXWCVTrkxrFO5-UkmEvw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 May 2018 17:28:55 +0100
Message-ID: <CAFEAcA-6nkVOEBc59H0mcgnRy9ifPRoRjUrvJ_4Gcr94GdjuSQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v3 0/5] arm: isolate and clean up dtb
 generation
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JK+7yjsTnkqB

On 3 May 2018 at 16:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 May 2018 at 13:08, Igor Mammedov <imammedo@redhat.com> wrote:
>>
>> Changelog v2->v3:
>>    * drop already merged patches
>>        'arm: always start from  first_cpu when registering loader cpu reset callback'
>>        'ppc: e500: switch E500 based  machines to full machine definition'
>>    * add small not related cleanup
>>        'arm: boot: set boot_info starting from first_cpu'
>>    * add extra suggested patch
>>        'make sure that we aren't overwriting mc->get_hotplug_handler by accident'
>>    * make sure that dtb_limit initialized to 0
>>    * drop stale comment
>>    * drop not needed line movement
>>    * drop not needed extra new line
>> Changelog v1->v2:
>>    * drop "arm: reuse  arm_boot_address_space() in armv7m_load_kernel()"
>>    * move "arm: always start from first_cpu  when registering loader cpu reset callback"
>>      at the begigning of series and rebase
>>    * add "ppc: e500: switch E500 based machines to full  machine definition"
>>      and rebase 4/5 on top of it
>>    * fixup typo in virt_machine_get_hotpug_handler() name
>>    * add doc comment to skip_dtb_autoload field
>>    * 1-2/5 are queued in respective arm/ppc trees and are included for series
>>      completness so it would be easier to test, I expect series to go through
>>      arm tree
>>
>
> Applied to target-arm.next, thanks.

Doing further testing within target-arm.next shows that this series (and
specifically patch 3/5) causes segfaults for the "no DTB provided" case.

$ gdb --args ./build/x86/arm-softmmu/qemu-system-arm -M vexpress-a15
-kernel /dev/null
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
[...]
(gdb) r
[...]
Thread 1 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
0x0000000000000000 in ?? ()
(gdb) bt
#0  0x0000000000000000 in  ()
#1  0x000055555596565e in arm_load_dtb (addr=0, binfo=0x5555566dec00
<a15_daughterboard>, addr_limit=0, as=0x555556fa08a0) at
/home/petmay01/linaro/qemu-from-laptop/qemu/hw/arm/boot.c:515
#2  0x0000555555966d7f in arm_load_kernel (cpu=0x7ffff7fd6010,
info=0x5555566dec00 <a15_daughterboard>)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/arm/boot.c:1156
#3  0x0000555555986f5b in vexpress_common_init (machine=0x555556e04060)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/arm/vexpress.c:707
#4  0x0000555555b10341 in machine_run_board_init (machine=0x555556e04060)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/hw/core/machine.c:829
#5  0x0000555555a4cbab in main (argc=5, argv=0x7fffffffe448,
envp=0x7fffffffe478)
    at /home/petmay01/linaro/qemu-from-laptop/qemu/vl.c:4624

arm_load_dtb() is trying to call the binfo->get_dtb() hook and is not
handling the case where it is NULL (which it is on pretty much every
board except "virt").

(You get a segfault with an actual guest kernel as well; I just used
/dev/null here as an easy no-dependencies-required repro case.)

I've left patch 4 in target-arm.next as that was a standalone bugfix,
but have dropped the rest of the series for now.

thanks
-- PMM
