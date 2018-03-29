Received: by 10.28.71.155 with SMTP id m27csp1542888wmi;
        Thu, 29 Mar 2018 03:55:45 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/EXAsMSkbTDK6pt7VCm136N7vyKbpAzrVeP8relF2liyt86axz+8qCB4J10ZOkRbxYzEc3
X-Received: by 10.200.39.39 with SMTP id g36mr10235708qtg.227.1522320945006;
        Thu, 29 Mar 2018 03:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522320945; cv=none;
        d=google.com; s=arc-20160816;
        b=Bat5k5pv9DQdhZrhIqxWPv2RW7lxSp+tA+PFp9Z0yQn2Xe4b7B/+6Q0n/25Hk9QVZu
         34HQDlsnpo7OPCY83jUq0wUg047Um5kCCC9OUnYfH8mIWkqGFK79KxbIapfUKB740SAu
         Qh8hrYGAaFWQWGaw0pLVUi3NxdyPPmmXqEWMP/68TRFPnNEwAWVDdK4zX/MLDhIU0b8e
         v3gNsfNfb9innz1S5NnWlEe7IlMwVoTMK2VOuy90GMFxI3E2VuQDFj+f3eWPkuT2Ua1Y
         kfKKsertLP4mUW/lPe+bIBo/SXusrWGcPxS0djq32FaRgvmT38EEnyEaAaNRwvtywAsG
         LS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=FpqsDV5M/fmszCsqRZr1Nr4L39sWPbwRCeGNdh4jI/w=;
        b=CPC/NanmDg9rZoMiXBfUeXFrTjlq8L4a/Mgm4f79p95Iu+I1SL0GfpfgFyMhDAcqml
         DtSzbhskj/F+BF9GcJc7FJcNOUohsMIbQTc0m1K0UnbJf4yWWIscVazgyo/F8hDEIG/x
         Ta+04v0OzMY+EeN0UV6KFCDPM5170DxtPTZBEz6ywx4cqbsel6I/n/SIFjWslfdqyOum
         Y6tVqxvcsae29ucQ0psWVMm8zOeYxh79yDmrnDqSB2EeQhy/yCtC6K3mz12OCEhSv79m
         Ix2psDuoned+2MD1xQ9lpX3voqIQc3fdQSJIPO8idawqrjYZ+K/znEZaCMIhOr7Y1a91
         PGUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LuqrvODs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f21si6093691qkm.343.2018.03.29.03.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Mar 2018 03:55:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LuqrvODs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f1VDJ-0003lY-Id
	for alex.bennee@linaro.org; Thu, 29 Mar 2018 06:55:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f1VDB-0003ik-Cl
	for qemu-arm@nongnu.org; Thu, 29 Mar 2018 06:55:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f1VDA-0005or-AJ
	for qemu-arm@nongnu.org; Thu, 29 Mar 2018 06:55:17 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:42304)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f1VDA-0005oZ-1Y
	for qemu-arm@nongnu.org; Thu, 29 Mar 2018 06:55:16 -0400
Received: by mail-ot0-x231.google.com with SMTP id h55-v6so4461839ote.9
	for <qemu-arm@nongnu.org>; Thu, 29 Mar 2018 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FpqsDV5M/fmszCsqRZr1Nr4L39sWPbwRCeGNdh4jI/w=;
	b=LuqrvODsz1oh4CEUfBOh4GNiyt8Iw4/UbBM0moy7ltSh63sFBvtZGyee3n5j9ib/gN
	/pkXE4YI5/ITgU+L+pSRz1xu0i6As5DDMrLCQTA3/aUYQ74sWChp4lK40QzSn//g87ow
	yhcDsh/hYF9M8aHrcfJd5XbTYw8JvDEqtjW/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FpqsDV5M/fmszCsqRZr1Nr4L39sWPbwRCeGNdh4jI/w=;
	b=fIcxkBYYdLGUVrVR5KvXPqvSyeFAgcoU17wyyaOtbsixydc4YZxUESCseT1NH03IFf
	8I+jAXUuyawTLy+HkxIrpeHG1RXul1Oqe+ODDjYj5FiqF/Zni1AJnhEWMj9J/lCjaDt4
	H85uWVeFc1pLvenciCWliRWyYrz/jBCU/+Y2dXh2TwpZOirOUebdTLQY6aAFyGGHSO4A
	H6QGq8H7eW3RxQmCwAvkNrj7Wf+tZ2Mo/Vo/aPdoRnvV/jwqVIxAizlvITbpbrqyret4
	vezuWPruP2rlH9rfWc+BaF/wNcUKwUo1ne3sfCRqjd99anTnrU57LIQ1Kp+TxyQzDbbJ
	qLFQ==
