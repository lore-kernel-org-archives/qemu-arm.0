Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5100134lfk;
        Tue, 14 Dec 2021 02:34:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAfBHT9ar35P9pIRySl4dXe86JW6UoZNwukpm3aOd/oFUVVI0QiXyYT0/6waMt+wCj9u+V
X-Received: by 2002:a37:a956:: with SMTP id s83mr3224554qke.500.1639478042526;
        Tue, 14 Dec 2021 02:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639478042; cv=none;
        d=google.com; s=arc-20160816;
        b=t0reAZIKHtHjlgHDswAPvLizPiLBFdgoLP+BkAuUyBRwyuBQ30YoJJGyKdeD9OWrry
         2s1R2fcNG7WoeryVEguYPisVQz0YGtWthVgc5YlupkBNloPnwUgz+mRuehtCgPTv68Ck
         K4tOMAV3rbBzursoEYDKwsgs36tJug07lY4YMO3W1lBrQwG5IkfBkDOdo3equG8rJ7mg
         JvErtKa9yp5v+BmnAJdiKuPL/JszuUgyUr/gmkFSafHgwYKj4AP7ckfg4ArHibl7j08n
         nH36+O8D0HU1JKY/MaKJSDv1OIfSRbjac8mKUEuGcbiwfWzD0PLeSuXCfTeSHw7HHKx3
         G8Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:user-agent:references:in-reply-to:subject:to:from
         :message-id:date:dkim-signature;
        bh=NPBp+B+lGJexTVPInlTAjauRlJiY+8F7UNa4nCv+oMc=;
        b=FIU/Vhc/TDvLJ1AR/NFOHGsjDJtHQCOPCs7gJd39uLk/6ibun4ByllK5zBEvwJlVZB
         9f57USJ+AoCB7t7JpcED5uER03RGkQeknK+gXKczdsNqlKHDV5fSifkdddfFpv00y8kI
         Vkeu/mPn3wxFlO1fLz7at77rqpQK31sL8T1mT5YobPRSF1szk05wx1t+02iKmQmHnhvL
         7yEG7lzE3TlhXDkM3+KNaHXpQru5JbKU0yZwf+oPAAXNjI2mrrzMyD8SdloAGtLcqYoP
         tKPB0CU1ZiA3SU+T966h4C7RAQz1ERUJ7ytjOvcA50w7H8JDjDqdDezwomRpRZUD2Nm2
         UyRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@kernel.org header.s=k20201202 header.b=Cg5zBOBc;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id jo12si17068609qvb.365.2021.12.14.02.34.02;
        Tue, 14 Dec 2021 02:34:02 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@kernel.org header.s=k20201202 header.b=Cg5zBOBc;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2D5454B1AB;
	Tue, 14 Dec 2021 05:34:02 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699, T_DKIM_INVALID=0.01]
	autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@kernel.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMAE0sgR8S4i; Tue, 14 Dec 2021 05:34:01 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2EA054B18F;
	Tue, 14 Dec 2021 05:34:01 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 82FAB4B18F
 for <kvmarm@lists.cs.columbia.edu>; Tue, 14 Dec 2021 05:33:59 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7h6yKqnDY-lK for <kvmarm@lists.cs.columbia.edu>;
 Tue, 14 Dec 2021 05:33:58 -0500 (EST)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 38D2F4B15B
 for <kvmarm@lists.cs.columbia.edu>; Tue, 14 Dec 2021 05:33:58 -0500 (EST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3D8261343;
 Tue, 14 Dec 2021 10:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5969CC34600;
 Tue, 14 Dec 2021 10:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639478036;
 bh=3ia3rGv+6KKb/qFcaFJr2fBE/lbWtHfOzjwbdJoPYUc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cg5zBOBc7TeFArMWkx5K7JGIZVvvmPlbwf0kBQI6/2GwMZVhfmaMQomALfKUBuKnT
 w3KA9Gn9hdS/iB6EvVuW22BXOTOUDftFBiPRQ8kodY8SbZwL5Ne7Ud25SGr6ixtj63
 KxJIFg3VjlJeGQ4tq5VHCgPppLx0g86LCLARxfSj7r2NWfKQpbdmA941f9trF8iORS
 fGubwiJfS9+JGhtVIkpkT6pZeQCy3auzCZs8ibH7PTAadCO71mjDXwWC06ky3dpCZ9
 X9FQ61cEalXhPFz/bliKt4ntIWogFLj7XmVWSBsE+97X3MV0EuU5/yNd8e8SYrlOKn
 ciXc3OD0g80Nw==
Received: from cfbb000407.r.cam.camfibre.uk ([185.219.108.64]
 helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mx586-00C1KI-Fz; Tue, 14 Dec 2021 10:33:54 +0000
Date: Tue, 14 Dec 2021 10:33:53 +0000
Message-ID: <87bl1jjx0u.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Libvirt on little.BIG ARM systems unable to start guest if no
 cpuset is provided
In-Reply-To: <CAFEAcA-vpj3P5-D4U+mfEEgTXC=-1SeXqs4aRbSDX6Enj+abQA@mail.gmail.com>
References: <70a2f7d6-5ac1-72df-4a88-b1a662d07070@gmx.com>
 <32bb61a9-0938-d254-0453-18a108bc4b63@redhat.com>
 <1dc0403b-c61b-b04b-e7fd-f2d66276ba7b@gmx.com>
 <CAFEAcA-URrpy3w3AtDb8zVfq8fWxvQ8_jtSqEkaeb=3KE99oAQ@mail.gmail.com>
 <87lf0ojvq2.wl-maz@kernel.org>
 <aa407ba2-e9c4-882e-a085-91e7dd724f78@gmx.com>
 <29409a18-5156-6b3a-6a44-eecd83a20a78@redhat.com>
 <2281a255-fef3-c872-963e-2c5274d0d815@gmx.com>
 <87ee6fjyyh.wl-maz@kernel.org>
 <CAFEAcA-vpj3P5-D4U+mfEEgTXC=-1SeXqs4aRbSDX6Enj+abQA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: peter.maydell@linaro.org, quwenruo.btrfs@gmx.com,
 mprivozn@redhat.com, libvirt-users@redhat.com, qemu-arm@nongnu.org,
 kvmarm@lists.cs.columbia.edu, qemu-discuss@nongnu.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Michal =?UTF-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 Qu Wenruo <quwenruo.btrfs@gmx.com>, qemu-discuss@nongnu.org,
 libvirt-users@redhat.com, qemu-arm@nongnu.org,
 kvmarm <kvmarm@lists.cs.columbia.edu>
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
X-TUID: 6Dt5mNeLE7sT

On Tue, 14 Dec 2021 10:08:29 +0000,
Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> On Tue, 14 Dec 2021 at 09:52, Marc Zyngier <maz@kernel.org> wrote:
> > The best workaround is to taskset the QEMU process (and I really mean
> > the process, not individual threads) to an homogeneous set of CPUs and
> > be done with it.
> 
> Agreed. I suspect that often the 'little' CPUs are sufficiently
> low-power to probably not be worth giving to the VM anyway.

They are actually pretty beefy, in most cases. If you are I/O bound,
the small cores are the right target. This email is brought to you via
a couple of A55 CPUs running a VM and acting as my home gateway. If
'the internet' was getting slow, I'd have heard about it! ;-)

> Side note: if you *do* give a guest both big and little CPUs
> using kvmtool or something similar, does the guest kernel get
> enough information to schedule tasks properly to both kinds of
> CPU, or does it just assume they're all the same and happily
> put performance-requiring tasks on the little CPUs ?

Upstream kvmtool doesn't make any effort to do this, but I had a
series to perform such placement in the past. Once you know which
physical CPUs you are placing the vcpus on, you can extract the
individual CPU capacity[1] and expose it in the guest's DT as a
cpu-specific 'capacity-dmips-mhz' property. A Linux guest will take
the hint and do the right thing.

	M.

[1] /sys/devices/system/cpu/cpu*/cpu_capacity

-- 
Without deviation from the norm, progress is not possible.
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
