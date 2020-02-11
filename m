Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5232430lfp;
        Tue, 11 Feb 2020 07:42:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVyxpGgJtZ0Q1mq6u89zDATq5y2ScuIvLijD1AW1RBa0+jofqDwK2dgUxjrQj98zO1zN4V
X-Received: by 2002:ae9:ee11:: with SMTP id i17mr3276040qkg.333.1581435773621;
        Tue, 11 Feb 2020 07:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581435773; cv=none;
        d=google.com; s=arc-20160816;
        b=WDkD5R4D7g03PJHDAKDJdnjJ3Odsk2Phg/A5aPPRHUxGm82qhI9xNtoCRTkgcNhXCs
         kIKBXN5VZcahfmy7wSJJgKGI8kVz3GfvwmnZEs8yiUs4hJGHO8oS3iu2Hz8vHEOsDyIq
         M1J/35nul7cezDho0fmBsF0CBGW3FkqTkK4niRrVDllJX209C99/SSpRs4EAXV0GfOks
         yupRTgnxFFnWoPTxfov2NhSV8+TARVlN4V7azLnlCXSXZfXGp8FSgEO2O2xvndigus8u
         g/wBJXzXi2HTXtLEs45ig9b9Rzzpa7UqtQFAV+3+Hi7byar1z7fDMNIEbvp8Qw9XoN1i
         mKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fP9A41oUyVlHckBCUpzZU3f04sLL0M3b5U6pokTZeD0=;
        b=SdDdr6gLFoBBIrOm3mp9l2u4L2XfbkoD2bPFUCSYYcX0zgedikmberPNuxAh4c7riA
         98tEXS2NRBQofvC9qlKgxOrx/xaHm7kh0Ab1yqWsnSnihoR41cV6Z/tN1toTyrtUa7vq
         PM7tMrYMBtlIYMFEEBlx3E1PSu41GxMUR/ANCPY9Wbkd2G9pfCmmr4Y2Q5CFToyqvnXe
         eZOVhMB9CgfhnCtxFI7aeKBykv654qhT96P4bUCbrAP/WRCwQYufU42dy24lruBR1Pjk
         HuyWPI33vTguuYVhc7myG0vq9AeAINx0OqgBwSh5JUCxlwxmXyAkq5u8Lsk6+M3RZ5t6
         9S/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=NgbxyWkY;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id o10si2011724qtj.260.2020.02.11.07.42.53;
        Tue, 11 Feb 2020 07:42:53 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=NgbxyWkY;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4AC244AEBB;
	Tue, 11 Feb 2020 10:42:53 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REAolZXtyWTw; Tue, 11 Feb 2020 10:42:52 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1FA024AEB3;
	Tue, 11 Feb 2020 10:42:52 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id DC4E64A578
 for <kvmarm@lists.cs.columbia.edu>; Tue, 11 Feb 2020 10:42:50 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTIjAHqLAeqr for <kvmarm@lists.cs.columbia.edu>;
 Tue, 11 Feb 2020 10:42:49 -0500 (EST)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id B64B44AEC2
 for <kvmarm@lists.cs.columbia.edu>; Tue, 11 Feb 2020 10:42:49 -0500 (EST)
