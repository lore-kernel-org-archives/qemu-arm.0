Received: by 10.25.208.137 with SMTP id h131csp75303lfg;
        Wed, 27 Apr 2016 23:03:26 -0700 (PDT)
X-Received: by 10.140.179.76 with SMTP id z73mr13078971qhz.36.1461823406438;
        Wed, 27 Apr 2016 23:03:26 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id a90si4157702qkh.107.2016.04.27.23.03.26;
        Wed, 27 Apr 2016 23:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id B90FE40F77;
	Thu, 28 Apr 2016 02:01:04 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "MIME-Version"
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dFP1BlZgg7B; Thu, 28 Apr 2016 02:01:03 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id AC3C341145;
	Thu, 28 Apr 2016 02:01:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3082940F9B
 for <kvmarm@lists.cs.columbia.edu>; Thu, 28 Apr 2016 02:01:03 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "MIME-Version"
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UcZzOpgSggWA for <kvmarm@lists.cs.columbia.edu>;
 Thu, 28 Apr 2016 02:01:00 -0400 (EDT)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 608D540F77
 for <kvmarm@lists.cs.columbia.edu>; Thu, 28 Apr 2016 02:00:59 -0400 (EDT)
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O6B0216QY5IQDD0@mailout4.samsung.com> for
 kvmarm@lists.cs.columbia.edu; Thu, 28 Apr 2016 15:03:18 +0900 (KST)
Received: from epcpsbgx3.samsung.com ( [172.20.52.113])
 by epcpsbgr3.samsung.com (EPCPMTA) with SMTP id 26.8A.05366.6A7A1275; Thu,
 28 Apr 2016 15:03:18 +0900 (KST)
X-AuditID: cbfee68f-f79d26d0000014f6-57-5721a7a6322b
Received: from epmailer02 ( [203.254.219.142])
 by epcpsbgx3.samsung.com (EPCPMTA) with SMTP id 20.64.05252.6A7A1275; Thu,
 28 Apr 2016 15:03:18 +0900 (KST)
Date: Thu, 28 Apr 2016 06:03:18 +0000 (GMT)
From: RAVINDRA KUMAR SANDE <r.sande@samsung.com>
Subject: Re: Re: [Query] Does Linux & Qemu support KVM for ARM32 guest on ARM64
 host
To: Shannon Zhao <zhaoshenglong@huawei.com>,
 RAVINDRA KUMAR SANDE <r.sande@samsung.com>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
MIME-version: 1.0
X-MTR: 20160428043852024@r.sande
Msgkey: 20160428043852024@r.sande
X-EPLocale: en_US.windows-1252
X-Priority: 3
X-EPWebmail-Msg-Type: personal
X-EPWebmail-Reply-Demand: 0
X-EPApproval-Locale: 
X-EPHeader: ML
X-MLAttribute: 
X-RootMTR: 20160428043852024@r.sande
X-ParentMTR: 
X-ArchiveUser: 
X-CPGSPASS: Y
X-ConfirmMail: N,general
MIME-version: 1.0
Message-ID: <708585848.188261461823397987.JavaMail.weblogic@ep2mlwas06d>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWyRsSkUHfZcsVwg50vNSw+njrO7sDocX7T
 GuYAxigRm5TUnMyy1CJ9OwQrQSRj+q7DjAXzRCumNtg0MF4R6WLk4BASUJL4ct6li5GTQ0LA
 ROLL4sssELaYxIV769m6GLmASpYySvR8f8UKUg9SdHKWAER8DqPExqbFYA0sAqoSRy4fZAax
 2QQMJY5cn8IGYgsLhEj0HfjIDNIgInCWUeL/zhNgDrNAJ5PErCtPwDqEBGQlum7eYQSxeQUE
 JU7OfAJ1hoLEgc/LoOKKEg3HZjJDxOUklky9zARh80rMaH/KAhOf9nUNVI20xPlZGxhh3ln8
 /TFUnF/i2O0dUL0CElPPHISqUZV49OkwVA2fxJqFb1lg6nedWs4Ms6th4292CFtCYmvLE1YQ
 mxnotindD9khbAOJI4vmsKL6hQPI9pA4M8MX5HcJgQscEm9fTWSbwKg0C0nZLCSjZiEZhaxm
 ASPLKkbR1ILkguKk9CJjveLE3OLSvHS95PzcTYzAdHH637P+HYx3D1gfYlTnYJQSLc0rTk7M
 y0tMykmNz03MScsvyk1NUeLhnZCgGC7EmlhWXJl7iNEUGH8TmaVEk/OBKSyvJN7Q2MzIwtTE
 1NjI3NJMSZx3odTPYCGB9MSS1OzU1ILUovii0pzU4kOMTBycUg2MzolhL999aHBWZeNwS+7b
 c/PCoof9qf92qf37zJYQyPZq0rvSil2Gp77Wm+4/7/NMQZz3iuayop2/FudMEK6drNIpo2fQ
 suXiz6m9fol8/kcyF5adSu1/1jzl8PlPElt4rjW5atzen/eVx2pyfO47Dtm5J9NcNgdcuDQj
 9EXy3yzvnxsEvxvZKbEUZyQaajEXFScCAJSXYa0pAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSbUhTURjHO947ndLqtlweVtq8KJLl3ItzWhpFUlIK9oKSGdt1O77Udjfu
 3UTry4ggmihGmjYk8h1USgeBih98w9LMiQpmRqStCCLKTJLM7M5tYN9+5//8/+d5DufhY8IV
 nphfTFsQQ1MGMjAEf/l3oTKutS0yR2a/H5W0PP486ARIdzk7sSyQa07RI0NxCWLij6cUIUqP
 GAmidSZ9MV2YSp67qDmlUSXK5HHy5CQ1KaEpI0ol0zKy4k4XG7j7SUkJZbByUhbFsiR3A2Oy
 WpCkyMRaUskrcrVCqpBJVQqpXHn1qFwmU6g4j9ZcVNs3DMyPRKU1thQbmA21Az5fSJDwpyvN
 g5BIgGMOwg6COdwHp949DbSDEM5RD2D3rSbcU8CJaDgyM4h5OJCQw5G56kAP7yUuwcqBZcwT
 CCVeAbjZ+2LrgBF3A6Bj1r2VEBLh0D7/FnhYQOyBYw/duLedBA6stPr0SGgbfYh59QjYXDMT
 4GUBrLvzEffrD1Y7fZ790OXoAv6xm3598Om74ehCjy9LwJqJQZ8nGi79GPZ5dsHOhq+43983
 3ob5e9m614O8DOGz226ehzFuturyxSAvy+BIYz3v/7fwOU6HE3WZVSDcsa3i2JZ2bEtv9zwG
 eDsQIbPOzOYXliqlLGVkrXShVGcyOsHWNn1q6gGbrmNDIIYPxCIrzeoomqbyDUhjpAwFJsaI
 9OROQZU2MkfIo0rYMuMQiOJaLXV1TAExTptoRIYKzjZzZYGeKruBGJOGsRoQOwRU3M/ew8Qi
 nYlbX9qikSuVCYkJquSEJJlKTYYJsjaeZAuJQsqCriNkRow/F8APFtuAuPZ7rSGsatIZq3AX
 OPv/kJmrLY0HUMtG9lxD2zcmJijGjYfAmTzQ7xjPGA9XRh/RLumu5atd5Y6UyDW1NtbG6008
 s7b4+7JoI1ecF3ywvXl6cv78hR3ODu3rkzPr9OdDA9ObERX1g5mupvcbb1orvmh02vWbusPd
 g/EtYbUkzhZR8liMYal/zHZinIYDAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
