Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp6007443wre;
        Thu, 31 May 2018 07:44:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIff2hY0OAh9v1eUGq59yR8UEBo4WCTPeOH9Un8+l55RO6r+ViuOsEYQFPaLuRIlQ7R6yvS
X-Received: by 2002:a37:6f01:: with SMTP id k1-v6mr6508191qkc.140.1527777893344;
        Thu, 31 May 2018 07:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527777893; cv=none;
        d=google.com; s=arc-20160816;
        b=DW8RrCskQA/cHzr62MKyMxAAwEPEs19NqhSsByhnXcLVtvZEeI022B7/PzOPmHm8A+
         TkCRWxbbP6KuGfB+Xc9L15z8VgRpVLZkP0EEBz6ghms3ylL+9rPRDjLG5181apDNIBuE
         eGtBkk/g9jPsb51tELpwkhKlI/4ZboillSvkxFY+h4NqQAiZu7IlX59ZOE7LTMkBgams
         CnN5O312he9VKv7ffbCrcuB8lFH7I0uT+TyQwFBXiQUD4bDTdnrpVgm24J9CvCvB3skE
         Q1xdMLlDYACIflsk/9OMkOeXISUN+7nI6K6IUEQJBiy4vf71epMhtmgzzdhvUPJLpOOW
         ptqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7xwyQ3Ti6AhZuDgv0d7YZvQds+uuRmKWbvgQzeBjbQI=;
        b=KB6VBV8D1Ym4/UOHOb8Hu79c4N9BSCNHXQgvCyTkPk21kTtCZcWfreGdJzckYkRRaZ
         War/OPv9PezfaO8D28JGpoXzzrTJhJ11ku13OvqL0pNbyR1YHOkurLRC1OjJKerFXd8h
         pXco0/ipeYevhMBa3lTL2nO7/8IrX1D9zTk12EiZLBbSXLl3xrM9yPFZ7MZNEVrZXMg5
         uY64D02h9682pyQc5NESCwm4S5LYyxoUyZvbatPXAFZh+lStByOls4CsklR88jO/tY8H
         7ECIJFJIf0mTg+rkccjPDoLI893wY0PhMnI3iOoQf+cHhpPJEii5ufK0PxIREHEkEA59
         u7Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=t8ULZgdn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q42-v6si10695746qvh.26.2018.05.31.07.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 07:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=t8ULZgdn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOOou-00006a-Rw
	for alex.bennee@linaro.org; Thu, 31 May 2018 10:44:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1fOOgb-00028H-PZ
	for qemu-devel@nongnu.org; Thu, 31 May 2018 10:36:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1fOOga-0006gC-JX
	for qemu-devel@nongnu.org; Thu, 31 May 2018 10:36:17 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:37680)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1fOOgU-0006ae-D1; Thu, 31 May 2018 10:36:10 -0400
Received: by mail-lf0-x244.google.com with SMTP id r2-v6so10091769lff.4;
	Thu, 31 May 2018 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YCzl1cWYi6wMmtNwq6b1indlTO9Enqdr3gFRbTqQWko=;
	b=t8ULZgdnP+ZUIHSXEV0JoR1N2pQUK8D7yE/ipztdnsBqayu7TASZ3p7MwNSSxqyiql
	7pRNnQr06ELaBJ9nCu1u1JS0ybCGvpoL3yb1oxEs7YnIV37KLt1TbLzi+Tce7E3RXlZL
	cNufvilZHsQNBioqR0y6IJuAFEJuOzzuOsC2VBvPs7edBsG+mKum4G8qhxr6M0P6lr+2
	ZCBJQXU0L4S+GSYSla+G4t423RtpqIrvxR1C8pRnK7s1YIrC4LE0Ut2kWsBmAchYjfmw
	fZ6d61kwM2bTawpojtm847urwe5xmom4z9wW1guueDQzANt6sYFuD/7HkNeLzHxDdEac
	XhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YCzl1cWYi6wMmtNwq6b1indlTO9Enqdr3gFRbTqQWko=;
	b=CdJzHWJDcmkYYr1Gx/COfabFStjjc75aslORXWcKZruqBdEM44mtfeM6O8/H8Xddye
	rC8SfOUGlRd4GkB2zjUndnEG0qmwNDoUxLVhgHJDs1B6qZmJH01cE+2W2Jo/DmHS081X
	GjugribaobwD28h/BRpiK4+TQ8jS5q0EaOgf0+j6IRedyTAZpxZ2EMAgNTvKpEMsb1DU
	H0M/a2/VmBme1n8oM1XUyAHgVq4lzd5a/mQ6i+LhQAuvQ7uD4WwUwjln15izUwx+Y4IL
	mjkRNyzRgvDKYO7H3QCaXIoYZ68gDkSTWt0PU84I031DIAPek4rua/+yuOsf4EU5Y6vT
	/tDw==
