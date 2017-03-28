Received: by 10.25.15.230 with SMTP id 99csp1572538lfp;
        Tue, 28 Mar 2017 04:30:02 -0700 (PDT)
X-Received: by 10.237.61.91 with SMTP id h27mr27409238qtf.116.1490700602368;
        Tue, 28 Mar 2017 04:30:02 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id b11si3209703qta.25.2017.03.28.04.30.02;
        Tue, 28 Mar 2017 04:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id B169840C28;
	Tue, 28 Mar 2017 07:28:02 -0400 (EDT)
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
	with ESMTP id DwWLZQNsyIs0; Tue, 28 Mar 2017 07:28:01 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D97DD40C2D;
	Tue, 28 Mar 2017 07:28:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id A4C8840C17
 for <kvmarm@lists.cs.columbia.edu>; Tue, 28 Mar 2017 07:28:00 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKGYRoj9Ibca for <kvmarm@lists.cs.columbia.edu>;
 Tue, 28 Mar 2017 07:27:59 -0400 (EDT)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 4E48040A95
 for <kvmarm@lists.cs.columbia.edu>; Tue, 28 Mar 2017 07:27:58 -0400 (EDT)
Received: by mail-wr0-f175.google.com with SMTP id w43so86137199wrb.0
 for <kvmarm@lists.cs.columbia.edu>; Tue, 28 Mar 2017 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AqODWuWFpnzs5UHhOWVZiULSAmyZzzYI60nUdsMwIZY=;
 b=MyKymhvDVkZBPMJ6g9QNA7Y1kQN96UtddYY8RaeDb9rhXeAFNY8z0rPGlt33ocTgp4
 6LBV77EkVwJbcs03qLCfpM19uQE2qQAXPl1Ei7Eme6zz5WhmS9UK6hqotjHY+7Ookml1
 48aF1cfaXLBNmKDMiBi9Bc5KjnCebpWDOtYrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AqODWuWFpnzs5UHhOWVZiULSAmyZzzYI60nUdsMwIZY=;
 b=gg3grnCE75N8c9DIOvy1WWULPc5k0w/PYIqricBiWBd3khY1AP/JOCSILCH9lOEVks
 UFekH5WgcaVRpfxgGk8d4BbMIbRMXemaPwSgwzn2M2CD1wH+xM0G5BbC+oxbAaGkcShV
 IeENbI6eHLKJQXLfMGsRYlPkCW6K1hSzuFJUoyr9qcJzuOUq1Q6onz6OCD+jcpxlMcdv
 xHrzCFIuN+HpZ/XJj6HK/hgwnKVfD57O9peH36IfRrkhyzZKR6Uamd+wt6PU5RKowmsQ
 K1VOgmfqaAZWguqDLxj8Q3QVQroVE+coTRhd/k+0u7AQaWgtkedKGFXuR1xtoVo4FAKu
 9F3Q==
X-Gm-Message-State: AFeK/H2DMftyTBOt4Rsb1cw4ABVtzjeYvuYywyzz3LC1kZ9ziNMuTGfvI/KOyZFVNgRLOvDtJKkuk9OxZuR0D8WL
X-Received: by 10.28.6.6 with SMTP id 6mr14096137wmg.111.1490700596008; Tue,
 28 Mar 2017 04:29:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Tue, 28 Mar 2017 04:29:35 -0700 (PDT)
In-Reply-To: <CACJhumejPG6s_dewyHH=e5=QLcOUCzvzhakA7oSqm2Ms5cQvRA@mail.gmail.com>
References: <CACJhumejPG6s_dewyHH=e5=QLcOUCzvzhakA7oSqm2Ms5cQvRA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2017 12:29:35 +0100
Message-ID: <CAFEAcA-kKvS_6OZE1mKbFYgCzm4wPK2XJi_A03nFxu+K3ZA4hQ@mail.gmail.com>
Subject: Re: Aarch64: Qemu master or 2.9.0-rc1 breaks compatibility with 4.10
 kernel.
To: Prakash B <bjsprakash.linux@gmail.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, bprakash@caviumnetworks.com,
 QEMU Developers <qemu-devel@nongnu.org>, "Kumar,
 Vijaya" <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
 sgoutham@cavium.com,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
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
X-TUID: Rg23PxworKpe

On 28 March 2017 at 12:22, Prakash B <bjsprakash.linux@gmail.com> wrote:
> Qemu master or v2.9.0-rc1 doesn't launch guest  when host kernel
> version 4.10 or  lower on Aarch64 (cavium ThunderX), its failing with
> abort  "qemu-system-aarch64: KVM_GET_DEVICE_ATTR failed: No such
> device or address"
>
> "GICv3 live migration support"  patch breaks the  compatibility b/w
> kernel and qemu.
>
> Is this expected behaviour,  can we provide a fix without  breaking
> compatibility b/w kernel and qemu .

This is indeed not supposed to happen. Eric, can you take a look?

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