Cc: Marc Zyngier <marc.zyngier@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: r.sande@samsung.com
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
X-TUID: isjti/f/EKXu
Message-ID: <20160428060318.PcMiFr_s1fMh2w51ebnHM5U37vgdeVh9hM7ugZbdgKk@z>


> On 2016/4/28 9:50, RAVINDRA KUMAR SANDE wrote:
> > 
> > What I did  :
> > 1) Just for investigation, I took a ARMv8 ( OdroidC2 ) board
> > 2)  I compiled Linux 3.14 with KVM support for this ARMv8 ( OdroidC2 )
> > board, with modification replacing meson_timer by arm timer in its dts
> > file.
> > Why Linux 3.14 : I took Linux 3.14 because display drivers for this
> > board are officially for this version; and I am interested in seeing
> > some Linux guest booting with display on.
> > 3)  I see from boot log of  that KVM is initialized successfully, and I
> > can see /dev/kvm node.
> > 4) I built latest Qemu with --enable-kvm on this board natively.
> > 
> > What I find :
> > 1) running "qemu-system-arm  -enable-kvm   -machine vexpress-a9 ...."
> > gives error :  no accelerator found
> > 2) running "qemu-system-aarch64 -enable-kvm  -machine vexpress-a9 ...."
> > gives error : kmv_init_vcpu (IOCtl on /dev/kvm) failed, guest not supported
> > ( I experimented some modifications as well to overcome above error,
> > such as replacing value assigned to cpu->kvm_target etc, but IOCtl call
> > is failing)
> > 
> > Query:
>>  1) Does Arm64 Linux not enable KVM support for Arm32 guest ?
> > 2) Can qemu-system-arm not use the KVM feature on Arm64 host ?
> > 3) Can qemu-system-aarch64 not use KVM feature for Arm32 guest ?
> > 
> ------- Original Message -------
> Sender : Shannon Zhao<zhaoshenglong@huawei.com>
> 
> You can use below command to boot a ARM32 guest on ARM64?
> 
> qemu-system-aarch64 -enable-kvm -machine virt,kernel_irqchip=on -cpu
> host,aarch64=off ....
> 
> -- 
> Shannon


I will try above on Arm64. 

I have another query, for Arm32 host with KVM enabled.
I see that "qemu-system-arm  -enable-kvm   -machine vexpress-a9  ..." gives error
kmv_init_vcpu (IOCtl on /dev/kvm) failed, guest not supported.

Is there any way to emulate vexpress-a9  with  -enable-kvm   on qemu ?

Regards,
Ravindra Sande
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
