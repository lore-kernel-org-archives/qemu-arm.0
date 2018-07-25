Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp543708wru;
        Wed, 25 Jul 2018 03:41:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpexsHMiKTnWEBEMJL1OdasT678gfmC2UwYDPr7ISNu35C1dvM50+YkLGvqbu5J4Q8oU+Gb2
X-Received: by 2002:ac8:31d0:: with SMTP id i16-v6mr20480645qte.12.1532515262413;
        Wed, 25 Jul 2018 03:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532515262; cv=none;
        d=google.com; s=arc-20160816;
        b=Xuf8D6hQfBNCimUfSD0sOJKX0X42QIUwlFoQB1gwq7eu2AIDhwo3YEVzEEZjLptNhX
         ihHXqhoOX+fVWWeCzJPRjNrs1LHe7foE2doeYNtxDXcSPbKZ6xk526jzyP8pL53OBYkp
         u5BAUJ/sW3AcHFTwmZulJXY9icsSr2SjbKmzUbnWlcSdihq9jH2hI+LsjXmsHdUJTgBE
         bM5w/ipOjdoNvaJW0VdZrYKpaqpydkhaMUxyX2lV1ULxHosXtO0ObcWLVIi1DfAEfrnp
         G2ekUUJWlQLhpB2PP/d7j6wnvZTBZLacq4nLWWPGTuFpjcOuevw918mrabqP8SK3qKNo
         4Qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject
         :arc-authentication-results;
        bh=W0d9aD4YE1ma3W4s81OkZMjjOQPHgZLL+PRhB2x0MeU=;
        b=u+sF4Uw8sC4k3BbV9ObSjTXFjsvh22MtA6jb/tln5pERRRTGFsXMmTRwO0O8l4782i
         L8wbhekQI17BK03nMoWEAAhgIEdFg6HPqNLrj41lgViMYGa3eY5NohTwxB3E657xMn4P
         LnV36WqdDEdcMRCaLxfWO8ONJ5ZpsAjBBKbycwT2IXp5BmmVbICRwsNuDo6mvaYR2Myh
         yEtlMIOPzAchpHuo820KrANeUVaETyyCnLEan0N7tRJpAv6GyZe8uayFEiK/oMeIWNOQ
         /9n0N8GcVBR3Q9cDp0b8WT+kiCYSDAy7/uKboX65jao+bVLBn+PYOMhbBzt/LFBl5O06
         R0ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id t50-v6si623130qvj.124.2018.07.25.03.41.02;
        Wed, 25 Jul 2018 03:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 01E5E4A16B;
	Wed, 25 Jul 2018 06:41:02 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=ham
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hSLw1bWkeMB; Wed, 25 Jul 2018 06:41:00 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E184E4A0F7;
	Wed, 25 Jul 2018 06:41:00 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id DC4B140A6E
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 06:40:59 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLDfAF2eLItO for <kvmarm@lists.cs.columbia.edu>;
 Wed, 25 Jul 2018 06:40:58 -0400 (EDT)
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B8BE54045F
 for <kvmarm@lists.cs.columbia.edu>; Wed, 25 Jul 2018 06:40:58 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0867215A2;
 Wed, 25 Jul 2018 03:40:58 -0700 (PDT)
Received: from [10.4.13.119] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 071CC3F575; Wed, 25 Jul 2018 03:40:55 -0700 (PDT)
Subject: Re: VCPU hotplug on KVM/ARM
To: Maran Wilson <maran.wilson@oracle.com>, kvmarm@lists.cs.columbia.edu,
 bthakur@codeaurora.org
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
From: Marc Zyngier <marc.zyngier@arm.com>
Organization: ARM Ltd
Message-ID: <74427c65-b860-d576-04f9-766253285210@arm.com>
Date: Wed, 25 Jul 2018 11:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b589d714-4f12-e450-7ca5-e55fed4d1705@oracle.com>
Content-Language: en-GB
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
 Christoffer Dall <cdall@kernel.org>, david@redhat.com, qemu-devel@nongnu.org,
 Christoffer Dall <christofferdall@christofferdall.dk>, qemu-arm@nongnu.org,
 imammedo@redhat.com
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
X-TUID: qb/OGnBA9bgL

On 24/07/18 19:35, Maran Wilson wrote:
> It's been a few months since this email thread died off. Has anyone 
> started working on a potential solution that would allow VCPU hotplug on 
> KVM/ARM ? Or is this a project that is still waiting for an owner who 
> has the time and inclination to get started?

This is typically a project for someone who would have this particular
itch to scratch, and who has a demonstrable need for this functionality.

Work wise, it would have to include adding physical CPU hotplug support
to the arm64 kernel as a precondition, before worrying about doing it in
KVM.

For KVM itself, particular area of interests would be:
- Making GICv3 redistributors magically appear in the IPA space
- Live resizing of GICv3 structures
- Dynamic allocation of MPIDR, and mapping with vcpu_id

This should keep someone busy for a good couple of weeks (give or take a
few months).

That being said, I'd rather see support in QEMU first, creating all the
vcpu/redistributors upfront, and signalling the hotplug event via the
virtual firmware. And then post some numbers to show that creating all
the vcpus upfront is not acceptable.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