Received: by mail-oi1-f193.google.com with SMTP id d62so13145624oia.11
 for <kvmarm@lists.cs.columbia.edu>; Tue, 11 Feb 2020 07:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pd5As4/L2oTjSBZjWpPOMKqBaFJ2ADt2yHhVgPMSRMg=;
 b=NgbxyWkY7QLXWCbElISLSiWcF/s7LTdVaFB+VXa8xsn1F/e7JfYIPCMIKBEQCXs5nW
 iXI+lGmftjS4OwXM1uikkl0qHoPcgl0A7DSAXpDV/lrluZA6CiSTEoUq92TyQaNVgo0s
 /OufFYqsDyXdkgxkQqXIZhR/gn2hKjRt+DQG8idlZbE7kgI2SFYEcROBNbcJLk6j3cEh
 /CqMY4GMl6dhkdmQzr7kTNo1+lrBjIxHTQtCRI7+McqZKg42LNfa1nLKL34X3jNcL9La
 xvhIiQEk9HnxRhb7Fy0CjnmAop0gorfnt2hoFTSxgquVxnuLd8s9nlZHgy7p6DjSKqr4
 E0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pd5As4/L2oTjSBZjWpPOMKqBaFJ2ADt2yHhVgPMSRMg=;
 b=BSjULjjyrF+DdR7wYe08fXZRndVD9jN0EFOppYWoVIOIRRsR+kXPYIvyskjYuLQFPT
 vHJZuOcHRiF3zymrz4FGKsyeuMbVOZC62Ox/vmdWyOtm1LQuBHv1zv09SQnbYesk+taV
 gkgoZAg37L4cvzHACewkh4X4rMtDsqT7np5vOJMFLStAPqpGsxcmhx6e5F3ixz4wVKzO
 ermgnKz0/S/vh4ywuwamSPhce326uw96iq4JAQGxaeAzh9maOUwZfo1yOcEEcHxYz45Y
 kJtr0e8LzM3anWmI3AmBbj0ptAvBVfbfzwpGUOgfzcTAt1w9MWCghNgjLMSumJmr41tG
 4LMQ==
X-Gm-Message-State: APjAAAUEwc5syTkmSEHjSpxHgKkzCdN23lhj2G2kCdqMj3mYVDx9kInh
 Bd63J9QUpHz+3OR+bF2trjYRnmO+YQUSWwYPd9HJCA==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr3174520oic.48.1581435769182; 
 Tue, 11 Feb 2020 07:42:49 -0800 (PST)
MIME-Version: 1.0
References: <20200130112510.15154-1-eric.auger@redhat.com>
In-Reply-To: <20200130112510.15154-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2020 15:42:38 +0000
Message-ID: <CAFEAcA8iBvM2xguW2_6OFWDjPPEzEorief4F2aoh0Vitp466rQ@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 0/9] KVM: arm64: PMUv3 Event Counter
 Tests
To: Eric Auger <eric.auger@redhat.com>
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
X-TUID: ghRAJ+Q+crWr

On Thu, 30 Jan 2020 at 11:25, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series implements tests exercising the PMUv3 event counters.
> It tests both the 32-bit and 64-bit versions. Overflow interrupts
> also are checked. Those tests only are written for arm64.
>
> It allowed to reveal some issues related to SW_INCR implementation
> (esp. related to 64-bit implementation), some problems related to
> 32-bit <-> 64-bit transitions and consistency of enabled states
> of odd and event counters (See [1]).
>
> Overflow interrupt testing relies of one patch from Andre
> ("arm: gic: Provide per-IRQ helper functions") to enable the
> PPI 23, coming from "arm: gic: Test SPIs and interrupt groups"
> (https://patchwork.kernel.org/cover/11234975/). Drew kindly
> provided "arm64: Provide read/write_sysreg_s".
>
> All PMU tests can be launched with:
> ./run_tests.sh -g pmu
> Tests also can be launched individually. For example:
> ./arm-run arm/pmu.flat -append 'chained-sw-incr'
>
> With KVM:
> - chain-promotion and chained-sw-incr are known to be failing.
>   [1] proposed a fix.
> - On TX2, I have some random failures due to MEM_ACCESS event
>   measured with a great disparity. This is not observed on
>   other machines I have access to.
> With TCG:
> - all new tests are skipped

I'm having a go at using this patchset to test the support
I'm adding for TCG for the v8.1 and v8.4 PMU extensions...

Q1: how can I get run_tests.sh to pass extra arguments to
QEMU ? The PMU events check will fail unless QEMU gets
the '-icount 8' to enable cycle-counting, but although
the underlying ./arm/run lets you add arbitrary extra
arguments to QEMU, run_tests.sh doesn't seem to. Trying to
pass them in via "QEMU=/path/to/qemu -icount 8" doesn't
work either.

Q2: do you know why arm/pmu.c:check_pmcr() insists that
PMCR.IMP is non-zero? The comment says "simple sanity check",
but architecturally a zero IMP field is permitted (meaning
"go look at MIDR_EL1 instead"). This causes TCG to fail this
test on '-cpu max', because in that case we set PMCR.IMP
to the same thing as MIDR_EL1.Implementer which is 0
("software use", since QEMU is software...)

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