X-Gm-Message-State: ALKqPwcF/qkblLdM5ik927MNDkns09fQzFhkxj6TuCrQKpuFueOzk26n
	fKr1hYaD3pez3E1I/mzBnTEwCkMmmjH1j9GjN5Q=
X-Received: by 2002:a19:7515:: with SMTP id
	y21-v6mr4308309lfe.107.1527777368590; 
	Thu, 31 May 2018 07:36:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:9308:0:0:0:0:0 with HTTP; Thu, 31 May 2018 07:36:08
	-0700 (PDT)
In-Reply-To: <CAFEAcA-qWkhueUUnZ1RmhRuhHLstGpwmameHgsOM7UautJVxpw@mail.gmail.com>
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
	<1527736557-11084-3-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA-qWkhueUUnZ1RmhRuhHLstGpwmameHgsOM7UautJVxpw@mail.gmail.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Date: Thu, 31 May 2018 22:36:08 +0800
Message-ID: <CAOMwq8-H+iZ1L996G4jdky__zstwFo6x0qTucqLRstuXhs1CEA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v5 2/2] arm_gicv3_kvm: kvm_dist_get/put:
 skip the registers banked by GICR
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-stable <qemu-stable@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HIdBcXjq7uc

2018-05-31 21:50 GMT+08:00 Peter Maydell <peter.maydell@linaro.org>:

> On 31 May 2018 at 04:15, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> > While we skip the GIC_INTERNAL irqs, we don't change the register offset
> > accordingly. This will overlap the GICR registers value and leave the
> > last GIC_INTERNAL irq's registers out of update.
> >
> > Fix this by skipping the registers banked by GICR.
> >
> > Also for migration compatibility if the migration source (old version
> > qemu) doesn't send gicd_no_migration_shift_bug = 1 to destination, then
> > we shift the data of PPI to get the right data for SPI.
> >
> > Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
>
> > +    /*
> > +     * While this new version QEMU doesn't have this kind of bug as we
> fix it,
> > +     * so it's need to set the flag to true to indicate that and it's
> neccessary
> > +     * for next migration to work from this new version QEMU.
> > +     */
> > +    cs->gicd_no_migration_shift_bug = true;
>
> Nice catch; I would have forgotten that we needed to do this...
>
>
> >
> > +    /* For the KVM GICv3, affinity routing is always enabled, and the
> > +     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
> > +     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
> > +     * functionality is replaced by the GICR registers. It doesn't need
> to sync
> > +     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
> > +     * This matches the for_each_dist_irq_reg() macro which also skips
> the
> > +     * first GIC_INTERNAL irqs.
> > +     */
> > +    offset += (GIC_INTERNAL * 1) / 8;
> > +    if (clroffset != 0) {
> > +        clroffset += (1 * sizeof(uint32_t));
> > +    }
> > +
>
> Shouldn't we be adding the same thing to clroffset that we add to offset ?
>
> Yeah, right. It should like this

  clroffset += (GIC_INTERNAL * 1) / 8;

I don't remember why I didn't write this way. Anyway, Could you please fix
this when you apply this patch or I send a new version?

Thanks,
--
Shannon
