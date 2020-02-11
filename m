Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5398286lfp;
        Tue, 11 Feb 2020 10:23:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqymZF1tcitZzCSMH76Q4czatXALLs1Rthkhu8YCZd1zcr8cvbNGB3bFVQiQjAxo76qdgffw
X-Received: by 2002:a37:6741:: with SMTP id b62mr7435050qkc.305.1581445428721;
        Tue, 11 Feb 2020 10:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581445428; cv=none;
        d=google.com; s=arc-20160816;
        b=vdsIKh3RCI4CipoeC+96Hg5sMInn6xbqrBWiAf6Bpk/TzrwC8NOrAwKBytG3jt8vRT
         m09OJ1BOgujDVM6fWyM0qQs4QNHRRP9rDQcLBmqYDvInZ/PwjSY57pnj934Y5wNac2GP
         WugibUSsPHlggXylZ6I5HksXL3NYwqzGvj/8ZbzYeRgM6zD1FAthrMDRm1VsiWho+zXc
         VqQqsUC+1wDpeFjDx2nNXhohc7Cf/6whm8/Ydu3V6W/1u4FBmux0nVqQoscRGaRcbDVD
         7frdboWTuFj1Ci19jmcVPzUDW4qNw70NsfOppo+Vj90RhnitDngmoyjWXQ4Vx3Ao2fmR
         B7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IcReTrObxyz4JxxUf2bILnbyWrsJabFVdSc4c5307IU=;
        b=YeHPoGyDBnlreWiQQ4/5bB6JNM5KWRMPjBIe8WzUq/jFcqNiry/dxocBs34do/S/gp
         CeCwdbUeLsKg05sY5x1ojWd1gP9qZgEz8A5BG/QVRE7na2+7axukJ2gC4oH1fV7PHcyF
         ZDP9ELa3IT4yxW1RwPH0CvIA9MaDE6Xb7IqeilRa1AJ4SPuCvaTSkHDwWSC8xJASeFo9
         K8VValMuN72YRMHbL++obYZ1QXOSoswzKMCFnNmD6NWpek3AQi/DRho1rguLHT7hHMAe
         9XS3QKCX+Vv4WaHqbEbuMvezuj37FlwVbUFSn78RrSRgJ/9XYs/PIaOImo2GVOuEiz5J
         6jaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=D+JknhB6;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id u35si2309099qtd.394.2020.02.11.10.23.48;
        Tue, 11 Feb 2020 10:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@redhat.com header.s=mimecast20190719 header.b=D+JknhB6;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 66CCA4AF13;
	Tue, 11 Feb 2020 13:23:48 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@redhat.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEctQlLnldYH; Tue, 11 Feb 2020 13:23:47 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 38E344AF0E;
	Tue, 11 Feb 2020 13:23:47 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id BC7064AEE9
 for <kvmarm@lists.cs.columbia.edu>; Tue, 11 Feb 2020 13:23:46 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id th-u8g-kr4gt for <kvmarm@lists.cs.columbia.edu>;
 Tue, 11 Feb 2020 13:23:45 -0500 (EST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A28134AEFB
 for <kvmarm@lists.cs.columbia.edu>; Tue, 11 Feb 2020 13:23:45 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581445425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JtLteavNR/sU8I4FM52dhJ4SSP+pHIXFfOdCu8qBlvk=;
 b=D+JknhB63qBZv3hP1gWIugxrS/KVdIXFV3tj0Fb/F/HPMIjWlvS5D+fTIlev4uVRYtr9Eg
 4Ww48rqeRDC1oCNW2F1MQ+VMDgrQOaYDngNcQ8YTI1t7ZOiGqctr/tnT5qHCAuwk5FS1GQ
 WMFM0feZnVBBlUBfogHGWlHW7VSsdeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-eLXIxVWWPx6eFNA8tAG7jw-1; Tue, 11 Feb 2020 13:23:38 -0500
X-MC-Unique: eLXIxVWWPx6eFNA8tAG7jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BF2F18B9FC1;
 Tue, 11 Feb 2020 18:23:37 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A08560BF1;
 Tue, 11 Feb 2020 18:23:31 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v2 0/9] KVM: arm64: PMUv3 Event Counter
 Tests