X-Gm-Message-State: ALQs6tCSBx8HngW5fPHs9SC/AmGvRQz8PORVqVRq7NiegpaAJ5pwSzlz
	11n6opK5KZr28uL2rboowajyMbpWaokzYqgtie5AxQ==
X-Received: by 2002:a9d:2129:: with SMTP id
	i38-v6mr4885407otb.210.1522320915056; 
	Thu, 29 Mar 2018 03:55:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 29 Mar 2018 03:54:54
	-0700 (PDT)
In-Reply-To: <CAFEAcA8yr+KJFwBSksMP-VjNbsSd190VCzB4wGwOCoaX2ScDiA@mail.gmail.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
	<1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA96qV_f7i_36Yzb-QV7W9SRHKfJpg=rvv3tia2X-Xi7QQ@mail.gmail.com>
	<5AB0F254.3050503@huawei.com>
	<CAFEAcA-Ct3qa0OFZ4U+9RH68SQJgmkxJKKS5e+if_MuL2pSu3A@mail.gmail.com>
	<5AB21130.2020309@huawei.com>
	<CAFEAcA8yr+KJFwBSksMP-VjNbsSd190VCzB4wGwOCoaX2ScDiA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Mar 2018 11:54:54 +0100
Message-ID: <CAFEAcA_r=S=YWAuZue1zZnFdtFYK2wU7NnaCcGThZU_u33qD4g@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip
 the registers banked by GICR
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rp4IXFbJ5p5w

On 23 March 2018 at 12:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 21 March 2018 at 08:00, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> On 2018/3/20 19:54, Peter Maydell wrote:
>>> Can you still successfully migrate a VM from a QEMU version
>>> without this bugfix to one with the bugfix ?
>>>
>> I've tested this case. I can migrate a VM between these two versions.
>
> Hmm. Looking at the code I can't see how that would work,
> except by accident. Let me see if I understand what's happening
> here:
>
> In the code in master, we have QEMU data structures
> (bitmaps, etc) which have one entry for each of GICV3_MAXIRQ
> irqs. That includes the RAZ/WI unused space for the SPIs/PPIs, so
> for a 1-bit-per-irq bitmap:
>  [0x00000000, irq 32, irq 33, .... ]
>
> When we fill in the values from KVM into these data structures,
> we start after the unused space, because the for_each_dist_irq_reg()
> macro starts with _irq = GIC_INTERNAL. But we forgot to adjust
> the offset value we use for the KVM access, so we start by
> reading the RAZ/WI values from KVM, and the data structure
> contents end up with:
>  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
> (and the last irqs wouldn't get transferred).
>
> With this change to the code we will get the offset right and
> the data structure will be filled as
>  [0x00000000, irq 32, irq 33, .... ]
>
> But for migration from the old version, the data structure
> we receive from the migration source will contain the old
> broken layout of
>  [0x00000000, 0x00000000, irq 32, irq 33, ... ]
> so if the new code doesn't do anything special to handle
> migration from that old version then it will write zeroes to
> irq 32..63, and then write incorrect values for all the irqs
> after that, won't it?
>
> That suggests to me that we need to have some code in the
> migration post-load routine that identifies that the data
> is coming from an old version with this bug, and shifts
> all the data down in the arrays so that the code to write
> it to the kernel can handle it.

I was thinking a bit more about how to handle this, and
my best idea was:

(1) send something in the migration stream that says
"I don't have this bug" (version number change?
vmstate field that's just a "no bug" flag? subsection
with no contents?)

(2) on the destination, if the source doesn't tell us
it doesn't have this bug, and we are running KVM, then
shift all the data in the arrays down to fix it up
[Strictly what we want to know is if the source is
running KVM, not if the destination is, but I don't
know of a way to find that out, and in practice TCG->KVM
migrations don't work anyway, so it's not a big deal.]

Juan, David, do you have any suggestions for the best
mechanism for part 1; or is there some clever way to
handle this sort of bug that I've missed?

thanks
-- PMM