To: Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20200130112510.15154-1-eric.auger@redhat.com>
 <CAFEAcA8iBvM2xguW2_6OFWDjPPEzEorief4F2aoh0Vitp466rQ@mail.gmail.com>
 <20200211160733.zbqh3vbscdfgkkcd@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7daa10bc-178d-48a1-aee4-a8edcaf37bc3@redhat.com>
Date: Tue, 11 Feb 2020 19:23:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200211160733.zbqh3vbscdfgkkcd@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: kvm-devel <kvm@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Andre Przywara <andre.przywara@arm.com>, Andrew Murray <andrew.murray@arm.com>,
 kvmarm@lists.cs.columbia.edu, Eric Auger <eric.auger.pro@gmail.com>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: hDPN6Z7AuQew



On 2/11/20 5:07 PM, Andrew Jones wrote:
> On Tue, Feb 11, 2020 at 03:42:38PM +0000, Peter Maydell wrote:
>> On Thu, 30 Jan 2020 at 11:25, Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>> This series implements tests exercising the PMUv3 event counters.
>>> It tests both the 32-bit and 64-bit versions. Overflow interrupts
>>> also are checked. Those tests only are written for arm64.
>>>
>>> It allowed to reveal some issues related to SW_INCR implementation
>>> (esp. related to 64-bit implementation), some problems related to
>>> 32-bit <-> 64-bit transitions and consistency of enabled states
>>> of odd and event counters (See [1]).
>>>
>>> Overflow interrupt testing relies of one patch from Andre
>>> ("arm: gic: Provide per-IRQ helper functions") to enable the
>>> PPI 23, coming from "arm: gic: Test SPIs and interrupt groups"
>>> (https://patchwork.kernel.org/cover/11234975/). Drew kindly
>>> provided "arm64: Provide read/write_sysreg_s".
>>>
>>> All PMU tests can be launched with:
>>> ./run_tests.sh -g pmu
>>> Tests also can be launched individually. For example:
>>> ./arm-run arm/pmu.flat -append 'chained-sw-incr'
>>>
>>> With KVM:
>>> - chain-promotion and chained-sw-incr are known to be failing.
>>>   [1] proposed a fix.
>>> - On TX2, I have some random failures due to MEM_ACCESS event
>>>   measured with a great disparity. This is not observed on
>>>   other machines I have access to.
>>> With TCG:
>>> - all new tests are skipped
>>
>> I'm having a go at using this patchset to test the support
>> I'm adding for TCG for the v8.1 and v8.4 PMU extensions...
>>
>> Q1: how can I get run_tests.sh to pass extra arguments to
>> QEMU ? The PMU events check will fail unless QEMU gets
>> the '-icount 8' to enable cycle-counting, but although
>> the underlying ./arm/run lets you add arbitrary extra
>> arguments to QEMU, run_tests.sh doesn't seem to. Trying to
>> pass them in via "QEMU=/path/to/qemu -icount 8" doesn't
>> work either.
int arm/unittests.cfg

there are tests related to TCG that are commented.

# Test PMU support (TCG) with -icount IPC=256
#[pmu-tcg-icount-256]
#file = pmu.flat
#extra_params = -icount 8 -append 'cycle-counter 256'
#groups = pmu
#accel = tcg

I wondered why we kept those and commented. Should we start with
separate tests for KVM and TCG?

> 
> Alex Bennee once submit a patch[*] allowing that to work, but
> it never got merged. I just rebased it and tried it, but it
> doesn't work now. Too much has changed in the run scripts
> since his posting. I can try to rework it though.
> 
> [*] https://github.com/rhdrjones/kvm-unit-tests/commit/9a8574bfd924f3e865611688e26bb12e53821747
> 
>>
>> Q2: do you know why arm/pmu.c:check_pmcr() insists that
>> PMCR.IMP is non-zero? The comment says "simple sanity check",
>> but architecturally a zero IMP field is permitted (meaning
>> "go look at MIDR_EL1 instead"). This causes TCG to fail this
>> test on '-cpu max', because in that case we set PMCR.IMP
>> to the same thing as MIDR_EL1.Implementer which is 0
>> ("software use", since QEMU is software...)
indeed
> 
> Probably just a misunderstanding on the part of the author (and
> reviewers). Maybe Eric can fix that while preparing this series.

Yes I can definitively fix that

Thanks

Eric
> 
> Thanks,
> drew
> 

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
